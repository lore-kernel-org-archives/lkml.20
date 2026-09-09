Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46D59E350
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989413; cv=none; b=GdfzEsvFF1lF5aq84xdLFSSqYqrVbUgQc4fBBWgCqzqjDXb1xp9AL5jwQ2PXqtTf6WksgHmr6HGbNbrdnbSjDVR3aK2coQJEJntc3rsn9uLWpv1EE8nEcUg/aKE/+YO4JZyGVTb0Sa0C6fHwLlNFFfz95EjQr+6+awyU5nvNRkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989413; c=relaxed/simple;
	bh=2vFJvFhVQf95rclrh/WjIBHrrLw8Bpkz7meqtqnIDAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJNnZkCcIYNnpc2S4y9MPukBltibVNYJffm1Pa12ryL3jNG4FQV3BVvaXzv4AwqRn2O8bKGPXv342oEggbPUURg5gk8DPmljCpHfn+jqyrdkWHXsAJzIChOQoffBXGzkmCuB2AuyjZlYZQ5DBePfLeRCaYCz6D3lsTqbAN9iz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTt5UzoD; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTt5UzoD"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c8386a01b0so159301e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989399; x=1789594199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an1Tj5cri+dCWS5ANKI36kXHxQ7EkrCefVmdgblz/to=;
        b=mTt5UzoDKt1pbWNJYVbp1ZiWCGftLRL5g39t6C08n8TkOyAu7RUihT1fbVy/C8Ii7L
         awN1k3PgUeu/tkYGe0OwFX6511aLeNPm2PTAezhcbczUubtmQ/n9h+PtRsshr8PX0b2P
         YYVfpI6QnXZKTxf3B+D38+L0fg5LhftB0OXCcowqhWM5TeMwV8dot8cgnXYDJYnimmFd
         EGCxqZuqGA/8CRz+tD7Rot+gMltLr/Edh5VKUzF/8hYzHEBuu47JEC0IiVqhVkieqsii
         mIVBMzpMln+0kDqF/9kLcfDvq8RivNYOSe56dlNvxesFXgQVzTy1fpWLsEF51Ggrkods
         bpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989399; x=1789594199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an1Tj5cri+dCWS5ANKI36kXHxQ7EkrCefVmdgblz/to=;
        b=GERSIAG2fmUsA4x95mMZi4li1QuIPh0XpoxznFyPGsQWkSe1xfOXrkdveS0WcjvvG9
         T0NADHsTQZS/8gGpu7Oj42PADioxOD7FTf8kbXZ8+ZvKLsKpU/S5ipRGx8bFkssooVbv
         Ez1VamdWpDr44W7HxsJycD/qH4ddIiEPHwGFCnCztMAaw1n/fM4kQEdlMVl+HJ2zkBSq
         Hg7igkMiTP6xIWkrMawPrEtoG7pnVOv5mB7neEukvsovyRp8VNt+RSanrHie1QJ7kGug
         wMqHvQJ7Nz/aZ2Zf/knzuBral0smVHKzalh5ZYCAvxHC6nJqWPYLnyWmojl4clQ7G2iF
         6BfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn+nuK1C3moaFxS7HCgn7GHHM9YtH50F3En8IIT7fotymi9bQ61r/Cq3GE/dfQKRpy6NGEokOQF9UV8E0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRzWMgt386/O9NHnmwVeK+paDSG7xILbb1/QFRpf4AdqCQrzMJ
	QKghHERgZO7NqJQYtOSzHZjqGG+wGZo05lMfxZs9JS6sYLXzfBuLyR5/
