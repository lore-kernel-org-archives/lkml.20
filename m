Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F733A71AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934296; cv=none; b=itlrwKGPDr+MHcpsmh4EWWPyqljUIUq5ve9t5hou8DaIX334IzHffnWqvHV5lwIswwxNwugCmUGoXznAnjcUdkDZ89+emxTvXr4oKR1eCxv9ZzjAiJn2V6OyYGNgVwC/SN6XXPTXHaBAedDZmfNrfv65M2+kyBtEgvDHWPPfkHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934296; c=relaxed/simple;
	bh=jaLBXs7Os+iy8cVs8rEN5uKDkf7LSav2f/F/TMcJUqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGRiQxceywVRK+shRuHTG8j31dPQgHnfhGViQkL/iD5UAwNVywBRZpnBQacY4P86DTt7FbiXZv+rDYRVCRhxwBlZre48i+/3fwA7ox4TQY+diwQ5rhae4Zv78NnzP1Sq/qhRv8jHqcRAxpvvBws3qt5n2+XABjwCfwspjZa7awo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bl1MzMZ9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bl1MzMZ9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dcff8f44f2so4066825ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788934293; x=1789539093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEjcqxEvEi/00cM1XbcbS+ADXbDTmQAkuPBw9uAC6p8=;
        b=bl1MzMZ97VuznXgOdgLlQjUzSRoT35aLoslbNS6A6dhZ0piMh9MfAi9IG/SGrk0btx
         XU9bc0SiNKwwgHjJ9m2eVOGczq/pDLtNrA/Efcgcbh3vd7yjuldj1X/M8v8p58BFMKev
         T6pHx1g+B/gsNLj0b53pUW7R+OwW3K1AFbOuj9Hbin813SL7LjTNSFDgk8V0QIfWnQ1t
         bRBZAHZMYuzUo/3EG+VjLFMpbIkTVQZ+BCLDQk/hSyDmJjEOEaxg1U/wffyO9BkXwW4q
         m9T6ys5RBgPbGC1RwnJixByYmaMUtdF3BRkVlapbgAHyh4YbAxzc9S77WdUt1gPPhj1R
         zVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934293; x=1789539093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEjcqxEvEi/00cM1XbcbS+ADXbDTmQAkuPBw9uAC6p8=;
        b=irooI0de6s692o1LjJJETcdpEo8QHq/+4ZzXVHrX6/bTuASDSacKg4fgDzxiqEHNmw
         HAyiPGUQobgAottC4V/wfVtkfHpC/teFO6/wB+sTJlyDxFtNg9cU6CyQFWb3Sgq2sVOG
         AruDU6T1EW+/W8yOfACTzXOmOJoX14GTXwyVrmnpeaDVbR44nSa3+PMUiS3F4Nt/3TBo
         ITNZ97F2c6JjSmDMYctW1E+BL4I35zkOXtBbH6Lh+g09njOpvsDZb4WdYTPIBorTq8Q0
         TqnRgKIyOhqVvA5aZ6WbrBBrgPMEIYdzycbtl15ibwgNXaYf9XbG/ekdsJEWaYsLaDu3
         Zjgw==
X-Forwarded-Encrypted: i=1; AKwUvByyKyU1feSDPBHw2plPRELkYpoTwN+Jh8zm+FlRV0xYhFXSKjP+oxQSJbTtlVbme/k6NZiLPFUICRwHVwY=@vger.kernel.org
X-Gm-Message-State: AFuF++mBDVKg6/DdAl6YXcFNy/aJDQa/utLTCAYJf8VlmlY53L4JMcGU
	Cmdn2gR/Juv+Zc8oKeoj458ds/fhRLlP7ARqbAnf6SHY+21rdG3diKJ+
