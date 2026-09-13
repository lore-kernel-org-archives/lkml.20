Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59035E1D5
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789305495; cv=none; b=hATuKYJ1r1H0U3WH4VsmQvAWg4O2AWn6/swKigDGEMa7zdHJFSfowF1QtuDGuz3lPyHckFpis70DxYu9z7qFBK20z7ED9AbNdemx6dXalE3pf25jJPja4Cbe7FwgbF96jwhRGnIspF32yl18delq+EglPWCOxb1oPredGjeT8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789305495; c=relaxed/simple;
	bh=4PBfJSsN7kfeIgqBGeuu+hMW/kpXMUAKD5X6y3N1qrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwABkNXC2ZSXoMmHehoekEggVnDi426jWHXPqL7RRR6pZebVQ6u19/ksH8KkYXnZqMGG/96JFj2BaK3t6gvD9FmhVwZ85mBGOB7uQdies/VkkCiTZqN0LOT/7B0DHMuBVM13chnoCiyUS1ZUY4TKV1FxwPpSTsRY8i9BkzPp4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=uwI2thGO; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="uwI2thGO"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fb7488033so137065d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789305491; x=1789910291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSb+qxGlYbynh0pp1CPDDM0oB9qczgGLF2ehmN4RM+4=;
        b=uwI2thGODyouTNLNKuvdqOaTUrTfyCv308eDUvk2GA2LYHRVQTucfNrSmlub5bdM3q
         gT8lSuDfyjieTRKY1ST/W8mzbtRWJmMF++mmp/riLcsmrOctEsb4IOyoz0GydsMJK9PV
         eAzVPignTDacljuf747q4tJ9QSUpfQPx1o/lbLrt/rf6Mvnz7HxAcMvrycUGJzO+S9NL
         yWzGvBkYqdAFUFEN4RDXOf2yAtsAjyPXFVuf1mTx266lHCcf0jfJg8Vhx75jos1mXmZT
         B91ehDThZS7MWobTILEmvGM2kh3aapfujD5MJKjAtQeUBAVvzS8x67Fa0W7ujDwULIF5
         pDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789305491; x=1789910291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LSb+qxGlYbynh0pp1CPDDM0oB9qczgGLF2ehmN4RM+4=;
        b=AZ1A08gtGu+QwPuDcAJX8adAnMmdJA0A6WaWiNxLK2+elCkm2034ADv8x6uSLnprQj
         g3FaEXt5LoPnnltNt3uALef2d/X4qbGyI5/boTQar4F3L5di8oILkJOwsCd0JxQAFY9y
         Xe5eTmAKnmzVvXC1HTVWcD/pV3eC7qBjtTqoyXrzrbthdiLMdv9QD7vrFsMhTC2ttws1
         BlexMhc9vcWwpqIfGWuBj31EM9kNsXp18wm6qEB2gpWsgQHJdvfK4Esq/eNdbV020kbm
         gNDu2zxlNyRDdC/9kSlSCa9Dop8CLYurozobgN9JBHtpAn8jV1oi0TMQLTfZaev+0xM7
         ryzA==
X-Forwarded-Encrypted: i=1; AKwUvByMCZcoPdkpc8yeEkULG28OOdlSt2R+8dMefH6gMGXktS/qdqor1MmBe0StNqoKmouGU74WcPpIYGQrl1A=@vger.kernel.org
X-Gm-Message-State: AFuF++kZhKAqBe1dI7njqM+hw4F9ULng5/EAgB1bOIIsmnu9qqgpcBcU
	lxV9ckYkLICyO5Mv8oijysYzot52MwJgvxzW8fE4fb+n0rJoRRx2zQRY9Q2jgPX1WgUv
