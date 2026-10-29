Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288984;
	b=p3e3tAG/rQ7qwHWpJjzOicxlE9+xOktyO5sl6qqXu093z5D3ahvUySJyJIeUm5tZuhLb
	 +GEuS9y9TS81aW7Fs3KhQjjJ2sjf8X6W15fNGdgTm4tdJIkd8FGpRJ3Vfxp7qiGAI1N2p
	 LaQDilSgOGu/2XlN6081Xa/Gid2FRpC8DmRK1UclYhkVgHHbfMpbScmko8Sqq5O5uuscx
	 prLsHpSWO8/qQ0ih00NCjqtLGLagkpXZNj64iNAWdZ0z27nMojxSwP1Xk/y6IYNAppUmh
	 9gtakSJiI+aJ4LN4mCmQoWGHPOO70jKASPdqNszkOwRgdfGB4wnD3bAuuLTAFSYDaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
	b=ZQrwaYhNwHUygp3ibcmZNb05ON6sSEwIiS4o/O6My6w2RRdh9h2QYdHJZhBSdBjRqo+T
	 KJCqaCUMgujgyDKYc34zICM3qiKORdm3JxOrL3mfZzXlW52gsLG4Y09dXQ2zNl/TE4Oh1
	 Pwpia2J6+b+wE07cINUCBsITOLDZqr70HFXWaaDl4IrniVwz4SHt7/r/hYCoX7B3gkvA2
	 cXgexI+qYbxiggSNI5dDck6sWCSoOq+nb2M3afO8Fxpukr7v5fHtAqEgmczyKOAElLupv
	 E7ktIBJgTaxNC6QZc+CFkgQW/pEyYmpmtLw3xXqYVnkMjDfBKFaEb8NwdLP3pdGt1Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2KtIZVB;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24986606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24986606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y2KtIZVB
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso336349966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793288982; x=1793893782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
        b=y2KtIZVBXtmEzm9KYq10is51yoTw2GIuRE3BfODGCqJBgLFAABS/s3IRpKGSZ6mac4
         4PgDjfCDYP9pQTkCT+pA5MmplPx6MILiJ2tWeOUVLPnqgPZbrFQPP0pkgPr80YCI4TfC
         WYGNyfMVMpzS+ZFqxQ+Ec6IYWAw+K8DzAvADEdvoM4lHZEOGSKdCCeq77fF2DL93h2zD
         PGgEoEQDm1axADypCf0Gqic0C9Xy+iwvJ4CjrhqSV5w27ATAT5suICLAp0KCj4YKNi91
         SgUORdM2cB/nXVPmXDwKtLKdO4TQ0jxAoMMlVJ0VMqjBUMZZe/VskxGYJDptGuMrho8C
         pUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288982; x=1793893782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSgvmgpq5zwepgf5zmdwKf4Rb7D77FgNf6wQESej3Zs=;
        b=i6M3ftYG6SOV4ZFVh4pveDegXblujxjc8CzPWtfj5R3o0dXFktwMgBXrbbXR05oTPr
         QzvOwW9CPoHvZUvVnX6G0ZgkDUNKaupE7oBVUQbI7M0Eaay+COzpXKSh3mg4oBND8VA/
         DvWxni/sgX/gxs8uf2dlKW1iVd8Ss+lW2QqM7pmvZthZccmHEiOjh4PlfCpXwyIErvl6
         DE+88/nwioSxNb4tTflkeLczTlrdxG/JEcZfq4mDrMNfSkC9dVBSwgE/+0R3dSwukEpn
         n8E6ROcmrYcmkszVX1VkLg8/ZUyvmT7IMv/SgcPiJypvzH3ukz0+NNTX8u39Sjqklc/V
         tBJg==
X-Forwarded-Encrypted: i=1; AKwUvBwSP7wUjaSC/R23gzPf1hSQXJ77MF2CRM2tRGPwYqam5ZmNW8roRAMv+jN/u+mZVJ91OeqMiNlLO1UJ+po=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6KRZqt9/ETLThPcknRIefpp3IjCWJP9+0FS3Zio7qCa71JPih
	sdrVDXRA8hO1FdFxU74KC4BZ9kOwcyCyxHR5j50RTMxqS+ngtI8ttPRIsg/0xLL6LFU=
X-Gm-Gg: AYBFou3ztEwroaKLmkWForN+6rSjUuEdpnj2jkXt+F1BXYZMB4CQX525Hup5DKFyvjA
	2NlrQUj59k0JpbQUgvC3+C8t7bNTccmIGERt30F+XhDte3ZcXZpf4PnZQ1KLN4+b8svyuk8+buA
	ZqaQLkVkqj7LhRp6bcq3Ys1bP6ZfpUJqIHjGivWtuGMXKgqr09st6CIFdgRu6biK28IfmUVqAvi
	pE3LiBH5end0dm7t1qzydMoq27ANeKD87A5L9ZQGjf6BWKmfKm9d0LrADvsiyZKqnm0XDPSjn+A
	DHt7m9DqlJJcr4c9JWNPg6LLaMIwyScDRSCqyvm5UcUFTbqYoH+cxSbIIOye9TpAnYNufzaYv8I
	bI9Gw/RBbkjbGlHhKS7h45MoWWCcqnrKnhIx6diB8E+QT6vxQvW727DNiuRL0WriMlkQLAMJdYf
	HJVz9uzO7guW1IZcBvtiOUpL7vuPRaZCVNVy5q4fYAjZ7DIJSKZFCJqkzJy2e2mDoMOcFZrrEoy
	bs7eP7xCD0JHotzowLzU0vs7gxsq+Lm3T+UCp/V3k31CHpamNAelxrjUIczIQDklCNE3fpuQQv3
	W7bVsUG7j2kW/PRBHp361e8l51/QfimyoMNvAPQE
X-Received: by 2002:a17:906:7312:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c49bdf7a5c4mr522279766b.43.1793288982497;
        Thu, 29 Oct 2026 08:49:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca264d484sm7985666b.27.2026.10.29.08.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:49:41 -0700 (PDT)
Message-ID: <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Date: Thu, 29 Oct 2026 15:49:41 +0000
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 15:46, Loic Poulain wrote:
>> Is this something that should also be tied to frame_sync_en?
>>
>> Also, just thinking out loud, are there cases where we'd want to
>> toggle this dynamically at runtime based on any V4L2 configuration or
>> pipeline path? For example, should it be enabled for the pixel path
>> but disabled for RDI?
> Obviously, if userspace subscribes to the related framesync event, we
> should enable it regardless.

That's the behaviour already :)

Again though we want SOF so that we can drive seqno which really 
_should_ come from the CSID signal not from buf_done() *

---
bod
