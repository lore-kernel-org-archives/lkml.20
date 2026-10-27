Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106010;
	b=YgAUBw51chBrmr3vXuIrXUpTWsimXWm7JmjS+i5/jkuWEv4NPFVgCr323dUsdD9JhjoZ
	 rTRciNJgTdLGv+ozTdbLRsKrvngrzHJla/Lpk7Cgf5leJNB4eJnNp4JM29aSoncrFMAW1
	 zdjIFFa9qeQtC4BGKPg9msM2g08gIZvUuPzD1om0KuaBMm1Bmb3gw9oUyatzuMWuiUIDO
	 UAcfQelTHDwDjn6k14G4Akn5JMHPgAyZa7HefF6iC+xrwwFxFrOYIfhsMS1CNoCNyJ953
	 4Xqiq+wlrSmC0730Y8W+/hFyNpTWuU54PGgLVQjnI1EQs4sSGDuLeDqSbvTpN3nawrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106010;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=njFkWVmcvK6W9Ax7/0dLK/1HgZ6Q7qmr1RfBoVXi/fo=;
	b=tnJVsBM6XN+7N7vssQxDrVMV/o3wqmRGTTshuzgMongzSPqJlZ3BaDGVPJg5XKiqzuGu
	 l4s956JHL432YBO0prvV5nk/KuB1JvSRAeWZuyFk3Z+D3lXeVcoNfKpFMWJrVmyGMoaz3
	 hvJ0PwUrlIxHgJCJgZC/758vmP5eGdQq9N9lwHtogFJsL4Hef/UUawV9Wrtm1usaoCKj+
	 YAcVWjNCS6r5pdfKbdXYJwpzE3F4UnU7HPsSWfRS1XUSH8Ul7lOPtMHCK+ZAAhCXvz1/l
	 ZHAOen6G2bhLo9ynC/G/7MzXJeKXtkxZC4xDckguPBmG6bCfnuuW1skZhv35IKvRM7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHtMqQ96;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31114606A31D;
	Tue, 27 Oct 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHtMqQ96
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541BC1F01825;
	Tue, 27 Oct 2026 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106009;
	bh=njFkWVmcvK6W9Ax7/0dLK/1HgZ6Q7qmr1RfBoVXi/fo=;
	h=From:Subject:Date:To:Cc;
	b=FHtMqQ96VH4ver1xWDcJF/i9dGeYXzfBR24hVmYVeqLM5sfhlUcqM8UnWylVq884Y
	 bDDSutFAWuqtbHvP/gRSlXAar1394c5q3C2JtNWsunN1z5wkpqei7rtFgMM+6/i3kZ
	 uzdstkIVA6xrJWNdNA9RMPVS9opHggiHF2n868wQC66tizkmJZgFzvt4btc3CgQzPH
	 OVksTEY1N3glRfHWTG5Z7KKxDbFvjaCq82M1GYsrz54mT13rT2HObm+DEhrs3g6Zeg
	 w7H0NVjmTIuAFVt2Jw2Yr+hPBlKCn479OJ6PAcdwxqEbgnEKk89K0dNyQoDtMdkNOv
	 Xe0op1oP+e8ug==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v4 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
Date: Tue, 27 Oct 2026 14:00:03 +0100
Message-Id: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33N0U7DIBTG8VdZuPYYOBRKd+V7LLsY9LCirlSox
 GXpu0un0RiTXn7Jl9//xjKlQJntdzeWqIQc4lhH87BjbjiNZ4LQ182Qo+YtdjANV3hz8QJ5nDJ
 4uswRCoJBpaDj3lOr24ZzwaowJfLh464fjl87v9tncvNKro8h5Dmm6z1fxPr7Lkm+WSoCOBhrr
 FeCq5M2Ty+URnp9jOnM1lTBX8xIsY1hxXqnRdd635Ow/zD5gwnOcRuTFZMNqgZt31mn/2DLsnw
 C4oRM0HMBAAA=
X-Change-ID: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=rpr3MaquFeAFWt0e7SR5ZEfxzmpjxuycEgP0fXoFKCs=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBq4KBWFc535eVcBM1h47FV1d+GUsduLTx6UzOy2
 YtPFhtfQeuJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCauCgVgAKCRAZDR20Zk4Z
 NRAjCADVh+w8VHJ9WLG4k1mtJGdWNwEkqXNfBLNrI/VF1oL7PoyTo7Pv3cBJPxeAf8O3529EXj+
 k9/HC8LH9/1Up2ey+KrBY3FP8Qka7YlB7VWF8wXkFBpv2C1Yg1p+zVpHYyrngUp0fEgHAKNzFmo
 kN6WXE36oxqAyi5fpUVZCCcbRN1j1h7blSSQQDKjwe75rg6CizajLhAsUDtV9VsxPWHQ1yupcUq
 azx5/nkeNEmZDViAmDEqTK7gV9JRdY0EJskqiW02iRqd3/h/hI/P6RTjYYqpqGXFz3ZR/FmTp/7
 +YUP7EzAFhIuWjgimsfNQn/F6ZjCSTwzzoFF4JdQR9kBqcOZ
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

The Qualcomm automotive  SA8255p SoC abstracts resources such as resets,
clocks and regulators in firmware. The SCMI firmware exposes multiple
protocols to control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have omitted it from the bindings and
the driver.

Patch 1 adds the binding for sa8255p. Similarly to what has been done
for I2C [1], this is a separate binding.

Patch 2 adds the driver change, which is based on a public vendor
patch from qualcomm [2].
I did the following changes on top of that:
* Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
  of implementing a driver .remove()
* Changed power domain names to drop 'usb_' prefix
* Fixed various error handling paths
* Added suspend/resume support

This has been tested on next-20261026 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Changes in v4:
- Don't control regulator, clk and reset in SCMI path (Mani)
- Rename helper functions to qcom_snps_pds_{enable,disable}_all and
  qcom_snps_pd_{enable,disable}_transfer (Mani)
- Add some more helper functions to keep probe() cleaner.
- Dropped Neil's R-b due to the above driver changes
- Link to v3: https://lore.kernel.org/r/20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org

Changes in v3:
- Applied R-b from Krzysztof and Neil
- Link to v2: https://patch.msgid.link/20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org

Changes in v2:
- Move 'core' as first domain, before 'transfer' (Krzysztof)
- Reworded binding commit message to be more precise about the various
  domains ('core', 'transfer' and 'perf') (Krzysztof)
- Link to v1: https://patch.msgid.link/20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mattijs Korpershoek (1):
      dt-bindings: phy: Add sa8255p high-speed USB PHY

Sriram Dash (1):
      phy: qcom-snps-femto-v2: Add support for SA8255P

 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      |  52 +++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 253 +++++++++++++++++----
 2 files changed, 256 insertions(+), 49 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>

