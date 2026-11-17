Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888799;
	b=F13pAqzCDXwtf69xOUAcaQP5cvUPNefchmCemV0PSaPApZg6msl4WlUy1YpxffEABREZ
	 06TVTSx6K5tten/2DFnxiEPOk3v8qapEICB4stAKsxeGDhtuAgsPYmpWM0T+hrqL0lG3j
	 1w/4SFZdXakkHIcu4Fq5ywWxJNvM5fzJe4aQUJs0Pn1pGCvVeO3SKPHIAUmwz8keBCZcG
	 IyNRxfy2mPJN8IMDbfav/BG38EVuw+GEOIA/rZvOCb8CndhFKvUMC1kO5UeiAHakkrWQf
	 +earZUw838SbR+hTMVz3I6JxiNCyjhVxIRC1DW/PFwrfIJuEup1cgZL9vWTBro/RYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlsaCHEk58qGFGAb0OAbGJOtQIRxROfDzkwINL2H/Is=;
	b=LTB3/D4Q0SpdeRT/FK1YvkRrPxFFF+UzFCgxja3p3CalJ03vyiCocthoBzpbm1uZnPDA
	 rJd0MmLffacndrT9NJQ6Qf6kkSRTjYMyrKpOpjHE89e8Dyg49tduw57KGf6oHVDRsen0k
	 4tUHcKf7XMweB95rUPIbUscnfcY6RVNkyrX3a14Nva/syf5gXO6PIG+sreHPFDUkE9EfB
	 8cGFThWMlaEcLPiZ3+yGL3vdtKZx18PZIJlBti6/SSXE+r9/8xjdSPlyV9yujGIasno4k
	 PdM6EK8kZmzxZnxoDYOffpFV8ABs9b7hgxZQh4YfINxJwi3LsoHXwBRW8qGS+HAm3AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyJfoHnU;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722B606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9722B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyJfoHnU
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3ada81853so3884584c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888799; x=1795493599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlsaCHEk58qGFGAb0OAbGJOtQIRxROfDzkwINL2H/Is=;
        b=iyJfoHnUTBykVGNRk/qWghsqblBAOEcjQgETQqN6NXMfhMNtYHZDaTlfcAnGCioN9v
         3HZBUEIZRfGpt3Iuu/d0m9NJmxBgbtWJuDRJ/TSLORhOdxrw9q6Cgp1tlM9Z5SKAyAGD
         VZIxrCVgTH2XbQSfV3oFuvNicN0Tg5qU4GBBrYU7lFS6tUja2Sr5mRlEhpCWvpLjTgyu
         xfvQ8jAXcYOzDSZw3AOZdMWRzMvBcTgCEUBlEOR8si1ex7ik1vDivlVcqbTS2HI02THf
         bKS4X6by9bvwhE9pXV5Cxbf/a6NBmlHCO1TUtDnDobV2u0BypC2pqHAv9JcOa4NUghVd
         93iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888799; x=1795493599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlsaCHEk58qGFGAb0OAbGJOtQIRxROfDzkwINL2H/Is=;
        b=CuD5EGeeM0WxSHF1bmsDdkKFlp3/pCbifFtDg4719uMeXhIu2NArZh9s/hLur40dp4
         wZBOB8r1bjMYMztypEMn4VDjbCEUqu5/h05BhshqfLXBYOa8k7VbP0T+lh//Nmjoe/De
         WkYDnGbc3EmvJqIrGwUNuTNyoBuaD4jyJ2/3kpaqfX11SDskd3gUqzrF7OrOs5PwFwec
         984WnE47R5JO6Qlygmex/fW2citAM2Ck2shtHsvCnnVjVvj+Ljw+O3b3Owo9srtSOMSi
         14rswEXmlOx/Nz2EqNwk+LSqEqfdWlHWuC+9Ada0IocgWfMLG/DwHF++NBjHDNLxvpdT
         zGog==
X-Forwarded-Encrypted: i=1; AL+hErERfwbSbchR7Sf/3g8G+nU5hJSGmdRJSjm06vx0h3V8CrJeHgbBHNe0MRDL1lu/BhdErrU1WukuWxdUYtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pjJ7I+kgWiWowqfgn9+4cDVJLNC8rCKLCHFxKep/CTq5VZq7q
	mMvteaQaYOcedkcoW7axrM6/X1xp48ZvgPK2r4rDeOv8yKySwkSyWEzy
