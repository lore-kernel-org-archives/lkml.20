Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906079;
	b=iN+9lt2WTbL05exscSwK8+hTYdzY1l5gLf8Sw7nRF3t1LRHKLINLG0qGiNLmYsbRpPb2
	 RtGdJPx5QMeJQ+OFpHl7GprWhRNt7+c+psSegb1xwgtdZv2NRAdcpOIXLcBvOMvGRZzfg
	 V1BbYwV/xZf0dCkGyz1wSuEbpsgshT4aE/Pt5jH0ZopDhmu2297QNn6nqRzhC65rBeowR
	 4QyeieptmanKXkVFAWfYqoy2+sezZGGh7tUEwCughYyGvItNCcBqenbQBx6rRlPlobR3m
	 nPXLPjl03hShwX8JrVb/bz83Y0geEatD5WI9x5Bec03dsJDw9s3bnxguFO5IxRZ0C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906079;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lgnyWCmS4wbw2sOx9YxTFkGzc3PfeXfQGjVVFAeJb5c=;
	b=Q3XQOrqYnRo7yLyj78HwaWW8phhhij/dHev+75T26a9/E4yZEDwqoXdRbRHAeVcU72Cs
	 P6A5MForY5KSaxtKHnazyheIcUQSSRVU59ovFnRHWGIM7c9gVOPR4TXqZpBev0KTfNMfw
	 rd2Ww2TEMjUT0pz+0FHls9NAPbm2dOAAIQNMReRigucFsDgNjh0PGuPjjwBzy+9JzBqve
	 Ty18kYLD3Y5FBktWVSl3dMLrbUK2B5cNtf3NtxhZTvOYc4J0iIvGamrL+qwwZnp/Ja2Y2
	 gIy86iViYKCkUN6V8Q+/KI4GB+zywAD0pTDEmKyi1HenLgkGdc/Ujsp7agsxMnb6yWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=m+vpdv0h;
	arc=none smtp.remote-ip=115.124.28.220
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209C606A330;
	Tue, 17 Nov 2026 09:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2209C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=m+vpdv0h
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794906075; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=lgnyWCmS4wbw2sOx9YxTFkGzc3PfeXfQGjVVFAeJb5c=;
	b=m+vpdv0hOAq3ThNi5qdsWbuvr5SSSy+QKAsZGWE109E1iWmRG5+sna0I3mzrPE45LcTmN/NKHB9wvKGqnoN7t3nhI4WVhSOuH82ogADCGOTwVOx2cAra2+OYHKlY5mUrKezyU4ZB9Kqef86/yw4p1ZTWUOB9fUa2BtLSWt3WfYQ=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00415204-3.12034e-05-0.995817;FP=18023237027564127416|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023087102;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.k3m6Af-_1794906072;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.k3m6Af-_1794906072 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 17 Nov 2026 17:01:13 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	khtsai@google.com,
	fangxy@xiaopeng.com,
	Randy Dunlap <rdunlap@infradead.org>,
	dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 1/2] lib/net_utils: allow mac_pton() to take a custom delimiter
Date: Tue, 17 Nov 2026 17:00:34 +0800
Message-ID: <20261117090110.3263592-2-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117090110.3263592-1-liuc63@xiaopeng.com>
References: <20261117090110.3263592-1-liuc63@xiaopeng.com>
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

mac_pton() hardcodes ':' as the only accepted separator, which pushes
callers that need a different notation to open-code their own parser.

Split the body out into parse_mac_pton() taking the set of accepted
delimiters as a string, and turn mac_pton() into a static inline wrapper
passing ":" so that every existing caller keeps its current behaviour.
The strnlen() guard still runs before any delimiter is inspected, so
strchr() is never handed a NUL character.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v5: reword the parse_mac_pton() kernel-doc to say @s must be at least
    MAC_ADDR_STR_LEN characters long and that only the first
    MAC_ADDR_STR_LEN characters are checked, the rest ignored.  No code
    change.
v4: no change.
v3: pick up Andy's Reviewed-by, no code change.
v2: new patch, split out of the u_ether fix at Andy's suggestion.
Link: https://lore.kernel.org/all/20261106030605.576584-2-liuc63@xiaopeng.com/

 include/linux/hex.h |  7 ++++++-
 lib/net_utils.c     | 19 ++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/linux/hex.h b/include/linux/hex.h
index 2618382e5b0c..408825478cda 100644
--- a/include/linux/hex.h
+++ b/include/linux/hex.h
@@ -30,6 +30,11 @@ extern int hex_to_bin(unsigned char ch);
 extern int __must_check hex2bin(u8 *dst, const char *src, size_t count);
 extern char *bin2hex(char *dst, const void *src, size_t count);
 
-bool mac_pton(const char *s, u8 *mac);
+bool parse_mac_pton(const char *s, u8 *mac, const char *delim);
+
+static inline bool mac_pton(const char *s, u8 *mac)
+{
+	return parse_mac_pton(s, mac, ":");
+}
 
 #endif
diff --git a/lib/net_utils.c b/lib/net_utils.c
index 215cda672fee..fd76b9ab3f24 100644
--- a/lib/net_utils.c
+++ b/lib/net_utils.c
@@ -5,7 +5,20 @@
 #include <linux/export.h>
 #include <linux/hex.h>
 
-bool mac_pton(const char *s, u8 *mac)
+/**
+ * parse_mac_pton - convert a MAC address string using a custom delimiter
+ * @s: string to be parsed
+ * @mac: buffer to store the result, left untouched if @s is malformed
+ * @delim: characters accepted as a separator between the byte pairs
+ *
+ * @s must be at least MAC_ADDR_STR_LEN characters long and use a character
+ * from @delim at every separator position, e.g. "aa.bb:cc.dd:ee.ff" with
+ * ".:".  Only the first MAC_ADDR_STR_LEN characters are checked; anything
+ * after them is ignored.
+ *
+ * Return: true on success, false if @s is malformed.
+ */
+bool parse_mac_pton(const char *s, u8 *mac, const char *delim)
 {
 	int i;
 
@@ -16,7 +29,7 @@ bool mac_pton(const char *s, u8 *mac)
 	for (i = 0; i < ETH_ALEN; i++) {
 		if (!isxdigit(s[i * 3]) || !isxdigit(s[i * 3 + 1]))
 			return false;
-		if (i != ETH_ALEN - 1 && s[i * 3 + 2] != ':')
+		if (i != ETH_ALEN - 1 && !strchr(delim, s[i * 3 + 2]))
 			return false;
 	}
 	for (i = 0; i < ETH_ALEN; i++) {
@@ -24,4 +37,4 @@ bool mac_pton(const char *s, u8 *mac)
 	}
 	return true;
 }
-EXPORT_SYMBOL(mac_pton);
+EXPORT_SYMBOL(parse_mac_pton);
-- 
2.50.1

