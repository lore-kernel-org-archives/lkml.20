Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A83603C7;
	Fri, 16 Oct 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148270; cv=none; b=lhV5+WAnTuiJV051iYCsm2e+p7Wz/FnK79/0oy377K9xh1tzyxS/12t4oRm9ik+5WV05sa4p6oCFJ4Wa4RDAZTUKDSwsiKdQOSNypu0bV2jEimhclv4Z007aG2ObEVEm/dosUewr/KTGunchuGZPpJAoVEqEu87XsPwyxzYDKVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148270; c=relaxed/simple;
	bh=mWY/dYRiPPhwty495pNDEdZSx3UaZ70xbYzKLPFF9Ww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MvYBNaLtspde7Z5/1EOOTNrs0wLf/ECePDjDiDlNU4wq5y01xqxmFEqj9Zsumtm66lQQ5eoyc9W3k6/SBcFoEEiB4sY3oq0sqOpLJ8ry0TUIexltMBsQEVosmCtXCjk26kpRwzh0V88rcFKyxuzAfCbU8TXR6azvMpWveCuKuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a243UdHj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a243UdHj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC50BC2BCF4;
	Fri, 16 Oct 2026 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792148269;
	bh=mWY/dYRiPPhwty495pNDEdZSx3UaZ70xbYzKLPFF9Ww=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a243UdHjioykaFlkP8Gv6Wok2XZPepK2zTh7LXaOxweGYQrIcrwPPg6e3t/8BdT29
	 kvyV8nMWRChDOZOtzCy1IQzj1wbwN91wZvgW4nq/9+mjNzF6eN2d19i57tRS0X79Jw
	 RGROumMs1+Hn740bHZzRqg3UnbYGEnS+WkZ/S5TaLdDxPxPznIvqUzp8DG/vp5iOcN
	 vBRfNDCH4hZTpouFjmfJdQ7ttwPnn4OpgkcJthjxCez6Tm0X2Fsqdx+amFq4uipASZ
	 JLNmVCm3u+h7rb1V3eCHeWQSMK5Os34/lpsde6bgtXckEtWuxfa265xLycqRcitvji
	 PWW27j7d7CrdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A548FCCA462;
	Fri, 16 Oct 2026 10:57:49 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Subject: [PATCH RFC v2 0/4] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Fri, 16 Oct 2026 11:57:47 +0100
Message-Id: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NzQrCMBCEX6Xs2ZXdqLXtSRB8AK/SQ4hJs2B/S
 KS0lL67IWeP3wzzzQbRBrERmmKDYGeJMg4J1KEA4/XQWZR3YlCkSia+4MIWzeRXDM6gIq5KMhX
 VVwdpMgXrZMm6Fzwfd2hT6CV+x7Dmi5lz9d82MxKyOzlda1efSd+6XsvnaMYe2n3ff0Lqm8utA
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792148268; l=4310;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=mWY/dYRiPPhwty495pNDEdZSx3UaZ70xbYzKLPFF9Ww=;
 b=Skn8MgLc4iM3u5UsmP2QoqembU3enfAbjHaSrNH6LcnctfFiIvrFwJzO5Qtumiw9d3HgGGOsg
 +rpoSP2o0dUCf0+u3k7FYp/PtjnJqZXbXS65PKXG3fpHquK19rSnmqy
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
4. C-PHY in qcom-mipi-csi2, with the X1E80100 sequence taken from
   Qualcomm's GPL-2.0 downstream header.

v2 is on next-20261015 and applies there on its own. The two CAMSS
patches from v1 (the CSID 680 PHY type select, and C-PHY in
csiphy_stream_on()) build on David's "media: camss: Add support for C-PHY
configuration on Qualcomm platforms" v9, which is not in linux-next yet,
so I have left them out and will send them on top of David's series:
https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/

Tested on the Surface Pro 11 (X1E80100) with David's v9 and those two
patches on top, through the upstream stack: CSI2 PHY nodes as in Bryan's
x1e80100 camera DT v7, and CAMSS in PHY API mode, with raw capture over
RDI:
- front IMX681 (Sergey's and Andre's v8 driver plus its C-PHY RFC) on
  CSIPHY2, one C-PHY trio at 2.4 Gsym/s: 3844x2640 at 30 fps, and the
  sensor's colour bars are byte-identical to the pattern captured with an
  out-of-tree driver. The settle count is now computed (28 at a 400 MHz
  timer), and any value from 6 to 48 gives the same frames;
- rear OV13858 on CSIPHY1, four D-PHY lanes: 29.9 fps with the same
  settle count as before the series.
The kernel was 7.1.5, with linux-next's CAMSS and CSI2 PHY built as
modules; the test build needed shims only for API differences.

Open question, from Nihal: the X1E table is Qualcomm's 2.5 Gsps one, and
downstream picks C-PHY settings by symbol rate. I would keep a single
table here and add selection by rate when a second rate is needed,
unless you would rather have the structure now.

Thanks,
George

---
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
George Neacsu (4):
      phy: Add MIPI C-PHY mode and configuration options
      phy: Add MIPI C-PHY configuration helpers
      phy: qcom-mipi-csi2: Rename the D-PHY init sequence
      phy: qcom-mipi-csi2: Add C-PHY support for X1E80100

 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 220 ++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  53 ++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   6 +-
 include/linux/phy/phy-mipi-cphy.h                  |  88 +++++++++
 include/linux/phy/phy.h                            |   5 +
 5 files changed, 339 insertions(+), 33 deletions(-)
---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261015-x1e-cphy-rfc-201860c8097f

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


