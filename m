Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053927;
	b=sikJRY0bGjHFnvyAJj15r820TxpdeMN+p8B43RwKS8knRySYoIx4UXZzmtZtw0mCHv31
	 aRkTitttBGNfP+YnPdFpzjrtKUjRy/8tDAZLJitdydWG0csXmh1c8xZyCHWaVukERxGQG
	 REHx/X3kk+n5JBYPOzcH/mkplAYjKECOQZD5Rqqwut/ao7OeF0KEH8L3BKqt7KKFkNS3n
	 1XeNBiV3plWLBgR4/v3ZwPj47zylM3DB/7r5XuizP7B200w8Hy7Lg3RhM/3vwwziiRZY4
	 KTCL2F7E5oQjbmeywSbAFA9PcroEMobT6H5H5jQxJl+jCRafvr7JpHrOFJDN3Tx0q5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jI//he41YR3FxIYVnv4p5xMdPmJqhOBHXdSZfWcDXws=;
	b=WJmx8Z7Z+cWDiVm3xvXM8T+3RulecpYi/W2vvfWVWQvnR5bRIC41Jonkcz99Bir5RO9i
	 IagewuZrhNCbmx/9fwNUekWeYIX3LpYh3rW+tCK7vuAp382VG8jJovYaKuCmclt+MlZgS
	 2HebNt077VzBbhDV3S9znnZG5cdCtmV9rsZ4Nj6MdyvV8E8ogHPfNTDzjYGPLgN1/l4Tm
	 ixmxDje7NhhJX0Fhh3JsFVk6TwxjlsT4Kzyl7QyFA9mGggCYhUuj6uxfGFbkX2qrZFLqz
	 hkObzlohnA3PtcXIMPvGqEuycU3DsmnMM0yTcDR15MQX+TPCVDOeH//9RDJth1An70A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QwaN2o4s;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47C606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B47C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QwaN2o4s
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so16842325e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053926; x=1793658726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jI//he41YR3FxIYVnv4p5xMdPmJqhOBHXdSZfWcDXws=;
        b=QwaN2o4scPcmHdg9Wj2AFz9YXm1aUVPhXirWyQt7UpzE40980ubcjbufSw8xBvwdeF
         vQGoUDL/YvS03zir97lepYKFGKWMLqiD6ozMWIlWtrDQT08L8I2KxBYB4zjdsr3ySB+v
         a8TAZyu8MQoHnoeNQ6KbBzMI87RrJeInZfT6MWaj2IW8/Xz6E4HOPoBTQ2u3bG1o1f/3
         g5srF7ux3CPbVFW3x0W2XQlcG25DAv3bJbwhX3PI02kXp1C/LhfcT+ji3/gR40z83QjF
         M/zupQ7I4CfwqnYyh4p2d1DYTBWAOECTfVeFykuuPHbPgp/StdT7q7NKYOZkWVcwNyVK
         qg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053926; x=1793658726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jI//he41YR3FxIYVnv4p5xMdPmJqhOBHXdSZfWcDXws=;
        b=V4cANLzDlIZdYCci8rlzaVCYbU4tQpGMoR805y9QFonLj3sPw1LBwbLQePt/uye3of
         JIdOHmODqKJwc4C41Fk3slv6YZljOLU/Gj2pwL7NeEm/sM053ta3s46fKQ0HyDlhVrm4
         POBYONPPsZxbmFCG1C2EfGiJXmomK06mZ9/fDrKp0g7UO377xhaMKDKESWhKnrV62Lb8
         luWDg9iIGqT9MNAN2YAV93cpyBW0stQSHg6yG52vColVDMCVPN2v/thY6hT68tAC1q1R
         pB08E+lWTYM9naA+nkjpjesOpS7ZQN0Ck8c+Q21TDBps9rmcnRLXLDzkz1A9fs6On+Bj
         uWUg==
X-Forwarded-Encrypted: i=1; AKwUvBwssoKAajJmyAuoPpGulmXMQaQvZdu7Wj26ryTTUMk/MkqvSUtpYYundPz25pGr0vbFllXdA1kOp7J3l9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7Y+MH/jGSgo591fRADXW7pwaWrqqEB0m+ImVI1hYwieJaGIOd
	LSMeKyyJUZbqzdx0rPRUeskC5IEKnMLWV4931H3vdkZ244lIT2GK7j7StF9f
