Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9936F429
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303495; cv=none; b=B2fKkOX5mQKJL6kRHV7nBFg+4FNnecuEfFnfamvIPJhPSWe/9Vs0JhMJZhHSsIRmXtdte3xlGWCj33aNlFhzlRY/zrr0owwr234oa9XYybSKCI3Yd6QmopJxaxNAPiXG9qkWLn/cmHolirhsfx6J7RdyUamP2eSPb8RAZVGwZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303495; c=relaxed/simple;
	bh=jS2W/bUER37p+AiiJp9pAGcS9BY4dqAFA39GLs13Xyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg0g3Bgla6tXs8ZMTOkDtY3NWN/VcoC+kkMpjDWgyWY56K0hZafLRBvMBB9HqTAFd0a8a6IQRREQyj6Tm8hF1Ho/DSyg83utGE1Z7BTs9Tpxy2i82jiuUS1ZmbNezhHm7zhhdmp2YUrHz0nUvrQqrMz8hIBBB8NWoUe/SAMp4go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5Gw5YeB; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5Gw5YeB"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso136597a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303493; x=1790908293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aKFA6xm6L+MWelDqLaCtGsiYbykSMXyQpjjhRA+8aLg=;
        b=c5Gw5YeBhKeBSWglXqGAbnAECTapva1KY5zZrqJ++EyFtJ3dtZ04UfBj9oN6zckrP9
         J2BHm+azYTgZhMA6Mb1hXU8v79vYtFUZkt0KXtun2jDzry5dfy8axshRYlMVbqeFsXbr
         IyiXdWqm38RH/yZYqNxElKabyXvb/H+B4bmbdeRiHQqsyOV+72lskUsKHFWQkbKrh+8F
         0f+ljPVR8vEoU6+zBSRqkuw+0eEQ7uMQnTFz0nqjTbwSk8s+JI53ATRMrQl3XZpq9WA5
         yQPmpTbLuwLWi/ZPXvHrCpGLwLZ7NvrrxDhSypwMtVDrohzWr2iOWfia0GOpe8stVjtV
         YNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303493; x=1790908293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKFA6xm6L+MWelDqLaCtGsiYbykSMXyQpjjhRA+8aLg=;
        b=XRt2q0pNpSXU0n0t7F7tJK/zzH60mHTKgDVP0wJtfKtx/HWSWxcFeL/vNKSaWvRv5Z
         SLyXZG9KwGrJThNi5nlhq8VWkv0jf1JekCp71ETFPnPiJZfy3EhsIk7DABSzePNQBsVV
         xbFo1SQ0sF9Tb9iI/TN24iDdOK04oZAoGFRYYiRmiEfpWnksAr4556ISbn0Wql8do62j
         ct+K9w/Ey9HEhrTxkCKZC50C79BarpjSjeqCwgrAHK/J7u0eOv1+6rWOT9jqxaxGgR/+
         WTW7f48oGdj9g3tmtdMxblww/BxT3Exsk93dX6gai4u/TiIUILwgAzgEtFGkxX+ivy/H
         vaeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqg5vjumyfLGBCj8xA+R73zXquTBpMM1u+lBoMk+pzQG17Fq8JheA67SUjKUP1l+iIKzeXkp2eml6nzCU=@vger.kernel.org
X-Gm-Message-State: AFuF++kYTcpRQLjj01V1rlkOs3gxgK2MISbWUiItJq/IyvQPngpxkAgm
	Tg+0jzcz1TIeTbSr/zdKzqJZQ2i2OYs24HfFiw94jmnKHUken2MdMZ1L
X-Gm-Gg: AYBFou3P1Jhc1hU8kmAG35yJYZXJmkDbfdJph8b+Eeo6QubDUETIHUPAO4KgjTCq8l3
	YK0oQQpJKx8KdSfKmkMpdMemPFWCNKT6/tO5lTSKa9kGCn6GiG3Sh9EI+2x3+Qsu8w080HVI2Wf
	mMrpXzng/EHHiprs0+vFpRjxUNo+rkJq1gt0l4MSPtkkbetTGCVzhaSRegWGKy17TaxDTY9l4Qi
	WdCmp9J05ALy/kGo3aa1qRr9t/Xv1gDHG6tgykA3f1HDRcIFrJ6rM2NCALdBxGzRyWxEs9w1xBa
	Czz3mPnbYmjZIZ15ShNTEYf+UNKQQHeFSchVn85j/nJTqfXdw16CRbJ9GyYICnOYfnwp23JjTsd
	kW/uadkC6faYqYwnQXB90KENjdnKEAZqJ+po+iV/z6g0Ec+BGBGkBZzHQ8rGjrcXdc4nLMTbqEJ
	4gTVOjUZwP2dikd/Mz5Ask+KVEgy30Mq82rQX1LtTdd9XE+JDQcV8/MEQSyhtdHpqbBjHleVX6v
	Z33qrkkPwzi
X-Received: by 2002:a17:90b:3985:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-3a098d5e61fmr3841860a91.65.1790303492904;
        Thu, 24 Sep 2026 19:31:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7879030dasm486783a12.7.2026.09.24.19.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:31:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 19:31:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] tracing: Fix simple_ring_buffer undef check on parisc
Message-ID: <ef7578ff-8416-495a-aa2c-035ecd956362@roeck-us.net>
References: <20260923074213.3077182-1-vdonnefort@google.com>
 <20260923074213.3077182-3-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923074213.3077182-3-vdonnefort@google.com>

On Wed, Sep 23, 2026 at 08:42:12AM +0100, Vincent Donnefort wrote:
> simple_ring_buffer uses local_set() and cmpxchg() on unsigned long. Add
> them to undefsyms_base.c to extend the allowlist for the parisc
> architecture.
> 
> Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  kernel/trace/undefsyms_base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/undefsyms_base.c b/kernel/trace/undefsyms_base.c
> index e65baf58e6ff..37310baf706b 100644
> --- a/kernel/trace/undefsyms_base.c
> +++ b/kernel/trace/undefsyms_base.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/string.h>
> +#include <asm/local.h>
>  #include <asm/page.h>
>  
>  void undefsyms_base(void *p, int n);
> @@ -18,11 +19,13 @@ static char page[PAGE_SIZE] __aligned(PAGE_SIZE);
>  void undefsyms_base(void *p, int n)
>  {
>  	char buffer[256] = { 0 };
> -
>  	u32 u = 0;
> +
>  	memset((char * volatile)page, 8, PAGE_SIZE);
>  	memset((char * volatile)buffer, 8, sizeof(buffer));
>  	memcpy((void * volatile)p, buffer, sizeof(buffer));
>  	cmpxchg((u32 * volatile)&u, 0, 8);
> +	cmpxchg((unsigned long *)p, 0, 8);
> +	local_set((local_t *)p, 8);
>  	WARN_ON(n == 0xdeadbeef);
>  }
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 
