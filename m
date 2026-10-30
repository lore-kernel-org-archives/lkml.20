Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334127;
	b=dS/bbSQo3uHAtxnmVOiXLugQjJQom/ce2A/SXriTvECLv/1SXP/91+wgzwI5CTYDgDZe
	 Mk1vYJ63q7xmDdyhHtzS37pWc4UlbjmqjyGB2YpdjuvnhqjOIwfzwDJT5Bh4RXNf09ChE
	 PCDgvJNl74LAesQ0Ky/1EuWXLu72NPXvgGm/uLPhApHW/opTnBgxXxsK7a0186bg9YxTF
	 cgbCx3Npjm3eUqY6aRB+rH3XD+L7SOOJY68+BhiPCxEdsIvPiHIirnLhhcogALgid3duy
	 sxdLAiLvnL/UiGLcOaoP17V9ieXdaoQQ8Qt6dGrOVi0QNgK9NbdH3ZSgtUkyQ3S6qFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0VilEBuRjBLpfrAybGiQrzjj9tQNqzv1uCR08XLAscA=;
	b=vUDif23cjnYO/LcB00Rv6T8H2HYX6EqSNXVTTBt5c56i9549sV7qdTSCWWlywDmf0DlD
	 NoUzV4nD6GuIImCgbkCbAlnHDernc+ids47dkk/NDimgZ/pgL+lXi7CJhw9+Ixc9JtXXt
	 co3efvRoEQs/wAVCjXjcApQZeqyKkMxfgFzjSAXrUG/i7jgq//HZqi2rTxxvyA8mCF/k0
	 jQQRmeAKxXquNeZtwRc8Tr1Ttdw9/mxUawIP7/wt6ealySG9C094T+7znvMizB0MBzyRB
	 70tAA/OZM7M0LrKXX9x9HBE/WMVuRo8aTOCm3jXDUzTbehgLNONYCMRu7ABeXo/TwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=RDNSZmgD;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F48606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F48606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=RDNSZmgD
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8446af403b5so224786a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334126; x=1793938926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VilEBuRjBLpfrAybGiQrzjj9tQNqzv1uCR08XLAscA=;
        b=RDNSZmgD7Hfq7YIvLTbtFyEdLCDZpDX6jTl//bCh43JEUJVeU7EIP6jeh//AYC9ufM
         mnwzNVxK7s+QgiG1J0G1p781rlZUO9xGf1FMLgynSQfEt85dZgbqrVrM/lAn2l6WRTag
         mhrbHSBG48BiZbyWUeVtME7+N1niZ/i4w5s24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334126; x=1793938926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VilEBuRjBLpfrAybGiQrzjj9tQNqzv1uCR08XLAscA=;
        b=Hs//Innwo+w4hCfsmVlGH9HKfewsukpC9Ohxq4tvOJ0GXjvEFSkvRGx0y4omvfoAJM
         UJ56Wnffu917kfwVESBmt8Vw+Wm6lOfkatg3ffXCnqtvEcYNVC+tc9h57WAVSqb+PNcX
         2qYJeCJfY8BrW8txdrKIwC0ZSh6RP+VadVC+WOizPzmCFgt9QDlOn6L+MZyYMo9CdCaS
         whPSRQsysqrwLFw5pdUi7IW2InviGnHZNxe6EwmOkucXFHNSxBDY4YCaIlxW6ReGq48a
         IPnyXGHFyvSQk/t2QG2DyeDmj2iW1jLIhS7NnO97YNzXqjqWxB3stEaue1iwx7R9Tb8s
         5l+A==
X-Forwarded-Encrypted: i=1; AKwUvByeAkIrofTxl0mNF8l/tHYPbKAdW++CAwuHnDRI0d0lMObWgM6+s+sjo8TI0ql2ujBYY3O1kTlMiFlEktg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGX0ZXBPWw0LAMbSFIVXefdLAIIRYPm/62jOv2RnTd897IdoYI
	WEPTylen3Ww+TnRXool4JSD3EqYcgHUbOhYO8gFU8pAa7cZjKUd6DF59FCQviEYPoSZAxo4Tge0
	yF3o8+BE=
