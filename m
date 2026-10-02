Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711844766AC;
	Fri,  2 Oct 2026 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934083; cv=none; b=nu4lCwvYsnn8RXHTJxAcIVikJoTzbyhq3UxjqXl73akMomxr+D+U86qoYYq6Chw0E4loaa52byi2bIaGcUGvObcjnJMjwaTJ2tmsclwCzsE3z7axp+30pRxJHFSFDeiBFuWwk1ZYt4dwZdgm5utqNFpetICaBJHsRVCpGGby1k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934083; c=relaxed/simple;
	bh=I8f5JVoGmYDVjbiGqZNXzfuTNyuO3ICuUx0Wq4F5izs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yqwo8dvKR/wnJ7f5YUt1Y9AKd9pBFkj8AP7ke99aUk86Lzt1tV3VV/SuVDJlCIz/rBxB+FPq/dVcboeDPZBdYNJ8nA7hAgFM5FWrSV+6hzrUw7ioxnm4bqGVef09FbFJxiC3YJ503aQnhrPXWucV0m0xMpJbanQhB593TEYxGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHEaho+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHEaho+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60511F000FF;
	Fri,  2 Oct 2026 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934080;
	bh=z5TQabQ1D2Wa2nsxYdARNxqVeVCpmXXD7CYEGzmCmfk=;
	h=From:Subject:Date:To:Cc;
	b=gHEaho+tFGkSLCtGFfeiQN/c2wsxWmdyritOOHdIqSSRsPljQxpZw2q2MnXX94yJ8
	 +pXL4AelwU1bxvnwASOSy0iApcoKitYbsCHEbqjnetKWSlgbTz1zusn/Qjz8I5JEEm
	 EhKlYYaoJaWSFG17PdPwtFDXAhqpHL5JL3zjKiZqrluBbL6MmmivO4SS1vDs34nN2U
	 YPGZizwMPOJUVel5zJ/YG4fpdRqGB3UqpkZ8bCgacTIa39pkqLGQlCLwez26Fje8mq
	 yXkLVdX7Scd8YAZwY4ES2OyPpSne3mEH2oasZmtcURUR0vu9HY/+2ykHLdBvxuSjzR
	 BydMSGzy35Ecw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
Date: Fri, 02 Oct 2026 11:41:08 +0200
Message-Id: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBRF0a2Qjv2mLRaKI/dhHFD4hapQbLGRE
 PYuoIlxwvAlL+eOxKMz6MkxGonDYLyx7TziXUSKOm8rBFPOm3DKE5ryDLp6gEdhG/Bt50Fj01s
 IHCQXAjKqNaZJeqCUkVnoHGrzWvXz5bP9U12x6BdyedTG99YNaz6w5fctxXSzFBhQkEoqLRgVe
 SJPN3Qt3vfWVWRJBf7DZMy2MT5jZZGwLNW6RKb+sGma3hsfvSgmAQAA
X-Change-ID: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=I8f5JVoGmYDVjbiGqZNXzfuTNyuO3ICuUx0Wq4F5izs=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqv3w9hnrrBoEgCdv0712HwcQje9sxyuuC0yIsO
 /ka581UUrqJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar98PQAKCRAZDR20Zk4Z
 NRbRCADAo0Fs6PgYxQF6rmqaMirfmreTdVzVPTBv4xtEl74LHBoi5Sv5egDQwxm7CSdRmTu3Gjx
 rr5H8QuGmysZAGwf+z59nogdWiMO3LB0WwBojHwoywEKlUlD2wYdxqv7X2044dAxVyHCedu/CKy
 jaItHiNrQaWb8qI2dVP1d7q+trNZ8OgHmfyLyyULSybiurgA74Nn0xnuemll1yWfzhXSdZ+i6ex
 wYQTkcytoGOiF2e+8Zl6NS01owXB7sKR4yYIQeJw3rqzRX/02b3Uo0/Pf93Hd/nqvxp8xR5w8aZ
 XqOAG+0rOfJ+FQr+CNjyz/CjNYg+Cu+iBo+VS9JN2GBsu58H
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

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

This has been tested on next-20260728 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Changes in v3:
- Applied R-b from Krzysztof and Neil
- Link to v2: https://patch.msgid.link/20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org

Changes in v2:
- Move 'core' as first domain, before 'transfer' (Krzysztof)
- Reworded binding commit message to be more precise about the various
  domains ('core', 'transfer' and 'perf') (Krzysztof)
- Link to v1: https://patch.msgid.link/20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org

---
Mattijs Korpershoek (1):
      dt-bindings: phy: Add sa8255p high-speed USB PHY

Sriram Dash (1):
      phy: qcom-snps-femto-v2: Add support for SA8255P

 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      |  52 +++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 127 +++++++++++++++++++--
 2 files changed, 170 insertions(+), 9 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>

