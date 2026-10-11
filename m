Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE574455612
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746049; cv=none; b=opxGd43esvkMSFNV2OvfJznSpz25PA1qzv+tNbWO6zM1KkcCy7wygQp0wK1dTe83p8N7J8uwvymE/ke9w7msl7L3egg/6cA7ls5IF3W579/DbQNCzmCkbchZ3WClD/PEVUILNPAHnm7b+XKwR1US4j0osH6xItmsGa1V+syTw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746049; c=relaxed/simple;
	bh=oS7l3D5R3BYiLCzvtJtL4vPhMIT6koiX6so9TX3fFek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGmteyRTZFDrocHep+TcSmHps8uYiYj64LOqrlAnMy+yJbuAFk/94ykXJdzBat8fb5SzMk+BnAcwlxIeG56WfzSAo5l6OmQGql/fnHDT7PwCJ2E5PXik5pEqwMV3W0bFQu5GNN51PeYkSgcmwCb1dvoLtIRiCLI4bVvnZXi7MwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BESErSDh; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BESErSDh"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso2728311a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746046; x=1792350846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mu4CpnUPzuS1cv3/EWyVwBhxEVHDqXWC2D7/WotK1s8=;
        b=BESErSDhz1QrrjrTVmCceZQrE9zurFpK0bB+UdVimA1kfGi8VeHYeMzT2UEEvD3vdy
         yV56JM+uaLNThZZ54AgjJuFjADxB0aswEkb4zXyvvGFS3v9ON3xtLvJg3q5mKsHcgPec
         ZRruI5by2Brnwl9OrVkf13iz+p1ocaI90dKwB0XyvudlKCnsNykk/k8tliuBPsyo4JF8
         oED6G9jPfISNtsCUl/OuPU7TmgKt+LFnJeRPTtc62r5fnBbwLoSG/a4T/c+quYp4ggsn
         eVedfdIeqpUfho6ZxixdWSl1nSyKugUAmcV1uxyK8/ccZV2MF0mJD9jD/s4fjfgYkukk
         4byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746046; x=1792350846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mu4CpnUPzuS1cv3/EWyVwBhxEVHDqXWC2D7/WotK1s8=;
        b=M+RW/bkbwM7Fo+VI0XiVK06ciD5eIUEdwRpZQpTH3XHBiYbBoJ1aNQDmmMsCPQVjxS
         pffbOhZwNEoqKNzxC2BC/5s8dbe4odSc0xQ7OfA8wKhORV+2p/KPH+bCvFHTi4pN/p3O
         PC/jFA3kuDU0/b2IBkl2iXCoBfM2OrnsQ0ZfrcfSje7NJu19ygZOI7SfnabjnmF9gqAb
         VdRPjy5/rXueHwHpGA6LTI3h+MXN/KbawdzbRS9s4St2J4IStmvyIbJj8CnqZUBfTT5L
         Ktb4bJY/bnhEY0jdbfAGJd/RGNOFZLPWA3QAgwbq3G/m2+jxf6QX00D0tAvEQsnDS3ZD
         f6yg==
X-Forwarded-Encrypted: i=1; AKwUvBwFxV11tB183iTha5VxNmR2OInAu6HSRsadYufel+to+YyqgWsVMRCeM3s9GQyJX4NgaL1b+h8VpjWVAcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9zpJF+WYttOEvGnWsM+POqbzNv9hyHWXiWt8mrpv+euez/XKB
	Hr40ohTzUAdkOhLHzbP0DoEoWOM8zR8k5uhoZg19SbjtWKVEG7UDTvHV
