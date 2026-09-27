Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAF3350298;
	Sun, 27 Sep 2026 04:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790484178; cv=none; b=PBfNFVL4hHLLLBwDbS7jrLGjWyL/FN+4fdubIIPWHOlqzcFZ8O5t85aSF4vS0CRhhiqZhu4rVkAsdAajFKjynz17YUgVWePqr2N6vTaY2Ezlqo7Xl7nvqMDM7JQ9x2Ihua17yU3XdoaiVGcDpw2CuncLR5491hA+rvLZzcVjdFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790484178; c=relaxed/simple;
	bh=ASiXaQu8+yanGWTTKywMV7+FoCiKv/sW41WRXNkKl0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N21wPF7tntlGE8zljp/7n261E+yZAe8KJO2nnAMRV6yfheIPv0ASdoJOJ3vFcdWqwLTt58uZPy1H+LnvfNF8OqMoXAxHkGB4iqvzUJFNNEBH9qkdcA/wSybHKp6vopk5+CuWuZWoyLeT//FgvSV0eLfoULJAPrwQXS7cpIzF1PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFipiwzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFipiwzn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2027CC2BCB3;
	Sun, 27 Sep 2026 04:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790484178;
	bh=ASiXaQu8+yanGWTTKywMV7+FoCiKv/sW41WRXNkKl0c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZFipiwzn7JqrhDz/7I3wrsc+BxAzBWdA9ac3khUR8yZ2NX3H4QaXQuORn7a/JFQK6
	 Na2FxXhCSUp6nFCy0S0IzEdpSk2keHFE/lg9ebqJR1ldXunCmaC6/rzr4a8NbvekZK
	 fB9WH6JID9VAA8jWsb5uMJUc2nrvin+2WPIxc+UugA9exYLrgaN+ntI+OqEC3mT7xG
	 ibpVd61IQP95wKgw4fhq8WZSLfvuRDvqS1VY7cW0PWs6kyK9AKN/QaHeTjVy0D8BQ4
	 0r6N8zHOAwSsfsSvDIlgB1sRJGb7/WnVk8Kg4etucFF24+2kDpTSUbiTlLwzlQc63B
	 +Cm9ev098Pkuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B36C9832F;
	Sun, 27 Sep 2026 04:42:57 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 27 Sep 2026 08:42:56 +0400
Subject: [PATCH] arm64: dts: qcom: ipq5018: add label to PCIe1 port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-ipq5018-pcie1-label-v1-1-41f7d42f9a7b@outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQqayuEi1MxxqIMoUIwrsnL
 d/i/xcSRaYEY/VCpJsTn0eBrCuwmzlWQnbFoITqxKA0crhaIXsMlknibhba0WnXiNYar3oPpQy
 RPD//dZpz/gASTcSSZQAAAA==
X-Change-ID: 20260927-ipq5018-pcie1-label-d7d405caf28f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790484176; l=1071;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=HNZl3Aso7KY3/rmD1u9y6FFgvwtYVcoDQZoiHKmM2AM=;
 b=ikHgmUVE3MQ8T0uEHdvr3Kvn0mVtTALISk/rbJhf/noKsJdYIT+aTLveg+c7YpC0WCtwDBT3Y
 Cw0+cUSG4rRCfBAzuhSK2CIXSPiLW/giSbVojs0RGj03x5CmcRoQlSI
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Commit a95758e9718a ("arm64: dts: qcom: ipq5018: move PCIe phys and
PERST# to port node") added a label to the PCIe0 port node but not to
that of PCIe1. Boards that have a device connected over PCIe1 need to
reference the port node in the board dts files, so add a label for it.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index fe1ed240de59..2f3bcfa888a9 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -838,7 +838,7 @@ pcie1: pcie@80000000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260927-ipq5018-pcie1-label-d7d405caf28f

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


