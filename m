Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC403E00B5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951754; cv=none; b=bUcH3WLr6cqgBEJJVej8QJUAWU92abxsc893zmmwBp3iE7cagSmJcDciRPKynGfBqRX8Fi1Bxn0RHZE+37J/QufGgLCIT4pXxPgah9ScbQDsrxfZZPV+RzHejRZKw6a48QEl88EGzjlRf4hDKaShTcln2sMVrvroSgT5vNnBFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951754; c=relaxed/simple;
	bh=sEskR/3ExQTLHI71NqLlpzs/JE6M5OOwwHG9YZNTZAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zgahh2yVJC1Jd3HcgtqL07nJ53DW0zC4wKPbu/obH+YxxBKIPIGXUNX4HzjJw9Apmvu2bapGym5Hwgdmv9nOTHvN1+j/jBWDNebxlK3LItog/tD34wHOK7FwBOkwrs7TMCB7FoWuxZyfJvPtmMg2XTovynJE4RxidWaCtPrfG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OM7fjLjt; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OM7fjLjt"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso12166759a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951750; x=1791556550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnnaK1bgjoHXdx4TLwgBNAZANL+ZBN5rHCxr30tdrTw=;
        b=OM7fjLjthjUwEd0GpjeI8BQRE7H8dKViyY9tMVjlOk3mh4SRm1wpryj8WyanqV+qeX
         bc2PbvW09240D6r9g+3PRl3XtqISSfiCWEhTZ9Xdk5NU2C4KPil/aUP/NgzIypJw0eSt
         ybZsGUurjdNY6uXbz/+sU2EJVKu8Aci92SWB0+XKUZh+yw9fh0hsFi76LsyoJEY0QmOp
         gYANqf/kmpL6bpm22VIKnMFmlfk8vYTjYwaXjSEydMEzH6ows7TgL1yzGo7ZijNPSxzQ
         06PQxgreAxbPjVa80MvNyldbr+hB9vG5sjTifjO5fFiHF74F3BJvnejqLnEGYdz8XNGq
         BtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951750; x=1791556550;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnnaK1bgjoHXdx4TLwgBNAZANL+ZBN5rHCxr30tdrTw=;
        b=axpGhKp0q3SY5mr0LvARXUsDU6n1K3h63RI52BUWugJKh9Vm9C9eHz96atJfZtKT16
         KwufpV0bV3IKm6bMzfEqFR+VqOGbtV64uliDOVG4Q+96STfDVNdgBm/gH8YRa3RwbJcS
         2nX+bhP+SzZAc8pQsQYwV9h3jWjsESDrtPoRwStqMQuO2w2hVFFozEajtT8RAo6gx32h
         qLB94ofQrI4DomuJpi+bOYvZMEpVycnAiu+dh4LQ1kefrUhzZ7i3qZAjKUdkO+Srm313
         9xe9hBtUDy2110aTmVWj8i3vGmxU/9APWUTzaiXPUZ0JnYKid9SBAQegDJNYDkUUuGmo
         Z16A==
X-Forwarded-Encrypted: i=1; AKwUvBzpnTCtmXx4+qm3tjU6gJHTWhWzBqv5QhBB3Kbo+IqO5E0f18Lz7L3NvP75guc3HuGLYAeNT6fhw1aWAeo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJP8zq5uvAxf3beRJXthPjLO9WlFSl8yA+4UdXC2mmBbm82AA6
	jlqk3rL/b9/JVDvAKGJomIHfNxjma9G5BVZ1dVcI1dP7+LAFRTlVkAMV4SVJNdG3ExM=
