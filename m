Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA2378D8D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854772; cv=none; b=peUpTuQ8IdjLlBdFUbuDBR322HRsu/n/ZTMzIpafEYMVccsBV2vhmbhueUNKdg+XJp1nlmdV6/5D08v4MuBp+5GkezYtD0Gr7AVRbsdPErh1EBFWNyF8PX8cILpUUn0Am6ARFVoTYS2ZEXbu/bF+FXdjjmpR+Zd7YoVeBKTqcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854772; c=relaxed/simple;
	bh=Dtow7kJqEeyZW2h3uJ13cQiL5/BpRJhEJ70CB5MBkcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFIFfJd9RygqUJUNGvXT24Pf6rlqHPiOzXUC4omqrsdvtmN8eBkOemQF1s/P7rMh3a4LRllyKcyDFgc6InaHBb978H+H/qxR9i9plknh1QXa0NpBOp87y1/MITB7NMf5MC5bkc6ahBkNTrb0lMCgfItETpH45SwBxHjk6ztQ9UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLs/0Q8z; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLs/0Q8z"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so274150a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854764; x=1790459564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH5MPo1KuhWG3KVnvfVUYVHgxolmH4XOxGLTnjREHd0=;
        b=eLs/0Q8z6SfyHeSw8jiJ/ddNXLoEa+hQw31KvqOxO09CWgSOgMmUjpkVIlHUsMY5yx
         JJEYhftovrKOgqKPHBFKmVG/MC6dj16IJP6SQvowC2Y+bNS88AesmEtOra8wHicSgMy5
         jIzCinovpOHLWzcHnYa3cr7Q6o+1eI4CX/yXBb/aZUyi5cBKfzxVLQOQLzG7XbEJpEL8
         1DCduwh0deLq/lZ7GOr6NdFpq1UQ/+0uF/Nal26hT/spwzFCW+h1hW9dc+OQoKu6PwtK
         s7gVVYvtstK1kxHJpBZiOpypPE+IsDUFFNh74o366fMYzEU4wZMtiaUjkw3hLuLhbQUp
         2KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854764; x=1790459564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH5MPo1KuhWG3KVnvfVUYVHgxolmH4XOxGLTnjREHd0=;
        b=1yFo77blCZlLq499M+nUB7Rk6b3W/3FrWyRgKDBSU0+E3BnDTshwWh9Vzrnqocvx8c
         AFpPv6j6nb3+mCuomoa/KvbxonXQ841vI6whYW79X/a7mLOIW5pKY/qimTJFwON49jGT
         2msd9tzJkFjM/+OFIsw6ueiLHTU+nkf3B2j5ik758q+UktsJBnwSGcrk8dc5cEDUprTG
         +afn4VxSVwafanXxCA0Vwcr5MxUgBeU+8PMudQoOGUc86eq+r+LwsR10HKBaEzEhYFRn
         WrdeIUvLXRIF0ftL3hBCTxlk5MV/kgnmLNtc8l71sja5F3be6LAt+ITl0IATHjHVscwn
         e/Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzv/RVrLRL6LLkn4AD12MNWn7SigmyOQhJfNUWKpC4LPwAu3JwS0PnkL4nu7EA8R12sGVv0HRgynUA+aMg=@vger.kernel.org
X-Gm-Message-State: AFuF++khCD5YrV7wG9hLlxYV06SHAQDw5jgxzhBjbaGqQQQWjtCJuEQr
	4YIeaSxLRkiSySzOe+4Mbjv2NiaObnlLt9jW9otkMSsljT6SKsklvqd+
X-Gm-Gg: AYBFou1vJ/8R/B6M4LI4ib98E41ogDJ3NHs/cCQlNvcAhdhWLnIWUJpCgA4FI2Ua2K7
	1BfiCBG/Nvjvv8etrmDByyghPxgB6tBdmONH3FESPkerYBe7OOovtgB9Hjfxwn7hxCHqKDbvVBP
	Y7X4/5TNVpAK2FgRy5miz1VofY7UagA59y31bgVUQhty1u2ULqpext1e6qfCKDnD8Zr1nwQO/8b
	uPP55b8mw6H9S329bUpFULUS8MgFKdpQYHylx5P/Qy9vVfUDizRL/W9zTLR5umoh0y+ikrgzn1v
	82uFIitx1RrxnTldmpV3GnUQOyaspeib7lR4nbyCd0WB/dEmC1T9hJ+G3rnaxz+pAZ0lg3dp89j
	MTXqU7RvWFwvu44neRp2ddVlWTNwNpw9VNABdjCx2pSu8FIcizP/4DDfO4O/1hqDtRZhYqIopO4
	Rp4NbkP1s8diN3EC8B314ayrci2pD3Q/ofarz/QeDc2cNQ9+49p0BhYs/Kv5vyVHOjGYODcStJ7
	AxdvO/qSnIf/pOyLv6KsFVZ/eIsgIkEYfQ9QARzzAHAgrNXNTUHSpvCVflKzXRupSZ1Wafdzlic
	diwX5RvrTw==
