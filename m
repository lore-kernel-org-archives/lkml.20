Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892484;
	b=JXqH7PnXrQmMM4fvXtM556EXr+//m2out6KEBr7CpQiZw/s3Ngy+JH/BgMnKJL3osZIF
	 6HIhreCzE/BnfR/M7nmDg2olME6yeYJBTclQrfzTmJiP7HH3IYzO3LHDpptZQvyNFkoDV
	 SaBzrDZSVwaqIS/T/jh3sJPV5trFUxOV5hEEgeAfvM9m5rkW4T7406fW0Fujrmv+rXUIc
	 kARHflyQ6Bg6FnmSNyNJuNGigH+xie101osidy/GEwD2QESglJbzIw06l6Fy6vggrWRGn
	 xbdeBDjwfmxHx+bvBK7FUs87361vNLHc7scFJ71I9FNhnpb+iiWGavn89eblMtnCy7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892484;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=+16/xh1x9+viQmW1Od4l3PfPuAdn7sLqIJr4E41Pb38=;
	b=QhSh2oRniM/7ywMbT0PO3+FJwrunE4Ze8Idky6xBuGUCF7UGJp93KU0CpXqSpPa5a+C9
	 H0jVWD5YNEEBP7eDB4HET7Du6rSad6SDbNLteKmn72NKZG9zS/MsyTZ0OffigOKTsgSre
	 kZssnnrLK+ueXR4p8iYR5oH7WLD4JSigT1DeS83zjy47CddTSd9i6WVivhUZMvJzDf72X
	 RLWnWvAKkXEKIGTGxda73pYuUlZbb4c+pvmNiESg0K5B3X2iWtDaiddnUpq1di+CWzLbb
	 S86/uscLJ8UyryQQ7NDib2PZv1rSxS+8W+GcfxspUW8PGAEtdWbhWLi5Nq6/qjnZ5qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqBNxwV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C378606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqBNxwV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFD61F00A16;
	Thu,  5 Nov 2026 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892483;
	bh=+16/xh1x9+viQmW1Od4l3PfPuAdn7sLqIJr4E41Pb38=;
	h=From:To:Cc:Subject:Date;
	b=XqBNxwV+ZKyYMzyvNQtukt1M/M1h7JEcqBKgnFfI1rZvkaFvqzHnBhDwj0zXMtXLX
	 89zOMlckL9TnEuSFE+kQvJ7SDX+TbNHUbJ9JswH1rX8V/eMD+TjnZDpOdo4tanpAz6
	 EBRAEvOco2rUbcNzI4dwTNX62byJVQyGAEwewy08okPdoPulW03BRqD9Nw63V3nMsD
	 /AYGb2tc4CKgw01LbRWZMZo+qn4w/RivkyNHYiWxt6iYi2gC1gn5yGM66kOS4a0R+X
	 GK8+wZoRA4raCrNsBe6ndCEaL49qkZrv626B4trBkLpQRAIEJ0UZWvwwVU4WJrp1m1
	 0rfCRSMuVTzSA==
From: Thorsten Blum <blum@kernel.org>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/ps3: Remove dead printf() calls from the bootwrapper
Date: Thu,  5 Nov 2026 16:27:38 +0100
Message-ID: <20261105152737.359236-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116; i=blum@kernel.org; h=from:subject; bh=/woHg1H5FOYeLNQv7p3oVvU09lNSexbmuU5FdjtVxtc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlvFmSmScXPODLJveUJs0zKt/Jqva7Y7Sc5T8+XXvfSv jSJfaFORykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzEdBnD/0xRhgNykfd8vY0/ xy7Y+3Lx4qvxrCuKFNjPBXB2pMVJejAynJf82v/u2wP+/qyY0t6/ubJFJnMtUp1zlgdfkllktPU /KwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The bootwrapper uses an empty console write callback, so its printf()
calls produce no output. Remove them and the empty ps3_console_write()
callback. Also leave console_ops.write unset and remove now-unused
header includes.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/boot/ps3.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/powerpc/boot/ps3.c b/arch/powerpc/boot/ps3.c
index 89ff46b8b225..c557f90cdd82 100644
--- a/arch/powerpc/boot/ps3.c
+++ b/arch/powerpc/boot/ps3.c
@@ -6,12 +6,10 @@
  *  Copyright 2007 Sony Corp.
  */
 
-#include <stdarg.h>
 #include <stddef.h>
 #include "types.h"
 #include "elf.h"
 #include "string.h"
-#include "stdio.h"
 #include "page.h"
 #include "ops.h"
 
@@ -37,18 +35,10 @@ static void prep_cmdline(void *chosen)
 		getprop(chosen, "bootargs", cmdline, BOOT_COMMAND_LINE_SIZE-1);
 	else
 		setprop_str(chosen, "bootargs", cmdline);
-
-	printf("cmdline: '%s'\n", cmdline);
-}
-
-static void ps3_console_write(const char *buf, int len)
-{
 }
 
 static void ps3_exit(void)
 {
-	printf("ps3_exit\n");
-
 	/* lv1_panic will shutdown the lpar. */
 
 	lv1_panic(0); /* zero = do not reboot */
@@ -83,12 +73,6 @@ static int ps3_repository_read_rm_size(u64 *rm_size)
 		0x7075000000000000ULL, ppe_id, 0x726d5f73697a6500ULL, rm_size,
 		&v2);
 
-	printf("%s:%d: ppe_id  %lu \n", __func__, __LINE__,
-		(unsigned long)ppe_id);
-	printf("%s:%d: lpar_id %lu \n", __func__, __LINE__,
-		(unsigned long)lpar_id);
-	printf("%s:%d: rm_size %llxh \n", __func__, __LINE__, *rm_size);
-
 	return result ? -1 : 0;
 }
 
@@ -107,11 +91,8 @@ void platform_init(void)
 	unsigned long ft_addr;
 	u64 rm_size;
 
-	console_ops.write = ps3_console_write;
 	platform_ops.exit = ps3_exit;
 
-	printf("\n-- PS3 bootwrapper --\n");
-
 	simple_alloc_init(_end, heapsize, 32, 64);
 	fdt_init(_dtb_start);
 
@@ -131,8 +112,6 @@ void platform_init(void)
 
 	ps3_copy_vectors();
 
-	printf(" flat tree at 0x%lx\n\r", ft_addr);
-
 	((kernel_entry_t)0)(ft_addr, 0, NULL);
 
 	ps3_exit();
