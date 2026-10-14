Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875A54A7D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988763; cv=none; b=Dsvyml+aA15VdsDOWqw8bIGThcrxzqyQa5EnA/wWxfsGnF6VtLg/Vb88WpcIL4Syyq31qAoxXevKuQ5icH4+HzjFXbFlWh38eCir43NI6dOwNthS1TXmMHQCNPitR/ixDtrNV84dgCcNcd0NPTs2nc0qQp1DpPWHWzKDnp6wy+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988763; c=relaxed/simple;
	bh=98w6yIl1XHuT2wT7hw/8Xtf1cduatOdiYBV2mOGLxr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RUtGRR1DDD/t7TqPv9kB41IcT56nni2fs4wKQGBSqtCiMAymnzgtDABbhiTu0UcEmp7y2sEcGx+ng0fFv9UQH+nZ6pWKByd6zy0ADuk8U7iUqxniNmoB+O2TREcutZkCd7UUkswJsEwti2v7O3T7DXZyGF1QHohVzAFUmVgsxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JDdZJPgA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sNCU1E0Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JDdZJPgA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sNCU1E0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791988757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:list-id:
	 list-unsubscribe:list-subscribe;
	bh=zbQdOW2nxo5154FSG/2rAu4LziRZJfWIRaH099gdUYs=;
	b=JDdZJPgApsJqezSnWJPP5auw2VeE1KLAhoA4aKK8AW9MR8EpvE4kxItmeICLBEhJwV04IX
	U1gtRGUg3hBZ6cCW36cVsZy4AXJk1FeROPeAagCf7kjXBvzwJ0kXBsCdILmXjl3hFtJm8q
	RXHu9WauH8/mbt4yvmuMbzeCSXqq2R4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-LA_KuCZvOA6sMGEHeKrVNg-1; Wed, 14 Oct 2026 14:39:15 +0000
X-MC-Unique: LA_KuCZvOA6sMGEHeKrVNg-1
X-Mimecast-MFC-AGG-ID: LA_KuCZvOA6sMGEHeKrVNg_1791988755
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so2553334f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791988755; x=1792593555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbQdOW2nxo5154FSG/2rAu4LziRZJfWIRaH099gdUYs=;
        b=sNCU1E0QOrHaMupSmDrXqK9EpTuiu7BJJGVBiWk/SDsIXXNLfthN7fvzqCy4k5rpvI
         07E3FAC0lgmMKQH/kBWyTzrWC15vud/D2FOHh+VfXxJB3obDi0NhpKrdYyGw/MFO4xGg
         h3fpVTsSrHschguBHbsKzzVuDQifgF5sq7zw03zVHHJn42fnt65rrrpJDl8B8/rNMZA9
         W3h1QhWwZiA9Mbp/YU6HBKn7xV+jSAw1Mjxe2xmzUIjXGQritb/lp7DocUvd6PTopFIZ
         oSy+5RPK+7SREoGoKWML0C0VE2GQ5TdQLuwQoiLg//JqN6u5jo6ClJEw1/0ArXcE+pAZ
         fjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988755; x=1792593555;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zbQdOW2nxo5154FSG/2rAu4LziRZJfWIRaH099gdUYs=;
        b=O4/YLdN0AUX35VbWzfiPTsiScLfw0mL/vnGRx5T5ofD/EVpRvDE9hUJDkhxCTm39Pr
         Sot/2nP+E0wZwP/8oEV2EHxXeTBxRreP4PKha5IKhskSGSYL9nz+yyz4hZlUnaX+g1TG
         YscLGuFMjyY3u8hnrhPvdfMLXeaChYjTLkdsKPGXfcj11BqIrjidnVugwjk+e0frbGnb
         af+0lNIh7HG9PNCMSGm4NUN8n7yxUfllRncaY5H/moxHTHtExuZngnZshl4y8OgzTAfg
         hLFjbh8VQdnbnx+XAD1N9femd6NErKt0PP2Coao1s0tP5lRfFwQG0Dqjz2OyX1KVpPjr
         oAIQ==
X-Gm-Message-State: AFq9FYInE1Tq7uMVpSL7vlWFU8WE6o5Bgs4zOZB3kAY4SbcgBfWUb5gf
	QuV1OpKG9RN0GZj8zyUkFdUzRaSl4fK8BGf5ed6LnVm3k1xxbmsBsc0Xo4CeR4WuhNsHB4ko6av
	SO7x6MUH9eZMRmo+8GIhWFswbzZJT4O4W8lYZbw3c29m1DMrrPCyBLtcPllfw2B+p1bZ7m1B5kt
	dH3v/L3mS+2L1qAEPS4QMU6dgutOOdEWqPXh6Avvav1Sx3+Ph4HQ==
