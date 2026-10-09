Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6130C3F0A81
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535162; cv=none; b=dDDxqqWJCkUzkJDH7IHE01S6qdZrb8pD9P3FQKA5bcvV/F8T58HDvT2QSBzRFLNYy0HURVcs7dEGFzzNYyOIFkPnxQE5A6Os4dgKItg67WffXUa2vvcgKvifBM8DSHCEdu25A/vAK74Ybh3vM9MKugO+pPcxGJ5yh209exQzLEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535162; c=relaxed/simple;
	bh=+e4H2njOhdGoAJi63SmPW8H1YZ7+lUPpHguznv3trDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbQ0AP0oUW8R+OKEo/ReTUN8su7+3Z/ln+NQtY2Oy1tYLr5I5S6pFkzCb+YX7zKO7RPW1iFW1JW5IzmjCL5N7G1CPpTEYmWTZAPpRaEGWAniZDItT33q569ZjdSxqagPWWX2azUxa4k7ymWQe1EODW7oxkKc6Pi1jeivskVGsDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyKnmoP8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyKnmoP8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so6164680a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791535159; x=1792139959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+vqQSz3CWMehrnqKQx0wIXwhLvGj+tDDI6FZmqwFVU=;
        b=MyKnmoP8osjJjnTq5n1sqFyk/h8RL2ekclvLPOpQ4xihAKJLebXAsadFS2WfGs/8Cu
         hdPZYyVsomXvfJb0xwo+UwdWQIpzl3jNcULeN61QzsamL93HwR8F+Paat0MF6NywGS2a
         Hi7YCO5+QdKQeYXDoWRwUiimzM842y2Ofseyov5y4sF0fEMs+41xlhi6OgQ4vTgqacLO
         15t7bH/+fYAGxP5ZNDS+QaY5A8tGxZeDJfQAdJ+aX79xf+6LKA2D9SQcRGNh/3QjUZ6K
         9RgnoZ95YTHfQi0QA6x14pAiHsbqmdf44Hvq4ggT6+JK04N2084RmaXOEmRefIc5w22S
         xG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535159; x=1792139959;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+vqQSz3CWMehrnqKQx0wIXwhLvGj+tDDI6FZmqwFVU=;
        b=RDAvcaz9Ydn+WvbOd6rawgVmy8LqSLWdgouh4WY+P/qeqpIqFVhxTCxUVJ23i9fpdr
         SOBbweVyfupMkkuJBaR/SPJ8XRzdSsxA4vn2uFbcR9kmu+34qTFmlqHg0HUVBPq084N1
         /2l3az0/NffaKPQ55BRlWTvTU0MfJ+lOiCeQMLTWrdgjIqHiVxURHHv981jQhlWNGbfd
         7oZZxp8KpGCF4V/BdeEfRVKIqoPpZcNV4bRtYvoAwiyhBTzC177U9Njh3jkeq/ep3kfn
         9hJ7n8MOqqqYeLqUsHv3+WuJFDfnJE0M7Yt4yKSYrGIxdlM6btHrdGSRHm/lhsrs28pa
         0Rsw==
X-Forwarded-Encrypted: i=1; AKwUvBwdcBU2jh3wnvLBUSvnLZR3EPErwvnLS5Ia0ocPV9b/P6RdZf9U3ZDFjA0ONBv76XCoLISfvupIfAPm1dU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbzjFdFhVeOcaLDXF0uv3vZHuWCYb+eQrTEcVY0xyJWgQF6eLs
	VPVkEHuH4X77Fcz8TJeeaLScnVMbJYm8qUSDOJgKzclbIbZ3WaqJ02r3TXJVITS1/oo=
X-Gm-Gg: AYBFou117NdKUTRZMk47KhfTAjihNIOveVOGSGmyGk9oHP466yZT+WLn/q/ty/796li
	8+TeV+WqNjBG9kONHWiPtRZ60Hm8B04WciSHkjoXvHjUnEpXjSoiBTCL+RJcemOdmrh/yO/6yBY
	ff/cSWFnOVi1o65bM1/nINyhp9DHmjcX9Tsc9m1BHM9ETaokVpFtxvRqLRQx3NmRqzE1nUhLYc4
	Gm1/lpUX/t6gbETTz7o1QbYB/ZwJOM6c3h75vYNcN76pleokkfKX8F0LfLYuVBSfk4G5Rn75Ud+
	wh/efSuGXQ6hTwNiaB2KCJyZizop+7KPtmU/9nNhe7S6o6JNrqVcUo/gBixiEpQEzTrZ+QQJdBh
	UfxChXXLva2qAvIpqu3uwLYHigxVBH6PHLXUXt7VL5fwqL7K9hHM0OrthKFOlkyZVHyBjL+RZ/W
	cbrT7ILZGdAsq9uaJC9xqR9sA+XG4oSiu3zKy1ovUixc9UiBWP5+TI7Fai5dsQMFCNcLI3hauZI
	Im1SPk7gw==
X-Received: by 2002:a17:907:3d52:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c31aa0e93bdmr117241666b.49.1791535159415;
        Fri, 09 Oct 2026 01:39:19 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.78.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae32sm64239766b.28.2026.10.09.01.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:39:18 -0700 (PDT)
Message-ID: <8a2ff836-57ce-4df6-aaae-0db3f36e8b58@linaro.org>
Date: Fri, 9 Oct 2026 09:39:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/12] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, bod@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
 <179149982796.2596899.756044515233442982.b4-reply@b4>
 <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/2026 03:59, Hangxiang Ma wrote:
>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>>> media/platform/qcom/camss/Makefile
>>> index 218ba3a95939..42a14e8fe1b7 100644
>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>> @@ -26,6 +26,7 @@ qcom-camss-objs += \
>>>           camss-vfe-340.o \
>>>           camss-vfe-480.o \
>>>           camss-vfe-680.o \
>>> +        camss-vfe-1080.o \
>>
>> Can't say I'm 1000000% clear on when reg_update() is supposed to 
>> happen in
>> the flow of the logic you have here.
>>
>> I'm a bit suspicious of adding a new flag which skips the update but
>> assumes some other bit of code executes later and does that update.
>>
>> Can you explain this some more please.
>>
> 
> Thanks for the review. These points were discussed in an earlier 
> revision, but I should have explained them directly in this version.
> 
> Vijay once clarified that the configuration principle became more strict 
> since Kaanapali. We can back to <https://lore.kernel.org/all/662a21a3- 
> de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com/> for more details.
> 
> In short, the hardware guidance asks to issue the REG_UPDATE after all 
> of the CSID configuration registers are written. Kaanapali seems to have 
> very strict dependency in the hardware about this sequence and with the 
> original sequence, no RUP DONE or BUF DONE events are received at all. 
> While other chipsets can work normally.

But how/where are we saying that happens ?

---
bod
