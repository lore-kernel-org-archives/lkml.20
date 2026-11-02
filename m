Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641417;
	b=GBVCe6Sczah9aKdvxk0Al6SpTtxDY14/ZWyFB3bb4KU1toxFN6NzyPYZ8aaRsty2sjBy
	 XmdR6Sfws8FKqNqSpKeB2I8aFgoOde6uKJrkZK/Bl39XGyHyneG7R4Kt9Jp8ZMpOvyIzu
	 vcMlY87e5qcExRO7et1heGJu9diH+mgS0Pj9gzw+0v1oJa/Oz4fSFXvW6sI+d+XRmZBmm
	 z5jRhChOgiLTSmkEsXMXbuPMIZx/2l/5Z1MoukYBILNTP8Ql/X20qyyiUXvKvZE5lTIcc
	 XaF9yKae3l8dkYgMztaHthoFHUgQMbh/+wAfn6iimNvNCa8oN9zoLe9X4xAu5GYHDAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=raeJlK9yYBGSF7+QYGBqsG5Ux8i2znTMcBRplAhhHPo=;
	b=XBlyRMtV8DPPhCdro7+gdCsHuzu1mnA96C+1pnXwrxKNp9n733qafNDedtkj0S8hcqvX
	 KgciHxI77vvnUyejHfoWvtQLpozQ9sWAhNUSby/C7oQFAA68fUf7X9V2uE/BBbNO3YiRL
	 s74IG1iiQ8ScTJbcvQJp+NiFqvb9nWYZMAg9ZOEmweXwL0kPHNdcn9NAN0oHBj3tBnl3x
	 Nce6G3RdE957vZx+qqWZZHEdELIxZVyfjIRl0i8QNL9GBVD0Kgy/YynpAupFoP3bHpnTt
	 b50Yti68im/N0WNpFAyFUJP/QvzPs1OVZutAU89eI6k14iLNLZsmxkxf7tdRwniyCcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXoHB5P1;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C7E606B1C5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C7E606B1C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXoHB5P1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e869e00005so51783055ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793641416; x=1794246216; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raeJlK9yYBGSF7+QYGBqsG5Ux8i2znTMcBRplAhhHPo=;
        b=ZXoHB5P16CVQnJEKWlY1C+JYQkR9IGnrndtLEV0HUTpNsJGR5cOx1j0chdxtDl0m3c
         l4CCXWO6z+yw/UwSXmykAZXrfUNH0zmmA/WWGjQn2ZLs643b8PnE0q8uOhHOmxGirlIQ
         D1u3EQPHs0HeB/YoqkcLx64+1dqCUl97Oce3r+0LwOlhtqcNV8Nls56QRHYn32a6EHdW
         O1G1aWDP5xVwHbs2m/wnM02zsLOMTjs0DeSjK5yEsF3P0Zc7BOAT5uQPbXCYQWy2uF6m
         zzM8iLuw54yW7eBSsKm4tEx2Zr5UzWhD6NVlgJxoHN/S+1auQpxinQRogfD6/YpCBkkY
         S2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641416; x=1794246216;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raeJlK9yYBGSF7+QYGBqsG5Ux8i2znTMcBRplAhhHPo=;
        b=LFf+0IDLZn8xdZa2VpEhu5aeZtLNYIabUO9N5ab9mgaSkY3ZxzEnWSOB3I9ukiGDFt
         PVviJ2Kz+X+QkMtj9HBuJ13+ak+1hk/3d99ceSgYaiVoekm96Rp57Ft+xIs7iEyjiMh9
         gfSjxj3WdXCc5uU3mWNK2glKSmmaHWSSrAqhP+MK8A63ZFH0Lh1BiDoxI85zCWO0GVFu
         U1E45qC5RVGouZkJL/2WiCp92S7sS2Ujfq7e6GjK02/jMfoVWX6A5JnnEsRYz7P9nnP0
         jKNu3V4NcZoUGQ0xBucarqgLm+riaYftmClRcfPZfEAd/1F7Re1jGhzw7mmN77HZMsl2
         RTBA==
