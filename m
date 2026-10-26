Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053937;
	b=hZbeDWgJ8/YbDp7f6rEJTFx8iALG6faRuoAB67h+fvHDQCOOIUqHqSp5BkqbliNaDP4c
	 j2ZpnF+D0l2dw+ZtOEAdbAfEaP+HX5rt6y7oSM6XXpcaNnSSa+WpknDOTy2VTWTzRFA8C
	 yDyd3BWBmDMPCTbZzwZ3mYF5O0y85eaTg4n++wvaR6XiwKBIgVJWNtQRnBCOsZgozG/U6
	 rlxVjnXv+yLzpjbW4e7Ye6X8ydIAVYxIMVR/OL22rCVPtJindWiLIznsDEZPTLwopkiW4
	 pEkIKDrCvUk2hs72e1E3bRJ855naw69WzGVo6mIjY/4p1oY2qNfyrIGpWIEc8CFevlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pLaJAO5gdQUGb1UHhzJRFMc38wz+LAD8Exy48sOnSII=;
	b=jCFpnzwD0MELrReSy5VrhE5XxQShQw29zc5zvwgO/mz/qdmrVpVTiPjuer/IBhbKglTL
	 W7QYx3Id+YDH8//OGOoORjg/HpvHysWrmKldK3U/0Oc1VaKZF99hacUFddbci8pBMJPFk
	 h6Ky0Seq7uY0WeZy3vBaJd6HcPDJhoSC+rjvhHTfZH32ZQLIOp6XpFAjYS/Q5ZtarYGhI
	 4FvlYVozlpLzklxeIq6J49m3RxRmqToeerBEvRgSgPjts01aiAV4Khgx3up6FdbRvnv74
	 62o4pcIwDYXOrTPyJBSKF3SbcAnbvh5/oRDXlQ/TxF0jzRsAB4x8tEAmKf61vRxGnOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pA5y4emS;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0D606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D0D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pA5y4emS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15224155e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053935; x=1793658735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLaJAO5gdQUGb1UHhzJRFMc38wz+LAD8Exy48sOnSII=;
        b=pA5y4emSgAGiQ2V3ti8+pUQOQGyGTRv1fwG3tNIJ5m7VfVS6F8nLXRdvMG5ArqA+qk
         42X5+5tHmiqbsAyFzzr0jfs3ZFS8HMf9kkNUgPNqbpQjizqFMYOYlSHmeqxTTqi6NOoT
         Y74My1iK0ewVLZsBPOfMmYmpZn3hiQTkCcrVJ2XkEwnmxpInD9k5oYmV893eMFcyFdch
         f5f+GluMr7/snoEHN0RsIvLKxTMkm0Ses2/GcDVV6r29ebvawOkDZi5FL06uTwQsG8IQ
         vuTWzDJMWyrX3FWU3BZZFtDIlt7vApzPGed2x0ow013a+/y7oKeas8IITmr49vVRGv6r
         0rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053935; x=1793658735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLaJAO5gdQUGb1UHhzJRFMc38wz+LAD8Exy48sOnSII=;
        b=nbsZN5k9C4OvPheEBJCQmjNN8hJ7N87NSKKoIYtihx6H46ZbjLTEJskBNPIcQm55ny
         hHJuVo3T7ClnO2qutJfQBswJtAfv+V7Qt22jPe8k+JOaK38fwgWYL1NO5o5TvUVI2gGN
         LdNKiUf7UJLQXBMBWRVKG8uDtPvCp6STcIrlQJbCJ7An4D5KwRCFL5DZ+ZF5IZsbiwHL
         Y+n+Z6aJ8nVvqgTgyvPW6ouyZxBHJQn+t05/vZO/pYTWK1MApmYD5uART5iNniOhhUo7
         DzEcDtEiGMVQOvUbT8Jhhg4VtkzsL3MDzM8yvLjTe8ttgoGx1bV8lNcciVHE04mVfDdi
         Virw==
X-Forwarded-Encrypted: i=1; AKwUvBz/CyIJ3KOWaFZgwjeKQIFC8CiYD8PPTaPVdCLbAUuy9vJ93a4/NXsJMAfplEhMgxVMB5s7UZ4ltXxszHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd0SSNi3MnJx1VCegV8xJOhIzMelDPWOUgs5dGS+qGFc8pVk5O
	aD2JvlybkAjZVNKut8taE6pDGd6HNFx3qvVN3kaWDyz1lxFweGVBekQ=
