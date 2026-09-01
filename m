Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E9374A1D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271636; cv=pass; b=CRMVVQiZuSq4v+xW8akWjycZHTfg6GxINVKXMVwKKgAqumJ2O3YTuCMYGIMZQ8SWEckpPtQk4ntg4lKGG/UPutShnzdGV5ZiM+yV6EkepZEDXpv/deCqmOr8GSPQrIbqMcww3vrtsfuyPlqKucvqLVXTaZO8zGPYh4hdAk6RRU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271636; c=relaxed/simple;
	bh=RIGcl+U27GyVraDoyCCr0BIrhXcX5R2Yw6dtHQoJARg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lp5SUSHLUuhERXx7NXsqqaFCtsMeWJOo/AG3TAXexyQqfle4ko+6GG3vBop7/w/HQ9OhEKPIpAERkDMabMOjGADNrx0DqAOw63WDeNfvzCnQTKPpo2l1Ql8WIZ8DTO7M0Xa3XrQS5pEpm3R3HEIzFRkfOqwZR4yPM9bQzn6i35c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aw65zoUQ; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aw65zoUQ"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-495c49f8eccso640686b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788271634; cv=none;
        d=google.com; s=arc-20260327;
        b=V0Zra6QEzR1gzQbRUKIxIwp7Uqusfp9nAO/wMYusqgUdI6zbOpNhIwyV/PhI+pxIjA
         w4MbcJkrikAtIMuTDjQv+lM42V3eJ3gc/UJMt2r/oR1rtKwkdbxZcZVScVVAdrz2Ez9j
         ZtBlgRkRdn1InnO92F1IzUMlzil5PZlZ3i81+X0vMKBWBNF+dqFnIzQJ1NzD5Qel8Z5Z
         C7a4eP82EE8q4mT0POLjH/b5v9VHrAk46g193NnJzbddrrbgeRBpTsPaORLNb3LTzfIg
         sdGcbBQXdRkUbnWE12Yim7aCAagE7CoxzX1ZycHUFapFs56tf573lA6M3DfQUP528esv
         O3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIGcl+U27GyVraDoyCCr0BIrhXcX5R2Yw6dtHQoJARg=;
        fh=BwlLZRfnY9tkGEK4bDYb0e5c83Hfu/ZaDWqagWmESb0=;
        b=pq3cfdXyx2h3i4lhRMBsYIX1O3ruxb/KDwKB2GgIDfVXcBpgY+Ug0nBPjWeWawiaQG
         lz4zUJjGSRKf2iDIBUOi4wDX7DT0EdRoblAECrgMo1OuJHzkeynGG4a2YmqkF6KlpbkT
         6IuWe4r3nNvz7FOmAvJnQ2VneApbUgFj/r6lAW1D74R9ulWp7mwQuMfDsD30uNkMm6Ri
         3pn/dirq2Q1JI//uRPpen/HuQXqEMvX2CfDIjXo/Za8Zyj+3vNriEP6L0s4JYVruge5I
         im9CwJMq2SqQR9mcVo1C5ZJiWL6l16kXbq78rsuCg75k0Qsm9JWuhCAbl4Np+DtCtE1c
         686w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271634; x=1788876434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIGcl+U27GyVraDoyCCr0BIrhXcX5R2Yw6dtHQoJARg=;
        b=Aw65zoUQYY6RTtWHCPN2jcJNt9npP4+qS+qwCdWFSx5p47ATYVA+YPVKxOYnEc852s
         w37X3+ct7Dt2resncpT+QQgtIgwz5iFa8tn0zW+F6Itqu1M6ZGcVmd5xaRzVVzzvACOu
         ayiB6ePvEav9kWL7aIw9BnB7NLfGMqfxW7GJnfLYqEaMdBesd2982xi6tpxt7kblTea+
         Rkkyul0W65sqqoDSgfrrvM9dlHJxFB5TNjNd4b22f3hhboXr/ltM6EIarNKAh9dKTk2w
         SQFje0tff9A3A7eF1O+b9NFfHd8EYUJiqQOAgIgogjeqJYhUfkkzpVPNJtxAbvISnf1F
         29mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271634; x=1788876434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIGcl+U27GyVraDoyCCr0BIrhXcX5R2Yw6dtHQoJARg=;
        b=J4ToDZ7rHKonzPi14XkIqalSaujPxov9CisR1rmHy5TQ7r4vOlFouHIXrKUcD9CqfU
         c+8GlxCUC39pClFQWZz2ZEBFLDabi+hZaj+yZyJvT5+fPLnOtygXh3Ymllczm2h1AlwC
         jzG0WwsWgv1pMaxuYBfvaNGX4AE4MVUpB0MQLShBveISunlkOKcGMKOs9nlhEj4cydHp
         dhN04bJWW4CxGKMmGVRG7oDYpBjGTqPO92COL3FEhEsRcnVuR0rGF6cUU73IMKQ1Fuy3
         1/3W5v2Wl2dcO9h8R1f2ysn12Xwa+0oKnoiP1GpfxitvqIWXhwX81wj++xQy2Fd6G+CQ
         7L6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq1S5OYO5L9li/E0YF+YigvtiolilSDrNHIbDCbWZOvchSa7tDzb+mnU5vaJCzMWOFwoafrVrltkaEVspE=@vger.kernel.org