X-Forwarded-Encrypted: i=1; AKwUvByGL1E75GJd11YoLpnjHZ0C9ztSXVfjNWwxEe2DLwk66DR+POkl9XPElSyPihiIMcJFpUMZ1YMtGzfchVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iRVf9DDuH8ETHfIVnPz06lGLluJELcDo2QsJu1LnqtfePJytu
	ls3aiiGSkCsZ1KVuUAGiM9ClZMu8EiiIo3HoFguYef1RRV7WI62QG0RCWhlSbkOncj/r647diww
	sMUyxMg==
X-Received: from plkg13.prod.google.com ([2002:a17:903:19cd:b0:2e8:1f84:7c18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea0d:b0:2e8:1d5c:f6f9
 with SMTP id d9443c01a7336-2eb364715ddmr105628745ad.46.1793641416165; Mon, 02
 Nov 2026 09:43:36 -0800 (PST)
Date: Mon, 2 Nov 2026 09:43:35 -0800
In-Reply-To: <20261027163929.2bb28d5b@gandalf.local.home>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <6adf2939.67317f00.38c4bc.00ae.GAE@google.com> <20261026224305.1254-1-hdanton@sina.com>
 <auCucDdZb8mig7UZ@google.com> <auDvUyfzg6nLtVox@thinkstation> <20261027163929.2bb28d5b@gandalf.local.home>
Message-ID: <aujLx1FOc12E72rF@google.com>
Subject: Re: [syzbot] [kvm?] WARNING: locking bug in __refill_objects_node
From: Sean Christopherson <seanjc@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Harry Yoo <harry@kernel.org>, Hillf Danton <hdanton@sina.com>, Boqun Feng <boqun@kernel.org>, 
	syzbot <syzbot+f11512d1e5878ba5e60e@syzkaller.appspotmail.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, syzkaller-bugs@googlegroups.com, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

+Paolo

On Tue, Oct 27, 2026, Steven Rostedt wrote:
> On Tue, 27 Oct 2026 18:48:28 +0000
> Harry Yoo <harry@kernel.org> wrote:
> 
> > [+Cc RT folks]
> > 
> > On Tue, Oct 27, 2026 at 07:00:16AM -0700, Sean Christopherson wrote:
> > > +slub folks
> > > 
> > > On Tue, Oct 27, 2026, Hillf Danton wrote:  
> > > > Ask the locking people to shed light on the warning.  
> > > 
> > > get_partial_node_bulk() is waiting on a non-raw spinlock while in hard IRQ context,
> > > and it looks like __refill_objects_node() would do the same later on.  On PREEMPT_RT,
> > > those spinlocks become sleepable locks, which is what triggers the splat.
> > > 
> > > The alloction coming from KVM-as-a-guest code is GFP_ATOMIC, so I think that wonky
> > > code is fine.  
> > 
> > But memory allocation w/ GFP_ATOMIC is fine only on non-RT?
> 
> Correct. GFP_ATOMIC is meaningless on RT. It still cannot be called with
> preemption disabled. Most places that disable preemption in the non-RT case
> do not disable it in the RT case. For example, spin_lock() disables
> preemption on non-RT but does not in RT. Same for interrupt handlers, as in
> RT interrupt handlers are run in task context.
> 
> That is, in RT only "special" places disable preemption for real.

...

> > > > > =============================
> > > > > [ BUG: Invalid wait context ]
> > > > > syzkaller #0 Tainted: G S                 
> > > > > -----------------------------
> > > > > syz-executor177/6041 is trying to lock:
> > > > > ffff88801d040618 (&n->list_lock){-.-.}-{3:3}, at: get_partial_node_bulk mm/slub.c:3831 [inline]
> > > > > ffff88801d040618 (&n->list_lock){-.-.}-{3:3}, at: __refill_objects_node+0x104/0xab0 mm/slub.c:7279
> > > > > other info that might help us debug this:
> > > > > context-{2:2}
> > > > > locks held by syz-executor177/6041: 1, last CPU#1:
> > > > >  #0: ffffffff9090b438 (tomoyo_ss){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:198 [inline]
> > > > >  #0: ffffffff9090b438 (tomoyo_ss){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:305 [inline]
> > > > >  #0: ffffffff9090b438 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_read_lock security/tomoyo/common.h:1112 [inline]
> > > > >  #0: ffffffff9090b438 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_check_open_permission+0x169/0x3c0 security/tomoyo/file.c:772
> > > > > stack backtrace:
> > > > > CPU: 1 UID: 0 PID: 6041 Comm: syz-executor177 Tainted: G S                  syzkaller #0 PREEMPT(full) 
> > > > > Tainted: [S]=CPU_OUT_OF_SPEC
> > > > > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > > > > Call Trace:
> > > > >  <IRQ>
> > > > >  __dump_stack lib/dump_stack.c:94 [inline]
> > > > >  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
> > > > >  print_lock_invalid_wait_context kernel/locking/lockdep.c:4874 [inline]
> > > > >  check_wait_context kernel/locking/lockdep.c:4946 [inline]
> > > > >  __lock_acquire+0xfcc/0x1f40 kernel/locking/lockdep.c:5238
> > > > >  lock_acquire kernel/locking/lockdep.c:5942 [inline]
> > > > >  lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
> > > > >  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
> > > > >  _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:181
> > > > >  get_partial_node_bulk mm/slub.c:3831 [inline]
> > > > >  __refill_objects_node+0x104/0xab0 mm/slub.c:7279
> > > > >  refill_objects+0x58/0x410 mm/slub.c:7405
> > > > >  refill_sheaf mm/slub.c:2885 [inline]
> > > > >  __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
> > > > >  alloc_from_pcs mm/slub.c:4850 [inline]
> > > > >  slab_alloc_node mm/slub.c:4984 [inline]
> > > > >  __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
> > > > >  _kmalloc_noprof include/linux/slab.h:991 [inline]
> > > > >  _kzalloc_noprof include/linux/slab.h:1312 [inline]
> > > > >  kvm_async_pf_task_wake arch/x86/kernel/kvm.c:224 [inline]
> 
> Hmm, this part is OK:
> 
>                 if (!dummy) {
>                         raw_spin_unlock(&b->lock);
>                         dummy = kzalloc_obj(*dummy, GFP_ATOMIC);
> 
> As it releases the raw_spin_lock() before calling kzalloc_obj().
> 
> So something else must have disabled preemption/interrupts.

Heh, yeah, the IRQ that kicked all of this off.

> > > > >  __sysvec_kvm_asyncpf_interrupt+0x334/0x610 arch/x86/kernel/kvm.c:338
> 
> DEFINE_IDTENTRY_SYSVEC(sysvec_kvm_asyncpf_interrupt)
> {       
>         struct pt_regs *old_regs = set_irq_regs(regs);
>         u32 token;
>                 
>         apic_eoi();
> 
>         inc_irq_stat(HYPERVISOR_CALLBACK);
> 
>         if (__this_cpu_read(async_pf_enabled)) {
>                 token = __this_cpu_read(apf_reason.token);
>                 kvm_async_pf_task_wake(token);
>                 __this_cpu_write(apf_reason.token, 0);
>                 wrmsrq(MSR_KVM_ASYNC_PF_ACK, 1);
>         }
> 
>         set_irq_regs(old_regs);
> }
> 
> 
> Is that run in hard interrupt context?

Yep.

> If so, we need to make that a thread for RT kernels if you want to call
> kzalloc_obj().

Eww.  I can't imagine there's a sane usecase for memory overcommitting a real-time
guest.  I'd rather just disable PV async #PF support, e.g.

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 6b0a5861ccb8..b14b03720525 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -51,7 +51,7 @@
 
 DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
 
-static int kvmapf = 1;
+static int kvmapf = !IS_ENABLED(CONFIG_PREEMPT_RT);
 
 static int __init parse_no_kvmapf(char *arg)
 {
