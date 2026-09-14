Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA552331EC7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373319; cv=pass; b=b0JRxmYFzEq+0uEW+1YodmZ63jNZFQLdKMyTUGyfmhA3ugq2O0ctATYAi8ovLA5GcFWyPaS7DmD8yNL+q/G+jzkl7dp4PNHUK01uPaNi6lzg5uqhStnmnaEqAE7XjzrO0K9EL5qAnxonGOHLjJYMBbIMmmdu0CxFLs3NmjHZ8Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373319; c=relaxed/simple;
	bh=DUAXh/D37ePrGStHIvqH/FD63oPvTaNzwYIYhmyhXtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZb+0YLyIP5P251wLFg8rH56yujEiZZCARpBQ1HOBeMEszuid4zetr4iwbMvqbwcMAsv5nSzXW57Sl0JhTE17ndjCZiRgbaFlwE+4LN+n/cjOSfGYzVwEtf+pzbkme72gxE0pynp0tWd0ic04pLn4MjmKVuOthOJ3XCqyxP3p68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg3hzoOk; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg3hzoOk"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20bdfe60so205757d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373317; cv=none;
        d=google.com; s=arc-20260327;
        b=njynarYJAF3itgl3Ft5zkx/dStVerZjvogdWHEIIGypCAxvq3G5w8hxkHeEwLYCCea
         jCudOLtuSY874354rdUSSWOgF9xzrcxRAgYuZJYkvp5tQra1Hx/g5gbbCmPApRCh5/2I
         wXENJEQudQicaTx6YavP0XktSTSZlhVhDK8WoFQz7IEMvOZ8p1BNhEng+2h9HtwKx1KP
         zsbxDfgc9umowqp/pn8J8SOqOwI5A7/8m4tzZJR7NdItBER0mm2xpzwtGv9acCdwola9
         KFiPYAF7R7Phc84Q64ucvmfYMvTMRrv9hmw5gmwWUe+WTDiujbfN7gYTHn6DrjcREGxq
         LIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ID6c9sfqkpTqIRSRF0HKDo0hSdWLeIijg8HL/+8GapQ=;
        fh=FNqh637a8obn2nD/DEN9IRs0fg/0dhgV45mSQfQmgmY=;
        b=TYfjQnjGtx3z9HDOu4oapI2U9j3pSbqDBcKn6rSpvDm5mhnaUGMK3jvB+SfWRbdajk
         ei83j3Q0nFrkGs4fWn/MMccST+uRpcVE2UC+FtHjMFrxDxezFSHaaqt29XjVG8GednMt
         14HVc4VqXKbfgE6G2l/WG/G/hlfHU17FmtxGL7dpf2T2ZkgsrZiotDbdc1FVfjAdGsAb
         Rx7KHed1g6B1vn1BqLFMrCGmIu4kYyjzqLuFTCRF7k2aoiqk/WocpXM451UudD8W8fXt
         YCXE0pdBJGi3+HDcvbX9W03Ycc2IV10Qiu/5wHyTrhA4ABoqAYK02mk5mafrNWedILkn
         mkYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373317; x=1789978117; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID6c9sfqkpTqIRSRF0HKDo0hSdWLeIijg8HL/+8GapQ=;
        b=eg3hzoOkTh4UfTGwsal+c7V22RGeVMDywxhLIxmDQAEQ3b1sgm51qjv/x4oJacm/w3
         kSDowTXKvWOqLtVy5hE6TWhRCryf8U8J6q3DniUBqZnO/S9K2QtQvPWZ0CJ9jhCf0Tst
         Gl7z1JeEv3F4WlBsFGkVa5G8t6FrTiyoWvGVIksMn+w6HULYpMpTaRB4PVWOEvziQwD+
         hXvI1tXGpuxAbw/jlxGgCjVKwmgNwDCh15YHzohb009/UKV7O/dkL+Ma3Fc5kd5ggl8x
         8K6hhHCsGcNsFLChVV1KLp/XJsY1RJqvytYxg/sX9IkuDeQBYFizNrznmWeXyRX0IiaG
         8iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373317; x=1789978117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ID6c9sfqkpTqIRSRF0HKDo0hSdWLeIijg8HL/+8GapQ=;
        b=Wdk5G2MoGevRnWbl0V8OT+O2Y13qpty1KvyNBd50i7RjLMIxiD0dfdNjAShnGVvbF+
         1YZtWuT7WkN3F8bzZNIrBRwhTJa1JsFAxVyq32dL6jlZQuR+awydsZE4nvsuwiLbh66f
         2rVOM9xddphZ23QooyNswfI2MBx6+NooaVkX/kEN8d1eNgTmIGDo563Gr4BxmX2kCO6x
         GQPvWGntUEIyLViCenZbDKQ2iCH5TADKAM5gg0q9sX6xnMsoDOlDbR76bkKboSjRXtMP
         Si/USMHi5V/ZiepMINyqlJGrrVputpRBI+RzYMWx96/HV/e79IIc1Tw9JN1meTQ5PBso
         LmZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFDiyxpLKDePPb87nLOjDMYArpLXS/L3j231iEIMO7twoa0g50bHyoUBzOpeJuv0tAVV7xhngu1Wf9HYY=@vger.kernel.org