X-Gm-Message-State: AFuF++kPvLGuiiSnfbS4ZlUKgIryB8/ZCyuGDXeEuRK1ArQHbVA/HBVi
	rvNsOPbz6V4RL2U2FC8ZQwdhk8dOcFLd4qAhcbBSvixEgtp9t3hiWL0pcFgqyavTeWdMRppUo6D
	WkJXh/NUKtwQcEr9r6+5Ieyk4yk8SUgQ=
X-Gm-Gg: AR+sD13OxMxtfo+sVuJJSb8OH//h4UAiI6hTbXzOXqeXjC3z36SmTa1RFxqqJdLw1t/
	q+g4MFN1zNqGe0HKPzSBS/XCv49XqF5qUynGHoE8HYwIKidQjTb/ezA1z8uFPIPX6ref+L57ZZn
	ggCREoxIyB/So79UYsJWaWZ+asRC4aTA0wdGQszZ1cMCcA4Y4nLEZo44MtxkkbV1iRPZZ9kyEd3
	O2TIe262nW5KWnIblw7l8u0x2zQ7BlA3kDLsRvRBffc7WAqGNEOrR6TFJWNpdm5lNWnN73uy9hV
	sOAXdq41vJ84//qpTAWxTfI2hJ8dXmkGo2beCcMIdbMt1V+doiGk4TzLu3vrrXJVeCDmbfm8qA=
	=
X-Received: by 2002:a05:6808:23c2:b0:4ab:230c:5faa with SMTP id
 5614622812f47-4b39835276cmr36421107b6e.18.1788271633600; Tue, 01 Sep 2026
 07:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-shrink_zswap_entry_0815_v2-v3-0-0171bd86a667@gmail.com>
 <20260815-shrink_zswap_entry_0815_v2-v3-2-0171bd86a667@gmail.com>
 <CAO9r8zNFYM1bry0DwDRNtpnEL9yyXQ3h=1wcLbGsO1sFtGgvjg@mail.gmail.com>
 <CAJxJ_jgihBLy2mbPAN-uqup2mGq+hurKkH=W4RGo4Ad0Eki5sQ@mail.gmail.com>
 <CAO9r8zP6+6jZ7qOxOy1fyd=UgR3yYP20Db9KghW1zJ3bNqoREg@mail.gmail.com>
 <CAJxJ_jh6J5N0vbFfi2139vnTVZEECJoq-AV4VVNew6a0Bkwk_w@mail.gmail.com> <CAO9r8zMr4bnWHzO97R5ZaxALDf_5688DXv_LS3KZ5rz2Noe_bQ@mail.gmail.com>
