Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664E3C2774
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120199; cv=pass; b=fNBSAnRtFXbNkrm5QlG3B8UAGcERbV9TCT7s9KVwItgfTD8a1xUvD8Pp0dhdOvXQoS/tiivXEHwe34t9DYheQed51gf1baHgn0+fpTaB095pl4FCsM2gF3gaygE6tZX3986HcDYDerHFFf0PrHOJ1TkzNfwZ3qm2/tkFGY/3EXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120199; c=relaxed/simple;
	bh=w5BCY+Altqrl2z+KInkTE2HJzyoRga3lLbsK4NkbGZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAFUo8zrgo0bLxoHSE4bcp9BvI+0JEhcoxMy50KpTRXIXzFKxnTo3LAuba2kWyj+O8WxnzGGlYHDHCHE5gIrz50zJRlCPPZs8g4aLrDRL+brtdcDt0LA3gkP9pomb4kOHbuno7MAUUTj6sCW5HR4X1TUhWNYWNvWuOcs9/JoRDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e22eWa9u; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e22eWa9u"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso8819395e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789120195; cv=none;
        d=google.com; s=arc-20260327;
        b=exwrq1bGYTe7cmpU4ot203B8U8QYznVK5Y46P/sLvCfZUPuKo9kF4wHPUlasjEyZAU
         6wr07l5/rGS5NhA9oeZ71PBVOEhnbZZQk6MtataAsVRTzXYtWJcaXrqgw+FfcD763003
         Bne5kroKlzUjziAzmkuCRWQrnjyb+5+pqNYgG9K2KJZ4WnJMyfwfB9PCimsZkaf1ISoU
         saoYlBDAnBAo3Q1/30cnqaEeJbf4MYGA8cOzpeiuLDul1gw+ur8jLEKKqujZ84VMqi1L
         EvZzVlEXgUd5zIbTN+7I+7Bhk0TNMMI0TT7z2oY3IeZtgdGRMctk9Lrox3sqFLnkx13J
         qEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XmO8P+ChMoFawAYjtFDVo7MOu50AybaSOeGB/ttRwB4=;
        fh=cAdBorLMZi0Z1gubn8w+++4sNB1KPPDKtpKDKeZu3wM=;
        b=Ziq83DAquqrj0L1fntuZXpY+8zXCM02E2hjW/CbFiT6curZ/jUBwasAzRY+++GmBE9
         dY8WJb+khaZLuxOtjwZLdikNbGIJSVuaxv6ZL6GBq9Tmb16U7hBHyVPhkRdYGd8o0BKE
         VdHRd+DB9eFaZHfNoi2cAJ2MVRVc7F80+c8mKwNE++rCl2nwKu+K63WiQeIB24VbdGH/
         ll0rxv20tfDqxf0Cae/0n/zC/FcCRtc+2k1rfqnt3PJfbyIY65OpKJZaZM2p1TmsJzci
         2kCTkyv8ogfpo32Xdz8BMxodljRL13fkMuDj5WePGnqJ0/bpgKa0PwRX8DMVntkT/t3q
         YG6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789120195; x=1789724995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XmO8P+ChMoFawAYjtFDVo7MOu50AybaSOeGB/ttRwB4=;
        b=e22eWa9uGH97TD4ApTY8m6YFBTAuAXV38SC4Rr2Ckj+sfPMLr67MRyoG4qrk0CtcxT
         MzvtPe0RaNt9TcUK2RHkYuJaA4Q2GDOW3aDSi1Kh/Wh3wCe+it5kXoNbi/X6dXmGx5kN
         OY4H+UpTdMhF+hE0bGbjiIDIritAsqJjnFjqu7mS38k73v/IIBA2feauMjJFlGxk6ivk
         9jKVBthF1AquQjJdpqdocrRPPQC+F+pBjlFKaMoly9WMht8BjEueFFYtqSO3/2X1mXRA
         ulaOYSCHHwyevG0z25m8ZXeVHPY1/dYccXhd/Yov9rrxHGoaON9YScAo7jCftyl5DZJS
         PTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120195; x=1789724995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmO8P+ChMoFawAYjtFDVo7MOu50AybaSOeGB/ttRwB4=;
        b=XJxjLeWlo9rQJcdWKH9C58dIt5O0qvZLUFCOm6kh9D63nk40rmwNMC3gCDfnhNMbzD
         IgIrmxSZ8VrKfuZudSOdNtFtyOBJOwqro2ZdA5ri+vNTiyZP3wiZqlvZx23odnGSfA8g
         9GCD2ck4xVtGbpM5VnNeFcm9kegPD4zt7XAnWFuAlBNloVTXsoTxQdV0nrHSSpCyLu5x
         H42nk4utlWi1TYKj5VrZGv1ruAiy87DXfHUpRohCIVNjCrg4ZQED7Pw8vyRBFfuPW6OH
         RJy2BwD4FvFvSP2lS5+B0wwpol2eovXvnl+OB9DtT80ZrQwvy5q02Z1ihgm89/FLFt2a
         gVFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUODr+CsZ2OJoqNFy1vsKcvVrzWJA5d4wUHJLEbdDEYM/FrScstV53LSaN3oznYy88uxr7gykBlrZuQb4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXBXti1YsEHWpfCis73Jiubma8CalfD/wvbCm7GB035ZZcLF0O
	YgHbVf5xp3GM/nEXMnBO2bEDuarbJOFYsmnc0M4jiEKnMfglF8x/Hij8zWnk3PLoD0+46xLyjsQ
	Us4gEFoAa94Xwd1+RGuAfWjWfUiGFJjM=
