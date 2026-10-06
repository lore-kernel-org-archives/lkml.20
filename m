Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98149E13F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303480; cv=none; b=QeIKef0zAIFwcpCmdwE7wHdGBd8MJ2oDbB0qvcLD78LGPBqtnAjedbR0fnDaJVEkQdtU4tpP00WHuiTwekSxh16IPLjei86mwO/bIktBY+e5wnVxTXqmE5LJXPsmoZJmsQJRFjEqKqCV21OytNq2d1EwCjTdfmIw1M9b3g9N5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303480; c=relaxed/simple;
	bh=B1Mdpk03iIpWeMkqOfV1qprInLhjCazDZYQpMs3zUx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RTEbsVqNX/sNnKrcq3JTXAoSY76UKMcwh84/IBE8+B1/VsMmKhUhU6XyolawK7qhwxefAamAAzuijrU6o+cKeSSIkFjEWy9/apKVWbVJ1GvOnXGWqVZDGDacxnqzj/JdK8oXwtzfTBu4M4SA0dgx9nNGTKNWgR/PTbwlXwDxM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UptOmR/L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UptOmR/L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8311655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791303477; x=1791908277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rj+ANBVjGQUDryG59riqH/2PuEnYDgs9HpOk5Pb5AgQ=;
        b=UptOmR/Ljm5GHsdlffR+mAJFcjMDJn1UPlZf7I1qGo1jIPTaR5ybO7SoJ3PU4DrcIP
         Zy2ksJ0OfXgvWgE+C9GlZre4Aehyr1j8WOqMuntb1lPCtXxsb8XO+kVty9BsdqGpxhrA
         B+dqyhyeHx68h9tvWwqurwEYoRT4C/0ZVYIuj9+FGPg4qhi93jfwttvdfqntEsNUDvs0
         BpbYgKByYmastLGeLAep3zrq55KDeO8xbiGZX3HLGZcxEengHRYM7vK9RnDJIknY3BZB
         qv8+zE770M3aJuHUmn3lURwi8wES5AkRzlpI9lmdpUwWh0X3AucglsDQaP2EN+4uuuIN
         3swA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303477; x=1791908277;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rj+ANBVjGQUDryG59riqH/2PuEnYDgs9HpOk5Pb5AgQ=;
        b=cjaO+WilraLIERc9ej26FqyQJ/6HiF2QP8pTS3nUMKtLtwrcHNxWvsW87g2KafFh1g
         a1qFM3AK1Ys2sxjoJG0gLQkO7fQ+NHaCAvKKJ6k8FQanHORQKKNZYpDNLe7NPbQs/ZC2
         nchSGih36J/P6rly//lfXnCpgS/XoNhFnCN3b3PcttgZcK6hQ3clU8BWfV2WMtbvfJaW
         ybJXfoShv2FmHcQnLhk/YQJ/4GXsQxPJNuvEIA56MwX57yAroO8WRz7RzkaIcoc+f9I5
         L7UqLoKouJSUwzdfFogybPaiDjHWyBbpUqbJHy739zv9uEpGu7xKimB0tJgYkK75g5Su
         pndw==
X-Forwarded-Encrypted: i=1; AKwUvBzFAL3EmfgNuKQDe+43ouAy/HeoQfHiXLbF2/maaNWcJy055knMaNUxAfXv8K0FM6k5G7jfZpySJfAxLkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nMGlo4IeNJfZ4SIdnK4PdFjUtAJz5ZJ3kdePsnreIMD0OPRvq+
	LNgrj+1AZPSJLekLtGycHmleZxpsmL8ZzgrCh+sCNGbDEJW4s4O62ZEX
