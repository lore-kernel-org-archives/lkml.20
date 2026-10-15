Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805055C1CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080158; cv=none; b=SuAyYFURO7WEt9knHpsbzSwyVLHTVAUO1o+Shtf2kVA1n7fZhRcsBh4dL2hARnWW4I8UQeqZItjQqS+dv0ker1dhU4uHRfjhpPlArDT6U4E0ssxk5jScf0A1/HjyJGyCGAWsRvv3Mz+D+s14pYhcLd8M2CKMgQ2M0h7LqyeJC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080158; c=relaxed/simple;
	bh=YMS3STAi2ZRbq9hPB/V+mwXl8+F2jV0JX5lnw3Xx+7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxDBQxFX+4WW4vyurlxNblBpAHuVvLzHaJbCyZXjcl07KpWGPe4L2mnR+qXD4AzmBvPErwZtCNOEsOCkWYVzd70y2U58kRAaEW8pZUQgdrDKZOLThe1rClMoo7FQZJ+g0JKwR/qUvvzVO0TlLdvvIvdde+iGiL2uROhE3ICAkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=L5RL9daN; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="L5RL9daN"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917a20e9efeso76955236d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792080146; x=1792684946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qp/9SKATs2UWKIBCgmjLLiq0NUYRNZM0vL2DioomkZ0=;
        b=L5RL9daNOk9LXpcTLefoJTLCjwlJVn6GjjyBeT70CHgHuNbyAYa3HOXTTaI+A+9TL5
         rLlqy3UXypEyKlDFTtB2k/vtcrrHdQHIFfkqfVTchzGx+kMqgt8SMlbPJ31NldA3Xh46
         abEkquWndp94Rl++gDxxrJ3Znuq5ELEll/+yuHgmo0ed3Qu7ZoDd4tC8YJEqM6XhuzjA
         RcKZdnHY/AgISnIa/vTY0mIAzt4X8Ir6+E1a7uJz4Tn5uuV7LFCipWcBBUy3d8sj9wZF
         RX0Prw6CS86AwLVZJCgf/OasBuMg2/jemy0INqWfnW0dvtvYhF9ihzM2l69jizJksdzY
         36Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080146; x=1792684946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qp/9SKATs2UWKIBCgmjLLiq0NUYRNZM0vL2DioomkZ0=;
        b=vM0lT6xfQrJ3ybM3s4+50EhyhB73elYjqR9G2XObxw+f9+cF65szZLjqQGO2j+SEGb
         N1u9UcLYeFSdOVDMKrjkzDtQvl1zsoY8+ZVRK+TxBSPSruQQ8Okh2ZUhk85WZuqUcfye
         bNQjvCFF2jeJyY9vznnvq4pa4kf4Zh+fn2wlVXPIwoUVPTEykYmoYZo8DlRJ62hxjLVF
         iHLrvMeTcbgWAH6KdOn27HiAl8OyjrcbvXSZRnbTUcNUvBT+SZgADHlhRRd8aZH3Eyxn
         FGBn/dHDKIC/gqWZ1xnMc5b3x46m6Uvd7TMFsrLosdljDR9tDvycM+fEYx3zAJoJu2Ea
         Tw6w==
X-Forwarded-Encrypted: i=1; AKwUvBySgE0Rw65Dbz9aTFIetyqK4i5s14lUodz7dkbPV5dRBo7Vhq9IMYRX4KeikEmpq8rYueSO3jaLbkwrNrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEF4Uy6DiA63UBK4ckk4m9m0xn8l7RdXJ0lwkGwiOhkRgbmDAK
	m6ZXKi2Uu3u4co3LeZVDAYEO9zYbtVll0j4fmr2aJklQQv18ZcbZVlGuSJXoNHy59wE=
X-Gm-Gg: AYBFou0jschJNCIzQ01MBVM8vk5xliEaYUVVHFooToD3oJbmGBaDhbimodr5QrN/9Vz
	k3ktRyvpGPUFJvDXjiGdN9+nCDm8tZHh59hifCuDeoX8bGeM1Z73rHeAA05D4W7GVCaOQ4i3yVe
	os9NTp8u3MhziUTE/FqhG1ovYGtv5bL43ZkRQWvm8y4NpfVt11l93O/a+evM4z1VbGpy9QfCBYp
	fkIg1XG+mdweU8R+n19ZMWcQ2Eo7qhk2My2dfVFRKgWxzdo/nCiEEBn7vrxdJ+tNvlul4kN12y+
	260KAQ3p61IZURXNOooROQWk7sNhM7e8jESlQuNcrQYvz/rkb6JPPEIhuP7MgTaaQbHHJpAw9wL
	XN9zn/lNJJD7HPwlvmB5HuxlsHEdBLz53qMqx8L1SAKZv1QT4LbpwgQLLCxaprAkQxbWQ5xT3gP
	MrrsAk1G/AG+RQuDME1W9PZ8qs+/hXuF3D3jgM+ob+F9rmt2AuZIRq4lH0B8K/8R/WI9JGphNzS
	nKRSFjfpDErutSkDBrazhuiUv++GrasiuK/6mMqh6sbP9pqt7mMToA=
X-Received: by 2002:ad4:4eeb:0:b0:914:5552:8a56 with SMTP id 6a1803df08f44-91b5533f620mr339928906d6.4.1792080146178;
        Thu, 15 Oct 2026 09:02:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b99ed3e9fsm78354316d6.29.2026.10.15.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:02:25 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:02:23 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/6] sched/numa: fix scan-period adjustment for shared
 faults
Message-ID: <atD3qhbqzN2R9Bxx@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-4-lizhe.67@bytedance.com>
 <as9_SwmLxAcTovnl@gourry-fedora-PF4VCD3F>
 <9b9e6c92-a291-48b4-a128-c31bc718db7a@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b9e6c92-a291-48b4-a128-c31bc718db7a@bytedance.com>

On Thu, Oct 15, 2026 at 07:39:42PM +0800, Li Zhe wrote:
> So I think I should separate the severe fixes from the heuristic changes.

This would be appreciated.  The heuristic changes that aren't obvious
Fixes: should not be lumped in.

> For the latter, I will narrow the next version to NUMA balancing behavior
> that is specific to memory tiering, instead of trying to justify the
> changes as general improvements for normal NUMA balancing workloads.

For heuristic changes, please try to generate some kind of data that
demonstrate the behavior being changed. Some of this scan-period tweaking
is very difficult to understand how it will affect end-users without
examples.

There's risk of introducing unexpected regressions when we change these
heuristics.  For example - the recent shmem scanning fix.  Fixing that
resulted in 4-5 other regressions, despite being a "correctness" change.

~Gregory
