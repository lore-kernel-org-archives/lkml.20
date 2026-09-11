Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B05443E2A;
	Fri, 11 Sep 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114682; cv=none; b=V1zMyHvLpYg+qiwSM9bteiffz4PNOHciivSER5a0XKYPlQZGLE7mFvlANlvBPfW0wc8Xg9UjNxp8j3CCA4iGkqK8uDiKpqbvSpKGtE13CV/E6kkQ8Dzyu6gP2l5aGb2Rge761cH+eR/Gs30CVQCYsL/aFVNgWsKxxo3uZzboens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114682; c=relaxed/simple;
	bh=7SKlhYQUtAk44AF95tdblp9AvYvxHywIcDAaDjm68us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nQe9fDAtErgTyXfwbeRzWicoAwlcDOsgcg1bNoVyDJiP6WUpXji5YvWYjtAuejHmRQhQ9X43NhZHF9cTQlzEv07rbjy4CC1uVankvvz2g+nT5y8DmX5PlMsAQwpXi6PoHXO2gy8DlKNxF12y7jjw5KHGYOtAGObJmaiiI5Mmmx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DykURsoz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DykURsoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4031F000FF;
	Fri, 11 Sep 2026 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789114681;
	bh=s6gIUIaLWMYNtAwFOnu/eWnCMj2AmcIfPXXJ9vtdhRo=;
	h=Date:From:To:Cc:Subject;
	b=DykURsoz5lPK80iX94YsVCsbYg7q27qQoRgJkZK0yy6FiqtxZC1rxeukUjX8OxFT2
	 QS2J7OmFPUBAQEVvzG0cgxDoxBQGPRsZ6XAxeRxTsmg/eYNCQ07gkz3EcjisBjvN7V
	 yhST/sHE4HbKk6ZPbGi9GM/JRe99O39mtvPWyHPXLb0otF6Yl3Tm3sNUT6PfY5ASDD
	 SOkggYtu992GYJLQG6bUBSUxv4tz2Ux2SSd4EqkLH4uk5GGaIi+Kgu+Bf7+klZfi/y
	 ZcW1dLwU2X0AaMhm13PSNVjgkBG9HpZeeSmfd8fH+gX61R1C3nLShVeSryVaUhxxiR
	 dlkPh9hq+2CnQ==
Date: Fri, 11 Sep 2026 10:17:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.3-rc3] media fixes
Message-ID: <20260911101757.286dbea9@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-2

For:
- v4l2-core: add bounded tile-count helpers for HEVC stateless decoders
- v4l2-core: validate AV1 tile counts fits in array size
- v4l2-core: validate HEVC tile counts fits in array size
- v4l2-core: fix memcmp() size in B1 reference list comparison
- mediatek: bound AV1 tile-start copy to fit in array size
- rockchip: reject AV1 frames exceeding the tile size
- rockchip: guard VPU981 AV1 divisor and tile buffer
- hantro: bound G2 HEVC tile loop to the buffer size
- rkvdec: bound HEVC tile loops and PPS id to fit the array size
- rppx1: read the raw pattern from the PRE2 acquisition module
- rppx1: describe the MAIN_POST white balance gains block

Regards,
Mauro

---

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.3-2

for you to fetch changes up to 37bef2170d4c88fc3d708eecf3ef0f4032bc1372:

  media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity (2026-09-07 09:01:05 +0200)

----------------------------------------------------------------
[GIT PULL for v7.3-rc3] media fixes

----------------------------------------------------------------
Haotian Zhang (1):
      media: v4l2-h264: Fix memcmp() size in B1 reference list comparison

Linmao Li (2):
      media: rppx1: describe the MAIN_POST white balance gains block
      media: rppx1: bls: read the raw pattern from the PRE2 acquisition module

Michael Bommarito (8):
      media: v4l2-ctrls: validate HEVC tile counts
      media: v4l2-ctrls: validate AV1 tile counts
      media: hevc: add bounded tile-count helpers
      media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
      media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
      media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
      media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity
      media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity

 .../media/platform/dreamchip/rppx1/rpp_params.c    |  1 +
 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c |  2 +-
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  5 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  | 14 ++++--
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  7 ++-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |  6 ++-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 57 ++++++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 32 ++++++++++++
 drivers/media/v4l2-core/v4l2-h264.c                |  3 +-
 include/media/v4l2-hevc.h                          | 41 ++++++++++++++++
 11 files changed, 149 insertions(+), 21 deletions(-)
 create mode 100644 include/media/v4l2-hevc.h
