Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275238;
	b=bvxSFRnHqhFZHU7VxwoQb9kuJUHEuNYZHUUUj7SQ5sjBSELVSFu1xWNq+bMWE+Xc8byF
	 RyR1qyPa7ld8XjC1QLI3fvPgwT6jqFAF8Yfo3WkhhEDMb+ajeyOdzdHxV19yGOhygr2fz
	 9bYugwK7KspuqMHejA12pdIUsjTcPM/e9z1pcZGwt0YZMZj6Pyff5ZlJ29m2/y026fcnU
	 3my1z1X0lJ1WTecDhFweTSGRBnl8d/zuDrROZ4dRF7lG1r/VgFY1Kn8JUDEAZOQKvnVCc
	 38CA5kGexnpogI4t4HDaChnFrMlpJKuTaTDssWCYJPmWlXU660vP0ygR+7WDhYZ8CFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mq8Ar0lLi/5kEOpfFLpnVCrLP0dRhJFYGmauCZHGg0E=;
	b=pAMjaw3PAbHmrFo0NbPm8o7B348TdMnVknN9/lBZ8Wk8O7obhUBe9jrkG8OBsxcn0x2A
	 cvzwPNpCQogbmDgpBXbwwibNOB0p+LGzJpF/CyPluxDTylaAxwf2rSPf6dLkMq1TPLBWj
	 dCeNulpz0A81KXTgvKFMIQDnXuSjWXKA5V2XBlToRGf5xK4hlvpxpKh9ytU+NzBZQ8qQ0
	 860nLTGZnrFvkGBwnmWhESQ8Zqa2rtC0Oez4KchKH9MPa7797AFyo2P87/Ulv7gsR8h6+
	 3izVE3kQEJMB2udYRNr6+UsWK7cbmtFcu9DPEU4tifWEgGbvsuHTcyiuq68OkUgOGsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHFOA5C5;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19FC606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19FC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHFOA5C5
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b308fca7c3so14354667b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275237; x=1794880037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq8Ar0lLi/5kEOpfFLpnVCrLP0dRhJFYGmauCZHGg0E=;
        b=aHFOA5C5TuZRwR/d7RwvQprInLq8HbGdwGS9BMm8DeN7c6DADn8mS2WcMONYVqiw8t
         /Fch0pZTbFIoQls2/KqSokZxRHc2upMb74dcdhobNOBE8VagSuVQ69oBT7wldPYGmviT
         f0SqavLG3oEU/MslTM3YyEGfUPtirJDyUYOBqLgr5z4H98j6vCslSig++Yvpm+p0OkWu
         HaqOJ9XOoIGiynBAxcxco1ezavWO0AqXaj+SLACpAGtEKTvHv3ibKrh9h/VfxAC50aNd
         M3Q6/nGw9Cxg52EwrUFYgoj7lVohVmDlIDOAMsHJSDvrumsUCXyIYtk/QMONt2ctCH4q
         9YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275237; x=1794880037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq8Ar0lLi/5kEOpfFLpnVCrLP0dRhJFYGmauCZHGg0E=;
        b=qqH9f5m9Bf+203+qUtQK5yUWqX9CnMlyTM17OuzXxiliiP8b1JdZmNUHsQsaKm9ftY
         PqhZcOpXIbbm6xdvsqc7TrKneg9Mo43kL9+ZvDt19/qsN9sFF1ShYuciPdOqdOH9EHLT
         JQweB3R4NJO16MhTme9QDlP+7At3Di82qGlBPEYnmPKHtX6ZwiVDL7i0QKJXJT4FfGhY
         dvIadH84rquUiBaNabCKYGRCuaaMT1wQz6Dp5eMiRnZevn9Z/qArSaI58OYHxGAEj8zz
         4vW14o6h+UpfEh5MqH0GdBXNwLdbDNPEhHLQi5wEenkryIHLXJLLAoQ0MvFOA6NSwsxI
         mbRg==
X-Forwarded-Encrypted: i=1; AL+hErGler0Y2RVeciK3ahETGTUb0jh91EkK6suiGbB/xAhQSxBsifMFxACg9fUQFtFuIHQ3qr0a28zRqon3gQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3OVpeoDDdXgCs9ISTWL0ugvU7U3/u2w5fDKtiSZqGtOzCEJp9
	VULn0nZ4dfz/Oxz2hhjH7PMOHRJa4x3EFweJZTP/nH8UGXAjJvD1Yx9n
X-Gm-Gg: AYBFou1338W5nYqN3ajsPciA23MeEtG5dAT550blmkg8ElkV0xqtgoUTCAuwPf/LYRv
	y0KVAPo6c9rSi2XJlhU2Rb4/s6bB6oHCnMDUxZOatVhzjOcGmu5M1rHL1vDDaRm6bP5s30JGdtR
	E4aeGkSf2njMEzmLsCA6K/r4WE2AH+IK0eAQ05ujHodkXXiT9BHoVt9EzdYlH5Z61qlL+yvqHST
	zAv546AzQKAsTxoL55lBXY64dUfdowMdEWDXlO8XJlv3nz4Xepy7SxADfSJv8vpt0Vmiu/l4Ou9
	US9jrkF8Sa4x9sVCiw8eGwiGzeax5GUxdtm2+w2QBc28hHQhUvz1Jm60Qo3j/Wn9ACSlv0HT/5p
	Zbks0dAwdUCuMC5P91IKJZqyFQd1pXvUppGJccdJv8SEqJ1pAhdXBskkaaUppuK3nvVtypjOeIi
	dh/QZiUY1Z5hzj+P3SE94qlJHFqRiR0Z2/N+8ESIupIpSCeu/of7n8keV9Y+z/ViYuK+joOC0WG
	UWo3MGnpBWHtpjbmWg4Q3T0HLzfkg8pOsWy0HQJ2vv3kOgCgr7F8kOgM5NUKAtVCY18WaLjiuW/
	cufmTXRrWPCC5jtSbSxJyYxy6tyvCNYZ+jkdw87cyUnpnFbJ6NEEq2TknAsraCU5Pi+Cs1pgm0g
	WwTOBiRVykQ==
