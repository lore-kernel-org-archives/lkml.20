Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679264;
	b=gCVgdaEQmI+/esViolnlwyXF1qopwVn4PSYSEfNZ8njzehgXobMw9zgJKk0ZH78sBErY
	 I725HyjjNqL1KDFYwPfNkVKR0AL7TDXtD7DRbxCichsn+cYB/zeEO5vXlyCNAVu3QXgCM
	 EJcVSGObQXLZE6/LelnM+Mh1OwwNvsvziEaKYtc4SSfaY8oxJY4LZN/Rwzc7U+ZtK4MyD
	 SQJ2KRCFjEQ3x1vAclSAv4jBqFnbg2w0LAfPoKl+2NTO3+tP1n7H/z3BagzYMbIuWIyjf
	 96CtPYYJIquBNtH7SROBdIzc4qrGd/omnRKr5g1WbKVcy044ucKljvUMJ/dsPOAbbog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uvHq4rsgJAV3lzS90zrm9EHKbCRk2+K5K6T0bz0VtiA=;
	b=cUzVAK7752FHg3dp8bSpOMdvpsfiTIawBOfAlFCPqTM3O3E0Nin/07g10q6SVZFifQcI
	 qeGLsG62gIXX5ENfUQs28rfL/ICTCNopuAYBmypo0YsMIrMLQRZT4mboxz3mIpg6ser1R
	 gYLhXGpSQar15GkonslWHNFsT7T2wmCcsW6CZ6qJkNPqd4UBdszP9WzzhhRNPPugF0Fen
	 7oL6HlsAJg9OgOMicNP5ysweTbm0qUNVX6EuSFRbQLgpWgB47TDjTX+HcUmK9HxKxJ7xT
	 Uh+25Qs0+wWbyPDUB7w+TO4iQfQkz1ZqPRIT2TUlSO1nlJ6NmO5ze/5TAqI536LNi/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JiJ5DIUw;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD70B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JiJ5DIUw
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b127f1cc8so293605f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679262; x=1793284062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvHq4rsgJAV3lzS90zrm9EHKbCRk2+K5K6T0bz0VtiA=;
        b=JiJ5DIUwqGhWd28oMuNNbDhcHi/MPvKnUN7qzbKcCwifgvd5u1gbmyEQDJW7rKB1f2
         bxlWj2+vdQQsaHFj1cnZWnta6/SYU9NUn7ZoseDOelcUNSfm+UP4PIHIUfARG6oJ148q
         GLP1EFIo+wDO3KsyuZoXLf7kXEKF3Ah1JTYtJ8QHzeWzjJGOKGnX+8xjMVpK4w++3kCc
         4J2KMUsImmXDThhEhqtcYf5kbS5ZeiXIwZYUFTO8usQ+3oDCaDOmhnPCKExFysvXXwbR
         eEB013+ynEvPLi6CoELu5RmnuBddpVyXAmT03TYPiKom++PweGN1BgAr6UxCiiNfDi7v
         e2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679262; x=1793284062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvHq4rsgJAV3lzS90zrm9EHKbCRk2+K5K6T0bz0VtiA=;
        b=1W8CNwHv1Knj3CfDFKFg5lQr956APt6beZP6Zcemw3vxlJNOm3plj1woNKPbShkLrU
         qh1APE/Yxmsqk9SH8XK7X6ubTb8PVDeg+8jEOeOeMNc//YelcsEI1TQJC3kNCciQbLkB
         CglBbbaJgbb46QP0ibjn+xZClqkjmkP07P+6iD8zaQiBs8DBfx5LDOyKqT9SVKcqUn5p
         8ep+AfCuvUSBJxgVFbHxVgyTYwsFeoIHth5yxrW3rkwdlB4GX2qI+mppQt31zJ8lSEx1
         JCxV6UcnjVxwYeQqql4iar5v8l3RbaxOTxNXUKJq0i7odZDBfY9mNlB0sCVSgUKajkev
         4b1g==
X-Forwarded-Encrypted: i=1; AKwUvBy+QeVv39424SfaGBNb4FA/RlF6wegnkLH/gaBqntfheVJIqzRKCHjQer8tqad7SHH7PjVpq3kAg/t0IUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLYkMytrkEh2EAHOAihlgY+CdqNThhp0MlBVWyYbrG1GFll5bp
	iy7UDCvPdFiibf1E6ldSaCGyA6jtk/T22ywMwtT/esf/LhMAYkDcjm0M
X-Gm-Gg: AYBFou2G9my+wIa+6Lb/VO04sISkKCHoD1/EoAfzM246kpaoEQwV/o6gopqEzp37fiC
	k5F7fG+VP6sAHel5P5yDPovONVmkCHK3cULEOzDWIE47gNa5UTBJ5n7Zrxb4YNHBLUiBJ7MlMk7
	vhB+kAghdl17O4+pvKlgAqSm7HaRD4smTbnjoqhmyHzYGwi6E61xzCS8M6pYMK9uWNuepoLjX4A
	2Q9mBBEp4uHXX3VGBz0pDKC8ThwP3QYDyu/NrqxKsU3h9wKMajUlycb14s5HkgCTRvdVOptNlYL
	zqZ07buvbEvqNUCWmOr8MN3TYzg0clbb3N3gL5a/YQZATbBXRHPZvKGQAAVKzI4p/DqQ5Y6Zd6h
	e5x2YcKtYHZGsdY8p3NiC0EP1wsK2fmVBW1YDxuPPVFQLJJR+G7UWtloDZTgZADqBJxykwlzIk6
	XMdtQYsMX4W+xlUk2Zh/bAAzpZeTsJhARYNMcrpiUZWgFNzIXkCtLbPRBXv/l99A6Ih8FzDs3wI
	whjdrrzl+nCTHlUZOuZm5g7a5/2jn+VSiJ6TbBy4MlbjOsrXHv0LqrssOE7vqO1trJG1Eetu9GF
	+8MWRe4=
X-Received: by 2002:a5d:5f05:0:b0:487:402:6cf1 with SMTP id ffacd0b85a97d-48e2642a310mr10647443f8f.1.1792679261992;
        Thu, 22 Oct 2026 07:27:41 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f15esm13604454f8f.20.2026.10.22.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:27:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:27:38 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/pelt: Fix truncation of the PELT period count
Message-ID: <atob2ttb0E-RTBc0@scheduler.schedules>
References: <20261022034930.225042-1-sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022034930.225042-1-sh_def@163.com>

On Thu, Oct 22, 2026 at 12:49:30PM +0900, Hui Su wrote:
> accumulate_sum() computes the number of elapsed PELT periods in a
> u64 but returns u32. When the count is a multiple of 2^32, it is
> truncated to zero even though the PELT sums have been updated.
> 
> The caller interprets zero as no period boundary crossed and skips
> recomputing the averages, leaving *_avg stale relative to *_sum.
> 
> Return only whether any period elapsed, which is all the caller
> needs.
> 
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  kernel/sched/pelt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 779eb58a4261..519bc9c40043 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -146,7 +146,7 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
>  	if (running)
>  		sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
>  
> -	return periods;
> +	return !!periods;
>  }

I think making this return value u64 is cleaner (As Prateek says).
Both works for me tho. 

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

>  
>  /*
> -- 
> 2.55.0
> 
