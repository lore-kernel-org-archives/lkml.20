Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873723;
	b=hUsNtylU6aU9KMxUUXfrir5Vrnwnmkap8mzfbTYlXLk6IzoUDrDc23eqxqgjdqVvxLss
	 G0bHNpnxvITB7nyhWhKkHzjDHzHxn8TzeAqU3Abk0kEHokofUMCYqQparVO/Lh2dn0DEu
	 Iy7Kj/gZzdM3PSW8gg1t/N+hZs+2APnGNGpXx5lZzYX7YTavvu6iis4oLyYx0sBtNFod7
	 wayPNXWd+DhCjPKbmKkEl85k6+OfsUz3GauYzCV2aFLXMwppV9VEOJ5utNmx6DG0zsmWr
	 auK2LA/zCgk9o3T2UzWFfEpPwQfixD238H7KW8huqRV/M9wBRdAVM8bA/MLOG+PIjvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=urNqgcOG/VrzbWXCcGLN+pX0aRbGOhwKNVrteIsGA4Y=;
	b=4RhK2f3wbaOKGbHZcM8bc+qgfEel11Dm7QX9A2bFa4MW7MNOrYxT+Xxq/7PCa/TpPIuH
	 qfRxGcFdocvLDk7Rq6saJS+Myusfc3Mz+fDFD/sXIY/klGKhuDgrOLv6yoJFJbF5gf/t6
	 8a8QTr/Jc1ALSBkOdoHJ/DcYXlB8ge/2zEQvObOEh79j1YvlAlq6NN6M0bTHgN6ydamlU
	 4ceTDXN19GHyI3ZiO/PZluorbvQXX17YuFJRY1zko5IIzQ1pIKZqBVbJDxt7PvoCOUTqT
	 M86sqxiTS39rLYCqRbK+Seb9lbEU6lqjnc8nZx8bQegOaUxI8la6pZmgWvXPN4zDVog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="kGP5Oc/f";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB464606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB464606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kGP5Oc/f
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so866904f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793873721; x=1794478521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=urNqgcOG/VrzbWXCcGLN+pX0aRbGOhwKNVrteIsGA4Y=;
        b=kGP5Oc/f5yju5LJSuRExjVZcM3fGAthALokpKF7wjscDvjMNn0rxBbVTPjItD0ifCM
         SWs8FiuDDQqKbzMRohVKFH+KyKwjAH84rvghv0SlQNzYY7Bu8GTVcY0tU7M8jSRjRZ6x
         MWxTgsr+utuo9o6ALgpRsA2CIhaVoW/1x+OBjbAJwG5KIsVBvsPCrlRG1j1gOFcF+5Lv
         uFCdHQ2zaja1wh9+wir2csDE+C8xLpQCwj78HpI+GXA6aJtAs7Ac6+dizVO//Qo3jOGE
         8OW15ggEG9EtMsZ0wSj6DA4FDlvw1KelqMblNjFzUGmpKOE2vEEm5ywFRMau8WRym8+V
         E/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873721; x=1794478521;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urNqgcOG/VrzbWXCcGLN+pX0aRbGOhwKNVrteIsGA4Y=;
        b=A6ZbhINQ1ljq7IbT52urrasfh9WgvoE3/q5JdZxYqXKWNk0J3yEonO/03BcXrl4Zec
         ZS9HgAHB1bDSBnZWj37nFwHLgqch67LGgoJtni2fIQbTDOjRCdc4iqfWRWel1FAYh/fc
         +SrtkRxHLD6Vwn0HdrWCTkW9eWNk/gPF0Or+paYw5r/ltCSgQTFcc6JkHR7rFnE0msKs
         MhTxTOQ6sMS4QJiqJJvmpQ3CFzBhS5XiMdSGPwQjJzHZq1TwB+vdVj16G8sFpDmZCXdD
         dX0egD45cdyGcL4sn2BtCwGgIjQtle7ZB2C4Xy7iPkHRx2bLcGu0mPJAxkbMgu+XVbCZ
         5z9A==
X-Forwarded-Encrypted: i=1; AKwUvBxSP3EsRTfMoBtaEw+uOiJDJycOHw6SHByz/kND/7n/G41GDX18AjTIneRpLSTjEihYom6YY9bTi424AeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LwH7NesDA6UQs8egbNFavFuCGqRvN/MsDNT2NbvtjOrQ3IkIP
	oi2lXvujSw8eXHV7j9Z1hajrvrXp3F/6UboINwXQPPgyWd8uhRttbjbTfhRm9gpz8ws=
