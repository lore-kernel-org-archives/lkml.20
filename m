Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFE44AB1AD;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820286; cv=none; b=SphhscuaeWlWdkn/QE9dd2J4ksvmfRwtnm3sOkmJeQVSQMzz9SzDvlCew7BOJrY0nQZ7XFfad4XAhIhmgIDsWjVn92ZPxYWwHRagaNkO4cYrNv6xY3mUietF2K1i4+n1gXdue1lF9NHAUSvKGvDgZ4FijEj0x3jLUn9AgQkUfLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820286; c=relaxed/simple;
	bh=52V3wq/tnmc5HB1kUd3Mv4ZafuECoOUwr0mQbdCvaf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJ2PVaIPhtvrinkjgn8TWT2zYRGmGiBnDHA1HvjdbKtApWo1BqsTOllZUDLgCIynovlPC2b/5Ha9ucRdRy9laAaDGDrXPF/AAXVZT6fSGhhayBi8oEStuVeGb6FZgUSYoKnkLMsxZDcMZ68sz21PePdBtqZWy5XWBO1ZG+FlFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3qPCc5T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3qPCc5T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BE2AC2BCC7;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791820286;
	bh=52V3wq/tnmc5HB1kUd3Mv4ZafuECoOUwr0mQbdCvaf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n3qPCc5TDwgKv15PEZrLPljcJM4MnGjoKwgBwfkhK/D5cmVVcE0p3XBh4QbidXlUQ
	 jK2AHmsK/B6hVD4iWNEurixHX9Cj/UzN8XxMgxpKKIalj8nnlHLhyr1wMP2Y3GQqqp
	 gXfCHL7+okww1DsPqxh+Bzc05AKpWf9Z5notn5jx4Dea0YSuor5L9r978xsQ/HosYe
	 DuzVW7H/194CcES05PfXfBdAAf+V7RfnMJEvK1btaG6Owni4deH5saH/QPLmUy3DU3
	 AhbAg7Sw13YnFNzqsf4FPbsqszXAtcE8l6iL0rrT4JnYMzsKCnbaoUW1Sqn2fWK0AZ
	 UgaDsDPrF8oaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE66CA9EDD;
	Mon, 12 Oct 2026 15:51:26 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Mon, 12 Oct 2026 17:50:59 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop
 omnibook-x14.dts include
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-2-c859ac395b81@canonical.com>
References: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
In-Reply-To: <20261012-dts-qcom-hp-omnibook-x14-cleanup-v2-0-c859ac395b81@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=wYZi3Ex+jcuLvYp1WrG2Ggo1op8kwvdM5pUYcvKt6HA=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzQH88nC9bXlSpbY6dITBWCBaGw/yv+1WNe4LZ
 3+Te+d1ComJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas0B/AAKCRAP04sJC6ZC
 t1wnEACRm8OMf4PB5mK/A5V3KH60pFadUFHPyKA3im9RW5porxJrnJjBAOxP9Sz1mogMpiovqY2
 lmvDDtt1RkHXMIAWVyVZMuaNO91VOJPVhF0hwN2O3K3W1IFHGb0Bnw6+laFm5pKJ2TkMbyExzP0
 tkPE31s8HGYduMrmmiUiwBba6XFpmWXRoFS1horVHrE+5NAukL/Cj9GvgIxecoLzEiLG0hrC3K1
 PoKkWCgNo3YZAyJ4v48T63G8MDO1rDhE/ehAm5fq7AIM8WEengp7uYiv7a0KwC1pkL4Q3LZ23Mm
 LB12mFLN3eFFaAku5Gcuk8JOqZsHdn3tE4Jot6/mF4ogEpgiF2wwst0rPGJPZ4Id1p6bt+hiy6R
 tFI2KjF7EFEE8E1QXKk72I+qp6hwSf7Z56muLXzI2SqQztpX5pGzPDUgkIYWjWySrbkE86GVVcW
 jUJhhwtvvCZQySf4G36dA+gXfJsQu2tdD9BeT8YWO+3pkZKpzVsj7H4gJ7hJPt2Uz9TVcCRT9eW
 sk5zA3++pGSUQVNkLhzE0pHSqfXn2U5anBC3n9PYs0n55EEddkUHvQ8ErhrZ743kGOkJLe2A18A
 yilmxKpZxa8FtTMMRoObC8xxFOAAZKH+HsHykCqSb8T+xX9NAhwHxW+w+g4ZRbC7JWKSdJG578w
 bSdixhDOT7vtZsQ==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

The EliteBook Ultra G1q is a different product from the OmniBook X14 that
happens to reuse the same mainboard, not a variant of it. As such, it
should not be a child of x1e80100-hp-omnibook-x14 but rather a sibling.
Include the shared base platform dtsi to match the other OmniBook X14s.

Explicitly enable the remoteprocs which is required now that the status is
no longer inherited from x1e80100-hp-omnibook-x14.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
index 0b3b6cb23e1a..9327eaa16b92 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -2,7 +2,8 @@
 
 /dts-v1/;
 
-#include "x1e80100-hp-omnibook-x14.dts"
+#include "hamoa.dtsi"
+#include "x1-hp-omnibook-x14.dtsi"
 
 / {
 	model = "HP EliteBook Ultra G1q";
@@ -16,11 +17,15 @@ &gpu_zap_shader {
 &remoteproc_adsp {
 	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
 			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+
+	status = "okay";
 };
 
 &remoteproc_cdsp {
 	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
 			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+
+	status = "okay";
 };
 
 &sound {

-- 
2.53.0


