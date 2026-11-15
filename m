Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794748470;
	b=47GFq3TO+X48r9+xh4lhODOxTTW7hCd7hwEBLqJomNzzuff8cuOWvvq0gYdvISsAx/RH
	 RZlBFpf2jyeUvG2tkeAREe5j1WOVHqTtcmPRTITzj44FzjkM9SuUHF5//Tn0WB8oRTcqA
	 sBDQqn99M1tgAaUvxfJ3eRfQ70rjzGi03BXGXNCQa0w0ube1CNuwGRhfLe8vtwHkq+5Lw
	 mR9fcf70YCHprLXuI/G3h4Co5YZ0D2/M+PUDE33cKL1G9KpxwOis3JPgYvC7cVodE6LUD
	 yezqYdu/L0lTCa9vrfXRX5t3YvqZ6a0V4/LaNpf9fKwyOiwd1md4CXS5pwiazidLEEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
	b=3BGE2GETEreHxO9aaA8dsusk1aB3NQqyfMpr9F44B/toqxjHxj9Agrf2xQ64761OY2ED
	 6yusMVi2KXy/84MwKG0ooVif9Rsu0rNtp7os2m8xEqfnbGUpo/VNabJEJIjUt+AmscwjF
	 HZm+EJl3XtZ/kirYvrGEnAhjKOS7L5Zgfxjky4gSDoVwHss6U91ufUR5nXqoGhe21LeJH
	 TlU8XmvJjnhiOcPk12vkrZcKDNG5OuK8iVYCpJXiBdtpsKCidixnaUGwzHtf3wbG/GyPD
	 P6UlbtzfEAxPUqXpKlw5TONRDgqDQ2GDjjikydAcQAAURAgl8F2AO/Pke+XUIEU5Zhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzS0tOez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E4606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzS0tOez
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so740899137.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794748469; cv=none;
        d=google.com; s=arc-20260327;
        b=DIYSQYOBhSul4cGYhRghD7cbIeNYSlWqmVKJh0eKoOuKdtPAJCzKKJhQOenu9jxuRO
         BSb0m4qjXRZyLbcCibEo16HRNvlC/2EEIGiY6rdA+4QsHaaxEoKqvDcTmMuIAkT1zSEN
         Gb1/tM4fl3LXy7PLm8G2s2upuhra9skEG9rYB9UuhWvd9K/c8cygBYjRDp6GtweAmrkO
         w1wTlm8dlpYcSeiKAv+9v36uWcwQqEclSQjZaEiFrDyicemmX+n1bKuRfllmHeR6gP+D
         ZK0rLDGUAnQxEt105JW9Y+0mGTVQYZKG5+2yWo5wpKBzLL9hLh4cI8hSXT/ig5kOwd8n
         U9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
        fh=RMW3r7d3PE15AvVF0Kz/jZWSnabhiFfQNVImTRDidcQ=;
        b=TMWsAiTV2BJmmg0DtWj2UtmrMoca9IdKjQawMQDmTFpSxtdUUZpYgzNUTL5pEqWBRj
         3zAWxmK7mZs0nJn35c/0jTB+CiaQSIwHDBzNC94TpONNXDJ7IYnvvH00EYpCNEZUiBIP
         zenY0ikPo702tNte3HVsi7j2+/0u1xj5IYYk6vs78Q6hU14q3xZ0k/gnO8EgN8FmzhSj
         Bxp6f/+eXNdW9aiDUIvg42f8l6A3EaW1OnCIVVwO75dO645IyQYiL+88y08ke1WBHpEG
         GZwoojPabOPbBcSqRthqIm788w9uyWcX/xKy9yTUUIKYDimylHgPdKuukCrMVbjuTfqZ
         S2sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748469; x=1795353269; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
        b=vzS0tOezwaJfJKM/ugPXfbwXZeMAuY8izOXYyvEuIr+NYPL9H2n0d27ZB7jGHKiemE
         YKIdO+a/tR/SjXqkPGjtg7XZe5j4zm9Nxa7LYI1GFtcrdsHOO49pcqQCS3MuYHgLCSvO
         CeOtmmVwOuG1jhHm9N2c69lHwt0kj7Fg05U45eGW5/jsXB25h1psxaRVstMqZilHxcRm
         GRY2Jvk7UXhOJWbDLF3P4CQP81jyeiR6RSG2R92xrHf8XitWJ6XnzpvakU5vina1SFvz
         QrGY/sGTtX98WMiQJ5RWQHRyKc18oGSTOBbiH1i2yIxZ3oXOWLvzvrmmWCEKd9ybawLG
         PQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748469; x=1795353269;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bYXlSXwF9wJwvPJhBMKm32XKxPsyax9Z7BtZtS8oPks=;
        b=TZIyu6ZsvlsbN0yTxg8TmvMJyq7UmMLkRp0tYCYVaXPmjhugMABV02Ue6xBN9vpDOU
         G7JwaN79nMLWIAgcAdyjLZlOkEI8hpvlY2p1GEvaxlAtP7uljHQE9wCje+tv8O6z/DW8
         ammlrLInNR7GdtVrrz2LE9zBbsWobj92wy/nrGQs7Lm5vKY79f7A61xzy8QYogYYr41G
         0LmsDZQGz81KRh1RYRgsSkcdb6mAfsiAteMmAYlr5JALoZn9AYuSLy21wD7mmvQtiXFO
         PCGFjG+S8r1mAIw4iGl4zVJBz2Y1UvXIpO3ZODTn3hTXDxqhUkBsvTMB5wl5Ex0pMoMo
         nciw==