X-Gm-Gg: AYBFou3LVNLcI25XzcCqDYrcDNZw3OdeLRYAWSTQwKKmuxtpaIGOY65iD3BSNSWzVz2
	T1YeSWI18ReImxHduUc76G8ATngVM95dfMnfKrfm056W73z2jqAacKpirS0FemghbPMjCjuMwYS
	9WMUHzFleQuNGvOE2MV7GIHsbHgXZmkoHWajVWnrHiL6F4GBD6WHLx3KopLK9dJJaJE7HAV+Uah
	vzLM0Vqa/zLhGgquZJtD2eh/ha9nl5cXHhzqH1MHzNeSeBT+V5SsILbzu/nI2cs03kmRXuXM/md
	wmEBpZmYVBznDqFtrImCPGKP2KT3wTXDzI2B4faJbuDZ2Fs6vs8TKB+S/eV+hUFBfy+9l5s9Vt1
	+OvqpytmMWjjFD4NCC6kND1arteu3oo5k01e+PlDDdyCly1bsriC8JlWYLYYcMMQolS7Nc4wUSq
	HBzhaPElJefTFTTnWg/4nPXoZf+3nOHDN0pEuxeJCo1e/fjOSCBxNVLFu0KKgAATERYVu45ys69
	8KNtUjwID9tINvx7P0Jeoye9YusiJ6HELNj3/netkk0UBTqz2Awrg==
X-Received: by 2002:a05:6122:f18:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c7ed298f6bmr21767535e0c.2.1788989398659;
        Wed, 09 Sep 2026 14:29:58 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm13861007e0c.12.2026.09.09.14.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:29:58 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org,
	willy@infradead.org
Subject: Re: [PATCH] mm: bypass datarace check
Date: Wed,  9 Sep 2026 18:29:43 -0300
Message-ID: <20260909212943.539665-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aqFWqqvUEiie8cYq@gremlin>
References: <aqFWqqvUEiie8cYq@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> I started review below but honestly this patch is confused in multiple ways
> and it's not entirely clear you really understand what's going on here.
I can be wrong, but was understand that due the order that the code was write
probably the data race problem will not happen.

The reader (__vmf_anon_prepare()):
```
if (likely(vma->anon_vma)) // lockless check
	return 0;              // OK

// if the check above fail

if (!__anon_vma_prepare(vma)) // called the __anon_vma_prepare
    return 0;

```

inside __anon_vma_prepare()
```
spin_lock(&mm->page_table_lock); //ACQUIRE semantics

if (likely(!vma->anon_vma)) // re-check under lock
    // ... alloc all

spin_unlock(&mm->page_table_lock);
```

This is safe because, if `if (likely(vma->anon_vma))` return NULL, we will got
the mmap_lock and then page_table_lock.

The critical re-check inside __anon_vma_prepare() happens under spin_lock(...)
with has ACQUIRE semantics.
With ACQUIRE semantics , the cpu (or compiler, I don't know) cannot reorder the
memory access acress the lock boundary.

I'm right?

> 
> It's also basically implementing what we suggested.
> 
> So at this point I think it's easier if I send the patch with a:
> 
> Reported-by:
> Closes:
> 
> tag -> you, this patch.
> 
> Thanks!
ok, no problem

> On Wed, Sep 09, 2026 at 08:57:23AM -0300, Guilherme Giacomo Simoes wrote:
> > Despiste kcsan point to a possible race condition problem, this is a
> 
> Typos  -> Despite, point -> points
Hmm, is not the first time that any person points my english mistakes... I will
improve this point, thank you for yout jints

> > safe race condition due the access memory ordering, since
> > spin_lock(&mm->page_table_lock) have ACQUIRE semantics and ensure the
> > ordering mapping.
> 
> This sentence is a bit confused. Acquire semantics mean absolutely nothing
> unless paired with another operation and etc. etc.
missing full stop, my bad.

> Needs a:
> 
> Suggested-by: Pedro Falcato <pfalcato@suse.de>
Yeah, I forget

> 
> Also:
> 
> Assisted-by: LLM?
> The list below reads very LLM-ish so I have to ask did you use one etc. etc.
> 
> https://docs.kernel.org/process/coding-assistants.html
> 
> Perhaps given I am suggesting a lot here a:
I don't have installed any llm (not even cursor), I just use a deepseek,
chatgpt, etc.. to clear up a few questions. (maybe I should start use this to
help me with english too)

> There are other places where this check is done and etc.
I would should checked this, sorry. Anxiety.

Thanks Lorenzo for your review, help and patience 
