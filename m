Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9953B42C0;
	Thu, 17 Sep 2026 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626532; cv=none; b=PCdRwgadYuFFpldr4AxpZDX2Xp0mCjoiVuM/W4/tIg1rHojnf6eC20srV+tmY/bRG/qOQLwVfbOEP9jvEn43hiKPXsJyCcK+S5eI6Z5dXFvGtQ+Utsh/2ADHht4f1G/GEqOpQ2dpNharm6fEUyKB4JDqVaRucNx1/uLdDb8LUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626532; c=relaxed/simple;
	bh=JAYxOz53KiNrjFQxG1WbqqQERIhH2ACslR2X3j5Waeo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gOs1UTmIJbRUAUSOu+te63gY+fi84YrfCJ4LGV8R8PFVAdpsmDtPxIbm38V2Yi2ldQ2vKUK5WN+2MVQ5jgmngACqj9qgWLdImNBW1eHEuMVPhMePu6sPYqeEwwNQZ+mcDJKgmU5FkEJk3fl5SyQtGQF6BcoDqyRxKkPPrX7iS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ABv2VHay; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ABv2VHay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789626520; bh=PXj5mWDpDOqjhTb00e+XGy84HCvylbuQfYwN5uzyfd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ABv2VHayEFM7FrFqj4jnFdq1kaRVucIDG9WlwoMT7TpOl54YSBeu4WcErsuofSaEG
	 DQvLnqujxTSuimh1gRHztYyj6xOzy38n9ji7/LoFXs/pk0ruYW6hZd+5C4VsBlSQws
	 Uhg+IckpzZx/F+rmcwLyDQiQZwuQXUw92RO29CAs=
Received: from XJSH01426.meizu.com ([61.169.203.203])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 7262065D; Thu, 17 Sep 2026 14:28:38 +0800
X-QQ-mid: xmsmtpt1789626519tb1c43s44
Message-ID: <tencent_5E32AE3047A6AAE154A4456255AB4EF86308@qq.com>
X-QQ-XMAILINFO: OKpYw3E8niLaObX1mFmxHyzoCZ9MMYM2Wai7JTr0DrvYLeawXoali8jMY0k9ic
	 5uNhmvVyP11pVocVRU17w5+tClYRDBYcIlxpy4o+WS8gwkKidM+IXN8Td7lf/j/QOb9LytJZrXSz
	 sqWK+NOtMzBnqR9rNgrdp+oPt+Lz/AGb/MBuuTVSBWFmUf4tTE2N/I8GYucexKd/zEVHx4Duny0W
	 kLLSlogfiypHlMs8tOhPQZnVrr4Dm2FaO8Ouj1i/9YCu+FVZhNu3upwA4GESu4wlelQ+Tvz/YbSC
	 eD15osjBqHuxmvHSMiYTUvPAy5elPJJqohhgfBapztzYB+M3tMHjHLwAZEkqgh9ITXlAMgheg7t/
	 49SxMlXlNBBSjfZNOxLQFZLwoNesKcfQIewuN6UC9/1LCd/ovl5j0POvHgNcO65WEZA7rWDjHEEh
	 JG9zf1zgXB2JrI5Te5hwQ8cbmqjuY9rmjHkHqujAS+muxsbAynM09j3ZhJGKUUO979fszlSpAd8J
	 +HHbn7wyBV2d7TadCKIvRFPvD9q15eurtWQ1V0ckH65R+CF+DVMocHTUV9MPqY8KIDtooe0KYZcL
	 RvjxlJ8wlBRMI7+NPIS+OzUtCU2qo9dgLGP/IZEfFr4VetM9oFJx8mrwWJor6mgQM8EyFPBJ0zBy
	 Yy2AX0Fjai50bt0LrWuKE5nFB09b2bfUMdchorQpSj9x9k0G7f2TtxdonEQaZ7IlBBPxgJD6CbYG
	 4/jCQAPQCQcKYTZIOaIpCB+xbNd6LdrcjdKrnVqJNiClGJd8bkkCtmkW8WxXcM9T7xS9QzoTxcH4
	 5mruR157GDad8pCdKxr2Z/uQVlI+ATb4ymck0w3PzNTucBopPfPUVzzPFdkCRSDcDTAm7eEO0ZY8
	 1z8au2veU/rX1rgHsvtnXmLb00Fbokb33dDHQE/+HFkhb93gaGhnKdCTzpZ3wr0mcUESZM7DLd4Q
	 ybigwZ0EOwsDefwOi8Y/Z80TagtFM2/xZkqczFfaZ8KWK/LIsjosL9nYzfsgQliB+KaH6BKLKqeR
	 xGaztVNkc6uyRYMcIYuCg3hmn62nxAeVruZRV5jWK0c0QNGEO2mzDNAiBRlcK0Zfvy6lUrtL4tei
	 8Ef0d/uDq+JTpqXhI1/F7mvaAf0fhi6Syv9q1jm3nuIKwzf/M38IFEUmgY5A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-parisc@vger.kernel.org,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] init: parse early parameters before memory initialization
