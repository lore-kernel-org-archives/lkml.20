Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053948;
	b=ZkjIzRKgkiKKR8RwkuZo+l762DrfKYvNX6KQxdGGiON1NfaPZC4O4etELjl4Cx5N4A0A
	 q1ym3CbhGBTYkmeITPILGCT46ZRJF7qPXkJLp6pXNRIAsjjxrcPjd15m66mahBJ69m2Hb
	 RbsxPFsMRW4pSDSgH0zwkRidFHotIcciOnEH7rrrkR+yboJYcn1AOZLWy5Pt9YupYcSUK
	 1Ydql5K0Stx9LCdtwTbRQGheBKd9EoAGPrhAysZHrwQHXZp7aIWpZPtrMYui/PTSnYZZd
	 ajd0Dg/sdUtAnsD8aaAj7hWWXOGsA13Zy7nAun5buHiQFYFx2h/w9Fk72ibq6SoKuTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8rXduDRKJP8drgeo5JnRezfiCAk6F66eeBkch8vfFZw=;
	b=ym7TmIoDa3twuI1Wiow5Tqk/iABjDQFBgXLw6JNauX3yjwZWIgUQrcwCa7gwi+efUIv9
	 NTproH7CuPxA0dDjswwq6v1qaCaVnqlQQYo2ricYcMnC8N1gzX2lGYfu/zZ8LcPHb7J8Z
	 jOeTf3VbuSwoUivc2PkcXAXGTth+tYbyYUyRU0yfsRt4aAkg4h62hRLajD7GKHSm+WEHL
	 Gyd1TZaiIG6oLhBYiSi5m12atXt7247daAZMvj6P3Nnnt3ROf6scItKscfc/odf8nCsUb
	 gPXAPo3W6i85bD+Wffm1R5Ca+iu7J2TuzbdwNDl9ZF2FJNHUBthA5ToTRROdyd66W1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HwRuhF6M;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0EB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HwRuhF6M
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2581788f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053946; x=1793658746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rXduDRKJP8drgeo5JnRezfiCAk6F66eeBkch8vfFZw=;
        b=HwRuhF6M+Y66D48I35HkC/WvYHV4sTTX1rD0qaNjeay0lN5WIzYdDyQA8rX1ak4GqR
         mgrkEzMgbdiStyVxLOvv3vIyiDX4YQQ3iBVjE794ZRVYi6HGB0gQECYxdTYMPPpvkyvp
         29w/hfSBgvSW5zfhJDiDIzUgbnHD0QLoZXaEEoRjenbetrJki4n7RS1+x94YO+NnsV3Z
         Xjix2v1h7SVPMcxEAexgee+afdRv4mDBCtHoncnXIrNPwdSq4gR+gG2hFON12d6uJL5d
         GVYZxep4DLSsCALe7+D3ZyFm/jW/LPNOeKxqTAK5pPc3rFtyQTqyPSFbOfnvTixmNhEi
         BU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053946; x=1793658746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rXduDRKJP8drgeo5JnRezfiCAk6F66eeBkch8vfFZw=;
        b=K3H/5U2fwQ2IH7WvugYlMZvCaWFeofEragfQKdjYeON1OA1YNoMEOdzCLthN76e9uj
         2/XssBaq9Ywkw4vDe+e4ygE9L8ys+kNcMKiLyWW/aJKKYVmLVfgk/ToB9Pdml87yyxqy
         CB6LIDLxY1YR3vWDBKFq1ZCBfx9/i2FrTndsFV2ZIXAuzqpj7SKQ3FyUtc9/MSiRSzbs
         tl0eIb2GgPO1OHMKBU/J3fa8tRBkuGfuLvngtxCydsjo9uRrz8kjdYXrLb8SKbl1fZZE
         FZjiDnvZfZpgrdzePawm56kDAQ14ibOD1o/qnXnDUF0m1vprCqjlK+CRYHgVHI8A/D6Y
         jf1w==
