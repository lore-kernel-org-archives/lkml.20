Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87032FA30;
	Fri,  2 Oct 2026 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934003; cv=none; b=az+lGTu4N8MaumJHBJsJufsixbyRb7pPcAB0gZpE9HyjUP+UZLRM/bazxHnl9NWccAT0rGuu1A402jfW2OB/XdwwLC77/hnEvP2gHJyNau4HV/eG/UGfaNDV4kO4dBuHTrIIpmBJSiWR5VywbqMdxfKmidjA8Po/OXpUwDGr2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934003; c=relaxed/simple;
	bh=u5VE9aW+oZTiOwa+V4EBAsdkjKqtrA1ZKytj65kaAwY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OuWZK6qg7UfkrGa1V+uXCewaR1IAe7VZgDFQpxZR0CBmXzZdF8s2DOqGGqic6HzK94TTKxayaCU1Gu5Guue2AG99BbNqv88EoqhXW3volmRMDCdV+0UCnloYWiCf0ko0Oqd+QYVi/+gSKuQfvnTAx8XgPbUMwT1J4K/OPF2BdQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQlu2FBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQlu2FBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E67F1F000FF;
	Fri,  2 Oct 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934001;
	bh=17lU94YXE4bG80jZVpJ+wbF3IZBR7FYU5Lqe5PbQH98=;
	h=From:Subject:Date:To:Cc;
	b=ZQlu2FBul7r4wVH0JdVhzpSfdOvan4x267lFa4BvEuahbasYDa+xKkTmg+YP6k4Y7
	 /ScDfS/jv5R/oAaEcDb/caRsNfHqBIkGHLpQmeCojpTi0XI95rWevEXZke4geX4xgh
	 tkkQN+7YpuyK35lkv1LtA/aY0O8XhyaolVDNaS2rLWaXfbyUfQ8zaTMpmWMws28seu
	 68vWA7a6iwQDeNEK3B8sh8womMNh3af3cGkvZzbCUrnE6W61TRctdKwvyrbKf1h4/o
	 C30g5mppNg62hRdbxgPYvr/HD3wn3wCAViCg3acpP0N3DHBhyTQTsazIjnnzAR6zOd
	 hrZobGDd1YcvQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v6 0/2] Add support for SA8255P in the qcom-qmp-usb phy
 driver
Date: Fri, 02 Oct 2026 11:39:36 +0200
Message-Id: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPTW6DMBAF4KtEXteVGf9n1XtUWdhmCG4bIHaCE
 kXcvSZdlAqhLp80872ZB8mYImay3z1IwjHm2HclqJcdCa3rjkhjXTIBBoppZujQ3uk59Cd6Pg3
 0mj01ICW11ijLdKh9sKTsDgmbeHu674efnK/+A8NlxuaJNuZLn+7P4rGa5/7rGCvKqKmNBGcll
 7V/+8TU4ddrn45kLhlhydgtBgrDvQqgnJDamBXDFwzAFsMLg9qUr5kXptErRiwZscWIwjjLWCU
 a54VWK0b+MpbxLUbO14CsEMBzUeEfZpqmb3gxTQPpAQAA
X-Change-ID: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3937;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=u5VE9aW+oZTiOwa+V4EBAsdkjKqtrA1ZKytj65kaAwY=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqv3vvf6Nz0ForEaxKyO7xqkgsdXKvSmTKExKSx
 OnpSH+EBfCJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar977wAKCRAZDR20Zk4Z
 NV6TCACaEzcB2oIgGvjCbF/mQQhX9wpkA3RhOnklOz+EGi6s98XDcJ6izKnmc+/DLpumStxdKYP
 Sv6ZN3UYHzKNLP2PhQGQFzs1ydJkH9aS0glqqT7KwS8V95lrsbsBOHb89WkCginpVFb/G7p0I3z
 lCqtZpXlnlHn8ood9WAk4CkmH5jw9WrkqcmjiXvmMW1w/MaXrmTo3L5Nxg6S+QF66TH187Tjgn0
 9S2C/tmpYN+aLIKVbeBzaay+o/7fOnGx9cn7hJbC+NcdGyJjdZxm2kSdPMIjme+sk0cFm3bj/C4
 hoxbhHLv+fzK2/HoCX6vlw2M5gWS3XGi7pwhaLdtvk9jL/iA
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
* Drop the .lanes struct member since it no longer exists.
* Re-order some functions

This has been tested on next-20260706 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0011-PENDING-phy-qcom-qmp-usb-Add-support-for-SA8255P.patch

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Changes in v6:
- Applied R-b tags from Krzysztof and Neil
- Link to v5: https://patch.msgid.link/20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org

Changes in v5:
- Move 'core' as first domain, before 'transfer' (Krzysztof)
- Reworded binding commit message to be more precise about the various
  domains ('core', 'transfer' and 'perf') (Krzysztof)
- Dropped Krzysztof review due to the above binding changes
- Set .num_vregs=0 since regulators are managed by firmware
- Link to v4: https://patch.msgid.link/20260724-phy-qcom-qmp-usb-8255-v4-0-a90014fab476@kernel.org

Changes in v4:
* bindings: Use additionalProperties: instead of unevaluatedProperties:
  (Krzysztof)
- Link to v3: https://patch.msgid.link/20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org

Changes in v3:
* Binding changes:
  * Use a separate binding file (Krzysztof)
  * Remove 'usb_' prefix from power-domain-names (Krzysztof)
* Driver changes:
  * Remove 'usb_' prefix from power-domain-names
  * Moved sa8255p_usb3_uniphy_cfg before sa8775p_usb3_uniphy_cfg
* Link to v2: https://patch.msgid.link/20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org

Changes in v2:
* Driver changes:
  * Fix comment typo tranfer -> transfer
  * Fix print statement to add a missing '(' in the string
  * Use dev_err_probe() in qmp_usb_domain_attach() to reduce log noise
  * Fix pm_runtime_put_sync() order in qmp_usb_d0_to_d3 (Sashiko)
  * Fix runtime PM reference leak on usb_transfer (Sashiko)
  * Fix runtime PM reference leak on error in qmp_usb_init (Sashiko)
  * Reorder qmp_usb_d0_to_d3() to mirror init ordering in qmp_usb_exit()
    (Sashiko)
  * Reorder qmp_usb_d0_to_d3() to mirror resume ordering in
    qmp_usb_runtime_suspend() (Sashiko)
  * Fix error handling in qmp_usb_runtime_resume() (Sashiko)
* Link to v1: https://patch.msgid.link/20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org

---
Mattijs Korpershoek (1):
      dt-bindings: phy: Add sa8255p USB PHY

Sriram Dash (1):
      phy: qcom: qmp-usb: Add support for SA8255P

 .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         |  52 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 182 ++++++++++++++++++---
 2 files changed, 212 insertions(+), 22 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>

