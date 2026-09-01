Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651037F327
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263338; cv=none; b=ewhIW8fECxrV5F3spNBZWw1NZqqlPh3ly8kWe+fMCY2xsGAyrSmJvWEAV3/JieMUB65F+QUR3rAnPXT7zKGdW6C6XgJexkduK7jvbj0xS0bg9rBrcu3e1/cmXoVME6cykPlWpEQcDtRGyEIHua5+6AkWAFL9xSFJDir8GWnu+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263338; c=relaxed/simple;
	bh=rLGOVYctI7AxvKEFeAQPQyeezxQu/lDD/Oj03A02oK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcgHdgFRAAHkQRsM5jTic54NBMbzau7H5XN7KkY+pR0SbEWmk0SLpk1pLdOTRzzGSXJJGI9Lk8IcTgt7oY/hnO2poD7PzjH5EvEw/MXqaXnu8Cd6gTKhyqt7Oj3eeJy1aqatIHtHmEOWzK3DVXKKidjd899blgGa31nwFllrfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHa30YJJ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHa30YJJ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-861a2ae9c51so6223467b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788263336; x=1788868136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejUSHiFxX4WgJYi/9Qrca3qXd7EjxgH/hPKoCC8GwYg=;
        b=oHa30YJJ2+WJNpKMXOz5SEpU52SWyEa5IOqYBTJQIrichXzvUcfUlmNRhEcfhcuC7y
         Oaje9lARI/cc0L3YDkzmTDa6oIB0TCNyIgKgKedNIxRLlBPYBOO8CAcfkokmzx5DbpOV
         LJ2V6glsupUXyQ///A7tsTMmOsTd2v/g1FGnoYK8beiFfD0FT8D+adHMISz4aYJg+Fpj
         7CKaAroUbP2wsavvQYpxBzvArGt1qHzZ6f76BspcWgyMhWUEEpC/cvkwCh1cTsZf4oPv
         gPkzenA1NH++1G0yvKb4YejTAdUFabQuDgEZldC5UgSShFVA50cqrf+Wr4vJj/KD8OIo
         SQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263336; x=1788868136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejUSHiFxX4WgJYi/9Qrca3qXd7EjxgH/hPKoCC8GwYg=;
        b=o09QlRCRhnJhrkH4bUqC2VotKXEpg8AWpBadXLreADoj4zBhwJFirDWWs0QnzJaXe7
         rzcAdwXuVKmquzPfVmo2x4ITgdA2qWshMRl1dHLyxZyCDz1SM9sA8qIakr/L98S4iWr8
         SX4Cu0S9IySKafLmSOapSYBUlKcRPGGD/MdhQkbqWzgP1LTu5TC7kUDJXftyjgcOULBu
         qYb1jkHf8ZvldSWqJ8YmIlqlFVHoL1sdbTMhazyAbRVHS4TEn7t5CUfkAGvTMKwHaj4U
         MDskpQcRirsFmlf4FetPoC7ZcyL14b91mjkU5cseZ1r6nUAm7JRg+Hh+LaUbXTrneFjZ
         FJLA==
X-Forwarded-Encrypted: i=1; AKwUvBxB0Pz2DsAHIj02XyxyOYO8O5GNwYEIkKhLWZsbI7jEYBaPMm9zXoGVoXoMhZPfg2IM45NY6IsVpPAi1iU=@vger.kernel.org
X-Gm-Message-State: AFuF++nAhBDAUcVoGEAmm0YrlfFdD/P8oZAN0cIn/A/43ZrQUPuRfrBE
	RKXFCCcfDASce0/a9oFYSDnb0BMQe8ViPG8Nqp3Y8xZRWrFqnyQGzIVM
X-Gm-Gg: AYBFou14JzMhFw99ny9UGUqUzV+SPuHlSyYmQUwt2RHUEuhjj7fyrzXCDm/d0km3x0Z
	ek45jihhAgjHOUDY4MqqGx8Yc9x2RYXPQGzOcV7pOgzI+XGpHG77DwNf/X5HaEpYu1B6xd8pbq1
	HPikyP/6R/OC/fcBpxht8lQ/ATnLd6Iz0C0eZ+JH1Mywk03n7u9uU1PCuedsUIYDB43HuxZDUYZ
	72H+4xoWsjFJzb7wGDTIR0ua7vREf8sfLn1dVS48ytLUim2u6byU7b6TUrHAwfXGM2kyq4XeanP
	9eO/LMlKGFxjS4vcKrZEgA2wxBgpBF8eo7tgE4lTA2p/d9PHtn4hbz22YlN6RjYfoxrG75YJRBk
	/3LvNLGAjAbN1aUUJigC3y4gtQfkfdJkF9vhzacLPmlfxQWgd6aSISNJPXoGOxeDnWpa3gq8uav
	xkf8tlYd/bHOpbXCzLbShdnjj3yw/16MRnjZ3K77IL/KKZ8XhvE8eWTOk8/P2XibJ6yn7IUlfH0
	4k/gjho8ol7uiozYlh7EhHxrqmJ8IO9tBNqjRPVJpcA
