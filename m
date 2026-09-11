Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D33DEFFE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093909; cv=pass; b=b5OP8toPluffHI8VBRVqTcI1WrZts44ulGHX/sjVy962smRd171PSdZYdSb7a+Kt6T9s6I4L0Vh3bf5fURMM6z0qys5nUc2lQoF6dALRB/ORSS/kMPAAVBJlGmLhDw9YcUU2N9N0yYDWIN1d0k6ttXxdNmg9+6/WAB9cnXbb59w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093909; c=relaxed/simple;
	bh=Fv/alucK4B1I3/mTojghRn92nB3M29nhaTjKPeekFFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNcRpTLfUXZCi15NEfAN1rZFfFrNbXys6uTxiEhIL9hUMNO/+6cQLjyj9kFBb/OpTYIQvRHPpZ1OIwhbBK7gqHSRkEcz2ptO208nryn9fU+NhdKT35a7Azfd7ip3JnZTIMjhcLP+G47nHTPEJ/jFA0PSK4Vmxj7GWa0aicQuDk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Waj1gaAP; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Waj1gaAP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so2460025e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789093906; cv=none;
        d=google.com; s=arc-20260327;
        b=aKXiJHY1KH4r2/O1VyOLcdghkKpAC+t2+hwBupuooLrRoYUKAiXj0abO1qkcWto9aY
         /euYzvsh+3MliGEeXyWC77eCd+c6MQNLvHcS3/nSjGjDuTGkw2Y8hNbReYI63UrdXkd/
         +FDlccjE8IIfAd9HSq4UudcRrVtCi6zTtr/VG/AYP8zQW9kkYP2oiNCpamqgggT0y1w4
         at4T2WD49XVlkxUjT6CNbmLXOoonwCl+4GR7J26VqYYyeQvYfu0FcgbFtUkyasaYosJA
         u9n/RAC/GxOf/BkKlGX5wx/5YLFZIxXg0Ja3+lHRWvpoxcfSQ06lLdipCPDyU0xHDBZF
         cPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4z2PlAx+ooH1DQkWitjSiJSFWsoxu8y4GadNPU5V8DY=;
        fh=y5+jc1jKI2S/lyy4IcFBqku0TqcWYxPfMofT+cNmgWg=;
        b=YYW3siupPvb92Sj1eZlXkm0dBFpMJ1LVmLK/p1IhiOxitjMd3X0WPNVJKi6BxSgnqQ
         8Oo7IBMDt6ZxWdJuGL4UtkZVraLVkIEg1/S6jdbFILhriUnhZx5DM9ilIsgmikTP+Pa7
         qssXm2xX2rDETwzn/KI0tYcEm9JXebk3y2OFhQZ52Ni6OoPQNcaqEJaZXvTvYIwhust/
         n957SeXqaOCywBxz/CAniVyK0IZjYIANY1QV7tEZRgsoHu848ZeFgKtPdY/sxsj6lCW9
         1ucHl2vXG4/73cwDKMPTyUpV+sd/czakrbC7iU4tjgXfQcLLa4yW4gm0NhV8rP47B0v9
         dk1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093906; x=1789698706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4z2PlAx+ooH1DQkWitjSiJSFWsoxu8y4GadNPU5V8DY=;
        b=Waj1gaAPRbeeZWO+r97UfU7JDEh5kl/ZuIfwBDPIqo3YJqxtsSmPOAyfkUogTL+Hzm
         Es+U8Wi+hg1jxqml/gEl9aDID51S5FZYA4EFSWD+iIvKAjKUdiEOrcAAoHoT74umWtKL
         E67e66VPtCwElnxLZfKzkDpM3mBspiFPIZW9ECNjS9oHo/IPD1kRgYgpalIMwdG1O3Vl
         zK7nfSn1C2pGmYBBi8nUuoRYcunzdg5eRPPzwO/X8X2LcsdN9Watftk+8lbj21nINPlQ
         Ql1I0aVow13wm49cHFaTm5r0v39EiQeI6qwtL/sJb53l5srOFqETck1C0NK6QWL30IOX
         i5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093906; x=1789698706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4z2PlAx+ooH1DQkWitjSiJSFWsoxu8y4GadNPU5V8DY=;
        b=mMF1xJyT5A8RF3FLFa0drVlJwm8dr9w70BFobmvDOhEftKvqSm0gKn9i59nqOz4tav
         CDeyrFopVsDPGS5htizZaFDEDGoOxI2k5sAvJJqhdco3mDP2mJ/VMJ0suootviQ538gX
         CFuNE6JncRec0Zi3N926kNhARwaxJhPuvkJiFXGCiot7/6AVcRRaWXOUbrtrzF2ZPhuG
         FQpzlzlRzMcB4u+yC5qqUbvOKlNwYHg5SeIrlvIR8V3DtQJ0hw7ReKT9mO7dsZypQNdZ
         AkJOgKc41XhYIhQqpFbsDTAu6pM9eMe0nKT8Ad36xnpO74ZvfeJBhnSuK/537WeDbgdx
         N5TA==
