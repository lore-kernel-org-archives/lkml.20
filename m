Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05CC4BD7AF;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102837; cv=none; b=J7vKi14fxhphmDf6yzFCfX3v46W2bJVD+FjmXWe6hTXQ3moSFJl3naanSbMvyfiCYRKK9x1pkZcYPXgQuQqYX46RrtvbuJLzzVWwzl/fBTs6Y3zx6jaE4CNHK3YGwqUNK13e4A96JjWT8VWzIkySxnXjGiHnyxuQMJ3cJ/Z4Jnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102837; c=relaxed/simple;
	bh=1PzFHK8pyF9EZhautPJ1LhtB2o3MzeG5L1QZKbwR3b0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bdYutpM4Lihm3os5Np2ncaRhpSF9gGFiG/cEPwVkund6RJycHLCdy94sPgDJ6zAOvKLLppNYiP+GPwdvO+4Lz606yDn8TyW24sEaZ8RbdGCF7ySmMbUFIkbXcGD9rNq4OGotYqZ0Kg3arDEaw4iqFNB+5eONhTTFkofzSp4TUGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPn8G4vQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPn8G4vQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 282B6C2BCF4;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792102837;
	bh=1PzFHK8pyF9EZhautPJ1LhtB2o3MzeG5L1QZKbwR3b0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dPn8G4vQSA/M/ENY28t719fLMEzcB2e6hzchhxth4RQBsi5vh7K3pXqJngrF4rPm3
	 z2eoxgd7/3qESNzfVTWfEiWWtyZ1e4KCb1CO7huHuyWrz4vGIIeKWoCxgZUT3U6NSL
	 Y4LnOQoSEoSImVkbHEWrdI4pqcH+PiHff07nC7EoupPr2cPlFD/cM1AOcIYWNQHktB
	 i/YvdAOPAU2DG5pE1KX1s5ruadAcZJE9q6+zKZTwDSWbgEvZG0REXZqHFS1L1bjlJj
	 7IB6NddidqnyxjJ4+sI/L64h8d6yIqSMIx76OU61ZxrIAB3oIc+SKfQReoBTj6FUVS
	 vskH1/OsvlqyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D84CCA462;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Subject: [PATCH RFC 0/4] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Thu, 15 Oct 2026 23:20:35 +0100
Message-Id: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3QrDVN3kgoxK3aK0ZF0jA0MLM4NkCwNL8zQloJaCotS0zAqwcdF
 KQW7OSrG1tQCwerqKYwAAAA==
X-Change-ID: 20261015-x1e-cphy-rfc-201860c8097f
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792102835; l=3102;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=1PzFHK8pyF9EZhautPJ1LhtB2o3MzeG5L1QZKbwR3b0=;
 b=5S2ojKLUt1u62x+SOIHV7NR4c6jSSpRDw3Q3TZjJvP1NmfK43mWZrammeIFZOIIMIIoZJThcJ
 soBFlIpalhJAGe5cK2sETDtSs7NiMhZZZyVT4HYN6fE64+KKsCQjX/U
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
series adds it. Before I go further, I would like to know whether this is
the shape you want:

1. PHY_MODE_MIPI_CPHY and C-PHY configuration options in the generic PHY
   framework, because CAMSS had no way to ask the PHY for C-PHY;
2. C-PHY in qcom-mipi-csi2, with the X1E80100 sequence taken from
   Qualcomm's GPL-2.0 downstream header;
3. the CSID 680 PHY type select, which is defined but never written;
4. C-PHY in csiphy_stream_on() for PHY API CSIPHYs.

The base is next-20261015 plus David's "media: camss: Add support for
C-PHY configuration on Qualcomm platforms" v9, which provides phy_cfg,
the CSID phy_sel and the C-PHY link frequency. I had to port its 8/9 by
hand onto the PHY API changes:
https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/

Tested on the Surface Pro 11 (X1E80100). Both cameras run together through
the upstream stack: CSI2 PHY nodes as in Bryan's x1e80100 camera DT v7,
and CAMSS in PHY API mode, with raw capture over RDI:
- front IMX681 (Sergey's and Andre's v8 driver plus its C-PHY RFC) on
  CSIPHY2, one C-PHY trio at 2.4 Gsym/s: 3844x2640 at 30.01 fps, and the
  sensor's colour bars are byte-identical to the pattern captured with an
  out-of-tree driver;
- rear OV13858 on CSIPHY1, four D-PHY lanes: 29.9 fps, as before the
  series.
The kernel was 7.1.5, with linux-next's CAMSS and CSI2 PHY built as
modules; the test build needed shims only for API differences.

Two questions:
- Is a generic C-PHY mode how you want CAMSS to ask for it, or would you
  rather the PHY take the mode from its own endpoint alone?
- Qualcomm's X1E sequence is for 2.5 Gsps, and this sensor runs at
  2.4 Gsym/s with it. The sa8775p C-PHY series selects settings by data
  rate. Should X1E do the same?

Patches 1-2 are PHY and 3-4 are CAMSS. They can go separately once the
approach is agreed.

Thanks,
George

---
George Neacsu (4):
      phy: Add MIPI C-PHY mode and configuration options
      phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
      media: qcom: camss: csid-680: Select C-PHY in the receiver
      media: qcom: camss: Configure C-PHY through the PHY API

 drivers/media/platform/qcom/camss/camss-csid-680.c |   2 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  35 +++--
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 151 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  49 ++++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   4 +
 include/linux/phy/phy-mipi-cphy.h                  |  27 ++++
 include/linux/phy/phy.h                            |   5 +
 7 files changed, 252 insertions(+), 21 deletions(-)
---
base-commit: 4a926a0ea6c65089285eb3ccb84ac6b02b22dee5
change-id: 20261015-x1e-cphy-rfc-201860c8097f

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


