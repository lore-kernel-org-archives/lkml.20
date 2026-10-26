Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005699;
	b=14CRlCv4hAruMIYndf9dzFpITWjFoIzCcKJJlMYCl9RSuMZGs4abU3qlwcJ9eaZ8SaMr
	 U7kaMoCvOvm4ePVB+6ca3mRLOYWNrk0U5Cmd+BVpKXbndtTLWIjgHNTYZKLfurnoFyRMS
	 YcnvvUInF115CrecK0JI7iIUwEHEWiEE1AL2wKSn6U4T4udy4MuE8mgY6S/uy0C9CpM16
	 gxI2vUN1BcJOkgdS9giaqvkWfSYqI0JMIbi9RuZJx/nv8Q80CjtJ5WIsiI19xPxmOYyEb
	 knrFVHtgKv8TKvwzE+b9cVwKMwyJJFy4Tn61x13fwhiDjqoTVg0gMjiHAokuG2YTQLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
	b=DJ+e1qdoNKj9ejTAp6U0LZ1gynRyBqGYUEpyD83St4TA/5Mvzn+gOaud7C5bnIFRrHrN
	 lilHYFz759x02qqh1lcD9ZfACFgLaxJPriSZsCe98jJVcvHyHeT017g0yFB0XTw6Idn9+
	 m0LZUkUxH/x4V0qidSvYedN35uq0rTE+b0fdxNXrcob0gsvPXrARbuFLN7JtNesC0utJE
	 tzXLCzekgmQOXbepZpAatc4QUCXlunAyfrIqw8Arombnp4AussvlCiXMDg5jD3hVakVRo
	 OM0wJeQjtn2vO8Wic1t9nQrPMJ4hFWvMNKMljb3zXgEx24JGBNGL+c1PKWKD31K9k3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4efgHo6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA2606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEA2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4efgHo6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1518621f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005696; x=1793610496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
        b=Y4efgHo6f2uQUfgBu6LlKapCdLVtJ/9Jq2r6veR7FmHxZW0Gk7M/8OXCpxpKXQhH/6
         Hle3zjGBdLBEcSglhs5YSab0EaZ8o3SnJDDtUi1oieRfAVWv3oWJrrV+9foFwo85Upg3
         Zx3M1PZRAv94CambI4tsHrJMj4YqZsRfhhTUsCOHNAMHxByhIxgSr5sEJb8T7dqRu7su
         AEJyUzsY7YgDQt+yeRYNLZHmcuxVAdTeYj3ci0v6t+iqcTgaovEoCOTNUYbTm810n+0/
         40lJIaS6oAn42zLYjtEy65RTllGTSYNG6SApOzNX5JhL+uGbKd2Eq2Fj/7kpbQyQqrQr
         OmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005696; x=1793610496;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
        b=ABekw7v27VF1IJbfBv4w4ugBVrjiliQpaDHD58/Que8Vitqwdkvo77CYhu2RX9sbet
         uxlvMqCt6p46phgAJ3MIfk0xAIq6Nhqpp6jYTkEmhlsE6Okt22REVuHGiaPPs8TloDw9
         f4VQSVtg7jKRLfVLlXrtqLJQJJpEUFMpa6HseXUPWwlW+3D7SCPGCrC5ibpNql+nmtuF
         LP3SlMdCbfYikxGyrshtHNTnlsk1jQbVJjKWY4RPvgjfTJuhv8dI2HUzZX/Hq8syj6f7
         6GJ1K8ehDc5Sz3gnbU1HHkr3GlcHZ8hibGQIcTMVOZZryHXmOo8oLRZBRp/WcSQ4gVkP
         6HWQ==
X-Forwarded-Encrypted: i=1; AKwUvByJd2qqYHx0G9o3Txa1/x7e2VfN9fZZaHesc4jffP6CMbQJCYKmWeerLdaVydrnEVd9UcJ+x5JxdjbIUys=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1E1IhLV1FQ6kgGydVLT7Pv/bwK4IJHth9OQZEU2RpvqvRm34x
	iU76QfITkLyB3L3gYcsz9ErGeDFor3+iuEDDeSYHHCXXsx0c65Vbg+a6yjJsUjTI04M=
X-Gm-Gg: AYBFou1Nz0zMNuOUjWIjmkrgko2dG1/BNp3ILdasUvj+6RJ0xH6rBdQR2cqoyFxJh/P
	Hyn31nHf01lH4GPhHeruC6KcWxesjNPQeSEfaB3+XA6iOb3eVKTH/h88F72bcl7q/s6gJmwuGt8
	tujFvY0AgRBSJSsvYFrI7ZfpsUgISOmRDJd7iT2JmMSfIAnxjHz35A/iSFF5N5F29Xvmb1Rq8/I
	lmjws6J2W3o2tUuh+KcXQKQxWtKp6JxnQJpVnJ9vfeJl8PWs4axD+MmGnxgl/SApBvYVB+drqp/
	El7O3CJtdHecMzoXA+d2J46eZ5YF+AP/Dl3lJ4YGB+Mx1+vlnpqLWqq3JjpBnoPiRsC6WJ0Cf7P
	OJBaxvI7SmTdkAyzof24JF/Ykg7cAuvcRxE/OKQyNhBtLMOro6crsdqdpQQS1jaa/EqqmHDQwuR
	dMmRRuTCTWZfGVfl1i7DG1SM4GjA8VtHtTwUd0848eDSJ0yUUOMQ2mFyp469RqvSsJ2xbpfsv6f
	UwzwQfPJLD7N4YNvTvKN4nvYaTE4TJ3fLfwlhy7ibLnTdBSBXkLs/uzs0cGAn+MKzU=
X-Received: by 2002:a05:6000:4b0b:b0:48e:3473:3c60 with SMTP id ffacd0b85a97d-48e3eba34a2mr10341811f8f.57.1793005696454;
        Mon, 26 Oct 2026 02:08:16 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm16380307f8f.32.2026.10.26.02.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:08:15 -0700 (PDT)
Message-ID: <476b23ab-4a9b-4902-8d94-541ec539a9b8@linaro.org>
Date: Mon, 26 Oct 2026 09:08:14 +0000
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
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <D2XTuBJMTMPZaGrUZYisimpk5Xwm95Ms6ofRtgYOPmXT-xG-3Db5oAjBKeneMRsN9rp1OCl11piUQIlKIhsNzg==@protonmail.internalid>
 <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
> 
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
