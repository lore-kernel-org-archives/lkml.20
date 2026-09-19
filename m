Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BD31F996
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795265; cv=none; b=ulQctI/F33gbePxzkwPiARgxH5JOJWHvk01ZWXAy9BOw83ly6ihqv5tLJOvKW7X4UXRo0DGKdYYFGvy5y+ycDowSu5A4JZ4vd44CE+nprkTUwEVGEGpJpUK67KK00liCWhT0Cu4FX7S2p0ClscGiJ2D+CHD25h12kHo+LmRhZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795265; c=relaxed/simple;
	bh=wbl/b1wY6W+ED0XWbMPTjA4NropJyaS+Z6oeRQIiRso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQCe+bhUwMbkRKbLgNKViG+kKgp7JzD+QGeJFoU6UpWixvpGJ3C10MZ8mzlBjXFiGPSqnu7Fn/GgYrsSedYTzPdCdEAW5eAR4q4x3rRt9KbwckX+7f3vJLQgl+yUaveGQI1Bs1a/yBH4BvyCEXKEpebaFCFztDSA61hi12sUSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbmYOiJd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbmYOiJd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so706744f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795262; x=1790400062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j71MR9mSV+x9BS9VkLQyl8CosM5qjIOpfqaZrZTUdQ8=;
        b=GbmYOiJdiQtLLFhAfH0/eR+T2OcdjMZzpLAAi9npE+7+DT+iK8AQ7lut6CLbBWwrmj
         6EEU7ouaJsJclQ0LpUGWg/aDVsV7yejy1um3XG6lOiuD5cn3+XJa2834AtgUZRj9z0dN
         0NoZjnXbN+Dxm4mtZkNaDUsEGRVIVITncRURYZ+icHE3rmDKxD19muatpD3Mo3gVbZah
         KxVOb9ZHciJNzRK2Sjd/nEySOl7lX9xxdcG6hoSMghnwSSGf53tLGrtPoOgY7e+2UStI
         LDXE9D3PPa4WF5i85+TnN2GNu/QqezYLtalvmTLVwWgq/7O42Rcsqk/mv93fQXRtvGxg
         FZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795262; x=1790400062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j71MR9mSV+x9BS9VkLQyl8CosM5qjIOpfqaZrZTUdQ8=;
        b=wuVjfbkQc3GlqIy8OJWioHKQ/4CuvOoWunlTAgqsMxuuDMKfuHgQlrI8hC4O40AjOm
         V8h9S7s7rxE8pE3YU+ti14zybkdX65NjD9FZrP544+5DBoSO2FVz/0Ls4+FugAMR1ksx
         UHA29XhbMxTeklC6v9sH/70p/mFnX2rPm7SUzvu6v5LnKGNeUNvWTacfq3ph/RfCWRFB
         U0g1cT90rA8TItMExG+IBW/Mg9oK5j9gU3+y74yu7JdtuRKKabQMEng3iVybuHTe+dvf
         bZWDoMCetNTs/A2GsWzTjKLRTzmArXUCzdfNwYMKo+cH+8tYZIwEP745Q8q9fOOspaP/
         JuhA==
X-Forwarded-Encrypted: i=1; AKwUvBySWNuFKhOi7ORjeoZwSKEirWcjT/wX2chLCx2jbIGuTzy1bdfRu63BHjc8V/fW/iPZ/nbodjtk+ykW4zg=@vger.kernel.org
X-Gm-Message-State: AFuF++mrU7jaaJYCem6C8EotEGXdCd62logCUdywns8jvVaJYR/DNAo9
	UMqJMb6z9BIk/e0Tw3d6h8ty19dzlc06Zdz+9Kh6jIbbMIUQ7+BzCSUM
X-Gm-Gg: AYBFou2Qiaqegrs1Ma0Zg63L0g77QUBlgaLRr5bVaWQSksudW3w07CB9hvS84slvQao
	iVjC6yDYHABrZti/tIUUTmo3JS1x3kZuO/ahz8pA1Kmwt6xFwCFPZSn0mxMbKU07wJNSdUF349j
	aWVcadcwEFuDz9MWf+5SWdvrxZI4n7tWngL5XSPM4xt9a4Y7n2EuN7rt9nIDNlG2vtb5aTLmvHs
	U9ZuQ1ZPFdqZFSGrxD3gGFs3fPGldXZJxF7rnpR8W3B+BCfFfvxvA9HjKca5j5EjLgN8k/SM48e
	4jpGVhB/6eImAUD8px2kcgANOIzSBoeCK+YxG7ahcWXu4lPdJnzE/fMfurL5Vcm+gVGUUs2eKAn
	M3l4FjtMZ8cAjj3f5Wd7EKs8qD1uPUrZgoFdki7Lkv+IboYJ6m6q/BGb0MsyahK899NBXwSx5FZ
	Wt8XpGpPuFDiIBuERK5rN6B4qNCnCCvLS3F/N9zV2ypFKvBvKHjIiFbZ6YjCXt7sxmRBk3ZeueE
	fPxGdIFPOAnhvUDIXMQC/fG46irBxO8uhWN9irvEwW7Ue/ce95CjhMqyFaVNQikQ/PPoCn09pak
	CrKgUM6l2EsjSmsQw2xL/fBfemDaRuporsQw7HqGccP2k6ijOr/Qknk/NUch/UxcPCBdYCmj9oh
	541kiIXNAbb7iGfc=
X-Received: by 2002:a05:6000:4b09:b0:485:8ee0:dfc8 with SMTP id ffacd0b85a97d-4871e26e3ffmr6296658f8f.41.1789795262086;
        Fri, 18 Sep 2026 22:21:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm4170213f8f.10.2026.09.18.22.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:21:01 -0700 (PDT)
Date: Sat, 19 Sep 2026 07:21:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Cc: Joanne Koong <joannelkoong@gmail.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
Message-ID: <aq4bhxra9UsLG56n@gmail.com>
References: <20260811195733.38489-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811195733.38489-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 09:57:33PM +0100, Karl Mehltretter wrote:
> diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
> index 29578104ae6cd..3370ae344f751 100644
> --- a/fs/fuse/notify.c
> +++ b/fs/fuse/notify.c
> @@ -153,7 +153,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
>  
>  	nodeid = outarg.nodeid;
>  	pos = outarg.offset;
> -	num = min(outarg.size, MAX_LFS_FILESIZE - pos);
> +	num = umin(outarg.size, MAX_LFS_FILESIZE - pos);
>  
>  	down_read(&fc->killsb);
>  

Friendly ping on this build fix. Is anything else needed from my side?

Thanks,
Karl