X-Gm-Message-State: AFuF++m3G1fVIIGhv9XKzGTUPkHHiAAAKlLHrpcrrVAnVUiZGZwkESAl
	svBmnp6QNNfBBGVB+KLSu9V4sbLaTAPhJw5l4aIneezVdHwJCfYS9rb2JJVPQTREVQUf7k22Tw7
	kzOwcFdxWeqr45DunCCwNwdw6e5exIx0=
X-Gm-Gg: AYBFou258BMT3oEPKZoo9v/JiMT+ETpLYgIfGgeFVXug4Q/5wIVI98aj3tkWkVT8nHG
	hQOmTRfspTtK9FOBnDPDLsQSIkKXx46PIXekvx92AJ+tllHqHJ/QiC45e7T8yHdRXHPGGk0IOdH
	u/l9EAWNlbNgxojLfH2Iu7Famp1vXhkFjNXnkzQ0p+wmwnTj2rrpvDjpr6V3/q/S5G8RE4yaYt+
	xT86PKPirNH91clAFlRl4nUgy6DqARj6OSzGIfXfsr0XtNKlbDUT9LHVmix9hGCFhi+y5EgA+oU
	t8MgSkclYBBvm3luNcHdLR2s/crmHUYZ7/ZRBWXLccofw7Gzn8Y+IMHx
X-Received: by 2002:a05:690c:630e:b0:870:48aa:473e with SMTP id
 00721157ae682-88d19058869mr5623377b3.0.1789373312213; Mon, 14 Sep 2026
 01:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com> <20260910190139.BF6231F000FF@smtp.kernel.org>
In-Reply-To: <20260910190139.BF6231F000FF@smtp.kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 11:08:20 +0300
X-Gm-Features: AcwNN1XT_uCY5gQVeYwBYOZOBIgOpq3-Jnpwf4sQfFYZU8aFfdkLrzHjDiS4GQQ
Message-ID: <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
To: sashiko-reviews@lists.linux.dev
Cc: mwalle@kernel.org, pratyush@kernel.org, linux-kernel@vger.kernel.org, 
	takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, 
	miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. Taking the three points in turn: the first is
unreachable, but checking it turned up a real bug next to it that this
series has to fix first; the second cannot arise on the path this patch
serves; and the third is correct and is already stated in the commit
message.

> [Severity: High]
> This is a pre-existing issue, but does spi_nor_prep_and_lock() leak device
> preparation resources if interrupted by a fatal signal?
>
> If a process is killed while waiting on wait_event_killable() inside
> spi_nor_prep_and_lock(), it returns -ERESTARTSYS but fails to invoke
> spi_nor_unprep() to roll back the earlier spi_nor_prep() call.

The asymmetry in the code is real, but the leak is not: the two halves
are mutually exclusive, so there is never anything to roll back.

spi_nor_prep() only does something when the flash has controller_ops:

        static int spi_nor_prep(struct spi_nor *nor)
        {
                int ret = 0;

                if (nor->controller_ops && nor->controller_ops->prepare)
                        ret = nor->controller_ops->prepare(nor);

                return ret;
        }

and the wait_event_killable() is reached only on the parallel-locking
branch, i.e. only when SNOR_F_RWW is set. That flag is set in
spi_nor_late_init_params() (core.c:2981):

        if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
            !nor->controller_ops)
                nor->flags |= SNOR_F_RWW;

Note the !nor->controller_ops. A flash that can reach the killable wait
by definition has no controller_ops, so spi_nor_prep() was a no-op and
spi_nor_unprep() would be one too. RWW and controller_ops cannot coexist.

