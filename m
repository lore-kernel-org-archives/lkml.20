Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197308;
	b=V8/eIUPNi9kFw77xouTytZs7b1xEzpkzqLjEnzQn1Ju1e9zyup+bq+o408n3VqY8AAwI
	 qKhYjA44zIHR/hrV3S4Vtcc8u/k1tj8i3jGI33802nWJ3Bl6HrA7z+r2kflkm8QJBxpFI
	 +13vus3QH+fQ+OqSP+SB/AqItI0xjjM8NCS6IGcKllpDKUgfy3t6RUNwqOamm57mCy9eF
	 2KGh3I41bwoi9JsEIe1xdB3Z3oXn8zo3MzZ+hz2g3UjR3v6mQpHIVpjwVD7K3ATX6rZDn
	 8YPtD4DEdssa+3EUqfADJatquFrEy1QziuOVqKcbXs2WDiC/bP6L5Qo2LLqhNulYYzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jvqlznIRpcb2r5A+1FTqthWVZHsxJDeKaLsBSLtvHm8=;
	b=dnc/3La8mWdHWhmTkb7cg4REUSn9xKemmm/chfl/k+r/o7CWT92knRS7dOGyOzPz8QK+
	 +f35sI5jXHtdctub1MtoyF2rlqQSyrR5IHXH/I9IV31zUaz9s2hUPzpCP+NG5yo4PHOoc
	 U1pEqkAZu7sTBa7N+myivEaqJB0WDjS+gS09Ptphw/EsIJiy2lH526MxZ7oTmihIlSSlX
	 rCdKkMEQsXytiPOGiUMbBG572K6L4ruOULhqw6Zkurf+LkYcXIh/p+nHwyVvtocNd+b/g
	 xRUCclwnMivuWPFlZisTg76K04t/HQU0UVv1bEEZ/syAcnFIQW/kU7gzqKIUYErJPrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYDFN1gn;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1EC606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1EC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYDFN1gn
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso501152a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197308; x=1793802108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvqlznIRpcb2r5A+1FTqthWVZHsxJDeKaLsBSLtvHm8=;
        b=jYDFN1gnQmqyKqhr+ZvFYypHYGS5CGWfK+IGEporq5BRKI79QFfQPwxrSI6sn79FMo
         NO5OBYMvH2hBAFmofJBmQZKPOTl/QGmZH3eWlx24JpmZxKYdfVx+VNXV07z1Yo9QqgN2
         7RUn/Nm1ftPgCKZkFpIyQLYuOC8et0CqmF+P49yzbn8qCmKlS3i1oZfe2HIx6K8qR3ao
         FTiVis+YTHzyBLz1++CfEyz80BOrOXOE4dgJZwfgDbowaAsgPzgqSPx9BwsO2Mw66ijJ
         kOEpn+3lIWTs+yuKxKXkhf/7N/EhRCmLsdeDMRn87H48PHQfF133PmrY1IZoAOFIbpFg
         uEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197308; x=1793802108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvqlznIRpcb2r5A+1FTqthWVZHsxJDeKaLsBSLtvHm8=;
        b=zJt/2MkBLBUhIk6/EmeoTCWZgriTwx+6rxwBSIAa3eUuAbQA+E3GzQbVGehhcFvkx/
         gq/klEIap+vVL8JKWZIGqdhS+/mX5dmcpcGk+i8douJ0NWvMBrXl3KKPkvzmpC9XyNw/
         Y9mRLdKDp1pk7tSiEnJBQngr6w23UQv8SPZgwwpLGBc3NRtUS99BLm+kS8dxWxcAC0mW
         El5HJpcZZPr6CIJbJq/vuUYuQ63bDJuGH8LCN7v9cP5T97EBZVAWsrCw5v/sNTPLj7+D
         WtOqpF5NdsQFVyeHMgyeLlZsKKeZmv45pK8aBTJOGILtpps2pKqrGPi69CFWJ+FyBnw2
         dSuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSfYqN1amMRL4vws1Xq+GiW7Az71ePDLD7RNj+6c5nsCTfE6s/Bl51CcOQi4Is1+VDEnRn85+jBCOs7vQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhjFwcp7/v86uIB9uItmQBTn330GbwkxakogZ6HC/4q1ayU5hB
	saYqnTMSWGnjQJyQfXIiU4DLufOz12Psu+10DTUbvIxv+P3mADxhDp3Z
