Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E5A47CA72
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217120; cv=none; b=PCJcf1udmBJ/+Ie1vikRVYqLxVNETABy8UJFDBUvk87+Vh69qlJ9nEvg1cSTwkog6ko91y+aQdlVVGEFov9+V90Qrke93GeRrwFn4XjXnjT/hrWZCZ+YlxwyyzZfbuJJv/JsNgZO0yEzsRReosK/0ynI8Yv7pDj+u3GUX32G2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217120; c=relaxed/simple;
	bh=p9H5fJ0qznjbd7WwkOCCZHtdV2j8uNOzcKohs1KM2HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EM4c2MGXMaL8/AZmel0kWrTTrSiDTM/G9Cbp7cj7XowmqP6LGE3vFpCG+oEk4yjGpwrUmLgsv7iPedlWayh2Es9VgeLgDg6Ubb/3DqChTVsjj29SgJPRMGXQrrGjQuhowYq/Lt9eTHhuGwIjNKg96s5exKhvREy3pUHx0IbsXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYGxXM71; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYGxXM71"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so1344225e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217116; x=1789821916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnLavuIU3PeT29b0R+tsLZa/nqbV4NGKsHKuPzpckLg=;
        b=TYGxXM71DZHjLh/Rq+9HcXxkLFjtrbsrxxrp8GJVKX9v3d8viBPMuSsfYI7H+1yUoB
         P5f5ynRhjCrlMvHrco2IhASIwqEgsmCFtyj1QgnNVCW70TjLDsN0g5/fkuqYEDyedC/7
         iEw3V3Cc7WvEYmGocV1xGhp3h85C8T1KyfgzwFDNvO3ZQgV3rxOav9QiSdA+QsJAmu8x
         VVf3ACsBz+5JazTqf5/PMzcNuiW79TUaJgSA286iuHwvwRCiHjWquG/epviTgRJA6eow
         6Y54GwKte6yQgmV7UXDZv612iCll+R0Bxs6bdsWjLM5hN7v45rjAW3kQkIysQmkhYsdE
         YUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217116; x=1789821916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnLavuIU3PeT29b0R+tsLZa/nqbV4NGKsHKuPzpckLg=;
        b=cgRBlObm0Gki2QtMyrPm369Iq8NJvC2em83/cCL0yTZvisYRElDywfiC3JcnMZhR1l
         C1W37tF2wP5O/ZXsmploERGortkjTNtGV8sG6JFhS6a+xS7COH4xNTXCwnP8W44JfMzH
         8rO5H0Y0i2pLcXtQp3fIcHL6EReG8brczyXgauDlAk1yvaUSG7PO/iD9Ew/Qu5g6mHpj
         9gizL/BGJdRSOoQToAivoCGaW+RziLNeDPADWogwxBAw8rWSWcmf1TimOv6mbWd9kLDP
         6Y2tqRnY+ygGRsmFaGPb0iExEpPJaEfmJSvchwF8aly4B/7RSO4ykbiqWJyOe2dPno60
         lLJw==
X-Forwarded-Encrypted: i=1; AKwUvBynTeFooXgDn6sv2arNkMOisfVXozuZjDhh04wmDPWxtXudQmkf/247s8qVHhdFIf1xoZroXJMrISQcV1M=@vger.kernel.org
X-Gm-Message-State: AFuF++k0thrPPGmiSo0TWxa7NfOmoqUWyFJGTpquvvEwI2oNjHgeNk9+
	YZzSlDKd1J4/T66xsc88GON6rGYk9kyJO8W+z3Xr9wPxMr3yVMGi7ZdrOssl6A==
X-Gm-Gg: AYBFou1GwFFDt22Xj/pvj23n5xj2XeAiBrJNU+6yTbgxVXi0HzcYZxqp0CnUTCxiTwJ
	Ma/f8dO5VAK5EHeg01XhpXU31hCWS2beHw/TfT9JCdF0Ri6RvRh1rRGediPSGbz/rFGlfBGf97Z
	e31nx5iIgdODpWobopBUO7SpS5tpO2sQE01y1McVCYiR5Cs0uWzqQX7zlx/ANZHhJGKwhzU44ud
	ltdtbmrIyCf19CT55EPdf9eyT7Xaj6eBItIxAJnbWS/mDfxVzsH3+mESv3nRezmYF1HAZNMTigR
	pPKZZkYZBve4g5ND5wcHo2mswV7pGV7eK9fVUV4sapxTPmp2pWrErW8D45HAaV3aixsyW+Gmk/3
	ZVsJ03MABwKwrcSDwdbyWwjyjgsTxoiVXukT356+lmTiw4/mOhQ1aFr5tYkmgBPtF54Qy5Bdyhy
	ULAYLqi5YweH+X3E+Vf5OXAIKMLmvTvXlQjeBa1xnxG+43RoizPTXLudpjN2mT31yE+P2CAWzFH
	hd3vTNYWx0K8yzKzTJlz5Kw7J6Gb6vK0XFOMLIIhC1OjUkYNlAvDgA+6UPFwN1wWskCMMxycMCU
	Qot88zc5BFNKY3lFfDC+zbGA8KrX
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr188946025e9.6.1789217115992;
        Sat, 12 Sep 2026 05:45:15 -0700 (PDT)
Received: from [10.192.161.217] (82-132-213-27.dab.02.net. [82.132.213.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm226373935e9.14.2026.09.12.05.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 05:45:15 -0700 (PDT)
Message-ID: <7b126162-f412-41d8-8002-6b31d2795f51@gmail.com>
Date: Sat, 12 Sep 2026 13:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] misc: fgds: enable GPU-NVMe direct I/O via POSIX and
 io_uring
To: Li Wang <liwang@kylinos.cn>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <2026090913-landline-encroach-c544@gregkh>
 <6aed7ecf-d125-40d1-a82d-1a7f62049605@kylinos.cn>
 <2026090924-corsage-shout-833d@gregkh>
 <33c9db65-fa30-4d34-9026-98144ce1ed95@amd.com>
 <9447bb67-96e9-43b3-87c8-db231051fa2d@kylinos.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <9447bb67-96e9-43b3-87c8-db231051fa2d@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 04:57, Li Wang wrote:
> Hi Christian,
> 
>>>>> Nor why "fgds" is the name, that's going to be hard to remember, does it
>>>>> stand for something?
>>>>>
>>>> "FGDS" stands for Fast GPUDirect Storage. GPUDirect Storage (GDS) is NVIDIA's
>>>> technology enabling direct I/O between GPU memory and files on NVMe,
>>>> widely used in LLM workloads to bypass CPU overhead.
>>>
>>> That's nvidia's specific solution, but this works on other devices,
>>> right?  Or just for that one platform?
>>
>> That was nvidia's specific and very hacky out of tree solution
> Exactly, I completely agree with your viewpoint. In fact, we previously conducted
> a deep analysis of NVIDIA's GDS implementation code, which was also one of the
> motivations for us to develop fgds.
> 
> Please allow me to introduce NVIDIA's GDS implementation briefly:
> NVIDIA introduced two kernel modules: one module called nvidia-fs, and the other module
> is a customized NVMe driver replacing the Linux kernel's default NVMe driver.
> nvidia-fs creates a device file for every NVIDIA GPU on the machine: /dev/nvidia-fs<gpu-id>.

I'm not an nvidia expert, but IIRC they switched to P2PDMA, which
is supported by the upstream nvme driver.

-- 
Pavel Begunkov

