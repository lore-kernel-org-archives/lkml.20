Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582186;
	b=GH9tfkaIlylQRh7S6SDw/4p/dg57yp5/gDb5fsIeNXOt8+W/lSK46UUYTgEgR74Wn+0g
	 9yM37XeVBAsruaKMC5zyUQaEKMqq2sbqCtZIUIP8hFARYRasya4Tatq4+S1YvrN566ePq
	 3+7QlAuiTSn4mSiAKjeay9H30oUOtXY4x9BdbmRfuEP+9d3/pJfjgySkNmEWkrUtHWTCl
	 UYulNgoTfKSA++PbD2FljjL09Sv93CR1iGgxmAr/W12tQmxdwniU93IKzEJvnz6bvCCeD
	 y0fpItVuMAVcKNV9RH3BBlF3Xb4deIzk4oLBNbr4EsY5tH9fQ0s9XYnkioYB7Fj6OPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
	b=y9qY1MkzmUd9aEjZXColzpARi9Ynz5wO/Pxhbex9GYOZrlcWxBdK4fu58TGHHLPndWIG
	 bAxiUAzKlEZpyxWVxOi5uu2rFCKD/9E0EeSVJlFqVdCPscNQ+5oDyyOpHciFmkOi8SgMz
	 JUw8/0iU9T7AGxNKjx8whrZxQ8kf8I/avi6N583kc2hPezASTmDmVocFyjK9fMYDvjwb0
	 WeHQVCzEI86Mkj79PmSjcPKM7CK1QQhuVfswVc2+YutztR3lNgr6e5U1ezE6bUpiG1YVK
	 NVufwKoVoLbBNIVnMO1tvAifvRcgiSH3qStysfWydkGMWc53G1e8zuTLAFYugqABtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DmaorVqr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC98606A882
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC98606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DmaorVqr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19130315e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794582184; x=1795186984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
        b=DmaorVqrPTMOVQ5U8Z4ZV9CLCYtOsQghBVhxjRZZypTvKdqe3/9BTAIM0++jsMVoso
         HL94qPhZ6o73tB99jYC6lRnai1gN85/OxOeeR3Lkg844jP2jHKTpgBrahU2QuMgqJM/+
         XltdROzgrWpbNnWbK2/6Os4GTRQEuCuSlxe6UD1NTKH1LhgkTW1ghwMu1GF8Q8qrJKxu
         9FHDPiS/HxyYfklx9p5B36W3I2P11LjAl867xXbhxpHKjzueI56yVCLSUcNwIHFDqfvw
         4J8ErN3cxdBuElgNhzfCnl8rrjiU4Z56vYCEc/otfDuUD3UYw/8na6FbuFHbVaDKWTQh
         LnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582184; x=1795186984;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
        b=WeXefeRJ0MSWObo3ocyFaHJwS0sTyECZ2dGMLiE8sdek2CH8UA3b7CmGX+3q8q2RPS
         rEf9oZQsU5jPMJA1RtqxWZbe3kVwL/QuTNcFMM/wT0ZKkxYl8gu1UwGAOFo/L5FgUOu7
         lXMO2dSaoYwEtUbc0qegrgeyv6LtPshs2zMBvi2ZMF6In/6EXcaHpqS5dQrbcANHt1Bp
         7cY2A+bmMjWPAccuG5iL/SnqGJMtGIEe/Uo7w8by0It7vD4Cgu3KgwgegF8J0XF8cXv2
         glsNo9bUW7CtUumP3EEjEfmCzXGlGZ6na0h0MeIDHD+0vY/e/sEjgSZpoEdmG79SZ1J4
         vAFQ==
X-Forwarded-Encrypted: i=1; AL+hErH23xErU7KUYaZQPymvLSPc+5Vj00wAqnzsgKyoE8G03rKYSPoEyhjR3tZRM4JmD0lXTvrbMY9EK6aDZ5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tA68YcqpEqZMwfBI5U1DSww2NfxuqBxLm+P5L9y99FjNqxGps
	8GqmdJrjsTMdKu9u+x3DET8kl2wvjYqSIUKK0gt8KTh8FwxCKq1bww2dWjNFepzV/zY=
X-Gm-Gg: AYBFou2wco+u+cCUF/4if+rPggMs5lPn+YuE/vi2abLik3LqlpAd1SfUm7HYDtrwDJc
	07A/5eeGsluMlbLlbZUQjOkxcSphOt2lZ0fUV+Gby3sXCpSfy3OuFzvDoPzxHYCq7WO4uYjxdqO
	uz38LgjglzIW7Zy/cDDOmfghOd7JaMWNRFSbPgvByur78SdaGpIM/g6YvOJfh+CwBmfRyzMdX48
	+pp0pMVGpXeMWAlxSNrBPrsG7ITPekiw3fgW9fqB8KAg5OKkpLZnYXri7GfjrcORlH1n/sWJqQe
	sxZK6IG//FYqLJsffklgewJBvWBNC9vNVbOgtLhBgNnrX2ECIIUG9qrp9p3G2zpbKFLTSotyk8h
	Q9eOSjwk/MzORygHUBIR7gOAkezw4snhMMd2tVVu0eeQIJVGj87JEy/X71jc9Lw9gXRNPWhb3qo
	MMRaxY4L/hZD7eOPzoX9yENYwxBa/1T1owckXwIUhdrB9vtp49OhgmjyWXyQOetcy4SI27V1T0d
	A5vIK7Zku93qRvtii39zWshqD3Q7cHCgMHNbd7i/bwCa18872Z5Qo+XUdXBi8mR6dRv3q22VKAc
	eH0uo2iHkKuL3mMQVk6pDeUCfyhmLWcsk6/jCFY=
X-Received: by 2002:a05:600c:8b76:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb55a01a31mr55189845e9.4.1794582183857;
        Fri, 13 Nov 2026 07:03:03 -0800 (PST)
Received: from [192.168.0.167] ([51.37.10.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm29719315e9.4.2026.11.13.07.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:03:03 -0800 (PST)
Message-ID: <4edafbdf-d0ee-473a-8f11-92be44877583@linaro.org>
Date: Fri, 13 Nov 2026 15:03:01 +0000
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
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: heikki.krogerus@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 02:18, Xiangwu Lai wrote:
> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
> 
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
> 
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
