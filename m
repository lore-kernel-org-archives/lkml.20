Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A720236A342
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194692; cv=none; b=tsReQqAw7kXOcEpa81JzIe0mEPP+VRy/0OgshJxzZiLfBfL5TK/wluYxlTGADM7SV6SdsdoHYXQ6ws1OyzD6xh8WVtmHhtzlzfF0O0ZFKdMS+TdX5LyRt1G/udfrIgaKxVVqcxQTeQhLdaLCOk8yH9Ya32xYuXzaqXs7iWVFHrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194692; c=relaxed/simple;
	bh=PmYaT0zZh5OYZT8BBZqIL+F0mR+bv6a4Ebmxc1vaLrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlmp2liRp25H9/aK0cNGIGhO6xPrGygpT1SF8WSEmhC5uNt6498KQb3Z3oo0rmV/dcDbTg2pWlU7EziWYl3RF3+BfoCazF0g8RZ4If1v4jTKac7OSQ6UhHrmFsqHlnYkVIbTWIV2RGtd6c47hnwQoqtsulJHpUxRr7VRnJ05MEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6RUCrV+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6RUCrV+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so1367384a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194685; x=1791799485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndTgZQw5uRGHNOH8AqWMxH2rBGXg/PpSxnD0ym+93as=;
        b=R6RUCrV+xUlPIWNGizz7Nh58t0D+aK1g0N47YcdCpB2YtiWxxuJawYp2fB7SJh2owB
         QZ2LcwSdSsjxQyFD3wN0uL0iNKbZZx2AU9nfCXwiOvyoHU8N1vY4C4ctcw3vuq4aedaW
         +PHstUuQ8tR4pFYMsGnPCRHSJFlr9Yh13rYUURM3r6O+JxE7zoeFckIm7DF5ZS7vT/Qm
         CVN/OsRFFmPw/3Qlta62zUAoqL60mho3LKLSVyTFhH7kT7goKbm+SnVfcFNqG3CA4P7H
         +8bNbB9BTGS/dMAzkFwglUpzjNRj0jB5WrHCKMypRXoRgL5GD9JbUx/oOQe2xg2a20hj
         bcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194685; x=1791799485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndTgZQw5uRGHNOH8AqWMxH2rBGXg/PpSxnD0ym+93as=;
        b=Ih9Q5ouiulfI3i56OgLtRGNr5mssKZl4fejutRa2vt4Fe39+ytHlj1cYl+8ltnLT7S
         xAzHsjRNP4M07h/Qmkrh34CY2jJNO/XSaMORIh4+hi4c8BycV2gz7Z9vLUNQrXAnIQnZ
         wHx3+aDHxVp8UNDBqc4U34apFfYCaWRFTFOFfDibDRA7TPI8OzphEX5E+O2r+5knIj3k
         NiIy1Hj6dAU3IFl1jdYglb4a0zc6eElSFWOilFRjnVCFZbvI0R7IfV1bdCvr2C/KsvPk
         BM3dPuBon8y1kHaFBOPg002OKgak+C6UG9npWQbLCvEkLS0m2Slm4qCW9OvMsFlBE4Xb
         IArw==
X-Forwarded-Encrypted: i=1; AKwUvBxGLu42MUf8/SotyO29YK5IKzDUkmz4Z6RacgY+At/ZB+D6TjRbUpSo4BkOZ6s2bMfayeCz21PTH3PAjyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJviQoP+7yotZAcUj/YdvBUoEMpFf6Fe2xsucnVm5mKjrv9oAp
	EP/bODhodN1sA0vGiuTVvN9/syWaLYPpuiW4MqkyxLDchMl4fNyiSSsb
X-Gm-Gg: AYBFou3ob5SIogHid5n5rpb08O4mMmKtFVx90gN4A0RADVpgsUb66mKrnkYyRTJAm34
	91p/mS22f/R9No6w6KDCnI7KQspXh9fkxd7USYTaVFvnJ3QoyLVvyLn9gb286RG0tM9NGKK7Mj7
	Hiz1lshVXHsW3On+NIbaGrwJPOua0VkLXFeSUXvoCId4N5/7hnytvjNGHpl4IPec6tX1EyE16sx
	K0X72ioSvf5DeDGvL54ir6gCqgiUTTKpP2qBIpqShKCUqah9wbT73lUfBw0BjhUu4UVkwGm0fSp
	OJFaHG22O9yIUw/jy4kCPNZZwU+vwCmb75GB19CI/Onr38H2dCWDVeNmadxGEYvCul38XiQudoo
	MaoNrOTfN3e60FpM6RWtTQVjZLpImgWgZ+O+9jLjrsBwS5PLTCcmANbWJzRIdw4GdJ2/xyjoQyt
	UkDHghLFMkwjY2Hoo+/FOdqq5T8zzc9ulqZxmRKV5SeX1BrhHZikwuM7nWgQtYYHkzH4aeLdxEM
	WjOF04NtGFQ9LEIYf0TTg==
