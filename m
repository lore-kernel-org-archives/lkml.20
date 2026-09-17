Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E1C4FECF6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648333; cv=none; b=m3cX7o+pZxqF2VSP52kgoKHmmTDHhFv9clRH2F1fT067B1NsybMuN8Cv+B/ei6Y8sIN64tjcAIZsY7grQFxf1jZreOUF4BXzFfdxSXVrgSaIuZiUtumnvx1YOrmVnj7J/vz9GbqkLKMc5qQ1F1j8oSufAfGvP8P/5C1CrXR+auM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648333; c=relaxed/simple;
	bh=3w1QO9RRjV2P//77/vuGY3t+8liMQZidimN+GXQ/Shw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAqfNugUXt7Z/YZHWpyKROgaZqZkP3BsBbfefn6TyDPohrpXBrwi/E+y3HXQNxL6GW8YL7i1ZCAo73rV2Zdd3OiOnApTT7GOm7pcgcv3UaKSgchAeDtBXcbxKcBcYegpYqkH7Wz2kAXyahv6JBHP4jI2ZWO9sIuc4Z390OD3LsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/fiuBNL; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/fiuBNL"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso1224898a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789648323; x=1790253123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ls/PIdXgwRaJNqkytOniziANCA/o27n7uKp1MTR7az8=;
        b=e/fiuBNLG4E9oZeVsqDRZUNO6JWwxgCRIyimmkUghYQJnr2LhxsdxwaEvvpCdtStT9
         u0Cz2Xeowdpk7x0SKOZbSgxmJN46MGJE+ZFeQA4S0wBM2uZZOay4bh6EJXPcol3DYd18
         3R5++iHttO7Zp/N0uoYJpa1OgoCbiUlY910aXYyOd9O+/k2FigozCEmn99+I4rxW16Pm
         5jJb2ROGGdfsyeOU0SbAxG1m5vwxLm5/2LltsV+9RpfJ0C0ZHu8hdflC1XRtfZsm4NDl
         FSGDOB+UXLIQ9DORzJDy5aF0EkLB7fkm27qqdP9LAku2yBqxmD0HhyPYTiLjfpMu831F
         vkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648323; x=1790253123;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ls/PIdXgwRaJNqkytOniziANCA/o27n7uKp1MTR7az8=;
        b=lqDBOnKYsq43uRrQhPrVd17P9gHupmEqmFOLBnqTyrzTK86VoKqCflUT5My335XcoC
         puTRpgh4lCCFECSze9P5KRlC4Fi+rfQYh7VPgwECS+3k3cb3nUM5iPBNpfv/E29Ol7hF
         oO4XURZeYmQkNdAKe8nvoPLc5gZwQjc8uVBN/en6XBzMGC23Ays4kIK6jjc9VqJkCg2v
         1lUqW/oZF1D8fqSgkh8YqRyTeAr02f7OdbD3z1mjX1EIp6JAd/rSxJ6o1AUTMfzHiTOw
         mlpfgi/cU8Q6aBAahfPy+h75ibHWSTvTGWk4wP2YKVR8If7axqSvLgScenkgYHgVw8Qg
         drSw==
X-Forwarded-Encrypted: i=1; AKwUvByey/unwDPggOMT6U50Nylj44CZHuA0FsD8xEPSf36GCTjbjz7SKGNzYzJR/c3Yy9Es88L4XAiYhTVNfM0=@vger.kernel.org
X-Gm-Message-State: AFuF++kVDeuk677mkiuT6HLMhuNsG1ehmnAao88cHQjuWgs1HnUhgVQp
	Gd4peWF2vJQePxuTKOqpSOVAkwA/PQUJLDRhemxEYvvqSrB1sFhmo8vwcJMGBLvdkBk=
X-Gm-Gg: AYBFou1RWVDcBfRWhUFogaxfmc2iDuZK8ImWVwT19ntnQ6wlE+XApm6Dl2sJScVvVsa
	qfE4AcmmH0e2c8LEq2qNkQWo8AU9tcrgGxSUvebVG3EL/RLroybH1JiauPqTEei6iN7tgm1rLV1
	U5o1l1O3sfoRyVJLxSyVM1/MP21S2db9FdlE8jThwvJWJ1mUqKll505qek1sHOM+hC4R9Yv6QR3
	1zU/JJSRnDS2ZVJqJrVyltlMPjbq6gc7cwckFOad2C+FAGnF8tbY6915jxeRuhft4NoAtEy0RiV
	kzYuX4ZqZY/JpUkuBELXHixUeV0A1l900t6ftIk7uscEwPYaAVZYh44CEjE1IrIIiljd/2Bhavj
	UlkDx5ntVerAT2OZaVJJiSn/n/VBs1+5PLr8skDMLz1ArfDa98VkT5LQf6KD2vqUFrfw1SrfP8t
	AoZeSz/WU3qU4vKbgofvuPE56jF3qH3LDq1GERqGg3aYku5Zzqnm6Nj5zoR8RSd4uiubDYiKAVX
	cX93XFWoqQ=
X-Received: by 2002:a05:6402:3242:b0:6a7:f25b:d281 with SMTP id 4fb4d7f45d1cf-6aa22383344mr3922846a12.13.1789648323558;
        Thu, 17 Sep 2026 05:32:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2ab4ebsm3576964a12.30.2026.09.17.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:03 -0700 (PDT)
Message-ID: <8bed3f8f-52dd-4ab7-9ce2-cc756724893d@linaro.org>
Date: Thu, 17 Sep 2026 13:32:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/5] phy: core: Add phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
 <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:29, Neil Armstrong wrote:
>>   /**
>>    * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>>    * @np: device_node for which to get the phy
>>    * @index: the index of the phy
>>    *
>> - * Returns the phy associated with the given phandle value,
>> - * after getting a refcount to it or -ENODEV if there is no such phy or
>> - * -EPROBE_DEFER if there is a phandle to the phy, but the device is
>> - * not yet loaded. This function uses of_xlate call back function 
>> provided
>> - * while registering the phy_provider to find the phy instance.
>> + * Returns the phy associated with the given phandle value after getting
>> + * a refcount to it; -ENODEV if there is no such phy or the phy is
>> + * disabled; -EPROBE_DEFER if the phy provider is not yet available.
>>    */
> 
> Why changing the comment here ? You're not supposed to changes the 
> _of_phy_get() behaviour.

I have no real memory of that change probably seemd like a good idea at 
the time.

Will drop

---
bod
