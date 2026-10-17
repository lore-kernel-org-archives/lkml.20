Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012333B2FCA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259553; cv=none; b=tkzAzWTnhpGHz77Jn7cPkl9HurlXMP5cEMEFrTVPOH7B+xOSQIvyme2c5/QHbtAEmdPuceBxkwZJ7SNDHSdwLYifYR+rDIJdHIAKGjc/m+z93BgyMq6aCtjL2+wUrnfZyOXktLA0rWdThbs6XH5JJJk7NTKcoiXWekz38BDj4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259553; c=relaxed/simple;
	bh=r+ZyeqRq4hr1l/v11neFzMiPd1gUhiZKSKrRDT5o3tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvuE4KTWRdeY//Nxay2WAsITGr50Ckv1GzPfAbWVgQDn5WH8YjPUm2DVfWIikCjGx2rhIS1WJG15PO16hwe4BRnu5LEbHYBJBNRNy8oWLwT6fnMZi0GByQ+4eBiYy4mzGg6BciBrVfaRT77kzRc3UnNfApGsVnihMTh0QAevZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiurdITI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiurdITI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d870d54so471186f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259550; x=1792864350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69tZwWkK9tX5KcNiATY2wgE5iwPkgXeDVM/0B88knb0=;
        b=WiurdITIDgXb5J3TPDoaXrL2JQe/bj5O3iS0gpWzkEuXohLp6w2BpE9T8W4cS+Lk8o
         nCl7FMKV6ECwGjPvEx+4Mglu4f0Yh5FuNtZdWC/4p4G26Vthb+sZyU14uug/mE6brq7Y
         X8ejWy9tV8UnTRB84DbRIS5V8nkbP6wSgYOPuEurmEd+X3ElnzDIDYYRcYsVsoDALdJJ
         qJT69MVScqqeB5+QXfxihrRkBWCDnYsWqF2NmthfeNotlKeoDs2eRZ7rI33DUe0n7mim
         C8J+gvbzIErQgPBrQL+ufTtra3i3dt5vuibb2FTba+IHHGqcpxS9Qhzwn7eu3MxXoIYV
         /kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259550; x=1792864350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69tZwWkK9tX5KcNiATY2wgE5iwPkgXeDVM/0B88knb0=;
        b=AhjvrTDBA2Tp4XQBvT+IHkvmFvaCjo0+K4Zav9bM8OcrLMYH9M/ek9eNnBN/jon/rY
         v2VjLbnon6dbTPWmi+LlE/lmE1y6NHf+ZZqG6KCNUSoDWzbs46Yfpf+DHEY+M38LJujV
         2gceoS3HU4NFEnuJQ3lmyQY/hacwrwu1Qn4sBjmy3gzEr2c4+soO1DiNjKJlrOC6iwSr
         rn0poXa9giIVKnOAysmHdBs/8wRTjY0v89GQ4zsZfcQZTfIbgNYpJ1gi+DmmCijL7Slb
         6Rv7ZUzutGPkCqd2ukcrLUFDmXTBQU3sLtkabWoNlFfvcsgcM2kxZQ38cB6I9xPXJah/
         25ug==
X-Forwarded-Encrypted: i=1; AKwUvBynkm3b4E6EmVPxTp4qA9kfFKoWehRxSHkWUUs7DjZBvjCbUk6C2/HB7w/fZvLaiBfwM3S+aSJH87ppi6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcCD61Bheaw/hQnIPAjktl7IwPZtKvN4zt2Y7+v/16liRtqlwB
	4f9ANVM94re5uUiv3MOmIzK8oPT7+o/ZAMTO/5xUMjewATtbtDqGAlSw
X-Gm-Gg: AYBFou0nQ2E0coaDxFd0d0ijaHtGyHDLDErGcaFaf9OakvcID87zE5bsXevvF3ID3lL
	IiO2fG7nQhOKMPFY4JSs8Y9Q0EINA3vg7BXHXE3PKNWn3KQqr4uNnmJz0BAQT1Wnxh/uG/7a0Gu
	1F8bokjdwNa/NBA7JKvR9MmXmC9JGg+ROitqt7qCsTv+TztUV2I6obs9rUogzYAcYA8x3F30BLZ
	pXfmhuNJjfl/o5FDvIVphVoD5ZaBMhpvzpsGz8G/1PS46KEaVgb9gA1XTSHPkf4GoXPyPQMpilM
	Kw/36ZOMs1RS2gc2ChRsb4ufV1KwIdwcShsvZyiCP/MUKYU1c2qsbjrTWmDekvX54FMITZRUfr5
	faEh+NlxsGM9lODMA1TdtJlEVVPwM8WzYYp4lSVxUzI3iQCt2KJaTiCQI1FXJpVxJEv+LG/IA+s
	kbc2UcSOXCbDwNJIOs+7DyySRh5WKtnT/ACax0rWwHrAq0mqoST8s/87oDao4sYiTRoh4QVAQ6e
	ZJtaisur2BmgJrEeg4AALvunJiOzA==
X-Received: by 2002:a05:600c:8b6f:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4a1d75e37ecmr56865265e9.9.1792259550149;
        Sat, 17 Oct 2026 10:52:30 -0700 (PDT)
Received: from [192.168.1.3] ([148.252.146.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm18263626f8f.16.2026.10.17.10.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:52:28 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 17 Oct 2026 18:52:25 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: x1-denali: Add missing pinctrl for
 eDP HPD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Haipeng Lin <jimmie.lin@gmail.com>, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792259546; l=886;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=r+ZyeqRq4hr1l/v11neFzMiPd1gUhiZKSKrRDT5o3tA=;
 b=ukOzpCkiL1Sx6fO3DAq7gYBVMV0W6zozax1nilINnVPiGHmAwFlbEQaw2YaM9ECjGnfYUQsfT
 18mv0X/6n0sB3758WNmf9yTnXgSgSlnTdfMSvsScEHRYhHjGG6wLCkc
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The Windows ACPI muxes gpio119 to edp0_hot for both panels. Describe
it rather than relying on UEFI.

Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
Signed-off-by: Dale Whinham <daleyo@gmail.com>
Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index e3a53b8930d9..332189839606 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -894,6 +894,9 @@ &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.56.0

