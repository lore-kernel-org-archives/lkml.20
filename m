Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E33B3BF5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079208; cv=none; b=aTxBJjgt95twfdnSpTRwLa02I+s9+t8JjSXOsHIoZNsof1y6vZNVhpU5wERc9YSw4o3Gwe7uFBtD3dOlytOYuKCyugHQd5m0gTXu0aJvzX2g5mx/8qDShhMqFZZy24clo0aY4lpcBvj/e9StfPoaS9NAwcJj+oIDX6vbNHIbLoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079208; c=relaxed/simple;
	bh=RaSKnpohn/a0FBZWs6DUgO05EqKlyNBnDQSqxF4eZ5M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HRFjgwQHqEOek+flsC8wdFM/i9C5mWt/8RONYwPFWV4krSljizA3zJFwZ4T7uNLiQTnyvLy6C9q4ZowE/KMtg4h9qlxO8OLtM2vB6m/AdTf1LPL4sC1cU6KLnywtWCzTfUgkxqvI7BWHI2RInpNQxqyhbhJcIzaBh8ANXrs12hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xoc5yMgi; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xoc5yMgi"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01ba12198so619895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792079190; x=1792683990; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lG0Z4SvBAfj9Av6Tnq+22F6zrNXtluUjzfA7kSDSk+A=;
        b=Xoc5yMgif0J5dpXXzKOAiTQmklEqiSpXY/acdm4Q4yu2MJwb4lOBrnR2IptE8tcQEE
         nru7kOX07d1RwPidMziZCzrqb1HEprtGbJhFzpIcet0roPJffzUfkIzpo7fmEYf25xoc
         JbBMhM+pmpqBrVNvp3eVXgAzAB8v04rKnz2Rbb1O/h1T7TlAMbVUphedxO1uX7ELX3je
         /8DjaoMT3TanhyXMIGVJHFY4NYay/bysE5cWZYWBCOy8BogvjnAi61VtQ7fqokk0wFDP
         hJQ/MitW8vV2Md2EK5LtIL3RJy1FiYahfysItUQk216yW1vwoT0tAhylZcBsWOGfxUdV
         zu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079190; x=1792683990;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG0Z4SvBAfj9Av6Tnq+22F6zrNXtluUjzfA7kSDSk+A=;
        b=m0QdS/gqpBdec7puZbHYTSb9pCDOsbvzMXcE1OKZIuno5FFsjZc6jSV4M39y0FKtBg
         LPCEii/1Lf3Y9z+WFXoCvmGHo7RMC5AKqzOiI3WctSPc7936ziM9BIgR6+g+LDCfALuV
         fZMOjHtcVr2U/RXuxErNQIywTY2mmrkD4KrL8a7G9DefEg/rnygM+YPJnzbEHOe+4xWQ
         YGtQlzKKH87O8257kQkkZYcFvFzf+RxSxFkna8tmL5gEoJcnDnnjyz2dFp0iJZ0TjLEM
         1nuQ/b/J3CRpGUQdKuc0Yvlbw70jYBhTj29+AASF6CMZu4ZTksETCYoNvaRDuSpvDxNm
         gxtw==
X-Gm-Message-State: AFq9FYKZ2Bq1umxFtrdcT2+nFAFcEKr4ymv/7OPt71TPoJe40AAokSh/
	0H81w8jo98tjnWKD1hoAKM/tbhRdem8lClVTf2WLiqt+Ft4UFVN2aAlQGUXrWVbr1Kua7pbTGA=
	=
