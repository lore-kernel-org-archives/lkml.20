Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AB239CCE3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338405; cv=none; b=C3RO7y5YqZGo0DRh94xF1qAnp3DD5WqEEBXs/uAm3D1/fAJIQMIKyOgO72mK2xsitAEJSGT52QpCRI0FNiH3ZmxagZBtElJunETzNamkvixG9lNb7CO9Whc8nzDjWjE9jiRVChrNikeoVSR7w4dKD4RrwvRDimc59/vAuEweHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338405; c=relaxed/simple;
	bh=n1XHE1u/1bOL4COU0aH9tewgd99zUDsSp7t2oHPC4uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MH7tUnDmPtw2icewwfGDjWcnEGSwyEhcJXJ3odMDDAd0muHAOCsB18m6ETHF1fqFwt+utvcaqi+cQwoT8ltAzZAfEgvA1Sl0JXhSqhD64BBwpGKJ4uKThq2XNhXtZRU7rwEEg5FQGqqPjH9bvutjOJru6W639DrwLWKx+MgO780=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OOrAFyBA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OOrAFyBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789338398;
	bh=n1XHE1u/1bOL4COU0aH9tewgd99zUDsSp7t2oHPC4uI=;
	h=From:Date:Subject:To:Cc:From;
	b=OOrAFyBADVzNbRAf104zyr8baRr+Bf5u1Qq4q/jh0bnfzF6x86Xtpg/TVs24Ye8+y
	 FF7+Kt/29yYSZoTwlz51TSrUbs//ecj6kBqFkMI70JsnoA/O61ExDsuJHWLJJu7GWr
	 NZdjuzVXiYmRnjb4ycUYBH898a7RSXZqOdqWE5pM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 14 Sep 2026 00:26:31 +0200
Subject: [PATCH] tools/nolibc/parisc: consistently use %dp to refer to
 register %r27
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-nolibc-parisc-dp-register-v1-1-6388f4aa8fbe@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g3oaC3TqxQXTow2pYxDolIQ7
 96xXb7F/zsYq7DBvdhBeROTOWZUlwLo2ceJUYZscKVrS181GOe3BMLUqxjhkFB5EltYsb6yuzk
 fyNcecp+UR/n83o/ub1vDi2k5h3AcX+T5drB9AAAA
X-Change-ID: 20260914-nolibc-parisc-dp-register-35e2729bc939
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789338397; l=1208;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=n1XHE1u/1bOL4COU0aH9tewgd99zUDsSp7t2oHPC4uI=;
 b=iZUFlrpjdTbX0R8zA0/hMYitt295zqCzvmCgwmtl3kw5W1r83rr5PulKByjJnAczS/UM35FN8
 Byb4QiZX4GgC9LPf2it/CCi4yX+jMpAJf2GhsHqDaEr/RGUodePhzZT
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The parisc initialization code inconsistently uses both %dp and %r27 to
refer to the data pointer register.

Consistently use the %dp memnonic.

Suggested-by: Helge Deller <deller@gmx.de>
Link: https://lore.kernel.org/lkml/495ef25e-0bac-4f98-b0da-ae0d96dcea59@gmx.de/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/arch-parisc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc/arch-parisc.h
index 417043ecbc53..ca219cbbabb0 100644
--- a/tools/include/nolibc/arch-parisc.h
+++ b/tools/include/nolibc/arch-parisc.h
@@ -169,7 +169,7 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 	__asm__ volatile (
 		".import $global$\n"           /* Set up the dp register */
 		"ldil L%$global$, %dp\n"
-		"ldo R%$global$(%r27), %dp\n"
+		"ldo R%$global$(%dp), %dp\n"
 
 		"b _start_c\n"                 /* Call _start_c, the load below is executed first */
 

---
base-commit: b8d9d2966cde80ec3de37d830ea855c1a58d23dc
change-id: 20260914-nolibc-parisc-dp-register-35e2729bc939

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

