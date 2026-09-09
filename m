Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE30481B1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922987; cv=none; b=TZ3HRAz/6UQ9c+ZWFgvF9uX5DvsTht8E8Y0Le7AZYN7WbfI0Q8dKP/Xae3cIKQ4cCD8wZrPzr2nTEiiUtDgaAP69WXyf5bhICx31iLrg2hrLVhELZ+TB1up/nrfewbfk557zI/bJOQBnc1St3OQI8nlN3mOP2u0DOprpBH1gXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922987; c=relaxed/simple;
	bh=BQPBkN/NqtCyjwb9SYHUTxuMckVrHcmWQ71eKEec9V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNEbE2tOdyCLSgEiy3Y7LnKaIMU8KE8YhBNZckfHMNmPgY4G4uOV3Fl805SCuR01v4MyvNIb6KuWH/IkThkrmApzPaWusI/GF6/QfrpayDNq/a5/jd8pVw9S07UaapQyyKjJrVmSBvcSRmCuoHJwJswUEoqmN/Dl+EOVbHBrsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpb33DJ/; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpb33DJ/"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf433a99so5024147a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922986; x=1789527786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATaIDw9EojrgfvEMDnK/O8s2Q0MxvIMBvw5QrxeuLQc=;
        b=qpb33DJ/u8DSJ2iOpq0pTnq4OM9MceIsUTpEsnA/b/qOSXO0BVL2Ghin3J2AG6Te0C
         MDkD+o4H8P8WEnCE/Ac71QWld+lvArYmujkvVSaf5ttEW9haumrPPXOaatU2T0yNB9cP
         WVSxfzrpfASVb/f+4OPkzcH+BW0SaxiZyWIafOS0A8LphKRW9Vn4SbkQru8g9+V5mrI7
         BpIsEYRsOKBCfWgdmUebqrQq93MDAA101Z0apQUwYJFTZZberK9PXbnkFLak8cmFJxVN
         dYR/nzfWLy1cgYTeu4kMabvAU2hKC5R5GZ87FbCqqW0/XulTi4+Rl4eRKAfbAosSBVN4
         Fqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922986; x=1789527786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATaIDw9EojrgfvEMDnK/O8s2Q0MxvIMBvw5QrxeuLQc=;
        b=mu0Fai72XXYHcqFq5K4vzzLeoPpiZrQH6wxq+urKpDeBslrEp/9b8aAPF0lI/e4li1
         /jFIWNWEDdDy0/rfgz6M1rGLgqCpbpRX93Gj90pe2CqmrsYP0xMEhcKHJH1dCamVWv9A
         wHJLAxRKOug5SII2pIskhOIhT6M6UamGQOf/JzFoiGTi9hmYGtIHhc1d8kJ/kU6fnVbg
         ALT2apbnMo2OcdeuW6zD9GYHhQC2GLUIEO1+3+bncaUrKtjBzBYBrpMd9WXVpRnC7/md
         v1LpwgLLZDr5WYJG8BmlornHY/Lec+QQ7wlIjopbNrYBjqfTY9CekPvULTCMf2Wes7fc
         16Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwSaheyCo0TWmR0bNeNBfDBwQ6PiAnYhgBoKEwUPoAswqdKiZyixP2ZReaY0CYVvLk+c+UmfbQWuuhVrQw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWEqhq8HF+feeoOBlLqpEYkHI+v1q5hNN8tDxBChs8+hOBn/B8
	aI7sgD4HDru/mVtdGY6RIkf2jDHIyeKe4KJRbhHwA/7RwjgJKB8UiMP2
X-Gm-Gg: AYBFou01+2CGkDH7ooCkVqYAb5pmitWUgOrmC0F6YWbHt4xIchnnhINe4m7SsJ3gTyZ
	EOzb/Len4kg4aIKknTDSYKJAxvrjiYOXRBEwhipzpAcRRgtjv8iUeua98aiZnAksJ66y2VFkTmP
	ySh+VsL/XaSIglK7oXh/7MeWDuK3T9Ay4STw+WhBaynUHwR28G8UWyLvp0Cd5+RoTB1caZZGEsV
	kw6jsHgsBs9wzlpsCjXDnbe3T3fbt2chkuxT7tUigeqWN8Wra/bHblAUcIcQVbgMOXMS+eDDYZQ
	3zoJ3QxkXLIpx3jzcse48uce0Uy56UKbkU4RA+CFWfpWmQMgAWPEUml4NKleo83aZ6lT2vGR4g+
	yT1/JOLmNScxxbLFMHLSpKsyrYbgP3z5nnYjkWLSTRAz66tOb5Angrc//TXS6Xd2d9kKUD+Gye/
	FpTA/zgYsoaNKMshHWt+uZjrCQ94y6+3bkv9n4kCCxYlQ04+TnDGvzG8mwaQB5SGfWFVmHvghdJ
	DuEUtLG
X-Received: by 2002:a05:6a21:6f10:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3da39d18e07mr49039314637.4.1788922984939;
        Tue, 08 Sep 2026 20:03:04 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f8bsm6475253b3a.15.2026.09.08.20.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:03:04 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] litmus: Add SRCU fastpath anchor-before-scan test