X-Received: from wmbjt9.prod.google.com ([2002:a05:600c:5689:b0:4a1:9c49:8b1d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f86:b0:4a1:c27d:e1a8
 with SMTP id 5b1f17b1804b1-4a1c6672f2emr8813795e9.10.1792079189972; Thu, 15
 Oct 2026 08:46:29 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:46:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015154626.552282-2-ardb+git@google.com>
Subject: [PATCH v2] lkdtm: Add more EFI runtime tests
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Two bugs were found in the arm64 EFI runtime support that weren't caught
by LKDTM. The existing EFI_RUNTIME_CRASH test instructs the firmware to
write to kernel memory that is mapped read-only, which usually fails as
expected. However, this does not exercise the runtime mapping logic in
the kernel, nor the fault recovery logic when the faulting address is
inside the EFI runtime memory regions itself.

So add two more test cases:
- a write to R/O memory test that uses the firmware's own executable
  memory as an output buffer
- a branch to memory that is occupied by the firmware's runtime services
  function table, which is usually mapped non-execute.

This depends on the EFI memory attributes table having been exposed by
the firmware and having been taken into account by the runtime mapping
code, so this is used as a prerequisite by the new tests, otherwise it
produces an XFAIL.

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: - split XFAIL into four different conditions
    - check that we are using the native EFI runtime services
    - use the address of SetVirtualAddressMap() as the R/O buffer so
      a spurious successful store does not clobber code that we might
      try to run later outside of the lkdtm context
    - use IS_ENABLED(CONFIG_LKDTM) so the modularized build works too

I'll queue this up in efi/next unless anyone spots a problem.

 drivers/firmware/efi/runtime-wrappers.c | 55 ++++++++++++++++++++
 drivers/misc/lkdtm/bugs.c               | 33 ++++++++++++
 include/linux/efi.h                     | 10 ++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index 33f256dd3d2c..f663342bcc72 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -337,6 +337,29 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 		 * function identifier into efi_rts_work->efi_rts_id
 		 */
 		pr_err("Requested executing invalid EFI Runtime Service.\n");
+		break;
+
+#if IS_ENABLED(CONFIG_LKDTM)
+	case EFI_LKDTM_RUNTIME_RO_TEST:
+		/*
+		 * Call GetTime() with the output argument pointing to
+		 * executable memory, which should be mapped read-only in the
+		 * EFI page tables.
+		 */
+		status = efi_call_virt(get_time,
+				       (void *)efi.runtime->set_virtual_address_map,
+				       NULL);
+		break;
+	case EFI_LKDTM_RUNTIME_NX_TEST:
+		/*
+		 * Call efi.runtime, which points to a data object in a EFI
+		 * runtime region, as if it were a function pointer.
+		 */
+		struct { efi_status_t (__efiapi *fn)(int); } s = { (void *)efi.runtime };
+
+		status = arch_efi_call_virt((&s), fn, 0);
+		break;
+#endif
 	}
 
 	efi_call_virt_check_flags(flags, efi_rts_work.caller);
@@ -624,6 +647,34 @@ static efi_status_t virt_efi_query_capsule_caps(efi_capsule_header_t **capsules,
 	return status;
 }
 
+#if IS_ENABLED(CONFIG_LKDTM)
+static efi_status_t efi_lkdtm_rt_test(enum efi_rts_ids id)
+{
+	efi_status_t status;
+
+	if (!efi_enabled(EFI_RUNTIME_SERVICES) || !efi_enabled(EFI_MEM_ATTR))
+		return EFI_NOT_READY;
+
+	switch (id) {
+	case EFI_LKDTM_RUNTIME_NX_TEST:
+		break;
+	case EFI_LKDTM_RUNTIME_RO_TEST:
+		if (efi.get_time &&
+		    efi_rt_services_supported(EFI_RT_SUPPORTED_GET_TIME))
+			break;
+		fallthrough;
+	default:
+		return EFI_UNSUPPORTED;
+	}
+
+	if (down_interruptible(&efi_runtime_lock))
+		return EFI_NOT_READY;
+	status = __efi_queue_work(id, NULL);
+	up(&efi_runtime_lock);
+	return status;
+}
+#endif
+
 void __init efi_native_runtime_setup(void)
 {
 	efi.get_time			    = virt_efi_get_time;
@@ -640,6 +691,10 @@ void __init efi_native_runtime_setup(void)
 	efi.query_variable_info_nonblocking = virt_efi_query_variable_info_nb;
 	efi.update_capsule		    = virt_efi_update_capsule;
 	efi.query_capsule_caps		    = virt_efi_query_capsule_caps;
+
+#if IS_ENABLED(CONFIG_LKDTM)
+	efi.lkdtm_rt_test		    = efi_lkdtm_rt_test;
+#endif
 }
 
 #ifdef CONFIG_ACPI_PRMT
diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..8ed368ea3e8b 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -841,6 +841,37 @@ static void __maybe_unused lkdtm_EFI_RUNTIME_CRASH(void)
 		       status);
 }
 
