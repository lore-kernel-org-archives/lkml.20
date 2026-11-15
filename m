Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752655;
	b=Y5PR7BGO7VYDvCMB7wLeMueyXVxPtX5VrkhQUcKSgr4K8+tmtiG+6yCXQ2cKfTQCTC5B
	 DjdGtMfdE/uB+xv7zQ0JG8mhSmaGGerzaY1uuJ6Mew73xseAZ6u82YhHUKX8fXpOiT39g
	 Pw+cl3MMN5KC+vs5jvF96OsYGF0e88QnjIVljMIGKZ1v7MmeKbih4g4VJwtvCyCjJPwYw
	 4icKb+CPZEY/OIk3/NxuTf12//BfekZbuorasUG84JuxjY/jgASZOrpdO2CayBCk+ekoZ
	 X++VDeEQ7GebInUvSuKuOr/kD4vMAwX/aY1VX/5oun2V/SCiBnxOiEJZTEP3soD1f2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752655;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=bDs/Qv2mueZ/h8rLUjf3gz44+9tcKwUIvLceTP3Blrc=;
	b=OFnLflCwtjKdql/uHS4+pc/RjWyDbJJw4sghBHHBe9TNNHBYZiExFHv5LQfeqyiR04wh
	 gIh1cHJnbOnx58GQB2NOIFk5H4NRSSgR/Xt57a+pmPW5BbffwGusmQta808dOilkR0Hep
	 +aBQPzMAIJJagifPkYfQQoRjtAZjyv/7PfvsyzxXY2CwrdYs7/OPXBWVzl5M5HeT/hr8E
	 jidChawPpXprVOgDmcbg7HMPQe+0InwpwZZnr+9QAKNBy3PHXLx2Up5Afe4X97aHBnB0E
	 7rVz4TJ+5NFCXDewz4C2gY40TgUZiIw+pVVq1N+qAzG02ZbEOReMwOT6ve+KGUmF2sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a91k4kDN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499AC606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a91k4kDN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74701F000C5;
	Sun, 15 Nov 2026 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752654;
	bh=bDs/Qv2mueZ/h8rLUjf3gz44+9tcKwUIvLceTP3Blrc=;
	h=From:To:Cc:Subject:Date;
	b=a91k4kDNS+tawtCPaXHuETWCIRbgqeC5skMa2lLyT58EhNUolJb3jDTmxgK/hxW0E
	 7TlUgw7WWTEx503LMGw0NS3OaxPLIVYOBzFxTYQJ7m4cKV+oHr2+U0STtRiWH8Xezt
	 lEK7tHRhOuVL8dpP46yzWVblfWnFhvvV+3doD8zza86DZwrX5va0gesO3nbMNmro2T
	 9aj73pw3mdlthwXm+Kqh69epSd/LtjlWFC30RWLGT1ZsucS6WtcTkZ19a+1J0frY9H
	 fT+uZcfLE733O56ot7+4n+8cHZoM2FyQryNkrBO8hOQ0CAOkTgjMmTfd9dN/opyKa6
	 xCRBxcLgT4x4g==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Wilson Felipe Pereira <wfelipe@google.com>
Cc: Thorsten Blum <blum@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] init: Use strscpy() in initcall_blacklist()
Date: Sun, 15 Nov 2026 15:23:20 +0100
Message-ID: <20261115142321.96774-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=blum@kernel.org; h=from:subject; bh=t6EoRzeskT2CIzWHUWQTABxvI8rfQ3++KNVIzN0UG8c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk/D0QGJL8UsPi0wGVS3n0NpW8Jisu9i9QTnGXDcrc/q N76fffjjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjIxhqGP1znPou7sxxn1jmR LG7E/kfs9GrHA2auG+KWxj9bx3yaK4fhn/6dsrKu/EClOytayhfZbV2TdHZRHdOmyutl7pwnhMt 2MwIA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the deprecated strcpy() [1] with strscpy() to bound the copy to
the allocated buffer size.

Also use a simple while loop to reduce code indentation.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/init/main.c b/init/main.c
index 500584688744..db8fb6ebe830 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1277,18 +1277,15 @@ static int __init initcall_blacklist(char *str)
 	struct blacklist_entry *entry;
 
 	/* str argument is a comma-separated list of functions */
-	do {
-		str_entry = strsep(&str, ",");
-		if (str_entry) {
-			pr_debug("blacklisting initcall %s\n", str_entry);
-			entry = memblock_alloc_or_panic(sizeof(*entry),
-					       SMP_CACHE_BYTES);
-			entry->buf = memblock_alloc_or_panic(strlen(str_entry) + 1,
-						    SMP_CACHE_BYTES);
-			strcpy(entry->buf, str_entry);
-			list_add(&entry->next, &blacklisted_initcalls);
-		}
-	} while (str_entry);
+	while ((str_entry = strsep(&str, ","))) {
+		size_t buf_size = strlen(str_entry) + 1;
+
+		pr_debug("blacklisting initcall %s\n", str_entry);
+		entry = memblock_alloc_or_panic(sizeof(*entry), SMP_CACHE_BYTES);
+		entry->buf = memblock_alloc_or_panic(buf_size, SMP_CACHE_BYTES);
+		strscpy(entry->buf, str_entry, buf_size);
+		list_add(&entry->next, &blacklisted_initcalls);
+	}
 
 	return 1;
 }
