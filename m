Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70737B036
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331564; cv=none; b=iZjU92kr/lKgso/Tbi1GF+5/4y0GyIdWTEwo558YP70X5tMXuNOH1RvleSsO1ILi1VO9nCYDyDCsOWPSjVGFl6cg4t7T86fO1PS7Fiq0cyL3ncQgA19/240v14TNS/40c8awFYG1K/1sGI3OO/Zz2xq+h9Fh0EY5tOD9Evj2Z4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331564; c=relaxed/simple;
	bh=Pl/F4A+WNHxObov5QpjRxwRqXFSTazG/CwcNf54O7UU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVzG1XTVWb4g/9pjbfNm3+sSLgvwLJDyKmcxxzNJtxq+isiyQt23Iby1ws/R4vLUiO48qylDe46EMb2kexDVNjjZeXFHPIZMRMv4ZIOaXfKSID/lhOrSuxSQKhZr6CnVBQefyhVrgkfa2uih9mXn8Y0I3YYCSNQRMANmJ/19Ayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNNFd5l3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNNFd5l3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e58034d05so573926a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331562; x=1788936362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yy14lSjlqIlp7/ZhnEryZaSDgqy5+mYft8l+OckZzk=;
        b=aNNFd5l3OlKVXwn9pPJChYdWPvi0y9AfysUAd9EMc85EMxIsL1CfB5+2P0+KOnuP3r
         ef5oNoPqlHZmecEZXl1uoh7HAM85siEmrWNIUFbf871vlI1GcxroUZ7V+6KWAD7F41fz
         nzCveLfwO5vW7drQNOa8XSfl3J2pThOkep4qvHlUpzaZ/Dq3JHZicEYvD4LrReiv5DgX
         Gu7PaD5X44R+k4NUnLUp9C7yrZaRAoIOrfU1p7Y0grwhkHoylAyQcXaEbBxzK0j5LPxj
         qQ774HiFS9KL9FLycONrg0GVlOPDfL1deASKyQdlNFW6gh566j77RmR3xUAdOWW8pUrJ
         JBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331562; x=1788936362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4yy14lSjlqIlp7/ZhnEryZaSDgqy5+mYft8l+OckZzk=;
        b=BwZuWdS8aQtDrUhjfHQEpsNpeAs7HKdgiDM/C+XA8d+r1aHbJ5ivby3/uUXG+LiJ1+
         xW6SS+CXMcbJxt12KGGvveaZz8JmQl1Ho/bhavOq1IluFJiUeGGsxAjLEegNU0VcrSUy
         7JWA6lpEx2cyotTlTzNOCNR4gyTzQZ2P3imkUD/DvBqqVvETt8MaJ4SBJkB3kyTnWDmP
         YMxzzMGY3gpUHI4GrvCZzAjNeNDxhvRwtUrebTBs8p2QKYQD6lAeEyhDKl7QIWSwitoi
         3cB6JLHJV3U70pRd4ak3t7rAg/k3oQjDvhLaDB6v9iNwtNqLzp44ycUOV+pOjrpQCxTL
         AfAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOXdhO4rbeNNjlZc01erfVbv8r0GYs/UHSOv2mAYCzTlhbo5j9GPOhcWcPs8rX5RasSo5tf7CKoMe/7UE=@vger.kernel.org
X-Gm-Message-State: AFuF++nOqUimhBfzZO3nvvuYfi38tRcziesstDYkrNDx7PfMJ4I73nzS
	SS+SWaxomyI61ZfmSLO7OWOB7HcjCrMZ76lK6k29vGbRiB59cp8rJ6id
X-Gm-Gg: AYBFou3tEW+lI97lsInS6DChZSkYhjZxigi4rlVtxn3wNAG8omEb2sFreED8PvChnui
	VpeafJUz69CgToxsdZy69QW+BwOOJa0EkZzduHB7aAHuujUn6QoX+Xwr1ZgrIbZTphc0Y/ieEuS
	ZoxHUppcL2HXJNRi4M1RLnKvIkudhC/idNyi1Y95+7V7Bj1IpMwRBlfOPznaN2+8LvovVNCJ9nB
	l/ncsMFGiUbnikPwpQkUJ1mA6D3e/WOFpIOLBwZ6dY6rkKwi3H4ei2T86MiYhtr0v2MD1TK6WTh
	A3IT7Y7w9MJGNWDfVy+ofvhN1kCrB0WAEqiZeqO1+WuwyBXTyAxLmXLvC28w2ZeycVX2JERMRp2
	OU8nhc0SUuwzVO0vj09RGZKLmlQksVUgczoB00JNPwcxu/Zv2wycGUXZcYh5LLzinvmnlaQL0Mi
	Ojghs44kvHHlU3+HuL1ThAHeWSl3XfoGLHtIqdSRrE+eWnbbH8fa9TQk3Fq3aqVKHHoR1sISYr2
	PEQpPZSIygxOTNA