X-Forwarded-Encrypted: i=1; AL+hErHyGVP/Gi3uZJdalH7/fBrO/YspFy8mSMZOO7bIwVo2A9QCTyKVR0pchTMHeYkgoSHKk2rLIR6gsXHblEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rNCt553N6KuGKNoBI22o7PJWREemOrwJzjjtvtcVZ6BCmuemk
	/uO8btH9Z9GQfAed3+PKYz9GbBb80XCWRWHtSqQj2rBImteve5LwSS2LXYpQFJ++VJZ9dLMIojW
	IltqHXOISr7qAAHZD19AydmEiNuSLgPyQig==
X-Gm-Gg: AYBFou0633jinGbUDJuE9YSuG42D2w5RedgvtOAQhAI+bO2bW/ZNROwbmzUYj7vSiev
	KmI8FiksHIIjtWKdozLeJ7IgzW4miwCZgq+/890X091j2ANgMjT47wEQ1o/5HlbCU7ebbByZZiL
	fK7MxQ9a+Vbt49OMHZBmnFFxENDoEie6R5kgO+dFwWXj8+ymIY7WF1FqFXm7IkNavchdL4T7wtn
	nw5TG5kaQ0m5cAhjm1FtbgiO19BevzuSLRhx+86yDpu4QHLQ9JvTmJos0RCRr0f+0jMsawwR4Wc
	gkGHt43PSSIGW7pFYWyWh1VC5z9xgxMmA+fMRU3h5rqmcHGD+DYO9Z6CGt+E2JJVv0Xt94p9wUa
	qqvhSoHL/E2H7zfbmanYWxdEU2+VZ04+gbxqdbeFde/F0f+z3wzaYfqGaMg==
X-Received: by 2002:a05:6102:4412:b0:7c3:68c9:d24b with SMTP id
 ada2fe7eead31-7d64d767b54mr1875312137.17.1794748468894; Sun, 15 Nov 2026
 05:14:28 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 07:14:28 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 05:14:16 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
Date: Sun, 15 Nov 2026 07:14:28 -0600
X-Gm-Features: AclHuK--EdPjoiSIYzc81ErX-WgozmFnctLmEz0c5VmUm9mcp7XJG0KbBCaY5Mg
Message-ID: <CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com>
Subject: [PATCH wireless v2] wifi: mac80211: parse wrapper TPE elements
 without an extension offset
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Zhao Li <enderaoelyther@gmail.com>

Commit d160663ca2fa ("wifi: mac80211: fix TPE in channel switch wrapper
parsing") replaced cfg80211_find_ext_elem() with for_each_element_id() for
Transmit Power Envelope elements inside a Channel Switch Wrapper, but kept
the offset that skipped the Extension ID. The parser now drops the first
byte of each element and misreads the rest.

ieee80211_parse_tpe() takes a u8 length, so for a zero-length element
0 - 1 wraps around to 255 and the parser reads past the element. Received
beacons are parsed this way when the BSS table is updated, with or without
a connection, so a frame sent over the air can trigger it.

Pass the element body and length unchanged, as for a top-level Transmit
Power Envelope element.

AI assistance was used.

Fixes: d160663ca2fa ("wifi: mac80211: fix TPE in channel switch
wrapper parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Preserve the author name in the mail metadata; no code changes.

Tested the in-tree parser with a ten-case KUnit extension under KASAN,
applied identically to the base and fixed kernels. The base fails three
decoding cases and reports a slab-out-of-bounds read for a zero-length
nested TPE. All ten cases pass with the fix, without KASAN reports;
the existing TPE suite also passes on both kernels.

Compile-tested with no new W=1 GCC/Clang, sparse or smatch warnings.

 net/mac80211/parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/parse.c b/net/mac80211/parse.c
index f3c5a9f6ec7c..7564d655919f 100644
--- a/net/mac80211/parse.c
+++ b/net/mac80211/parse.c
@@ -698,8 +698,8 @@ _ieee802_11_parse_elems_full(struct
ieee80211_elems_parse_params *params,
 			for_each_element_id(subelem, WLAN_EID_TX_POWER_ENVELOPE,
 					    pos, elen)
 				ieee80211_parse_tpe(&elems->csa_tpe,
-						    subelem->data + 1,
-						    subelem->datalen - 1);
+						    subelem->data,
+						    subelem->datalen);
 			break;
 		case WLAN_EID_COUNTRY:
 			elems->country_elem = pos;

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0
