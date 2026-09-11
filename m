Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB2B46A608;
	Fri, 11 Sep 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133233; cv=none; b=iZNBtAUcT1lp6IeXmc7WQC8P1QL+lsoe4HFYESwukKMl+FSwd+2+BMJePRQvdiXXxz5pnAb0QkdZY3KZstqvXRCuZggN4MDnu4RbHUkFk4fpD246B25pFE/o7IUelh9pRua5m5jBRxzw62oozc904fyEB5HlVhiFZVR2XhQvZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133233; c=relaxed/simple;
	bh=cW6PKn+6+4e7/lSR61GmFodOnPolMv/AkFrVOlhTUnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K4rLwTJn7AjatWoTVp8AGXHResmpVUv559hYEAhhqUPodpPcd7ExzwBPillRNWFQCILbDZ/LeWpaIYgW5nq+/h4AXNaITuEUFY1sO9WS2WzDNP7GLPguICiUQZHoB4KurJWod+vCr9cypHvHrbXqrexfw+laf2DMjv9a5Yn7I2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nufB1YKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nufB1YKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8461F000FF;
	Fri, 11 Sep 2026 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133232;
	bh=Kk+Jgg2uXnvP7keYH4LDRdrvoJhsl3CdguN650y+ouQ=;
	h=From:Date:Subject:To:Cc;
	b=nufB1YKePIOX6Avm7I8fn8kblBc6cNy4wpuSpNRXHyuoFTMqHkGg1eO1xln3rY/Pq
	 963DpyPCqdyhi6X2H6buY9nWAd/67RDLwMd+xsH1BuaGuPjyXV9tpkoa3Tu4KQ5Ai2
	 Q3/663qn2IcxpZSdmu0vc9DXeedb4y8yWRDRE//xi/vLQhlx2fkw/csUg3luRj5/d7
	 +5PPQIyD7sWzg4NingmWv/aYTtKZitA27KO/iBV2CUsVW4ar2PsuVYzu8yfZSGtTgp
	 ZydIVwdlzVa0ilzVEpY7lDWITsYKH0eO/fijbPSrjIMxjCl/pg3/yMui8Vg2ziXXWT
	 8LGUDrKL+e12Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 11 Sep 2026 15:27:03 +0200
Subject: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Remove
 RTC-through-EFIvars
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWRtIYqnRq0gJ6WTUEWzKJA1C6
 d2Nunzw+RtkEqYMl24DocqZ09xgDh3gI8x3UhybwWo76LMxqqSFUQm9UiW/0o1rEC8FfTCDckc
 X4wltb5yGtlikBe/f/jr+ndfpSVi+T9j3DwbL20OAAAAA
X-Change-ID: 20260911-topic-remove_uefivar_rtc_a16-838dd7c24180
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Greg Ociepka <greg@ferrisoft.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789133228; l=1192;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2B9T8QtBzpmUol37jsog1kgKNP3vTSpNz3HhR+qMRP4=;
 b=z8bXE8jEx7KRO/PgYr+rrjGE0v+3/dRcBF9yFVbnBBU4IHFfrtnl/Uv2XbGTj0ZTT1YEjQzAT
 IfXaGhPpBa/DveMLU0XHBPGU2NmZvoWE+ANk3075vkPxCQBRy4UIBOr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This machine, unlike older Snapdragon laptops, doesn't feature an EFI
variable to denote the system time. Remove the property that suggests
it does.

Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
Reported-by: Greg Ociepka <greg@ferrisoft.com>
Closes: https://lore.kernel.org/linux-arm-msm/20260821181148.1642208-1-greg@ferrisoft.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 939e1a927a79..82b9fb237c6a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -861,7 +861,6 @@ nvme_reg_en: nvme-reg-en-state {
 };
 
 &pmk8850_rtc {
-	qcom,uefi-rtc-info;
 	qcom,no-alarm;
 };
 

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-topic-remove_uefivar_rtc_a16-838dd7c24180

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

