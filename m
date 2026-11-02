Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624316;
	b=N+eS5pQYOVVqsj1f+UFAD0JL26NlTgmsh7gXRoE4eGDD2QL5y6d+JpcC33fAsojM0HdJ
	 Fh/vGHUPjdG1whOfgZlmX/MGxgShEda+j7S6xdAkxI2Pd24o84axPNKsuNh2NBz/AmV7K
	 5LBiOf7SGcKvdT9+aT2Soo+eHD8goCSTqQhxUV6vSx4QUoIZISQcXpHo6nvs3m61c/nd7
	 cTEXFz1N5djaFYzPAWcZUDjqLMExzr1pjgwkl6AJDr2TendDrNzFQnA3YvzyrvEecIfP5
	 9Px/71Oge5JG1cX3z4uLR+znkQgKVQJ5nb4501HzU7bkoGfsrEdzUzrqOlnmZVITsmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
	b=IrEzAZW4A5DsAU0wX5rpLwuXq4k4zoicEsSBHgtD83jF/WC1EZJnad/h41zhxN9cx3HE
	 b1zV4MlrTSPPEEjEeoFaAvBILwU4t0CFM45a0Vwj/F79ggeuDBckV34XMmr1nfQofNq+d
	 YJdTJ7OR17boEEe0Zl4m33eM2wB1eSNzSJZ9ZnkGCwe0iX9HQ/InCJTiL+krVSmUPpGxE
	 /mvF9F9FzQ2Uy79ElVscBB6Jz9sLfKTkhUVLAujo8+tERawlOwNkA5JFn1a91r2wy77WY
	 nHWZVeJQAVky7BdKGpI7o8+XTOqeJXQq4sFJ551kdhEaAAreWS0CE6sDOd/G2hNGusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sgANBLTL;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC202606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC202606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sgANBLTL
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c315869241fso414636266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624314; x=1794229114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=sgANBLTL4YAZDwMklFM2H02NJCcXk/PdaEgxBT2cdhpFkCoMZ6HxQPXwP3Z2b/DFeS
         wBWKIQCNz2vp3MFn2A9bfGLKJ+KfLCGxipZu5An6Be8/ZVkEo19A/rATSys6diqxaHtx
         J07c97i7fSaKZ2780Unuy3tmV4cGWFeFHLzoWzX4v2isazoe57QuT9koARmMIfnAKsIg
         vRgOeAcNKiSUpqC8uifA0GnafMX42orf2CX0h/BEp8yZMiZlT9lmRhupAQC5noRBEu2H
         IjpvebFG0o6EmmhdW3s2jUXkFps/v3WUdE7w11o9r1todRotUMvA0pTU2vV/s7A53Br4
         03sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624314; x=1794229114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=FuQ46RsFkAqX7Oo/kiHV6CESR9BDXvKjcpaLufDAaeb/L2uXxcCpkwSjsPFcgGiy57
         NILPeVQuPsSxRuxSMcVFqzl1HpSWaNuTyqbjPolS40mo+YFigmvCzTrUIzCFKX7yHZOF
         FSxG9AlstzW3ij0zYpMYuESNaCCYjPLVvu2/UdN9ttNR7Acm/QuNsBKKV14fXTzDiN5M
         gBc17LoMNC4jCm4DYFpag+UH6SJukOkWT6k/U/fm8aj92X64tEL9Ti8rLGooXIO+Bbxs
         u98rgT3qAyZQFoXKdhdPX9D8c+qFeF/c54jnl8EJVSSUo6k8qGz/vOE06+L0TaJAxuY6
         TwVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwevl90jf7u/8Aeoxp+GK2FXc1EKm2Y3T08Yi4YHrgpbo3VabtUqfVuGgCbU/PnNRonH/X2OEagtxBoQ/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LEpzC7WeNXlGtYe70pU0pJKRbHaov9lTnyEzUDVOFcfWixRsd
	VGIKig8obl/mov4eEyr972cC7vtiu2Yfwxu8NiQqB0shtEQbqXGsssV9lJzr5k7B8y0=
X-Gm-Gg: AYBFou04PIIg2OqIEtcQqVIWzi+bBzHEC0VykdjJIAtdIEoeU4yDvpxuDJsGakVUJEB
	gC0nPg7o4zSwh0fon4OCtnuquF1bLilLsEyblrCMjgyBow76pV+7J60zxZYg0ySLt0xB7htem3W
	hXqIl6i+d2Jgf+daPJ3joNU0cpMytxBv+JbbXGmwpz1fQH2YnaG04ZRjDeFiVOCPJhpqIJeFZ3t
	FA2hklLH6qlUGp7v3EV2/GuTit13cvuU+PNKkygv5duj6m09fdMc+LHa++GMmbz7KLsbmxugtFK
	PanEqSTls+69CQt6agVVgLrgnvvgEJWU18qm910moqeRVQBXN32T2au/M2kqbgPwfK2Fo/X6rWG
	lmzgCaqJwQwar9OARt6gVXJE7cmmS8V1iJwFVFuo5A95RS2b2JQqW6Hb5TlgYF0ixVRarRjsPOJ
	kFwk1NuWw4uvjKt/5NyJWUqC/Yo2M1908gEhIx7R2n1DYm2l0+Rfsee3NOWyT65dQmW767B9WWT
	akwho+6cKOHVryFFklMuQZyERTfC62xiNQ65GlcdITtPOophD+bhKEbq3hsgAhf9/xAwxfJF2f/
	74v8T5U5MeJZpJxKt99YvqUTNniH9mY9vMvuow==
X-Received: by 2002:a17:907:7253:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c4ca7aa5303mr800564266b.42.1793624314046;
        Mon, 02 Nov 2026 04:58:34 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3476980a12.26.2026.11.02.04.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:58:33 -0800 (PST)
Message-ID: <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Date: Mon, 2 Nov 2026 12:58:32 +0000
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2026 15:25, Hangxiang Ma wrote:
>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>>> +    /* CSID0 */
>>> +    {
>>> +        .clock = { "csid", "csid_csiphy_rx" },
>>> +        .clock_rate = { { 480000000 },
>>> +                { 480000000 } },
>>> +        .reg = { "csid0" },
>>> +        .interrupt = { "csid0" },
>>> +        .csid = {
>>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>> +            .hw_ops = &csid_ops_1190,
>>> +            .formats = &csid_formats_gen2
>>> +        }
>>
>> This looks strange, why is there only one clock rate ?
>>
>> ---
>> bod
> Hi Bryan, the current CAMSS CSID code always selects the first frequency 
> listed for each clock in the CAMSS resource table.
> 
> In camss-csid.c:
> 
> [...]
> } else if (clock->nfreqs) {
>          clk_set_rate(clock->clk, clock->freq[0]);
> }
> [...]
> 
> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
> 200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
> so we need to use the highest rate, 480 MHz, to meet the bandwidth 
> requirement. Thanks a lot.
> 
> ---
> Best Regards,
> Hangxiang

We have a series from Antans to address this though.

We should list the clocks the SoC supports not constrain that list for 
one specific sensor on a test-case.

---
bod
