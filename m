Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A92D3E1230
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249033; cv=none; b=ruxSR0HkMJ8YnpZV8xzNyr61S7ufpgJwcHT4ZiR5GM22urf8VtJYivUN5YCCGKVkJWYo40Z1ZRjGzy0e67+BvyH2TA9IHO/aEGhjbRF7c0ivdz2DJnMtNtsRZggh37DOG9lMGheS1j9ewYvu+KjFgKN1sYPRAva9b76NdxWOfP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249033; c=relaxed/simple;
	bh=1ItKt23VFuQcVXcDDYvLT16i240u2IaHpmq0QG3aiOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEv/BMnw1x1N6GovEZ230QRANgvhbc5Di8wB5S4jcFN4ELn9RLNx/qkZDSQ0vvto2PCJCEsH59xbRpS33muUyQhHCNGRCtZjnRrpxo1HOdfrKTjpt4ONtl3JzVsBluDsdk4TSg4YrXSWjtv2kHqB8e+Uwma7UDzBmqMcr6scK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so244927666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789249028; x=1789853828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eZr9xRtQAbAJsVC1Pk0qBFaqMmdYuwqmgOvq06yAfas=;
        b=UKHFdSZGbrNqBRYtr2CbxvSmXjuyfQGrMOqgB79m/Bo5ana2zXhTaKAmon5+mPQlVJ
         nCHbOY12aeZ9RWoaT77e/N77qVzIoD098l40745lHN7RBykp+YDg8ayIFSzyo3Sl2TC0
         7yWOm4KyGjWNdE9S/3PMWETfni2EwryLwdS9crj927CAuctsdMAXEXfMVBUgTZOEyVma
         tZ4ZObHfE2M3p3qM+AFXRuSY9iENlVU2SvNuSion8dT0lfTg1gn7/oWAEPBtVcM0vspZ
         BFKFivegfjmPORHHXctul1UD5JRt6Y3l89SzlIsHXYmJnH/LVkxO6u2ex6C2+bgN3/OG
         wjug==
X-Forwarded-Encrypted: i=1; AKwUvBz4c2k9pmFk4SqGot2fsSKweD/YlzAKGUPKrW6oc8rkMekxyU7EG2wK7HT+fnQv2QXYZ/9SF+gHskzGqQo=@vger.kernel.org
X-Gm-Message-State: AFuF++mgMX0NLgIOnOzn7/A2xAEn359X09InE+EwIpJNeoix93veUGTP
	0RBoc8VueM4L/2zM9phWhebcCb9IgTkgGKySR9A54UoENOUwh1HlQES4
X-Gm-Gg: AYBFou0v2Sb3PdrFi8k0ixPely1v7+gX3E0v8zU0W3z8BMP9jyiaL2tAzfaJG8W6zeD
	PypPHbimIuR+q9xkUiHOjNdhSMYlwEMXKqnkg4vkTAEFBd5jbY/wOO5nLYTo0mzOx5QlHUsPONj
	lY9pdbz4o+z3W//tJlOtGcPlk3tyAwAF2RbgwIqvgtZ6543l4ocE4OE83qQFvj9fhdxlOCKwQ7a
	Xfc2GNJ8liVGoETyve3/Hh7uS7Fa2ZLvC4gFfmKaKgH/8/GnjXEWW9Dy/Ntbymc4cf6Sj5v9qbL
	LGVrZMRTrJuJYzyVmMvD8qV/HRVsV+30r959Wzlo7yKaDx4So7DkruQ3yBD7VxWOib7Egsum3Iz
	+YHxiSMAdPHSozVgmfgLiv7lnL7xyHwH3qyDwD61TM7gTlgAVHbClw2ErKgvLMIAthja/RxkivV
	5lr1p7Ua3OPAvZGn/USF386u6j7NFgL4fRlLeltwTGk9gHVU6tfw1IDkraa/fwu+fdpAQ=
X-Received: by 2002:a17:907:3fa2:b0:c26:1648:a072 with SMTP id a640c23a62f3a-c29667021d6mr511111966b.45.1789249027630;
        Sat, 12 Sep 2026 14:37:07 -0700 (PDT)
Received: from [10.68.32.41] ([5.194.84.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4f77asm226666066b.8.2026.09.12.14.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 14:37:06 -0700 (PDT)
Message-ID: <89d72a22-17ff-43f3-a9a6-331a644fd67e@linux.com>
Date: Sun, 13 Sep 2026 01:37:03 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: efremov@linux.com
Subject: Re: [PATCH] floppy: flush pending work before releasing resources on
 init failure
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260722034435.13432-1-kmehltretter@gmail.com>
 <aqUcNyP9DooWW9kf@gmail.com>
Content-Language: en-US, ru-RU
From: "Denis Efremov (Oracle)" <efremov@linux.com>
In-Reply-To: <aqUcNyP9DooWW9kf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 12/09/2026 13:33, Karl Mehltretter wrote:
> On Wed, Jul 22, 2026 at 05:44:35AM +0100, Karl Mehltretter wrote:
>> The flush used to be here. Commit 070ad7e793dc ("floppy: convert to
>> delayed work and single-thread wq") renamed the label out_flush_work to
>> out_release_dma and dropped it. Restore it so the work drains before the
>> IRQ and DMA are released, as floppy_module_exit() already does.
>>
>> Fixes: 070ad7e793dc ("floppy: convert to delayed work and single-thread wq")
>> Assisted-by: Claude:claude-opus-4-8
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Friendly ping on this patch. It already has a Reviewed-by.
> 

Thank you for the reminder. I took you patch
https://github.com/evdenis/linux-floppy/commit/acf6cbd113f0cc68dc42e2ad7a83dd77ae2def04
and will send merge request to Jens with rest of the changes shortly after.

Thanks,
Denis