X-Gm-Gg: AYBFou3XQVD/gaRDFTbfpwYf2bMTUnYRKogtsBpNLS1dr50JSAvkuYv3YAyspBr/Tqg
	tg/1kT3BFvi6vzA+oHevVeHoRraGB+jynFdeiXYzLWR3VAV9HDwSJd5RcXH9r6qBxDjimvYkgpQ
	hNvg8+Mx6SLSj4inBHTMhvXK2+xXSMZcmKUEdr99tP7uQItH0eo85+YDiRJPGrCn6yCAIL+N4yT
	Aog1lEawhiHZTlKU38Gbgw01kowds+xFfqThzrhEuamK+Ioz5AonZFVuhNAvIbj49zT8EFP+IjW
	2GcL9N6cyXZ/Jhh6lkV2k6B62vthWyZFv+69/D23TW2Btz3qhfMgIOCPIpzAkfZpNhVogaPpYtK
	NfTfsoISeUVcw8XWF/9kj1Y07DdTa89jsIJ6/c4DGJXKVe+ur5s/tvBocP5zcQ6pZYwJFz8Em+O
	lTQYudUSQlZe/gnl8DUDQPtw4opMH75p/DL9us18AHNaZst/l7pevW2gzSOYfbKuoKWUeoF76cX
	P+oSTYqARysVBp+1cencOHRy89XFbS5YLYX7MA3fUd4XzYjeAfcFZSsHzi6+hx5cxnkKH0KuDsS
	IwZ0CFu9XBPYhtRc2vVWzdYWqrlHCPVq0hDjH4Tv
X-Received: by 2002:a05:6000:4282:b0:48f:e6cb:ed5a with SMTP id ffacd0b85a97d-48fe6cbf060mr10321901f8f.9.1793873720998;
        Thu, 05 Nov 2026 02:15:20 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm9108120f8f.3.2026.11.05.02.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:15:19 -0800 (PST)
Message-ID: <c75fcc12-a4b5-4e18-ad4b-6ba417baf299@linaro.org>
Date: Thu, 5 Nov 2026 10:15:17 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/11/2026 09:53, Loic Poulain wrote:
> On Thu, Nov 5, 2026 at 10:23 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 05/11/2026 10:18, Nihal Kumar Gupta wrote:
>>>
>>>
>>> On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
>>>>>> What is the problem exactly you are solving?
>>>>>>
>>>>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
>>>>> graph should describe it as port@4, not port@2.
>>>> Nothing like this is explained in commit msg.
>>>>
>>> I will update commit message to explain it better.
>>>
>>>>> The previous port@3 description only worked through the X1E80100 resource
>>>>> table indirection:
>>>>>
>>>>>    port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4
>>>>>
>>>>> New standalone PHY path:
>>>>>    port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4
>>>> Then this breaks existing users, no? Anyway, what stops you from having
>>>> there proper mapping?
>>>>
>>> No existing upstream user should break here; this is still part of the Glymur
>>> CAMSS enablement.
>>>
>>> This follows the earlier discussion that CSIPHY4 should use the
>>> CAMSS-side interface index as its graph port number:
>>>
>>> https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/
>>
>> Should use? Since when? Do you have DT maintainers ack on that?
>>
>>>
>>>> Did you find any existing practice of numbering ports logical numbering
>>>> in this device, but some other logic coming from datasheet? Where?
>>>>
>>>
>>> Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are not
>>> present on the SoC.
>>
>> Then CSIPHY4 is basically the third (so @2 counting from 0) input port,
>> no? Not fifth.
>>>
>>> Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY mapping.
>>> port@4 describes the CAMSS input directly and avoids introducing separate logical
>>> numbering for Glymur.
>>
>> Seems you opened a new can of worms, so this needs proper justification.
>> Again, do you see any recent preexisting DT review which would help to
>> convince me? I know I usually ask not to use poor existing code as
>> reason to do the same, but here I actually want to see proofs of current
>> accepted practice.
> 
> So some chipsets share the same IP blocks, with some block/phy
> instances disabled. As a result, we need to decide whether we're
> numbering based on active instances or on the actual hardware instance
> index/offset. If we use active-instance numbering, then yes, it should
> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
> port numbering is intended to reflect the hardware instance offset,
> matching the register prop, then @4 would be more appropriate. It also
> has the advantage of directly identifying the underlying hardware
> instance, without requiring any additional driver-side mapping. In any
> case, @3 is incorrect.
> 
> That said, since the bindings have already been merged in its current
> form, we'll need to preserve backward compatibility when addressing
> this.
> 
> Regards,
> Loic

Without reading this long thread - Hamoa hardware IDs are {0, 1, 2, 4} 
so Glymur is either like that or not please check yourselves.

I think Nihal says Glymur as 2 and 3 missing so suggest hardware numbers 
scheme follows established Hamoa scheme.

---
bod
