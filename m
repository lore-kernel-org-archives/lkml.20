Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060222;
	b=dcW6PJqh9TfxYLWCpySDSD8n08w6Pi0Q+9DtQeYzlbY5e5YY1rr1bcZgHsTyUOiIM+Yd
	 D+oJrpRaU2JJ2+i1Cow1aKp1s1Vnjzj4GIHOcRrsywOvXPDtAQyBUrKOmBHdPO/V24Tg2
	 wJVC9wy5cA88JQQ7AkdtPY8grh/gvS4pYyYorld/9PTny5NtQ2BNgePgnsobZsK6ixrj5
	 6yLBmSremkztBR5DpRTF4AXJtqI7ElpMuswqI8zIKnhvxyrxC743R1i6mlI3kp0CobS1d
	 pxkOXqP1GpE41SMyoBMEWprdTzRe/z2YDs9N9xVGIkOUknp+cFDA2jWPI6xpdkDGWXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
	b=C/3MVZe1Tcz5gcfnXIjbwxsN8kvaQNU9AjY6v68DuLnvoblVVgI2k075yt8TsJbCr6WW
	 HDzosTBCVwJJdN9essdZlvmo+eb31jpXguoF0f9fpspz1bWhg0UV9n+RW/ikX11QxtrDg
	 LItJOSBnPwPNhcCTmr4JFGG66icEFNCx9PuAErWhBnvAaokMA2iz+AX1JO/IRoqaMubOW
	 zbZV1KMBUTXZpJuBun80tDsQEeqrsRk6l6mZ1T3I/01vmrit5SEGDsXy3wQyW700ca0vz
	 PHMH+pk0nzQ9Io/sYUI+PzTHYSy8vxHKYO4keivJAfHCMOfQdtNrkA+6KRr6RiFaSaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDC606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBFDC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49412eb1474so234097f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794060220; x=1794665020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=aP3Lr9ihnVE3AAdM9kPgIOvbXrlJiwClq0X74LQv3Wyb/Z9cppqMs2SyBmMxald4yu
         C7kE8oF6MlLS8Rjc84Pwv5t5NU5WSCXq0krYgU0fcGlOjUC+5jVUjdNcpsbspEjjl9wW
         KaVnSY8HVH3kwuZmvaalyNY9bp6d4g01KFtA6dYmG0sJMS0yVIMMoHhHZvdMld0yGyAm
         3XeXSmAfDvym7JVJkOKRByr8hhBdEnA1vTCsa2TEf/dXLc817ZRkiyMQfWgLXfK1+BG0
         qYVUL/yCfx8SnnmCchwCAoJsqVz9UC9Hsf9I7YOUzO5RHkQuJOZlXW7ydqVg7bdAoSjG
         5gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060220; x=1794665020;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=F2MWERUUjsWWgBp6dL0Qdma4ULiHqabwPV6YuXXvZLcKSvJLzfy8rBMcRRgeieaGS+
         fpeu9gJ06f8Ak0Oloo5klJ6KzdaJMNUc4wVRHJdFcib2H9U2ECU+KwjVobpg5cfPVGAS
         TxtA20H93sMMdSZfne9nthPfhFRz4+VSXhuDckj8w5ijxCfH8TxJnjLY0EJKf2OE8WGT
         pE+/eoI9x5lBO+iLQD7MGtl8tjE9b3eB+Q/lnNBSVzG9xm3p3zcLOagOP2tTy6lqksy5
         dtiMJIfP3KXY5dAczQMXqgTNiHtoHqY8/KGALtPUY5Zl8BhhDKum56Ss+MLCa91NvAcB
         QnuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgXtyP2KSoh5rq+sc47g20hvU8jiV1iKqoqdsz5KmZIkwaG/ukfUQcNln5mYVAHhE4rBznwedzJGR6Uns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K6zXyI0PDyDCvtn6XSDDbww5wJW5esJziU1+UgPkZ8Z/IQ/Db
	EvWo/tujEFANoEo5+qQikSivvsIGahTPaeI/OfI+PfS6jx/ZdRwpfehS2t33gvo0kq4=
X-Gm-Gg: AYBFou2EEiUbHvoHi2v+WcCb2QPbuC1NQrkSPqxNClf9DO+WDum4VJSB9CyIoL94DiZ
	LC/tK1uxP0+pfgJUuPqHcxWT2i8HChcxfak9BL35gB7v+wGtf1qQWwXgo8gwWK5h+MTZ5jL22cG
	5vn5pBH+PBUp9ReQ54DCOxxCNmEdY7QVas4FyufW/fsm51EbVB1ZHcoTP0fZg+F4QU6PWc6FCME
	gJq3eDenRi4hvCTvmwYGRmDIbIq1YEakV4Fiwp8iTwl/7CNv9M/WEgrnFAgApRhxr4zRJgHy0Iz
	YjlteI5N6nMT2imb1t7p9V1r5qt4jkkwg3hRhBbDgxn4ROVTtR/T5ITP2+UBy63iTEPCKTYhKAx
	WJeGc8X/VgfncEsS6wTjG20bJKD/3AK8vh+D8t68CqaUVm4b29F4+pSad7S59xgN+FZiylb/cM6
	a6p0qfCUorOVkwNSXVjoJVRp6YW3giBeeEcFizk4wmgvmBGGzPRupA9g7cbT/wa6NfCEPpibbXT
	6l8YDEKJ7c5dgdLtyrwPsEDbofUKqHEqH6SsLGmJBjtO40+oHUexbNkbktoiaLHmikdgGjQoW3c
	hO15xvFSZVoO9XToiT9HXqKRcMRiTZ56ypbicfbCWA/txXXUEyNJkng8YJ2FvQ==
X-Received: by 2002:a05:600c:4e0e:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4b6e054920fmr98235845e9.35.1794060220092;
        Sat, 07 Nov 2026 06:03:40 -0800 (PST)
Received: from [192.168.0.167] ([109.77.86.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7a0e1f298sm49309125e9.4.2026.11.07.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 06:03:38 -0800 (PST)
Message-ID: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Date: Sat, 7 Nov 2026 14:03:36 +0000
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
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bod@kernel.org>, mail@andrewgigena.dev,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/11/2026 22:29, Bryan O'Donoghue wrote:
>>
>> +    /*
>> +     * platform_probe() auto-attaches a single power domain during 
>> probe.
>> +     * Detach it first so devm_pm_domain_attach_list() can attach all
>> +     * domains by name (otherwise it returns -EEXIST for single-domain
>> +     * SoCs such as SM8150).
>> +     */
>> +    if (csi2phy->dev->pm_domain)
>> +        dev_pm_domain_detach(csi2phy->dev, false);
>> +
> 
> No, there's something in the CPHY series for this already. You'll either 
> have to absorb that patch or apply those changes to your tree and base 
> your stuff off of that, and orchestrate landing this series on top of 
> that series.

What you could do to unblock your series and not have a dependency on 
another series is cherry-pick the necessary patch.

https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

If you do that you can drop the above change and resend your series with 
indicated changes.

---
bod