X-Gm-Gg: AYBFou2CFTY8VQeSUcu19TlDKAGwDer5xspCegQOa9eIq6YEm1T+HUyGWv6/P+LdLLf
	2c17bxoiJ6x2tDwdrNLYIODNVtpiuW60VWsXAd/DtVt0jVljGyIruS0XscU/C39IsVEPUxR4Qiv
	zQdjSxNeWGVn5QUEmfy7ug24Mb0WrLl6Fy4GQlgkePKQs1jPRPf10685FhcKxg2B1yrUMfoyldf
	TSn34o3/LKUU9EdyK90LGvmVigm/2GNH3mdGYJ0kDMShhNjW+yBm2RniE2Ck/SHThm3AbLW2edV
	WaKBY596OtM+h7upeezdaNRkrUTKTIIG7XBzagmI7iuRJuWbqgFqDvsl2gZnwXEG/iXWYpyqPcM
	HJ8WF07GMF1vqoAahSMfyoGgUHssjDveUZRglIi3frQ1Kp0Ceul1LIA8Jy23N3m779fp7mv/+/P
	3E1RpA
X-Received: by 2002:a05:600c:8206:b0:4a1:6811:8d with SMTP id 5b1f17b1804b1-4a18e4a3b34mr326670255e9.11.1791988754579;
        Wed, 14 Oct 2026 07:39:14 -0700 (PDT)
X-Received: by 2002:a05:600c:8206:b0:4a1:6811:8d with SMTP id 5b1f17b1804b1-4a18e4a3b34mr326669565e9.11.1791988754130;
        Wed, 14 Oct 2026 07:39:14 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.82.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm12684950f8f.14.2026.10.14.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:39:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	EJ Campbell <ejc3@meta.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] x86/kvm: Don't consume async #PF flags on a kernel #PF in NMI context
Date: Wed, 14 Oct 2026 16:39:07 +0200
Message-ID: <CADkxfh-uQTca_6jB1JPDq1MsKffF_UKGQR339oQSJNcoV75GNQ@mail.gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Gm-Features: AclHuK-0menqV2wPSclxNCnIU0qeGt1qcoIMc1LHzGBaM5EOtYHxSFhk2rGHvAE
Content-Transfer-Encoding: 8bit
Message-ID: <20261014143907.rxkNyihZ1JgwPHidESRIF139Ie26Hc40ST9eCXCpl-E@z>

> An async #PF "page not present" event arrives through the #PF vector,
> and its reason sits in the per-CPU apf_reason.flags until
> __kvm_handle_async_pf() reads and clears it. If an NMI arrives after
> the event is injected and before the #PF handler reads the flags, and
> the NMI handler itself takes a #PF, that fault reads and clears the
> flags belonging to the #PF it interrupted. It then finds interrupts
> disabled in the NMI context it interrupted, and panics:
> 
>   Kernel panic - not syncing: Host injected async #PF in interrupt
> disabled region
>   Call Trace:
>    <NMI>
>    panic+0x52/0x60
>    __kvm_handle_async_pf+0xb0/0xb0
>    exc_page_fault+0x71/0xb0
>    asm_exc_page_fault+0x27/0x30
>   RIP: 0010:__get_user_nocheck_8+0x6/0x20
>    perf_callchain_user+0x147/0x1a0
>    get_perf_callchain+0x12d/0x1c0
>    ...
>    perf_event_nmi_handler+0x26/0x50
>    exc_nmi+0xe8/0x110
>   RIP: 0010:asm_exc_page_fault+0x0/0x30
>    </NMI>

I've made a small adjustment to move "if (!kvm_apf_reason_pending())"
before the user_mode test, which preserves the idea of the "if (!flags)"
conditional that existed before your patch.  It's just a matter of taste
though.

Otherwise, the patch looks good.  What I applied is below:

-------------- 8< ----------------
From: EJ Campbell <ejc3@meta.com>
Date: Tue, 29 Sep 2026 11:12:32 -0700
Subject: [PATCH] x86/kvm: Don't consume async #PF flags on a kernel #PF in NMI context

An async #PF "page not present" event arrives through the #PF vector,
and its reason sits in the per-CPU apf_reason.flags until
__kvm_handle_async_pf() reads and clears it. If an NMI arrives after
the event is injected and before the #PF handler reads the flags, and
the NMI handler itself takes a #PF, that fault reads and clears the
flags belonging to the #PF it interrupted. It then finds interrupts
disabled in the NMI context it interrupted, and panics:

  Kernel panic - not syncing: Host injected async #PF in interrupt
