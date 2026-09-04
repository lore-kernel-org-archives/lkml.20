Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511A437648F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534442; cv=none; b=uwQ4YCMvnIng5Gs/TFvXVztC8v5lGasFWNewNyc8407lG7dLmlbmTgoD+Wc7aFmUZN/7dYzm06tE+Wkts3hYFA9Vi/5FXr+bIkQQ+b8OtRlomzFuKoBbwArj1f5WWNyVfalTWi9tqZYXp6cltSkcIKLSbgkrzn8QZOv3nxuPuRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534442; c=relaxed/simple;
	bh=EWnj8rbOkyo2o9sl5CmAUQAVy2hbk3Qg5LvdgIDBPpo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DpaEiigtKy7SLksm0bgodsku6q4mmPYBHjRK+KSzYWnVMb/IP3CIXEmOxtYKyJp347cZStQRYAMjHoL5/AnXwFfN0aYfwxXYP3heyjEFE9pg5mlawH+P71fW4g0n7tPRPC7kOcExXeNnMOCTLJcHB9fFFg0UHzLi9ba0mf3p9cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--umendez.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WnhW9OF8; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--umendez.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WnhW9OF8"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4858e4b3e92so250277f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788534438; x=1789139238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvDA0nobYiyJ7iXVIVAbZN1EqtrcZYYZgjsvL4i6VFM=;
        b=WnhW9OF8saCJPRXTYBtG2Tfibctm1c1+JYTw4UJugwLBJp68GuYeLFNJL/5ccwRPXX
         Xt4u+ly6x3UsFYLJftzf5ESIMOZcgnUKFPTlgfbJhgmFZa9iPFCMzngT/sHd/NcF7CkQ
         c9N9FWdBKwTKEDqM70lhxulu8ky/FfsaaeANKiCvFaRWC+jUtTJdMJ5bq15MvjYhAXNp
         ImiL8qhXWgw6dp5qHFkXTinMPDlc+kgw04nPhGdp7XR7/8qtXdno+sIGXIfXH7U5JAUL
         UphMhVOMbgUnEaZwiZHtUTry7n26MrmkibfOlY1saSoBCh5Rk8gi9xQGTkpgQNu6OdZ4
         +Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534438; x=1789139238;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvDA0nobYiyJ7iXVIVAbZN1EqtrcZYYZgjsvL4i6VFM=;
        b=qKfOers52KiXIWXlyj6diFv40wUw0oXpagKP5fRoxAzbxk8RFekDRuNsirArq8New7
         XQG3iB0MBDOWPhe5gQky2KOo5Pr6N6JozUznFPQoWJEZq5mIMGu2CWiTu+zMA1n+1KiF
         JciI2NcjQ6UC38j0AyQC35NB/y64u6HIagR9naTcEj0RCgCNAwavWW/oWtGODrDqLfDm
         eimJc6m0iOb8dcYzWmGo8o7fkQogcZAEX/KjkMYazgjhj3jCtLKml4kz/ZNhl8vX+DB+
         IHTju6tL71PclPRbswyj6zrFGOOOfX2buWtDtvNwfXw2VzboC+VcRhgdbf3CcPg5yy44
         7pMg==
X-Forwarded-Encrypted: i=1; AKwUvByJiqz5hb3WZOMojQMTVgnJgiGpYpScDzHIhHBKDliMCNQ4zknxfDAPb28arvmNlkSoiLkp2demwxFupL8=@vger.kernel.org
X-Gm-Message-State: AFuF++n4n9khaoTNhD9wRAKHZbaYB87WBqEIAQuIyJ3tNxOE5itG3bxH
	kLeh321Vd9cgMJZgMVSnoNaIXfc+0sZdHPjpeM7TbeDaRMH8OxCCSNZSl1MxIcQ2rNN3lVnuBCp
	ayiYHi2jBzA==
X-Received: from wmnv20.prod.google.com ([2002:a05:600c:4454:b0:49b:51c5:e9b2])
 (user=umendez job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190b:b0:49c:fa21:e743
 with SMTP id 5b1f17b1804b1-49cfa21e92amr48135835e9.25.1788534438093; Fri, 04
 Sep 2026 08:07:18 -0700 (PDT)
Date: Fri,  4 Sep 2026 15:07:09 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904150710.2997558-1-umendez@google.com>
Subject: [PATCH v1] objtool: Validate disassembler headers in libopcodes probe
From: Ulises Mendez Martinez <umendez@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sasha Levin <sashal@kernel.org>
Cc: Ulises Mendez Martinez <umendez@google.com>, Alice Ryhl <aliceryhl@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

commit 3f2de814c059 ("objtool: Fix libopcodes linking with static libraries")
tested for libopcodes availability by linking a test snippet with a forward
declaration of disassemble_init_for_target().

However, testing symbol linkage with an extern declaration only verifies
the presence of the library (.so/.a) and bypasses checking for development
headers (binutils-dev). On systems where libopcodes is present without
development headers installed, the probe succeeds, enabling BUILD_DISAS.
Subsequent compilation of objtool then fails:

  fatal error: 'bfd.h' file not found
    113 | #include <bfd.h>

Additionally, the probe invokes $(HOSTCC) without $(HOSTCFLAGS), ignoring
any sysroot or include flags specified for the host compiler.

Fix this by including <bfd.h> and <dis-asm.h> directly in the test snippet,
passing $(HOSTCFLAGS) so host compiler options are respected, and defining
PACKAGE="objtool" to satisfy the configuration check in <bfd.h>.

Fixes: 3f2de814c059 ("objtool: Fix libopcodes linking with static libraries")
Fixes: 436326bc525d ("objtool: fix build failure due to missing libopcodes check")
Reported-by: Alice Ryhl <aliceryhl@google.com>
Assisted-by: Antigravity:Gemini-Next
Signed-off-by: Ulises Mendez Martinez <umendez@google.com>
---
 tools/objtool/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index a4484fd22a96..4cc2e756af84 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -89,9 +89,11 @@ LIBOPCODES_LIBS := $(shell \
 		    "-lopcodes -lbfd" \
 		    "-lopcodes -lbfd -liberty" \
 		    "-lopcodes -lbfd -liberty -lz"; do \
-		echo 'extern void disassemble_init_for_target(void *);' \
-		     'int main(void) { disassemble_init_for_target(0); return 0; }' | \
-			$(HOSTCC) -xc - -o /dev/null $$libs 2>/dev/null && \
+		printf '%s\n' \
+		       '$(pound)include <bfd.h>' \
+		       '$(pound)include <dis-asm.h>' \
+		       'int main(void) { disassemble_init_for_target(0); return 0; }' | \
+			$(HOSTCC) $(HOSTCFLAGS) -DPACKAGE='"objtool"' -xc - -o /dev/null $$libs 2>/dev/null && \
 			echo "$$libs" && break; \
 	done)
 
-- 
2.55.0.979.g7e5102b832-goog

