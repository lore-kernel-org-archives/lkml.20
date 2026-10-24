Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792861404;
	b=38ugKnTALFKBfXukN+m1cHWBdC+UNAkwO0EaGrCVvxlw0JYbzVvhvmrFWOLHMcFbCSGJ
	 9ZUEG7f6bzFFx5MJ4cxC+V6QvL0dtanE10Epqm1Y9MtnaCfJtFiaU8wtvC7JarJm3rKsT
	 ijVsDcp0SHmFlQUHkO3zFkcsYqKQh56HeFdeuNUgQb1FcqNn0FF3zyjawo8/Y7R9Obfq0
	 J6QrvzwlmKAw/5V2CXftRlb9Loa5Ji4FoIwJBaxARtDEp3NJw3SJfgCXNP1AIFQFIFzE+
	 thfULaIRALAgxmnZH8j4uHsmndoC28q37Y+tldZL0MKjb8MfWvtYSecgskjPrVoWKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792861404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jo8gmaFEhKj3JngpBjGb7fjIKG8buSADfQD1SD8Q+M4=;
	b=pTjzwPlp4cxqCaDh4Ifyd/0X+h/gbTutrUcV9YPFsAu8803URdxTy0rAq6iKz+w8UxiX
	 6WZr7AWNqyCDT9TPyecGsX/DPuFeK9IuXJTkJ30gnY5ysFfFn+l/hf0aD+0balJ4xloTW
	 4vMq/UMwRI8LJly6+M27F/FYpccuuYgnRY4RmWMX9P/puIGjxcDOfNGBCbmrumaNkIHEx
	 kjuc1e+7TuYFM/x+wHBnUNaY12CG5wITqUSGI3CVwOI0jbZ4hTu1o89h5yjblXiMzBQFo
	 3tI4KL9lDdsqrB9LIP6AuFYk1sizcPB+md9B57XVPybDvpIMR89WvA9k5WIwrAXrBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bLV5+rK3;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21623606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21623606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bLV5+rK3
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so529992241.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792861403; x=1793466203; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo8gmaFEhKj3JngpBjGb7fjIKG8buSADfQD1SD8Q+M4=;
        b=bLV5+rK3XK4YT3V2W+IonkQsuEwFvajZnI4HZcQTFPYUff3uvQA3FjTu9QJd59qLLu
         Qt6p8wJbbIQfurLx0x7pNWMLGcwEGCnmcpl97UkPjDLgiIYPQWXVGeifujDTKCxGnAFN
         2Bbh6ANBdrNtIovjYSp2qgEJs09rnSsCLX9Sm1iIrTHRmbX3apzk4SDxqBCgnA235r9L
         +1xyXQ9J24YbQryNaMTeU97ew2Z5eVwIY4vOCNnjqEoTgqhR+r2n0z019QyRGv/+I/cK
         SYj5cOsMPjf5QMBab3y27Aygy4xhW5Y/i4+wLPPLaJhrSZplIsGPp2hAyVd4Hdt3n4La
         RKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792861403; x=1793466203;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jo8gmaFEhKj3JngpBjGb7fjIKG8buSADfQD1SD8Q+M4=;
        b=uwIkhOjV28aBkUDVHMhKs2srazxfPlDyc6Z1VzqUyla5YlaHkdg3Wg28bL4FlqeIyc
         uaaXs9vYvLa2DBaM5qPAyF4GTQsMd2/uWhozm4qwhODSYAcw4/yREPOlHzZ3nKVcRypT
         N/yNe5pAd/YhW/Fy7HAMstrnc6Wmz8F57xuFCPgaCSHi59sJzmNEkOASWnSJlE7d9wO/
         OXUZAJXIvXKJE6NPih6LPJBYzANWeJZSPKVRZDOf+JS6OUxdtL+awRV4FJoha/kHOExk
         H1DvFVMukY7t8FSzQmlt/MbwYEkHKipFqsXtXC5J9/4jiXD1ah2HOfsR7JrF5nQTHBWE
         0dvw==
X-Forwarded-Encrypted: i=1; AKwUvBwSudS7i4mtmAEzecko39VrGklOuxb5bFDwhjysFgJh138P/EG5D/K1CbWjBm2uk5t58t4wsdqnft58sBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOInqHClU6uALAAYLYQCD0vrIGGoF0Md4+odDzoCgwVrogSZx/
	qXgF+kGhMlDEmT7r7ZsYDf0KMeCRVCyOtpkZekgP9in+a2Q+2YpffFeT