disabled region
  Call Trace:
   <NMI>
   panic+0x52/0x60
   __kvm_handle_async_pf+0xb0/0xb0
   exc_page_fault+0x71/0xb0
   asm_exc_page_fault+0x27/0x30
  RIP: 0010:__get_user_nocheck_8+0x6/0x20
   perf_callchain_user+0x147/0x1a0
   get_perf_callchain+0x12d/0x1c0
   ...
   perf_event_nmi_handler+0x26/0x50
   exc_nmi+0xe8/0x110
  RIP: 0010:asm_exc_page_fault+0x0/0x30
   </NMI>

The last RIP line shows the NMI landing on the first instruction of
the #PF entry. perf with user call chains takes such a fault: the
sampling NMI walks the user stack with __get_user(), which faults when
a saved frame pointer is not a valid user address or the walk runs off
the top of the stack. The same window exists when KVM, running as an
L1 hypervisor with DELIVERY_AS_PF_VMEXIT, reads the flags itself after
a #PF VM-exit.

The NMI entry code saves and restores CR2 for this nesting, but not the
async #PF reason. Andy Lutomirski described the race, with perf as the
example, when async #PF delivery was reworked in 2020 [1]. Saving and
clearing the flags across the NMI, next to CR2, was discussed there but
not merged.

Since that rework, Linux has stopped setting KVM_ASYNC_PF_SEND_ALWAYS,
so the host delivers "page not present" only for user mode faults and
a kernel-mode fault in NMI context (including kernel-mode #MC and #DB)
cannot be an async page fault.  In that case, return without touching
the flags so that the interrupted handler finds them intact.

Tested on v7.3-rc5 in a 4-vCPU, 2 GiB guest restored from a snapshot
whose memory is served on demand through userfaultfd, so that reading
it back takes async #PFs, while every thread samples hardware cycles
with user call chains and points its frame pointer at an unmapped page.
Without this patch the guest panicked as above in 3 of 3 runs. With it,
the guest survived 3 of 3 runs of 60 seconds, and the host counted
148,441 to 153,334 kvm_async_pf_not_present events in the first 20
seconds of each. On 6.18.50 the results were the same: the guest
panicked without the patch and survived with it.

Link: https://lore.kernel.org/all/ed71d0967113a35f670a9625a058b8e6e0b2f104.1583547991.git.luto@kernel.org/ [1]
Link: https://lore.kernel.org/all/20211126123145.2772-1-jiangshanlai@gmail.com/ [2]
Cc: stable@vger.kernel.org # v5.9+
Signed-off-by: EJ Campbell <ejc3@meta.com>
Link: https://patch.msgid.link/CADkxfh-uQTca_6jB1JPDq1MsKffF_UKGQR339oQSJNcoV75GNQ@mail.gmail.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 6b0a5861ccb8..d8dd2cadcbf7 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -265,11 +265,39 @@ noinstr u32 kvm_read_and_reset_apf_flags(void)
 }
 EXPORT_SYMBOL_FOR_KVM(kvm_read_and_reset_apf_flags);
 
+static __always_inline bool kvm_apf_reason_pending(void)
+{
+	return __this_cpu_read(async_pf_enabled) &&
+	       __this_cpu_read(apf_reason.flags);
+}
+
 noinstr bool __kvm_handle_async_pf(struct pt_regs *regs, u32 token)
 {
-	u32 flags = kvm_read_and_reset_apf_flags();
 	irqentry_state_t state;
+	u32 flags;
 
+	if (!kvm_apf_reason_pending())
+		return false;
+
+	/*
+	 * The guest does not enable KVM_ASYNC_PF_SEND_ALWAYS, so the host
+	 * delivers async #PF only to user mode (or as a #PF VM-exit, which KVM
+	 * reads itself). A #PF from kernel mode can still arrive between that
+	 * delivery and the read of the reason flags, inside an NMI that
+	 * interrupted it, for instance perf reading user memory for a call
+	 * chain. Such a fault is not async, so leave the async PF flags
+	 * untouched for the outer handler.  Outside NMI context, on the other
+	 * hand, async PF flags on a kernel-mode fault mean the host is broken.
+	 */
+	if (!user_mode(regs)) {
+		if (likely(in_nmi()))
+			return false;
+		state = irqentry_enter(regs);
+		instrumentation_begin();
+		panic("Host injected async #PF in kernel mode\n");
+	}
+
+	flags = kvm_read_and_reset_apf_flags();
 	if (!flags)
 		return false;
 
@@ -285,8 +313,6 @@ noinstr bool __kvm_handle_async_pf(struct pt_regs *regs, u32 token)
 		panic("Host injected async #PF in interrupt disabled region\n");
 
 	if (flags & KVM_PV_REASON_PAGE_NOT_PRESENT) {
-		if (unlikely(!(user_mode(regs))))
-			panic("Host injected async #PF in kernel mode\n");
 		/* Page is swapped out by the host. */
 		kvm_async_pf_task_wait_schedule(token);
 	} else {

