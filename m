Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593930;
	b=KjzWAm3GzBXJ0o237jkkXYJ2H48YjRAyLA2HLZCm7sCHY9PGndcPv0hUOzvmJhTak+Gb
	 sRYiRExy/k8lPjMHbEGpMliCc92G+HdNGI9Ku4uhn4VCJ+jvF3OD4/HPtFy6hnlSczqm8
	 szTI3Plyqz6Kze3A3QLG8TMfhNAPgKVFg63Kw/gsfi012B0n38Kj/AJKjIaip7v7MQABY
	 gkUUBLYlTbIcFMfP5liomVjMqoeko2rDFdfht6vT+hYT/p5od6IaqG6U3JDMJkVVzvUdj
	 rQ7Ji0sN6ozIyjyJc9tDyw6ahrP9DjAqNfs0rMpNuA98I14bF1g2MM602FNDLs/34Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GjBHhwWOEQdir2yWO0JK5yCpRCfdUmaiz711T6ehhgs=;
	b=sVqR1iItkIf57Pm2fDMoHwWW9cMbBg1oIe6WbjG9ln99BhBahHG2JSawd51ggD6uUe3X
	 WHF8gyGbVYYtkrDAQlWTErTSLLomTW6xqfWeiLZr+uw5ntDmvn6b4UuC4N9bI/tloFFUR
	 AmGsXXs2R2ofLd91M8fFCw6cy4P7oKpSvRuxSOXz0SMF7Uie1L3iDb+kitTskyVdTCZbg
	 EBKlxWepEoPPG/b7tkZ3u/Jvz8o9A/sCi8vaJ0rNodkE8ShtnoI9S3p7KcBhP7fj/ZA4J
	 Iz1PNlg2JuTWeierUKhfXe0vrDMkG9H0yOIhBUyLTa3nH7dD6e1o6+JBHMOxwHJ1PVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f2Z4K6WH;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BD606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f2Z4K6WH
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so112592c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593929; x=1793198729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjBHhwWOEQdir2yWO0JK5yCpRCfdUmaiz711T6ehhgs=;
        b=f2Z4K6WHXcBTkcQmwbd5v/97QtP1TJg+ZEVBRV+UnSZyJI/53QD3T34+x3XSrEd8Fm
         M1ICQzMGcWHQKIf1qiCK4sA8raGQaxn7+JQwQqFnqLXYZ12qGFZ0DT792CCKwc9+n8HP
         gBHkvu2QgSoKFL9c5lLJ2nBXpl4je/ZfVBFBMMe/qFSU9L/f0yDcag0eVxRzt24McorV
         BNQ37L8FZFudUvKJ2LyVC9hcyqcac3IZut+/41GINe0+6vXEG8gwy0cKYvD0rkLno4Kq
         AlxjQewsOKDgGS+ui/ou48EEHYJg1OoVkc9JuLzKoMM9m3vkohyUWTzXRlGIiyND5iFI
         jAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593929; x=1793198729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GjBHhwWOEQdir2yWO0JK5yCpRCfdUmaiz711T6ehhgs=;
        b=HKkegCSijXXKbcMAvVZls/INUb/OVGy8sqXD+URYpxKjbbCFf4MBAZm2vNf7jFAWVi
         xbY13hb4fji7e4+iaF8ZJ/Qc3JSQqy3TFcWhdBUCJfhjbk3GwQN/i3ujKRujrapE83Me
         nI4MPknKwPKdPC/vBe2DrQAFw5Sejm8/6VEn9HAzGTt7N4eoqd0K9PfQdwLsRuCLoqQT
         TYK23uz7CbZrqBNddB71zgvkwq2nJfcMNMZqWo/zMcMoz3J8AXXRihD6PXgnotJuwYsn
         vBCdgWIGk6mpMFINlYvonkWuJtXVLQF+DEfThTqaRmyZ2bxc0vd9G1HUJGK0lSwaYOpw
         xaNw==
X-Forwarded-Encrypted: i=1; AKwUvByxkzcUHCGGAkVFgUAceYG+VqC5DeTA/rCv6hjaCnYoSrlJAynuRkv0J1vAXxQhPNoefOhu3GEs8SZyDjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6ps8G9T0YdqTkDjqy3MBoGunFTOYZQIb0Lr8sFWus45tDYs6y
	1cG5ciFRGQ3H+wswbqDzxGGDaCkPy3V8A7USJXmzGAfxAwRDgTBxrMfs
