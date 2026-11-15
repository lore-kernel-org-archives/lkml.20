Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771577;
	b=Z6MNIV3lvBExQ2uiFE7CYwU2/j6uznFU3AfpmDaz7B+GRa0PTiHyeNZQ6BXmIq27naNv
	 HUXmSlascvrt6Lw+W3g0BrDwiaR8tCBVCYfeZYgPZLvGyHUn71Us+H6ekEPaRMDezuP7W
	 5Bm0alQ0Ip9gsbCXf3p70RQlfwHzZipBGdpVRmlF4j44RRtqzq/Cb3QncmzizuTw9Lork
	 wE0gV19D+2Q84maxp7em9GrAEai4HmY2Bf83IlAm/qFrsNwROA9Om75R1hIux7nezXefL
	 PBMNACGw7dNSECA4Hirb4466huKc4QArHhSM+GUuEuUjlHKJFMFnjzxphDKqOEAk1dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771577;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=n/a46n6VwE7O/BAQsQtQkNx8ZFiE/wY2d6w3kJUGROQ=;
	b=qSKy7AKlmKT3cEEXECOzoZy3pfqxR0dmrvDEasr/8fuKXug7mHt7a7bhk1T5GGtGE+gV
	 sRrQkgqkUfqBVkRPEDD1T0mVUphDrdGWCpQhmoHO/wLTL1dgKcT6+OYc/Gur8opc7TuY/
	 IbG4Y5rOmuikAiACuOdwAWSxc+JfCT4I7qbdXF6LwL+xYyF4o2t4z1PVN1alEnXr+lzXG
	 3Wk+GCle+1hbb40VavdR41mC4goqqh9nL4pL0OurohZ3QBV53UvaseA4PEjGBQaRXLk+T
	 0rva/H9qyZyr54Y2sN1fs22zO3v9gzoyUhp03WARI8SIqkIE96Ov51qCIRpQHRcKbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D5D606A883;
	Sun, 15 Nov 2026 19:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46CE1F000C4;
	Sun, 15 Nov 2026 19:39:32 +0000 (UTC)
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
Subject: Re: [PATCH v4 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sriram Dash <quic_sriramd@quicinc.com>
In-Reply-To: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
References: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
Date: Sun, 15 Nov 2026 11:39:26 -0800
Message-Id: <179477156606.132702.14520908453502528873.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4185;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=u5YX6B1rgBteaMlYQ3xEJmuhRJTD0/qE0aiK3+RfynQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+gpwy46M+AR2Fr0X/klk3joJ9AcKwVi4HkKiP
 KofsTGc4l+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoKcAAKCRBVnxHm/pHO
 9Ze0B/9UrTSnuvM8m3o2w6ZPwDFosmvJcHg3HE3y7nVaH+lpDFePIn+2SJNJ0O6rwLZBTT2oRj5
 8Zvpxdpz1ce/XYhHknzdeaaKokvOcBqgVBT0N8x68H1TvyN5ta4KrOp9LjLV0IAsSeLFb0xSPjC
 JtobzxpVbGuOqmgAkzAPv30P9fo8XbuPNBeBlwOw9R2kXNGpZAJoY0N6Y7xG0yfLsMLqHixE0MH
 QvNTmjeU4OZgMWn8Qrkwi78VjMmPb5npMZ03yB8b78SyOKVgcx/pIU8VwPTdTR7OvwYPFwjE3KR
 QbCs0H/9ZYRjVTZJhEqyxa6tTsLDeb/PtlxW3WYe1nILLU5H
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-27 14:00 +0100, Mattijs Korpershoek wrote:
> The Qualcomm automotive  SA8255p SoC abstracts resources such as resets,
> clocks and regulators in firmware. The SCMI firmware exposes multiple
> protocols to control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.
> 
> Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information. Since it is not mandatory
> for the PHY to be functional, we have omitted it from the bindings and
> the driver.
> 
> Patch 1 adds the binding for sa8255p. Similarly to what has been done
> for I2C [1], this is a separate binding.
> 
> Patch 2 adds the driver change, which is based on a public vendor
> patch from qualcomm [2].
> I did the following changes on top of that:
> * Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
>   of implementing a driver .remove()
> * Changed power domain names to drop 'usb_' prefix
> * Fixed various error handling paths
> * Added suspend/resume support
> 
> This has been tested on next-20261026 with a Ride4 SA8775P board that
> has SCMI firmware (which is compatible).
> 
> [1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
> [2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


> ---
> Changes in v4:
> - Don't control regulator, clk and reset in SCMI path (Mani)
> - Rename helper functions to qcom_snps_pds_{enable,disable}_all and
>   qcom_snps_pd_{enable,disable}_transfer (Mani)
> - Add some more helper functions to keep probe() cleaner.
> - Dropped Neil's R-b due to the above driver changes
> - Link to v3: https://lore.kernel.org/r/20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org
> 
> Changes in v3:
> - Applied R-b from Krzysztof and Neil
> - Link to v2: https://patch.msgid.link/20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org
> 
> Changes in v2:
> - Move 'core' as first domain, before 'transfer' (Krzysztof)
> - Reworded binding commit message to be more precise about the various
>   domains ('core', 'transfer' and 'perf') (Krzysztof)
> - Link to v1: https://patch.msgid.link/20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org
> 
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Mattijs Korpershoek <mkorpershoek@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Mattijs Korpershoek (1):
>       dt-bindings: phy: Add sa8255p high-speed USB PHY
> 
> Sriram Dash (1):
>       phy: qcom-snps-femto-v2: Add support for SA8255P
> 
>  .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      |  52 +++++
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 253 +++++++++++++++++----
>  2 files changed, 256 insertions(+), 49 deletions(-)
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001
> 
> Best regards,
> --  
> Mattijs Korpershoek <mkorpershoek@kernel.org>
> 
> 