X-Received: by 2002:a05:690c:6604:b0:80c:ebd4:762 with SMTP id 00721157ae682-85d65ee75fdmr133413267b3.7.1788263336196;
        Tue, 01 Sep 2026 04:48:56 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e679512easm71847747b3.48.2026.09.01.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:48:54 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: pfalcato@suse.de
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	surenb@google.com,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org,
	willy@infradead.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Date: Tue,  1 Sep 2026 08:48:42 -0300
Message-ID: <20260901114842.26532-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <apQxGMgLWWlfn3cd@pedro-suse.lan>
References: <apQxGMgLWWlfn3cd@pedro-suse.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, forgive the delay. I really needed spend a long time to understand your
explanation about why this race is safe.

Pedro Falcato <pfalcato@suse.de> wrote:
> > > So it's inappropriate to use READ_ONCE() / WRITE_ONCE() to "solve"
> > > this problem, because we don't need those semantics.  It's sufficient
> > > to wrap the read side in data_race() to indicate to KCSAN that we know
> > > what we're doing.
> > you sure? 
> > 
> > the __anon_vma_prepare(..) is write on vma->anon_vma and the
> > __vmf_anon_prepare(..) is reade from the same vma->anon_vma at the same time,
> > you sure that is not a problem? (I'm asking as a curious layperson.) 
> 
> 99.9% sure. Here's the basic logic laid out:
> 
> 1) Fault needs to fault in anonymous pages
> 2) Fault needs to possibly create an anon_vma
>  2a) Thus it does the lockless check, where indeed we only
>      care if it's non-null or not.
>  2b) if the lockless check fails, we get into __anon_vma_prepare()
>      logic, which crucially takes the page_table_lock to write the
>      anon_vma to the vma. If it takes the lock and something is already
>      there, it backs out.
> 3) Now, into the weeds of anon page faulting, we end up in __folio_set_anon(),
>    which reads the anon_vma from vma. This function always (AFAIK?) runs with
>    the PTE lock held. Thus we can be sure the anon_vma value is correct. In
>    any case, we only need to have held the page table lock once in the fault
>    for it to be valid; any change to its value from non-null to null needs
>    the vma/mmap write lock. Because we take a bunch of locks and do a bunch of
>    stuff between that initial check in __vmf_anon_prepare and this, the compiler
>    cannot validly cache the load (which can, in theory, tear).
> 
> Now, for memory ordering and its wonderful transitive properties:
> 1) writing anon_vma takes the page_table_lock. therefore if you acquire
>    page_table_lock, you obsreve the anon_vma store and all preceding stores
>    (due to spin_unlock providing RELEASE semantics, and spin_lock providing
>    ACQUIRE semantics)
> 2) say you install e.g a PUD entry, you take the page_table_lock. So you fully
>    observe the anon_vma that was installed (by doing an ACQUIRE on the lock).
>    you also issue a smp_wmb() which makes sure the ptdesc setup is visible.
> 3) others using that PUD entry will (should?) transitively observe everything
>    you have observed, data-dependent loads will help you there. If we _ever_
>    observe a page table without seeing an associated anon_vma, it's broken.
> 
> [Yes, I spent quite a bit of time thinking through this; it isn't trivial to prove
> that 2->3 transition is correct, but it looks vaguely _handwavely_ correct]

So, this race condition is safe just because the ordering (very briefly):

if `if (likely(vma->anon_vma))` is TRUE return 0 (OK)
if `if (likely(vma->anon_vma))` is fail __anon_vma_prepare() is called
6 lines below and inside __anon_vma_prepare() he try to get a lock
`spin_lock(&mm->page_table_lock);` that have ACQUIRE semantics and ensure the
ordering mapping...

if `if (likely(!vma->anon_vma))` (recheck the anon_vma like __vmf_anon_prepare)
fail then `spin_unlock(&mm->page_table_lock);` else alloc anon_mmap.
	
Thanks for spend time to explain this in detail for me Pedro.
