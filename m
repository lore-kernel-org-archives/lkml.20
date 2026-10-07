Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60844D17BF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392374; cv=none; b=Jufr1AJFnF5jVL0HBQvAq187tMAally6LrbFyofpX3T3RoD//uLIO3BQ0aalMuCkBX1yjRlzUxM0g5Nc8MlOYsbYd0MIvK8JmjrCcGuE4pZW5AX9FC/TzDaZ9NMKEKZdJUxQmOtdx81nHNRlG8XQGKlV8i5kDNuB1yT0ZRpbL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392374; c=relaxed/simple;
	bh=YEKjxa0mNyCMsHdPEU3NsdOvxeYddiBDFxsW6WPNwdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvSjizowedREYrIm7yl6ABY8bUEV+/Dy1eWZ4DbYhjCJ6fWu96DrtDMcDyh6REJKGpYDSvE4gH0N5cDmUSr2ZXEo2xjn4qJPAM88X4yKTNpI4jbXiVDIDFb0TDRPdWirxu36iPepf7/f8p7FazatDJZFc61FFn40PHBlxIZ3ZN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJmsSE21; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJmsSE21"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a17baef589so15314545e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392371; x=1791997171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VgGYjJHqBbE7sDJrXSlB56VBshAv0VupAJsWriXDtU=;
        b=EJmsSE211+Inx+TiNFYe3evuU8y1sT655n1+s1PDUPjiDruabGsrLdS7f0pNvl+RBa
         tqy+nh3o0XoD3WjEMsAM19XQMlm7VLqq7swruAJD09gpt8nOK3AuVWz/OJgpyz8ojVA4
         cQcyJr4HuF7a4ffF+ci/yLPGX4L0wYiLnmD9hLFYvUGeTHS2bg5V8EhxGL4t7oB/CNdg
         WQP230JKqjlEEt1bB6b/sZVS9XJWcFEEURDEffkniMAlIe2TjYQSUzp3rvi0EuTSYbvy
         AK40Z9o+tOB7bUKQ1TPOs211Q0voxzxkWK/k/Swd7Sp2pWlkC2rMK7N0zeMeBUllC1Ch
         qdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392371; x=1791997171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VgGYjJHqBbE7sDJrXSlB56VBshAv0VupAJsWriXDtU=;
        b=A6CGXIkWZQ7psCXbAczlLgLlotnkv0aqtpbectEwAJV/+Mp/4tldW0O+8VFvpPgET7
         p26yP3aAjP33LCK7oF3nvYs6opH+VXgF/nwCBRKNpY5Z1QD1Vx0XzIn6Rt7eXcwIRqgl
         iHNKg4WVyCGgG7gC/fXEJeKIREsHgAj4bMq3pGmu+YIxHnPN1RTlgWfth+gWB7WsSrc6
         iEz3KdUn8nXxoRV/XrSqmoX1g0Rc7wi9SccORVDrWDexvpBAqc5xoN1xzcNJ+AajSFzg
         plIAJhSApFTOwPWyte/A66hOy6FcUv57R9+ssIRLM+FobOgTaH18Vn4hHwlUhMF/Fgtp
         vZgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZtwBh3W3yxcH/JNEPMnMclCmk774rnvprNlgzEjKEYphDoHpoA2OYakVVmVMEuoCmGSblqYFY7VIpYq8=@vger.kernel.org
X-Gm-Message-State: AFuF++lY11C3zVFxWSDvn4EdVog+JFiRL6rQ/Uk01ggjTD3DQ+N8ds0m
	YBwRWYb8FlKS+5C9VcyNTT+B9C3WBGHxbVf1N2B2pTpb6iJ0oLbc/YC8
X-Gm-Gg: AYBFou2OeqEnGYEYDPCmeseffe/cgKPih7sQl1IydxbkwdVmFp8EFo2NOEwtLNL4Lre
	wEiB7D5uG3FYLWpVHv0bRtczMRuKsEvSCN5pGKKgrgHmnDIokLEBZZf9O71vi3iPOWCJuF6KI90
	7BluClrG6w5kDE+NJOXElooaeFBDymGKl7k6Bnq5syArqw9EBATg8O9yR4FwZk4q3pKpkhEDFBg
	VghCNN/DYFltV6cihhyo03FAyTV/xd7/uABK0WJJ7cdj1q4sdV176aHz3V/b0tfscKhxot+ze9R
	8zToJ79ReRyLu+gSxlLy+bFdzsy7eVEXQHTN1h1DdFoTsm/6a9C5dmb3DOpChk6W2V8+0OM7yl5
	Kts5HFVMNFarA4ocGfdAjFYpsFnrT05aMq8JodUSOpDe4svPhF020onm19Rq4VXQ6Dg8uMHiA2A
	VMGjS3W4x8ginObappXJAV0OekfhojRyAuzqCSaYUHHTAnV5t6Q/5X+FvHHcBk2b2tl61MWEtnA
	qCejAmv9cvylL9FeQOAYwaWBEY=
X-Received: by 2002:a05:600c:1551:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18043debcmr44973795e9.10.1791392370783;
        Wed, 07 Oct 2026 09:59:30 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:30 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:22 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
Change the prefix of the board dts to reflect that.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                                       | 2 +-
 ...5018-tplink-archer-ax55-v1.dts => ipq0518-tplink-archer-ax55-v1.dts} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..76f414ff98eb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,8 +30,8 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq0518-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq0518-tplink-archer-ax55-v1.dts
similarity index 100%
rename from arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
rename to arch/arm64/boot/dts/qcom/ipq0518-tplink-archer-ax55-v1.dts

-- 
2.55.0

