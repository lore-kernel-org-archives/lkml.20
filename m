Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF69423E9E;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162572; cv=none; b=eQmKyyzP7imjpMbDgdMVUxan7/akDDBoSnF09tgcxXoVNNgPNAMXFD7oCa0rsJX4E659yYwYnrS+z34xSLTrQTYDmzwhz9fAOIHDTrji1bKZLUt+oEyocG1HlxzxUIbkSuH46USZ4SAdXjS09Ysg/rTV+txjsa45P0BjxXFW4L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162572; c=relaxed/simple;
	bh=8lA3HsNRuOnlxrVsmZO40BONawW+tjdMtTTEtweogBc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JWI+D4zWNVkecE4wBuHoi79r3cI4rjpRyWxEzFddsSxUXgi83VaV5EO7S7wpjgSxwA+2KWkSJHuFLvBHtWgR9MsFNoof6X3eWh1qoNWfx7cj4SsBbP4oZa9h/mFMq9bEURgpePjU2W5XE+G9TDk0lOfGI4jefql3usBbSjK9nRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aakyiWVf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aakyiWVf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36478C2BCFB;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792162572;
	bh=8lA3HsNRuOnlxrVsmZO40BONawW+tjdMtTTEtweogBc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aakyiWVfqmj3XOiwtCd60MwsZd/Le4LWAFXNHk/IqpK1A0h2N1swmbF3w1uy1G8wn
	 VOVOj+3IBONeu0bseDjzfQPJ8wb58QoAU2nrCHK+MtJ5nPdSBxExLuL7Lm3YMeSk4A
	 QUQtlO+cahbwXtfMkZNTJPNbobhQA430j4TgE84GJr1gvR1DDfUkt3FSojoTdDL9XP
	 U35jJDYBB1GenxERy0lfo5+m4GkcRJwZNpVJtAB+nTxFCdGw1NQZbuTiSDKOvtuMjV
	 PJV27WTHgHV2CzSD1nxUng08d9Q4OlzhbLGVD8QXKUmj+0NBqhaaFSggR8saXQrA+a
	 hPK+/Q9YABrhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C432CCA46C;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Subject: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Fri, 16 Oct 2026 15:56:10 +0100
Message-Id: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSwqDMBSF4a1Ixr3l3kSj6aj7KB2ENNFAfZCUo
 Ih7b3QkhQ7Pge9fWbTB28huxcqCTT76cchDXApmOj20Fvwrb8aRS0KqYCYLZuoWCM4AR2okmgZ
 V7VgmU7DOz0fu8cy78/EzhuWoJ9rfP6FEgEBOOK20UyXqe9tr/76asWd7KPEzlj+YZyzqWlYlr
 wQpccbbtn0B4RtFt+UAAAA=
X-Change-ID: 20261015-x1e-cphy-rfc-201860c8097f
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792162570; l=5109;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=8lA3HsNRuOnlxrVsmZO40BONawW+tjdMtTTEtweogBc=;
 b=JTjancBLJyXu+BJLpy4seLLTjj2IZ0gvDhFqhi+x7z6Ki7QFe+gWoMjC79u+TcMGss3BnP6BF
 CHHZLH3o4CPBWAQRMYhRZv2LKfaFwpeUm7Z20+nID02Yr6qdirNVe6k
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

Hi Bryan, Vinod, David,

The Snapdragon Surface Pro 11's front camera, an IMX681, is on CSIPHY2
over one MIPI C-PHY trio. linux-next has the CSI2 PHY driver and the CAMSS
PHY API path, and C-PHY is the piece still missing for this camera. This
series adds the PHY side:

1. PHY_MODE_MIPI_CPHY and C-PHY configuration options in the generic PHY
   framework, because CAMSS had no way to ask the PHY for C-PHY;
2. C-PHY configuration helpers, the analogue of
   phy_mipi_dphy_get_default_config_for_hsclk();
3. a rename of the D-PHY init sequence in qcom-mipi-csi2;
4. lane mask and lane polarity helpers in qcom-mipi-csi2, with no
   functional change;
5. fsleep() for the init sequence delays, the same udelay() for the
   current D-PHY sequence;
6. C-PHY in qcom-mipi-csi2, with the X1E80100 sequence taken from
   Qualcomm's GPL-2.0 downstream header.