X-Gm-Gg: AYBFou1CfDpAIc4x01VRooO2WMnTmEXxBHxyJRjn7GY3t2LJLgyonoiqR9Ht8J5URNr
	8XfhrEsZn9vJfUAkhyFTiwybVkn62FbB7C2gIM51fjBpoZ6HX8n/RrWtMUphOJQPEvj2QWU1DgI
	lw5Jjmj+Z94Os/XSO5EnQUGWuq/WjhQkmqC8irOiMZ9niNq1O/BNQqPvkYwGwesb3owMeEgwJwW
	MpCQMaevs2yLAQu7B+BXIjRMh01AA8AIxRfM3r9cgaDLalTalIablXyOSeGUd7v0RgmrOxQWjmE
	755DkvDSj/T/FS58RnjEi3ftv3rn2X39Ngc5xwHnox81OrM16I1owvxL3rDRI82KflozYhHlD+M
	frFYW53J7Y+RKBg==
X-Received: by 2002:a05:600c:a107:b0:49e:663c:c69f with SMTP id
 5b1f17b1804b1-49e663cc929mr20825795e9.15.1789120194398; Fri, 11 Sep 2026
 02:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907075829.2073224-1-kunwu.chan@linux.dev> <c201584b58aec856342e0f23f8df9f81baccba1d@linux.dev>
In-Reply-To: <c201584b58aec856342e0f23f8df9f81baccba1d@linux.dev>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 11 Sep 2026 17:49:43 +0800
X-Gm-Features: AcwNN1UxmSgtIai_95aeqnZoEeATzU6VAkoqwwuqt7M2NT-d2JkrVJBjQKj2o60
Message-ID: <CAN_Opa-cvXVJeMxniuarq+2mE9EepjzTCgii1bW6mmSnaCKKxQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] srcu: Round out atomic SRCU support
To: Zqiang <qiang.zhang@linux.dev>
Cc: paulmck@kernel.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org, jiangshanlai@gmail.com, 
	josh@joshtriplett.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 8:16=E2=80=AFPM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> >
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > This series rounds out atomic SRCU support with a reader-free fastpath,
> > some atomic-context fixes, and additional test coverage.
> >
> > The core change is a reader-free fastpath for synchronize_srcu_atomic()=
.
> > Atomic SRCU's read-side critical sections disable preemption, so when
> > the summed lock and unlock counts match for both ranks,
> > synchronize_srcu_atomic() can end the grace period immediately, without
> > the index flip or the srcu_advance_state() scans. Correctness depends
> > on the grace-period anchor written by srcu_gp_start() preceding the
> > lock-count scan; two LKMM litmus tests (patches 1-2) verify that
> > ordering.
>
> For synchronize_srcu_atomic(), the following items maybe also
> need to be added:

