Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B31E511E8A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866576; cv=none; b=C/XfS3OLMp7jxvn3wqz56KYn7qmEOo+3pgjUjIwwqU53rh6XRfaN/Dh+fbybpEO4kMq7GwbHXClEEbz1aehb+cDXiLGnkG90l623gJBm8S1c4gUoV8IB+ZPNd6IbQVdU8ZxNw6sGmRxPQuoBVELsPvM7dWlJc1j7a0hmPDMAJLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866576; c=relaxed/simple;
	bh=2K4ABhttw5lpb+qyBSDzDVad5fOLKEIDw5g09u7QgQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvDTF2XO7Xtw78j3CO25omZIfJ6dOSTu3WwZrxdLPmwooB3/2LNHj1a8dRSVq+9U09Cca92/oBmPMR//BSTus9d8AixQaoIsvK0eAtXFeZalW2IOdJ3899BkEgq4V+3fihwEVLYgu2QlEYgZaZ8FRdEIErNRq+oQ31n8Q0psELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyLQvt80; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyLQvt80"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4590633a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866567; x=1789471367; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/f3x8Z3givjt4IOINS3hmWB76mNz9OB3ZZIt4XHEaho=;
        b=OyLQvt80n9mnVbS/J1IyEXdOxGy8+SUWIRZ/kRBirjn9S966puSKq4sGacuvnpOa5N
         fVEo+mfTLrcTOjjN9ysZsUSOZ0b9Nmkb/ZDwqeyd46BpfiE9PX1tXkW/Ej4+deAKj62n
         VLaCbseo1tsvZKezvxa1Mq4YAJzo/jNxR7radfh/ZqfU6L1JRSE91YgN0b/fR1IYD7B/
         B3aP3rNdgAJl/IA07rwyvRmmK3PPu88vHhx5ICIcja8gzF8166yGkFJenW33MqtlHRte
         vrRHUVU8NNKOMKT1jqWUFc5zt2yy+2YqN/+IL3x2Di5dp9+WCloVB0odFIdrh3FuAFcf
         YVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866567; x=1789471367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/f3x8Z3givjt4IOINS3hmWB76mNz9OB3ZZIt4XHEaho=;
        b=jlsxFNnElPyfwqWkXDhr6owxIGz2Lr0y3WJzQMGAeahUheFsT1HagP7myGh6FcZJWm
         lFi5aoLKTJa7/lsKgu7p4oBxEQTV6tMwo7ODF6HKjqPagM8kTDjHhQqi4Y1DOw4TRh+q
         dYfPpv7DbxBObUY1EYXmIPCXlLWDxxz0riwtjwHMR+ZbvcTRC7d4oI1CWVCK63R2xO7L
         TsGJr/t127CjUWom0j07ees76quYg4GsPNVeM1EC1PmqEiuhSWLUfva0Ruw3Hrdd6KS2
         cpfHFfowGUGibqpXpFVBbaFgQBHf1aFrSFE+NdZsPQneXJ2aIG+VEAx1wjWOtIWwS3Ln
         NsjA==
X-Forwarded-Encrypted: i=1; AKwUvBzs1TN4TrM8QU77WEYc+Z709IUdbcyBgQrJURzj1H+ZKsKPEHq0jRB87B2K1wNQTYNGowILrHpPLgkirIo=@vger.kernel.org
X-Gm-Message-State: AFuF++nHM4OxUnh3Hyq/JQg0thPYVgzXXQn5m890TmjOOyQms5G/olpZ
	j1MjssixG6VQQqo/scWPzxqZrhv9ropcJBUQd70GTVyTui4wfKAYyal0
X-Gm-Gg: AYBFou1mT9l2FY7nIHa3JSDyVUbMMl5jIHki8Ae5MS9INiRSTMOrwqP0guokP+g9LOi
	J+gRaPEQoOqdPaBcHCrcupXcgkOZiHRi0ZDfl0GBfI6Qs6FJVo8xoa+wZxrPDzzenFv/vZC7ORH
	BfHoLnif14s8nLWD7x2fIELJ1G0Zw7PWztS408wySa/ZoDzOiZBu3FkGgHmApLtSuIPQpbebUPE
	GkaF7CFrJWfJa8RsigOShHHca2duZP5J7dccmGqcnuTXpP3mOZoG39OWKmzCvLuwCBKF5cfliMm
	7vDJczeijQK6/BzkwIQZdYwGZibc16Hstv7fZRUfUwre1mydkxCLTEsylf2Qqi8dFZgc0MKmRzD
	B7qdTVtleL0KHsYd+GXfcnTyQ+ItnM2NjaJR8jK41Pkq314yRuSkV8/UfxWKiJaIiO0pv7IwHS6
	YATkQAuiC1DCkHp8wiQfKJIEUkscPSajyToJWiYRouJxt2GiNfa0hBMNQdmH+JQuv8YD/Q46BJF
	Y1KRRhYNk9YyrFwCyv3Rvqjol6zKcEHYx1f
X-Received: by 2002:a17:90b:3b46:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39b2620a2ecmr40925181a91.17.1788866566728;
        Tue, 08 Sep 2026 04:22:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.53.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm41000804eec.7.2026.09.08.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:22:46 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:52:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, oleg@redhat.com, kees@kernel.org, 
	luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com, sshegde@linux.ibm.com, 
	thuth@redhat.com, ruanjinjie@huawei.com, akpm@linux-foundation.org, 
	macro@orcam.me.uk, ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, 
	kevin.brodsky@arm.com, ritesh.list@gmail.com, yeoreum.yun@arm.com, 
	agordeev@linux.ibm.com, segher@kernel.crashing.org, mark.rutland@arm.com, 
	ryan.roberts@arm.com, pmladek@suse.com, feng.tang@linux.alibaba.com, 
	peterz@infradead.org, kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
Message-ID: <ap_vl6lyicTVWYrk@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260427122742.210074-1-mkchauras@gmail.com>
 <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>

On Thu, Jul 30, 2026 at 01:24:46PM +0200, Jirka Hladky wrote:
> On Thu, Jul 30, 2026 at 11:36 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > On Mon, Jul 27, 2026 at 11:41:07AM +0200, Jirka Hladky wrote:
> > > Hi Mukesh, Shrikanth, Madhavan,
> > >
> > > I'm seeing a ~19% throughput regression on ppc64le (POWER10) in
> > > syscall-heavy workloads between kernel 7.1 and 7.2-rc4, which I've
> > > narrowed down to the GENERIC_ENTRY enablement for powerpc (commit
> > > bee25f97ad24 "powerpc: Enable GENERIC_ENTRY feature").
> > >
> > > The regression manifests specifically when SELinux is enabled. Regression
> > > disappears with selinux=0. With SELinux disabled, 7.2 is actually
> > > slightly *faster* than 7.1.
> > >
> > > Test: stress-ng --kill 1 -t 23 (single-thread kill() syscall loop)
> > > Machine: IBM,9080-HEX POWER10, 8 vCPUs (1 core SMT-8), 64 GiB
> > >
> > > Results (bogo-ops/sec, higher is better):
> > >
> > > Kernel   Enforcing   Permissive   Disabled    SELinux tax
> > > ------   ---------   ----------   --------    -----------
> > > 7.1      69,107      70,248       93,566      -26.1%
> > > 7.2-rc4  56,247      59,075       99,240      -43.3%
> > > Delta    -18.6%      -15.9%       +6.1%
> > >
> > > Key observations:
> > > - SELinux permissive ~ enforcing on both kernels (overhead is in the
> > >   code path, not policy evaluation)
> > > - SELinux disabled: 7.2 is 6% faster than 7.1 -- the generic entry
> > >   path itself is not slower for the base syscall
> > > - The SELinux "tax" nearly doubles from 26% to 43% between 7.1->7.2
> > > - No changes to security/selinux/avc.c between v7.1 and v7.2-rc4
> > >
> > > The kill() hot path (sys_kill -> check_kill_permission -> security_task_kill
> > > -> selinux_task_kill -> avc_has_perm -> avc_lookup) wraps every AVC lookup
> > > in rcu_read_lock()/rcu_read_unlock(). On ppc64le with PREEMPT_RCU, each
> > > pair requires lwsync/isync barriers. I suspect the generic entry path
> > > changes something in how context tracking, tracing, or RCU interacts
> > > with the syscall fast path that amplifies the per-call RCU cost.
> > >
> > > Note: this is on top of a separate ~36% regression from 6.12->7.1 caused
> > > by HAVE_PREEMPT_DYNAMIC_KEY enabling CONFIG_PREEMPT_RCU on ppc64le
> > > (commit 6ad7751537e8), which I reported separately on the v4 thread.
> > >
> > > Thank you
> > > Jirka
> > [...]
> > Hey Jirka,
> >
> > Thanks for reporting this.
> > I'll take a look.
> >
> > Thanks,
> > Mukesh
> >
> 
> Thank you, Mukesh! I'm happy to run additional tests on the POWER10 machine
> if you have patches to try or specific experiments you'd like me to do.
> 
> Jirka
> 

Hey Jirka,

Sry about the delayed response, i got occupied with functional issues.
Anyways, I don't seem to reproduce it with default fedora policy. Can
you share the details of policy which you are using?

Regards,
Mukesh
