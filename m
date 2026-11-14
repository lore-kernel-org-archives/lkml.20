Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675437;
	b=5nmoREZXWkGzEgWv+p/cboVW/aR/oEh5fjKH4RnS9twkrpAis2GMqd3l55uXN9VmyvT7
	 RiZR63+z9r2R6VThyR6F5mZaO6+KPUxMrQHPbQna3sqWHC56ik/1pEyTZVQNp3AmirKxH
	 3hlnt7vM+3CSX0eoRFPfQSKt+vgrtN+utrnumGqqdff+z0BQWXzDpS8CXehcIZlSc6m7A
	 Xs8CwEzhN+Ft2E4AIKxaEb4wzqRuC76CIg7U7TkzQlzRhpV+bl/CUqK6pzV+Hm+6/c6YJ
	 yXxu7yfv1NKfny4QBUy9T0ObYnXUFbQLKZUM7gURdKmp7ZH9Ok8OaZBfTtixRl2bjfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wr4kdk8C2zCB8/tTYG73CAJVXLDQ9d7LAKTuJISMvv0=;
	b=CEqQkk99x9s5XUBYKcTT10DHcV5N0rZsGVGAGTvfkpuR4UF9+79MTT8/d44Jjr9vdhKJ
	 oqO0GfcBU3ApkHybexiJ44l24DX81VIE/HJVjPoKTFuSxD7o3ghnFuvJelzhdMfGHO3fe
	 Nxx4HdrXmEgVX8QyW04UcEktIs3gutecIa9IWTydFMfJiZ34PWk9yo+rbGQGhdWhTBeXj
	 XT/gp6ucvBW+rx79kPC3zvhg0l7wt0PxMd2USCGnmv86x33OwyQdGwZPTPtHQWwKTDfjL
	 subE8PyoCvYW0qdXIbIzwvsz3LITO5knPmAusHEvEBOYxM4XATpliJhg0MzQ8uVeEcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4Ei6ecn;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869F60A3807
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C869F60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4Ei6ecn
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so2258583e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675435; x=1795280235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr4kdk8C2zCB8/tTYG73CAJVXLDQ9d7LAKTuJISMvv0=;
        b=k4Ei6ecnHRY1e/0/w/PKq2+Ze9Gqhi+rtn0BBcjUFOYg/bPyzuVdefRH0j6dwoFUG5
         TaH5kVxvrdC+S9ih5z2ZHBacCqygR0l5xxeqFcB0Fqrh2da9oFtMa7oM+zuN7PHdPWWq
         V5aYzDU9vBVd2Ai7fjK2bivx91LbCRa9qJhHBFicUGUcwnEiLG3OeZWZT/qmGbJrzn9d
         6PTVrjages/NJZ4ZM0ra3z98iy4yeO4kqsJX1r6LPkA/htBqh2bgGnH6VHU6VeoBudm6
         d0hkTtyzQzv+VcEODbRSpoD5RhE9KLeENMzR450c9OebWnARW/JA61n4EjA8PfOea9S1
         XrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675435; x=1795280235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wr4kdk8C2zCB8/tTYG73CAJVXLDQ9d7LAKTuJISMvv0=;
        b=t7hlx7UMcRMNGMkdkHL+ClG2b9t1nOzTbfA5QOizpLoE6G4F4A6yRB5aj7Me58WZRV
         PKa8KhdrPLb9MuvLsFDOhs0rQDgvMAomrT7UtRElcXqa0TwSZx1pCef+ojzT+s0lY1sb
         Crzg5/YTI5TcGhRm6XIDbTH87Tu/onKrpU2yzXmL6XVXQxXJcONhhVpxJbtQ9saSDiY8
         i8jc+cLrYCO/VwPvKjzUvyvokSqv/0wJQR1cPnKq8ftaf6v0mU7V58b+nknGb23gCDHc
         r8p/eK091S7mejsqAq0VXlR/ywZtnZ2arNTJDx3oO/a7FarPZhU9d8SNKaLUEBqOs8cs
         wpdg==
X-Gm-Message-State: APuU4Z+iaOa3nI95QfIA9z/KI5+DVwE10AdhCWL1htGLuiueZAhdGA63
	nLjzqkeeVquXS/p3HvBm/MxxEQJ/B9co/nPH8Yi9S1QqH3fdtPSsg5Ie
X-Gm-Gg: AYBFou3XdqiNpoxRWkNJjtWvyhZxr+oTmfZrRqCGP6+aP9i/wB6+/sAUMOU1xwZcCeo
	934h6H40wYVrik0ynwTruuMf49VLWxbqgJc0QRla3oVoOC3/cr25p66BF5Pev7jinQsbyFAJWdB
	7t/ltDIvSu7ujTh87tMBs0vFrXvtWr6jU03OfjWbAEFNoTjOOtsGEkvfFFonO9+GZVpfRFNUs1p
	Szi7mbbLnwEelKHyuypWJt0BxUZyjWioAClrbpE+eD5Iw5xRpfEtkSB3CJXePrUl5WyPj2BC3UT
	Pi3FfYElkeEWY3qwHgAaZJagm29BqQU1p9a0dbd5z2cUx0vCddTMXKs0rLohQUf+YB3uPbUaxLo
	r0fsglMyCI0RGxdUS4ci90/+Mb0dcr8IiSq49/XAHix2UKoDwv76UJedTLE2ffypXdIPw6ReTn/
	s/7/9uFKnm4EOlevf5/kM0mRfOLOjenymoHXT6Eh7EAAVTqreYLD5YpEbBXYsLueGMO2Jx7gtdU
	iWzU4sP74kjiUNtQUGFkXxsc81crH9ocEHCAzUQGW7IKd31hyng3pPDgXFTePcb7pCWpJ24l5mr
	9mf7Yoqcols6p8ty7Bh3ErJRNf+ilU5D8XktuNOZYzs9J9PZsJCw3SvQE9PHkt3X8phDcKJpQhb
	4QBzBtRpskNlG0rQjECJxogSSdr3T4X41
X-Received: by 2002:a05:6512:618a:b0:5c1:5278:f9b7 with SMTP id 2adb3069b0e04-5c170b1c7d2mr2300190e87.20.1794675434789;
        Sat, 14 Nov 2026 08:57:14 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:14 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 14/14] suspend: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:54 +0400
Message-ID: <20261114165612.368785-15-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/suspend.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index a38150277..b97af3420 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -385,8 +385,8 @@ extern int swsusp_page_is_forbidden(struct page *);
 extern void swsusp_set_page_free(struct page *);
 extern void swsusp_unset_page_free(struct page *);
 extern unsigned long get_safe_page(gfp_t gfp_mask);
-extern asmlinkage int swsusp_arch_suspend(void);
-extern asmlinkage int swsusp_arch_resume(void);
+asmlinkage int swsusp_arch_suspend(void);
+asmlinkage int swsusp_arch_resume(void);
 
 extern u32 swsusp_hardware_signature;
 extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
-- 
2.56.1

