Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A7525A9E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651685; cv=none; b=mVr1qitEgaZBMJnjZRQdDuMiqPDqeP+2Xk9sQ6QmAG0fEWLFyk2rfsodehaLPSnzaXaNSIWiZZJQiJY8+ZYVrCItKgKozSiq4PjpyZ+JG2aWsR8kMxL1y9O5EDHA2xeCUOJx79EhEmGE2EG9OCFjkuCXIgq6vGb0BzHqUJW/fz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651685; c=relaxed/simple;
	bh=TX6xhS4Vhis/cVqkO7iD2bmIOPGH7N8MJNCWfFGrVr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK5nQWvshAHememSfwnPEgQCUYZilkBpHBKJlURMffxsWgjt4jjH0qbb+/IORn0kLasRIxfhQlkk2NcAWmz7Xaq7zgpeCW/AoINmpKfBtA90vgpcIokRDky7qt8kxeM7mZZXyomf99y7Yi/pgKFNz485095omLUFuPeSUfBSZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJPx/VkR; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJPx/VkR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1502224a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651676; x=1790256476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=OJPx/VkRtQ1fIdASIxegqFHT0i3xYB+awFm099+ZIEeVsYTarq+xHv0polyYdj22JM
         BHvYD3HpW5LLY1/Aq8nBlVzmuN57UM6PNT5gIDypU8XJwCcRqvqCmU7RAddDDNNjgdrS
         l+cZxshTdscz6asGb3tqJaQeBOYVFwmuFO0GPKGphIrO9LfQv81y+dlfRDREHa1+jy1Y
         ALBFDSqNVCwkuWI7zjO2/kwMmxKRnYoe+9z+Ugs8VuwC6HHpsOkYI48vRu0NwfJ1pk75
         M/AG25D3IuNO7Ftmcd8Oo0IgT18PvFy/PPpoj833Kj7kh8Eil9yogKdpr9WEo8d+BaXY
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651676; x=1790256476;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=rHEjMtoslBYKnEkrbcQDoIubmQygHIfp0gi8gBhN6Yn9AmXnqM/QySlcWOhq3vwSC4
         BBgwr8LDMrZgDk/5jHal3wN/906xlRxgPZbyVHvBn+Cg0U7nyK7ha6YOO3q9u+elfr95
         QYVwO8/RARC+yfj8mUeL4F9O87lYuujXQVvjXG2w/Tl/RSoP7f33Z5225+joo4MqSzaN
         w4HShcI7Uso304FumFaZ4Ag5+mtg8vVDyFFRLH20pm/fD45fawk8xehdIwxBT+1fU5Ow
         13RfrHPA61oR7u6xVOVhuNmoGctjlFfRwQ27qUwwFOYB6jvsYhBNrJ0DK7E7FDSsp02h
         HiKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv+c75n7uFow193uG72+9fPajCzZIRqOV8a8DxDxtpKlfhIKH55g5CtakN9D3YHcoIo4Aoq6VQFsOenQU=@vger.kernel.org
X-Gm-Message-State: AFuF++mB30J4CprFvSI0OWyElGFU8nmO4UpNK3U1jt901oQhD9JtCM92
	2cLoBsfaYcs0jVnMVNawDxHRR/jtqFDSARFmQbF+k7eftf1IKW2jcQJMwhT0cdVglaw=
X-Gm-Gg: AYBFou3F7dQn7da/liPBBDFFGZNjhjyRFasaqJ9jK6Ti6wiwIqlgHv+C3F3hQhVqG2j
	DgAfa7Eax5k2u/UFDC0HAw2jJIt57f6UQJW6qIpbPthBI0EznLWCxgqNZZAVHIpmoTBre46dce2
	keTlTXWNSFm2AUEpx5At8VSUaG1mg62dDdp5lNiXr6Dhya9+MIxgLBfm0r1KErzAfvyTGkCdMm3
	CiVZz1iyEehzF1CLz9G7gtHSBrvx8cYVCF30XXWYy+5RVsXUzfLGnayHS0V7lhnen5e4Pzqu8Ce
	ZqmpjeupHl40CjQsHkhTDnGEFei/pACbDV6NVW0xG9f4j/0J/QbIU2B1Z9r9/44ngBnGDUh9qEF
	jR16ZAfIRN/PMdKUGiss3JCHFdrWrqX3o6069Dg04C8wTZWaGi8VTzP92KY36Gqt5YAXiSJtRdP
	VBS5PZX3pbFP5oCwyl99GxQiC1jfkankCvggcbM6Fn7IBg3wvrM2VMCoZ+nLNhTMMs3n4FHjH33
	h/d7hC3b3g=
X-Received: by 2002:a17:907:d0b:b0:c26:19de:9acd with SMTP id a640c23a62f3a-c29e5308381mr463526666b.37.1789651676039;
        Thu, 17 Sep 2026 06:27:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm293940366b.15.2026.09.17.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <37f182ad-a137-4066-9e94-b06be2cd03da@linaro.org>
Date: Thu, 17 Sep 2026 14:27:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
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
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

Doh Frank gave me a comment on this and I just changed it without 
realising this isn't in my series at all.

I'll drop this altogether

---
bod
