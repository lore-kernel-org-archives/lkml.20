Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27391481231
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397712; cv=none; b=DzTBk/eZ0sjX6AZOj8di81KReDaev/tZjKBBNqzoaU2I9IsuBLDSyd+DreJYitnNjpGr4SOncoK22Tgz4qBF26hDk35heYCVC8wwZJrJGr4ydZw6bpcHW7W0ofC0X9JzwO8NQwxBrJlustQLUv7p6UfoG7VAag1Fsl6aABMB5FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397712; c=relaxed/simple;
	bh=eYMKmu0TspLLrpI7Dq/rAwnjuVZWjXe2BfIsHDWlOMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nie6q1OK49pzumEnuzsaxWjUua5HS9mnG2FRsXvyN5nFY6J/rPPG0lJ1jSyeM8/CG2OHX+naJ3a60XL2PZ+L/sjMda4KFLveCfRu2R8fpcgwvFA7AoGmFE+uKImkuJx/mSNJlFqPT44JFgsCJjwj1eowg8K5Qh+D07D35Sx5koM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0I3EdtH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0I3EdtH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8701fcf40d4so393876b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397709; x=1790002509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K40D55+QEw0tJrishTnnZFQc54eXC6WooG3rrnRojok=;
        b=g0I3EdtHJEOecnsphh05qTqrPZnm8t9vaNGW2qPUrPdtKmCV6z1pFyMmBq0MkpvWOH
         MjIoGj2HhKrijaRRRLrrC+YPw1ZKUBJsXIhuy/ZMKscTixDS0oYiPxKUKI/Cv/1c25PO
         sp89qp/hboCTlyLCL0xuUia6cvdoFqkkA33hdFQchL3BZwAeKzB1Wmv7D91b7vMIHk2X
         ZD7L9/6vkvqGFZQXOJabJBl5tfoKGQyMzAVgFX6C7+tN229Ai6dh8SWScdhsNLt+dsiL
         hgu6EWqmL70MRTmctMZg4qpOIkq8CidZkVqUJR1KkolcHA1/TjgrT9POn7pxTwaeQ6bL
         I1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397709; x=1790002509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K40D55+QEw0tJrishTnnZFQc54eXC6WooG3rrnRojok=;
        b=Vb2PaL08wvc6RuGbai6Un7jrsBE2H8QqtFFPiX29leQqcYSpCyujUsiQ4gL4zg13ob
         PpYgfeySDLf86TMDMQ516rstdl2iMco6RhrMmYckvdTm2hdpy0v9B/Hg+SUDuJFS1Md+
         cIVQR2m8yK5xP0pJCfdbN3yC3es82L4PZGBfL1jKVHckUly/uAIFGHv+2Tt/8SiXR+YX
         Yl7J64zFbHAuWRAoOZbfyxH0rYyLBBybjLHNAy6hNVzE+QASjuH0i8fDdkzaj8mZm0Pq
         A59+ZPFe95AGhozvfHfNSMt02uyPbtmHewGCRQa69Cvl6OTzhMTUCZo+3k0aOdSmkeqp
         7K4A==
X-Forwarded-Encrypted: i=1; AKwUvBxpoS6sJ30nXT9S6OKkP2VLK6SYVNUMvKpi73XpNUBIfV3i5HJ/EkAWEcvqiyiXi4Vi2bnYIZrvR2RfzSs=@vger.kernel.org
X-Gm-Message-State: AFuF++nbkwqkACUKhU+SrL2p7yzMPsTjXm+wen45TrwnIC5wzkZvBG2K
	AgCnqqjuH6FbAncp/jLIEzebVk94fegj2XHWB4A7lRTLgW5hlU2aJ2U+
X-Gm-Gg: AYBFou251aOng/g8X7PhXjm+tEdlaDLO2uBrlrSLRkYAr/GoGdKe1grIZa7zYXlYIF5
	wFeHnQNfvpEeE/1bkN8uBmIAvG6eaTLmDjF1zAKYJLs9P0KWww7idHg20vFFEER7LbkCGPLPKTF
	mUbVpYXQyPZjDwC5Z8VcOrAVLzhYJYS3Z9YxLAznFrZbiltH6mhoL9hCOzWyvT5ZzMieWpaNMt9
	BfkcmPagRaW6ETIcYy+3ScOmQRSBQ7DcHZ8IpUb0UY72w6pURNvfj2Ps9jxyxttnFmPwbySri/m
	+uA24qF7l/FxxKx+KBKbCliEmJpqGcoflaDU50IrCwl7pFITT3+Dy0q4G+Uvxtaias/WrR8KsMP
	tWqjaGy/YJh4uoGkcVugaUsVtnAkQgY5bT0mymDVaB49F0tmw2pieEecTglYFv7BBqFiAU40mG4
	zddX5xVgihDj9WGwJLFqDP061muHScl5pEl9RrQNBaqhzZ8n6dk263S1CHuKwvp9kMt1VZSXrAq
	3/9QHiJ+740x7aS7FYaehc5G0L5qQrlpxIprTs=
X-Received: by 2002:a05:6a20:c88b:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3db404269e1mr7176490637.7.1789397709022;
        Mon, 14 Sep 2026 07:55:09 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615a65bsm5338805a12.3.2026.09.14.07.55.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 07:55:08 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] wifi: iwlwifi: mvm: defer freeing PTK PN state on key failure
Date: Mon, 14 Sep 2026 22:54:31 +0800
Message-ID: <20260914145433.42830-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914145433.42830-1-enderaoelyther@gmail.com>
References: <20260914145433.42830-1-enderaoelyther@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PTK packet-number state is published to RCU readers before the key is
installed in firmware.

If firmware rejects the key, the error path clears the pointer and
immediately frees the state while an RX reader may still hold it.

Defer the free until after an RCU grace period, matching the normal key
removal path.

Fixes: d066a530af8e ("wifi: iwlwifi: mvm: fix ptk_pn memory leak")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
index 5bd246e37943..b0c4f245c88f 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c
@@ -4385,7 +4385,7 @@ static int __iwl_mvm_mac_set_key(struct ieee80211_hw *hw,
 			key->hw_key_idx = STA_KEY_IDX_INVALID;
 			if (ptk_pn) {
 				RCU_INIT_POINTER(mvmsta->ptk_pn[keyidx], NULL);
-				kfree(ptk_pn);
+				kfree_rcu(ptk_pn, rcu_head);
 			}
 			/*
 			 * can't add key for RX, but we don't need it
-- 
2.55.0