X-Gm-Gg: AYBFou2pnydSpU2A+3+7U9tTNVngxd2iXpMQXN9Ap0XapGAPsqXP4mHC3Zbr9VuR9bE
	aLG3Z4NZ0DKgFAg8CuzFNRBZGoDxQfZemHaHhnnTxudkL0DMgFwgo3xEVg1TQEuzqgx57L6G0qc
	EGWNWus+cZeIJ5Up4sZ9ZVmB6uAlGsDGGpOiD1qe8kcqOGeGEBY/mg6m/HhHk1IFW2+FCu3/aF4
	gbeQTbem9H0/2diH6fUPKkLldY7gg1p+RvDoQ9KVtszviXJeuJT2L7YKePUBkuCssio0IHSzdQL
	eRRltjUZtWc2Ej5ZgXs5OiwPLSJ0/pyovr0yLrCUDiuBfMu/dCd2Op8nQ/wo/XEfdaOO9a8a6Km
	5gxHG71oHkS9Z4I4FAyyItEK+Mj+ZSMIXne17E9Dodmt81Q98UnBe1+stKEWx2q80VkfyJPWoCX
	nLKZaYtUQfQLZoyj8u06jky1oLzWdcHr0h5PoHF6cdUK4/U7kvKY1eFEgr8yqAEGPJMtB5ELosa
	1HQjoekNbER
X-Received: by 2002:a05:6402:254b:b0:6aa:fac1:3bff with SMTP id 4fb4d7f45d1cf-6af9e357989mr2066365a12.32.1790951749730;
        Fri, 02 Oct 2026 07:35:49 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.210.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d873682sm929326a12.10.2026.10.02.07.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:35:49 -0700 (PDT)
Message-ID: <45d79c84-cc76-4bee-835d-ed11ce07bf2f@linaro.org>
Date: Fri, 2 Oct 2026 15:35:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/15] media: qcom: camss: vfe: Add support for VFE
 1190
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-6-cbbb42e534ef@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260923-hawi-maili-camss-v1-6-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 12:02, Nihal Kumar Gupta wrote:
> drivers/media/platform/qcom/camss/camss-vfe-gen4.c

So I'd like to completely drop the genX.c stuff it is not descriptive.

For example:


diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c 
b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index 93d16b0951e99..f2001140ead12 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -12,13 +12,43 @@
  #include "camss.h"
  #include "camss-vfe.h"

-#define BUS_REG_BASE                   (vfe_is_lite(vfe) ? 0x200 : 0xC00)
+#define IS_VFE_690(vfe) \
+           (vfe->camss->res->version == CAMSS_8775P)
+
+#define BUS_REG_BASE_690 \
+           (vfe_is_lite(vfe) ? 0x480 : 0x400)
+#define BUS_REG_BASE_780 \
+           (vfe_is_lite(vfe) ? 0x200 : 0xC00)
+#define BUS_REG_BASE \
+           (IS_VFE_690(vfe) ? BUS_REG_BASE_690 : BUS_REG_BASE_780)
+
+#define VFE_TOP_CORE_CFG (0x24)
+#define VFE_DISABLE_DSCALING_DS4  BIT(21)
+#define VFE_DISABLE_DSCALING_DS16 BIT(22)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL_690 (BUS_REG_BASE + 0xFC)
+#define VFE_BUS_WM_TEST_BUS_CTRL_780 (BUS_REG_BASE + 0xDC)
+#define VFE_BUS_WM_TEST_BUS_CTRL \
+           (IS_VFE_690(vfe) ? VFE_BUS_WM_TEST_BUS_CTRL_690 \
+            : VFE_BUS_WM_TEST_BUS_CTRL_780)
+/*
+ * Bus client mapping:
+ *
+ * Full VFE:
+ * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
+ * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
+ *
+ * VFE LITE:
+ * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
+ * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
+ */
+#define RDI_WM_690(n)  ((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
+#define RDI_WM_780(n)  ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+#define RDI_WM(n)      (IS_VFE_690(vfe) ? RDI_WM_690(n) : RDI_WM_780(n))

In other words VFE 690 and VFE 780/880 don't share the same write-master 
index.

So they aren't the same silicon.

I'll go and find the Kaanapali thread but the feedback here will apply 
there.

Name the files per their silicon version not some genX.c moniker, please.

It _looks_ like 690 and 780 will need to be separated so, I'd like to 
move away from this misleading genX notation - it may mean things to 
qcom but I feel we are burying inappropriate hacks inside of convenient 
gen files.

---
bod
