Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809043;
	b=snn8aQkSPiuXZ77zFcsky0c/n5YtMlFvV8Ks0GnADQhy/Ol5aGbgOWB6p4LUZUHSsKKj
	 uoN1KiNgJTud3hP/z4BPOqTgOksqsrheo6jKFND7f0v+03npB9s+Yk1fv+B0oJhsksXX5
	 iy6ci9hFvmjycSJ6zXNQfJ0N94FVgULM30ffl4QZ7y3eujZfDmlCgEAcOv+kkys6agEnZ
	 h0sXm8pv8QhHE5M6d4JYQJEI2Cw3SSeCnlR8pOQbqKslOXSwf2jMJVwYcpLLh1HEIT8Ls
	 QDTY8w0bSm+CUFZegkFh0sODU2qgvwIw0PjVaEeL/ej16U5sTEBf0dCuYEPXls/w7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WGjQzXDbihJeW6cw6LNSbBuxJDvDK/XLahSbUoADWnY=;
	b=ExUV+6j6bxa5nPVxuKAx2GCN3DMKspRmIjXF3n6vmK9mHNLz7B5MEJ28ZCtqP9lll6ch
	 FhJ7euxpkzjIXepX2rurytQ9kyIym6sFT4TF95RH3N3YFEwKixz/Td34a8Y1xUV2lN6ox
	 bxpBJCK6BwdeeAQH5QbjAIfX53I3MGWXsCvuNFaK8jYw2vnakey1jgzxrbF09Z8y+foLM
	 6bIM1DtSBjSxftE8p1z1pwdSU1Z4ypV5Qv8Q0ewNYItxTT903efofWcqmv0vnkYN4+oBy
	 WnZe5HV4iIAlo1aC0ZsuJATXFiC1cso3yZsgbGRWbkHbvfp7eOgy+QWIWGclro0DeTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=raiqF4yg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC3606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BC3606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=raiqF4yg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so8094415e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793809036; x=1794413836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGjQzXDbihJeW6cw6LNSbBuxJDvDK/XLahSbUoADWnY=;
        b=raiqF4ygK5JlaCGtO2waCV60lOHlih3bqY/lQOUAr5R3FP/h9GqOq9C9WlKrIiK43p
         DXycWEIoorIOR+t0tgYbutbTXDTie3myKpP4X/w5OiftollhGD7cR4paG4TEfRddYHv9
         XXIbRBhINwHfyoqGWrS9Vzfs//UNKLRrC2EWrOL2dcp4OVQSaWoaQWAwyz+o/PMv2ir3
         pSHwmu64dQI8dodQraZsnCHpfI8Iyysr7ciYmkqsXNvK50Z6BrjiHgO/cUi37Am3CwGN
         HUsYStNjCWrLTzU8jLkNGuDqPZI8Oqq2d/qm61DK56PrvpeVwwMhLbF+GHtnzFmAgAvJ
         M9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809036; x=1794413836;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGjQzXDbihJeW6cw6LNSbBuxJDvDK/XLahSbUoADWnY=;
        b=LCmIDJh0l/n5GZ4UMU2LnyWA9lM9xCHlTxGNUCG6NyABm6Ig8UB/npLwS45UdYS+qn
         rqXStM2HqWilqOv8k4HCXVO0QYFfOxaYSM4uzvNf2l6rD9y9wI/AVbhE682WPrMP1N/2
         vgK0+Pz/uxdZgPiao+5MbHf6pjJt2i7huYSGOaln6uSxG9Dr0i3qarYvPL4f5ENusYcp
         7LZjdEhouIHbn+Awe2LkyO7CM0QIq41ao6WUocwdbZdeIjhDKXQOc/XIAoAbFRKMnMdc
         e0NM9If7Pmkd9R3QDhWpQI26ZAEUOxOUJR2Qho8UCnDwrG+Gx5LIQ039eCd7nm7pOF+6
         2CpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9u2N2dn112p/+kt2COhC2qlpNMAXlc8v7sosZD50Wv5xK9lP806D2VgNQW88xRzOclQsnIwNh9jLireM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97uwD6Ecg1l1mxzOi7q6Sp7/RQtvCCMdBB2/4s0RTrjjbZ8XeQ
	fSesfiK8chFu6En/7jwXacs2JW4Wr03DrT+p4DSucN0m82TOMkXVupwiRG0246odp68=
X-Gm-Gg: AYBFou0gQ3MhBjiPyblnNICdDVVoRExks7crgvx3SJAQ1RjkfHqe7CU595KGlejGuM4
	he8e8Y8iH9YYj7Vkx2xXqFZ47uYzyYfxTUaIrhAYIciwcbLfiqOG/Bqc4wdZrJg6x36NEfXWu/G
	NfQBqM4Ip5lW6rlGtX1QPvEYJD6kHdzEJgPK2y2wDPQuEnUtOPpqqDU3itiJXqFD4k6k30MH1/0
	nKEnyrpN+k5wlaLtvl51eekaoF1tPtOKi2nNtX0IqLt8Fm3XGKWmJPZ50MlNZihkecskiR4Xf8Z
	ojUtnkqvuNbW5spnDJ6/mMiWUiRwcvfQ+z5l0oULpPLUiizGnzpjoVnGXuwP9ItyVAKOAtCyPpJ
	9xKz48EsYWfDCn4JskS3Zf/ZLCpF9eUTsZO5JXeK5rfezme7UIdj6f1Mm97Q7xUay+Lk2tmUzMh
	LpMeibzMmyFYQDZtWc0YsFwuYr+ACvR8rIxi9jHVM3D4UydrrFaYGDCnmKiayUWcED1o9Ta6pEA
	v5CqFcwtx5MSUiCrNKIBjcKc1ddJGzRqFZIxfLGAErfCL3MRfEtHFD5oVwsKdhBfMwvk0+k9XrP
	XiIhLXXCU1Om7xo5Lb1gUgn/ArG+U2I2jy9Eg1+996c=
X-Received: by 2002:a05:600c:5295:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b3c3545146mr75677375e9.21.1793809035955;
        Wed, 04 Nov 2026 08:17:15 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9faff90sm169274795e9.5.2026.11.04.08.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:17:15 -0800 (PST)
Message-ID: <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
Date: Wed, 4 Nov 2026 16:17:13 +0000
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
 <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
 <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 16:11, Loic Poulain wrote:
>>> We have a series from Antans to address this though.
>>>
>>> We should list the clocks the SoC supports not constrain that list for
>>> one specific sensor on a test-case.
>>>
>>> ---
>>> bod
>> Good to know that Antans has a series addressing this. I agree that we
>> should list all the clock rates supported by the SoC rather than
>> constraining them for a specific sensor.
>>
>> One additional concern: if the clock selection logic still always picks
>> freq[0], listing a lower rate first could leave CAMSS unable to work
>> properly with sensors that need higher bandwidth.
>>
>> Could you please share the link to the series? I'll rebase the next
>> revision on top of it.
> I don't think Atanas' series targets the CSID clocks, only the VFE
> clocks. Ideally, we should make similar changes for the CSID clocks as
> well, but for now they are not being considered here.
> 
> Perhaps add a few comments documenting the supported rates and use a
> single rate for the time being. Once the CSID clock changes land, we
> should be able to revisit and adapt this accordingly?

Its the same principle though.

I don't think there's a valid case to exclude clock-rates purely because 
one sensor requires the higher rate and we aren't willing to do the work 
to make the clocks smarter.

---
bod