X-Gm-Gg: AYBFou1gFEwcF8ULcZMuPIT+JqZr7Z6qNZIblyCkKAib/3/6Mt6Wgf82sYiPUvhWZvh
	YteAc0fa08c8U4/caD6rhhfHvJWtQC+qKUuc/73emQunMQHCrCxI/1igG+9jrE84Sude5Cg0xs3
	xzEW7fF4lRkkXJldwWoxPlbwa9YRZ2h9hW890+vGY1EwwJEpWxwx+osuuDGMHZeR6J0mP3I8b0+
	/2EIS2e8f4IBX2sjoDx26l7BZoJKgB1Xp0KJLeb5ilNbpzA4t2DbPFakj+L5AXgsrAjNEimAZpA
	fvWwy154nGkwuPIaZjkU4RqwybjXUThRtCZeKh6alJhtKlVuJLkQ1tRbB8hteJ5KID3ZdxkM8E7
	5EjATkIqW7fmSPCgzkzA25fuwuDL7QtyIbu5TkjjxRPtX0L2sFhX6f4X0rZU0/5pH9aSHVa/jVj
	KNExw0DgFzCRU38Iw4u/BVUtCqfQpd671FVrxpbuH7FIcQr4L9qvwmWAGKblV9Ab5lG3Tzuf58m
	gDkPNAXG3tpy693fsn2ssWd3CtezlFy315D7DEcO8/GPbAZRi8M0kyEQ91YBt28fpbreb4qPsTR
	MPcQ7zX3mWtqJm3vfX907hNAmovbyspZvnMGhlXi3+2Hl+TTzngFUSEPkZVwgnwJhAI0Ss1tuwK
	CKhUQvPANzi3z3EOjtMzm0aQnDwfm4w==
X-Received: by 2002:a05:6830:71a5:b0:822:b69c:fe5a with SMTP id 46e09a7af769-85d3661ec90mr853248a34.27.1793334126175;
        Thu, 29 Oct 2026 21:22:06 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354efebesm1177931a34.19.2026.10.29.21.22.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:05 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] wifi: cfg80211: reject overflowing scan frequencies
Date: Thu, 29 Oct 2026 21:22:04 -0700
Message-ID: <20261030042204.73885-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

validate_scan_freqs() checks for duplicate raw u32 frequencies, but scan
requests later convert MHz to kHz using 32-bit arithmetic. Values spaced
2^29 MHz apart therefore pass the duplicate check and resolve to the
same registered channel. This breaks the guarantee that drivers receive
no more channels than they registered. For example, 120 entries formed
from aliases of 15 5-GHz channels overrun mac80211_hwsim's 113-entry
survey array.

Reject MHz values greater than U32_MAX / 1000 in the shared validator
and keep the subsequent conversions unsigned. Pass the unit into the
validator so that raw kHz input remains unchanged. Apply the same check
to scheduled scans, including WoWLAN net-detect, which use the same
MHz conversion.

Fixes: 934f4c7dd3a5 ("cfg80211: express channels with a KHz component")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/wireless/nl80211.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e204aee3..6cfa12191089 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -11470,14 +11470,18 @@ static int nl80211_set_reg(struct sk_buff *skb, struct genl_info *info)
 }
 #endif /* CONFIG_CFG80211_CRDA_SUPPORT */
 
-static int validate_scan_freqs(struct nlattr *freqs)
+static int validate_scan_freqs(struct nlattr *freqs, bool khz)
 {
 	struct nlattr *attr1, *attr2;
 	int n_channels = 0, tmp1, tmp2;
 
-	nla_for_each_nested(attr1, freqs, tmp1)
+	nla_for_each_nested(attr1, freqs, tmp1) {
 		if (nla_len(attr1) != sizeof(u32))
 			return 0;
+		/* Avoid aliases when MHz values are converted to kHz. */
+		if (!khz && nla_get_u32(attr1) > U32_MAX / 1000)
+			return 0;
+	}
 
 	nla_for_each_nested(attr1, freqs, tmp1) {
 		n_channels++;
@@ -11786,7 +11790,7 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		scan_freqs = info->attrs[NL80211_ATTR_SCAN_FREQUENCIES];
 
 	if (scan_freqs) {
-		n_channels = validate_scan_freqs(scan_freqs);
+		n_channels = validate_scan_freqs(scan_freqs, scan_freqs_khz);
 		if (!n_channels)
 			return -EINVAL;
 	} else {
@@ -11828,7 +11832,7 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		/* user specified, bail out if channel not found */
 		nla_for_each_nested(attr, scan_freqs, tmp) {
 			struct ieee80211_channel *chan;
-			int freq = nla_get_u32(attr);
+			u32 freq = nla_get_u32(attr);
 
 			if (!scan_freqs_khz)
 				freq = MHZ_TO_KHZ(freq);
@@ -12118,7 +12122,7 @@ nl80211_parse_sched_scan(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	if (attrs[NL80211_ATTR_SCAN_FREQUENCIES]) {
 		n_channels = validate_scan_freqs(
-				attrs[NL80211_ATTR_SCAN_FREQUENCIES]);
+				attrs[NL80211_ATTR_SCAN_FREQUENCIES], false);
 		if (!n_channels)
 			return ERR_PTR(-EINVAL);
 	} else {
@@ -12276,7 +12280,8 @@ nl80211_parse_sched_scan(struct wiphy *wiphy, struct wireless_dev *wdev,
 				    tmp) {
 			struct ieee80211_channel *chan;
 
-			chan = ieee80211_get_channel(wiphy, nla_get_u32(attr));
+			chan = ieee80211_get_channel_khz(wiphy,
+							 MHZ_TO_KHZ(nla_get_u32(attr)));
 
 			if (!chan) {
 				err = -EINVAL;

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