Hi Zqiang
Sent as: https://lore.kernel.org/rcu/20260911093515.2802551-1-kunwu.chan@gm=
ail.com/

Did a small late_initcall that enters an atomic read-side critical section =
and
calls synchronize_srcu_atomic().  srcu_lock_sync() catches it:
      WARNING: possible recursive locking detected
      swapper/0/1 is trying to acquire lock: (&ss) at:
synchronize_srcu_atomic+0x28/0x380
      but task is already holding lock:     (&ss) at:
srcu_lockdep_test_init+0xd0/0x170
      *** DEADLOCK ***
Rcutorture SRCU-N/P also pass.

Thanks, Kunwu

>
>         srcu_lock_sync(&ssp->dep_map);
>
>         RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
>                          "Illegal synchronize_srcu() in same-type SRCU re=
ad-side critical section");
>
>         if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
>                 return;
>
> Thanks
> Zqiang
>
>
>
> >
> > The series is:
> >
> >  1-2 LKMM litmus tests for the reader-free fastpath ordering.
> >  3 srcutree: add the reader-free fastpath.
> >  4 rcutorture: add --do-atomic-srcu to torture.sh.
> >  5-7 srcutree: honor and propagate is_atomic so atomic SRCU never
> >  transitions to big.
> >  8 srcutree: forbid srcu_expedite_current() on atomic SRCU.
> >  9 rcutorture: disable srcu_expedite_current() for atomic SRCU.
> >  10 srcutree: skip callback scheduling for atomic SRCU grace periods.
> >  11 srcutree: drop the srcu_barrier() sleep for atomic SRCU.
> >  12 srcutree: remove leftover debug pr_alert()s.
> >  13 srcu: restrict the non_block annotation to task context, fixing a
> >  KCSAN data race.
> >
> > The KCSAN race in patch 13 is a data race on the interrupted task's
> > ->non_block_count when a timer callback runs atomic-SRCU readers in
> > inline softirq context.
> >
> > Tested with herd7 7.58 (litmus tests), torture.sh --do-atomic-srcu, and
> > torture.sh --do-atomic-srcu --do-kcsan (KCSAN+PROVE_LOCKING).
> >
> > Kunwu Chan (13):
> >  litmus: Add SRCU fastpath anchor-before-scan test
> >  litmus: Add SRCU fastpath scan-before-anchor test
> >  srcutree: Add reader-free fastpath to synchronize_srcu_atomic()
> >  rcutorture: Add atomic-SRCU support to torture.sh
> >  srcutree: Honor is_atomic in check_init_srcu_struct()
> >  srcutree: Make init_srcu_struct_atomic() prevent transition to big
> >  srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
> >  srcutree: Forbid srcu_expedite_current() on atomic SRCU
> >  rcutorture: Disable srcu_expedite_current() for atomic SRCU
> >  srcutree: Skip callback scheduling for atomic SRCU grace periods
> >  srcutree: Remove srcu_barrier() sleep for atomic SRCU
> >  srcutree: Remove debug pr_alert()s
> >  srcu: Restrict atomic-SRCU non_block annotation to task context
> >
> >  include/linux/srcu.h | 10 +-
> >  kernel/rcu/rcutorture.c | 1 +
> >  kernel/rcu/srcutree.c | 95 ++++++++++++++-----
> >  tools/memory-model/litmus-tests/README | 16 ++++
> >  .../SRCU-fastpath-anchor-before-scan.litmus | 56 +++++++++++
> >  .../SRCU-fastpath-scan-before-anchor.litmus | 53 +++++++++++
> >  .../selftests/rcutorture/bin/torture.sh | 24 +++++
> >  7 files changed, 229 insertions(+), 26 deletions(-)
> >  create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-ancho=
r-before-scan.litmus
> >  create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-scan-=
before-anchor.litmus
> >
> > base-commit: ef15070f96c5f07de3a9b593c36f6e83bc9e3d58
> > --
> > 2.43.0
> >
