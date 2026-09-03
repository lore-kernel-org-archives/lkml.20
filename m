Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932930D3EF;
	Thu,  3 Sep 2026 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421499; cv=none; b=UP7fheRt2Puz8RFLN0/L0mUdQF+pPmLTDFQmCuewYKWSt6MTRhzWk92ZkbYHNrIZa1u5vzXmiFfgz4trMm9+ZIx6E4mHX8pfyIpQizBi/GI4Ci5mRWWOB9EAbAYod6/l3N+ocT3qL4kyndd03xlwSRZmOnhlJTp4Nvi+G2IR7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421499; c=relaxed/simple;
	bh=y/o5OuTrKWqV1YTkiUVwt0WfAyCcMx1X3jb67Ioq8Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qsCs/DOjNubPl28s8ooF1s+HAXsjerTrOOytGllNU+fcyITy8oNr4uMfvyc5tqmL6wnSXdQux73OCJxLbzi38+qoajKqH5XQNSMbw1kceyyfWr1+6iNcCeFy1xgDoNVOZOy1jIHIVM29vEBKZZtvYxPh+JSOOuA0ewB7QmFgv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku02frQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ku02frQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FC21F000E9;
	Thu,  3 Sep 2026 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421497;
	bh=6/S6h4qNNabMqwruC/NSRazKWiKs9Qmq7V4nktpHTNM=;
	h=From:Subject:Date:To:Cc;
	b=Ku02frQs4O47y8cy33NkOD63hgWBYprxM6CGhZ+8hIo6jBViK3X4Wn0pDpwWgL7iF
	 AHYyuBvJHki3KxMMQpEzd7QNkIiVUZk9TaTluqd5dyBbv0hGpX4u+atIYAepO5CiFg
	 DDP7SZErDXlAdNHwvbLaNThtALfAnPboRrTdYGn3FnmyqrRl4f15gt3ICi6CmAYw06
	 maNWOBGTEiKz+1pGmUCT7gfnO2D7hEWf8xCIOWSiWOv3ML1/oARosCs+RCxXtpcA4C
	 XBpt99YqXN0cReRu9iBZ+Z+FEU9PaH55TDTSFBRxThnCCcNlPCziZz++lhfTN9RmRs
	 xNU/3VWyThqbw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v5 0/2] Add support for SA8255P in the qcom-qmp-usb phy
 driver
Date: Thu, 03 Sep 2026 09:44:46 +0200
Message-Id: <20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPTW6DMBAF4KtEXteVGfwz7qr3qLqwzRDcNkDsB
 CWKuHtMuqGKUJdPevM9zY1lSpEye9vdWKIp5jj0JaiXHQud6/fEY1MyAwFaGIF87K78GIYDPx5
 Gfs6eIyjFrUVthQmND5aV2zFRGy8P9+PzN+ez/6JwWrCl0cV8GtL1MTxVS++/janigmODCpxVt
 Wr8+zelnn5eh7Rny8gEa8ZuMVCY2usA2kllEJ+YesUAbDF1Ychg+Vp4ia15YuSakVuMLIyzQlS
 ydV4a/YeZ5/kOzYSccqIBAAA=
X-Change-ID: 20260708-phy-qcom-qmp-usb-8255-9986907cdbc9
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=y/o5OuTrKWqV1YTkiUVwt0WfAyCcMx1X3jb67Ioq8Hg=;
 b=owGbwMvMwMUoySu7Jc1P0pTxtFoSQ9ZM1bL9RbmHlzLJ6eV1Vs8VqGMRML/ktTLtZrRbfo7Q6
 +aA1UKdjMYsDIxcDLJiiix6L52Wb5PP2hcsvJYBZhArE8gUBi5OAZiI+GsOhu1HGB79y9GVPyTf
 t9ym69cHlg+Ou/pq1FJsDztJM0jdnra5ag5Db/v8ptAOVynxwkoJsT/FPgIf1p2bNfecklK+w4q
 UaelB0RzTFINn3dn3PPS84acksx8/T2+QPczwrM5uRrD3qYeHL2vMu7Q/mvcnC592xYJw6XRb69
 2TTl8qcJ23Q5dp2WcV1uSo5J6zjCvYNVcrNS39FC5ULZV0TVzpkDpb5QJ2IxFZ3xXW/Fo5W6++i
 yrcdkrh1x121t/TeII5tq2J/vhDRUTYnZ95rYi0XF3umeeHTjErp3Caf59VWWdfdijryTcpZd5l
 LRouPwKrlP+t5vZis5QtvfizZL3DcsYezm2cU5h3CfgAAA==
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

