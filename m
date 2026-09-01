Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01D47FAF8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265133; cv=pass; b=Iwp1MdgpFmkDna/5E08uF6r6poPNQiC+c9I6ZNBdnh50XczJ6dmOig8jSS4GBKQz0x0rMi9rFKeCc6RBsOUNokaLk6nXZSdWYCHAYkFpdrqtR4NtBBMWEJ3PIlGkJQVtGlgXqcU1cqO4uTXV1NPtpakrluZ+lohqOhBo6n18GgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265133; c=relaxed/simple;
	bh=Es/cIjPUD1zzwXufbvKj4+Elkno+b+6GyubYx/khWOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrC8HxDVoGRx4rfcMszoYCd9KtWI+mqZ5KrezbBzD3QrJH3D3/3FyK3qmjt/LpN+w5Gc/jyosOqRGQfUUGCG1AJQS0gKiq6vZ0VjxDQVAugRI7zNSXSeVmy2EbLJULhC7FAI57ix/11Cclbt6MllXJgeK32py7Wm6+d5aZ+gnhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cu+sxr8M; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cu+sxr8M"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so33025665e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788265130; cv=none;
        d=google.com; s=arc-20260327;
        b=o8ql3lvaAPSljTIphM5rbexmpRwsqtfNszGaxjdL5NCLANhMDRlLQgyfHPyWkO9WQs
         QeyU6g4I1rc87nJEi7q2oLdJxHphH5TGyV4shv9xraKyOGS2wf7GoBBc8/oicDgAGK6z
         yJVehvk9G1cvMYvfi5W+p/EEovgvLxC6gyo4nFae3MQphEJ79jxIfrkIrveJFX7PYPT6
         A18na1oSki7+P4aJaQhyj3MXx1jvkoU+mTsFnM0wKPFnSyCsqmKrMBlnz9C1DC0g58z4
         WPykqw9d2xfIlX1LNkjIBJYwXI7xV1UR7pI0K1jv6eje/Reoyst3kJNFzDuUH6RI0rzg
         72Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UvAi+mvqn+hfoITwGygPm/YRj+YQGu0S7A55rivu94M=;
        fh=XNYXhj1DifEgUveR64TWjyg0JEZFGapr8zzCFGYlmx0=;
        b=fVAnKDyc1Xf45eS6HZsVcr3M9JocmhYBnI8ZccdVUp+1RuRdSe/z6YU7O2fcZUuzIa
         q2+xfmgFhcfvLJaXQV8ZcKANDI33JTNKt9DLzehJCU3ZfGjy6SkG5aAyANpC2a+cgplU
         2K9Ragopq3Xtdf9H4EKQm0rU2SW8EI4WLHt0yyExPCVMYcMiOcJlw5m1tFgGr4jxjJJQ
         bT2Igo5zVly0WUcpf/+RB3zH4G+mFpm7fu8p6znHKzcPnBcsdsXCL2OR4po0vDpLowY1
         JtvrfiarUoR3fRjCFbxSWb8H798v129YAZgZcEX508QcJftj3freJOQBgYUsq0axWLpr
         6Hpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788265130; x=1788869930; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvAi+mvqn+hfoITwGygPm/YRj+YQGu0S7A55rivu94M=;
        b=cu+sxr8MK5sNC/uVsEzuQ15QB5fgL926vBMF3dm9MLyD0FjEmRuoRHqdEw9BqHWhye
         TBa1ExtRh8OOER2i74w5OILPqw3+MU4Kneja2YTshuGPesAeBzKlKZEA+4NbY/5uo52s
         RDr+jyzZQQCG6tHuikKqwWYYiwbpYYhMR6EbPHdhaZQl39yJH+6Ucx/k92aI0waI5QSl
         O6fMckPyqyodn5Dc8lzaFZj2I8G38EoFHu45F90amE/RCLIGCffXnCpC2dryp2Qwhlb4
         V10VFurB6/JJp3Fd+6q9Mu32cH5NG19cGUnMpuMfignb3pTXtybWNn1dMXKfukPyXipz
         0y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265130; x=1788869930;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvAi+mvqn+hfoITwGygPm/YRj+YQGu0S7A55rivu94M=;
        b=SpY+TONliv959fHhpxPsA/LS2oU3wsZOkwyEARAmAW71Kr04rtABVb7dcZDosCA0jl
         k/cl+Uua6hDhy0BFDEUPIogKUlEuJzBGZEEuNmnqSBkJcuJ5THRg40BWdoE9cyD77OwL
         t0r7ApT+chW6tYmpj/7qBgfj5N33veWvAFg59ftX+/FeDYKPNggcB7E1Db+fyUteTlGV
         Bjx6QsQnxBYeT2/p3qRvaVywaqdobEu73/Yt/0MUaviX8fT1ZrKIWFsZgklnoiU02VMJ
         u5PSyuKyoZREYdcFZu5KcJpEzBrPx+DvnKcriQzsUQG9U/sZgiRdVUxFZX3/ynMWThZQ
         /aCw==
