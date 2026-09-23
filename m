Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D383CE4A3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198865; cv=none; b=U9uYjkTZZNPNlW9pYjR4CDihmHPX8mpq8a7a2X+xTZ7ymGCZpRcFHWkVz9WROunTVGqrP6yKN8omtKzNq74YPn4EfxC7XtBpONmXbgSZbaVPPkOzF2SCF5rQrX3tMZPfvPQ+4G0Ckp+pbUT4S7dC0Z5xEo4hPi7uGd7IhFcz7Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198865; c=relaxed/simple;
	bh=R4ospv4n/7km+jBdukyWJrCF1+iohYSOuvflni0QjQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wgn7NibiRH09KdEaWtRlEywjVRd9ATfkzDD3zt/Xb7RcMMMBjeNG3Bl7UWmANYByRhltO4+v+y7OlOc+DFBCsxiOECuYvkTat5yjWr0TuIy5jStEH7pkglWt1xk9JuorKzCXGINl8OSh9wyXoQVZDs0LzXa4vkhOvLjQgHwH+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts00F5TA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts00F5TA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so948486f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790198858; x=1790803658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8JJDlLrnx5y2Wam8pXxP6JcYb1KF893pytiE0wrQgw=;
        b=Ts00F5TAtquUseNEtZRphGpAsnWJF6+IW1hSOYX1aD9uq/bDxI4zI4C06Nt/8U7cfa
         cql1v8EhwsaM6lb7xIwIrwvvh4oLk8Z7TEb7fXRmXlrV2ziZst6UafyljLOL0fcWyYD6
         iQZr5y6WBruyqRxaUj5nJSPnKaoFjwJEMF5F9iLi55QQECtkG7bAlkbMRlzzUj80BiRm
         Sw7aTTd2KY3sPrm4jJWgn8H3raTR6mAOwerwI4Cre/oZS+N3F5WTrepp6LLv4M2cfXeu
         RA/BiLxi66dIYJgLM1xzD3zTWTV8T9I4aHb3BJFWiHqXw/l1FqS2WHDE6fPbglhgNOYS
         ps1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198858; x=1790803658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8JJDlLrnx5y2Wam8pXxP6JcYb1KF893pytiE0wrQgw=;
        b=gPuayeVE3FsFeXYg8qzi6Ezu2qOh0MRPawF6uFLaxBK5/OXQbgpM9M6nDR2OPfbwgV
         ns7Pw8XLzyzVoXci2VcLMlbL7t63g6f6QJAwFP2gTLpqITnspkCw89P+SBWDd+qSeBSa
         uUMQq5nesYR8XYr2EoRU7RB0xvlgvuuQUrlr9Jos22lstiwrWwLz3zePxUfZEi0Q+oI6
         J1zeqnrdQ7j66Wp3Q1cFfbWaQbSY8XeNdRbR6deZJzfDn4bd3ge5WFGt0PMbLk/GqLvG
         FwHDS7nLGY23yD5Tsjr5NaMdxV5OsGlnuokUKQds2r9QK6tes7BTffhVI2LFkLEDVyGz
         jlMQ==
X-Forwarded-Encrypted: i=1; AKwUvByYGIcK42rTNbhRzKGTrgx9tZLuM3N3JP9fiUrvyRLX5EoNpQBi9WqOzPA02NY+gx0/Tk3XP3sCtYVRU9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n+SPQD8NnPsumxmfv5oONLoJ+B1ytVmMi8owqG2G+GUR2ae4tf
	o6rYQCh63ahbmKWuV2+CpdJRQObFbIGNyIGQ9+F275MQeA5DepNNenP7vyHavYv6ATs=
X-Gm-Gg: AYBFou2HjNBezwH0CktYN6YotRLE3dqf9Z1wRvfD69ZE5BoXgXEyhRUiLrgDdE4VVOk
	ntDXbKSO2VBSPQiaft+aWC3knyVOPd/VFsxa85k0jFOMjLgI1ElCFzfDbPwwiIt6Pn5uG34nrYo
	EPq+66nlaKub2TTBYVxpF4tGODiv/9ZsUMlslnwAlJXlFHcAUb5RQ3/HVQPOq7Oz9xU6WDkm+6P
	s08oI1ntL6XU0/+Xx1JmZXRHSU3ME+XY1OuyLhogPeEfcd2X5lHoxTQCqC2g9EpNu3YNM+/yI2R
	z3/kYwvkfSFfYTvN1tNbPTNWoCXOckZKPwNwmpoXB4Y2iDDXt0uwvwaiEsLHfI5xlPNgJViYvd1
	mi7fhf1OPqH1RuNjSDzeyOmH2f2t/J8D7AZmM887hXsqc8OdwIA03nKWgVixFCZZRQxC1HIks2Z
	T/Y4whuqs5mh0dlBWOzoLRZFnxWOa8nnlc0yxTHco1DRy74QVBvQ1FOP5kWBRbC+Aqqg==
X-Received: by 2002:a05:6000:1a89:b0:487:a15:dbee with SMTP id ffacd0b85a97d-488716ca579mr611823f8f.21.1790198857691;
        Wed, 23 Sep 2026 14:27:37 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668e7sm10890259f8f.4.2026.09.23.14.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:27:37 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/mm: Fix void/int conditional in pgd_clear()
Date: Wed, 23 Sep 2026 23:27:25 +0200
Message-ID: <20260923212731.19599-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparse building mm/ reports an error for every pgd_clear() caller:

  mm/pgtable-generic.c:30:9: error: incompatible types in conditional expression (different base types):
  mm/pgtable-generic.c:30:9:    void
  mm/pgtable-generic.c:30:9:    int

pgtable_l5_enabled() ? native_pgd_clear(pgd) : 0 mixes a void function
call with an int constant. C11 6.5.15 requires the second and third
operands of a conditional expression to both have arithmetic type, both
have the same structure or union type, both have void type, or to be
compatible pointer types. void and int are none of those, so this is a
type error, not just a style issue. GCC accepts it as an extension, and
the result type is void, so there is no runtime effect today.

The macro only exists when the p4d level is not folded, that is, when
CONFIG_PGTABLE_LEVELS > 4; with a folded p4d, asm-generic/pgtable-nop4d.h
defines pgd_clear() as a no-op.

All callers use pgd_clear() as a statement (mm/memory.c and friends), so
use the do { } while (0) form, matching the paravirt definition in
asm/paravirt.h.

Found by running sparse 0.6.5-rc1 over mm/. No functional change.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 arch/x86/include/asm/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d551120a7c88..c79554dac5f7 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -66,7 +66,11 @@ extern pmdval_t early_pmd_flags;
 
 #ifndef __PAGETABLE_P4D_FOLDED
 #define set_pgd(pgdp, pgd)		native_set_pgd(pgdp, pgd)
-#define pgd_clear(pgd)			(pgtable_l5_enabled() ? native_pgd_clear(pgd) : 0)
+#define pgd_clear(pgdp)			\
+do {					\
+	if (pgtable_l5_enabled())	\
+		native_pgd_clear(pgdp);	\
+} while (0)
 #endif
 
 #ifndef set_p4d
-- 
2.55.0

