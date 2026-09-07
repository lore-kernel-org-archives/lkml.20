Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BD03451CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764304; cv=none; b=pUg/KYweSbVcvD6DRemODDRfJ0N48Qr5rSNL7l4mr/h2fC7t14aANTQzL3Ck3+Q/RhuC++3SxeyT72iVB0xz3YaXQRNRrlQDkahUPXagSGONYH/cCc/6itdqNTQXsVwlIJ63IN7dhukuAh3BBN574DtSAIOoQAfmlNu/VBADP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764304; c=relaxed/simple;
	bh=9EY0Y5m/GS8W7s8oG5qKpewtqcKAoFSfghW1vooW0+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeEwStkQqq6IyTBPKUdax0g2c/L34f/m0YobUqp6LCcYj14kUYa5pU4nFi9KSrNGORtamRurqGX0RMQ1bVUm5ytLtLiX6rHv09AUTXoINsA4m2vZV6RZoovTxqWxmQDirSwbZkHTMatljo2U54HzNqAvdUzJk7g47/pJGBU9OZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZQfHrHp; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZQfHrHp"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc439aa0078so2595359a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764303; x=1789369103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCe5TfD0QadpbyK10EjO0HzHAhgEPy9BlCEN2gs/+xM=;
        b=iZQfHrHpbEVo4eSIka1Wuj3sGWqjXUcU9WCok5BHXyqfZRWKby7tb6RgxhZb/+dB0k
         T/F8/ZxliKvDuRciuV1TrHQbaCdmc3qmraeGF2edTTxPZFpI1ipIwU83v0mMHsE3xNuW
         0GO90QQMrEar7c8RzL3cgwtvFNlgY/OiIGux1JeMk6/NpxlLpozPbxOeuBCs5omNLhe2
         OSR/2xp5XdH3k0ACErshiW5UyXI4j0rGVS+D9vE75qrj4bI8OQlVsoV5ppuLeU7mdI9x
         yi7MtavimsZxqDMwoO85YRC2UUVTS9MC02eJw8IGxnUiHHIBYHm4Pe20H0SIN4k/VJfb
         fdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764303; x=1789369103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCe5TfD0QadpbyK10EjO0HzHAhgEPy9BlCEN2gs/+xM=;
        b=EGs5kNWsACgxV1Y8mjB1HLBsC+2n3J9iN0DK5Lf3nyuJMxHMHED8bKtKXjCnKgDE1H
         1zWHgTvVYrw5SeK48Aj1J1gey8btWWGuGsQ60Sgqu6Jc4bqFXZC/8mUYMjH3UA9gL84E
         XNnLHQFkRbb2rYpLyWZ26d2EZzoybvWbBK8qeiNMTRCwe5XxRjeYPlk8R5yAdLnbUdrd
         2GvAVBRAJ86MrC25CClKE7cQy5SzusU+uSZ0QBRFEKkn8QdEygfptFmrWaLvlhPYdDGM
         pn618JocAsusHaX5Pqr6FR/Tg2nYnDSn0G5NIujPQQJRtY2HMzSUVPOPdEOCXDbc4umz
         wTVg==
X-Gm-Message-State: AFuF++k/3/f2Le6pX03OUbVaSetc5Y5yU9PdwySmqME69HZOYUkWr3rI
	Py02ni1dbJFRfdNn136/nbZxNCzHu0qK7M0US1uIOvwLNNhPMOg8PHdC
