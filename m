Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467034;
	b=W4AkU08bhxDOuJd5ucZmzlI+bJ2OLfGK9NcmujT/R8xDH9lnpN4fzk3nBbfTiQyF+bnL
	 I/MCAI/l1Y7nHUtBQXLBGJB5jiH/h5zXu5QIrfwtSWBlzJQNd960wSpScHnNrvYBfG6oZ
	 QW3hu43yJXqdZHQyrbXRMFFuAdfip1/zm+XwK9evJtrYHlM5GxGQJIWbY6vgrULw3sQw0
	 EnWIp0SL19SC0hiCuKIcJp9aLGcRzzkzJlMP1EC0Xk8BJia9KshUZVIfJFAjEWeW2AwHx
	 fk1UykeVHrbYv85U/PABD5XM9ABbtl6pa7PCvueX4wtRAWQb2448RctIi0yLub+gT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467034;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
	b=wjQImjS6UIprzRltqEyPkge3TSjgGgrlgbbiEC8Ojqbqza/oOBng4kk8ScCCAJTN8N3z
	 jWXnCNJjWcAvu939z+KadTL0/PnywGoX4MvDI9dZLXnhK2ljCPWAbg6TaaAezt0TlD2QF
	 K0DXms76TINMaX5mnIK1jl+4DNM9aILDLoRX/MWjw3h7BZlvMmAiH69T+Lq+Yf4tIOtoh
	 VUZxvScSE47VxzXa1g2lK1NbfY72phLadZwOiaTbO+Ac4LhyaSLdyRVor75vRJIgmvEld
	 3YG/hj2WrGdI2x4P5swoLY8XA9Ix5ETIX56Vk+AYUyLYJtQ/HxN94DoN0E7JdVQvHJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UU4sr+KE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qV7AOgop;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD5B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UU4sr+KE;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qV7AOgop
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794467032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
	b=UU4sr+KEXLWG/VMn1tojphdaL3NHxohGi1XR7H6d1DZnX2DZ/Dmoe4EXaCaFOPROeVmBuD
	2Bfbh3HCYBFXXQFQrUCiXcYUeVnOSG812IacDyGUJsnzLOreHMjOSegjGGe6KiHolligtl
	OeRD6FxIHNmw1C/SrndI+EtsqjnDOk8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-Hl8HPT92OHqpwOG7Wokpyw-1; Thu, 12 Nov 2026 02:03:50 -0500
X-MC-Unique: Hl8HPT92OHqpwOG7Wokpyw-1
X-Mimecast-MFC-AGG-ID: Hl8HPT92OHqpwOG7Wokpyw_1794467030
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-490a0e72578so2892854f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794467029; x=1795071829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
        b=qV7AOgop0W01vPhiKpcbR1iniUM5nKXxDo0iqseOsfEa7Vdop3uUtjikrlcz9SfGhX
         swRduSSzYFGPA6SA1t0n/QbHVPGxqpAkLR364JdwWI2FHto12oirN84ozqFqFMq20r1F
         WUyGD/gKFIKiGOgs8EB7mvjygEmIB6oYqrdDeV6MTrTONcrBiyutaMcXH9UZPOTY+izo
         bdNJUrD04e5vd9Ifm+3QURW2XY1Q0PG5n3UAVMkxJDF3iaDVeuxNhWZcsf/3oDmoYqfu
         VTbWQJzjrzM8tI5fxMlDn45A68wJutyg/8IB6/YQC8CI8F4D7IsPPkKg4DmE7om/b3Tw
         eJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467029; x=1795071829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
        b=QaoJKtlTYxUb+QlO1a2XY+AbKDZ1hA6EssuW7Q/2UdjxvniSzcyapQ3Nsf5FI8bgYB
         WRZuJl3hSEJgyhGo/L0aWVCreQ+WMdnVoKc5CIWl1YD02VwajHP4rlC07bXx2AKAoQGJ
         L5/zGKpYhZpLGDnTaSHc5SzK2l6Ocmnj4ipNehV4v3nz6d9/YuiZoyAzIx+BeYPPCy2m
         Ob4qhaaDuey5JW6GGgc1kEIoQAdC+gtsG7xiqx2AQDAe4WGdRvbQB9nzWv2ZO2KACNh+
         xas/nJjCb91BiFBOkdZvLDndU3fKiduGLTNkvnfhgu8Yhb+uhJupGDn0l+X+1ckA/hnZ
         gnDA==