> Does this
> also apply to the other locking helpers like spi_nor_prep_and_lock_pe() and
> spi_nor_prep_and_lock_rd()?

Those two have the same shape and so the same answer: same
spi_nor_prep(), same wait_event_killable() on the same SNOR_F_RWW
branch, so there is nothing to unprep there either.

One correction as well: on that branch spi_nor_prep_and_lock() does not
take nor->lock at all, so the error return cannot deadlock the mutex in
the way described.

That said, the neighbouring code is not fine, and I would not have
looked without this comment.

spi_nor_rww_start_exclusive() returns with nor->lock held, on both
paths:

        static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
        {
                struct spi_nor_rww *rww = &nor->rww;

                mutex_lock(&nor->lock);

                if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
                        return false;
                ...
                return true;
        }

It is the only one of the ten spi_nor_rww_{start,end}_* helpers that
still uses a bare mutex_lock(); the other nine all use
guard(mutex)(&nor->lock). Commit 03e7bb864d9a ("mtd: spi-nor: use
scope-based mutex cleanup helpers") replaced its "goto busy" with a
plain "return false" and deleted the busy: label that did the
mutex_unlock(), but did not add the guard() that the others got. Before
that commit the function always released the lock.

So on an RWW flash:

 - if the flash is idle, it returns true with nor->lock held, and the
   matching spi_nor_unlock_and_unprep() calls
   spi_nor_rww_end_exclusive(), which does guard(mutex)(&nor->lock) and
   self-deadlocks on a non-recursive mutex;

 - if it is busy, it returns false with nor->lock held and
   wait_event_killable() then sleeps holding it, so nothing can ever
   clear ongoing_*.

That has been the case since v6.15. Nothing hits it today: the only
flash with SPI_NOR_RWW is the MX25UW51245G, which has neither OTP nor
locking ops, so none of the existing spi_nor_prep_and_lock() callers in
otp.c, swp.c and sst.c apply to it. That is exactly what this patch
changes - spi_nor_shutdown() did not take the flash lock before, so an
RWW part never reached the exclusive path, and with my patch every
reboot would. v2 therefore leads with the guard(mutex) fix as patch 1/3
rather than building on top of it.

> [Severity: High]
> If a fatal signal is pending during the reboot process, such as from the OOM
> killer or a manual SIGKILL, wait_event_killable() in spi_nor_prep_and_lock()
> will immediately return -ERESTARTSYS.
>
> Will this early return skip the spi_nor_restore() hardware state reset?

Only on an RWW flash, for the same reason as above: the non-parallel
branch uses mutex_lock(), which is uninterruptible and cannot fail, and
spi_nor_prep() cannot fail on the spi-mem path because controller_ops is
NULL there. So on everything else spi_nor_prep_and_lock() returns 0.

Where it can happen, skipping the restore is exactly what the code does
today when the restore fails, and spi_nor_restore() is best-effort by
design - it ignores the error from spi_nor_set_4byte_addr_mode() and
only logs it, "in the hope that the flash will default to the 3-byte
address mode after the software reset". The patch does not make that
outcome more likely; the unlocked restore it replaces reports success
while leaving the flash in 4-byte mode, which is the failure being
fixed.

> [Severity: Critical]
> This is a pre-existing issue, but could releasing the lock while the MTD
> device remains active expose the flash's modified 3-byte addressing state
> to concurrent operations?

Yes, and this is the right thing to have flagged. It is in the commit
message:

        This narrows the race without closing it. The restore still runs
        while MTD users are attached, so an operation that starts after
        it has completed will address a chip that is now in 3-byte mode
        while nor->addr_nbytes is still 4. Closing that as well would
        mean having MTD stop accepting operations before ->shutdown
        runs, which is a larger change; serialising against the
        operations already in flight is what keeps the restore itself
        from being issued into a busy chip.

The mechanism as described is right: a page program issued in that state
sends four address bytes to a chip expecting three, so the fourth is
consumed as the first data byte and the write lands shifted.

It is not introduced here, and it cannot be fixed here. The window
exists because ->shutdown runs with userspace still running and MTD
still accepting operations; the only real fix is at the MTD layer, and
it is a separate discussion I am happy to have. What this patch removes
is the strictly worse case where the restore is issued into a flash that
is mid-erase and silently discards it.

Thanks,
Itai
