Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8D19EED3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331553; cv=none; b=hgY5MyXIyzXX2A61vVt61RMaonegLgxYsvSpPPSZrpEkV/0gRsiV/Cl2bNwASQ4UQHLxUA2+GumMeT0KVDCLphKBtRfQ1VOxsLTpkUtMOOMdxLppkc5qL4/eDQUWIHypY2WGeADiWnOE31OmFzx9M8JlhWE8+o/hVxmYBp+amoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331553; c=relaxed/simple;
	bh=gKTj+wn2ltX7CFM5zaOViDsn11taF/RVYbSwk0Exws8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tFy3Kp7prwypeWKIWET54yOaYBVaqjwkreko8Jwf35825MtJDoh+dzuyX/E4jZ50WHK1rBx1SeBrqIoZTsd9d6HZEFFQw8grI7LxAispKS5XBNwYPVdSC5oVRahNPfS0BYGVzg48Pd3yQGK3lLr4tLV23L+KOfvqrVxdgTTQ7w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rsDJW1YO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsDJW1YO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964e480f76so941815a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331551; x=1788936351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sA++nWJofVz/EtAtHtRDwVJVg34ghqqVvTXtizuE6qM=;
        b=rsDJW1YOtxfTLk3jTkWzX5D/F/dn1148VD4LUKiWPe9Pi9hvXvJNzcXzrX5PsTtjXY
         fgV8Cfo0U+6MDj1JJB6GemMkICwIwQmzopIxz6uKycE35RIqMTvLtNE/WzadTNwvZ8Em
         LgytadsC+bzN7QECKQ4x2BrAJnb/5Bwp47rC34TNQwTWVaGA34H9Gv11d1YFGY4XK23z
         yy8tBGk2IcYM1S/9gkKIzz2yPxAyAlOO87VirPZ4BZ8jdKt/wf3Y2bhzJ0EeijTPuw4P
         +E4NaArH4pGA2wxU2puqj3cUjDzV1QkS6KiIlnFGuduygiIER4155e7zOcaBUsDe2d1T
         lxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331551; x=1788936351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sA++nWJofVz/EtAtHtRDwVJVg34ghqqVvTXtizuE6qM=;
        b=cPO8qX5nMOjCeyf12q8nFh+rZ6rDPkIrIZ3iimwlRZBloDRR2RVcQ4kgpLXathSdLx
         JDQQMut6SOx5ehXHkQOgkcA6S7dZcqbNytXcns5BwqE43NgvgndCXCuatLsowSOXhsrI
         V2K1bYmKJHHmIZEwfPMtksNZoT8py6xFaHeM+92ViIgnwGVzYFnEcs/Y5FscxubsPAgG
         +6452Z42NRsg1IcKOUUAFP+VOMElc6gh+yA2UDQLMwtB0BoK+I/WiKB2DYB85ql/SXWp
         dE8voN+pUl9fl1DeiqGHW1ImPmRTgKuQlpjUIcnRBf99xgCfYskdEHuwfN2jK2qqZOFQ
         YVRA==
X-Forwarded-Encrypted: i=1; AKwUvBzFg4By+lHTs5ZRgqsfJxY6tYfjU2gsEy28ppq7F53jwm5wC85PolIaBQkAitQb+x4fo4f0cqEnO3PDhEU=@vger.kernel.org
X-Gm-Message-State: AFuF++k6KwtkSGSvHKYHL8tj0we8oDIXDOUTUjera5ccVlTcJj5WYAuX
	IQVN17RDoNuCW6OzU5VTZaR151OwbENDt75alv2ZRjqh2+KRvCTI+T94