X-Received: by 2002:a17:90b:2649:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-39e54dce754mr12273981a91.14.1789854764308;
        Sat, 19 Sep 2026 14:52:44 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02900f84fsm4226219a91.2.2026.09.19.14.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:44 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: paul@paul-moore.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netlabel: cipso_v4: reject empty MLS level/cat lists and zero tail in cipso_v4_delopt()
Date: Sat, 19 Sep 2026 21:52:43 +0000
Message-ID: <20260919215243.3472150-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three bugs in NetLabel CIPSOv4 handling:

1. In netlbl_cipsov4_add_std(), an empty NLBL_CIPSOV4_A_MLSLVLLST or
   NLBL_CIPSOV4_A_MLSCATLST leaves local_size or cipso_size at 0, causing
   kcalloc(0, ...) to return ZERO_SIZE_PTR (0x10), which bypasses NULL
   checks and installs ZERO_SIZE_PTR arrays into cipso_v4_doi_list. Reject
   0-sized level or category tables before allocation.
2. In netlbl_cipsov4_remove_cb(), also inspect NETLBL_NLTYPE_ADDRSELECT
   entries so IPv4 address-selected domain mappings referencing a removed
   CIPSOv4 DOI are properly cleaned up.
3. In cipso_v4_delopt(), zero the trailing cipso_len bytes with IPOPT_END
   after memmove() and pass opt->opt.optlen - cipso_len to
   cipso_v4_get_actual_opt_len() so stale tail bytes are not re-parsed.

Fixes: 96cb8e3313c7 ("[NetLabel]: CIPSOv4 and Unlabeled packet integration")
Fixes: 389fb800ac8b ("netlabel: Label incoming TCP connections correctly in SELinux")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
index a05aa075de1a..4ac1a4965abe 100644
--- a/net/ipv4/cipso_ipv4.c
+++ b/net/ipv4/cipso_ipv4.c
@@ -2025,9 +2025,11 @@ static int cipso_v4_delopt(struct ip_options_rcu __rcu **opt_ptr)
 
 		memmove(cipso_ptr, cipso_ptr + cipso_len,
 			opt->opt.optlen - cipso_off - cipso_len);
+		memset(&opt->opt.__data[opt->opt.optlen - cipso_len],
+		       IPOPT_END, cipso_len);
 
 		optlen_new = cipso_v4_get_actual_opt_len(opt->opt.__data,
-							 opt->opt.optlen);
+							 opt->opt.optlen - cipso_len);
 		hdr_delta = opt->opt.optlen;
 		opt->opt.optlen = (optlen_new + 3) & ~3;
 		hdr_delta -= opt->opt.optlen;
diff --git a/net/netlabel/netlabel_cipso_v4.c b/net/netlabel/netlabel_cipso_v4.c
index b080e666523f..9bb28236b8fe 100644
--- a/net/netlabel/netlabel_cipso_v4.c
+++ b/net/netlabel/netlabel_cipso_v4.c
@@ -185,6 +185,9 @@ static int netlbl_cipsov4_add_std(struct genl_info *info,
 					break;
 				}
 		}
+	if (doi_def->map.std->lvl.local_size == 0 ||
+	    doi_def->map.std->lvl.cipso_size == 0)
+		goto add_std_failure;
 	doi_def->map.std->lvl.local = kcalloc(doi_def->map.std->lvl.local_size,
 					      sizeof(u32),
 					      GFP_KERNEL | __GFP_NOWARN);
@@ -260,6 +263,9 @@ static int netlbl_cipsov4_add_std(struct genl_info *info,
 						break;
 					}
 			}
+		if (doi_def->map.std->cat.local_size == 0 ||
+		    doi_def->map.std->cat.cipso_size == 0)
+			goto add_std_failure;
 		doi_def->map.std->cat.local = kcalloc(
 					      doi_def->map.std->cat.local_size,
 					      sizeof(u32),
@@ -680,10 +686,21 @@ static int netlbl_cipsov4_listall(struct sk_buff *skb,
 static int netlbl_cipsov4_remove_cb(struct netlbl_dom_map *entry, void *arg)
 {
 	struct netlbl_domhsh_walk_arg *cb_arg = arg;
+	struct netlbl_af4list *iter4;
+	struct netlbl_domaddr4_map *map4;
 
 	if (entry->def.type == NETLBL_NLTYPE_CIPSOV4 &&
 	    entry->def.cipso->doi == cb_arg->doi)
 		return netlbl_domhsh_remove_entry(entry, cb_arg->audit_info);
+	else if (entry->def.type == NETLBL_NLTYPE_ADDRSELECT) {
+		netlbl_af4list_foreach_rcu(iter4, &entry->def.addrsel->list4) {
+			map4 = netlbl_domhsh_addr4_entry(iter4);
+			if (map4->def.type == NETLBL_NLTYPE_CIPSOV4 &&
+			    map4->def.cipso->doi == cb_arg->doi)
+				return netlbl_domhsh_remove_entry(entry,
+							cb_arg->audit_info);
+		}
+	}
 
 	return 0;
 }