X-Gm-Gg: AYBFou37NIH+eQDNTGjPkeGG9V+XLp3zQ7v0z60OcrpQ6sxG6Q7ByL2PaRGmaDk3qsG
	YtbrBxci1nB/Rhp6FCbUKegfzj+whJYBVz5Ihb+A952JDwFQx4ilJN0SV7wJPjku+UmFmVKuR3A
	5BAE3IbxemIITV7o1UHZKyMxinlxUtoiWsvUwPMbvV9u29se/UZYL/72od2UauBDull5o2tvkSM
	AqUGb1o5IXfNxQUGRxC15nvH8Sa/+5zSSAznsyVmAqfwsnAk0xENPY4wdnrIKIJynoX+SUQFx6k
	teeCbl3N2fe3qn9PZpEHDAa5KbuouXqvT0ndSNskJf/vOsLsS7H5d7NPKDgoLtyFQcDAdTKuuYc
	AapOPOl35vzAAXDhOAJXHV21gusKHJNgW1bK1e0omZU6xDhnnWX/EnBPYflSBqMnLmngywJ5Hfx
	AqCI8cGQydwULXCSATBtsRADjol7A5dRYMSqPSK9RNWzaVYC7T/z1XRpXLn5/2vANcfwJaGUYeg
	X8n1/BPqHpCKvLb//5qwi2L9WGRHPTD4Nj0Lw==
X-Received: by 2002:a05:600c:4743:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a35aca078cmr145695625e9.20.1793053925890;
        Mon, 26 Oct 2026 15:32:05 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm238538735e9.6.2026.10.26.15.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:32:03 -0700 (PDT)
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
Subject: [PATCH v2 wireless 1/3] wifi: carl9170: replace open-coded IE search with cfg80211_find_ie()
Date: Mon, 26 Oct 2026 22:32:02 +0000
Message-ID: <20261026223202.2089824-1-tristan@talencesecurity.com>
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

carl9170_find_ie() open-codes the IE search that cfg80211_find_ie()
already provides.  Replace the hand-rolled function with
cfg80211_find_ie() at the single call site.

Fixes: a84fab3cbfdc4 ("carl9170: 802.11 rx/tx processing and usb backend")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/ath/carl9170/rx.c | 27 ++++++--------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/carl9170/rx.c b/drivers/net/wireless/ath/carl9170/rx.c
index fbe46a5e4e415..9db6ac9d6d3c0 100644
--- a/drivers/net/wireless/ath/carl9170/rx.c
+++ b/drivers/net/wireless/ath/carl9170/rx.c
@@ -490,25 +490,6 @@ static struct sk_buff *carl9170_rx_copy_data(u8 *buf, int len)
 	return skb;
 }
 
-static u8 *carl9170_find_ie(u8 *data, unsigned int len, u8 ie)
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
-	return NULL;
-}
-
 /*
  * NOTE:
  *
@@ -521,9 +502,10 @@ static u8 *carl9170_find_ie(u8 *data, unsigned int len, u8 ie)
 static void carl9170_ps_beacon(struct ar9170 *ar, void *data, unsigned int len)
 {
 	struct ieee80211_hdr *hdr = data;
+	struct ieee80211_mgmt *mgmt = data;
 	struct ieee80211_tim_ie *tim_ie;
 	struct ath_common *common = &ar->common;
-	u8 *tim;
+	const u8 *tim;
 	u8 tim_len;
 	bool cam;
 
@@ -541,7 +523,10 @@ static void carl9170_ps_beacon(struct ar9170 *ar, void *data, unsigned int len)
 
 	ar->ps.last_beacon = jiffies;
 
-	tim = carl9170_find_ie(data, len - FCS_LEN, WLAN_EID_TIM);
+	tim = cfg80211_find_ie(WLAN_EID_TIM, mgmt->u.beacon.variable,
+			       (len - FCS_LEN) -
+			       offsetof(struct ieee80211_mgmt,
+					u.beacon.variable));
 	if (!tim)
 		return;
 
-- 
2.47.3