X-Gm-Gg: AYBFou0MOrJjBu/8f9VG1WiCfIanppajkkUsozOHRp7c8pdQ1HSIXSuitGUurftXnhh
	Nv0jg1BEWTJ2TmunTFnZYf6wiwmMwMWlZDQmQAuQ1EwloPkzLTO95nUTGFZ0QZ4DXidHZsAQSHp
	Vg3E/3naKPvkD+hkwiqL2H1QoxdnWnrTNcJKMmH3Otevs6YPpgfrRWuotsvs27wL0QxdQ9tfENn
	alrIcTMtd4nUVZhURT+bIb1JKO07Ob6RmHOGGrrNgHo6tHWoHMljTLnoVXfzotgRJl51bXFW2im
	zJwNsHkzuu5fqF/EB98QIxlw6SP3b28Gm5ELEEu3p/01/6tDRsh5IIhdD7T5ilNoejwThA4z9O1
	S8gOVV/a+SBHYb+d70hk3Iz/9oQFbpjxQLllHmqMQFRUIWDbti8dpHEmoxhPYVlxacmhjtFwOT/
	HJ/YTeUDMWPgHEWnqwn1h4Oz/30nE8BFtvPFbgmlAXjrZkyGo3URf7tPL56Wl/FS0DuBnPB+sVI
	VmFZcMUmj01Vg==
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3da39b71849mr33044727637.6.1788764302848;
        Sun, 06 Sep 2026 23:58:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm39538255eec.15.2026.09.06.23.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:58:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org
Subject: [PATCH 13/14] x86: fix repeated words in comments
Date: Mon,  7 Sep 2026 12:28:16 +0530
Message-ID: <20260907065816.27878-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/x86/entry/entry_64_compat.S     | 2 +-
 arch/x86/kernel/cpu/mce/severity.c   | 2 +-
 arch/x86/mm/pgtable.c                | 4 ++--
 arch/x86/realmode/rm/trampoline_64.S | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
index a45e1125fc6c..e0cda8bfee77 100644
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -266,7 +266,7 @@ SYM_INNER_LABEL(entry_SYSRETL_compat_unsafe_stack, SYM_L_GLOBAL)
 	 * The original userspace %rsp (RSP-ORIG_RAX(%rsp)) is stored
 	 * on the process stack which is not mapped to userspace and
 	 * not readable after we SWITCH_TO_USER_CR3.  Delay the CR3
-	 * switch until after after the last reference to the process
+	 * switch until after the last reference to the process
 	 * stack.
 	 *
 	 * %r8/%r9 are zeroed before the sysret, thus safe to clobber.
diff --git a/arch/x86/kernel/cpu/mce/severity.c b/arch/x86/kernel/cpu/mce/severity.c
index 2235a7477436..da4db3c709e2 100644
--- a/arch/x86/kernel/cpu/mce/severity.c
+++ b/arch/x86/kernel/cpu/mce/severity.c
@@ -280,7 +280,7 @@ static bool is_copy_from_user(struct pt_regs *regs)
  * check hit.
  * If we do have a good "m->cs" (or a faked one in the
  * case we were executing in VM86 mode) we can use it to
- * distinguish an exception taken in user from from one
+ * distinguish an exception taken in user from one
  * taken in the kernel.
  */
 static noinstr int error_context(struct mce *m, struct pt_regs *regs)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index cb03f5a2b243..0f127a40f2f2 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -402,7 +402,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma,
 		set_pmd(pmdp, entry);
 		/*
 		 * We had a write-protection fault here and changed the pmd
-		 * to to more permissive. No need to flush the TLB for that,
+		 * to more permissive. No need to flush the TLB for that,
 		 * #PF is architecturally guaranteed to do that and in the
 		 * worst-case we'll generate a spurious fault.
 		 */
@@ -422,7 +422,7 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 		set_pud(pudp, entry);
 		/*
 		 * We had a write-protection fault here and changed the pud
-		 * to to more permissive. No need to flush the TLB for that,
+		 * to more permissive. No need to flush the TLB for that,
 		 * #PF is architecturally guaranteed to do that and in the
 		 * worst-case we'll generate a spurious fault.
 		 */
diff --git a/arch/x86/realmode/rm/trampoline_64.S b/arch/x86/realmode/rm/trampoline_64.S
index 14d9c7daf90f..213c5119d919 100644
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -148,7 +148,7 @@ SYM_CODE_START(startup_32)
 
 	/*
 	 * Memory encryption is enabled but the SME enable bit for this
-	 * CPU has has not been set.  It is safe to set it, so do so.
+	 * CPU has not been set.  It is safe to set it, so do so.
 	 */
 	wrmsr
 .Ldone:
