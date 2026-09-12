Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7919D8BC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198126; cv=none; b=Y4HOSUfr0Nc9JKVZj2gBhRqEdbk9egzKroaTIPYLZhTjzl4lTRhSlaRL7X1Ow/24gON5TARfKbilwLmhIaXZMTEUnf2sT2SZRgw6ZZzVebVIeHboUPFH4sNnpqpeywcO0Jj5rb7bcfeO4jqcDl8DL5w+bVsOoFbLt1Pz7yGxi3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198126; c=relaxed/simple;
	bh=Z9wPS/MfHLphmStRsx47ywqAztRP2hflM8FIhbi5DoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xbeo/DNiEoJdOk4ybGo7XtYO7ZzJey3hX25jlKSeTukboRS4QoTbCIwfdQ+WXNM9/YxJP8KvE0cukuHOGOFOkHNHNLHfqdSwbkXyhjrXk+MfxIaaOkX9e32OenpUULeMDCLYPTlatglvmhS3w4CPs6WpcURa1rSjuyDjMuOvtFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2BTW0Tx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2BTW0Tx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso5078855e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789198123; x=1789802923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXp8lyNVVb74WFu8BWD5kffDqlcHsOtjcWC5AhUADvI=;
        b=r2BTW0TxSKWIvgAWEZmbixpRep9wNqqPhdCZ8cJzKuLWeVu+bd+raYyWWITg2iPYP4
         /nqDRzl56ebQRqYVSCb/vz8184oquvYbjmqXNUqgEcIRpmEpL8WKHAjOl96XdvwtS4Rm
         xsI3fynKEgSGVzLqJYmaiv+qIGU/GYX2ElnafXSuMhjtIODImUr+m6+WR5ctsxnf4z3M
         ueWbNtcgfNx4NO9bsRICfRii3wRee4Y+7sXyychrgTiQHWB+NGbFLy/Ywe+9Zb1+9oY0
         X8C0wWcmaQrI37Vdofj0VOY5e+NaFv9hYXqSWd2XDgHmu7+imSQc0p9DfHVFfEplM7mB
         TJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198123; x=1789802923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXp8lyNVVb74WFu8BWD5kffDqlcHsOtjcWC5AhUADvI=;
        b=m6xBkUvo9yU2Y8r1eGoP93UE0FujbJJQplyX1CmlyPjQ4R6nPkA8arN+fQzyZFllGz
         LawRByrJN1GaJwrY+fqXv8zRWI1cxyvduQsXID9MMSCjXjVtppkaoE8EGe0c6dT2Boor
         y4bVYK/oNSy9s17p/BCWvhBt49m2PREDgGdX8E6chlkWLkoRWBo0lS7LD/v6t8a3sgRM
         fd018pA3nCtw58kBZbzvpKcjQpSFhxg9ThCWEds/zBXfTjnHfd3X5Uq7llDoAcazsyKX
         11EyxI9qPPNB2riPuDPjDZFLXSPyccpSt2Y4OmOvYeHgpPAq7qcaZM6eRUaLrUx9cjRc
         SdRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQskoCqqIbdVs8ZaqXHBJ6DkTGcZkCQskJZp/rMnjmwFW40Nj0BUVQaKyQb4Q0IYf1cCwP1BWn2a4n3hc=@vger.kernel.org
X-Gm-Message-State: AFuF++kOzIgns5kXrBVydPOKOJRAdc1bWJnIQGOONuJP9qwMr/Ej9rFz
	CEI1rhLZVkrdvoYXJrhw3lyRft1ipby43XND0TwbRlzOy/QQm351FnG5
X-Gm-Gg: AYBFou3aTVjswH9RvHvXF6cxIecyRsFwfxN2n/OheYJxda6N+m10zMtPf725kCSDPsi
	VEMfePHt+SQer+5h6jKQOxm5TECYQj5kYukdj928b9Er9DTUbB4/urykTGtp6bvaw7WsjctNl9W
	5IExyFkF8eM8CiK3/TdMLaqORVuM8nZUBLo2JxJ+ap5NwOnAvixyz0GLd0CJkry01JGgVDtZwwc
	Ome+peP/veERdCqt9K/0OjsOBgK2bt5feQHj6mteV59m/ouWxPknpKoUICYwm9f0NM2URCQBXWs
	y43/fYcbuNfYkE3kvNTuZiOOFGPeCXOQl8RG69UStNks4eybsu+I9CjlndV6s6orp+nU5jUZ6Bj
	5bF0Vl9EqWwj+00V+jPq0CrX1+oW52sjq4lhxHLKcLLjjzzzkO1d6w0OO/Gtum6DEbvrEX3UX6b
	LJuZQPxpyOXH0EbQve+P5UClaC3WF2f1PBSxJMeWCr0X2Aw9rjpRQjcwxKaUmsERW2t/YcrSyFN
	wY3tYwBMeOUlpqkrLFtwanI+EEwldS+J9cZUKU8gVqTHd/DHzAZQZGKLPyexVmHi6H42eO/GIEO
	6QlkKQbg3ZDFgaUXOt6mO+kQHQkI5nuiO8YagqdVGk+O+pM/9Ij1aPjaK90+2hssIwqT444jTvn
	nA9hzv1s=
X-Received: by 2002:a05:600c:4e0e:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49e619d4d30mr91931345e9.27.1789198122902;
        Sat, 12 Sep 2026 00:28:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm235846435e9.1.2026.09.12.00.28.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 00:28:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Bob Copeland <me@bobcopeland.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mac80211: Fix the return value in mesh_path_add() kernel-doc
Date: Sat, 12 Sep 2026 09:28:40 +0200
Message-Id: <20260912072840.50710-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mesh_path_add() has returned the new (or the already existing) struct
mesh_path, or an ERR_PTR(), since commit ae76eef027f7 ("mac80211: return
new mpath from mesh_path_add()"), but its kernel-doc still says
"Returns: 0 on success". Describe the pointer.

Fixes: ae76eef027f7 ("mac80211: return new mpath from mesh_path_add()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 net/mac80211/mesh_pathtbl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
index 03171cf008557f1eac3845bb2d5d291af04f6249..a9c5a3250edbb350cb5b638ca6595a0553f96bbe 100644
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -673,7 +673,7 @@ void mesh_fast_tx_flush_addr(struct ieee80211_sub_if_data *sdata,
  * @sdata: local subif
  * @dst: destination address of the path (ETH_ALEN length)
  *
- * Returns: 0 on success
+ * Returns: the new or the existing path on success, an ERR_PTR() on failure
  *
  * State: the initial state of the new path is set to 0
  */
-- 
2.39.5 (Apple Git-154)

