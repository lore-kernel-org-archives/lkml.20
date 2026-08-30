Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA82F84F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123727; cv=none; b=U8UckrF+WSWvClJcW+hV1WU8/5o2ob8PhAKAdvlq2X74aFyl2SQa/88BF91AiJuA7uC+MbvqePkWRpN5v1W3okrajKBbPt4iTdu5BmakoGoO4zDRE9LVCo0xqdYkTjdKMcBrnCnOIkrHbsMZiWUGSknWkxCrRO0hoM+EvcKAbSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123727; c=relaxed/simple;
	bh=xVoiwKuQauSls3sj/0rXsJhCeUzgbFN8E0xpvwNfE+c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HYTQVc7g2BNWtDyQZ+v2vr9S369/s+8ekKBAheUohqnLo3o827lQErGyPFAMxe3wiJ2SZmy87GWpxSTKaCQJXmJC+BcNWgPP7DZZRhefV9pQtzz4Jh4s+dpoU0Ov5eKWGDjQ4AlnjdRSm2LeD9TM2Wlid0zridYSZTBUdGYvmpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso16235505e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123722; x=1788728522;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVoiwKuQauSls3sj/0rXsJhCeUzgbFN8E0xpvwNfE+c=;
        b=R31iJ5b+cti80fS+Ggawf0gNnsuSkRLxHyHX/YN79Q8e1Uvxh0DW/USiXYiOzC6XFJ
         5H02e+0MrCAl8aokyThODcFJH78e+FUkKYnFBnH9YnIQ7G+rxbHg5mEtF7G5dgSy6J7M
         czX9LMJ10Q4m9RFZwKsVfp2z0elUSiB1D8IT0yaGQ8b4jUh4w97hirU0owYE2VXYmGyZ
         7NRn5W5aGxEb0+VRQkP1S4kyTqIUOUqVQLSfBnbHUwAduZzmgUIE5C/GEf5ib1LkasK6
         BdrmhIZOlS6Ug3VKaaa1ousZ3OA3EFvItd2DkdhIDQYP8q4tbK7IxXaTrujZeY/La+C4
         TPKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZVH36LUrremGGatoE2NbJ4ZsXD15afYY9joQqERS/wOjMN61FNAUl7nyQtOYi2p8DEMPpjSG0nbeIGOc=@vger.kernel.org
X-Gm-Message-State: AFuF++lbQafolerzkN/79ISXAkR5GPafSgtIUhpCGeGR3DUdumBpwcbQ
	bFj74f23aPitNk+W9/Otrswjcwz8rTTGBvcLDjj0Xfm4BIG2IFoNdGCH
X-Gm-Gg: AR+sD12U33g+MI0YbPeP8QqNYdP98lin3T3OtHnPFigBkBgAyhVeTN2QKtS1xQD5dRd
	+UOBi253/lqrSr5Izh+FjDpZEgy5AmbOtXhtV8t56L9EzKVd1uZnuRJqLM//apkSj77ydrkeJK0
	2MRrzc0SWC4X6zrA8wnnSIlawmeMoYsf7FodCoAsmqKqs/1UshoSSezjVozh8Zh4Th5PWDasRXs
	/zHBc0Oga0Pt6pJAgwtrxBPWLBDXjQ7Jup11TLbAB+CYhu4lGgvLOdtiWgIf7bWFHIMvRdUJ52r
	2tYapghjtgkdkDx/lAw38a+UJja3mMFZa6MlvAqDn3tewLn80CwxyJRvc/1Ud1PHVbPyfl1Ght4
	RPHjfJcSTvgDwHtaaDCIStSqn/DXvM5VETtMOLZwcNgSUOEuJGLR6IzPELFcO6hMVQ+wBte3im2
	QznueeUpRNT7fvWEZtXCAjeL/GvCSs5Nok2fULwObbMmkHvTVpd9zd9tglmGMpp0bIRNXof/IBI
	eGBOv9AX8sTJtKZbnCmdQ==
X-Received: by 2002:a05:600c:1c0a:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49b91c276efmr352047355e9.6.1788123722135;
        Sun, 30 Aug 2026 14:02:02 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm6020305e9.3.2026.08.30.14.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:02:01 -0700 (PDT)
Message-ID: <47082c12-bda4-46b0-baff-3330e98e7c46@grimberg.me>
Date: Mon, 31 Aug 2026 00:02:00 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmet-tcp: report a bounded MDTS instead of "no limit"
From: Sagi Grimberg <sagi@grimberg.me>
To: Alfonso Kuen <gerencia@idkmanager.com>, hch@lst.de, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260828222356.1264-1-gerencia@idkmanager.com>
 <20260829013900.10392-1-gerencia@idkmanager.com>
 <a1770149-e633-4a58-af06-849da27fa7cb@grimberg.me>
Content-Language: en-US
In-Reply-To: <a1770149-e633-4a58-af06-849da27fa7cb@grimberg.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/08/2026 0:00, Sagi Grimberg wrote:
>
>
> On 29/08/2026 4:39, Alfonso Kuen wrote:
>> nvmet-tcp does not implement .get_mdts, so nvmet_ctrl_mdts() falls back
>> to the port value (0 by default) and identify-controller advertises "no
>> maximum data transfer size". The initiator believes it:
>> nvme_init_ctrl_finish() sets max_hw_sectors to UINT_MAX.
>>
>> What the initiator then issues is decided by the block layer. The
>> generic cap is 4 MiB (BLK_DEF_MAX_SECTORS_CAP), but a namespace that
>> advertises a large NOWS raises it: blk_validate_limits() takes
>> max_sectors from io_opt once io_opt exceeds that cap. On the array we
>> measured, NOWS is 65535, so io_opt is 32 MiB and the initiator emitted
>> 32 MiB commands -- from a controller that advertised no MDTS at all.
>>
>> The target cannot serve those, in one of two ways depending on the
>> kernel.
>>
>> Since 4a3f00262a04 ("nvmet-tcp: bound SGL data length before allocating
>> command buffers"), nvmet_tcp_map_data() rejects any len above
>> NVMET_TCP_MAXH2CDATA (4 MiB) with NVME_SC_SGL_INVALID_DATA | DNR, so the
>> command fails hard and deterministically. That is the right response to
>> an oversized command, but the initiator had no way to avoid sending it:
>> nothing advertised the limit it was exceeding.
>>
>> Before that commit the command reached sgl_alloc(), which for 32 MiB
>> needs 8192 scatterlist entries -- 256 KiB, an order-6 kmalloc. Under
>> fragmentation that fails, and it surfaces as NVME_SC_INTERNAL, a generic
>> status, so NVMe multipath does not fail the command over to another
>> path. A 1 MiB command needs 256 entries, 8 KiB, served from the
>> kmalloc-8k slab, which does not fail. That failure mode is intermittent
>> and load-dependent rather than deterministic; on a vendor kernel
>> predating the bound it cost us roughly 98 GiB of a 2 TiB image copy,
>> with the copy tool exiting 0.
>>
>> nvmet-rdma has advertised a bounded MDTS since "nvmet-rdma: Implement
>> get_mdts controller op" (Max Gurtovoy, Mar 2020), which left the other
>> transports untouched.
>
> Nit - instead of this patch reference - you should simply say:

Commit ec6d20e16c2d ("nvmet-rdma: Implement get_mdts controller op") left
the other transports untouched...

Other than that looks good
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