X-Gm-Gg: AYBFou1TIcIlRlKiXGsGr/A+klpGBfcnK9g7WO8FQvGavGekb/n8HGP3XeLf0RzJObJ
	9Y2xQE9WmFi7RBVfLVNRfQ8RELynJhrUa15cpFZy50Ki6HZuSX/lUUDSlIe2ptGEP/KiZmhPE0I
	4IBiegsghf1lQS6sPPGgLPDFSwzjkQplaU6W4xMNyhcIhNhSBqfZrngsVAqLlBpzVCB/+OY7fmu
	piCuP5WEfkJT0pv1uh8mmxhfwjB8a6e6+kpa/kVkxXQgJ5tAcPwAefR2b4EmuPgb3atN1MipnB+
	1jNcXeBQby9nMDJB3N/J7Vgaw4Qn9LXFcpekEJkEL9wsdrPbJS8EnbjpLEipAMYtQQwGG4bCIBJ
	30seS+MfdtrlwYqD3nRKK5uxmBexiTKEw86nQS3x6tyTYLXiw9n3bWo+mdzo4G+zVK+8rZ0KQE1
	Ow0ojnw8+WX/nsMy1BK4eEadpRngIbypID5M0urvTTdF/g8NhkEjKZtkYgnuSbU6LHbVdAxERgA
	Qzy775X3VOraVLRjEo710xr2r+q0Vju+LWeqR0k
X-Received: by 2002:a05:6402:351:b0:6ac:bde4:32c7 with SMTP id 4fb4d7f45d1cf-6b17aec6e9emr4853031a12.18.1791746045709;
        Sun, 11 Oct 2026 12:14:05 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:14:05 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write parity errors
Date: Sun, 11 Oct 2026 21:12:53 +0200
Message-ID: <20261011191344.981000-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 21272 HRM revision 4.0, section 8.8.1.1.2, describes uncorrectable
memory errors reported through PERROR<UECC>. Section 8.8.2.4 describes
PERROR<PERR>: incoming writes with bad parity can poison memory ECC and
have side effects on later writes; software is expected to crash.
PERR also covers parity errors reported by a PCI target on outgoing
writes. Treat either case conservatively as data integrity compromised.

After reporting and acknowledging a system error, panic for UECC or
PERR in either the saved frame or live Pchip snapshot. Saved errors must
not disappear merely because firmware already cleared the live register.
Limit this policy to system-error vectors: incidental PERROR state on a
CPU error or environmental vector must not trigger this new panic path.

This changes the old handler's policy and is kept separate so it can be
reviewed or reverted independently. Hardware UECC/PERR injection has not
been performed; validation of this policy uses synthetic handler tests.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_tsunami.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 91937fd2d6e0..386304776805 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -19,6 +19,7 @@
 #include "pci_impl.h"
 
 #define TSUNAMI_PERROR_ERRMASK	0xdffUL
+#define TSUNAMI_PERROR_FATAL	(perror_m_uecc | perror_m_perr)
 #define TSUNAMI_PERROR_ECCMASK	(perror_m_uecc | perror_m_cre)
 #define TSUNAMI_PERROR_INV	(1UL << 51)
 #define TSUNAMI_MISC_NXM		(1UL << 28)
@@ -215,14 +216,22 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 	struct el_TSUNAMI_sysdata_mcheck *frame = NULL;
 	struct tsunami_error_state live;
 	char *saved_err_prefix = err_print_prefix;
+	u64 perror;
+	bool fatal = false;
 
 	/* Synchronize pending accesses before inspecting the chipset. */
 	mb();
 	mb();
 	draina();
 	tsunami_clear_errors(&live);
-	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR)
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
 		frame = tsunami_system_frame(header);
+		perror = live.perror[0] | live.perror[1];
+		if (frame)
+			perror |= tsunami_pchip_error(frame, 0) |
+				  tsunami_pchip_error(frame, 1);
+		fatal = perror & TSUNAMI_PERROR_FATAL;
+	}
 
 	err_print_prefix = KERN_CRIT;
 	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
@@ -249,6 +258,8 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 		mb();
 	}
 
+	if (fatal)
+		panic("Tsunami: uncorrectable ECC or PCI write parity error");
 }
 
 static const char * const CLIPPER_EnvQW1SMIR[] = {
-- 
2.43.0