X-Forwarded-Encrypted: i=1; AL+hErG9Kx7xC5OIJMmrFzdAcflmX95cOK6plkleojkMu9d3c08GvagS1JvMMwKW0Q1NDa2d/o5Qqk/X0XukoqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jKO6SiJMmr2f0sM6Ncp5cpXdfvAvpJCZHFfDiImnFjA4Mw62r
	nF38SGy3hPB+wB8818Wqf4OaVjUpAcnkuJIpu8Zw/wo1z0/kv9NQMlLCApcUlLmX52y9KCdNuVb
	QnyFxyoN1wu2hWbOQmPcNg2IWrw29EYQOaBBMCqIlxGKneXDqIQWX1vuHYuA0YAFIQA==
X-Gm-Gg: AYBFou1dA9h79v6179/3HOs3znc1avGJjq/rBMD3G3D/iymGQyZ3U4Y+9N/SgOGHBOd
	2DEOr36lcAJCJGTB7TiDE9HO8UVi25VLbMQLWLDCSqGE4MGDukUkWdl94UkhIk+XF7Li6/wM/oD
	i275I2kQ1QajXQYwV9Kw67xhUm7Z4/Nkx6w8X+UXXejBAftvQUWQmyLqTvkUO3VqrbRcnQbfLvk
	oDikO59MPSm9N90K7Mhhx4XGWL5Dwu7Cf4giYfpWZfD48NTW9HJwTDttr2tnD6Ru8QFcpJE9UFQ
	eH1Y4b+9URH9X/1hBVBmXC8qu9wjpOxt64nojFbXDQC5Fn+OhwAzWu59t9likubr6pB5z/9qzXV
	3Hex5mcAXENfieg14/xEQ7CtKkXXGBa4EE6KVaMMPaaenkpRcGVMTCIP6Mbxq2KcU
X-Received: by 2002:a05:600c:46c5:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba093ab88emr83497795e9.32.1794467029448;
        Wed, 11 Nov 2026 23:03:49 -0800 (PST)
X-Received: by 2002:a05:600c:46c5:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba093ab88emr83497045e9.32.1794467028991;
        Wed, 11 Nov 2026 23:03:48 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm14952955f8f.55.2026.11.11.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:03:48 -0800 (PST)
Date: Thu, 12 Nov 2026 08:03:45 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 18/29] sched/deadline: Move a task's bandwidth only
 where room was made
Message-ID: <avVk0UU8IRGoo77v@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-19-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108185406.1549770-19-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> Commit 7f51412a415d ("sched/deadline: Fix bandwidth check/update when
> migrating tasks between exclusive cpusets") moves a deadline task's
> bandwidth in two halves. cpuset_can_attach() reserves it in the
> destination root domain. set_cpus_allowed_dl() then frees it in the
> source, when the task's affinity changes. Its comment relies on the
> first half: "We already made space for us in the destination domain".
> 
> But set_cpus_allowed_dl() runs on every change of affinity. It frees
> the bandwidth whenever the new mask leaves the task's root domain, with
> or without a reservation. sched_setaffinity() gets there too, if the
> task's cpuset spans two root domains. With admission control on,
> __sched_setaffinity() refuses such a mask. With sched_rt_runtime_us
> at -1, nothing refuses it. The bandwidth then moves with no room made,
> and no root domain counts it any more. The destination would underflow
> when the task leaves.
> 
> Fix this by flagging the affinity changes that come with a reservation,
> as SCA_DL_BW_RESERVED. cpuset_attach_task() sets it, through the new
> set_cpus_allowed_bw_reserved(). set_cpus_allowed_dl() moves the
> bandwidth only with the flag. Without it, the bandwidth stays where it
> is counted, until the next rebuild of the accounting counts it anew.
> 
> The attach still flags a task that became a deadline task after
> cpuset_can_attach(), with nothing reserved for it. "cgroup/cpuset: Give
> back the bandwidth an attach did not move" fixes that.
> 
> Fixes: 7f51412a415d ("sched/deadline: Fix bandwidth check/update when migrating tasks between exclusive cpusets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

...

> @@ -2957,6 +2957,8 @@ extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
>  #define SCA_MIGRATE_DISABLE	0x02
>  #define SCA_MIGRATE_ENABLE	0x04
>  #define SCA_USER		0x08
> +/* The caller made room for the deadline bandwidth in the new root domain. */
> +#define SCA_DL_BW_RESERVED	0x20

Why not 0x10?

Also, nit, the comment looks off compared to the other flags w/o
comments. But maybe they just need to gain comments (I keep forgetting
what SCA stands for - Set CPUs Allowed, maybe? :).

Thanks,
Juri