X-Forwarded-Encrypted: i=1; AKwUvBxsZBPlJl0Dl289VokJu4t+XcOq7fj5vKcXxvm6W83/gaF40zeRqKw5J4czgtHtdwjT3f7WHGwPNt5ybg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJt4E3tQNzgYGDMXzjDx5Gd0jT7r7ag27T9zwMfL0JnBqAK1Fq
	8zIHlRLjCVfHTaE4ucNJ+LWuMA4lOZhARvT92NpjphEkKdmVmupiG4U=
X-Gm-Gg: AYBFou0gX23EJ5gLvdyD5EyvkVoowkRPFuezYPHzWndZh3Ry57fmz0By8LI+BFt2xio
	mB5h6fCvSx6ICNkt79gTVrDsH5L4azB0yRfGwa2617ugr/MjOfh4SppjNpGCRlX0672L2zuPbQh
	j8E/7hpK8F4fn82qTZ4ABBdLW568jbpcbvk8nDf3YaQ5g7w2KfnV/LFS22s6N3OULs0KRPp2DoR
	K0VieqjX5ux/pwh7eqVP4Cex9eyz45KzVScHbd6cNRZ+7HuZOPpl9iySBNjssKQl/hInPcn3I6S
	8PJ3qkhA3LUA3F69A83gSIcAAaaFKod92A2JfCejujsgAbzPUkEF6nSdmTIzjHo9gP6S+zqt1K/
	VswLI2YpQbXprCtUfuG4cYtNJKewooQCKKCteV/GUf3twzX8IhbSYavn4J80YUAsM355c63nHJa
	EIJeCvY3cYmvHdKZRx5FlxRFo6qX4FanTjjt94J+DozPNGcP59s+UeNKkfI8leVfqPP/JGTDejw
	fNJ0BZ/2jO6ugZAONIJUSrceyyYdkFlWH8Jug==
X-Received: by 2002:a05:6000:2a87:b0:48e:2c2f:59eb with SMTP id ffacd0b85a97d-48e3eb9a023mr11905332f8f.12.1793053945957;
        Mon, 26 Oct 2026 15:32:25 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm16239300f8f.26.2026.10.26.15.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:32:24 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ivo van Doorn <ivdoorn@gmail.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	Kees Cook <kees@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v2 wireless 3/3] wifi: p54: replace open-coded IE search with cfg80211_find_ie()
Date: Mon, 26 Oct 2026 22:32:21 +0000
Message-ID: <20261026223222.2093813-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

Replace the hand-rolled p54_find_ie() with cfg80211_find_ie() at both
call sites.  The old function had a buggy short-frame guard
(sizeof(mgmt) compares against pointer size, not struct size) and
open-coded the IE iteration that cfg80211_find_ie() already provides
correctly.

Add a pre-subtraction length guard at both call sites to prevent an
unsigned underflow when computing the IE area length from a truncated
beacon frame.

In p54_beacon_format_ie_tim() the returned pointer is cast to non-const
u8 * because the caller modifies the buffer via memmove(); this matches
existing in-tree precedent (ath10k, wlcore, cw1200, nxpwifi).

Fixes: e5ea92a7528d ("p54: AP & Ad-hoc testing")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/intersil/p54/lmac.h |  3 ---
 drivers/net/wireless/intersil/p54/main.c | 30 ++++++------------------
 drivers/net/wireless/intersil/p54/txrx.c | 12 +++++++---
 3 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/intersil/p54/lmac.h b/drivers/net/wireless/intersil/p54/lmac.h
index 8adde6ba35ab8..d9cbffb74a265 100644
--- a/drivers/net/wireless/intersil/p54/lmac.h
+++ b/drivers/net/wireless/intersil/p54/lmac.h
@@ -553,7 +553,4 @@ int p54_download_eeprom(struct p54_common *priv, void *buf,
 			u16 offset, u16 len);
 struct p54_rssi_db_entry *p54_rssi_find(struct p54_common *p, const u16 freq);
 