X-Gm-Gg: AYBFou1PLE8+32U+/DZSfhS7l6fUEc6SlAJvv9tDwwdUjbU0WF1iQsm2pMbIFzzv1Si
	d4LUvP/Mki+Ko2gpSIj1GEG8nRfJdHAOvmgQEiKAr2qXnyAs3E9qhbmkWY98YTZiJwejTStX8XP
	8bVNwJGcmiijqr8Hvrgudb4ZKzSEXl+GKhkHgimVLZOYgL3JRqidLgL8VWOy1eBFgjcNd7NGi0H
	SP1O2Tv9qe6tT5V/U1NJcHkSyoah6zuvy54IQtB5jQ7j70XsSKJSURtOUQ08KX+GKvmrm/IlM+Y
	YF245pCQLhgfSFEvU/d2yEiEG0FLblia/0QEHpUBbeTeyesKCVLlFMUrsmrYSjFour+uY5BSSkk
	7ynEewQnxzGSyuI8kPye7WJcg3kP05/nAeMyp7WhMOX7VXjv8bh/olkC1a5SZk5wxlq5s8nNrZv
	ByB1Wo0OfM5KOzyvpimxHS55ePf5MSo6aIIyIGbclvb68NdR29gdeeoVi8DXqzA/0+qqO7RNsrZ
	ZW37yd3FYQgHYaFfGiu3JiJUjUSPEgyP8G7MjbWfpQeDmBT7TtCDg5HjohD7rYdF/s0NR+pv7X1
	TauxzWPRE6Fcu08T3ZNIe+uiBiSgk9xA0WNsT6OngeEa7uJF8Z3leW1AETfLskC9MYEWZI7r
X-Received: by 2002:a05:6102:c46:b0:7cc:c7aa:106 with SMTP id ada2fe7eead31-7ce5cd91867mr658536137.18.1792861402974;
        Sat, 24 Oct 2026 10:03:22 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2804:7f0:b101:277b:c08d:c9f9:7c08:79c4])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm2525746137.1.2026.10.24.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:03:22 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>, Duc Anh Luu <luuducanh05051995@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH nf v2] netfilter: nf_conntrack_sip: fix OOB read in
 ct_sip_parse_transport()
Date: Sat, 24 Oct 2026 14:03:17 -0300
Message-ID: <179286139765.93379.986858959213810476@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

ct_sip_parse_transport() compares the value of the "transport=" header
parameter against "TCP"/"UDP" with strncasecmp(..., 3), but it never
checks that the parsed value is at least 3 bytes long.

ct_sip_parse_param() returns matchlen = end - start, where end is the
next ';' or, when there is no ';', the end of the payload buffer
(limit = dptr + datalen).  If the "transport=" value is only 1 or 2
bytes long and runs exactly to the end of the payload (e.g. a REGISTER
request whose Contact header ends in ";transport=T" with no trailing
CRLF), matchlen is less than 3 while strncasecmp() still reads up to 3
bytes, reading 1-2 bytes past the end of the linearized skb data.

Add a matchlen check before the comparison, mirroring the
sdp_media_type() pattern a few lines below, so short values cannot reach
strncasecmp().

The bug was found by LLM-assisted manual review of the SIP helper's
parsers and confirmed with a userspace ASan harness built from the
verbatim parser functions, which reports a heap-buffer-overflow read of
size 2 in strncasecmp() called from ct_sip_parse_transport().

Fixes: ea45f12a2766d ("[NETFILTER]: nf_conntrack_sip: parse SIP headers properly")
Link: https://lore.kernel.org/netfilter-devel/20260815133104.50369-1-joasantonio108@gmail.com/
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
v2:
- Retarget to nf, rebase on current mainline (no code change).
- Say how the bug was found, add Link: to v1 and Assisted-by:.

v1 (2026-08-15) got no review comments on the list. An equivalent fix
was posted on 2026-10-22 by Duc Anh Luu (Cc'd):
https://lore.kernel.org/netfilter-devel/20261022172248.554687-1-luuducanh05051995@gmail.com/

 net/netfilter/nf_conntrack_sip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_conntrack_sip.c b/net/netfilter/nf_conntrack_sip.c
index 64bc440b1..b05dc8858 100644
--- a/net/netfilter/nf_conntrack_sip.c
+++ b/net/netfilter/nf_conntrack_sip.c
@@ -701,9 +701,9 @@ static int ct_sip_parse_transport(struct nf_conn *ct, const char *dptr,
 
 	if (ct_sip_parse_param(ct, dptr, dataoff, datalen, "transport=",
 			       &matchoff, &matchlen)) {
-		if (!strncasecmp(dptr + matchoff, "TCP", strlen("TCP")))
+		if (matchlen >= 3 && !strncasecmp(dptr + matchoff, "TCP", 3))
 			*proto = IPPROTO_TCP;
-		else if (!strncasecmp(dptr + matchoff, "UDP", strlen("UDP")))
+		else if (matchlen >= 3 && !strncasecmp(dptr + matchoff, "UDP", 3))
 			*proto = IPPROTO_UDP;
 		else
 			return 0;
