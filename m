Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757833;
	b=OLYdNA6NmSjCm9adfsDdwlAG9aSYuCIukXck0S3F6xko0hGsrB5jTU0LV3o/Efr2bnHw
	 CJHe3uN8cieZnba76bbsI7kBUVCFHCPGjkbK+G9Cr0DUo+khrmcXb55HUI0wtx9JvYbNu
	 aiRSE0wID3MnVU13Zh+7S4xFvxuzShZi8FGeIAZKSnxwruNORIZhXGCWsReDzaUs//ydR
	 HuqKCDXBmoM/zOv4/N6+zga7CM0lIELexVHhha/8hpFb4jlIgG2JA031irtVT3tjP/x7d
	 9KWSAFN4GR324a/hEPs1jJfHEinu/mss1fcBmCdNSWK1aHTgHJRVw9NPTCEZQHr1T+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/PhaNSy9coHnaQyrzpEu4F6oxj7CCEXWUr77VrKeBFQ=;
	b=Lm00zh82LMfFqV7G74UXj5z72zwmllrJr4XPQT4Ze/rFFpQSJMvQRvs2y2uNaKkMmUS/
	 ehBRwTsLzYkb7vmbvB8TT8AKsndZNtv2hXioikRCdUY8DII1PvQELwJ5TdqdrJJ/pvfXy
	 gu1atfMWK9uBYg8L1ZISTKjK2Jja61C3Fx3HfW6gg+KYcrBiovYJOoSl+M+zXLhn6uuOu
	 68LQQQOhI/7xVdZXcJ9Did/uc3/bE22v3fUaUEnBc/WRusYsCVSpcrosZuGG365Umo4uN
	 +DITNoZBcu/IEqt1JByxiUcGYy/o9QJLeCi+Xs4EUvlisUFWyChXbOLuUZ5QzSnHKaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhK5fzVY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9A606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C9A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhK5fzVY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so7853493eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757832; x=1795362632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PhaNSy9coHnaQyrzpEu4F6oxj7CCEXWUr77VrKeBFQ=;
        b=RhK5fzVYiPoen8qtpdo3n7NLlJOuG8woWahQeYq338fQj7LKDngxf5J/JhhkR8LEQN
         AfZxBsfrEqXRpC07/vWF1P3Yaqj2cN64l6/Ds9fOoV5iMJdXillL6Yo7mR/MP0Tp25FR
         pWfx4iUriMbhYt/+WSocDpR029emJ779asRkMTG1XzW7iQgsdW/0GRkeZcphvCm18Yre
         q86UE5h+9egVRVge6c5nbuSNpWg3qUqy1ItsqbE8MrydgzNmfc+giKbVgyhFX2Tom/vv
         A80GFu4GsUfOfheXpF5MKTJm09nrjJ5P1z8KydNNaZBvJlrdX4uAB22HULO6BVRn7KrA
         iy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757832; x=1795362632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PhaNSy9coHnaQyrzpEu4F6oxj7CCEXWUr77VrKeBFQ=;
        b=Q6W8xcsHKYDahf8jaixBdRO6BXzZjzjivT3b+DPF6o3LwM4iFpxhMmitD3G4efLcYT
         JD1UgESosQ+VJPkx/n13R/jyBtw33B9HzQjEil5E/zqhgAfh5DP40Zw9P5R1Gd4BR3Hj
         xlu8B7AeOQwXVzFNvWBCcEE6cxyRFaN8gj/aq2AB9qBekn8b7jf/7lo3EdlzUw9nnRsg
         FP8WpSFZhXvqooiX2LKP0f85HQBUpoa/3SUCJnA0T7XQ5n1T8Y4VDKVboV+MG3P0+dfO
         EkV67qTGWT5edtNz3FtoD0LbMFXV6FntFWR6s0VdPDrvasK+7hMoE5yKY/6gi/3/CfjN
         W20A==
X-Forwarded-Encrypted: i=1; AL+hErE2YEo/JLQ1Sy5HORTyNMXbT/fk7yCjZEkWM+c2aX4dPzG+d4+YCc+XKws+ahSDKRMk36ttTd2dOkzXuVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oMAqmiUOJzgK66/0LfQZwD20i631tshIDCn4WKaeLn0zdoNkt
	WqNw0yrgX8VSjtO2ohBO3+YRU2tXbhJxFE0A3pnTyhubRsrF+AnuCGZl
X-Gm-Gg: AYBFou3YHcI5rDG82krRab8vhHNZaGsXbsEl6DlU87kb5Q3lu6XZ9foE32GvfrGLJp9
	Naef6XBfeXvaMNJ200T/EovzAEY51GH+2BJqUEYRErMtIPTx5pY1jgtGTb38gdIbh7B0QBZIwnV
	6+tKtfFD5nrnygz/54YF41Ei3i8yKaleZ2SrgavWVLfFeXfL/IEIMUPeb6xYVvU2UtCmCCfhnhN
	TWcWi7u4Ejs5rg7hQ6c66pOl3lYC5ZZOC8zee/AbGE25azXY1ELxtDLXYWQPRsTZaddphBM+vkF
	tO3PoiYurgCFzjR6baq7s++tWzaEpPkuam07fm/MgXNzl2RgdgpFWUqxlBF+2Y/7V5P3IB5Ti0O
	02EbOEevXBe6ccvYzIl/t9wGV2PeRcPIWIZqwdsjg7LbOlkFG6pR5I+xSBF/701FL/J/S9zQkxN
	XVNPyy4Dgi8MhxKECQEtIbkqDfyjeywtKLh7RwIF2YUly5wIUybK5/gPy0tNI4kZJdavuN+i7KQ
	yDN2G98DCdO7+owJ3qn7FwFA7zCo/yT9MDC+dR2XXWA9KiNJKokJxoiIjGt2ua8PjJmuWqTSgy+
	YjqemW+51wyBtw/2VQGHhHKZB5a5kFCnC4UBA5ARtCfos0mfIyLIcJxsyM1I
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7409773eec.24.1794757831293;
        Sun, 15 Nov 2026 07:50:31 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm25382225eec.10.2026.11.15.07.50.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 07:50:30 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless v3] wifi: mac80211: parse wrapper TPE elements without an extension offset
Date: Sun, 15 Nov 2026 23:50:00 +0800
Message-ID: <20261115155000.82185-1-enderaoelyther@gmail.com>
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
Content-Transfer-Encoding: 8bit

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

Fixes: d160663ca2fa ("wifi: mac80211: fix TPE in channel switch wrapper parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v3:
- Send through git send-email; the Gmail connector line-wrapped v1 and
  v2, so neither public revision applies.
- No code changes.

Changes in v2:
- Preserve the author name in the mail metadata; no code changes.

v2: https://lore.kernel.org/linux-wireless/CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com/
v1: https://lore.kernel.org/linux-wireless/CACHPgzwtaykrULWEDNuWU0ZacnNf4s4uSsiYmxE_vJhS4jO0GA@mail.gmail.com/

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
@@ -698,8 +698,8 @@ _ieee802_11_parse_elems_full(struct ieee80211_elems_parse_params *params,
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

base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
-- 
2.56.1
