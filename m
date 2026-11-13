Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573124;
	b=0+wISF8HB/JxbvFgDduX35Lpfig9BjKqVL+C1YkgZ8ayONQR7M9LZwEMYM10RFI+oIzP
	 uelkjcv22sEguq0UXKqi2xzJP/TK3CisqX4zNbIVskeE3wnJOn23Yodb4zUmXWNYkKo6p
	 OAQ5dfxFfg8hhx3xzXQXoWjwVxsykiXcoeksuhUFbIJCEbgPbpjeRtfAZ3Gv1zG1JoKuB
	 Nd9ukTiEpaVEvpjA+vKM9pZoGMkjqszIZ/Tfbjo2L4F7pRf69UO5PuL2ENN+4hvtOdgA8
	 Todb5dPpOh/C+KcfzJVZlv9nNAeENCMa7IRr9Bn99MzgdKUEi7YacduJhc+C+jq5m4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1TRAHROLyPFOQPbURw5yPb6dBc0t0u89LYQ9L587dP8=;
	b=g4WkZPtSrdnnu9Fd1UKjpFGd+kXbkAePxVsW+5MCpOMyrjk+IE0jLGgqnMyE7zdr3BGf
	 RM4mWhU9IM9S3AbDbFjH6JO5dhA01s9fZfRCj8m8l9a7phjyK6IRiFYYpR10OEzgz5Z6g
	 VyzvQe2CkPY2nvzf3wJtp8+P3/BxiHx/xnx3b1jIvkegK0+yB23Ip1v9K7rFxnt6j+4os
	 H/DMOisOM3AoUNlvz3HfP+QxjTfui+jb18D04NIyc3uQr3WRqlOudkYd7GjW9LCMiYXBw
	 YGi9ut5rXrOYlale5o7+48++iqFO0JZFyGUMP6y23DTy2nux7onf1bv9jdWmedyIDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLVExkpx;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB3606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEB3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLVExkpx
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so868244c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794573123; x=1795177923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1TRAHROLyPFOQPbURw5yPb6dBc0t0u89LYQ9L587dP8=;
        b=MLVExkpx2qb041Lo1+EEKnpOll1GwogqsePOtzcC+Uan59pliPfNjZaTgSF0Qmnt0T
         Vx5HK7GPZIOZj7FOt932Z9SyZjls6EysD36WiysumITf3d9jsw/40pMDazVAW7sq/JsA
         kfu/+KbG9Smb8jWuPnno+OBLV064yripH3YFwgcNz/OQfSj05pJY4gclLomHMGCeC08s
         11n2aK77LauLZI0pz08yjAbGYET5DESvnELOSzYIHZwAer6452n8mRl0QyBrzPhALOrh
         RFe2xZ0RIJQeTpd4raVMbs8LsLYnX9xmxZk5j91Qan9D3fZkFzxbTnUslDWFaymd3gM/
         Felg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573123; x=1795177923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1TRAHROLyPFOQPbURw5yPb6dBc0t0u89LYQ9L587dP8=;
        b=m7p6cqj2VDPc5vnT8U5bW0HbHFdtVfVS/jHejaPp+Xx7uzi4FhhH9q7/5zEnjbeORC
         IkYdVJ0YJ82U3qRMNH6BgS/LZlLKIkWdfDIoja/nrXFPdWh+9+G14V8TSLFIMywuWmVB
         0rylbd9NW9IqeJrAo734p0mvr+loaSKlfakP0RzrhCwEkf2mV6hJe0kSODGkDqckXbMw
         KJ4yUNh/IN7GWmm8hv0dUpG4AnEgoHfBbDFP+2gWUi4QFVI8PbtuZxlOIStcTsziaE8L
         eWiOuIcQjslDeieVHXQB199sQC6VdDTOmwcxr/q41TWsZLVRdAUDSK4RF/2x03BgY+kv
         WIsA==
X-Forwarded-Encrypted: i=1; AL+hErFmtSXlUgIYFkP6fiqBfxWK3j807rffC6JRmrX2Eh6ZnYsUMvcTMA6XKH6XIAavLh71BE70Fsf5s2tQ+JU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pdjV8QYUUahGXZUKZHBqM85FXPhWgh7eZvyPSdO6mjuIbnS+4
	8CV1jtCq8IUlkL0UIbXzHCMIGogld/Sr2F1wcXfS//mUnH+GH/2gucp3
