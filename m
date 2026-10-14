Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9591D9A66
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791957740; cv=none; b=sQNW4JL/2N7/RQX5g2bccZVKgCwq9fh23qHapqOn6nQ3A2MdAA5UF91KXTozRzkcjrTqdWQQ5Pv9vOn+rDPDonIJN1r+yKwHsxx0ptDSb9WtZzmjrADqFc31LBoXf55iyyrf254xhQo0ZhNXt/oky2FP4rFJS1fUWRT7F0GRoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791957740; c=relaxed/simple;
	bh=NzUuIXQnPqKxjmVowDKFUAH5aj7tvNlvr0pmtvbb7Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pugk7UktebxDWVC7GlCUJKhRlrepPhyJW07zG52iyIz1JUzjcAgpsYSqpBnow5m70ARghHTQaFRkgM2ymK20t6ntMvp3O9xOncjQuoae6gqdpKDXM0XQMAx0JxootHrwpIWos2ISaeC8+RN3A+OkBu89gByZ1IsURVB0NFOnnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2+65GIWB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PCNeA3VA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2+65GIWB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PCNeA3VA"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791957737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=si3mE0eRKr/xYwk7ohydIp+CfI4jcCVfH5Df7/z8yWA=;
	b=2+65GIWBbmH2MKPWbnZD77itcuBDd4BAX7KlKqeCjHvaxCeJirzoUXxl5qFDY5SRCm+me2
	pAMxaAm1vHXDZi7kDVcmEYoSMqKmkbYfiFDguWKWPMoabHYMRP1Oic+AeJkz/p9OtiW2EX
	B039yOHG+cwC0i8LUKiWX1Vzjz2PzeLW0xUdv4wFBB+TSlbzSDqWUlAWw9DW2TIKqe5A4w
	waYBPq+Oljl8f78GRRjPhAP/SC7s/oQcJMAjz9AbkcMd523fR6pLfcWwziUi4J9ozdsj0M
	QK5UwyUk175dWQSfMjmGlJPFBBTtYdTi2SNnbsswQkr7/oNhEnIRrt1VZ93kIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791957737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=si3mE0eRKr/xYwk7ohydIp+CfI4jcCVfH5Df7/z8yWA=;
	b=PCNeA3VAYZkl4o5Vm0VlYeF5x1OF/Snk+2v53eKQvu+3IxTowRfzTzgjaa5ifQay8usn1P
	9fJDE+7lt73ek1Ag==
Date: Wed, 14 Oct 2026 08:02:01 +0200
Subject: [PATCH] riscv: vdso: Don't use && to chain compound cmd
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-riscv-vdsold-errors-v1-1-91392fe3dba0@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MQQqDQAyF4atI1gYcqQpepbgYTMYGimMTHQri3
 R3U5ffg/TsYq7BBX+ygnMQkzhmuLGD8+HliFMqGuqpbV7kXqtiYMJHFLyGrRjUM1PqOukDsG8j
 PRTnI/6q+h9vKvy3H12c8jhOG0MHKegAAAA==
X-Change-ID: 20261014-riscv-vdsold-errors-fd6a7d7fdea5
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791957734; l=3205;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NzUuIXQnPqKxjmVowDKFUAH5aj7tvNlvr0pmtvbb7Js=;
 b=D7n2aTRp2Af4DwkdGPo99Hjfd7afTlubcas/CJEhoxRCfH/PTyFvkGNjGP1bGCn1fexobIHIo
 YZ2KAco2wpAAke5i2JHJvC7K5W997mIEPIdiKAsRuS8zRHTW6VDTCwB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vDSO linking consists of multiple commands executed as part of a
single kbuild 'cmd'. Currently these commands are chained with shell
'&&' operators to make sure that the later commands are only executed
when the earlier ones succeeded. However kbuild already provides this
early abort by using 'set -e' before each command invocation.
Furthermore the '&&' chaining prevents the 'set -e' from promoting the
failure of a single command to a failure of the overall command.

If one of the subcommand fails, kbuild will not notice and continue the
build, potentially leading to confusing follow-up errors.

Switch to plain ';' based sequences over '&&' ones.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Best viewed with 'git show --word-diff --word-diff-regex=.'
---
 arch/riscv/kernel/compat_vdso/Makefile | 4 ++--
 arch/riscv/kernel/vdso/Makefile        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 24e37d1ef7ec..c4ed74dfe998 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -63,8 +63,8 @@ include/generated/compat_vdso-offsets.h: $(obj)/compat_vdso.so.dbg FORCE
 # The DSO images are built using a special linker script
 # Make sure only to export the intended __compat_vdso_xxx symbol offsets.
 quiet_cmd_compat_vdsold = VDSOLD  $@
-      cmd_compat_vdsold = $(COMPAT_LD) $(ld_flags) $(COMPAT_LD_FLAGS) -T $(filter-out FORCE,$^) -o $@.tmp && \
-                   $(OBJCOPY) $(patsubst %, -G __compat_vdso_%, $(compat_vdso-syms)) $@.tmp $@ && \
+      cmd_compat_vdsold = $(COMPAT_LD) $(ld_flags) $(COMPAT_LD_FLAGS) -T $(filter-out FORCE,$^) -o $@.tmp; \
+                   $(OBJCOPY) $(patsubst %, -G __compat_vdso_%, $(compat_vdso-syms)) $@.tmp $@; \
                    rm $@.tmp
 
 # actual build commands
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c023046a3fd7..d2ebdc048efb 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -97,7 +97,7 @@ include/generated/$(vdso_offsets): $(obj)/$(vdso_so_dbg) FORCE
 # The DSO images are built using a special linker script
 # Make sure only to export the intended __vdso_xxx symbol offsets.
 quiet_cmd_vdsold_and_check = VDSOLD  $@
-      cmd_vdsold_and_check = $(LD) $(CFI_FULL) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
-                   $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
-                   rm $@.tmp && \
+      cmd_vdsold_and_check = $(LD) $(CFI_FULL) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp; \
+                   $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@; \
+                   rm $@.tmp; \
                    $(cmd_vdso_check)

---
base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
change-id: 20261014-riscv-vdsold-errors-fd6a7d7fdea5

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