X-Gm-Gg: AYBFou0kx0OqAudCVPVeWWPXLCJk8ZuhaMOFbT9+bdr2BlBrpLIk19yMB6rohLmSNuv
	Botz0sBlJRHD6PQQvEdQSBKw+FGKtbowpwhGXAMpd5SlqK35zWN+8Y/4JhpJligvkY7gZT+r2Nr
	By5CtYM0f55pxXOJCYpaBT5L/uLKvK+Fjb25JdUakjHk4wYG6irr05PlxP86Z4rJKyk6E8FYScm
	qgbGMTc9caqS8JwURn8C4kBVC/1iFla2n+sOywqN4WVK9LUhSKLOGIVqS/cb29+8mvL6cP83tpZ
	ahXD6YsXdnp3EmvBBsHzSqUGNbfukjjEmbbVNFGtKW2+5DHs51n4PyZ1fWbOxQLnpt2W146iX4L
	1OJ0mHNFg4B3hu2TCPd3QsjfpQISwonh6d35TxHpCSaBcOShD3Swcx+OG39I2ksoDG+5hPqB+Ti
	mgoNb/GO9/NxQb6+4Wb9wXe22/CzF+fWks6oAaCiONgBc3MIE4gmNx+A6YgxS8QHDs0e/nfYnnO
	SlGtgaRpRE+K75YhvRzu7z1AZrvgqpjfPL+5ldG4tjDMXeJ4Mc+tv69WyeO7JzzU5mFMcxvwIw4
	ssKjUKjaE4ZXMp10c3LoQrKyPA==
X-Received: by 2002:a05:701b:4550:10b0:150:1cea:31a8 with SMTP id a92af1059eb24-190a4ffa89dmr2992796c88.19.1792593928842;
        Wed, 21 Oct 2026 07:45:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm6415308c88.3.2026.10.21.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:45:20 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	mkchauras@gmail.com,
	msuchanek@suse.de,
	akpm@linux-foundation.org,
	yeoreum.yun@arm.com,
	agordeev@linux.ibm.com,
	mchauras@linux.ibm.com,
	bwiedemann@suse.de,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Support for generic tif bits
Date: Wed, 21 Oct 2026 20:14:54 +0530
Message-ID: <20261021144453.232372-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
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

After the support of generic irq entry/exit. powerpc is now ready to
use generic tif bits instead of arch specific ones.

Enable generic tif bits for powerpc arch.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
This patch is applicabe over
https://lore.kernel.org/all/961c058f3f3e03045552186c083a68a0fde3f43f.1791975972.git.msuchanek@suse.de/

 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/thread_info.h | 36 +++++++++-----------------
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7f7910f38a67..e5527b56159a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -255,6 +255,7 @@ config PPC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
 	select HAVE_GCC_PLUGINS
+	select HAVE_GENERIC_TIF_BITS
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 4b7ec1db3034..4df3f4b5bd56 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -93,44 +93,32 @@ void arch_setup_new_exec(void);
 
 #endif /* __ASSEMBLER__ */
 
+#define HAVE_TIF_NEED_RESCHED_LAZY
+
+#include <asm-generic/thread_info_tif.h>
 /*
  * thread information flag bit numbers
  */
-#define TIF_SIGPENDING		1	/* signal pending */
-#define TIF_NEED_RESCHED	2	/* rescheduling necessary */
-#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
-#define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
-#define TIF_PATCH_PENDING	6	/* pending live patching update */
-#define TIF_SINGLESTEP		8	/* singlestepping active */
-#define TIF_NEED_RESCHED_LAZY	9       /* Scheduler driven lazy preemption */
-#define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
-#define TIF_NOERROR		12	/* Force successful syscall return */
-#define TIF_NOTIFY_RESUME	13	/* callback before returning to user */
-#define TIF_UPROBE		14	/* breakpointed or single-stepping */
-#define TIF_EMULATE_STACK_STORE	16	/* Is an instruction emulation
+#define TIF_RESTORE_TM		16	/* need to restore TM FP/VEC/VSX */
+#define TIF_SINGLESTEP		17	/* singlestepping active */
+#define TIF_RESTOREALL		18	/* Restore all regs (implies NOERROR) */
+#define TIF_NOERROR		19	/* Force successful syscall return */
+#define TIF_EMULATE_STACK_STORE	20	/* Is an instruction emulation
 						for stack store? */
-#define TIF_MEMDIE		17	/* is terminating due to OOM killer */
 #if defined(CONFIG_PPC64)
-#define TIF_ELF2ABI		18	/* function descriptors must die! */
+#define TIF_ELF2ABI		21	/* function descriptors must die! */
 #endif
-#define TIF_POLLING_NRFLAG	19	/* true if poll_idle() is polling TIF_NEED_RESCHED */
-#define TIF_32BIT		20	/* 32 bit binary */
-#define TIF_SYSCALL_RET		21	/* syscall error value set */
+#define TIF_POLLING_NRFLAG	22	/* true if poll_idle() is polling TIF_NEED_RESCHED */
+#define TIF_32BIT		23	/* 32 bit binary */
+#define TIF_SYSCALL_RET		24	/* syscall error value set */
 
 /* as above, but as bit values */
-#define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
-#define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
-#define _TIF_NEED_RESCHED_LAZY	(1<<TIF_NEED_RESCHED_LAZY)
-#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1<<TIF_32BIT)
 #define _TIF_RESTORE_TM		(1<<TIF_RESTORE_TM)
-#define _TIF_PATCH_PENDING	(1<<TIF_PATCH_PENDING)
 #define _TIF_SINGLESTEP		(1<<TIF_SINGLESTEP)
 #define _TIF_RESTOREALL		(1<<TIF_RESTOREALL)
 #define _TIF_NOERROR		(1<<TIF_NOERROR)
-#define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
-#define _TIF_UPROBE		(1<<TIF_UPROBE)
 #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
 
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-- 
2.55.0

