Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272E3C73CC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263266; cv=none; b=Je6Zzoh92e3KqmoAdG50g/WnR0U4/FuZw5RukngqTKa3w3v8Nd6Eu7yWb2wQ5Y9l2g50Q7Q/82+mFKtFcssqyJwIcxj3F7Gs/HNtj8L/qgn1XMOCBSU3XSGstPsTzsNxGRrnz+CZS5Spf7r7RBV+hGjn5+ol4LNTlz0Oqudvc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263266; c=relaxed/simple;
	bh=FGOMy7yy8dZ1LkSE8V4W2S5SMQVfk2OiUBxZhKygeC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfWtwL5FEJOTxobM3u9OMQtDs/749BmBgP8rWu/IwU3tdEEn5VQ7H6m20l9PaFCyVnFmqbfF9b8sGi6YX5VNxWl6lGUZqpXFFRDI9BnMCTu3FNT/fkUIYzvuD8fXfi68pnHf0U7TacpPYMqbTNqcWruDcZHVBAPUcdLqNi2AIss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtgMhZ3S; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtgMhZ3S"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so12485085e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792263263; x=1792868063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1fNOsVKAAab4WI8wQjcXQIXucd9FPacs7g4minaeJs=;
        b=DtgMhZ3Skb3i3qy5sS9VyVrl4No/B7lxJTI7i7L0o4/4OVLqWrhtCm1fFsty334o/i
         8EfTcse6Go6IrUeL7hjOFGA+gIOQuDZKzquD/Bw/yPWzbII5bCehzHWNuPdhoXAZeMJN
         R7sNQBFIqlKKCDAzz0j4DlDPTK7R8PoEM50opZvGp5cxrzKApmVA0MzcTPMQk1JkDnGM
         /3NzD5501Em37u8hH4u/g535YNwkgtVPpVHsntACphcK2FtdwXlVHqrkvHaJC5nEP8Pm
         jCKf+jFavKFYnaEPT6MaiHlY2Vd7Cu1R+zhrWr/3PZttfVYd9jphQz1SLkHEDY0uzZEB
         0eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792263263; x=1792868063;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1fNOsVKAAab4WI8wQjcXQIXucd9FPacs7g4minaeJs=;
        b=oXbZgHf6Xd9zWSjVEiasrb5BIElRjNBsLhMEru5lEzvf3Kb43/ezWcSfyrDWKB/EVD
         Vh+Rx1h811pJklXl0vEwp3yavQ9C7D2Yl579Gd8wIqDIylmlgcXi3Lo7aBemWHM4fwkk
         Flo+DvdGnEe/Sd3B9g0ivEXX3blzv7eUddHNIhy3gwJkeiyLi5bICw0L6VrcyAjje62y
         HA9G3hZ8cvFv1wBJ0fbj564pBXb5Ubds88jj+B7r/615bATZFM0+j2zQzVwG5cA0RkDL
         P3OL9IxcSJwSi5DlJ6ECLxIVK/+AVAqEbyhEcpcRYuUPcv/ssp/koBmTQS0azqVLunoi
         TFhw==
X-Forwarded-Encrypted: i=1; AKwUvBzti3BHP1U6DNvC9w2uc6+CjN85F3ANY9LoIh8QxPqRa0ulGln+tk0nmUgaqH4lEY934KD99oXeARQ1WBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcVVU7UFZMoshGDtDSnAgWdDkxyOFdZqy47jATYW+PwHxy3uYB
	re82kPYNWpoWxcLnYcjdirXflBRmOGfwTpk82VU+CN6VSGfujHkXA+5u
X-Gm-Gg: AYBFou09D0pjqlEtGMA0rxLevqgszN+Yn8fxHU8SKT/mGZK6ur1pYVMFcqe9m/u8DU7
	iBXTekCtxJwcEETMp+CjXrk31DDF20LBc7rmdgMfdv5DZ+dZmmH2NEx01ke9kRhopQeLsi0h/mM
	dKbx8KNP/5+luqdt9kKf+xwkuo0xWOjEIjZPjeHTppkVh1Qn+Q+DBXRPBuu5YZiRHl+OU/hFPZO
	9T3CDm88+mJE8awfVYRsefig7n53xirYrYyjg0Km6e9tCAziU79TfxNJFcEWGSlXK+vH2kko99+
	iiLxb7HUbvtDIerjyRMI1Yk6blbyFKhuPtA01o/HWIC7BpfDuMTMjeK8YtXwsVvTd+fo4CVK/O3
	OU2EEFFYesJY4CDKPzhO+cJ2c8F3nGhDqhe1UloqszsEbz6/4Xc0Rb80asgbm5yOR7fiPkH+CFq
	ai68AZIu64gzjPqGWJl+bVwmFE+FldCj02Cmeskh1J4tp5ip2n5Jgocng27RvDjwVOjQ==
X-Received: by 2002:a05:600c:3b17:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4a1d76139ffmr71111935e9.13.1792263262725;
        Sat, 17 Oct 2026 11:54:22 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e28bcsm12739567f8f.23.2026.10.17.11.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:54:21 -0700 (PDT)
Message-ID: <fe58f891-7752-4691-9e67-b5a4a5c125a7@gmail.com>
Date: Sat, 17 Oct 2026 20:54:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm: hugetlb: avoid recursive CMA allocation during
 migration
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <d145aeb815b318ddd4dd9058d20038acfe5dc1bb.1792136742.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <d145aeb815b318ddd4dd9058d20038acfe5dc1bb.1792136742.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 12:07 PM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Contiguous allocation can migrate allocated HugeTLB folios or replace free
> HugeTLB folios while holding a CMA allocation mutex. Allocating a
> replacement through CMA would recurse into that allocation path once
> non-gigantic HugeTLB pages can use CMA.
> 
> Add a fresh allocation helper that bypasses CMA, and use it for free folio
> replacement. Pass an explicit allow_cma argument through the migration
> allocation API and disable it for MR_CONTIG_RANGE. Honor hugetlb_cma_only
> by failing fresh allocation when the corresponding size requires CMA.
> 
> The existing gigantic migration restriction is unchanged.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

[snip]

>  /*
> - * Common helper to allocate a fresh hugetlb folio. All specific allocators
> - * should use this function to get new hugetlb folio
> + * Common helper to allocate a fresh hugetlb folio.

couldn't allow_cma be passed down to alloc_fresh_hugetlb_folio() instead
of adding a second copy of it, so this line can stay?

-- 
cheers,
jose a. p-a
