Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102A402B8F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420059; cv=none; b=orRmnwVLcFtpWKa2ChjVsR9FRis5dZ4HVSebPG0ZEnk4NciVJeiRRHK8v0rRW69qkEyzXgidLREjGmuaSdjiooVjDCdf4Us7CZhBNUagNtH/jlI13C0uugN98xuyyYovGC9RO6SZkMKJQA4mKBSr9YKU+w70oN0cbZW4/xmXfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420059; c=relaxed/simple;
	bh=qFjH69aIOXVUvqEcGK9+jou3rZnCCwOEc0IbWE4Dqq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VF8qkIxx/DMwnsQFyTI8HIRmbE8CBnHOPxqiQ7zeSGP7Nx6VITe5UPBJa+BqN/WEfWGWvqQQ1MiYIcjW+wqHjwB1eqpjK5DcU+HcfXQbQir3t0uIkVL0VFAsg6psmyhFWK0vfAjLSgWXELXyN6S+GIfPIP1khazaDnJWEY/7T9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Migvmv9D; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Migvmv9D"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d6e954afbdso12861655ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420055; x=1789024855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXuvqUj271LNrSs8P9g/osNAjtXzcTBNi1YQmbZCrTw=;
        b=Migvmv9DKpeg04iIhWUtLfM386hHXmwlgpNstVs9t0PE/ZVw4S4xqXWKFNmt7+d13F
         q5RIJrFdukSEUObwFTyZMsQhkZ2JikCuU4AUqL+RJVGGlk9u7W1AO1FzTiyOrDwnZdng
         q7nDbwBSBt0vIsHXSWC4YkkMD1Y1XwECiW8/uPx+7/S1g+Qg1jhvhS8Ec4fFrHrMHLbj
         PmxBsADb97DuXuVZbIZoMaCc5jwWzTpJYPGdUhE6qFymH6KGCF5PMBwsa5HsEUMH/SgQ
         GhEw8TbNJBjHIytEnTTHAkxm8kJxiXxg+eA2TigxW2Eme8EEgk8i4vlBUtgyzD813BId
         70Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420055; x=1789024855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXuvqUj271LNrSs8P9g/osNAjtXzcTBNi1YQmbZCrTw=;
        b=evS3KshEllM7P85OJDLfykUF7mNR7KHJajC+Er7cNyOTfbEicYO317zlkxujetkxGX
         lkjsdUhKSCCk6dQovSGpUbyb11qrUykziavg+Ej31ZgrOflx0JVa/ZgKIFaTh2mgsE21
         IYWQemxqCHFZ4rxz2GWjPmcpfngOCrx5X/onZBL6jBoYNu8F/8dsWPJG7nD6YXXrxJFb
         9EkFQlzEBxME0b6YHjB/LVouP9skkwUMvkfDjU8oLHMm6yyS5/H8du/PLyEvANX+gHLW
         y0X6AE2DsAxMShQNksm9LOBcnCLTWb43cjSjEpIn8oZqdxBM4J0Kp+8+ZGxph9pycXLk
         Z60g==
X-Forwarded-Encrypted: i=1; AKwUvBxSzLLBMFefaLxomocIrdhh/TJEfWgsXWaG9GvdTxBSMqIj7V82vNVZ2nJ23GYHf6/ILIB0loMmUnQBPU8=@vger.kernel.org
X-Gm-Message-State: AFuF++kZLIHL/DB9egA7C7178nf8FxqfwOnuAUqMeVaQ8IspTE2efJW4
	GI0Fkm/WI0j8Z3pB6UsUHr5Q+RjSkQtQ3HcCDBZVsIx0xlC5t8MSABT1
X-Gm-Gg: AYBFou0kZwQ6JfUWU5FFp3ir9o8gSULEEVasd01gx67n1D2NsM1BZ4qWhBf9/2RcoLS
	q03IY7s9VwQsAOm2JNqogTEG1KkhrpieV44BcWDBoyo8Q1rd+aa+1ykPvZvDgKFfp/lCyjYeCI0
	k1TbI29OcOr2hNSMF8zwgXyENyAToXSen9aiv4ic9TOZV6wJpVxD/CBrSh1gllQ6oM4gaa7kClo
	MeFbGts68McZl0gGWwYWubG7tnUAFSK+UFf9Z5rEs3IB3xLrjGsc+3C64Jb0p461V+Pnl1Z21kJ
	gCxBug+hXT6nuh5spMMDpeKIyX09vcpxfcJ2URnEBerVbXmQuYMNzwDASmcrmyTrk/UqNRyqk2Q
	AfcsIMY6XyPqtoCZXJ6xTlIO+RUOXkfWARoIG/34w/lyQPUFJdnvu+u8BWMqBuB+TZfCFp3Vrc5
	vr3jHuVc25pfyEU+AmIaeIPBezy66VpFbU4u1+Mzi2BynyMNilURXEXKN+3M0vxg==
X-Received: by 2002:a17:90b:2d4f:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39aedf1aec2mr16333499a91.6.1788420054696;
        Thu, 03 Sep 2026 00:20:54 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm2534325a91.3.2026.09.03.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:20:54 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:20:51 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH 2/5] ntfs: return -ENOMEM from
 ntfs_inode_attach_all_extents()
Message-ID: <apkf0-ab_1tkAiha@hyunchul-PC02>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
 <20260902073249.3035977-3-liubaolin12138@163.com>
 <apkE3nzoVd0raTde@hyunchul-PC02>
 <4c2bdc40-2d2d-49a4-8821-410b4a7382c8@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c2bdc40-2d2d-49a4-8821-410b4a7382c8@163.com>

> Hi Hyunchul,
> 
>    Thanks for the review.
> 
>    I'll fix both issues you mentioned in v2 and send it soon.

And the other patches look good to me, so feel free to add my
Reviewed-by tag to them.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> 
> Thanks,
> Baolin
> 
> 

-- 
Thanks,
Hyunchul
