Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5D38A714
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150093; cv=none; b=mKwwtluVoPsWsiY5gxZgzomDcZiRtxK8o+M46gQJ5PkwmEHgONdiCBJIez3616R9OOvShU3X7HMiEt52ZtqGqWzYrpsHnrI3MwkKuLNI17drFVFA2/EW/94TsW7wp1f4WTqHeGLLe9Q3D/hKeOPoxn5xxiFojPsGb+ojrua8vHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150093; c=relaxed/simple;
	bh=5q6RzS9P+QCHEJ6QonOuHfBSp8x2DpnHbW5+cuLhzdg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MUWfDR9KwtLFTZDQekcG2NUZ32+ZQGqFUQabkEhqy/g4ezTBIfuDR+1DNLWZcZQ/C8iy7fUUv9mBzwivt0UaOYzz4rPBgObDZOEWaIw3RZW90knne6nEnrLhuk549WaNRMB3mI4jdjKXeyTTenKtZD0XKEk3QM7x5ZN3fYXhD9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofb9+bY6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofb9+bY6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1427644a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150089; x=1789754889; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bFQyaHFSe7NbqtGnmovgEQo/OOpNNeM1Djaojhppr5M=;
        b=Ofb9+bY6mxaKX1hjL5KlIBqstgl8mzbR56VpkJQBwM6GJvghAPbtE3+XHf+aN+Eq+q
         ryOIG5JCeWKM8QX9B1+v4ZWlp2x3x8YGUHtKLF9wttIHG/WvS9HtO7nZUhotE8tRrgwe
         uEoFoFGpiePP9/iwS7kv99zu/w4pvJWcYX8KEMwN62V8N1npLki6cf86U6GV1g/Jrc+/
         nXQ+E6GKoTzrtCdld6R8Ew3/YRIuyCsyZ4nRLYixivSqhYXV5t8eJyqo0PyevgmCPAH5
         75b3YESb/XnrT9Ie3F36zL3gqm8hQG5/VPV9OakSdXDOdfZQ5NoVkuyiQtayE40MzeFG
         BYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150089; x=1789754889;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFQyaHFSe7NbqtGnmovgEQo/OOpNNeM1Djaojhppr5M=;
        b=nYQiQ4521jE6vRItVg9hDD9qE7wCR5p7NZBN233FrQmBXtMSCRgECKttL9sUfsfkf4
         PTlrg6cvzT4uYb5jfFMpVp2iEklOkmPQd/Zp4JjYORGLK2ihqOj39SmhVZGTp2HN/4RC
         mTjAoCnn4nFx/LWfvNB0w1aOLSvMoFDHZMd3GK46TTvN0yoSIqxRFBp779o1lqSH15tm
         W4S0vnOKCUpad8AgN8/6eOWE2osBpnBanweTtkZf/KQjEBQ7QV1ot1gyDCboBwn8W9pl
         EoUHcJ5q8g5CZm/XDYmbUftkFha+tcMyeB06FQomEbV9/1SBGtfwaY1xLgUbw8Zd6VQZ
         MHBA==
X-Forwarded-Encrypted: i=1; AKwUvBwA030ZdMi/yKcpsn6D82MYB1jqp6mGoHv8ypu9Xrs8P8KtaKD++juguKgNMfrkbRsqqIWZU2t1URHhCKc=@vger.kernel.org
X-Gm-Message-State: AFuF++nrTH1tkpcjODWDoqS7EgkpQM3yLzYaoLDbTp45TrknUeIgzoTd
	IHyaipbMX+k2djOp0iCGmDrBnMDBptppNORTGCFTNweH0cSplmHfjpemzb+aGQ==
X-Gm-Gg: AYBFou0E/S8feHLUO26NH3WE7cjAOki64nR+t8/XQqtgCmLKTIBKvRkxOpn//KwrtiR
	GlicKcFmyyYGxdyKjFXEWnKb2QxS2G+SyuzLJatsFkECEN9hcp5maMLB84HUzzTk5DFUG7KUDDH
	TyGD/RQ1+3DpkwG8ED8HNfNlqhNgR+4qzoPnbCfpuJ/+NxQs5c0mZtEFkOsnObWUj9T/cJa8riP
	IgPVm+okfSDLuK5R71z9IZPzkF9ODfArDeiYRsxAiUiutB57uug/pvhJ3+pfnYgoSiboms2H4O2
	p1y9UVNJeq1Xat4HhjePCDdtFIT3zPqQP295ZS+aRR81AqbN//Yb2HS4KTLtYbAbU2auPRYWfyy
	z+M0mvVgODzwFJ/2oueZAF+bVfoiSDO09CNzn3laynKSpp0GByjrDV61uC7BLfCDs3GHBtOUaT5
	MWshrcAZ+3a1tJSz6CeCQQhmvR4IeTR/2x9J7k7aPvk0ZlzgK6VNm05ZhMSz4Tvioh74uowaDLd
	lhUYCFZUF178KVM2Vw7Uooc92V+rNoclxxhLVMXZ15Oika37bg/Pg5ld7V4f+qx78f4IzjJ83YO
	RQZkac/rL9waKV+a9wMKy7e/bp3YzEL+BKoUBv2UG8qQiP+B
X-Received: by 2002:a17:90b:560e:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39d9c1dbb26mr8543491a91.12.1789150088659;
        Fri, 11 Sep 2026 11:08:08 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d8aa131sm1695083a91.2.2026.09.11.11.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 11:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 11:08:06 -0700
Message-Id: <DLCORV3V97BJ.2PEIXFVVVAI95@gmail.com>
Cc: <dmaengine@vger.kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Yuri Tikhonov" <yur@emcraft.com>, "Dan Williams"
 <djbw@kernel.org>, "Anatolij Gustschin" <agust@denx.de>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: use assigned variable for
 dma_free_coherent()
From: "Rosen Penev" <rosenp@gmail.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260911035941.200551-1-rosenp@gmail.com>
 <aqQYk44DLfkT8w4l@SMW015318>
In-Reply-To: <aqQYk44DLfkT8w4l@SMW015318>

On Fri Sep 11, 2026 at 8:04 AM PDT, Frank Li wrote:
> On Thu, Sep 10, 2026 at 08:59:41PM -0700, Rosen Penev wrote:
>> In some goto paths, adev->dev is unassigned. Use &ofdev->dev to cover
>> those cases.
>>
>> Fixes: 12458ea06efd7b44281e68fe59c950ec7d59c649 ("ppc440spe-adma: adds u=
pdated ppc440spe adma driver")
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>
> Please use dmam_alloc_coherent() to fix this problem.
I did just that in a future patch. Might be worthwhile to have this
first for potential backport purposes.
>
> Frank
>
>>  drivers/dma/ppc4xx/adma.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
>> index 279a431ccae3..d0863394c723 100644
>> --- a/drivers/dma/ppc4xx/adma.c
>> +++ b/drivers/dma/ppc4xx/adma.c
>> @@ -4212,7 +4212,7 @@ static int ppc440spe_adma_probe(struct platform_de=
vice *ofdev)
>>  	else
>>  		iounmap(adev->dma_reg);
>>  err_regs_alloc:
>> -	dma_free_coherent(adev->dev, adev->pool_size,
>> +	dma_free_coherent(&ofdev->dev, adev->pool_size,
>>  			  adev->dma_desc_pool_virt,
>>  			  adev->dma_desc_pool);
>>  err_dma_alloc:
>> --
>> 2.55.0
>>