X-Forwarded-Encrypted: i=1; AKwUvBxdAU+XCdOxczVS0rtFwjS4giWuDCI59dmWlU7y3ICBboGzIxFryrN1xZZ1CSy5hzWtdaDnrb3j+a4w/Jc=@vger.kernel.org
X-Gm-Message-State: AFuF++lUnkFCSE7uqm/O1emM8/AWJN5mMddUhvjK9lzF7EskJiegrtRc
	d5R+/DRN1rn5CvgJ4gUO4BMjKHiaUbaa9ksyyDDCOrVfmdWXojfIbeSlyXXiu7a9q2Vk83cjb7n
	QvaWW9QHRWqNmbUjxNfGhYIPjhYSXhhk=
X-Gm-Gg: AYBFou3Ozyd0p1yi5R1cupIs37140czS3vxYcYbWAfxqaVMVP2cSfF81v/oNOWMhBKq
	yszwsVIUfXzHEr2IGTbp9RLAFeSFH4nMTHwRVNmfSVe6GxT6sCVCG87BDL/7PpP93/UpwSUE4YG
	jAOd4McQ03E4ivXhshkWe0vvtC8a6xKyADX4LnXMFv15uasveGLbXGHfNOcEkb14tY/Nm/Z0H7u
	210habC6Kjdrzt9OXN+zZCXD3wiRwQgpvoh71SzzhUPwop805KjMkm/fBPgf7ShZXa5OE6v0Lo6
	vvdsc6vhZKqKftPu4rzVpsaXYUrmaIuQ1s8vDP7vCgQEoqK6LBctFff2rOG9TfX1opqTOFtO4WV
	SaA8bjrbm7C51Olefa/l4TBBp
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id
 5b1f17b1804b1-49e6198734emr48605425e9.6.1789093905582; Thu, 10 Sep 2026
 19:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907075829.2073224-1-kunwu.chan@linux.dev> <c201584b58aec856342e0f23f8df9f81baccba1d@linux.dev>
In-Reply-To: <c201584b58aec856342e0f23f8df9f81baccba1d@linux.dev>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 11 Sep 2026 10:31:33 +0800
X-Gm-Features: AcwNN1VoKSQ59tly50x3h78cd3RLsXN_AHHDzi0tZfm-mT8UWJfPRMG8hB-w29I
Message-ID: <CAN_Opa_rqLQ+SEvWeaLpi3qa2SB7hA-3n+e12h7QQSAPfKCpEQ@mail.gmail.com>
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

Thanks, Zqiang. Good catch on these missing SRCU synchronization
checks.

I=E2=80=99ll review these against the existing SRCU synchronization path an=
d
send a follow-up patch if confirmed. I=E2=80=99ll add your Suggested-by tag
for the changes.

Thanks,
Kunwu

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
