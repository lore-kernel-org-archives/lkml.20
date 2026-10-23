Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792758239;
	b=GVxDlY0nT0Da5bd+kgObk1SoLelmGGE9CTbPiGrCM/WfKwb7ZqeLXr1A1D3pV/5b/08s
	 OlvDh1xwftDGSRFzkl7/0b2khUJmFGollcqFnEXm8TWU/Sfix0OYn9sknlmBQEjdLgFQc
	 QnZGtJL+NKD1qMLYPIQCeS0UTCiHHCWl2P3RrIJmuNgRO/XswGM4yKPs+LhipNhreg0WN
	 BAE7aB8x4xEZKOxMJ4W/QEi58p8WAn68enahh3606lPD/ZOXbQQZT8d5UxXTO3GMInrC9
	 cmgM++M5b3kc7w1e67Ev7Ko1NDcXFUfI1RHj99eiyuQmldRLHTl9W/prYnCeQrWwgCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=F9zgbDfrwWa22334dnT+OLDYZsgLuPVUuaK9HxX9/Rg=;
	b=MbOulVucwOBt8pDxWjv2JXEjsDSg2GtYIOsvJoZahtlPswoNgXLwesASe4D5Xt5qfQCm
	 gXlZPHiJTA/TMfzlcZVUJwtUDBjdkvVnDhoi0ltNsqw1vpC8B3vOJe/KZVS90UMQdENlN
	 nkG7ED/MCfNnqjOJOPLPUEvidDsB1SNjh0HtIex+IfHRBXFxzHOP44YL39SvA8p3z58BQ
	 AgId2Jn7oN7iWzQFjwk59w+rbbcfTBM8p5Tn//HQybjuf+NCiTkyHEYRJ+lh9BZ6cKVS3
	 9LczlVw/g1XYlVrakZLuSSSc7zbJ/xGhnkSwihI2EMF7dzKquM/Kr01pxgyMKr8FDGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GOR9fJsh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3087606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3087606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GOR9fJsh
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c423b145922so108559466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758237; cv=none;
        d=google.com; s=arc-20260327;
        b=YfrmUOwo8oN4bVCI8vLorHgebd/dxz2G4lCKDGG1jhxSBGOW3jsx4KlPmcoqcV6pXV
         2Gzhba+M5iNtUmnG0r9FhuPeBAg7U5zk/q3r4j2mAZaBO8Q9CqFbZtZY84G5E0i/jBKl
         Wys8oYoam5DqM3Yt3s4Qp13k6EkEkpdJaN6neHeNa6c9T8c8pLAyYpVhsCU9+iMFnRMK
         3rAk9vS0wGa9bL5Zk83WOvgwE6k2e/4Z0nArQiZG569kLOc2xLWc+sWfpxdK5Vw3bdQQ
         jD+YATFD7EKZau9teH0Rzvt9VwrWX0QxRVybCghfgHWz+HNPpzOPZvmYxisXgNp6V08G
         3kLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F9zgbDfrwWa22334dnT+OLDYZsgLuPVUuaK9HxX9/Rg=;
        fh=QStLUB0+LmAiv6IOaPzwWLVORW/cOXmjpk7gE6dHSZg=;
        b=J+XF3QSrn7zur/GqI4Dis0fMAM5rXJCwSs3c8DxDhPKmxIamsJ2P8z0TOkwmjv2L7E
         Dbr3DMmQXLe5pTXjmeWjCcOZTuQc5E7UwO+p40MFjOJEpZFvo9Xj0+CQIi44iXF/xbwG
         6Gn3Y3RWZqIZAgEpjeSx5AO8aEGFkrm00rXFA6GlJkRC9Nzrluzdo7JbMTVLzqcqvv7e
         vgKyif6YC3IWEhkCHv69k/t7xkdyOSwVLaq2LFbvDSOu1j62H8+pUO/VkWG2tZMdYGBe
         oAt0GkQ9tzzYdxpCcAqls/SteqB4XEBZKpUO+sSD7AS+4nLbKytipA6KTZmM+XHsX1wG
         eAeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792758237; x=1793363037; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9zgbDfrwWa22334dnT+OLDYZsgLuPVUuaK9HxX9/Rg=;
        b=GOR9fJshWgBp2gDkyx1vblB9FKJLmILHDnYFIr80KYt1cFR7X5gxeUyGArfYaof87n
         6GrDQSGjuKlPM/0tl2vZO47f6vhiOoOTW42TFAushZQZB+rV7utpQQKO6cFiRj7M6dxD
         20GcAPW2YBuHo672S/o1ABA7BW5Y4HLPC3yXVI7yb7WwMlmoGZ+H0rGfGfmB/uGFdqiB
         iqTz+Wqi6Tnm6cU3aNtqHVRuzzFxBbd67oNZWJJCv/AInMiTHVLtkdF7tDtn2GgNWuv+
         aZWQx6NNS9PRqZ8Atv90BNjjXL8Nh4HfKpiiG24EPMgGmQR1ykoGqU2Nnm/b5Z/ZxLtR
         PqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758237; x=1793363037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F9zgbDfrwWa22334dnT+OLDYZsgLuPVUuaK9HxX9/Rg=;
        b=c9+1Z0D8TTn4Wt+ww9a6zwTaa2sHzl+KEcuu70ydFwhnCGvQjRLRr0RYuDu+DhekXZ
         wgVEWO5GiIeAOOJe96+hSgo92F/JHPlnD59gULwGIkV3+Vi0GYc1TVt/4xe2oEQwrtwF
         8Pd4MF88QJX10SlaVlle8cXbR+G2RZi7yKYPmzjKefAuxFRV9hPWsceFnhfi8FMHz0fi
         lap9SvhxhHntC/xUAsCvAnmspayig52IQ9EDkKzd0kXtf1f0WGdM5xvEUAHSxI2z3sWg
         2arasOrLLmPEjDP0pKX1pVtU6tXYbVCSAHzbT31YjijM9heyYPbxcZKx12aSop1Jhu3H
         M0+A==
