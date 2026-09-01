Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D0397936
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298522; cv=none; b=a/6Ob5nsHXt5t1QNE1DiYUUCJO90Y29Lw0/FU/ivLS+/+A9oJ3TJUgE5Cd2H8HpHkI3QdLbrLzu4tH3rgNZzavWSzQ0s+nujPwy4rDZjaClBsAneMzRoitvAyAvlAj1m7cU7PLnVSBbmuRf1N86Q42a5fn/rygPI1D6WgFwmVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298522; c=relaxed/simple;
	bh=NIl2SpJoXWgkNOAN+Yj632DNwtSCaFq/3Wl4BgGWVdI=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=PmWcKC/d/hpuRYbsPRV8LLcev6uWbyG35g+qBgA6ryJOXFPsXKnDsRePJ/VLMYaYoDedAjP2S9WRqfQG+E/K2luIuU1fOaOFH3I3IgkwaR9mNWBfO9K86sS+lGUyc6T4kU8pI7rxTILZ+F2duZqosQ7/kVNRvcXROqFQFhE0hJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZEVqycYC; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZEVqycYC"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c2a449c57so3095261cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788298520; x=1788903320; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGBMA70aQ29OFSgQVpxK2CgFIHiB2+n9s56OX+rPnLo=;
        b=ZEVqycYCFHAErVBCpQA4+jMQsOefuk3c9Sq8gj70AscOgNuZ4nraTGThDarFvtmCVK
         ZDAcICdLOuuQU3z2FggLn9Hop3QQ8ec8SU5euIpV3WppV/VMsnbzZm0R2Aarr2QJIxKb
         Q3ZxJ35TdR5Y/W9cvg3T9/efzUyZviRE2J2F4KcdLAg0bRBSUv6jXa66S0vz5j+N0GWu
         6BjCGuDLzEFXk3oUAGMVZMTkOpMiGpFDHVSgieU/qWuGZNnO1OEaMW2GziQsQ4cp8ZTH
         tGgk8L96myWSUQJvPPJxGuTyMW8+9g1mPUab/2mNlJpOI3qX/0/SR9Vcn3usLm6zRa5I
         N8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298520; x=1788903320;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGBMA70aQ29OFSgQVpxK2CgFIHiB2+n9s56OX+rPnLo=;
        b=PoLrtl9zck5CTnvWWtUuLXLhfXNTJ0tCgJuKWm2wtqiKK/KuXR7Iu/0BpLh1JLS3l4
         OzCmGZNUF71a9iOeI5EPobiNNoJRuDyZcc/dkqif4BlN2ytHk2w+J1VLGV1mKIY7aAC0
         Xvoopxwu7Yfa9YnVzJi2O+9GDC9uq3yPfEF2zlM/srChUX9tQ+NZFgGJ4iLB4lPUlxEZ
         w2KZaoe+Dgzjv8Oz9Bcb38KdVCDEBd6+mCXLj66eHM24EIphnUg8x7KsHwl1MfTm02Hr
         tQ5bu/sF/QWNZ/4iQB2b1ppNJNRw2ZaO1wGHf+ljm9zpkeIzPD8YnZvHD3NsTycxkgAB
         +S6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq5zdlz9Vpqzc/LujEYv6feldig5pgzpUphAbLMVTtOQ1SZ11m4LTM8CUbNtFdbJIvFJDDA+EbqJHUREZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mOJKkh4CAFVIGku1aASG8b58c16Qr48gOG4qk30oZpByGQufUU
	qoCku8gV/9wSe6o1Zo4AYTug7dSJo80FyM9wMYW07puQ7Z+g9tJeUYMn76mX2spHuQ==
