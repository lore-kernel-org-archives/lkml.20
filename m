Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744890;
	b=1652mBidFJ4PF9ImXvW93S3vmxCxHTZtkAMzp4z9vcggkDMyF847lvFkxNHSOpcCBBcn
	 0NDg3slLSxV1r0o1mItypszHgKNtY5R1pJCZvzUKVVfqsAIxZq4+KvLB6ny5SLDMSu1ph
	 RtjBSRbefXBmHcSWdMwPwQHiLipMrwpGmuk01MU/FvLW9Q0E6uZmHxm7T53IoMxRU1XvF
	 fT+e6qKpqb9XyIAH2lqXRnZygPS7RkP0gtH5vPu6HyIV8V6BafPr+6gvPOtj1vYCayItY
	 r9lhCCzOlYOnetd7hqnxyxzmWO0Y4IxIn8bL+juWmZNI6W+YzSdvbhEej7DK+cQvQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
	b=Ikuao800AFAYfebYehhxmj0ArQMrolyuMKIDMnwFM3sqzer/WejF8DORQdnmdlWLNZB0
	 +E2E8aNYAODSMY/symmb7uBkbcQcNyyq72WTFEBSYOLqB7GtOyc8wMVzn0CxRZe3mb59E
	 CnrTAKgSDZvvHiVdoUYeRaE2tjE0zuV05aDZU3PlijB0jJDwzXK7FIRnFb29OGIgQ1AiF
	 IaUorVpPVYCEEN7xj5QKXklqMZyLTMNtzZCCbU+tkwRIdY7a37xBQ0Yagt9yF4Rszngum
	 Io3Ji5hRj+giyt3KGID+KeXc0yVz5FNjmWvXJQfGEetUaTZ2UjvyGbp3CMx0QcGzJUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0776606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0776606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so13107645e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744888; x=1795349688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=eJL4FmsljjmbthQTxR+1os6ehdA7HrXEazEQbHBtVieR0VPO2U/151cbAENNQpoh6i
         ghPT2cNYVo/lKqchdC0hTr2bHtSoCLidj7k1RSNtzrGC2aEcv0oQykcRlSDYypHCGxWV
         oN9107GYTlhdT2MgiIYtt8UXLvULIASeEkedrMlyX2xy2b8jmEPafnLnSNvUY5lvOeTo
         NXPWb6KvUlNbVtI1IKG8AeHSgzyPBKF3JHGZ8q3aDJQRXenTqEfz5BJ3U/dokIfbdvcf
         Slsbh7fCBGjSc7Gf77SUlg4j2wDW8AntcikkdGFAmrFijCPF0/nFgH21Qncq2ebCqEGD
         f3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744888; x=1795349688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=sDg59DVoHpwWgFXbve2IqX500bxM18oRFHMEI/oHwiPZez7JRS6xTi+4tMiNb+yLg8
         fRbHrYUyzf3k5Zba0SQeYPe8tv8vHsi2O6RpIARCy8tvcugGWXryxOtYrnVMog3nFA2T
         VPvktLre+zyqwv7i13e6ZlxhGM2CjFHGoPQ+5l/RPVSRWqKC1SaupKf9wrKLuSW3oTTI
         xfsDrgimVExSTgQRcDgFzm4gB8HNm8fsn2hgMEGFP7azZpqj6mhkFIP5X6n0pm5+KAJQ
         55tBULFjWFj6C9tIisV5IEyqsLDkbKW+ibRI7sKR1JMgi5aEl/IyiiUmenNhqRgsH6e4
         /4eg==
X-Forwarded-Encrypted: i=1; AL+hErE0nPWu/9p5v4HL8utwIUjyK/c89Q0ZPgzExxWR5uUWADuCv1F9/OoLXCzOzSDVQUeEz3AWXEHbKAg3E78=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+NHUrVhHHK+dt7hPUsPOJhe9ZhaYhrgF2lzsqUZX3gB24zG+
	aNdRbhqwhMEt1g3fBN5qoDCSj7rjwE2o+AgRzihsl72TBgf8CVuEWe4eg9aiTcF0Ksw=
X-Gm-Gg: AYBFou1NTDZTmT951K2qWrdRSOq7aHLB1zFcCF13f/ZPEj1pLYUETeUWbSkCbEWxBnO
	6qfv1FJgXcgk1Y7uhucGD28ddNOxNkMeHwktBtcG00BAlZuV3vMhQ0o/0fNw+x6Js92SODb5M1x
	CYLnKFCocKZSxdf7nwz6LEo9Y8yYy4iMACkP7EeXarYS/KZ1SL7gPncVYswCvaKlu3luX3S/Eku
	iVzBP/pSJ6ShyUJADuxBnf3hYwgmMNbOwHCyLFEQeJNFEUf8w7D/2mIJCouUNKJil1B05mhlS88
	JqzodSJgpsY2uskzYHm16L71AM5B2VRd3q+KbDlaQFYL3uHM3hn8aILrRu+TIF7H7MQ3EGBAvRO
	Fq3LGxrqniJfoDx4MEis3y4BMHXlirSbVwHh9g+aCDdDGSfOGA9tx07vJNjNIHLdOflnyAzRVYc
	KudT8oYQ0clveWCD7l5iB6X5lxIonIc0Cxx+8JTA9hZbO/t58P8G7IGHxtMCxKqH8CYptSXaVqN
	99QOCxCBjQtzMVluiEQLRs+5qPebDV6lVMm6nsc2vVRAPQYhu9Zt8EkpAH75cb+lJuk2s+EdzQT
	YQ0mO2CjfU8CtUanViYS0trvZGhxuPa583EVPbgiel4T
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr125712795e9.17.1794744888294;
        Sun, 15 Nov 2026 04:14:48 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm10124007f8f.13.2026.11.15.04.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:14:47 -0800 (PST)
Message-ID: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Date: Sun, 15 Nov 2026 12:14:44 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
> +				__csid_addr_update(csid, i);
> +				__csid_reg_update(csid, i);
> +			}

Why does this run twice for the same index ?

---
bod