X-Forwarded-Encrypted: i=1; AKwUvBx5oEnY9VBwAK3BxhENqV1MPb5uMqdF6Zj98T2GjWDN/r5ciyrD9RMPeErWPilfY9smjOI8C69jAvf973I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWZlZN+NuMDWZp+wzjlK9ervQoNunCvB/65KbcIrKbPsUuga9g
	tQnvHVBx15v2fghXj1XFTgQiVunh98snzMZ48EoVETEognBkn8H+ag+PCG6/kDFPY95xZrbAhZl
	UmL1EjiCQGfKQdlpre0dUvqXQSOsvByW5RfW07GgjxA==
X-Gm-Gg: AYBFou370Gi4SVWa2J8F334GcSD93aCvgiRkXMUEzfdyTNiEqy+Nnpw9eI7rkPuiDxU
	7npWAHjuztw7v2dccoLVARB3r799UjNkw689Sr78bOxEye8WX5S/INyaciwlEjjvwWBbo+T/k2y
	9QiMYGoyTKWNywujiFB1sNBqcf4zCAnuroJbRaRMqrlKmKD0e7IvaHoPWsDUZPnsDTAbQHnOZ4K
	qmft+KVOCkVH2jKJr+mDbZaG0YmM55g3sdj1z4pdSLFcb6909ciyTLECqq2zw/oaRHyYrEfmFSm
	vNuh3Ny8um2kUhZHY84Y1m4Bc0ZjDfGRTFKhdx4i2Euosp9UBqqLPinMJES1jiOcDxxjC1Ftudu
	dWuUFV4vN2KFuxlMQDowo/sZghkNI5y8Q0pvocnQoZl6Vph05SIUCyXhkvpivBiFYcLxtDw==
X-Received: by 2002:a17:906:d54f:b0:c46:9d50:8af0 with SMTP id
 a640c23a62f3a-c46a92903b3mr308017966b.36.1792758237155; Fri, 23 Oct 2026
 05:23:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023023105.28829-1-laoar.shao@gmail.com> <20261023023105.28829-3-laoar.shao@gmail.com>
In-Reply-To: <20261023023105.28829-3-laoar.shao@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Oct 2026 14:23:45 +0200
X-Gm-Features: AclHuK83xC9Dk9rIpdRfEr2RoxnTQV5t5rgB8NaBI1MJG6Oz4J-kxNNMBQqk-vI
Message-ID: <CAKfTPtD7UsFkH=YPp9Faf0LX8ppNDw6hkVgFd-0Y30oSBYdgfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched: use static_branch_likely() for the NUMA
 balancing tick check
To: Yafang Shao <laoar.shao@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	gourry@gourry.net, david@kernel.org, tim.c.chen@linux.intel.com, 
	yu.c.chen@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 04:31, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> task_tick_fair() checks sched_numa_balancing on every tick. The
> static_branch_unlikely() annotation reserves the nop for the disabled case,
> so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
> taken jump per tick. Flip the polarity to static_branch_likely() so that
> the fast path matches the default.
>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 973647ad6c2d..71dc47d6114d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>         if (queued)
>                 return;
>
> -       if (static_branch_unlikely(&sched_numa_balancing))
> +       if (static_branch_likely(&sched_numa_balancing))

static_branch_unlikely is used by default for other static keys too
like  sched_cluster_active, sched_cache_active, __sched_core_enabled
sched_asym_cpucapacity and others ...
So systems which don't enable them don't pay a jump when not using it.
I don't see why numa should be different

>                 task_tick_numa(rq, curr);
>
>         task_tick_cache(rq, curr);
> --
> 2.52.0
>
