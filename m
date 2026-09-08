Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328923D7F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832077; cv=none; b=IsQA7aIvXsFJ688vJw86882r2c6WtJ5AvMzdbZMYTMQ7xpa57LoqwUVGGn5Cra6o4s1YoKNFQ3OvVzu/yYkM5ZvNcXjbmCt3J3ioHVqdi5hJlp6EkYP82KeUH6Pp1jIpu0YxMhjGV9nEfZp54Hu2Nb5zVBe17CKlLW5tbdxMPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832077; c=relaxed/simple;
	bh=6zo3xALxxS+irk1kCXvT6aZvvEKHcRwbGKP/kCF+mCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXJts7iWBr1EowSnWEsZlKYwMiY0zAKP4uMo3MQibai9gCE1QzUpdbKVVk5u77EBw9eqGE8c/1vWgW+LmvdKYkihnkW+ViLlSMBwye1gbSDTN6n0QsrWdfLd9SEt2kz80XhO9XyHLpAijzI3Dz76ZTH5xCNuKPi5i+3gAWHjU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcrAEs2u; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcrAEs2u"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso3893577a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788832076; x=1789436876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=;
        b=gcrAEs2uUPpbZzF74TnOXznsHzPqy+rP2SeIwujVZojgNUtQNQsbYF+qDUyVNofekY
         Bwok6ZpNLVn/OJS1cp8uIQbu2a7bfufgVvzydXBQ+cR70W+elXDXmS0ukztXZ3wN2XVA
         +I4FIwKDboKgP65XKOY2Qs6s/iemSionCFXCUOvSMm5RfYC9FucS2s1Kh1nSo6MjQiBY
         0Df6fCzfVnB9NON46Kf0eWkBOM6RvCnRGnLtAm06livfS7+um4tlDM+V/cSBS2QHb2Pl
         irrE8FshNyrNpxbJoR1VaLBi7m2RQHCRlUE6a/IZMVyXuUtAskGgbrGGOHw+clYlNPp3
         aM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788832076; x=1789436876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=;
        b=GYc1Elbt5/j3aBh4pgUHK3bWNffr4Kt4OWgfgyPIvNt9hoc8gmN+Q9TCt1EJPHPrZZ
         t22gCfBvWf10j4LsfvYtzMe9bfh9kmXCax7XI9O/dk/pW50KxA+JD+MFhXSlRTCvC6O6
         WX1R9JKkSJ2PlepZUp8yqKi4C4EH+vbs4NVBFocMKfU9pR0VJrXQnKFftWuUEcf591FE
         +sn/t/9bMNTsPHMP8kymTjGqZ17dxQDG6zPGd+xnGXG71rajeJMlgBA5XlTAVBjDZAAX
         aaW4KvHKK4ahxOPOHAkGzmGlN3G/8y156O11Sf4ZNtrNMugKp83TYkCtUqbPIvZtnK83
         5uGA==
X-Forwarded-Encrypted: i=1; AKwUvBwRFKg6Tw7D0eqmQAGbw0wwPQFBh51L2QI8QNOLzkTI9njDp+ghBMIDJCT3Ws8zVH8ilLcmROtevQVC3VE=@vger.kernel.org
X-Gm-Message-State: AFuF++nib8hxX5sMnWeaa6jR/p2n+ix4VDHEmbAskLdQX9H/YAJ8bqTG
	I7vUTrJXMw6bv+KSJsL8zPchsrp+Vlip+NzI94XCIfWzuSbxldCDbLOv
X-Gm-Gg: AYBFou3mtyPxHz7U/gtNbIsOGFkrP0evLOM2KtBIvemvNz/DJsz2LIFIj/0AMi/7SxL
	8ZV2JSe/ISUgU2CvOFXFLQechcnAIgws25hkBhbNiCJv6U1hzzZTgWuqZpreUUiK+eA4HEdJs0D
	CS6Enll+Vz9A6ImOaiMSknVPwY1fIcLsyaqRfdJATRfeEAAgf1KaxfT3vBqfvs3tUWk8w6BPHGr
	fpmu8R+dUsMNFmS8+J1KccthT3tX7739PfDQbNhIgXjeE8rT8s254XrdV6vODtHuVyRlgcbD27f
	wDyCUrXMfg/o9vbGkUGZ8ifrUHw5zow/5DlbR+Q1fDA1eZGRwfklaS+s2DvKEW+/wHiBKveLAEq
	rH0XVJU57r0u3kamGAcK3ZlB5PwDtKoL9yIrh7ypdCxsMrzQesEx9x/2jBITIVucTimmDJ/75qh
	Gg5F5HpHH11JKathSRQkPfm9eX4ibQjZzXOowhIohI7E9SPfJGtss03krYtGX3FS2Z8tScFDf/2
	INvePl9ZUcys6CgAeBg/u8SDsOhhScqm00d
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr37945657a91.23.1788832075923;
        Mon, 07 Sep 2026 18:47:55 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm23052621a91.11.2026.09.07.18.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 18:47:55 -0700 (PDT)
Message-ID: <3dde0b18-ba6e-466d-94f5-e5ca3ee083e8@gmail.com>
Date: Tue, 8 Sep 2026 09:47:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: arnd@arndb.de, olof@lixom.net, soc@lists.linux.dev, ychuang3@nuvoton.com,
 schung@nuvoton.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review.

I tested the change and confirmed that an accurate 80 MHz CAN clock can be generated.
I've uploaded v3 with this change included.

regards,
Zi-Yu

Marc Kleine-Budde 於 2026/8/24 下午 06:39 寫道:
> On 08.07.2026 16:24:57, Zi-Yu Chen wrote:
>> Add controller nodes for the four Bosch M_CAN blocks found on the
>> Nuvoton MA35D1 SoC.
>>
>> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
>> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
>> the CAN controllers receive the required input clock for 50MHz operation.
> 
> 50 MHz is an unusual CAN clock frequency. Better use a multiple of 40
> MHz. Within the limits of the m_can IP core, the higher the multiple the
> better.
> 
> regards,
> Marc
> 