X-Gm-Gg: AYBFou0hL3pFRu+j3ZQiZpsV1lrhApNWv7gP1gOcs4eyr2gOSPPEnRoB7HsudNFcTAc
	BAhFjWdyRXurIL9IDCC46rTFTOkxLXXkF7Bqj0PLgr9SpVprP8rylQFu2s/GXwKKis2Zukrp1Ks
	tg9RwCI8pzRgdGu7vmOWHPHHZXvTMNfeQRIheEdnBQqT4mYXD+1KEwjfJE7QaRHDrLbHoyBbF+E
	cVn7k7e2laPszwO5nEReMmnuyxK/uKy31O2V7PxIQiwiCH4dCowdE9Iss9xG3q4rgFr4Z0DbJlv
	6R9CB7WU0LuXRyhU6Lm0Rs9LwrxN6JRMHa7hEioxwHPzEmMb1E+I5GWL4P1/z7WOpovEkZaejVw
	0SjCBIl4vhb9Fye+cp+ZFzhDIug20lfjsxJF5pmSX4cdZJVviaNEXEoRS5yDfskCWPmOJaW6EJR
	xOwjjgr2Dape4nfC68T06Q3AdeRrufkqM6Co3oehUF3MW1SNeiBffeO/y2Zp1dId70+wkWIBoQA
	Qv4BBiHJaqSeNmf
X-Received: by 2002:a17:90b:2808:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39aee1c63b1mr4243684a91.18.1788331550609;
        Tue, 01 Sep 2026 23:45:50 -0700 (PDT)
Received: from PC-2B0BA31200898.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm11051480a91.1.2026.09.01.23.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:45:50 -0700 (PDT)
From: Meijing Zhao <zhaomeijing100@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Meijing Zhao <zhaomeijing@lixiang.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Wandun Chen <chenwandun@lixiang.com>,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mm: trace: decode MTE and shadow stack VMA flags
Date: Wed,  2 Sep 2026 14:45:09 +0800
Message-Id: <1c7f7003cff8d00209baa8498f1efee113f5b5a4.1788330432.git.zhaomeijing@lixiang.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788330432.git.zhaomeijing@lixiang.com>
References: <cover.1788330432.git.zhaomeijing@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meijing Zhao <zhaomeijing@lixiang.com>

show_vma_flags(), which is used by VMA tracepoints and %pGv, leaves
architecture-specific HIGH_ARCH_* bits unnamed.  Arm64 MTE flags and
user shadow stack flags are therefore printed as raw hexadecimal values.

These bit positions are shared between architectures.  For example, bit
37 represents VM_MTE_ALLOWED on arm64 but VM_SHADOW_STACK on x86, so a
shared HIGH_ARCH_* bit cannot be given an unconditional name.

Add conditionally compiled names for VM_MTE, VM_MTE_ALLOWED and
VM_SHADOW_STACK.  Keep the configuration guards aligned with the
definitions of these aliases so each shared bit position is decoded
according to the target architecture.

For example, an arm64 VMA containing VM_MTE_ALLOWED is now printed as:

  ...|account|mte_allowed|...

instead of:

  ...|account|0x2000000000

Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/trace/events/mmflags.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 02caeaf359ab..2f980d20a9f6 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -202,6 +202,19 @@ IF_HAVE_PG_ARCH_3(arch_3)
 # define IF_HAVE_VM_DROPPABLE(flag, name)
 #endif
 
+#ifdef CONFIG_ARM64_MTE
+# define IF_HAVE_VM_MTE(flag, name) {flag, name},
+#else
+# define IF_HAVE_VM_MTE(flag, name)
+#endif
+
+#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_RISCV_USER_CFI) || \
+	defined(CONFIG_ARM64_GCS)
+# define IF_HAVE_VM_SHADOW_STACK(flag, name) {flag, name},
+#else
+# define IF_HAVE_VM_SHADOW_STACK(flag, name)
+#endif
+
 #define __def_vmaflag_names						\
 	{VM_READ,			"read"		},		\
 	{VM_WRITE,			"write"		},		\
@@ -237,6 +250,9 @@ IF_HAVE_VM_SOFTDIRTY(VM_SOFTDIRTY,	"softdirty"	)		\
 	{VM_HUGEPAGE,			"hugepage"	},		\
 	{VM_NOHUGEPAGE,			"nohugepage"	},		\
 IF_HAVE_VM_DROPPABLE(VM_DROPPABLE,	"droppable"	)		\
+IF_HAVE_VM_MTE(VM_MTE,			"mte")			\
+IF_HAVE_VM_MTE(VM_MTE_ALLOWED,		"mte_allowed")		\
+IF_HAVE_VM_SHADOW_STACK(VM_SHADOW_STACK, "shadow_stack")	\
 	{VM_MERGEABLE,			"mergeable"	}		\
 
 #define show_vma_flags(flags)						\
-- 
2.25.1
