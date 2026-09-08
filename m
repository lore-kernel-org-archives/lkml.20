Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B7554938B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872552; cv=none; b=DfQ8Dl3kKSSNTfpKaQBTcjVeA6b3M7vOlRkQHU3bVcahZVBIkzLXG24eHHmckfkGYxWdaZi15ESio9bw4W5wgmX1f5TOvJFTV7WJnNahJlD9pka0Hiu9egJN5PPsc/P5OpphXTMMI22Hp7uBT/RAAXmxRjPHzW9Zrn0GriOQiGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872552; c=relaxed/simple;
	bh=dn92Mo88uA51N0gSIQRdK0p8DpIE8ybkptRjiyJjPbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hb6yLf+5q6pD1tUeXMKPqRMz2MWS4WXbIHUaPXjZQVZFvjAfyXBVHi8+wY1AuWU69wSjwp+igMNpLx1rnXPvmn2gx3SyCErKHD5/rM8N6isdOzBuu0q6RdGGJ4/zV8EZfyWn3jy+Dbp4MPk6wZbZQaUEJmodeuWlRPCRrV0y5cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OcT1Rhts; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OcT1Rhts"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f96c5b722so3253246f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872534; x=1789477334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJ1elAf4v/bn33w8Prh48yV0z8gg3E6Slnlr125hPM0=;
        b=OcT1Rhts7rFP8NMk25rtQ9PxYPR108uAYUV6LLKvC66H3tVSUXFIEiupv8uzZmJpH6
         vLVM8ny1ZZKBr1CPCgminSExbwdmpLTplYJcQI/Z3pyguLVS91CqVQ96A19q7FuwAL3Y
         86AdfC0ztXEd64LdlRuiso+T7I/ACBkwoluZ5lzmki67V+/LJRjIClNHy8hwLo4GQnaM
         8ZlQQooohMoUXTi1w5lJv/IDtIlegl8BT6Jqe3yNft0fkLBFCN7wTxIzHcKaaQxFqZ8F
         X4jxJabVXDtW/AU9/m0TN8inNOTZ0+0kVShPxwFIYY4rMLRAVn+OzFECcIFT5askoaIu
         qMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872534; x=1789477334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJ1elAf4v/bn33w8Prh48yV0z8gg3E6Slnlr125hPM0=;
        b=G2VKZpxTALtdoHGGNKhetFwZGL3yeFPb9HQf1ht0Qn7pc7H1ir4SPOU8+TX4qBU2is
         I86rChokDAd6+N9Fz+ua6keUPaLbfiVyws8/Ulx8t/xHZrnjySK36FTXwPY8kolywcQi
         e4C4zlIYjmsEdKmp/brKnDA/LxdX2H94oFIsk5cO2jBvX6kuMloekTcd28c6bXw2YDAu
         s29kx5GbMxQqzArcCvXkO8rGi3t5DPYR3XZOFsVmJ3KHpkAYpqLUmTglut26ghknEs2Y
         M9yjVrBIJyG+3Z+xNRrcGn66wYP54q/WEP/DPAze7/3hGrWUYZI1L7leYYfDugH673uN
         6/IA==
X-Forwarded-Encrypted: i=1; AKwUvByT5H1P13VZzTVr7ZPmRAaudsZQ8FqPyf8GRMqeCEQG7xORXFRv7ZugO6/I6vcnHrYrHlQz+UO0Bagr0iU=@vger.kernel.org
X-Gm-Message-State: AFuF++nwex/ldLKQI7uhzNzubzX9JCB8IIscosgjSMwlsfxLJcKESfRf
	k5MsjSsFL8qSt28TTCkTeI6Bx5/cPZ6K4EJ3EvQXsfo6FDKWVA2lShvHyhw2c51Z4Fc=
