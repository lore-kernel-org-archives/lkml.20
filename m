Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525942D3EEB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432962; cv=pass; b=UWwPDvqSHDdVRJs9b+6Ey9Vsz9mNpANhav9oSacGtBCOyZwb6Zjk+IRm5izkyjS9iswMJVmswL/putWmGS59XY9G0MCMOirNQ0jiDl/U3CFxVuyDPigPRzcRs+Xuyujn52nOENhmxwmuTK5PZKTdOYZMO4CzKXtSY0geJaXmQUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432962; c=relaxed/simple;
	bh=uyN5KVBgznyWy3+95mvnt5gqK/qRzApqBIr4yF3bC1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4YoQPwaLzQH/7S8vMmw4ra2n93btNhDvSfaOE2ixmcWATmHKP9HHFGPxjWn/Y1hi9wumUS/JBuJU3+tjBx7ouUikPUbnUixFon7AVRP8DduPZLWrG49bJSLIvRqgoXpdjyEkRm3cNj+qubK+r5Ll34Rj0GH6rDkUZ1cTRK362g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpqNRTXN; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpqNRTXN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso18589535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432959; cv=none;
        d=google.com; s=arc-20260327;
        b=UgC1wb5+FlSh9Sf/SQ6WhvPvUrkwna3Zc2kH3xS3zckls51WQf0Cxv5s5zx3u5uBJn
         iaH6wCDGp0yZ/8pQj78016oCsD+nX4w+fqKoSb0BletP6sXF4C0kR59VGV5c2T9/dfO8
         WHvjW7iJRrz6JYV6G4eQ9kUwp+clIf2kTNxw3UtcUnQnv3wePNJvxex7iKzrVwP3tg/R
         ukwKUCSrNZb3PmlnufKxZYDfq7BfY8Q+W++XIjdtCxpHoC1yWyqvqmhosN5ReN/wiEfH
         BooSyIm5ZCvs0S676tG9uqwm3857CPScqGPnSIc4+/Ck6Z9LEDCi2DSlXRF1XapVxIpx
         fTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Z9vpPdznmiH/NLpVMrj1ax6vHKxHJY2iMpBJAfxMIw=;
        fh=jpdUWyRgYt4jR0P8uvzRtTDQFrifM2Z4i5NxQFsYdXA=;
        b=ef+r8FLzGyztxXfycsed2shPy3xWWEYFn9+Ka+eQj3HQoiCMT2uKCPPvdGuz9s9d4s
         HnuaJaR8Qso2tGLV0AH06QEuy7hLuC1ZMF+nRe+nLWAlgT/DSaq47IzvwG7kkDFBHGVu
         hRcVBv9wA4fn9rzubVh6mAYVEfPleC6bOfKi4pVoty1QSTO+FXsR4ODEJ8wArj77IXiW
         DwfndAAk3yUKVoP7KqKcbgFZNApDEXxKgemdiwNzCq8/PrPP6I6NZ9qkYTsLEIPpCVIG
         mbYpuSjZFckg7pTrd0DMbCoxy+xeFD53/9lY4RX23gt+Q5s91GOQn9cCjtPxVBglvyzK
         Z9vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432959; x=1792037759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Z9vpPdznmiH/NLpVMrj1ax6vHKxHJY2iMpBJAfxMIw=;
        b=LpqNRTXNFcUFrfXrm0elVXLKLoPPy8oQhsprRnQzAL2hcvYiPPpQ6wHBa/BwqRyOut
         lLF4PlodvtKCliRGIn9V9lzJcffSwyXc0bae0Qzqbzk2selBJlYVsk4pJ8/CJV+TsAkQ
         tlOy0qyIgDNv+ohIPo63PyE6zM+4iIT20vPvvClSHZODWKsf9+NUkimeTsrkVRdIPqNb
         1ODqoc2Dm6EsT5ztyDKF0ZZ0+BftPge7x8d8JUS7MUcdjp3i+C9BV3F1QIuzkx5/4MyI
         wH/4Ee9Vvf3OgY6sA3ys0McsjCNllATVVqcWy2FQmJrIWWO5iV6XgMfACLjKKZTDxHQj
         YJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432959; x=1792037759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Z9vpPdznmiH/NLpVMrj1ax6vHKxHJY2iMpBJAfxMIw=;
        b=c/btlCxdUXHYkSInoMb4j6G5igwki1zAWjExZHrCn9gEZ1PBPtnUcbtQ1yrXQh9way
         jGLe9Rfel7kBnOpn4UqeHsxIlhK9mzlmrIt3kR+Nqa6JusY8uevOJOkUTYTlA+p5BuVJ
         wx+eQPqxH/SrG57+h4sScNUqO/i9TUd2RaQH02iPMRicaD6880mz9DE4w754AG7bwlcR
         YH8hCslLiqimXh5tuHAQ4xBHyTbK5a5iQnhm9sQ/KSvIFiNqfii3RthWvK4UCQ68fJEY
         7PPm8WYkx4DnD8eZ5wrpyTyOY2gw5iNIA589bj4Dx5aGpaHEQT2n3XnOWSs1VcynhsUC
         uOyA==