X-Gm-Gg: AYBFou1leWCXVR/EPAb33a5jMOqCqubLiCikRE8JQB8YBA0lfQ0De7qJJj16HUxCGo3
	5asMG30+XEDqZpIgc7ImHkwj0dtu3KggM8D2JAiPnkup2cc3aUHWwHF+TntSaYW8DniT+Ah5h4H
	vSAHPD6uvfN19ypLikMcknhhRtFAz5VEiNy2hUpLEhWPS9URQsc5gbdtNIlkP7np08ESRl4YPJi
	oIDGOl0pX/4GCzUnYsWNdB6cq+DC9dlWHTJBE7h0jnNtZIQpymg5FjThH3ZmvswTj3UgU/9I4lH
	kvNVaq3Onenjt3vaWLFArftAM9uvWa4/lqaFR5/XWBGgx+W6uCoAMD64lVR3+OOEUKRMoN4ZgYK
	zEbvk40avloCwDA+jL82Im72LbfnqIIlgU7+GjdR9Fo3IG+ofYqBqQVX8HAE+EpEOxNl+l4SImN
	ywb8z9oJiZSkdg/vm0VvWhGivqcVMkPrxBSv6k7QozSU0Uc7ArGxVjMEx65/GrwWuMtR4jstfed
	0GNL4z6ho9BN0O76BbS4Xy1JvhX0Q2AAatb/OHpOp62Ztr8wuVPagoARtPGmotk0a8iKJ1FfJ1c
	LeeEhXO5YXa+2RKX/i7+As2TLFHqi1+2DMFBqRBdErrv9C0fEwcniwQ=
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr2139549eec.11.1794573122574;
        Fri, 13 Nov 2026 04:32:02 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm7215936eec.10.2026.11.13.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:32:01 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 2/3] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
Date: Fri, 13 Nov 2026 18:01:37 +0530
Message-Id: <82c4973addebd82923c460cb44221f5b76146afe.1794572365.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794572365.git.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On book3s/32, a kprobe on an instruction that can't be emulated and has
to be single stepped out of line, crashes the kernel. For e.g. with the
following cmds...
    ~> echo 9 > /proc/sys/kernel/printk
    ~> mount -t debugfs debugfs /sys/kernel/debug
    ~> echo 'p:wx filldir64+0xb8' > /sys/kernel/debug/tracing/kprobe_events
    ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/wx/enable
    ~> echo 1 > /sys/kernel/debug/tracing/events/kprobes/enable

...we can see the following crash:
    kernel tried to execute exec-protected page (f101a008) - exploit attempt? (uid: 0)
    BUG: Unable to handle kernel instruction fetch
    Faulting instruction address: 0xc02b919c
    Vector: 400 (Instruction Access) at [f19a9d60]
        pc: c02b919c: filldir64+0xb8/0x2dc
        lr: c02b9148: filldir64+0x64/0x2dc
        sp: f19a9e20
       msr: 10029032
      current = 0xc112e900
        pid   = 102, comm = ls
    enter ? for help
    [f19a9e20] c1a8d420 (unreliable)
    [f19a9e50] c02e4074 dcache_readdir+0x208/0x2a8
    [f19a9e90] c02b8c5c iterate_dir+0x88/0x1fc
    [f19a9ec0] c02b96e0 sys_getdents64+0x88/0x198
    [f19a9f10] c0014400 system_call_exception+0xf8/0x20c
    [f19a9f30] c00191ac ret_from_syscall+0x0/0x2c
    ---- Exception: c00 (System Call) at a7596164
    SP (af802310) is in userspace

This happens because on book3s/32 the exec permission is per segment
(256MB), not per page. The page tables have no hardware exec bit, only
the segment registers have a no-execute (N) bit. mmu_mark_initmem_nx()
sets N on all the kernel segments except the ones of the modules area.
So nothing in the vmalloc area can be executed, even when the page is
mapped with PAGE_KERNEL_ROX or PAGE_KERNEL_EXEC, because _PAGE_EXEC is
a software only bit there and the segment's N bit is what the MMU
enforces.

Before commit 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes
allocations"), the kprobes insn pages came from module_alloc(). That
commit moved them to the whole of the vmalloc space, on the grounds
that kprobes use a breakpoint and don't need to be near the kernel
text. That is fine on platforms where the exec permission is per page,
as PAGE_KERNEL_ROX is then enough to make a vmalloc page executable.
It is not on book3s/32, where the modules area is not only close to
the kernel text but is also the only page-mapped area whose segment is
left executable. So the insn pages must keep coming from there.

Hence, use the modules area for EXECMEM_KPROBES on book3s/32.

Fixes: 1b750c2fbf82 ("powerpc: extend execmem_params for kprobes allocations")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/mem.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 77b63b52d8f2..ae1bc7359353 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -391,6 +391,7 @@ struct execmem_info __init *execmem_arch_setup(void)
 	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long fallback_start = 0, fallback_end = 0;
+	unsigned long kprobes_start = VMALLOC_START, kprobes_end = VMALLOC_END;
 	unsigned long start, end;

 	/*
@@ -410,6 +411,11 @@ struct execmem_info __init *execmem_arch_setup(void)
 	}

 	end = MODULES_END;
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_32)) {
+		kprobes_start = MODULES_VADDR;
+		kprobes_end = MODULES_END;
+	}
 #else
 	start = VMALLOC_START;
 	end = VMALLOC_END;
@@ -428,8 +434,8 @@ struct execmem_info __init *execmem_arch_setup(void)
 				.fallback_end	= fallback_end,
 			},
 			[EXECMEM_KPROBES] = {
-				.start	= VMALLOC_START,
-				.end	= VMALLOC_END,
+				.start	= kprobes_start,
+				.end	= kprobes_end,
 				.pgprot	= kprobes_prot,
 				.alignment = 1,
 			},
--
2.39.5

