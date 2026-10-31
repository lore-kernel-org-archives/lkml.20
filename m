Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458991;
	b=FqGrswWgnNjgrFoMuSbEtaVxl/fJvNyBwSKewSq3Qu5iQZEWGzdcU6vJewC1se/WlazV
	 IzVwmEicXAapJAyWgkXYrYS4QB31bfyULTELZ3YnokID3PtnMBG65t6xbPwF7ioRyxGNF
	 MP1Bjf7cQlxsnasoAUv2X89g7FTi8mLM8H73g484tSUDzqxgZTki8u6BLWyZY2pPNdbLH
	 oABLpozL5oFBaDMfeXzlaB02IjX7qq1g+OuxiFedVY6cOFTecgAxzujws35kbK5Nx3k8Y
	 5tJYtR8s5WsPwhy7HD72qH26Mqs3roGVABeUmHCaC/+rHn2fVLMd6wpKPJbQnG1MvAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458991;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=xtk4qTA/0uP1HBekk3xDW0/eim2XXInXB0GWxjhDv14=;
	b=OYm1e5zOCc4h9SiHYSwSXdT7SB+37rhSb1Pt8gjx3rVP/RkshP14UxVOSxczDoMF0zfV
	 5TtbI0ZTl2nU/4JJ7cF0ZUIxbQ6qgCv6H3XYjzzkY8zKbV6fcMa6m+qEt1R+IFvKr96fb
	 Ki5xQcmLGL3yWakWVphvBWUQWQ1nhUvtasHZY9x2mmOc1JzGvR1a6sTQVT1RiJPRjy/rn
	 3EIaKIEbxNcp5pTg6um7pn1HOTz0jiWPQY8ea5fWu3PFysFTI2jLXyFc+aohqaQR50nVT
	 xAZRMCfBlqqqP8NCJyNyVSxVXflcBK7eTE0+NkvWjNbxpFUR5DCPvbeW8wGIBtkjv4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fTvB7DxF;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D237606A31D;
	Sat, 31 Oct 2026 15:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D237606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=fTvB7DxF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=xtk4qTA/0u
	P1HBekk3xDW0/eim2XXInXB0GWxjhDv14=; b=fTvB7DxFFaGbK0p8P9S6T/3fuS
	uAkKVUnLBdc/GkjxC1XcSKmeWFFdhEIqLLhFCzyn8mlnsNFeyxV4iEwtCmityO5L
	iEwxEk6PVPL1cUdTozB0JRv+Au7eYJtmZWp8R7sDJoAlhQpqop17xp5bJhe+zz1g
	FtgRC6A6QR8HnSElo=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHS0ApA+ZqqSNvAA--.5005S2;
	Sat, 31 Oct 2026 23:03:06 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/msm/dsi: collect bonded command-path data into per-SoC config
Date: Sat, 31 Oct 2026 23:03:00 +0800
Message-ID: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgDHS0ApA+ZqqSNvAA--.5005S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr13Zry8CF47ZF47ZFyDtrb_yoW5Jr1UpF
	W3G3yYyr1kAF43twnxAw18u3s5AFn3JayxGF1aq348Z3ZxCr18Zr92van5Kry5XFyfJr15
	Xa1vvryUWF1fAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjxUkFfODUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARERB2rk8FY0gwAFsc

*** AI-assistance disclosure ***: this series was drafted by a coding
agent (Pi) working from the author's design and measurements; the author
reviewed, tested and approved the final text. The design, measurements
and decisions are the author's own.

The sm8750 (Lenovo Y700 4th gen, TB322FC) uses bonded DSI: two DSI hosts
share one bonded link, and the master is decided by the SoC generation.
This series is preparatory refactoring of that bonded command path,
carried over from the vendor tree:

  - 0001/0003 move the bonded command failure flag into the DSI manager
    state and route the command path through host ops, so no mutable
    bonded state stays file-scoped;
  - 0002 collects the per-SoC bonded command-path data (FIFO error mask,
    CMD_DMA_CTRL bits, peer poll budget) into a new struct
    msm_dsi_bonded_cfg hung off the existing per-SoC table;
  - 0004 takes the bonded master link id from that per-SoC config
    instead of deriving it from probe order;
  - 0005 names the FIFO error bits instead of using raw magic numbers.

*** NOTE ***: this series contains NO functional fix for the Q28 panel
issue. It only re-homes data and names constants; behaviour is unchanged
(patch 5 is explicitly "No functional change").

The bonded command path that this series re-homes is the one the vendor
firmware lineage on this device (SM8750) drives; the series introduces no
new runtime behaviour (patch 5 is explicitly "No functional change").
Gates re-run on the final series:
  - checkpatch --strict: 5/5 patches clean;
  - make -j26 W=1 drivers/gpu/drm/msm/: 0 errors, 0 warnings;
  - the series replays cleanly, in order, on top of 0f1fb1c9c1.

Qianhui Xu (5):
  drm/msm/dsi: move bonded command failure flag into dsi manager state
  drm/msm/dsi: add per-SoC bonded command-path config
  drm/msm/dsi: route the bonded command path through host ops
  drm/msm/dsi: take bonded DSI master cfg from per-SoC config
  drm/msm/dsi: name the FIFO error bits of the bonded command path

 drivers/gpu/drm/msm/dsi/dsi.h         |  21 ++---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c     |  51 +++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h     |  30 +++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 123 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 123 ++++++++++++--------------
 5 files changed, 249 insertions(+), 99 deletions(-)


base-commit: 0f1fb1c9c1c8f09c711e8e9a82acbde2baeed691
-- 
2.53.0

