Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268857;
	b=Z8fTYvkJ18HVofG1BIwGjVLvWEk3iCxj0l6RVx3T1NOaV5LRocdfxLmTVL7G1+26GEdK
	 VprG7LhZzodpVZyOCnGOPJbi/JpYcpt/jnxOu2rfPjJ99uX7/pQ1BHjBNNa3uhSzGvh0F
	 G/MOQaqIVVei1Ik7KndqfFY7cXYCqtt3pVTkp2ndVyAUTiyg2hBmD90jfdcdkNiGhjO6S
	 tmGaEpOpQGT0+7btpsFIDU2Et2QUZXqcThplY3168Ddc1eP+7c1x0Kxpe914gLMPh/CtW
	 ZW6V8Z26iXSQOQvGEQq/ZYx6zYZGPTBI84+XIdBL12lDnqmIq18pu5Jf0m/Bn0gUiIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
	b=cyU4RNjOglIo1M9Hnad170sKoTmKsG42w4LN9THqDmJv0DNTyTuEnEoJkz1Ggty2DVeW
	 ivcAYYUv8g6q9oMyK/k3JpGO3UrVQxDflsHTsdd/jDDEv5UXsBKH0tz4iw7ftwUvWtugS
	 tuhceY0KFmKwdOASWm05Zl+JApgB4v5E3hZWUYOnI46G5HIOndXZZGAXIqpnHw97Zb8gz
	 /rMYzzqGP50/oFR6EEwm1Fk5BbDvsNtBEpnLnd4PppOgiHfc4NrqH1qvzCJ0tZ+DpxDeU
	 9zgoRF0l04pz4u6nm4PZTl5JteeaykexXuIjnD44I7SyYWnu0vZseVgelrMiRLU8Ngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="deozIxz/";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE66606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE66606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=deozIxz/
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso959110f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794268856; x=1794873656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=deozIxz/aGLnxTDbgoDjHa8Nq0xmOsMrD8iijQkW1P4nF7hUt3TN6minRfpOckwpEP
         MH8cy2KjdHGt16ApzZLcpoe+zhdeksal5/pnr6I+TcQRsTCklK2ct7oVvoeflkq0l5cL
         OzQ85Dgs6+w3/9mQwalx+mc491efpiATwmjfct78qe7gA0CFA1q0ZOlQaauNpMBQp7K+
         Oj9dj5lmjukGVHglA8CHXKMpdD0XmZfI29qoy+pGOEslgCu8USE8/FRmf/FYwZFW+3Vc
         3h2a90My3w4IF2oP5UJKDZDIv+ULOx6KAwmIhCIW773jtJliQNO3c/GGW3MCixqqmSK9
         2Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268856; x=1794873656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=Au3iHwjzzaBtxj3DP0FrwphloNACgZykiKyUolPJARaHFhjfPT19uxca4hSZ0OIvG6
         okoI8Mzxl/Sd/+ARDf73r7qWmQvQTmn/IGnW5fOFvXDFPxWid90lDYPiEpJbA10oavXn
         4argGFNikexFYJgvP2yO5ncj56dhxIbj/ShGCO1HDb+M3zzN7Yo/jZH89Uhq05v+rVCY
         Adwetd+x1DUw15ZLWvLi+1isyIBFkyIdIaRtiQB7rsdU2a2bkPKYNV5jzVNQpnwIzPJe
         CJAQf2MLX9rRcByKuDxw8JVRxYE7OpVQXOAHIoHjOBvfhdJVETo3/Sfd+8W2emW68bY+
         yZ+A==
X-Forwarded-Encrypted: i=1; AL+hErEK6R8l5d8rKCPbKeGYx+TciY9+ErKT6zy/px70IBBcAxD+syVJi7au5CKwP67KDnBgsdxjF/kPU07T2ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t9x73c4fDdHZstPpEzGCG6MUByHF6+LDWNdd/oYr2AjDr6/mx
	E3z5Xx/7jdbdENMu2dfMhu6iHS8sqHDwChyYpV/BwWeOIft8Fka5IvFo0dBtuOd5fKg=
X-Gm-Gg: AYBFou1NSLpFvkfrarCb6MthudOitoiKqFFbwdvVHuJRS8xfxKdTKWi2mSz5634C3Sg
	swe+O3lTNcS0I1QQZgGOcpQHPysqarnqtsVEBlhq5+RUWVVmqq4mkXb2VLMjhzAX6tzI4HjZ6FU
	EvcA4FlG3oDS38vhQe1aBt+cLYCwVPNhKkK99rDiDmrPWRo5NHb3Guea7HCllqTzVXS6khuBiE4
	7NfiIcKlk9a/Gl9P4zV9ECcTrjeaxGXNGbUUstZaFrOj1y6WgqY/il2ssKORDsR8h9UjQtXSpPt
	H/KKeoNozIQuO9O8XVwxdUEE1m5V6XS49MHDcJX4VVgf9hamwGVMhKbHe/uQNeCinU/jVow9CP1
	xwNX0DDqGhZpKtbMIVOfbyeS4sMWoXsxP9RHOD/KMOVV3A5H52Is9UMBgc1EDj8VG3fzuCUcz8x
	6i/xGA6UVLPvOmA6Xv4GNy/phqIRYyhh4ToJXF64i8l4ASrVWP33zlhM8hwpJdCxoyNw5Fn6zJY
	fYk0j2srL4XZa8JTTLajkfRsA9OfURC3TGM4OP3TDyF3On2BXkl1tfKvAjjS5DqOKRGx0SPS9I5
	/01AW6GSLWzDYHCMYudY+yiQAeCD9PjDMdj8y5s=
X-Received: by 2002:adf:f391:0:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4982f2b5ce0mr1045706f8f.21.1794268855287;
        Mon, 09 Nov 2026 16:00:55 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm1882531f8f.42.2026.11.09.16.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:00:53 -0800 (PST)
Message-ID: <5d775896-5c7e-4830-862e-a9b02b840177@linaro.org>
Date: Tue, 10 Nov 2026 00:00:53 +0000
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
Subject: Re: [PATCH 2/8] media: qcom: camss: Add SM8150 support
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Right, well please review patches on-list before sending duplicates.

https://lore.kernel.org/linux-media/20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev/

---
bod