The series is on next-20261015 and applies there on its own. The two
CAMSS patches that use it build on David's "media: camss: Add support
for C-PHY configuration on Qualcomm platforms" v9, which is not in
linux-next yet, so I will send them on top of David's series:
https://lore.kernel.org/all/20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz/

Tested on the Surface Pro 11 (X1E80100), booting next-20261015 with this
series, David's v9 and those two CAMSS patches on top, with CSI2 PHY
nodes as in Bryan's x1e80100 camera DT v7, CAMSS in PHY API mode, and raw
capture over RDI:
- front IMX681 (Sergey's and Andre's v8 driver plus its C-PHY RFC) on
  CSIPHY2, one C-PHY trio at 2.4 Gsym/s: 3844x2640 at 30 fps, and the
  sensor's colour bars are byte-identical to the pattern captured with an
  out-of-tree driver. The settle count is computed, 28 at a 400 MHz
  timer;
- rear OV13858 on CSIPHY1, four D-PHY lanes: 29.9 fps.
On the earlier test setup, linux-next's CAMSS and CSI2 PHY as modules on
7.1.5, forcing any settle count from 6 to 48 gave the same frames.

Open question, from Nihal: the X1E table is Qualcomm's 2.5 Gsps one, and
downstream picks C-PHY settings by symbol rate. I would keep a single
table here and add selection by rate when a second rate is needed,
unless you would rather have the structure now.

Thanks,
George

---
Changes in v3:
- Drop the RFC prefix (Bryan)
- Test on a linux-next kernel instead of linux-next's modules on 7.1.5
  (Bryan)
- phy: u64 and u8 in struct phy_configure_opts_mipi_cphy and the
  helpers (sashiko); pick up Reviewed-by tags from Loic and Bryan
- qcom-mipi-csi2: split the lane mask and polarity helpers and the
  fsleep() change out of the C-PHY patch, each with no functional change
  for D-PHY
- qcom-mipi-csi2: write the C-PHY per-trio register addresses with
  CSIPHY_LN_CTRLn(); the object code is unchanged (David)
- Link to v2: https://lore.kernel.org/r/20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com

Changes in v2:
- Rebase on next-20261015, PHY patches only; the CAMSS patches follow
  David's series (Bryan)
- phy: rename lanes to trios (Loic), make symbol_rate unsigned long long
  so 32-bit can hold rates above 4.29 Gsym/s, and keep Bryan's R-b for
  that patch
- phy: new patch with the C-PHY helpers (Bryan, Loic)
- qcom-mipi-csi2: new patch renaming init_seq/lane_array_size to
  dphy_init_seq/dphy_lane_array_size (Bryan)
- qcom-mipi-csi2: rename the C-PHY table to lane_regs_v2_1_2_cphy and
  shorten its comment (Konrad)
- qcom-mipi-csi2: no separate bus_type; the endpoint sets phy_mode and
  set_mode() checks against it (Nihal)
- qcom-mipi-csi2: if/else instead of the ternaries, one declaration per
  line, and lanes_enable() split into lane mask and polarity helpers
  instead of the goto (Bryan, Nihal)
- qcom-mipi-csi2: configure() uses the helpers and keeps the link
  frequency, so clocks scale as for D-PHY
- qcom-mipi-csi2: compute the C-PHY settle count instead of the fixed
  table value; blank lines between the per-trio blocks; fsleep() for the
  sequence delays (Nihal)
- qcom-mipi-csi2: drop the video-interfaces.h include, no longer needed
- Link to v1: https://lore.kernel.org/r/20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com

---
George Neacsu (6):
      phy: Add MIPI C-PHY mode and configuration options
      phy: Add MIPI C-PHY configuration helpers
      phy: qcom-mipi-csi2: Rename the D-PHY init sequence
      phy: qcom-mipi-csi2: Add lane mask and lane polarity helpers
      phy: qcom-mipi-csi2: Use fsleep() for init sequence delays
      phy: qcom-mipi-csi2: Add C-PHY support for X1E80100

 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 228 ++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  53 ++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   6 +-
 include/linux/phy/phy-mipi-cphy.h                  |  89 ++++++++
 include/linux/phy/phy.h                            |   5 +
 5 files changed, 348 insertions(+), 33 deletions(-)
---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261015-x1e-cphy-rfc-201860c8097f

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