X-Received: by 2002:a05:690c:ec3:b0:8b0:cc41:a124 with SMTP id 00721157ae682-8b392b705f7mr8737777b3.49.1794275236620;
        Mon, 09 Nov 2026 17:47:16 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a1cf3sm8399777b3.15.2026.11.09.17.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:15 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:06 -0500
Subject: [PATCH 7/8] powerpc/perf: Use SIAR for sample addresses on 32-bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ppc32-perf-v1-7-a6e8a55b3b48@gmail.com>
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
In-Reply-To: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4209; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IV87DZUvmybjN6JB+MieMd8HoMSlN7JVQzsooFUy8EA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU85dW3Djx/3Lh7g9o7pbNXUr42b9zf47lJtEae6n
 b9U+6/KdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1k88xMhzn31w8Qc
 Vls5z7ep8S302hNn5W9t6/DjmyPfRf8WEOQwPDf5fUlTodM3e+YdapYeI9vTPQ9mNg06qeGUVXq
 vy2Bl/l5gcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

On 32-bit, perf_read_regs() sets regs->result to 0, so regs_use_siar()
is always false and every sample is attributed to the interrupted PC.

The MPC7450 family's SIAR holds the address of the last instruction to
complete before the performance monitor exception is generated
(MPC7450UM Rev. 5, section 11.3.7).  The exception can be generated
with MSR[EE] = 0 and is taken once EE is set again (section 11.2), so
when interrupts are disabled the interrupted PC is wherever they are
re-enabled, while SIAR still points into the disabled region.

On a 7448, sampling cycles system-wide with --intr-regs=nip during dd,
perf bench sched pipe and find, 46% of the kernel samples have SIAR and
the interrupted PC in different functions.  13270 samples have their PC
on the instruction after the mtmsr that restores interrupts in
ata_scsi_queuecmd(), and 11661 of those have SIAR in udelay().

With interrupts enabled SIAR helps less.  Sampling a 32-instruction
loop with one store and one branch with -c 10007, 99.8% of the samples
land at:

  event             interrupted PC   SIAR
  r122 (branches)   br + 13          br + 9
  r014 (stores)     stw + 21         stw + 17

siar_valid() already returns true on 32-bit.  Use SIAR for PMU
exceptions, and take the user/kernel flags from it too.  Move
regs_use_siar() above the 32-bit block so that perf_get_misc_flags()
can call it.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/core-book3s.c | 55 +++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 10ded865583c..e4c8ecddccbd 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -75,6 +75,20 @@ static struct power_pmu *ppmu;
  */
 static unsigned int freeze_events_kernel = MMCR0_FCS;
 
+static bool regs_use_siar(struct pt_regs *regs)
+{
+	/*
+	 * When we take a performance monitor exception the regs are setup
+	 * using perf_read_regs() which overloads some fields, in particular
+	 * regs->result to tell us whether to use SIAR.
+	 *
+	 * However if the regs are from another exception, eg. a syscall, then
+	 * they have not been setup using perf_read_regs() and so regs->result
+	 * is something random.
+	 */
+	return ((TRAP(regs) == INTERRUPT_PERFMON) && regs->result);
+}
+
 /*
  * 32-bit doesn't have MMCRA but does have an MMCR2,
  * and a few other names are different.
@@ -108,13 +122,30 @@ static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
 	return 0;
 }
 static inline void perf_get_data_addr(struct perf_event *event, struct pt_regs *regs, u64 *addrp) { }
-static inline u32 perf_get_misc_flags(struct pt_regs *regs)
-{
-	return 0;
-}
+
+/*
+ * The MPC7450 family's SIAR holds the address of the last instruction to
+ * complete before the performance monitor exception was generated, so for
+ * a PMU exception it is closer to the event than the interrupted PC.
+ */
 static inline void perf_read_regs(struct pt_regs *regs)
 {
-	regs->result = 0;
+	regs->result = 1;
+}
+
+static inline u32 perf_get_misc_flags(struct pt_regs *regs)
+{
+	unsigned long siar;
+
+	if (!regs_use_siar(regs))
+		return 0;
+
+	siar = mfspr(SPRN_SIAR);
+	if (!siar)
+		return 0;
+
+	return is_kernel_addr(siar) ? PERF_RECORD_MISC_KERNEL :
+				      PERF_RECORD_MISC_USER;
 }
 
 static inline int siar_valid(struct pt_regs *regs)
@@ -163,20 +194,6 @@ unsigned long get_pmcs_ext_regs(int idx)
 	return cpuhw->pmcs[idx];
 }
 
-static bool regs_use_siar(struct pt_regs *regs)
-{
-	/*
-	 * When we take a performance monitor exception the regs are setup
-	 * using perf_read_regs() which overloads some fields, in particular
-	 * regs->result to tell us whether to use SIAR.
-	 *
-	 * However if the regs are from another exception, eg. a syscall, then
-	 * they have not been setup using perf_read_regs() and so regs->result
-	 * is something random.
-	 */
-	return ((TRAP(regs) == INTERRUPT_PERFMON) && regs->result);
-}
-
 /*
  * Things that are specific to 64-bit implementations.
  */

-- 
2.55.0

