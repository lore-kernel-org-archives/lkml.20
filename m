Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752659;
	b=cLmyKSF+sjnQXSNc0ODCgej8V7pTGZcA5kNQE/eouHpUaw3ChgERnGqGPD2pkH+5zGt8
	 73/Lgw5zp3iBdjASZBAh+rNsNKjHG1lxYop6um+KGpNDPzsGXhAAbaitQCCubUUni1N/+
	 7CXm19ganH0XCvMopYUha6mBCJL3Nvofc6YLxHdk4zY9RLQYYT+oz/PnZbM3jszLoO+WM
	 IGVIpVBT9aoxZAkhw772isbj1vRdpOKQP56SEwDpF9N7OVpTiRo3Vvhv5vRn4NCJCR2x2
	 PH3/oAJJBCJh1mmorJ8vjXIat7jSenBkuKHpyLUqzx2TEuGudnl0JWmaoWgchbDq+lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752659;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=9DiSddDxo1DJKOFsYAMzU/gU3I1QhoE44Zvx3N/6G2o=;
	b=G1fCvSaTqY2Y7/FaFlXcJBlnOAmls06iuqOJPKCraMgmyWwPRTakv9nt2w89WGDeDlBh
	 xSjj+8FR8Qfsh39535MhnQCipEZSkBqOezt3DmfMR2SDTJvN+SxaTW7g4ucdcH5shgyP8
	 fB29iCr3M085QyEA0NW1KnnVAykofHbgu8euMUAppcUHuGQLIQ7XBkX193pLASuwR0iTV
	 wKPT7pWsGNg6KLiuc8ihg+V4RxOD9faTRGkWbgWr8eiiSOQiDJHeCZgFrpZ7KlOOhEZIg
	 G4g5wFDmyiyPBNeGEbJMn+mXhzAjQAJoWicaXh7/zfuZjbHMewKqbM30zAy4I85hozg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceVMqGwz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F0606A893
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceVMqGwz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D911F000C5;
	Sun, 15 Nov 2026 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752659;
	bh=9DiSddDxo1DJKOFsYAMzU/gU3I1QhoE44Zvx3N/6G2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ceVMqGwznhF/g2LxALP1TVs9NV9BvnT5D+8Amgs6xf70MPtv6cr2TswLCKZF4tGc7
	 gK8JnpIt4v+To+JNBbRvB0R9DUwtIMNX09BmCbV15wGQQ2jTsdEqPDnarT+6rdZapg
	 fSIMqFkPX3/1JcizGWjJP5jKJlELRy+MFiiHSQizrzuah0djWcg1sfXpPT0PVujZ7V
	 E8h0WZTATzhTQMC8pendIQGTbicEqvFuGj2PThOCgtwbPfa5Gw2BTnzvSvdaKYTv6E
	 KDQ74LwFrjJxZXfHji2PgfKPZbuQltU/YIXPIqdpgNJUCrdFvU6TTajkdnQA0oLR/y
	 3/458odv0nUWw==
From: Thorsten Blum <blum@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Breno Leitao <leitao@debian.org>,
	Christian Brauner <brauner@kernel.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] init: Combine blacklist entry allocations in initcall_blacklist()
Date: Sun, 15 Nov 2026 15:23:21 +0100
Message-ID: <20261115142321.96774-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115142321.96774-3-blum@kernel.org>
References: <20261115142321.96774-3-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=blum@kernel.org; h=from:subject; bh=9zyT7c3PMXgjfFl+OhSgBZD8YhSXn/ImycIUhP6wRJE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk/D9TvSZ1kfsY2cFHGK6MnXRt9xXSqfFV5/vp+fCd94 jbDiu0tHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARTguGf0oiB3Uk5r9cM1P9 j3irHYt3evW6udEa+Z6TfxyeI/y+qYKRoSfp19uUycYHP8k3dW5rfqJhGVUoLPjr/Je37PMarz7 T4AQA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use a flexible array member for the function name and allocate it
together with the blacklist entry. This removes the pointer and saves
one allocation call per blacklist entry.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/init/main.c b/init/main.c
index db8fb6ebe830..da10f08037ef 100644
--- a/init/main.c
+++ b/init/main.c
@@ -28,6 +28,7 @@
 #include <linux/init.h>
 #include <linux/initrd.h>
 #include <linux/memblock.h>
+#include <linux/overflow.h>
 #include <linux/acpi.h>
 #include <linux/bootconfig.h>
 #include <linux/console.h>
@@ -1266,7 +1267,7 @@ static void __init do_ctors(void)
 #ifdef CONFIG_KALLSYMS
 struct blacklist_entry {
 	struct list_head next;
-	char *buf;
+	char buf[];
 };
 
 static __initdata_or_module LIST_HEAD(blacklisted_initcalls);
@@ -1281,8 +1282,8 @@ static int __init initcall_blacklist(char *str)
 		size_t buf_size = strlen(str_entry) + 1;
 
 		pr_debug("blacklisting initcall %s\n", str_entry);
-		entry = memblock_alloc_or_panic(sizeof(*entry), SMP_CACHE_BYTES);
-		entry->buf = memblock_alloc_or_panic(buf_size, SMP_CACHE_BYTES);
+		entry = memblock_alloc_or_panic(struct_size(entry, buf, buf_size),
+						SMP_CACHE_BYTES);
 		strscpy(entry->buf, str_entry, buf_size);
 		list_add(&entry->next, &blacklisted_initcalls);
 	}