+static void efi_rt_test(enum efi_rts_ids id, const char *desc)
+{
+	if (!efi_enabled(EFI_RUNTIME_SERVICES)) {
+		pr_err("XFAIL: EFI runtime services have been disabled\n");
+		return;
+	} else if (!efi_enabled(EFI_MEM_ATTR)) {
+		pr_err("XFAIL: EFI memory attributes table not provided by firmware\n");
+		return;
+	} else if (!efi.lkdtm_rt_test) {
+		pr_err("XFAIL: Only supported with native EFI runtime services\n");
+		return;
+	}
+
+	efi_status_t status = efi.lkdtm_rt_test(id);
+	if (status == EFI_UNSUPPORTED)
+		pr_err("XFAIL: EFI runtime service not implemented by firmware\n");
+	else if (status != EFI_ABORTED || efi_enabled(EFI_RUNTIME_SERVICES))
+		pr_err("FAIL: EFI %s memory not caught (%#lx)\n",
+		       desc, status);
+}
+
+static void __maybe_unused lkdtm_EFI_RUNTIME_WRITE_TO_RO(void)
+{
+	efi_rt_test(EFI_LKDTM_RUNTIME_RO_TEST, "write to RO");
+}
+
+static void __maybe_unused lkdtm_EFI_RUNTIME_BRANCH_TO_NX(void)
+{
+	efi_rt_test(EFI_LKDTM_RUNTIME_NX_TEST, "branch to NX");
+}
+
 static struct crashtype crashtypes[] = {
 	CRASHTYPE(PANIC),
 	CRASHTYPE(PANIC_STOP_IRQOFF),
@@ -876,6 +907,8 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(CORRUPT_PAC),
 #ifdef CONFIG_EFI
 	CRASHTYPE(EFI_RUNTIME_CRASH),
+	CRASHTYPE(EFI_RUNTIME_WRITE_TO_RO),
+	CRASHTYPE(EFI_RUNTIME_BRANCH_TO_NX),
 #endif
 };
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cd8728702e93..cc1df1577d5f 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -631,6 +631,8 @@ typedef struct {
 
 extern unsigned long __ro_after_init efi_rng_seed;		/* RNG Seed table */
 
+enum efi_rts_ids;
+
 /*
  * All runtime access to EFI goes through this structure:
  */
@@ -667,6 +669,10 @@ extern struct efi {
 	efi_get_next_high_mono_count_t	*get_next_high_mono_count;
 	efi_reset_system_t		*reset_system;
 
+#if IS_ENABLED(CONFIG_LKDTM)
+	efi_status_t			(*lkdtm_rt_test)(enum efi_rts_ids id);
+#endif
+
 	struct efi_memory_map		memmap;
 	unsigned long			flags;
 } efi;
@@ -1254,6 +1260,10 @@ enum efi_rts_ids {
 	EFI_UPDATE_CAPSULE,
 	EFI_QUERY_CAPSULE_CAPS,
 	EFI_ACPI_PRM_HANDLER,
+#if IS_ENABLED(CONFIG_LKDTM)
+	EFI_LKDTM_RUNTIME_RO_TEST,
+	EFI_LKDTM_RUNTIME_NX_TEST,
+#endif
 };
 
 union efi_rts_args;
-- 
2.56.0.385.gd3acb90ef8-goog