X-Forwarded-Encrypted: i=1; AKwUvBwxE4S+VXbrpEk2sCY0NU4rsOfOsq742zND9aUHk+MjzGKxhx4rtDc5TfkoyBiDD4HRDYLKqvFbO5mvj5U=@vger.kernel.org
X-Gm-Message-State: AFuF++lRW5gqjcz3tWH3agwFPx+mEVEpaMo6kvgXQVrZSBshl/jBDRZl
	8mN123BpM7Bxug1/IThO4mwa+oFM1JXnq09BXMhSPigoLjtO89FGn9WFj4F9FS/C8gcR90L9rDn
	66th77UGqJYTfbmYgb9Tzc4EL9cSGljM=
X-Gm-Gg: AYBFou3XRJ3VJVtM84p8ydtxWbQKYid9pW1WkN/Q+gnsgZHp6OIdTslvF8RhGBtkIo2
	xISx3E1ky7OLAV9jgiyL0hQqOBUTyl3RWXyiDuD2kbv2ds0yc3YW4wRqnVLg6n67xleaKzUDoXt
	JJuoHeTasm4B1x7orSNi95L4BiST6XGEcJTpa+/EC/NTHRrtFvFII1qoHr8nZaVCwkvX368ED9c
	xjeN7qCjsqaaq/hPFNsIRFIYFtuRE1i6N8wut7vKwx1R4RwmiIuH05P0NzTVUzA1lIy9Hxyz9JM
	tO6QlnFn9SpQxkbj4N+y/FtqosOox1pbMpb2vF/4bvATEbswkbGHUZADdE5OWreoyMc=
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id
 5b1f17b1804b1-4a180648d69mr75524555e9.24.1791432959029; Wed, 07 Oct 2026
 21:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1f885062-4905-4d9c-9293-615c145d2d6b@paulmck-laptop>
 <5b5dbb90-69ad-4a8f-8583-f5ba162744d3@efficios.com> <631c13bc-671e-4cf3-b466-0408d7600ab2@paulmck-laptop>
 <CAN_Opa_a5MbG_50DTg=Eu_f5X_ZiYUdyzVGiAzHGhP__xDpxnw@mail.gmail.com> <a411c4d9-2a38-4a9d-bf8f-66f9c50394a1@paulmck-laptop>
In-Reply-To: <a411c4d9-2a38-4a9d-bf8f-66f9c50394a1@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 8 Oct 2026 12:15:47 +0800
X-Gm-Features: AclHuK-UiUNRD4-4EumGZ1XisAVtmg1Wf7lczZKX9L8XbPbOf9tl0FJZhAAX5LM
Message-ID: <CAN_Opa_KMtSmFyvLvB2pRb9YQLL0N8sNw4z_DVNThNViDuyaCw@mail.gmail.com>
Subject: Re: [BUG] Splat during modest hazptrtorture run
To: paulmck@kernel.org
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun@kernel.org>, 
	Wang Lian <lianux.mm@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Bradley Morgan <brads@mainlining.org>, rcu@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 11:53=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 09:39:50AM +0800, KunWu Chan wrote:
> > On Wed, Oct 7, 2026 at 11:59=E2=80=AFPM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Wed, Oct 07, 2026 at 03:09:27AM -0400, Mathieu Desnoyers wrote:
> > > > On 2026-10-06 19:40, Paul E. McKenney wrote:
> > > > > Hello!
> > > > >
> > > > > This is all new code, so the bug could be anywhere.  So you all n=
eed
> > > > > to know.  ;-)
>
> TL;DR: Adding the first patch in Mathieu's four-patch series cures this
> for me.
>
> > > > > I got this from the NOPREEMPT variant of hazptr during a nominal
> > > > > "--duration 60" run of torture.sh on x86 with the guest OS split =
across
> > > > > two NUMA nodes:
> > > > >
> > > > > [  137.765104] WARNING: kernel/rcu/hazptrtorture.c:658 at hazptr_=
torture_stats_print+0x25b/0x4f0, CPU#1: hazptr_torture_/136
> > > > > [  137.768647] Modules linked in:
> > > > > [  137.768891] CPU: 1 UID: 0 PID: 136 Comm: hazptr_torture_ Not t=
ainted 7.3.0-rc5-00661-ga1f1e4890d1d-dirty #193 PREEMPTLAZY
> > > > > [  137.769683] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)=
, BIOS 1.16.3-6.el9 11/05/2023
> > > > > [  137.770319] RIP: 0010:hazptr_torture_stats_print+0x25b/0x4f0
> > > > > [  137.770735] Code: 48 83 c4 20 e8 86 44 fe ff 41 83 fd 01 7e 23=
 48 c7 c6 6e 85 17 b0 48 c7 c7 db 27 17 b0 e8 6d 44 fe ff f0 ff 05 76 6e 0a=
 02 90 <0f> 0b 90 4c 8b 64 24 70 48 c7 c7 73 85 17 b0 e8 51 44 fe ff 48 8b
> > > > > [  137.772061] RSP: 0018:ffffa738004ffdf0 EFLAGS: 00010202
> > > > > [  137.772435] RAX: 0000000000000004 RBX: ffffa738004ffe08 RCX: 0=
000000000000027
> > > > > [  137.772950] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0=
000000000000001
> > > > > [  137.773455] RBP: ffffa738004ffe60 R08: 4000000000001236 R09: f=
fffffffb01727df
> > > > > [  137.773980] R10: 0000000020212121 R11: 0000000020212121 R12: 0=
000000000000000
> > > > > [  137.774479] R13: 0000000000000002 R14: 000000000002ffd6 R15: 0=
000000000034f03
> > > > > [  137.775000] FS:  0000000000000000(0000) GS:ffff999c2e502000(00=
00) knlGS:0000000000000000
> > > > > [  137.775578] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > [  137.776001] CR2: 0000000000000000 CR3: 0000000008830000 CR4: 0=
0000000000006f0
> > > > > [  137.776512] Call Trace:
> > > > > [  137.776700]  <TASK>
> > > > > [  137.776863]  ? __pfx_hazptr_torture_stats+0x10/0x10
> > > > > [  137.777207]  hazptr_torture_stats+0x25/0x70
> > > > > [  137.777508]  kthread+0xd9/0x110
> > > > > [  137.777751]  ? __pfx_kthread+0x10/0x10
> > > > > [  137.778017]  ret_from_fork+0x1bd/0x220
> > > > > [  137.778285]  ? __pfx_kthread+0x10/0x10
> > > > > [  137.778560]  ret_from_fork_asm+0x1a/0x30
> > > > > [  137.778849]  </TASK>
> > > > > [  137.779007] ---[ end trace 0000000000000000 ]---
> > > > >
> > > > > I have not yet seen this during a PREEMPT run.  Line 658 of
> > > > > hazptrtorture.c is the WARN_ON_ONCE() below:
> > > > >
> > > > >     if (i > 1) {
> > > > >             pr_cont("%s", "!!! ");
> > > > >             atomic_inc(&n_hazptr_torture_error);
> > > > >             WARN_ON_ONCE(i > 1); // Too-short grace period
> > > > >     }
> > > > >
> > > > > Any thoughts on what might be causing this?
> > > >
> > > > Hi Paul!
> > > >
> > > > Can you share which tree and branch (commit) this is running ?
> > > >
> > > > Does it include my fix from this series ? That would be patch 1 of:
> > > >
> > > > https://lore.kernel.org/lkml/20260927155134.4740-1-mathieu.desnoyer=
s@efficios.com/
> > >
> > > Ah, no, I somehow got the impression that this series was going to be
> > > updated, so did not apply it.  Apologies!
> > >
> > > I will pull these in.
> > >
> > > > Does it run the additional series from Kunwu Chan found at
> > > > https://lore.kernel.org/lkml/20261002170847.3653663-1-kunwu.chan@gm=
ail.com/ ?
> > >
> >
> > Hi Paul,
> >
> > I have posted v3 of the series since then. The link in Mathieu's
> > question points to v2.
> >
> > Please use the latest v3 series here:
> > https://lore.kernel.org/all/20261005171529.1378809-1-kunwu.chan@gmail.c=
om/
>
> I do it the old way with out b4, so I would have bot there.  I will
> hold off a bit for merge-window preparation, though.
>
> > I wasn't able to reproduce the warning with my current setup(without
> > my series).
> > Could you share the .config and the exact command line you used to run =
the
> > test? That may help me reproduce it.
>
> I used this command line, which creates the .config:
>
> tools/testing/selftests/rcutorture/bin/kvm.sh --torture hazptr --allcpus =
--configs "2*CFLIST" --duration 90m --trust-make
>
> This was on an ARM system, in case that matters.
>
> But pulling in Mathieu's first patch took care of this issue for me.
>

Hi Paul,

Good to hear Mathieu's first patch fixed it. That is consistent with
the race we were looking at.

The race is between the wildcard flip and a context-switch promotion:
hazptr_chain_backup_slot() selected the overflow list based on the
wildcard phase, so a backup slot promoted during the second scan could
end up in a list that was no longer covered by that scan.

Thanks for sharing the command line and test setup. The 90-minute run
also explains why it was difficult for me to reproduce with shorter
runs.

Thanks,
KunWu

>                                                         Thanx, Paul
>
> > Thanks,
> > Kunwu
> >
> > > No, but if you are good with it I will pull it in.
> > >
> > > May I add your Acked-by or Reviewed-by?
> > >
> > >                                                         Thanx, Paul
> > >
> > > > Thanks,
> > > >
> > > > Mathieu
> > > >
> > > > >
> > > > > For that matter, can anyone else reproduce this?
> > > > >
> > > > >                                                             Thanx=
, Paul
> > > >
> > > >
> > > > --
> > > > Mathieu Desnoyers
> > > > EfficiOS Inc.
> > > > https://www.efficios.com