X-Forwarded-Encrypted: i=1; AHgh+RpAw5mGdaATvd+8Hto7eyRBVVXYdRb522BfTVB3FbTOX7+jCrfPaq9yWCtuMksa6iWeAtfMb9yUBqsSIjw=@vger.kernel.org
X-Gm-Message-State: AFuF++kWyjT1je1qC5qDitVH9q0pX+cw0NsMR1k+ce3X5InHNMMKpgTV
	e+VKnW5t5wfJtEPKXSfbYpacaNgjjzUuQ6YfgxKNzUaQhlyCqf5LAqkle3jic0ai7gCghSy3KPV
	8AYTk+jJbY7JY4ie99vd/iWEHtILCrjXGYc29nkUJsQ==
X-Gm-Gg: AR+sD101PLfaxb5oRqGVMLK/VhY7AXmEalPvVLGS5+yVNPfMn9VaM4XXRtZbdUmb4oH
	ZYiR26BKjOig7o426tKDaby4OJ85HtedBWaOdiqaYMUNwDSCh3SGYBK2AvxzpUslWr+lxZ+Gcbm
	Ch3M1NAGje5wfEvY/FibkiMz6uiZgDVHe6bYpezffQWLrXT9ciXwLn4SUA+48dq0hGgRWgpz0pn
	lIxcd09UHnRQza9SO26FOA/trdEXBHsDPpxsms2ATlZfjEag1OdL5enIwB8qjMRb688gQH+MuJC
	XowpsGpRXAQofyINN5/gxn26IBRT9ZpvejwIgUgHwIAAILVMmCDeXvTGn5/ndaWYCtTAt4vVK63
	JErewPQDSpZjypf+r/p5a/5b6ibkeqPPMSqNuFOxwgw==
X-Received: by 2002:a05:600c:3b13:b0:495:4d5c:903e with SMTP id
 5b1f17b1804b1-49cdc4332d4mr140012115e9.7.1788265130443; Tue, 01 Sep 2026
 05:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-6-neelx@suse.com>
 <20260601230913.GD25574@quark>
In-Reply-To: <20260601230913.GD25574@quark>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 1 Sep 2026 14:18:39 +0200
X-Gm-Features: AcwNN1WZzfR7nMvK7wzsu0uw9g-Q6K8Z-mgC6-phqgqu2rO8TCpwPmWb_Vlt_uY
Message-ID: <CAPjX3FebVAj-U3s7nJiwu3D74p_nAGacYPJAX04TVXJBaievGg@mail.gmail.com>
Subject: Re: [PATCH v7 05/43] blk-crypto: add a process bio callback
To: Eric Biggers <ebiggers@kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>, 
	linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 01:09, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, May 13, 2026 at 10:52:39AM +0200, Daniel Vacek wrote:
> > @@ -330,6 +330,17 @@ static void __blk_crypto_fallback_encrypt_bio(struct bio *src_bio,
> >               }
> >       }
> >
> > +     /* Process the encrypted bio before we submit it. */
> > +     if (bc->bc_key->crypto_cfg.process_bio) {
> > +             blk_status_t status;
> > +
> > +             status = bc->bc_key->crypto_cfg.process_bio(src_bio, enc_bio);
> > +             if (status != BLK_STS_OK) {
> > +                     enc_bio->bi_status = status;
> > +                     goto out_free_enc_bio;
> > +             }
> > +     }
>
> This looks very out of place in this function, because this function
> potentially submits multiple encrypted bios whereas this code assumes
> there's just one.  I think we could at least use a comment here, as well
> as a WARN_ON_ONCE(!bc->bc_key->crypto_cfg.process_bio) in the case where
> an additional bio is being submitted.

While this funcion may submit multiple encrypted bios in general case,
the check below makes sure that in case of crypto_cfg.process_bio
callback splitting is not allowed and only single encrypted bio will
be submitted. The WARN_ON would be impossible to hit. That's why no
handling is implemented with the in-loop submit.

> > +     /*
> > +      * We cannot split bio's that have process_bio, as they require the original bio.
> > +      * The upper layer must make sure to limit the submitted bio's appropriately.
> > +      */
> > +     if (bio_segments(src_bio) > BIO_MAX_VECS && bc->bc_key->crypto_cfg.process_bio) {
>
> Checks should be reversed so that the expensive bio_segments() check
> only gets done if process_bio is non-NULL.
>
> (Sashiko spotted this too, by the way)

Yup, true.

> > + * @process_bio: the call back if the upper layer needs to process the encrypted
> > + *            bio
>
> or NULL if no such callback is needed.

I'll add this.

> > + * @proces_bio: optional callback to process encrypted bios.
>
> Typo.

Already fixed. Sashiko also noticed.

> By the way, after writing kerneldoc you should run the kerneldoc
> checker, as it will find things like this:
>
> $ scripts/kernel-doc -v -none include/linux/blk-crypto.h
> Info: include/linux/blk-crypto.h:79 Scanning doc for struct blk_crypto_config
> Warning: include/linux/blk-crypto.h:95 struct member 'process_bio' not described in 'blk_crypto_config'

Hey, this is a good hint. Thanks, I'll keep that in mind.

--nX