X-Received: by 2002:a17:90b:380d:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39aedc217demr3311370a91.0.1788331562371;
        Tue, 01 Sep 2026 23:46:02 -0700 (PDT)
Received: from PC-2B0BA31200898.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm11051480a91.1.2026.09.01.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:46:01 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mm: trace: name protection key encoding bits
Date: Wed,  2 Sep 2026 14:45:10 +0800
Message-Id: <1871da32001243b37147bac5af02d2f2ec64304e.1788330432.git.zhaomeijing@lixiang.com>
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

Protection keys are encoded in architecture-specific HIGH_ARCH_* VMA
flag bits.  show_vma_flags(), which is used by VMA tracepoints and %pGv,
does not name those bits, leaving them as raw hexadecimal values.

Name the protection-key encoding bits pkey_bit0 through pkey_bit4 under
CONFIG_ARCH_HAS_PKEYS.  The names make clear that these are bits of one
protection-key value rather than independent protection keys.  For
example, protection key 3 is represented as:

  pkey_bit0|pkey_bit1

Honor CONFIG_ARCH_PKEY_BITS when exposing bit 3 and bit 4 so only bits
provided by the architecture are included.

Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/trace/events/mmflags.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 2f980d20a9f6..ef9aa388b84f 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -202,6 +202,24 @@ IF_HAVE_PG_ARCH_3(arch_3)
 # define IF_HAVE_VM_DROPPABLE(flag, name)
 #endif
 
+#ifdef CONFIG_ARCH_HAS_PKEYS
+# define IF_HAVE_VM_PKEY(flag, name) {flag, name},
+#if CONFIG_ARCH_PKEY_BITS > 3
+# define IF_HAVE_VM_PKEY3(flag, name) {flag, name},
+#else
+# define IF_HAVE_VM_PKEY3(flag, name)
+#endif
+#if CONFIG_ARCH_PKEY_BITS > 4
+# define IF_HAVE_VM_PKEY4(flag, name) {flag, name},
+#else
+# define IF_HAVE_VM_PKEY4(flag, name)
+#endif
+#else
+# define IF_HAVE_VM_PKEY(flag, name)
+# define IF_HAVE_VM_PKEY3(flag, name)
+# define IF_HAVE_VM_PKEY4(flag, name)
+#endif
+
 #ifdef CONFIG_ARM64_MTE
 # define IF_HAVE_VM_MTE(flag, name) {flag, name},
 #else
@@ -250,6 +268,11 @@ IF_HAVE_VM_SOFTDIRTY(VM_SOFTDIRTY,	"softdirty"	)		\
 	{VM_HUGEPAGE,			"hugepage"	},		\
 	{VM_NOHUGEPAGE,			"nohugepage"	},		\
 IF_HAVE_VM_DROPPABLE(VM_DROPPABLE,	"droppable"	)		\
+IF_HAVE_VM_PKEY(VM_PKEY_BIT0,		"pkey_bit0")		\
+IF_HAVE_VM_PKEY(VM_PKEY_BIT1,		"pkey_bit1")		\
+IF_HAVE_VM_PKEY(VM_PKEY_BIT2,		"pkey_bit2")		\
+IF_HAVE_VM_PKEY3(VM_PKEY_BIT3,		"pkey_bit3")		\
+IF_HAVE_VM_PKEY4(VM_PKEY_BIT4,		"pkey_bit4")		\
 IF_HAVE_VM_MTE(VM_MTE,			"mte")			\
 IF_HAVE_VM_MTE(VM_MTE_ALLOWED,		"mte_allowed")		\
 IF_HAVE_VM_SHADOW_STACK(VM_SHADOW_STACK, "shadow_stack")	\
-- 
2.25.1
