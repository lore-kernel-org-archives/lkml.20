Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01C043B4BC;
	Mon, 14 Sep 2026 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423467; cv=none; b=oqG8bNVoKbFG04ee9tTUXYvNZPOvyS5VEmix8M0kVBjhw6LjwhtWdGqMnA2WVW38SpjZ3Q43/PRxG/EfhcSPLalQI328SLAZmAPCoo3/dpaEJD7OkpjOLEkPpZ+2lGdQ+Rb1tpy8mXJ84l+biHRbR/d5xYq0jjkW42BUMvyMWA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423467; c=relaxed/simple;
	bh=7wq9k9Z+e/Jnq6UmymOYyQft/nBNfmVMtgWHxWu79Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:
	 In-Reply-To:References:To:Cc; b=IkvpTZYeDMN4ahTolYWMmb6N81XvUmaPMlyuAy39d+KcSEKD4sErB3xj0SxdtpoQqCp/K5Be2ooplOIhvHEU/ezE4EbupzQKLD8vEv/x6LHkmfhPp/qVDuglAZiOfwITWjCFxMDSL6LDzzhjP+sPI6VKuN2VlZKi0aAYKN8ODIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjB5XPh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjB5XPh+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 164D0C2BCB8;
	Mon, 14 Sep 2026 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789423467;
	bh=7wq9k9Z+e/Jnq6UmymOYyQft/nBNfmVMtgWHxWu79Hk=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To:From;
	b=rjB5XPh+XP6qiYrmut6P13Bu7ieCUb45Tn2VIANFbvC4U0be4iBH9a1X7K3IbQrKv
	 RZvOgsdyx48zjTHntSTaVMPkSC8Ys6QkLLuFT9kgFKQz99UGEP7XDVL+7W0vgCNjaI
	 v8Mwm7FdgS5n35kn5+pjY3kJsPlsouUYzoE6K7pJXzAAFLeRYlIA/BKOIphU60SC0i
	 jcVVKtEjjjT7wB9GikXwbf3hw4Tapi2a3AS6s91QM/1wJCdhm8+u+XaLRU6K7j9VOV
	 rblyo+kWG3Zo/6dGuvVBKAN6BCvTNCg252NMj0I+UNMFx/Xyx+jfpDIZcaLxv4rObz
	 cAyVEbtldr6kg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A40C88E77;
	Mon, 14 Sep 2026 22:04:26 +0000 (UTC)
From: Avalon Vargas via B4 Relay <devnull+avalon.vargas.centeno.est.una.ac.cr@kernel.org>
Date: Mon, 14 Sep 2026 16:04:23 -0600
Subject: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6tqQtBcSV9zAu2mGQGiymU4iGc
 Hep7tzo8s38eX8WRhgcEjtkCws4O3Kj36DYZQx64y/IXbsxU0JVopGatzgMtdaSx3GCniAgel7
 ZSglZ6L2xFdtO7wE793hrT+cP02SvCDG5UsIaQm6D8dCn0c1QxJAWvaM4huf7oVkmwY/uWXLJ2
 7optQBT4l4ekWI+eZMbyCGw1D+rf0RqE9VdrZQGAYDlt2hd1xd8yIy3MAEAAA==
X-Change-ID: 20260914-dell7441-touchscreen-6b6201348ab6
In-Reply-To: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>, 
 Laurentiu Tudor <laurentiu.tudor1@dell.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789423465; l=2783;
 i=avalon.vargas.centeno@est.una.ac.cr; s=avalon-una-20260914;
 h=from:subject:message-id;
 bh=v75HzOpWBajfOEjPLTpITjnQWejmIESrbq0Y0aBQQ9A=;
 b=6JsiynCVSClNZxDDovanJcVOxZuqP0EkykCbcmO6O0jomdmTCwsuoKM+iScQYWFLJ7r4XEGty
 iwFJVH5JddnB9rbu3s7O3rXeQO4qZCDZg/nLgd/ZFn+FFnoZymXm+Ju
X-Developer-Key: i=avalon.vargas.centeno@est.una.ac.cr; a=ed25519;
 pk=I7FZ301yhA9Jl2LReBEqv+9LUrd5zi397CIT2gTB6RE=
X-Endpoint-Received: by B4 Relay for
 avalon.vargas.centeno@est.una.ac.cr/avalon-una-20260914 with auth_id=1032
X-Original-From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
Reply-To: avalon.vargas.centeno@est.una.ac.cr

From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>

The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
responds at I2C address 0x09, while the device tree specifies 0x10.
Probing the latter fails with -ENXIO and no touchscreen input device
is registered.

Use address 0x09, matching the LXST2021 configuration on the related
Dell Latitude 7455. With this address, the controller identifies as
29BD:1103 and binds to hid-multitouch.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
---
This replaces the earlier report-plus-diff with a patch submission.
Only one unit has been tested. I have no evidence of double-sourcing
or a working Inspiron touchscreen at 0x10; a typo remains possible.

touch input and suspend/resume. The native upstream patch has not yet
undergone a full kernel DTB build or dtbs_check.

Validation: Linux 7.2.4 plus the equivalent local DT overlay, physical
---
Changes in v3:
- Add the Fixes tag for the commit that introduced the incorrect address.
- Link to v2: https://patch.msgid.link/20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr

Changes in v2:
- Drop the testing details from the commit message as requested.
- Link to v1: https://patch.msgid.link/20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
index 75e10d97c..0cf5716cd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
@@ -25,9 +25,10 @@ &gpu_zap_shader {
 };
 
 &i2c8 {
-	touchscreen@10 {
+	/* LXST2021 */
+	touchscreen@9 {
 		compatible = "hid-over-i2c";
-		reg = <0x10>;
+		reg = <0x09>;
 
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;

---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260914-dell7441-touchscreen-6b6201348ab6

Best regards,
--  
Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>