-/* utility */
-u8 *p54_find_ie(struct sk_buff *skb, u8 ie);
-
 #endif /* LMAC_H */
diff --git a/drivers/net/wireless/intersil/p54/main.c b/drivers/net/wireless/intersil/p54/main.c
index 57a62108cbc35..30f235d470bb4 100644
--- a/drivers/net/wireless/intersil/p54/main.c
+++ b/drivers/net/wireless/intersil/p54/main.c
@@ -71,28 +71,6 @@ static int p54_set_tim(struct ieee80211_hw *dev, struct ieee80211_sta *sta,
 	return p54_update_beacon_tim(priv, sta->aid, set);
 }
 
-u8 *p54_find_ie(struct sk_buff *skb, u8 ie)
-{
-	struct ieee80211_mgmt *mgmt = (void *)skb->data;
-	u8 *pos, *end;
-
-	if (skb->len <= sizeof(mgmt))
-		return NULL;
-
-	pos = (u8 *)mgmt->u.beacon.variable;
-	end = skb->data + skb->len;
-	while (pos < end) {
-		if (pos + 2 + pos[1] > end)
-			return NULL;
-
-		if (pos[0] == ie)
-			return pos;
-
-		pos += 2 + pos[1];
-	}
-	return NULL;
-}
-
 static int p54_beacon_format_ie_tim(struct sk_buff *skb)
 {
 	/*
@@ -100,12 +78,18 @@ static int p54_beacon_format_ie_tim(struct sk_buff *skb)
 	 * The dummy TIM MUST be at the end of the beacon frame,
 	 * because it'll be overwritten!
 	 */
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	size_t ie_start = offsetof(struct ieee80211_mgmt, u.beacon.variable);
 	u8 *tim;
 	u8 dtim_len;
 	u8 dtim_period;
 	u8 *next;
 
-	tim = p54_find_ie(skb, WLAN_EID_TIM);
+	if (skb->len < ie_start)
+		return 0;
+
+	tim = (u8 *)cfg80211_find_ie(WLAN_EID_TIM, mgmt->u.beacon.variable,
+				    skb->len - ie_start);
 	if (!tim)
 		return 0;
 
diff --git a/drivers/net/wireless/intersil/p54/txrx.c b/drivers/net/wireless/intersil/p54/txrx.c
index 9f491334c8d04..7f952fcf16da7 100644
--- a/drivers/net/wireless/intersil/p54/txrx.c
+++ b/drivers/net/wireless/intersil/p54/txrx.c
@@ -293,9 +293,11 @@ static int p54_rssi_to_dbm(struct p54_common *priv, int rssi)
  */
 static void p54_pspoll_workaround(struct p54_common *priv, struct sk_buff *skb)
 {
-	struct ieee80211_hdr *hdr = (void *) skb->data;
+	struct ieee80211_hdr *hdr = (void *)skb->data;
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	size_t ie_start = offsetof(struct ieee80211_mgmt, u.beacon.variable);
 	struct ieee80211_tim_ie *tim_ie;
-	u8 *tim;
+	const u8 *tim;
 	u8 tim_len;
 	bool new_psm;
 
@@ -310,7 +312,11 @@ static void p54_pspoll_workaround(struct p54_common *priv, struct sk_buff *skb)
 	if (!ether_addr_equal_64bits(hdr->addr3, priv->bssid))
 		return;
 
-	tim = p54_find_ie(skb, WLAN_EID_TIM);
+	if (skb->len < ie_start)
+		return;
+
+	tim = cfg80211_find_ie(WLAN_EID_TIM, mgmt->u.beacon.variable,
+			       skb->len - ie_start);
 	if (!tim)
 		return;
 
-- 
2.47.3