X-Gm-Gg: AYBFou1ZbDng1frcHUyChbXd4xk23rqui4ffbBeN3Q8Vm4agzoq/kpdwLfwC1Y3hIkO
	StOVq6l8/Q7Ih+GK+cCmpnII5grLzq5Mj5SzWwnpKDuXibI7Qh4Wiz8UywMW/DmLLU8fOy/c2k6
	ZuNKkm6STbNI4gRLt9ACbaPmae2sIicn+C/PX1NJMhN4Y4TjO16LM9KXwW7ny2E2lW2zQbRT4Rp
	lWo16qqdoM4Eop7H0aXPJc+94GjhRgliDphSG6l1uLTTVKOhM5HxqqMmV8xb8Rfh51w1ucutCBu
	cY+yR+xRCpBPh9nURIy+HpdGvFcEI7tKK5GIVTWR5CqwVyS5SszTMtdHrjiBMXG1tj99kHgP77F
	aCcF86euDpNB4ELHzCDQJ8SYnsBrF8c2GZZDSWqDWBCuc9w+5yNG+eGDCc+HI766nJNXTFiUT+W
	19Q5Af9r3jN9y0YRr3GJH+4doSYQ/f1wXHRajLgrSKwEGa/kQUkH7YeyGwkqA1E/Cxa23G9x2r3
	AxYO0pEGfaGLjPmT/HxJp42k4QpEn3FbTIIj/TrLrq04OIZ7QWMGZgexHfb9MmXvekhv7EjDCxM
	ROjYYlr4zw/T+KC8FLx/tTGhSo2+Lz80vxKh0ozft/erEQJwsYK2F4DfsS5goTHSHqnV
X-Received: by 2002:a05:6a20:6a0c:b0:3e0:e400:3fd with SMTP id adf61e73a8af0-3e9023a4ca2mr2024572637.43.1793197307457;
        Wed, 28 Oct 2026 07:21:47 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfc292sm1224768b3a.42.2026.10.28.07.21.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:21:47 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Gregory Greenman <gregory.greenman@intel.com>,
	Ilan Peer <ilan.peer@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mac80211: restore dormant links when link updates fail
Date: Wed, 28 Oct 2026 22:21:23 +0800
Message-ID: <20261028142123.13072-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026152654.80697-1-enderaoelyther@gmail.com>
References: <20261026152654.80697-1-enderaoelyther@gmail.com>
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

A failed MLO link update can leave the interface with the requested
dormant-links bitmap instead of its previous one. This can disable active
links or trigger a bitmap warning during rollback.

The error path restores the old valid-links bitmap but passes the new
dormant_links argument to ieee80211_set_vif_links_bitmaps().

Save the old dormant bitmap before changing link state and use it when
restoring the old configuration.

LLM assistance was used to find the bug and review.

Fixes: 6d543b34dbcf ("wifi: mac80211: Support disabled links during association")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed on top of
the prerequisite patch. A QEMU guest forced duplicate-address rollback: the
old code cleared dormant and active links, while this change preserved
dormant=0x2 and active=0x1 without a warning. The driver-failure path was
not run. A reproducer is available on request.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

Depends on "wifi: mac80211: fix use-after-free when MLO link setup is
rolled back", Message-ID <20261026152654.80697-1-enderaoelyther@gmail.com>.

 net/mac80211/link.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index fac5a8c22596..41c1ae52e097 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -290,6 +290,7 @@ static int ieee80211_vif_update_links(struct ieee80211_sub_if_data *sdata,
 {
 	u16 old_links = sdata->vif.valid_links;
 	u16 old_active = sdata->vif.active_links;
+	u16 old_dormant = sdata->vif.dormant_links;
 	unsigned long add = new_links & ~old_links;
 	unsigned long rem = old_links & ~new_links;
 	unsigned long sta_rem = rem;
@@ -399,7 +400,7 @@ static int ieee80211_vif_update_links(struct ieee80211_sub_if_data *sdata,
 		/* restore config */
 		memcpy(sdata->link, old_data, sizeof(old_data));
 		memcpy(sdata->vif.link_conf, old, sizeof(old));
-		ieee80211_set_vif_links_bitmaps(sdata, old_links, dormant_links);
+		ieee80211_set_vif_links_bitmaps(sdata, old_links, old_dormant);
 		/* drain RCU readers before cancelling work they may queue */
 		synchronize_rcu();
 		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
prerequisite-patch-id: f3df0cde74cce63ac37decd81c2613cdb13f49ff
-- 
2.56.0

