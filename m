Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC4456E07
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069573; cv=none; b=s+F2SUIUfpnS41x+4Bz5pOI/sIZQo2OIzAaw3zKi12FCI6wenYu8gFgfspKaclVa9qyF68ba3bq+CkpiMwgi5OH9P1dEbkh4RwlWWjsNr0umVplHGJW4aWZlOMLqvAjQlWGJ1zy7eHqNFnhFcx1AvnUGu1LXhUwXLW6PpuZLpaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069573; c=relaxed/simple;
	bh=6EFsmK47u2Ztk4Al6azIfLDN90HRCEzNFYRGukx1bNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIp6tQ6LpTZwd8SYJ3ffWg5TjOcHfKFSVkZdgirUntTYBEZU+YGMSZeilin/uA3MvCsZFVoLqELKn5vQwjX1SU89mAeyF8AD7JdiT69POqogv9FKo3EpuG5SYYo7WDt2qiRMU/dXaLJ5O3vL5ukdY5xxC3F/SLveDOQM3aGv5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7E/v13u; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7E/v13u"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so467786566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790069570; x=1790674370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Ab95yjg47UXgu4IRFT2olDtzGqxsEpvIhJOJgfomKI=;
        b=E7E/v13uMZI1pN5bLzyZmpLEyuV6+kJKuwTq+Ftuno24pR000BFZDn7OMQlpTVBqhu
         qPTpa3HdO5es9YubMuDjXSv6yU5KVRYdoozAEYf/4Lz6VrW1BajtTXewA5Q+85uJuVEW
         84TEmE1WjVFHNxUpFvVq7Vs4Y/ZV+/UJDnDNx9dBVD0dCP6RDbl+sZnM3eM9zXY7kb/1
         s3uhy6d2Pzt7aXZlsmtFNYiO5rBXd5Dev6MwL0bxawbM8DIYidUxEVisWW+CZCXIeX9W
         rOhFgbeuJ8wqCj/0b9Yupewc/XpGoZaOYm91/WD9boo4l+XOpCnKh8q6oNyWZ+VZ7RvC
         QG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069570; x=1790674370;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Ab95yjg47UXgu4IRFT2olDtzGqxsEpvIhJOJgfomKI=;
        b=VWjUQh8rlpJwTLcC6vfz2BYv1edCSkvt+lw14o5kFxVrUeaS5BqltLhVGtQej2hvi1
         Xt6D2ojfCl1SzrNKc/Y5s6SxtoR6IuNbeynF4lyjrFgCHSwSxejBpCrL6SsWNq2O+Af/
         rPwVy4MmhJNFvieX1cHmdTgdOTfGfwOmspkuzt8QSV627xEbK6lffRD0n0txVphIo9id
         hxf68KpiGtgR/lSZlaMJL6K7uDX0EXNHcbPrLx6Q8p4UdaUxXmz0WYgHmyeXMHYRPgNP
         dyJLsI+KxAqPQ9cQg3m8qP65Rzbi/YGuvwo1j0x8cwIXjZCjQ3E7RLitH2geaWwVhDrB
         pC0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjszTMbjjnuu/MeQB5zrhFYYJ9EyoT6QNCvq0yN5ij0noyqhKlLtznqiHQkADIJb7vWtahe52SIMYD8Kw=@vger.kernel.org
X-Gm-Message-State: AFuF++mnEx6Sb4fCrLPyzvQDQ71M76dqkmeDG96M5HvdmYP/t5P4vy2H
	hBSXPr4/qZVHTqxbejxSPagc52VVWLlCD8BBzMX2FeOz2NCY3fpQF0USuYQ78ncguGA=
X-Gm-Gg: AYBFou3enPVaKO9mmLHWZ9935flK0IFflvXmQbxZS2pnQT2k5ECQw0O5X+j8MXGn6xL
	OF0fsdFF0Xql81Hucrucj1dDwgBqwc3uW5iwX/Ijqinb1lU0bEE2qP5UYGFSBWU8UFMvDgguhDS
	/FLcRhkxGoJQcRzlKgxyc96sdga8LHuEdKPGiCAruDyBqrL/U8YvS2u7GYasagad9nEG7aIohJz
	y7oX1jApsv5xH8q3i3HCN2gLvJsCcCRogHFlEnlWO1S9Vh/TMHVI2amz8UZGXWL8C8NQmsNKI67
	hUH9hnmjxFFKtgI6FAp4F0WsTUMlhl//S2cfvc6ZhMD36N0Ci/sdMLndfcwam5UfTwrKcCc7R5t
	BF3OlS3yYTnrypZLB+PqHu1gnO2J6RA/icMr4udYhVZ5DjMc5jdE3LB+uTO3PbN65wOmqJP2vpT
	E5A1RjeXfiF0HaQ8wtCdPiHMV3tHym8NP2dTYUUQXjNj84/jbxmjHxAAKuIIDxS2rr+fMU7r3jf
	20F7c9rPcA=
X-Received: by 2002:a17:907:d11:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c2a1578a505mr1126569066b.7.1790069569625;
        Tue, 22 Sep 2026 02:32:49 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.71.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5ec614sm54010366b.45.2026.09.22.02.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:32:49 -0700 (PDT)
Message-ID: <61ab6356-874d-4a05-87dd-4900d826f02d@linaro.org>
Date: Tue, 22 Sep 2026 10:32:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
 <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 10:15, Konrad Dybcio wrote:
> On 9/18/26 3:56 PM, Bryan O'Donoghue wrote:
>> Add the ability to use a PHY pointer which interacts with the standard PHY
>> API.
>>
>> In the first instance the code will try to use the new PHY interface. If no
>> PHYs are present in the DT then the legacy method will be attempted.
>>
>> Acked-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
>> Tested-by: Oleg Keri<okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> This and the following patch conflict upon applying after:
> 
> aedd77ea8168 ("media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code")
> 
> Konrad

Thanks for the heads up

---
bod