Date: Wed,  9 Sep 2026 11:02:51 +0800
Message-ID: <20260909030253.2430897-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <35d6d803-41d9-48d6-a8d0-b8d0f6f67efd@paulmck-laptop>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 8 Sep 2026 16:58:31 -0700 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Sep 07, 2026 at 03:58:17PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> > 
> > synchronize_srcu_atomic() may end its grace period immediately when
> > its scan of the per-CPU lock counters finds no readers.  Correctness
> > requires the grace-period anchor written by srcu_gp_start() to precede
> > the smp_mb() ordering the lock scan.  This ordering ensures that any
> > reader whose lock increment is missed by the scan cannot have
> > incremented its lock counter before the grace-period anchor, and
> > therefore cannot be a pre-existing reader of this grace period.
> > 
> > This litmus test models the key ordering between the grace-period
> > anchor and the lock counter scan, where "seq" models the
> > grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > smp_mb() and the lock scan.  P1 models the reader-side counter
> > increment, with the smp_mb() of __srcu_read_lock() following the
> > increment.  P2 models an observer that sees the reader's increment
> > before seeing the anchor.
> > 
> > The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > which permits this outcome.
> > 
> > Tested with herd7 7.58 using linux-kernel.cfg.
> > 
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> 
> Litmus tests!  Very nice!!!  
> 
> Could you please put both of these in Documentation/litmus-tests, in a
> new "srcu" subdirectory?
> 
> One thing for your consideration is use of the "filter" clause for the
> first term of your "exists" clause.  Not a big deal at all for this small
> of a litmus test, but the idea is that this litmus test only cares about
> the 0:r2=0 case:  If that condition does not hold, then P0() and P1()
> aren't the beginning and end of a valid SRCU read-side critical section.
> 
> Use of the "filter" allows herd7 to abandon a given execution early,
> so it is a big deal for larger litmus tests.
> 
> Again, what you have is fine (or will be when moved to the other
> directory), just pointing out the additional feature.
> 
> If you would like to see a use case, please see:
> 
> Documentation/litmus-tests/locking/RM-fixed.litmus

Thanks, Paul.
I’ll move both tests to Documentation/litmus-tests/srcu/ and use a "filter" 
clause for the first test as suggested.

I’ll send the two litmus tests as a separate follow-up series, so this won’t 
hold up the current atomic SRCU series.
I’d also like to continue maintaining the SRCU litmus tests as they evolve. 
If you think a MAINTAINERS entry for the SRCU litmus tests would be appropriate, 
I’d be happy to prepare that as well.

Thanks,
KunWu

> 
> 							Thanx, Paul
> 
> > ---
> >  .../SRCU-fastpath-anchor-before-scan.litmus   | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-anchor-before-scan.litmus
> > 
> > diff --git a/tools/memory-model/litmus-tests/SRCU-fastpath-anchor-before-scan.litmus b/tools/memory-model/litmus-tests/SRCU-fastpath-anchor-before-scan.litmus
> > new file mode 100644
> > index 000000000000..8200a75e15ef
> > --- /dev/null
> > +++ b/tools/memory-model/litmus-tests/SRCU-fastpath-anchor-before-scan.litmus
> > @@ -0,0 +1,56 @@
> > +C SRCU-fastpath-anchor-before-scan
> > +
> > +(*
> > + * Result: Never
> > + *
> > + * The synchronize_srcu_atomic() fastpath may end its grace period
> > + * immediately when its scan of the per-CPU lock counters finds no
> > + * readers.  Correctness requires the grace-period anchor written by
> > + * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
> > + * This ordering ensures that any reader whose lock increment is missed
> > + * by the scan cannot have incremented its lock counter before the
> > + * grace-period anchor, and therefore cannot be a pre-existing reader
> > + * of this grace period.
> > + *
> > + * This litmus test models the key ordering between the grace-period
> > + * anchor and the lock counter scan, where "seq" models the
> > + * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > + * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > + * smp_mb() and the lock scan.  P1 models the reader-side counter
> > + * increment, with the smp_mb() of __srcu_read_lock() following the
> > + * increment.  P2 models an observer that sees the reader's increment
> > + * before seeing the anchor.
> > + *
> > + * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > + * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > + * which permits this outcome.
> > + *)
> > +
> > +{}
> > +
> > +P0(int *seq, int *ctr)
> > +{
> > +	int r2;
> > +
> > +	WRITE_ONCE(*seq, 1);
> > +	smp_mb();
> > +	r2 = READ_ONCE(*ctr);
> > +}
> > +
> > +P1(int *ctr)
> > +{
> > +	WRITE_ONCE(*ctr, 1);
> > +	smp_mb();
> > +}
> > +
> > +P2(int *seq, int *ctr)
> > +{
> > +	int r3;
> > +	int r4;
> > +
> > +	r3 = READ_ONCE(*ctr);
> > +	smp_mb();
> > +	r4 = READ_ONCE(*seq);
> > +}
> > +
> > +exists (0:r2 = 0 /\ 2:r3 = 1 /\ 2:r4 = 0)
> > -- 
> > 2.43.0
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