X-Gm-Gg: AR+sD13p7o/90/odLtgB5MuKA2kL4n9rHkmHPvkhIZIN3Ipr/AsY0hAtP7MOjYWsonq
	ZiEKfu7S3VdIvsHR0N4bo1UFPEGQad4Jf+oGrueKkrwd+SYmcFAUq77uPFeJ1PMbjtD29x/OszZ
	dACIjuYPQoWIneu9JiPaAuqqxfxucOw8djRehlzEVu/nwuU+DdNfqoWl9sDSItniHznV9Kj7N+L
	hyNqEo1VV0EWcH/jyxbRAa6Rsl3x+aDiV7QtU37niug3PStYzzxrUVdVijfuwJeisPLtLaaRLU7
	QvrX3+BQWQkW6uvz1M8fK2uT9WWIhjsgTrRV1B5u5QBopNBnyVyeNARihpQ2otpuzyaPivNHlfQ
	MACVtn1KWD007rdyX8IY5/PDSqDEmO/w3TY1auPoQuLQAfWvPhXfAvVnWQHCB+KYxunuHdD90+K
	tClFJLWIoxAb5OEnIrOvxP+OTQ6kgqHBlR8dOSXfAt2rtyxeg/pHCf+spcRrIsU4A4K2pZy1RAc
	apvyBxwAVIBzz3LNvtEl+o4npyL6cfd2nZY7SkaD3ZM
X-Received: by 2002:a05:622a:259a:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-53021c76193mr177282351cf.25.1788298519454;
        Tue, 01 Sep 2026 14:35:19 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331dc455sm5474491cf.15.2026.09.01.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:35:17 -0700 (PDT)
Date: Tue, 01 Sep 2026 17:35:16 -0400
Message-ID: <23b54475e31ed2c5248650d5aca830f5@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260901_1121/pstg-lib:20260901_1604/pstg-pwork:20260901_1121
From: Paul Moore <paul@paul-moore.com>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>, Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 3/3] audit: Skip exit filtering for syscalls without rules
References: <20260806-audit-v1-3-ddd0d94ff0b6@gmail.com>
In-Reply-To: <20260806-audit-v1-3-ddd0d94ff0b6@gmail.com>

On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> Audit walks every exit filter rule for each audited syscall, even when no
> rule contains the current syscall number. Policies with many unrelated
> rules therefore add linear overhead to otherwise uninteresting syscalls.
> 
> Maintain a reference count for each syscall bit present in exit filter
> rules and derive an aggregate interest mask. Update the mask through the
> centralized rule lifecycle helpers, which cover explicit and automatic
> rule removal. Use the mask as a lockless rejection test before entering
> the exit filter RCU traversal.
> 
> The mask is architecture-independent. Syscall number overlap between
> architectures can cause an unnecessary scan but cannot suppress a match.
> 
> The aggregate bit must be set before list_add_rcu() publishes a new rule.
> Otherwise, a reader could observe the rule after publication while the
> aggregate mask still rejects its syscall. Move audit_rule_account()
> before the list insertion to provide this ordering. Rule removal already
> uses the inverse safe ordering: it unlinks the rule before clearing the
> aggregate bit, so a concurrent reader can only perform an unnecessary
> scan, not miss a rule.
> 
> To measure the effect, install increasing numbers of distinct statx rules
> in a disposable VM and benchmark the unrelated getpid syscall after each
> set is installed:
> 
>   for nr_rules in 1 32 128 256; do
>           auditctl -D
>           for uid in $(seq 1 $nr_rules); do
>                   auditctl -a always,exit -F arch=b64 -S statx \
>                            -F uid=$uid
>           done
>           audit_bench
>   done
> 
> Without this change, the same unpinned VM produced:
> 
>   1 rule:
>     median=55 ns/op
>   32 rules:
>     median=71 ns/op
>   128 rules:
>     median=428 ns/op
>   256 rules:
>     median=791 ns/op
> 
> With this change, it produced:
> 
>   1 rule:
>     median=55 ns/op
>   32 rules:
>     median=55 ns/op
>   128 rules:
>     median=55 ns/op
>   256 rules:
>     median=55 ns/op
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  kernel/audit.h       |  2 ++
>  kernel/auditfilter.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  kernel/auditsc.c     | 13 ++++++++++++
>  3 files changed, 70 insertions(+), 1 deletion(-)

We've had similar proposals in the past, and I'll say the same thing I've
said in the past: I'm not certain that our answer to filter performance is
to add additional complexity and filtering.  It may turn out that an
approach like this is the only option, but I'd really like to see more
effort put into improving a singular filter mechanism (either the current
approach or a replacement design) before we start layering on additional
complexity.

--
paul-moore.com
