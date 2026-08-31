Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBBA46A5F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189481; cv=none; b=pNrdN1+d0kk7NTisb5qjGEHyaz3hid3vKN1V1W3dfKYBi80Rsx1dCAycDU4YyNSOJSfun4lQpESjGsJWfbdVbEAJqtemb5wpf8hTKRUcEz4FC7MCyibCMo1KDkPLwXdv6r5O3n4lbxIpTlWCfepK+mIKRrZvW3Sj7R92pChZ6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189481; c=relaxed/simple;
	bh=WJbtPwAvz/zM6HluisK0JLIwSett1cEn/TfCd38rpXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcVvLXqWIgb/GHqTy8MlSdE743p1/XMKBeKAImeLz8wUxotor6yJvqcsDueNsOKB/ghg9zhKwd2WC9sg3M7nPB8TcCKSeu2wr8zNvS0wMc4RVEnH2XzflepagA8P/im1gmtUIvkuymL6gt7ONBw/IVTJLc5qJsYjHhWa9qD22DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GENwMsoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GENwMsoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D011F00ACA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189479;
	bh=WJbtPwAvz/zM6HluisK0JLIwSett1cEn/TfCd38rpXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GENwMsocGsP8rLt+JAlIF44uiWH4IUpSe/SEKxplHngT2+3FRU1KkFRoj758TaapG
	 bBc0s7iIQztfhvEosMcrDtCbDHAyl2sIfJH/dBXWX95Z8mw2nflPooE6TgyHrdineG
	 ATpEwmBVgC4sH4CPlgnQ83Pp2xabBfkrbmDDW+KrmuZVOAawwvaztX4qCHVyQzPtJr
	 hj5QMw8zxfZajD+jTGKgOs7BP9shI6+d02cdZLRYefRwGoJKyBdfHKUzdPhEfj/QsN
	 nnvGMNK/50GDDFMxHHgBNsOBX4effA1fIpw6bfQ/EoxR6mZSB0jxOiO8HlhaqPK9CR
	 /AJLmztrUGGPA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso592463966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqY6oghjbeUCXJaAXVq9XjhQ00JTkxUyA1vgIeN6OB8CtbcsWoZ0r/BAa5bndIA882g1culDfuxlCEg/p0=@vger.kernel.org
X-Gm-Message-State: AFuF++n7wCYImi7m3sxKaTU+/0eLfoXNOKoBAcjUNrQj/pAKvZgF5I49
	Omrwzzm3l/Dzg0TDpf33gxFAHV5Z4nwUvoZV5ZE23LczYTbYkDHJyve33F1/bYEu8uMAwrzwQlw
	z5ySsZ++i1eqkDKYl9rXT9Tqi9iPDiVc=
X-Received: by 2002:a17:906:6898:b0:c24:469d:5653 with SMTP id
 a640c23a62f3a-c25b3d2dabdmr70154866b.21.1788189478343; Mon, 31 Aug 2026
 08:17:58 -0700 (PDT)
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
 <CAO9r8zP6+6jZ7qOxOy1fyd=UgR3yYP20Db9KghW1zJ3bNqoREg@mail.gmail.com> <CAJxJ_jh6J5N0vbFfi2139vnTVZEECJoq-AV4VVNew6a0Bkwk_w@mail.gmail.com>
In-Reply-To: <CAJxJ_jh6J5N0vbFfi2139vnTVZEECJoq-AV4VVNew6a0Bkwk_w@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 31 Aug 2026 08:17:46 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMr4bnWHzO97R5ZaxALDf_5688DXv_LS3KZ5rz2Noe_bQ@mail.gmail.com>
X-Gm-Features: AcwNN1V5kf7rBHXxF6P0OwPPKGwOwsL_c1dhEnoPllpp4bh-Yhr3iIv6RTFovz8
Message-ID: <CAO9r8zMr4bnWHzO97R5ZaxALDf_5688DXv_LS3KZ5rz2Noe_bQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 5:10=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> On Thu, Aug 27, 2026 at 12:56 AM Yosry Ahmed <yosry@kernel.org> wrote:
> >
> > Makes sense.
> >
> > Actually, this led me to rethink the slots reservation mechanism we
> > came up with and the issue that Sashiko brought up initially. I
> > initially thought it still existed, as two racing threads setting the
> > compressor could try to resurrect a newly created pool. However, I
> > realized that's not possible because a module-wide mutex is held while
> > any module param is set. This also covers zswap_enabled_param_set().
> >
> > So IIUC, we cannot really have any concurrency here. Pool creation
> > either happens through params setting (protected by a module-wide
> > mutex) or during initialization. Does this mean that Sashiko's review
> > was a false positive and we can go back to directly assigning array
> > slots at pool creation? If that's the case I am happy we can avoid the
> > complexity (but sorry I led you astray).
>
> Thanks for the patience here. I wanted to check the details before replyi=
ng.
>
> Agreed, and I confirmed it. param_attr_store() takes
> kernel_param_lock(mk->mod) around ->set, and for a built-in module
> (zswap) that resolves to the single global param_lock
> (KPARAM_MUTEX(mod) -> &param_lock, "Protects all built-in parameters"
> in kernel/params.c). So zswap_compressor_param_set() and
> zswap_enabled_param_set() are mutually serialized, and the only other
> pool-creation path is single-threaded init. There is no window for two
> threads to resurrect or create the same pool concurrently. Sashiko's
> concern was a false positive.
>
> I also tried dropping the slot reserve and went back to assigning
> the real pointer directly at creation. The only invariant that matters
> is that the slot store happens after the pool is fully constructed,
> it's the last step of zswap_pool_create(). So array walkers only ever
> see a NULL slot or a ready pool. zswap_pools_lock
> still serializes that store against a retiring pool clearing its slot
> in __zswap_pool_empty().
>
> I tested with LOCKDEP + PROVE_RCU + DEBUG_ATOMIC_SLEEP: an e2e
> store/load workload + compressor switch (lzo -> zstd -> lzo) that
> exercises both the pool-retire and the pool-reuse/resurrect paths. All
> passed, no lockdep splats and no suspicious-RCU or sleeping-in-atomic
> warnings. These are functional tests only, 2 writer races can't be trigge=
red,
> since param_lock already serializes concurrent param writes.
>
> No problem, the discussion made the concurrency model clearer, and we
> can drop the complexity. I'll refactor the code and send out the patch
> in the next version.
>
> > It also makes me wonder if we can just drop zswap_init_lock, but
> > that's a separate project. Most of the zswap init code needs to be
> > reworked imo.
>
> Agreed it's separate. zswap_init_lock guards the zswap_init_state
> machine and coordinates the two zswap_setup() entry points (the
> late_initcall vs. zswap_enabled_param_set()); the param lock doesn't
> cover the initcall path, so it can't just be dropped. I'll leave that
> out of this series.

Agreed on leaving it out anyway, but doesn't zswap_init_lock guard the
same paths we just convinced ourselves are already mutually exclusive
for the purposes of pool reservation?
