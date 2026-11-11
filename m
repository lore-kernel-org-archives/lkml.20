Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360444;
	b=ibvoARQvcv8vqUvEq1jUBOLLhA3L3uEYDnkDp48txOEv3GlsqvNdkfzO8/cgi+q7cPuI
	 t02shvlwTpVzGBvVn5M1TyVQn4+mKmVTr+pdHtcV/39ij7wWYsRAMm1EFSQPMz1W71RlE
	 z483skOrdRF7+UcMXuKhUMGvYH3SlYhrndnoPhdqkU085NP/avICRCRfMMpYv6+yzmgsZ
	 c8XjYACntWtwEdNk/liaCLfY+wSfUDAqYtfY8bVEoQeFLvqWbffVfvs4SmcOX9qZGUu3X
	 oEuLIqi1EMLtR4bXkzj0Vf9AIUWx4/JFXXZFxAvQ87d3Vi4PFni/lYqb7NG1s9KCc6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
	b=r7/ISRsKbUyjl+KXJZL+YZrEWyMfwKslHHMR4ewdhBrScb7w8OwmYUw8wqI9uC+Fj8K2
	 MJLgp0IXbOGWc1Pws3OAnq+/yRmrPBYy9Ge+QrzEdcbHPL0UrAFtkOVCenWVa1SNyw2RW
	 OM81VGQkcq6BEpklukEazrMG14Bmt5HnljosVRjuXUM5hY3f0V/rsEKi/GWiPntoY7KA4
	 YUVUtRzWIlPAWpRhgPNzaQwzo5muMZ1qTp+BktkHM/gGCG3yTEX+WFRMjlskpOE86ord4
	 afsDKP9xftNd9bl9pPIrOHS4bHYMmipX0OGJF4rEXzt8BmvLmr9lofx+Zr8/BZJwkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7F606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D7F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f6295304dso3518251eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360443; x=1794965243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
        b=d8CQPpb5ovdJUQVm7ZD4I3gS0Sn0IwBuhoAmmezBn5uXrBXbWjSpiAa1Ui0qIoKEZl
         IrRl8TmAd5ybbUALAMgSKOOwjt13MFFjJ8pwW/sGOIaxoQVRdWZfBUMolGtSlii0lJiA
         YRGGUMRyEPHsya6l821tzyzNKveppHHauLsXOe0o+KrMhmk8mkfeQmZx7OEhoxsifpCT
         Eyw3z6hI4eGYfJGBwMC9omUQJe4ZTwv1SRtRtcHek139Ky/viE8NX4q43sMTRxeOxYx3
         TOSXAi8i1ICOOoWDzozHDjdaestzqbc0GjbaffSvzlcKxv4qZPzAG8QhfBsvb5R6c9+m
         didQ==
X-Forwarded-Encrypted: i=1; AL+hErG0+hYIFJIus2EWXGYzXWFu9HfPPxwy5CJLWuWiGOO6Ka6c7zee09q0+Q5pUpx6hV7NoTlbxkXAUBRvkjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PQ2TB4Tbx+P9pmx0GNPwPWZ37kdYoMfvswVcNIQzHevWfp0kP
	d5Y/47Mmsga7WB0ytM/iAWJnq5bcwBnfVTdwIIi6UkudNo5iEUN2D1hx
X-Gm-Gg: AYBFou14rLVCwcFB2AsiVl9+yo/JHa6BDV8Yy8o7RyOVNvTT11riKZxicqy9pui+od8
	QTdFvw1X0+GB/4gp3T12hrado/TONpEWl8HIzS4EI++uePFPsfLa+7UB+5fj2qWdbFk0/rFDgXc
	QPuy5l5zmrXzo/AN4KbIi+wYB+AcUYwiUmDGtCJpgThwopZ4ZDWwkYtD/tPVFZpAMLW1nidOExv
	iTPnpReGvqEYmnlyKrTY6QSyFoTr53Sxpj8t+sjHnHBX8OtJoLQ6Vp2u4hZTF2oh7RP2HvMy7EW
	dLj09MHBTuPZ/RH6TU98MCU78nY0h/teySJ178+jqP8G9hWYRV1xc8Qxj2gpt2TwfN1qWbhCi+u
	tg1hPa0hNlr3Auo3YNQngvPcFMsScV79kh1Ec/7oOvAMEBDQzTIz+xbZSrRMdijMOuuOuJAY2ff
	ZwgeWh96itpOPQyn6RQgzN3fMrr3+MoA1HDR2+GUQscToz595QGbGZ5zDkSZpfxtWI+WK2EK3ZQ
	CkdZxCxRW78929W2ALZ1Frqd27HJcUKhY5/Bu8nxZGD/tS5bHTaGx3Z3n6wQL8AfK1Wqpj2TiSV
	V6udUoTAjT+/Q8lAGUUAE9kjkJET9T0xlc/msx9Ax6btncwi8wFf+SF5LrlpMmUTvEmKjUJ5
X-Received: by 2002:a05:693c:8219:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3768385dee6mr1611656eec.5.1794360442766;
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm16548467eec.22.2026.11.10.17.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Message-ID: <9988b8c2-547e-405a-9c76-a4e6a59c7dbb@andrewgigena.dev>
Date: Wed, 11 Nov 2026 01:27:15 +0000
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
Subject: Re: [PATCH v3 5/7] media: qcom: camss: Add support for SM8150
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
 <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> Drop csiphy_res_sm8150[], and pull this:
>
> * https://lore.kernel.org/all/20261026224957.1115370-4-vz@kernel.org/

Done in v4: csiphy_res_sm8150[] is gone and sm8150_resources.csiphy_res
is NULL, so SM8150 goes through the PHY-API path and clocks, regulators,
registers and interrupts are owned by the dedicated CSI2 PHY driver.

I folded your change into this patch instead of carrying it as a
separate commit, and credited you with

  Co-developed-by: Vladimir Zapolskiy <vz@kernel.org>
  Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

ahead of my own Signed-off-by, plus a line in the changelog saying the
fallback comes from your patch. If you would rather have it as a
separate commit, or want the attribution worded differently, tell me and
I will adjust before resending. I am not enterely sure if this is the
correct way to cherry-pick commits since this is my first kernel contribution.


Best regards,
Andrew
