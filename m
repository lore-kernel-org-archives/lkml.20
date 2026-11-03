Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702734;
	b=DCbgQ1ZncGLYB9ykZJqjlSq+NlybMO7DXzTDGWp5mrxEqXRE6TGJc7DLnkQzZRfFRvzB
	 DFUIfYR7Pf01Qq3dPqhWu4I2XPhVG2WurXOfzlBwzy5RrTz++VBgKD52hdZfoCw0/+f89
	 jgHU2uzdO2LsWzwpUgosl1ZsyT3iwIBgHdnzlGFK/ABSgPjeBuNlI1vEvus7CGBgilGWA
	 dAnn2HUtHzr+iCVk0MCiNXGebOQmBqr+faNyXuy1AxYNG268FhOCySDACUaKlCeZf4Zxf
	 UAPVRKcQrLZxrExDEowlZS6gZrUF8GPHDGLZHtSBNtJzaBYeFJj72tPSFnzqHxaiRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702734;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=Su5YfHlkFKwF5IMTLoK4Wp+REOU33DRF84x4yOhnrOs=;
	b=BLpuE15SifqkDNeyyqHt5U3m/RC7JBT/QBfNiERJC48kWNTuqep0h9GQyYb0uDMJxjYo
	 uNysS1nq9XO7UvdHiWpNkMUxewXWQCcZgSWauerdsRvnysId1bPTFeOlgAv0GUZbPiv6X
	 ecl+qpBlHWzhMDzwz2djM6Jmr1JJJ7mChE7tdpjtaHADZv2rc0pdE01keNobpgcCx9vXA
	 5sel1waZrxn67SaV/yFoh/2CY0yjeBx/syAAOcV6J1qx4KtCn6J3+XH62wmlqNKN+OAm3
	 qCzSxaWsaoZGqbuM+A2AhIDwe1aa1+fJqWJ+fJCWLXGAyvVbCPMlwOJh1JfiE28K2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09018606C5A4;
	Tue,  3 Nov 2026 10:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09018606C5A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC11-0000000031e-18mG;
	Tue, 03 Nov 2026 10:45:19 +0000
Date: Tue, 3 Nov 2026 10:45:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] media: rockchip: rkcif: recover from a lost MIPI line
Message-ID: <cover.1793702189.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The VICAP MIPI DMA ends a frame after the configured number of lines
and the sensor frame start does not reset that count. A line dropped on
the CSI-2 link therefore leaves every later buffer composed of the tail
of one frame and the head of the next, with the Bayer phase flipped
when the offset is odd, until the capture is restarted. This was seen
on an RV1126 (same VICAP MIPI block as the RK3568) with an IMX415 after
a night of streaming, and it can be provoked at will by shortening the
D-PHY settle time for a second.

The series makes the capture notice the slip and recover, and makes
the two blocks involved report what they see:

- patch 1 masks the MIPI interrupt sources that come out of reset
  enabled, which otherwise keep the line asserted until the kernel
  disables the interrupt;
- patch 2 replaces the subdev state mutex taken on the stop path, which
  the interrupt handler calls, with a spinlock around the shared
  interrupt registers;
- patch 3 enables and counts the VICAP error interrupts in debugfs;
- patch 4 reads the line counter at every frame start and restarts the
  stream through the existing stop and start paths once two frames in
  a row show an offset, as the runtime suspend in between is what
  resets the counter;
- patch 5 programs the DMA write priority the vendor driver uses;
- patch 6 lets the Synopsys CSI-2 receiver request its err1 and err2
  interrupts and count the error classes in debugfs.

Tested on an RV1126 board (vendor DT, rkcif and dw-mipi-csi2rx with
local RV1126 compatibles) with the fault injection described in patch
4; the RK3568 and RK3588 register layouts for the error bits and the
line counter come from the vendor kernel and are untested here.

Daniel Golle (6):
  media: rockchip: rkcif: mask MIPI interrupts when powered
  media: rockchip: rkcif: fix the MIPI stop path locking
  media: rockchip: rkcif: count the MIPI capture errors
  media: rockchip: rkcif: restart the MIPI DMA when it slips
  media: rockchip: rkcif: raise the MIPI DMA write priority
  media: synopsys: csi2rx: handle the error interrupts

 .../rockchip/rkcif/rkcif-capture-mipi.c       | 210 ++++++++++++++++--
 .../rockchip/rkcif/rkcif-capture-mipi.h       |   2 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  23 ++
 .../media/platform/rockchip/rkcif/rkcif-dev.c |   8 +
 .../platform/rockchip/rkcif/rkcif-regs.h      |   2 +
 .../platform/rockchip/rkcif/rkcif-stream.c    |  64 ++++++
 .../platform/rockchip/rkcif/rkcif-stream.h    |   2 +
 .../media/platform/synopsys/dw-mipi-csi2rx.c  | 125 ++++++++++-
 8 files changed, 409 insertions(+), 27 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0
