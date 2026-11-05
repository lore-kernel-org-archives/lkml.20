Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838702;
	b=HaS+gSiwuI3GZ+b4cQC6/ISFrs5MBa7uvFbWG954NeG/W8W7pPAX1K3N9VkPmZpTXON+
	 ryYO1WDNt9WPPv1s79DjO/dxLHsPrsCC0HODfRum7vsvLEiNB9xKGXWtTJsffA9PyA+uZ
	 tJ/bmM2R9fkb7Mr0wTnVmye6/VI0XCAkT38cvspKZKEuUgGXQAeIem9lID7dEfFaWv4xa
	 urTqpO9Yd+VEfvy6XxlrpvCsDd1mGXSdc+lrbflSqfo6GpLnGuKcbC6VnkLNgPuJ/Bfow
	 OIxH4XQ+obQQOrvC2RsgwuZqGVdTjpwdAM4Rut5gWvkyEMmoycsT/vegVJ87XpXmUGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838702;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lAmBesaOP9WbY92VQ9mycf1mX+fARPiDETnXQKonJVU=;
	b=ws3jmSG+FpTkRrkC5TGXqjwtJQ56ctUxeW9eealyuY8qeMhTryARKIbyT+FqQOgcza/O
	 H6wlMdHuxBU9q0xoGmZH+QiQDMv5mpdO80fgRS9rMwURtxwRJS2A1cN8NpL5DOASqKAeI
	 t9uW4x4bwQnJyLRUZEit0c/2nqGrAKMFlsXZItGwyYGbAygFS7L0EfGqIHlDu5xwJz4A8
	 N8UJdQrL8uUJTPbJKdXdcU8EudI45NO5IwSXrvIKGuackdoW9GV6B8xR/tptwKYik2Zux
	 6aYdFleSAuvsoSZzr5fJtZdH+dTp5b1wo/R/gZpxzF7UDSStVFLCkiGhZF41pKxzOig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=H9jVLqyb;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="/4zWFp47";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2520C606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2520C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=H9jVLqyb;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=/4zWFp47
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793838697; bh=lAmBesaOP9WbY92VQ9mycf1
	mX+fARPiDETnXQKonJVU=; b=H9jVLqybn0vtAdiv+Rme08HoPWX9WZGnzYifHnYrzOdUMXTwF5
	/xbgrVlH3fG+0A1y5By80uFLVaHO2sjKjtdDqAw2PXMQcij3arrY0tudg37UWZfmZF+da1lprYo
	kFiA3RGvqP7tS8AUqKyBkUNgItDFtkEBXhsNMkgJNdO2vEd5NUE5YGLpV2sATMr81y1/NHMDvMn
	NpRCRp3wQ8bSSvLXdjZ0iHFcwnXCMO3JRCbeh5zRDmEqT8vyOiTUcW+olD5gYiILSYFuH9fsvUh
	+ROINK5OMZUtQ7UvPCt61BEhm1xg65mboPR4LyCogcMZV3AGFzjv/u++cyPETdDOMnw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793838697; bh=lAmBesaOP9WbY92VQ9mycf1
	mX+fARPiDETnXQKonJVU=; b=/4zWFp47eSy1X+Fxo6L85qyYdGYQ144tcdPHhlOaOEGPaCM1xk
	D7ix338zpK/Ct/NaZh0YljbmoqH2kTf7GIAQ==;
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] compat: make compat_sysinfo() scale far enough to actually fit
Date: Thu,  5 Nov 2026 00:31:29 +0000
Message-ID: <20261105003129.3130709-4-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105003129.3130709-1-brads@mainlining.org>
References: <20261105003129.3130709-1-brads@mainlining.org>
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

compat_sysinfo() checks whether totalram or totalswap is too big for the
compat struct and scales the values down to fit, but the loop stops as
soon as s.mem_unit reaches PAGE_SIZE.  That caps the compression at one
page, 12 bits with 4K pages.  On a 64 bit kernel do_sysinfo() always
hands it values in bytes with mem_unit == 1, its own overflow math runs
on unsigned long so it does not bail until 16 EiB, so the loop runs its
12 turns, the values come back out as a page count, and anything past
2^32 pages still does not fit.  Storing that into the u32 field then
just drops the top bits.

So a 32 bit process on a box past 2^32 pages gets a wrapped number
instead of a coarse one, with 4K pages that starts at 16 TiB:

  ram      old                  new
  8 TiB    2147483648 x 4096    unchanged
  16 TiB   0 x 4096             2147483648 x 8192
  17 TiB   268435456 x 4096     2281701376 x 8192
  32 TiB   0 x 4096             2147483648 x 16384

The 17 TiB row is the nasty one, a 32 bit process is told the box has
1 TiB of ram.  Keep scaling until the values fit instead of until the
unit reaches a page, the unit then says how coarse the number is, which
is what mem_unit is for.

Nothing that works today changes.  I ran both loops side by side over
ram from 1 MiB to 2^56 with 4K and 64K pages, they disagree on exactly
the inputs where the old one dropped bits and agree on every one it got
right.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/sys.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index c4839c986f5e0..8f683b6bb87b8 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -3035,24 +3035,22 @@ COMPAT_SYSCALL_DEFINE1(sysinfo, struct compat_sysinfo __user *, info)
 	do_sysinfo(&s);
 
 	/* Check to see if any memory value is too large for 32-bit and scale
-	 *  down if needed
+	 * down if needed.  Keep going until the values fit, not just until the
+	 * unit reaches a page.  The values halve each turn, so this ends.
 	 */
 	if (upper_32_bits(s.totalram) || upper_32_bits(s.totalswap)) {
-		int bitcount = 0;
-
-		while (s.mem_unit < PAGE_SIZE) {
+		while (s.mem_unit < PAGE_SIZE || upper_32_bits(s.totalram) ||
+		       upper_32_bits(s.totalswap)) {
 			s.mem_unit <<= 1;
-			bitcount++;
+			s.totalram >>= 1;
+			s.freeram >>= 1;
+			s.sharedram >>= 1;
+			s.bufferram >>= 1;
+			s.totalswap >>= 1;
+			s.freeswap >>= 1;
+			s.totalhigh >>= 1;
+			s.freehigh >>= 1;
 		}
-
-		s.totalram >>= bitcount;
-		s.freeram >>= bitcount;
-		s.sharedram >>= bitcount;
-		s.bufferram >>= bitcount;
-		s.totalswap >>= bitcount;
-		s.freeswap >>= bitcount;
-		s.totalhigh >>= bitcount;
-		s.freehigh >>= bitcount;
 	}
 
 	memset(&s_32, 0, sizeof(s_32));
-- 
2.53.0