X-Gm-Gg: AYBFou3rX2vxCCkuWB30w9Zyr/3rBLFATpFVn0kzkL3vMCpK4qU8uSONXh/EHicaqsH
	+xkIuA2S86MXyupvFy0K8gdZCF7LNu4PtS9Py79BZchRBFKyFP7kZ+I/DWkiIVugUI0m8s8BHFf
	RsfFc0PQNbz0oaYoViH5vwyi1Z3uW0XH6ZfZ3EstLk7i8sdJZUauBsIPqsqlTfPNiH7IP1/UQwp
	bdRNXmd+Pi1NLOOOmNjRz3Q1EH8FtXyMhLsZQtNOf23+XYwh8nJU+9FhhmRkAmCDShgLd2mxabk
	vuO9QeDKLcVMf722fZp1uSoIkAu1gU11gxBM3cKfoworP2+IQZIE4orIZInnTyeH7G5cXXuuhJa
	HXhbAgohmNesA2Z7quRhgMZnLYH4aBlXAaoG7YKcA8cuReJdaKNIDRwe9WevZsy6KXfvrQKFbX6
	/v9PWPnaXiEDeqJxwxa1OLy4kJKZaTs0ntF9wGbLSXpytCMj60K3FsQKLcSUnABRJph5kLC+3pK
	B0m8e4IDfWB5BuA39TjZw==
X-Received: by 2002:a05:600c:8b09:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a17b4f4276mr32986425e9.1.1791303476638;
        Tue, 06 Oct 2026 09:17:56 -0700 (PDT)
Received: from FranzSP11.tail2d6612.ts.net ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm275692765e9.4.2026.10.06.09.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:17:54 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: nl80211: don't WARN on a missing self-managed regdom
Date: Tue,  6 Oct 2026 18:17:44 +0200
Message-ID: <20261006161744.3804-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nl80211_get_reg_do() has a WARN_ON() for a self-managed wiphy without a
private regdomain. Userspace can trigger it with a plain
NL80211_CMD_GET_REG request.

Drivers can register such a wiphy first and set its regdomain later.
ath12k, for example, calls ieee80211_register_hw() and only then applies
the regdomain with ath12k_regd_update(). iwd queries the regdomain of a
new wiphy as soon as it shows up, so it can hit that window at boot:

  WARNING: net/wireless/nl80211.c:10828 at nl80211_get_reg_do+0x1d0/0x1fc [cfg80211], CPU#5: iwd/721
  Call trace:
   nl80211_get_reg_do+0x1d0/0x1fc [cfg80211] (P)
   genl_family_rcv_msg_doit+0xd0/0x138
   genl_rcv_msg+0x58/0xd4
   netlink_rcv_skb+0x5c/0x140
   genl_rcv+0x34/0x4c
   netlink_unicast+0x31c/0x39c
   netlink_sendmsg+0x188/0x400

The same trace has been reported with an Intel BE200 (iwlwifi). The dump
variant, nl80211_get_reg_dump(), already skips a wiphy without a
regdomain without warning.

Keep returning -EINVAL, but drop the WARN_ON(). The same change was
posted in 2021 but was never applied.

Seen on a Microsoft Surface Pro 11 (WCN7850, ath12k) in 3 of 4 boots
with next-20260929.

Fixes: 1bdd716cbcca ("cfg80211: return private regdom for self-managed devices")
Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Closes: https://lore.kernel.org/all/DL5P72WYQVOQ.23G9D01OY3BAA@cknow-tech.com/
Link: https://lore.kernel.org/all/iwlwifi.20210409123755.ba2ea961f4ae.I8fde32d3196e860efa3b4ec464c42194195b42ec@changeid/
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
 net/wireless/nl80211.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index a18240455..2589491af 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -10824,8 +10824,12 @@ static int nl80211_get_reg_do(struct sk_buff *skb, struct genl_info *info)
 
 		regdom = get_wiphy_regdom(wiphy);
 
-		/* a self-managed-reg device must have a private regdom */
-		if (WARN_ON(!regdom && self_managed)) {
+		/*
+		 * A self-managed-reg device gets its private regdom from the
+		 * driver, which may happen only after the wiphy is registered.
+		 * Userspace can ask before that, so don't WARN.
+		 */
+		if (!regdom && self_managed) {
 			err = -EINVAL;
 			goto nla_put_failure_rcu;
 		}

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
-- 
2.56.0