X-Gm-Gg: AYBFou0qDOdtQx2qwxvBAT+6+QLV28XT/Jn3kzp3fBhIxiwNTNUq/NHsn7Eu0QDs13c
	nKPDOEZfk8MCW0UB0kOsQlHTRFhBuGA4oEHDlbyM88nyjf5rKm64tudLcl7umwtUxgX8YCt1I+a
	gtzJwzmkqHV2gJAcr3K58HbkIoqxYJ+bzawIbVHVD1evUwkOj1OUcUDOJLeTVX9Yb6jxhA7ErEJ
	dfUSoZsX6CaL+3vH6uah1SbsznF0XQZvBqkCKG8bb4I8qVyau5OBGSdrWR+sDgFAMPbDB9qq5JY
	1kC1pkdnUhHri6As3Urait/HEB7p1oB44GeUk/N5FNCV/MNK+7e5f133Omxj3uELxJhlW3jXfru
	TRRRa1vzwxaQ+Eh7u+zuTdMdqRxg9Nf76B/IAf7IUY1iZWQx2a1Z9MtO42o0N5rTTu2INDxv9II
	h3BnVOl8Sr+ZXTzyzqtBUbdEIowINaOweLVnTy8QrVjo5KzBBsTTUZYhsmsFQJX0pO6FCvQ6h8h
	Ld5ypXSFQF/wcuXkZB74e7a62lVocmjn8eSXlhUHIhXMPLsBRAg4OmdENUkBuq7JDBB37SmBq37
	KL5G4XadIV0Mq6Y36BcQu+zMQZBeQ/4PUQ==
X-Received: by 2002:a05:701a:cccc:10b0:1b5:3616:599d with SMTP id a92af1059eb24-1b536165bffmr2485931c88.35.1794888798411;
        Mon, 16 Nov 2026 20:13:18 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm40433851c88.14.2026.11.16.20.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:13:17 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
Date: Tue, 17 Nov 2026 09:42:53 +0530
Message-Id: <a2ce5073c33127d04aed012e586b2ba708d7ff26.1794887659.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794887659.git.ritesh.list@gmail.com>
References: <cover.1794887659.git.ritesh.list@gmail.com>
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

touch_nmi_watchdog() can be called from preemptible context, e.g.
sysrq-w via /proc/sysrq-trigger. The powerpc implementation uses
smp_processor_id(), so with DEBUG_PREEMPT we get:

  root@buildroot:/# echo w > /proc/sysrq-trigger
  sysrq: Show Blocked State
  BUG: using smp_processor_id() in preemptible [00000000] code: bash/238
  caller is arch_touch_nmi_watchdog+0x3c/0xd4
  CPU: 0 UID: 0 PID: 238 Comm: bash Not tainted 7.4.0-rc2-00029-g7664547149ae-dirty #126 PREEMPT
  Call Trace:
   dump_stack_lvl+0x138/0x150 (unreliable)
   check_preemption_disabled+0x120/0x158
   arch_touch_nmi_watchdog+0x3c/0xd4
   show_state_filter+0xf0/0x338
   sysrq_handle_showstate_blocked+0x24/0x38
   __handle_sysrq+0x134/0x3a8
   write_sysrq_trigger+0x178/0x22c
   proc_reg_write+0xf4/0x150
   vfs_write+0xfc/0x71c
   ksys_write+0x8c/0x150
   system_call_exception+0x310/0x590
   system_call_vectored_common+0x15c/0x2ec
  ---- interrupt: 3000 at 0x7ffd01755b98

Unlike the generic version, which only sets a flag, we update the CPU's
timebase stamp and its SMP watchdog pending bit, so a migration in
between touches the state of a CPU we are no longer on.

Disable preemption across the update. While at it, let's also mark the
function as notrace (since we might be within a tracer when this
function gets called).

Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 44f178e07531..61b67dde04f2 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -456,12 +456,16 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }

-void arch_touch_nmi_watchdog(void)
+notrace void arch_touch_nmi_watchdog(void)
 {
 	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
-	int cpu = smp_processor_id();
+	int cpu;
 	u64 tb;

+	/* Callers may be preemptible. Stay on this CPU for the update. */
+	guard(preempt_notrace)();
+	cpu = smp_processor_id();
+
 	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
 		return;

--
2.39.5