X-Gm-Gg: AYBFou21b1LPxxx4GnczjCB66I+l+Mx15qr54Vl4x3rC/a3nCa5/syw/n4K1UNFLTu3
	+vSL4pyAdwDFJ2RXqeTx7Ix8ponXT1vJBkjIeh7LbRhezWCAgKjD2MYKZn/lrVFtcGip/BOvLls
	bRNQS0vp/bduC/13mdryIaOir3cqgVFxsntJjBqG5AEI/zDq58scjqbgThAw/MwjVsz6MEsn35N
	YCyPkbiedwjlBnP4VAlLtC7YvOhlButznrZmO1dIaHG67plsPk73KimtXGDJIJH2tzjC6ksCVp4
	c9XS0OHWg5vBfW+D4A/HGT0lZsOSTcmM0p9zZTClFKYuFvBWSnWZVvBHJ04tYA8PXVqHlt9r1eL
	i5PDgG6ZK6n1sM1WHQ5vJgJTxMeSRjXuzL29hMRbTHkDpbc1oXYykchYfUYLJF9HuSY9xGcMttK
	efQ236KvyMToxZycok4acGyfQAe4i3QyM9UOZw0N4VEJ2N9X22y9Tl6q2/3//HM52nGnALXpIYE
	0cjJKsQ5utP7+o86tSG3/Pq3NNCgVkyURCDYA==
X-Received: by 2002:a05:600c:4e87:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4a35acaa046mr152238715e9.17.1793053934795;
        Mon, 26 Oct 2026 15:32:14 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bb112sm241921425e9.8.2026.10.26.15.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:32:13 -0700 (PDT)
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
Subject: [PATCH v2 wireless 2/3] wifi: rt2x00: replace open-coded IE search with cfg80211_find_ie()
Date: Mon, 26 Oct 2026 22:32:13 +0000
Message-ID: <20261026223213.2091616-1-tristan@talencesecurity.com>
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

rt2x00lib_find_ie() open-codes the IE search that cfg80211_find_ie()
already provides.  Replace the hand-rolled function with
cfg80211_find_ie() at the single call site.

Fixes: 1c0bcf89d85cc ("rt2x00: Add autowake support for USB hardware")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 30 +++++--------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 4d94b7062f440..921383a630bf2 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -557,26 +557,6 @@ void rt2x00lib_txdone_noinfo(struct queue_entry *entry, u32 status)
 }
 EXPORT_SYMBOL_GPL(rt2x00lib_txdone_noinfo);
 
-static u8 *rt2x00lib_find_ie(u8 *data, unsigned int len, u8 ie)
-{
-	struct ieee80211_mgmt *mgmt = (void *)data;
-	u8 *pos, *end;
-
-	pos = (u8 *)mgmt->u.beacon.variable;
-	end = data + len;
-	while (pos < end) {
-		if (pos + 2 + pos[1] > end)
-			return NULL;
-
-		if (pos[0] == ie)
-			return pos;
-
-		pos += 2 + pos[1];
-	}
-
-	return NULL;
-}
-
 static void rt2x00lib_sleep(struct work_struct *work)
 {
 	struct rt2x00_dev *rt2x00dev =
@@ -642,9 +622,10 @@ static void rt2x00lib_rxdone_check_ps(struct rt2x00_dev *rt2x00dev,
 				      struct sk_buff *skb,
 				      struct rxdone_entry_desc *rxdesc)
 {
-	struct ieee80211_hdr *hdr = (void *) skb->data;
+	struct ieee80211_hdr *hdr = (void *)skb->data;
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
 	struct ieee80211_tim_ie *tim_ie;
-	u8 *tim;
+	const u8 *tim;
 	u8 tim_len;
 	bool cam;
 
@@ -666,7 +647,10 @@ static void rt2x00lib_rxdone_check_ps(struct rt2x00_dev *rt2x00dev,
 
 	rt2x00dev->last_beacon = jiffies;
 
-	tim = rt2x00lib_find_ie(skb->data, skb->len - FCS_LEN, WLAN_EID_TIM);
+	tim = cfg80211_find_ie(WLAN_EID_TIM, mgmt->u.beacon.variable,
+			       (skb->len - FCS_LEN) -
+			       offsetof(struct ieee80211_mgmt,
+					u.beacon.variable));
 	if (!tim)
 		return;
 
-- 
2.47.3