X-Gm-Gg: AYBFou0XiovyEoWcCMTO1O2xH5hS09DtcVidBls2xD8NoGWgvr+L0PKmaT9BgvDvDCU
	vgE4ovq4jsaX27CYUTDSW4ls0F3bg+8rsNVmyq824RkBgz4EUvGyLsCCELT9UnvszIOxSRkz8/8
	HMjCDIgD+0NnIWnSKZ21s2CaredV099KTG4NmLG+KyzKOXzrsgx3AwtlmxVUV2o/+Ejz/9ovtP3
	ubYS+GgPFVPZI5LfkJ8HRxrmt/yhecV8meKVE6j9LInQW7IyYkCSpxsgtZEMuTyTNirSkrzxE+d
	Eeow8Qb9BrVBr7IYgi+w4F66UEgYmv7irtqrOHjtLlI/YQVo9mJ5EnZv/6Egc3A7w5PEmzGOkhe
	VDGX/Ei2i2tM9KaiC1Zexf1ANuTlkF9RmBJG3x6riZaHqBA83ocsdaSr9KMB6yqVU57jEtDdkAz
	Qg7EI92h+Xb8gBpVPbpQDHF9IFPAxbcDjeelEl33lLC/l67vsMG2L0l0uWouIupLHUmPOuXwDyI
	438lCadXj35Gd58pWWmeDFcAiBfj8MpoPmgzygw
X-Received: by 2002:a05:690c:b06:b0:862:1f26:d489 with SMTP id 00721157ae682-884b1a2f84bmr50752127b3.3.1789305491416;
        Sun, 13 Sep 2026 06:18:11 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88488c3ab26sm27731697b3.40.2026.09.13.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:18:10 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] m68k: Fix seccomp filtering on ColdFire and 68000
Date: Sun, 13 Sep 2026 09:17:53 -0400
Message-ID: <20260913131753.605893-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912230651.461269-1-clusk@northecho.dev>
References: <20260912230651.461269-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

m68k selects HAVE_ARCH_SECCOMP_FILTER for all configurations, but the
ColdFire and 68000 syscall entry paths only branch to
syscall_trace_enter() for TIF_SYSCALL_TRACE. TIF_SECCOMP alone falls
through to syscall dispatch, leaving installed filters ineffective.

Test the combined TIF_SYSCALL_TRACE and TIF_SECCOMP mask in both paths
and route either flag through the existing slow path. Leave the classic
MMU syscall entry implementation unchanged.

Validated the combined test under QEMU mcf5208evb (ColdFire): filters
denying getpid, openat, unlinkat, and reboot each returned -EPERM. A
classic-MMU control (q800) denied the filtered getpid syscall both before
and after this change. The 68000 path shares the same source-level
omission and receives the identical masked test but was not separately
emulated. Compile-tested W=1 with CONFIG_SECCOMP_FILTER=y on both
m5208evb_defconfig and a custom no-MMU UCSIMM configuration; the latter
built arch/m68k/68000/entry.o and vmlinux.

Fixes: 6baaade15594 ("m68k: Add kernel seccomp support")
Cc: stable@vger.kernel.org # v6.3+
Suggested-by: Andreas Schwab <schwab@linux-m68k.org>
Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---

Notes:
    Changes in v2:
    - Combine the TRACE/SECCOMP tests into a single masked branch per Andreas
      Schwab; scoped to the ColdFire/68000 paths, classic MMU unchanged.
    
    No in-tree m68k defconfig selects the pure-68000/DragonBall path.
    Compile-tested W=1 with a custom no-MMU UCSIMM configuration and
    CONFIG_SECCOMP_FILTER=y; arch/m68k/68000/entry.o and vmlinux both built
    successfully. The combined gate uses the same flags byte as the classic-MMU
    entry path.

 arch/m68k/68000/entry.S    | 3 ++-
 arch/m68k/coldfire/entry.S | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index c257cc415..0d3cbeded 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -79,7 +79,8 @@ ENTRY(system_call)
 
 	/* Doing a trace ? */
 	getthreadinfo
-	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	moveb	%a2@(TINFO_FLAGS+2),%d1
+	andl	#((_TIF_SYSCALL_TRACE + _TIF_SECCOMP) >> 8),%d1
 	jne	do_trace
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 4ea08336e..d658abdc5 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -72,7 +72,8 @@ ENTRY(system_call)
 	movel	%d2,%a0
 	movel	%a0@,%a1		/* save top of frame */
 	movel	%sp,%a1@(TASK_THREAD+THREAD_ESP0)
-	btst	#(TIF_SYSCALL_TRACE%8),%a0@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	moveb	%a0@(TINFO_FLAGS+2),%d2
+	andl	#((_TIF_SYSCALL_TRACE + _TIF_SECCOMP) >> 8),%d2
 	bnes	1f
 
 	movel	%d3,%a0
-- 
2.55.0