X-Gm-Gg: AYBFou32E7gC7g+842p11d4knqSbaChEtsKKxGvxgTgQDZs07RyvaGKU7NzbCryBWHL
	23Fc3JzQTlfXU+PHda9SO48meZpSBUNOJWO9lRmaY/8jYSy2VfZTKZyg1RdHOMw89BNfK8G9jXE
	PGjfaXx2n2imELV/KmCIZXM/FuiwYfip7eou1QbVcxhBdSSl0IcPAjchr9Lr3gg8qDxwmOtdxuT
	psAbHqls3TB9q2XbpLFTEkBogVWIfza144O+fQLOiYepPV0qo+yYkrlg5Z7mLtdsVBTvpYeZPWj
	h+NKt+uA8HqK2/KB7lzEwrfB2uki+BOzfUKwrzZRizz3gPjgxAq8OjqhVwZ0zq+3d2ZIVz6TrI3
	F8ibD+ckxClEse5rt1TuwnYUhZWCEaKjAz/f1wkC74FH6SsaF3C5fysi/AZFrRSVz6ofxOK+Cie
	KB3h76+EdrE2ALTXr0vRHOQu6yPsQIhVLiwi7oksH/f07Ib8RP2lKisz3IvZxDwg==
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr28510814f8f.47.1788872534455;
        Tue, 08 Sep 2026 06:02:14 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm36713640f8f.29.2026.09.08.06.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:02:13 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:02:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Harry Hsu <x90613@gmail.com>, joe.lawrence@redhat.com, mbenes@suse.cz,
	jpoimboe@kernel.org, song@kernel.org, shuah@kernel.org,
	live-patching@vger.kernel.org, jikos@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] livepatch: Fail object initialization on
 duplicate patched function
Message-ID: <aqAHU9Qecqvl88VT@pathway>
References: <20260908120325.299649-1-pmladek@suse.com>
 <20260908120325.299649-2-pmladek@suse.com>
 <20260908121744.81D641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908121744.81D641F00A3A@smtp.kernel.org>

On Tue 2026-09-08 12:17:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Atomic replace patches will fail to load if previous patches targeted aliased functions.
> --
> 
> commit e5553650270f93e11fe885d264a3829802223d3a
> Author: Harry Hsu <x90613@gmail.com>
> 
> livepatch: Fail object initialization on duplicate patched function
> 
> This commit introduces a check to prevent patching multiple aliases of a
> function within a single livepatch. It fails object initialization if aliases
> resolving to the same address are detected.
> 
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index a240d1144e89c..a6762cbe74b70 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> [ ... ]
> > @@ -885,6 +885,21 @@ static int klp_init_object_loaded(struct klp_patch *patch,
> >  		if (ret)
> >  			return ret;
> >  
> > +		/*
> > +		 * Aliased symbols share one address, so they would resolve to
> > +		 * the same klp_ops and stack up on a single ops->func_stack,
> > +		 * leaving the redirection ambiguous.
> > +		 */
> > +		klp_for_each_func(obj, prev_func) {
> > +			if (prev_func == func)
> > +				break;
> > +			if (prev_func->old_func == func->old_func) {
> > +				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
> > +				       prev_func->old_name, func->old_name);
> > +				return -EINVAL;
> 
> [Severity: High]
> Will this check inadvertently reject nop functions generated by an atomic
> replace patch when previous patches targeted aliased functions?
> 
> If previously loaded livepatches targeted aliased functions (for example, one
> patch targets __do_sys_fork and another targets __x64_sys_fork), they were
> permitted since they resided in different patches.
> 
> When an atomic replace patch is loaded, klp_add_nops() loops over all
> previously patched functions and adds nops for them to the new patch. Since
> nop deduplication is based on old_name, nops for both aliases are added.
> 
> Later, this check in klp_init_object_loaded() resolves their addresses and
> finds duplicate old_func addresses. This causes the initialization to fail
> with -EINVAL, which prevents the system from atomically replacing existing
> livepatches and might force a reboot if the old patches cannot be safely
> disabled manually.

Wow, this is a nice catch. I would say that it is a corner case but
the problem seems to exist. Now, the question is how to deal with it.

I see three possibilities:

1. We might detect the aliases in klp_find_func() and create only
   one "nop" entry or do not create it all.

2. The problem might be easier to solve after adding
   the provides/obsoletes, aka replace set, feature [1].
   It should prevent loading the other livepatch for the aliased
   symbol in the 1st place.

3. Just document the problem as a limitation. It might be hit only
   when installing more liveapatches in parallel that current
   wild way.

I personally prefer to wait for the provides/requires feature.

[1] https://lore.kernel.org/all/20260607131659.29281-1-laoar.shao@gmail.com/

Best Regards,
Petr

> > +			}
> > +		}
> > +
> >  		ret = kallsyms_lookup_size_offset((unsigned long)func->old_func,
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908120325.299649-1-pmladek@suse.com?part=1
