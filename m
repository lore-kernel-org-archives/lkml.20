Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDFC3C345D;
	Thu, 15 Oct 2026 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100900; cv=none; b=iOtcYOxLWTnSeogFPJ4STFMGKRIAnvIdMk2hkgdFk7WeH5gbiF0H+biUoW8lIenJPS7AqJpukj/9EKAAVLqLRI8kwcUELhSh0NKdVE/g3zvnOa5mf011iRTThlbMKsGneQjJojYjb4FpXMVM1xANweqn+QppCWMKp0RXgGDRFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100900; c=relaxed/simple;
	bh=isc08oo5BJNK/t6lxx5OeyuoPKO6tU8zzXxw244V/KM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uREF6fQ2QYXnnHbhY8RvBzIUNqqg7NK1WPC1G3/mg+6rkarPaHi2+XbBcv4QKGiDZmp6+e+jyQ2bI4vmBBya+ItneJsF+jA5BbfjB9pjSFNm5etUvWpAo/Blo6IQMPQlcnWOxSodrYLvPhE++23dCDEq84zlZ7eJ0ocY6wo1yHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlMEi9xz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlMEi9xz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86E99C2BCC7;
	Thu, 15 Oct 2026 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792100899;
	bh=isc08oo5BJNK/t6lxx5OeyuoPKO6tU8zzXxw244V/KM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UlMEi9xztoQP8Dzp8kz+loWx/K/OzOuvL33FI8zLBQxNXNtAYw9kpwEx1wFD9Qbgl
	 aEY4kOH+49Up/YelPh27e3eqinnGjmbfK9guC8ZHCEmsiJgZRxPjihIrURiQrhZvn5
	 3fJXSxUnBpGjcF+DkuHD0OhjFN8hpxbm96vxIxmAIswe3Cvj68GXQE3AUpmGQDKBIT
	 jnvAa4jzedbJvEXPXov3yFxWVTonc+1XqTxxwp+NmC01MvF0y7cDkr5CKZAgpL9NcH
	 g1ZHUKfghWQA2pSRZXlkuT0qPWEarnIOvxYsiLgCPwzhqEYdz/ejRO81jNnVTD4W1+
	 XOHMyxjq4sGCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705DECC6B38;
	Thu, 15 Oct 2026 21:48:19 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Subject: [PATCH 0/2] media: ov13858: device tree support for the Surface
 Pro 11 (Snapdragon)
Date: Thu, 15 Oct 2026 22:48:18 +0100
Message-Id: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMcyxi6SrSoHGs2FQoiiHdPW
 r7F/wUiB+EIc1cgcJIoz92AfQfHtd0nK3HNYLSZUKNVT8KBLKmMrIj87nai0ZOBVryBveT/tqy
 1fnmlNJFdAAAA
X-Change-ID: 20261015-ov13858-x1e-88fbdb884f82
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>, 
 German Pablo Lindo <germanpapulindez@gmail.com>, 
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792100898; l=1975;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=isc08oo5BJNK/t6lxx5OeyuoPKO6tU8zzXxw244V/KM=;
 b=GszMqCIhbFuRrL9l5FrRKO/5JBwQNCV8NmDmFtEOPmlwzM5GMaiyYRZHCb21ALesOCU0t/cOy
 Y2YFvNBGYipBLLxlWRSGZEwuWKFya4rHOQN+p0seLzpVgfaJPzTceE9
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

Hi Sakari,

The Surface Pro 11 with a Snapdragon X Elite (X1E80100) has the same
OV13858 as its rear camera as the Intel model does. There it is wired to
the Qualcomm CAMSS over four D-PHY lanes and described in the device tree.
These two patches add the binding and the OF match the driver needs for
that, and the endpoint checks that come with a DT user.

They apply on top of Sergey's "media: i2c: ov13858: add regulator, clock
and reset GPIO handling" v3. The Snapdragon machine needs it too: nothing
there powers the sensor for the driver either.
https://lore.kernel.org/all/20260831130312.26296-1-lsa.uz@pm.me/

Tested on the Surface Pro 11 (X1E80100) with mainline ov13858.c, Sergey's
v3 and these two, through an out-of-tree CAMSS capturing raw frames over
CSIPHY1, CSID0 and an RDI interface. The in-tree register lists work
unchanged at 540 MHz:
- 4224x3136 at 29.95 fps;
- the colour-bar test pattern arrives intact;
- a scene captures;
- the binding validates with dt-doc-validate, and dt-validate accepts
  the example and rejects a two-lane endpoint.

Sergey, German: on the Intel machine the IPU bridge entry for OVTID858
already lists both link frequencies, so the new endpoint check should
pass there. A quick v4l2-compliance run would confirm it.

The device tree for the Surface Pro 11 cameras will follow once Bryan's
x1e80100 camera DT series has settled.

Thanks,
George

---
George Neacsu (2):
      dt-bindings: media: i2c: Add OmniVision OV13858
      media: i2c: ov13858: Add device tree support

 .../bindings/media/i2c/ovti,ov13858.yaml           | 113 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov13858.c                        |  62 +++++++++++
 3 files changed, 176 insertions(+)
---
base-commit: ef7407f04f644833b0d1200a2e261c1879597b94
change-id: 20261015-ov13858-x1e-88fbdb884f82

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


