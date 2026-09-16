Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522037C119
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572732; cv=none; b=A2jvZnQMgU28psbBrvi5+flDP6V85TCAhUotfVe9sJIFYvDBMfGGJhOhPYFzCvBo+RhQMF4YAJtdxLenxP7sPv77lvSSgmVtrcn8IJb2n877aWzA4meXUkukTANxpsfTrsuJBA+1FskPPoO6C4Pyq2liicvUTLcLscSp0/zo8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572732; c=relaxed/simple;
	bh=6cJZ3vF0dSDjjEMMG9H2JHANKMhOY+wqpAkHW2i9jYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osOYiVPE+iScUTa2U0KoTl0g+VFfDf3JBv+g1xQfRTmzA+6xFBcNvE1azDOkRSO8xpyRChyPT7BpLFJ7VtDVEZhZpvFV33AMLDUDJTuvbpVynWBQiPQUOrK1BLoT7CyHdYtgk7741QIV8m+bzyDG1NKuRLv6Y9qMQRGkvJNtXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzhTXwDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzhTXwDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2864E1F00893;
	Wed, 16 Sep 2026 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572725;
	bh=r+L+gdmlejhQNmtecvJQTWNGDQdwYrl4NsxaG1tw1go=;
	h=From:To:Cc:Subject:Date;
	b=hzhTXwDa2Qo+pmZ4YoZsP+RopMjaOH8/EFzDBkw4eb1XHwdMhB39araxeWwgADPOq
	 pYnfRc9aTr+p+ELU3hp8lvVV3Qf5GnwWsEY0+Py7rbPdrm52t2D83Qy3MwvbSvemgK
	 9NX0R3PvbM1aO6Qx6Db1XkwNRDELcXHR8WTw6Hr/EGJQAQTblRbXuHDLjNVgYmF27E
	 sjRDoqy/UBenFAbuKFw3z9obu79qycztHMaAeUW0kk6+Sce2I5z4YViwmmKFQzZJ/Z
	 F9MEqsFGzyFJx4xNzSO9ltdlMTmC+OBwLlP2V5SbhCs8MGZOPo0Eeu+XiHCNJC/5f7
	 J6eKaT8Fwwt3Q==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Thorsten Blum <blum@kernel.org>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/kexec_file: Simplify add_usable_mem()
Date: Wed, 16 Sep 2026 17:31:49 +0200
Message-ID: <20260916153149.127278-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962; i=blum@kernel.org; h=from:subject; bh=6cJZ3vF0dSDjjEMMG9H2JHANKMhOY+wqpAkHW2i9jYQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmrtqW6LnzKtdX5g/DrurMLlHqd1aT1H8UVRCp4J0TM+ f6theFARykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkbSojw623mb/NhZbminyI 2f1yddMLg/fBsx6FhZmmnCqO2sO25B3D/1CBvUZrLVZu7J0dkhrQz1FrN/HcEx2FlTzH8zasYG0 15wAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use max() and min() to calculate loc_base and loc_end, respectively.
Skip to the next range if loc_base > loc_end and drop the now-obsolete
boolean add variable.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/kexec/file_load_64.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index bd80c5fb1b1f..6162afbe919a 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/memblock.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <asm/setup.h>
@@ -104,31 +105,19 @@ static __be64 *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
 static int add_usable_mem(struct umem_info *um_info, u64 base, u64 end)
 {
 	u64 loc_base, loc_end;
-	bool add;
 	int i;
 
 	for (i = 0; i < um_info->nr_ranges; i++) {
-		add = false;
-		loc_base = um_info->ranges[i].start;
-		loc_end = um_info->ranges[i].end;
-		if (loc_base >= base && loc_end <= end)
-			add = true;
-		else if (base <= loc_end && end >= loc_base) {
-			if (loc_base < base)
-				loc_base = base;
-			if (loc_end > end)
-				loc_end = end;
-			add = true;
-		}
+		loc_base = max(base, um_info->ranges[i].start);
+		loc_end = min(end, um_info->ranges[i].end);
+		if (loc_base > loc_end)
+			continue;
 
-		if (add) {
-			if (!check_realloc_usable_mem(um_info, 2))
-				return -ENOMEM;
+		if (!check_realloc_usable_mem(um_info, 2))
+			return -ENOMEM;
 
-			um_info->buf[um_info->idx++] = cpu_to_be64(loc_base);
-			um_info->buf[um_info->idx++] =
-					cpu_to_be64(loc_end - loc_base + 1);
-		}
+		um_info->buf[um_info->idx++] = cpu_to_be64(loc_base);
+		um_info->buf[um_info->idx++] = cpu_to_be64(loc_end - loc_base + 1);
 	}
 
 	return 0;
