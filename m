Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63668331203;
	Thu, 17 Sep 2026 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628179; cv=none; b=Szd4XsOkVa110GUYesTcEQMg0HDditpmrPXge/h8tIYC9B4y8PJemzQGCu3l9WmOc9JKxeuxwe5MOnMgyslLnsIrM7Gwa4O5RQXeMMoFHMqgt5avlvCWRqi+NBdRGtO/IPqtwPey5AiuxR9fIXiF8JvW5t4fdHQO5Nj0rfC8Kic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628179; c=relaxed/simple;
	bh=JAYxOz53KiNrjFQxG1WbqqQERIhH2ACslR2X3j5Waeo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=rqE2bdcLTyruo1UkhnNoeQS1COg/1Y+2+cMRSq+gllJG6hdx8Sl6oGz+zaUf+ToInBmY0fWfNgEz4Hc8C17Hw+9YxxeC5CoTB2dvA1km6PIxev6brM/1uC9mANxsiJAdyunh5uwyiFneXzpMnl1Bdxz/sD9UcVxXvLCSBcvuRzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ROJs14Fb; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ROJs14Fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789628166; bh=PXj5mWDpDOqjhTb00e+XGy84HCvylbuQfYwN5uzyfd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ROJs14FbPxVJpvdJv2LuAGMh0r8D4/uUKup7h8VZN/dzfAqRF5idLfyn4lKULwa7H
	 CulJaKURF73oGuRnmsyBZ9d7qSY3bYGxg8Xawquz6aI/YU6RTTtJV16MGm9GLNOv0o
	 xYC1VnUJI7MmnaGtWTt+NxSi3Faac5PzJjOOLmAQ=
Received: from XJSH01426.meizu.com ([210.13.72.171])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E0103260; Thu, 17 Sep 2026 14:56:01 +0800
X-QQ-mid: xmsmtpt1789628162t7il4l9db
Message-ID: <tencent_5B0AF81532EB30CCA672E144A475625EAB08@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznUYzJAzdxZL7clo0Cw8Megp5KcEry5FLmcnF1PBKjb0Jn+Z2/ty
	 1NAsWfFolJNasymySCRGUCepec7QkFYgn3ziPoXirYS5OPJkIf4dbkMXlcqSvjUJ9bopRMk/uIXa
	 3t5fYiKTTUisQuPK8bwWCeQB60zcobFfH/8l9gM/XCVSS1F1GMHXSmHGN9JtrbgPvVENMmPbZP5R
	 oc8Aou5NVPKJnJ9iKx12OP0dATMGy3HX9JojyDdzGe5/Os36Tuz+dF18RRduPHADgcLrAaZ/TyjC
	 65LP9PaCdgAWxL1QNrHcwUUD9wTqEtrRxG2pbN0rkFBPglrrV1CkukfJR8nRoLzoFjjlBKrxMMU5
	 bJmy0bTOHaaNkA4CKDfzsOF2YToiVCjBC2GvqlLYO3cXLYGm3Vubg1wqdw0om08JaLbVivufkr8s
	 KcH/P5oxOXP8gjV4u2KrnsYye+Dszo1OIJXTuZNnuTz7K60zmZU7JIVjk3wL4kGIYK/6ENwWCpuK
	 JncnHNeq3RNMSFdyaVMXa6Uex0BocMyPEVTLCAiW/WgB/F1vfN2bqUhuMgTrHeGIBzwxKm/8eWvO
	 Ni5JI9qduMraRdFAOgn6wp/5XzNdHPdj77dZ2IFcN/25SkOzX36XI8xTHdzmfuHdHhVe0OuOLrr7
	 0OcA5Lx1MFvLkrjM9DhuvRSNJsctvnbOogrN3KGA3YtRwaWCnTpeIE231muIkjb/1Fej92Olf5tY
	 ju4cbT8jPdLf0gVdwUsSzif6EJTOGUQddhLELZv6c4v/pGTPv4dc8Fv4ODkpRTYWVQHPetj8PEGR
	 0WVOwV0egOOOf9a5CQXnX173vr+QnC+xhHrjjVMv/IW0YsbCvzQEtB/+k+3ZKBSoOhGJTSYFqnjO
	 FBdM6Q7hOhqBNyZA905JVR/0TgPAGjKHudnWkuO76YB89Yb0kt6ke8krUB13fN4SOvTTwMBfpWBh
	 MsNfRynpr4Sy3/nqyBMeGO9sZSz5F8h8HzjoC2WF7X6ziAipg3s/Ia2S90Dl0H5P+UJ2spC6cYZ1
	 RsOPYCHl1tTQdliiPB8In8U6v9FKbKpdcO12S8xecAUTjs4gocxKMdCnuOrAiecjPK5xvRy7tgzC
	 mjo19XdK8mSMXUCgzemYyvaGqViXnErcyoM4Gh3whL1DkAHRVUuVXLeqY97g==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Christian Brauner <brauner@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Kees Cook <kees@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Lillian Berry <lillian@star-ark.net>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] init: parse early parameters before memory initialization
Date: Thu, 17 Sep 2026 14:55:56 +0800
X-OQ-MSGID: <20260917065600.564083-2-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917065600.564083-1-zhenghui.hao@qq.com>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
 <20260917065600.564083-1-zhenghui.hao@qq.com>
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