X-Gm-Gg: AYBFou1HOXXvXrWlPXOSHhi94voCSCSlCnTho3jOWRKHT70VCLU/OBtxGY5S7+Z5nyg
	kO6ErZEm9sxz5sKscRGNcP48dAIHuiHiqlgfcotgU9lzowRjBaJZiZhLHwxlff/RlSP9g4V9cam
	7Uzge7/QPYMzCbqan8FwhegjA9eLcLyZ+Mfh2rEoKtHubbKq2BEny32fZzmB/qqA8IKIYqx1Hqa
	BrbZR6b2oiGreFxG4KoTRrwTlLNTFt3OlPAhE14JAkAstujtDxCzensR2aa8SIpkUQ+FWAgRH8a
	8+GKTbbdqjCHdYTI/ptEA/poV5eu1THubDFy/LHGQpaFQXTvPa+h+k9i/cnjIAAim01hi2rROyB
	i1MrVqQJfpYSdboDxlWX/pbhWvMIPLOv71DmqBEX0GQZ0L1+BwJKWYcgXyMLiotm18cpytgOvy8
	wJN6RFq3hGFfAkmqHIN/ONaDmZUCpCaLpiKUSYICQEalKqoGF8faq3nj9r1v4EykLLli8ZZH+fw
	IJJPuVo2I4=
X-Received: by 2002:a17:902:d48e:b0:2d9:2fc9:570f with SMTP id d9443c01a7336-2db12854ba4mr485362505ad.16.1788934292887;
        Tue, 08 Sep 2026 23:11:32 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497da0fsm67131495ad.37.2026.09.08.23.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:11:32 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: libipw: reject TKIP frames without a full MIC
Date: Wed,  9 Sep 2026 15:11:24 +0900
Message-ID: <20260909061124.3802517-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libipw_michael_mic_verify() assumes that an skb contains an eight-byte
Michael MIC. A short TKIP frame makes the unsigned payload length wrap,
causing michael_mic() to read past the skb.

Check that the MIC is present before verifying it, and use the existing
MICHAEL_MIC_LEN constant for all MIC lengths in the verifier.

Fixes: b453872c35cf ("[NET] ieee80211 subsystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
A tested source reproducer and full serial logs are available privately
to the maintainers on request. They are not included because this finding
was validated with AI assistance, as required by
Documentation/process/security-bugs.rst.

Changes in v2:
- Rewrite the commit message.
- Use the existing MICHAEL_MIC_LEN constant throughout the verifier.

Link: https://lore.kernel.org/r/20260908082729.209627-1-4ncienth@gmail.com

 .../net/wireless/intel/ipw2x00/libipw_crypto_tkip.c  | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c b/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c
index 24bb28ab7a49..2b0cf0ec496a 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c
@@ -474,14 +474,16 @@ static int libipw_michael_mic_verify(struct sk_buff *skb, int keyidx,
 					int hdr_len, void *priv)
 {
 	struct libipw_tkip_data *tkey = priv;
-	u8 mic[8];
+	u8 mic[MICHAEL_MIC_LEN];
 
-	if (!tkey->key_set)
+	if (!tkey->key_set || skb->len < hdr_len + MICHAEL_MIC_LEN)
 		return -1;
 
 	michael_mic(&tkey->key[24], (struct ieee80211_hdr *)skb->data,
-		    skb->data + hdr_len, skb->len - 8 - hdr_len, mic);
-	if (memcmp(mic, skb->data + skb->len - 8, 8) != 0) {
+		    skb->data + hdr_len,
+		    skb->len - MICHAEL_MIC_LEN - hdr_len, mic);
+	if (memcmp(mic, skb->data + skb->len - MICHAEL_MIC_LEN,
+		   MICHAEL_MIC_LEN) != 0) {
 		struct ieee80211_hdr *hdr;
 		hdr = (struct ieee80211_hdr *)skb->data;
 		printk(KERN_DEBUG "%s: Michael MIC verification failed for "
@@ -499,7 +501,7 @@ static int libipw_michael_mic_verify(struct sk_buff *skb, int keyidx,
 	tkey->rx_iv32 = tkey->rx_iv32_new;
 	tkey->rx_iv16 = tkey->rx_iv16_new;
 
-	skb_trim(skb, skb->len - 8);
+	skb_trim(skb, skb->len - MICHAEL_MIC_LEN);
 
 	return 0;
 }

base-commit: a4d4c205cdb8657077f72bf0676b51df8ea8e01e
-- 
2.55.0

