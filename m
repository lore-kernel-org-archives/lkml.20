Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECCC4BD34E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790285601; cv=none; b=mv0x1tTVJgcYqZG9DNOZh+jV3iLwCwRPz5AtOMrOmh+pfXK6H6Bi0wMRjKDlG+wP4WhX98A6/J7Yo207UM0F4qD9fb5C8tR+Wbyb0EJClN7JGbkkGRK8RVlSHlIkZzJmpfshVg+SPBASnBK51m5W5QdRjOz9ig7AKcJVJSVcaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790285601; c=relaxed/simple;
	bh=xau6Nm+dSBULnBcKscDp+maoooa7Of79tf/PHM8zSTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3uBu3GHaHeqIlGAbWYUPbSqr8cGjWnl8hMxMA2LBqMsd6hv6E9CrCxAm1yWHnf+TarDJXr6VyiI4N1cZy8Uymp422sbF6HMKgVioOLHcoMy4KlN0HsC76+IE/0/A0JR/HYuwtrDiKYEgWBFfwCQTbnrrixswsRlf3ZQi4AwVQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQVXouXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQVXouXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35C21F000FF;
	Thu, 24 Sep 2026 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790285597;
	bh=Gw17LO6QDibHnMy6NnQskiCePw9Il8gsoCqiPVTZRdU=;
	h=From:To:Cc:Subject:Date;
	b=oQVXouXSFS2R6CUhUe92NT7fhDID1egh1xFWicaAuNMqrQK+8W66njeo6lMJ0rxL7
	 wDExtQr4oyLQwhx/jaDXIvcX86z4+0Hi2FG3/8RW5hDzmxVq7kX3X0bBkE7c3eCRbs
	 0HH5MuPykZftMpDpc834Mw7ypVQC4sJoHENqKCZHXdrxhv+Nerhc+O6BCUiRGWb9Bi
	 Jnsz9EiDegmO3JkzwvrqopOh5KxMQNissdz633/BgdEvU+6c43F5y+KhtMeheznR0d
	 Lbca6gpl7uNEm47FQeHOosr7aJHeXv/vGiWs0dZCIQMzSk3gVUtSU3ufwEq99JqIh5
	 a/50e/jEJGlqg==
From: Thorsten Blum <blum@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: process: Use str_supported_unsupported() in compat_mode_detect()
Date: Thu, 24 Sep 2026 23:32:55 +0200
Message-ID: <20260924213256.122530-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=blum@kernel.org; h=from:subject; bh=xau6Nm+dSBULnBcKscDp+maoooa7Of79tf/PHM8zSTs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlbp3OstfkumLdv3pf5sqZtm3WYmsMKdR6VHTbbIzDDR OxwboxkRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkmS4jw7TFWoeEDk7s3KIU pTPXN6zRyPr6aq+d733iP+rElNuy+DL8d77T/72f3bP9+prubKOWd+azLJse9ug7h9/MZuSeaRz FCwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace hard-coded strings with the str_supported_unsupported() helper.
This unifies the output and helps the linker with deduplication, which
can result in a smaller binary.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/riscv/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..967c27f2ae25 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/string_choices.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
@@ -134,7 +135,7 @@ static int __init compat_mode_detect(void)
 	csr_write(CSR_STATUS, tmp);
 
 	pr_info("riscv: ELF compat mode %s",
-			compat_mode_supported ? "supported" : "unsupported");
+		str_supported_unsupported(compat_mode_supported));
 
 	return 0;
 }

base-commit: 5383cf280ef4f00b15f1d9e2a2886d0d02c0118b