In-Reply-To: <CAO9r8zMr4bnWHzO97R5ZaxALDf_5688DXv_LS3KZ5rz2Noe_bQ@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 1 Sep 2026 22:06:57 +0800
X-Gm-Features: AcwNN1WbX1D1KzKB3UZxSV6NDo0XCn9KAgMzYBsnhCsTgidhCzJl4alvK9vC8g8
Message-ID: <CAJxJ_jjmODTs9fQCbaHKGFm_4LoRV0OiE_Hdg8N2+tmNugK2xQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:18=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Sat, Aug 29, 2026 at 5:10=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.co=
m> wrote:
> >
> > On Thu, Aug 27, 2026 at 12:56 AM Yosry Ahmed <yosry@kernel.org> wrote:
> > >
> > > Makes sense.
> > >
> > > Actually, this led me to rethink the slots reservation mechanism we
> > > came up with and the issue that Sashiko brought up initially. I
> > > initially thought it still existed, as two racing threads setting the
> > > compressor could try to resurrect a newly created pool. However, I
> > > realized that's not possible because a module-wide mutex is held whil=
e
> > > any module param is set. This also covers zswap_enabled_param_set().
> > >
> > > So IIUC, we cannot really have any concurrency here. Pool creation
> > > either happens through params setting (protected by a module-wide
> > > mutex) or during initialization. Does this mean that Sashiko's review
> > > was a false positive and we can go back to directly assigning array
> > > slots at pool creation? If that's the case I am happy we can avoid th=
e
> > > complexity (but sorry I led you astray).
> >
> > Thanks for the patience here. I wanted to check the details before repl=
ying.
> >
> > Agreed, and I confirmed it. param_attr_store() takes
> > kernel_param_lock(mk->mod) around ->set, and for a built-in module
> > (zswap) that resolves to the single global param_lock
> > (KPARAM_MUTEX(mod) -> &param_lock, "Protects all built-in parameters"
> > in kernel/params.c). So zswap_compressor_param_set() and
> > zswap_enabled_param_set() are mutually serialized, and the only other
> > pool-creation path is single-threaded init. There is no window for two
> > threads to resurrect or create the same pool concurrently. Sashiko's
> > concern was a false positive.
> >
> > I also tried dropping the slot reserve and went back to assigning
> > the real pointer directly at creation. The only invariant that matters
> > is that the slot store happens after the pool is fully constructed,
> > it's the last step of zswap_pool_create(). So array walkers only ever
> > see a NULL slot or a ready pool. zswap_pools_lock
> > still serializes that store against a retiring pool clearing its slot
> > in __zswap_pool_empty().
> >
> > I tested with LOCKDEP + PROVE_RCU + DEBUG_ATOMIC_SLEEP: an e2e
> > store/load workload + compressor switch (lzo -> zstd -> lzo) that
> > exercises both the pool-retire and the pool-reuse/resurrect paths. All
> > passed, no lockdep splats and no suspicious-RCU or sleeping-in-atomic
> > warnings. These are functional tests only, 2 writer races can't be trig=
gered,
> > since param_lock already serializes concurrent param writes.
> >
> > No problem, the discussion made the concurrency model clearer, and we
> > can drop the complexity. I'll refactor the code and send out the patch
> > in the next version.
> >
> > > It also makes me wonder if we can just drop zswap_init_lock, but
> > > that's a separate project. Most of the zswap init code needs to be
> > > reworked imo.
> >
> > Agreed it's separate. zswap_init_lock guards the zswap_init_state
> > machine and coordinates the two zswap_setup() entry points (the
> > late_initcall vs. zswap_enabled_param_set()); the param lock doesn't
> > cover the initcall path, so it can't just be dropped. I'll leave that
> > out of this series.
>
> Agreed on leaving it out anyway, but doesn't zswap_init_lock guard the
> same paths we just convinced ourselves are already mutually exclusive
> for the purposes of pool reservation?

Ah, yes, exactly, param_lock already covered param writers, and mutually
exclusive. initcall also precedes userspace sysfs write, so:
1. zswap_init_state: initcall has resolved the state, reader is fine unlock=
ed.
2. zswap_has_pool: param_lock covered. Writer also holds zswap_pools_lock.
3. *(char **)kp->arg: param_lock covered. Write by param_set_charp().

Best regards,
Jianyue