Date: Thu, 17 Sep 2026 14:28:36 +0800
X-OQ-MSGID: <20260917062837.558251-2-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917062837.558251-1-zhenghui.hao@qq.com>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hugepages=, hugepagesz= and default_hugepagesz= parameters are
recorded by early_param() handlers and consumed by
hugetlb_bootmem_alloc(), which is called from mm_core_init_early().

Commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
zones and memory map") introduced mm_core_init_early() and placed it
immediately after setup_arch(), i.e. before the generic
parse_early_param() call in start_kernel().  Before that commit,
hugetlb_bootmem_alloc() was called from mm_core_init(), which runs
after parse_early_param().

Architectures that call parse_early_param() from setup_arch() are
unaffected, since parse_early_param() only does anything on the first
call.  On parisc, which relies on the generic call, the parameters are
recorded after they have been consumed and are therefore silently
dropped: neither do_early_param() nor obsolete_checksetup() reports
them.  hugetlb_cma= and hugetlb_free_vmemmap= are affected in the same
way, because hugetlb_cma_reserve() and sparse_init() also run from
mm_core_init_early().

Move parse_early_param() before mm_core_init_early().  To keep the
"parameters may set static keys" guarantee, move jump_label_init() and
static_call_init() up as well, so that they still run first.  None of
the functions called from mm_core_init_early() uses static keys, so
running it after jump_label_init() is safe.

Moving the generic call, instead of adding a parse_early_param() call
to parisc setup_arch(), fixes all architectures at once and makes
"early parameters are parsed before memory initialization" an
invariant.

Not tested on parisc hardware.

Fixes: d49004c5f0c1 ("arch, mm: consolidate initialization of nodes, zones and memory map")
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>
---
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index 31f2bf54976a..bccf521910be 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1007,10 +1007,12 @@ void start_kernel(void)
 	page_address_init();
 	pr_notice("%s", linux_banner);
 	setup_arch(&command_line);
-	mm_core_init_early();
-	/* Static keys and static calls are needed by LSMs */
+	/* Static keys and static calls are needed by LSMs and early params */
 	jump_label_init();
 	static_call_init();
+	/* parameters may set static keys */
+	parse_early_param();
+	mm_core_init_early();
 	early_security_init();
 	setup_boot_config();
 	setup_command_line(command_line);
@@ -1021,8 +1023,6 @@ void start_kernel(void)
 	boot_cpu_hotplug_init();
 
 	print_kernel_cmdline(saved_command_line);
-	/* parameters may set static keys */
-	parse_early_param();
 	after_dashes = parse_args("Booting kernel",
 				  static_command_line, __start___param,
 				  __stop___param - __start___param,
-- 
2.53.0