X-Received: by 2002:a17:90b:2752:b0:3a4:b0b9:6b3e with SMTP id 98e67ed59e1d1-3a7873d9565mr5545486a91.36.1791194684453;
        Mon, 05 Oct 2026 03:04:44 -0700 (PDT)
Received: from gmail.com ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4cd01asm10487467a91.14.2026.10.05.03.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:04:44 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	SJ Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bijan Tabatabai <bijan311@gmail.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Yunjeong Mun <yunjeong.mun@sk.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: Re: [PATCH] mm/damon: add damos_node_eligible_mem_bp tracepoint
Date: Mon,  5 Oct 2026 18:04:29 +0800
Message-ID: <20261005100435.1211485-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003202727.3673-1-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Ravi,

I agree with SJ that this would be more useful as a general quota-goal
tracepoint rather than being specific to NODE_ELIGIBLE_MEM_BP. The
target_value and current_value fields are not metric-specific.

On Sat,  3 Oct 2026 13:27:27 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> Add a tracepoint for DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP quota goal
> evaluation.  The tracepoint fires once per quota-score computation when
> the goal metric is DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP, exposing
> context_idx, scheme_idx, nid, target_value, and current_value.
> current_value is reported as the quota tuning sees it, after the goal's
> complement setting is applied.
> 
> The DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP metric expresses node memory
> occupancy as basis points of eligible bytes.  This information is not
> exposed through any existing external interface (perf stat, /proc, or
> sysfs), so the tracepoint is the only way for userspace to observe the
> target and current eligible-memory basis point values at quota-scoring
> time.
> 
> Link: https://lore.kernel.org/linux-mm/20260428030520.701-1-ravis.opensrc@gmail.com/
> Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> ---
>  include/trace/events/damon.h | 31 +++++++++++++++++++++++++++++++
>  mm/damon/core.c              | 16 ++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/include/trace/events/damon.h b/include/trace/events/damon.h
> index 8851727ae162..2c7249cc7c88 100644
> --- a/include/trace/events/damon.h
> +++ b/include/trace/events/damon.h
> @@ -74,6 +74,37 @@ TRACE_EVENT(damos_esz,
>  			__entry->esz)
>  );
>  
> +/* Per-tick DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP goal evaluation. */

The comment says "Per-tick", but the event is emitted for each matching
goal in damos_quota_score(). "Per quota-goal evaluation" would be more
precise.

> +TRACE_EVENT(damos_node_eligible_mem_bp,
> +
> +	TP_PROTO(unsigned int context_idx, unsigned int scheme_idx,
> +		int nid,
> +		unsigned long target_value, unsigned long current_value),
> +
> +	TP_ARGS(context_idx, scheme_idx, nid, target_value, current_value),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, context_idx)
> +		__field(unsigned int, scheme_idx)
> +		__field(int, nid)
> +		__field(unsigned long, target_value)
> +		__field(unsigned long, current_value)

Also, context_idx is currently always 0 here, since
damos_quota_score() only has struct damon_ctx * and no context index.
If this tracepoint is generalized, it may be worth considering how the
context/scheme are identified rather than introducing another tracepoint 
field that is currently always 0.

Thanks,
Kunwu

> +	),
> +
> +	TP_fast_assign(
> +		__entry->context_idx = context_idx;
> +		__entry->scheme_idx = scheme_idx;
> +		__entry->nid = nid;
> +		__entry->target_value = target_value;
> +		__entry->current_value = current_value;
> +	),
> +
> +	TP_printk("ctx_idx=%u scheme_idx=%u nid=%d target_value=%lu current_value=%lu",
> +			__entry->context_idx, __entry->scheme_idx,
> +			__entry->nid,
> +			__entry->target_value, __entry->current_value)
> +);
> +
>  TRACE_EVENT_CONDITION(damos_before_apply,
>  
>  	TP_PROTO(unsigned int context_idx, unsigned int scheme_idx,
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index b63e60ef8990..6ddd15dc4f55 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -3294,6 +3294,22 @@ static unsigned long damos_quota_score(struct damon_ctx *c, struct damos *s)
>  		highest_score = max(highest_score,
>  				mult_frac(goal->current_value, 10000,
>  					goal->target_value));
> +
> +		if (goal->metric == DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP &&
> +		    trace_damos_node_eligible_mem_bp_enabled()) {
> +			unsigned int cidx = 0, sidx = 0;
> +			struct damos *siter;
> +
> +			damon_for_each_scheme(siter, c) {
> +				if (siter == s)
> +					break;
> +				sidx++;
> +			}
> +			trace_damos_node_eligible_mem_bp(cidx, sidx,
> +					goal->nid,
> +					goal->target_value,
> +					goal->current_value);
> +		}
>  	}
>  
>  	return highest_score;
> 
> base-commit: 763ad0211c7b587344f03bc4d1299810aeb736f4
> -- 
> 2.54.0 (Apple Git-157)
> 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
