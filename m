Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830623;
	b=0HVspKGEGJnMnV/wVZhcFIAQwi0qi4u71Dm9uzXDAeupa77NG9tMagS0oMe4AFjybzYX
	 nP/L4O/D71llTQAOT00vL0byiG3lwRsDbviwgj6TIW8AKHVp+b/Nn5Bq+wnDdO+aGAxED
	 O7bF2f2LIfrIFMoFmA0500Xf9olGbe/FE6Wcx/SDRytMDDjsD4vRSIe9zZleZRsAjk8wB
	 wUz8MRQzMpqHOndEn3UBkazTwUt2J5/X7J3mPEZ0U5RhacRNQ+GIG7YzWG8MKB+bR8wuX
	 vOWsXofjJDxb11N2W8tScxDS9UMyGLo1iew8luFnicIFvoEvJ8Msqu1FJB33EnngU7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AoRyT2gWGztVgBxsNZy1AlqhQ+YolidchQOTos+xRqQ=;
	b=m3IjT+P2OVniHnsLZFmE6TXazht80it65zxa8LhtxjQ+QhBWt/SJxrQTGc5yzDhCcnIM
	 i1nyIyODe3gHyz+uUhkbSPfRGLayr9vzgesTjSiBNTF5WXrqPyVevSPYQ1hU1IWwqotbH
	 Le26DMcA2AZuPn2tcqd82BIENMohPE4m1fH42OKiLFURq2/mQottQmzDVJNiQvsigJX5H
	 UYkJ2RManoqu5b3dkmqbGBFIF8NB2GErnbtr+SD/s7TbruFmjc6ccfzDqhXbEb3tma8tM
	 D96/3I01Axtp7mgDRi/VLi9NFvUKYE7nOykrxsfJFBqXp+hShQ9vO/m6k4xD5x9gNVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nv+wxk8b;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1D606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C1D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nv+wxk8b
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso5848715e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793830622; x=1794435422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoRyT2gWGztVgBxsNZy1AlqhQ+YolidchQOTos+xRqQ=;
        b=nv+wxk8bo0FBisbVMgm2EZrUnD9aCrSBU6snx1ttPufjnNqrQ0wuZ84LLHCmCMyeO0
         h9mkD73Mer74oVO59Qy8p11Cwvh/bMwIu0Gs0u4jLC5QEHApDWzFeJTVY7DIK8s8Oue3
         lcCaVKG8aHb5xBnfCyoK/Nbnq4fJMTUFtBw9pKzh89Jsd/te3e9LXeio/KY0LhCMzt+d
         iOmdCmPpJh3ExKuipURvMSLSnku0yyGoBVc5WcQl3uKFvOwoMIfrjklEPuBIualrAJFA
         4yaXV8VNnToGJFw9lXWdELhx/L0QuCh3WbB82S06IqlM1WqNDM/HpuMumR3PEM84Alq7
         HAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830622; x=1794435422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AoRyT2gWGztVgBxsNZy1AlqhQ+YolidchQOTos+xRqQ=;
        b=ESRqhortjo6w/LOlI007Fp5B/PYJf/SlmMbTrfGHEw/oFAbdORNUSh1tyfzKdVREMz
         caZ5MaYpBbW4jU1s0e5nwpavrH7Jqen/0knoLyDzA428VzaMqmBLgvm4EnIe02uhqTeB
         2fMxu6pXh48hs/0ZmB9+FPGTSuCJsMOcCuFapDUXPZ9zgJDamHogNPE/9KazG85fgGG/
         0ek+lIhhb98ZG7u1fTQoeu/BQkXUgzs7Ft9YPoJH2bvgt2SKD6uJ+ABS/GhtecXpPqbS
         5vp6bnC7Htkv75nvI1vyn3V1kuQntcygLYfCnlG1i6Kwld+GD/rHP98qI4p9fnIAGbc7
         2Ctg==
X-Forwarded-Encrypted: i=1; AKwUvBzkN+BSpMUjQAaZVzyhQRivWXOwJk8bMvSwQIUq3ikEWe3zjhhyImFfCGLQ1bSNJ10GXd4mxCBmpKaSggU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4NVQX9rFuGQ5GZQZhEejx5C23vA04rzaFF+GE8U7Jxu26WKuU
	1Hwkg4IeYT9KctakTrDaclbHNdY/sf3UD4cS7bxOuAZHuL9Pp2ZwrMbc
X-Gm-Gg: AYBFou1ENkL+V68SqYfKAXTYK0zf6reUSkqI/W0WMhxXA+2zqmjv9qo4NdEUi94mv26
	6/1A2uJk08bhGxPdmZKz4ayM95b2Mqg0nodzPB9v2kOFUVgNeGxgc4wS719oShUVVM9/byulBgC
	Ai9NqdPhC0w9bQ3woX+AAYtG3BNdnG6qXKf95Sc1getg9zD4PB5/+ITS5tHEtPmT82mDsMoe/lG
	SkjuuvGNFrSLAogVGD2DcT5weU6eo9gfmhcwec5HQT11asyJZYBOqZAkMIGuY4sgrO2OwdIvWzO
	Ynh3M6OCyLc14ibWZdjls59tl9ykeglBVEAGJy/psw2lj5SLad0s/vzeV/G5LBEwSFVQ4T/MrPc
	yPLTGzHXtCBET9VIAXKuHSHDeMhZ5SM5ScSVrOINQ1RtF1MfOF06FcGLa3vX1afW1jcOioqxHdj
	N0zbKXbhkpQwlkOtGWXR0ilrfATIrjBpDnaAd2H+jHS2mPi8PeEKkG48qlB20/orJP63GYj5yA6
	rq2JxniUQiEdixNbLrvhi10/hVJ/2n69pAV0TWdRYBHv5eDZ2qHWdwsdlv4jkuvQC4nyK7ok/YF
	VbZW4/AEU32pkp8XndBx1do=
X-Received: by 2002:a05:600c:e548:20b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4ac86c9b146mr248866895e9.13.1793830621562;
        Wed, 04 Nov 2026 14:17:01 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm16301645e9.8.2026.11.04.14.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:17:01 -0800 (PST)
Message-ID: <be34e0ca-4706-44a8-8264-3b9827829e9b@gmail.com>
Date: Wed, 4 Nov 2026 23:17:00 +0100
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
Subject: Re: [PATCH v2 2/3] kho: skip zero-sized lowmem and global bootmem
 areas
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-2-b0d1a834780f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 5:50 PM, Mike Rapoport (Microsoft) wrote:
> The lowmem and the global bootmem areas can have zero size, for example
> when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> either of those areas is explicitly set to zero with kho_bootmem=.
> 
> For a zero-sized allocation memblock returns an address without reserving
> anything, and that empty area is recorded in kho_bootmem. If there is no
> memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> fails and KHO gets disabled.
> 
> Extract a helper that checks for zero size and allocates memory from
> memblock, and use it to skip empty areas the same way as empty per-node
> areas are skipped.
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Chen Pei <cp0613@linux.alibaba.com>
> Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
