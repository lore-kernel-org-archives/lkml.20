Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3431E852
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582953; cv=none; b=fRMtfYJiWuaMbtZ9wdhe/GHu0NnvH1fgUvlNE12TLQVoy1Lcsf3ljFfTJECcHOyML+iyDxJdFn1dovTdE39cgbTuCZ7kMhT5fXNuWbTWk+WxAupvo7D4mD+ndXif18vaYdr42t7M9L825xh8QT1c1Zfw3XHuhBxIgKMG/OH+51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582953; c=relaxed/simple;
	bh=CJl4/tYnVCG1tSYm7J1eyOURkKkuYqP71o2CB21fRdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=D5XqtugZWoMCHolGSYWWcLHaaOLAmgqEKA1xadOPfHw/xseN8OsVZeNhobbb4RkQf8ajzIShvPgxFFL9tOKSW5tlltpPoX8w0LltnXz2PwiYMu4n12ARycgAzcQKcwzAX1kK1uHXry1asohP2Eu6GRtWaTmBQFko3gQgq4x/MmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWHKl+Z9; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWHKl+Z9"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b46dc430fso101485e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582945; x=1790187745; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJl4/tYnVCG1tSYm7J1eyOURkKkuYqP71o2CB21fRdE=;
        b=IWHKl+Z9SX2abO8AIMFjVHw8JPzh6Ucqll+Y2M4UHmBe+Gm43m5lvHqjBdgUUJMd8T
         8nW+/bUGaBstzb6+4IaimSBERBu7EQIUH9jeRD+39KLk3WyLtdfJknusLiDRlJt43hVA
         ZRFzHuuAFKKUK9ZZnycaX6wIacokcVjuIBgHNGihECXjWgMjBgIAJ2x/ndHT2vXiRZGt
         vyuoJaJvjETVer7XWG5MzW6xrHqSBGpq8zXTZKlEc209qB/CLNFHPnO8PjLP3/KQlRdd
         bM1zMejRubhBtOfyhoHeBadqvCW4dQz75lIhL7zkr7MPKdrR7oLjami235ghbSYOKSK3
         WIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582945; x=1790187745;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CJl4/tYnVCG1tSYm7J1eyOURkKkuYqP71o2CB21fRdE=;
        b=R1HlrdD+FK13WFOgUusWhqPhs+qGVE6B8GuRvSr5FU0cstf6Qgv52eTa1Ko68GSuIw
         spGCv6jV1fau+kcuqD6xA0TDb/ED3F4/Nwba9aPjymGgUulwl/9wogLb0rLTmrK29b7I
         KLFW54mvToerU1AqVdAhJqbG04teYW3tMuKLQVTBeHGfttriinaDpcnpjYs8m5QfsU5g
         NLKMRoP/xltmQEv21VCn0gJQgL6nxkqZkd4GRnfOfB0xxM6Qmpz7nBTFeSaUdvqJ8X2V
         Z7AAwD6zQQN+eQQz6bZW3FBYHLcDMnegsWWybUdyQNnmBopA4HwUPK5tCx6U75Mvbbxu
         QrBQ==
X-Forwarded-Encrypted: i=1; AKwUvByD9XRbZpEskanv9q7BfDfwPft0pMvCEWyLI4/8FD0/mtaTb+MlcRscKl5iaIA+7gIgXJOWa+uk5mHTR70=@vger.kernel.org
X-Gm-Message-State: AFuF++mJEV86QyWeb6UyEFecYJ9Xw0gIKI5/kadtTBkkGmg1plgI6Zbx
	zD0Iwsy/FngrtTJMaKiW0X2nbk3dXdM4GymxKFD4csXSPAYjG+2xTN9q
X-Gm-Gg: AYBFou1+mvwrlclTy0R6Z8cRMYvqDFPZU/zPL6J1oyOmVdHDpWlwwgjrSwg+M38k47H
	RuLW5WiZvYygje7ab/ch/eZtAPzjUuagZY2tBxDGFSs5MaeK7TsBBT89k/xdppSEofMCD2R6KCq
	3kw+QZgtWY1lraX56/QJLiRpcPrM19RDeCOxPUHh9X9VsfYWl3TzMfmdLJCGELbb/v4GNnsZJY+
	BZZReJ6jfdr3NvMEOWgh0hVYSUstEds3EiJ5FsYY/NfX7SAbdHdGUvOCE7ZnhhEjSBHNFKtqguo
	GfFMJSFCSYzIa3rMKOq7lh/66+sQjWA4gk9ja0n9QXcyRGWToRXeBQZmND0PMNmr/+KCASFjqLc
	UccemTu/yB6wXGIfzegwSNgeR4CvLU2IRl/drSK7oXubsIrni/3T92+Y+RuM4pZVu8hZbe/o45D
	Sm2wnI9pI5wreNEgKBpEJj8gNbZ9agynZGRtjZN/KikY9kfXPuGi1iRPEc1X3kCwmomtYD0pz10
	UoKhztw2sSNTQ5+x7ghSSJGDxuTxgv3C192VbndZiha/H4X23YPL2POjZoUDkO5JAbpRkQGD8dA
	EvH6DbijA6guwfkQd9wHtMNfmcF68pNLu4iGIQ==
X-Received: by 2002:a05:600c:630a:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49eb7325340mr43310555e9.17.1789582945148;
        Wed, 16 Sep 2026 11:22:25 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf3494dsm8424311f8f.28.2026.09.16.11.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 20:22:22 +0200
Message-Id: <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
Subject: Re: [PATCH] bpf: local_storage: avoid redundant IRQ save on bucket
 locks
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Usama Arif" <usama.arif@linux.dev>, <ast@kernel.org>,
 <andrii@kernel.org>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <eddyz87@gmail.com>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <jolsa@kernel.org>, <justinstitt@google.com>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <martin.lau@linux.dev>, <morbo@google.com>, <nathan@kernel.org>,
 <ndesaulniers@google.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <yatsenko@meta.com>, <kernel-team@meta.com>, "Amery Hung"
 <ameryhung@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260916181001.201787-1-usama.arif@linux.dev>
In-Reply-To: <20260916181001.201787-1-usama.arif@linux.dev>

+Cc Amery

On Wed Sep 16, 2026 at 8:10 PM CEST, Usama Arif wrote:
> bpf_local_storage_update() takes the map bucket lock while holding
> local_storage->lock. bpf_selem_unlink_map() does the same; its only
> caller holds local_storage->lock. The outer lock is acquired with
> raw_res_spin_lock_irqsave(), so interrupts are already disabled at both
> sites.
>
> Using raw_res_spin_lock_irqsave() for the nested lock saves the already
> disabled IRQ state and issues another IRQ disable. The matching unlock
> tests that saved state before leaving interrupts disabled. On x86-64,
> this adds a pushfq/popq/cli sequence and a test/branch around an
> unreachable sti to each acquisition.
>
> Use raw_res_spin_lock() and raw_res_spin_unlock() instead. They retain
> preemption nesting, memory ordering and resilient-lock bookkeeping. The
> outer unlock remains responsible for restoring the caller's IRQ state.
>
> In the tested clang x86-64 build, this removes five executed instructions
> from each uncontended nested acquisition. It also shrinks
> bpf_local_storage_update() from 1732 to 1702 bytes and bpf_selem_unlink()
> from 1030 to 992 bytes. The affected paths are updates that add or replac=
e
> an element in existing owner storage and successful unlinks.
>
> Document the owner-lock requirement of bpf_selem_unlink_map() and assert
> that interrupts are disabled.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---

Makes sense. But did you observe any measurable improvement with this chang=
e?

> [...]
