Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709472;
	b=YoGlX6GHAv0LoBlzPhe2dDY/0ol0OuuOS/myZdlZV0HcWquSBvFPePzOZirw30O3+XIQ
	 8IeyZWKVUN4oEByr14v7WfniIDjKu/9wsb+DvMZUZzTUdLVH3BHe2u/AftIbDFiHkZNP1
	 Tv74WbWJ3Z2bbL/0xECm9NJ0KcJP+Hoy85W69fiEm8GFu1pQxVhKAwIy+mdZP+RC3UzA5
	 AxxudgW0lDLnJCrg8QgeKPgCn0b2gSMA1JbHuVJ6xMS7q6lxG4PNPZ9C5CjLXqLKW0PDO
	 cvJN1OI01vj6v+xTsYtUyybSOxxCHlTp8PLIDVf9sKwlfpxB2vAuQ+vONE/Bq30hWPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709472;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=XS+SoebOVU+W/vSgXMTHaP+VRBJ4jCtCIJZQDWqjUONtRWMyyPWZmPcmSA/L3l4B6JYD
	 YJjV1aZbbmpTOO/ajubnbAzKCxNc4JspijXXBO0tdOcqoWIq1u0kN8/ljxkg054vcOc0W
	 aY6ss4j2qWHV0aluUT+5st6bSIh7TtHuyXNnLKc4r/xthzjfGzzWq5Xmvq5PlifcyyCtf
	 Jufhg89647qP1crNUeeNAQhk2BUw4URYRs4XkZSmdM9hS+FMCGkFm8FnNFBXKRlHlLI0A
	 dHP44+MlxovpfNex2Sn2V8lFp5+p68pIKr14+v4cW2/x48m4IXLEUEBJtPuznjaOQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g+x+2rVP;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AB606EE8D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1AB606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g+x+2rVP
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-ccca948203aso1588070a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709471; x=1794314271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=hbeqqTzaGHLOsidHgAWqTbZPAer4yJhtdfwt3iZE1sIj2T3m1+fhkXcrdi+GbUVEys
         XoRWf6A4iuqaTqwQPRBg+AmmuKksk3J7fv5Ga2CLt/X1CDKYdPKz+0mgd+rFvOx+qys2
         v8jBa3YEocn4tjGoI6ZHBIeYpU2UBsqIppXUm2/0veRTXUWNjmjO9iNh7dXWxeDhCfvk
         re0oO3SEjVtZ2y58rLmbxB5o+Fg7cEQlzaRvAvg4Hgob5mD1i+06MZOEtg5ICyt7qsfO
         Nh+1iG1jom5CkjY1SIipaBC6TtbHX2VX7LEFU3xOzd5UvIc/JELZDCdIGAFWBL9DxJ//
         Dmhw==
X-Forwarded-Encrypted: i=1; AKwUvBxuY3k8/E2Z/SEQu2Mzc+2edYBzjYx9KjtfSjwPi1Nh7LttxvIVu+f+dqgxc6DsslMtsVOHkvdiYo99Ktg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nDkVLI36jJfdbPefTkg0fPYyf2kF/FJIPuJxod8hYFk2hCadw
	51wsnInn4Jw8SqtZJa2HSQ3rs7jjlyyjlLCcIJRL9rjZXG6qaPHhrBHXuKA+aEI5RVLIOt4dipU
	AMOlOsk9/u79z8vMnbPjZExLtwfpn+v+AwVHQQEoXTEDJPZFjDu9Xjt00SbotgD9xxQTh8ryGus
	Iz8pjpHp/DbDwgrXCA76UmrTrukJCdlDVMd7+DKqNlFML6RWeS9ASdCFtoXri0kSt8XNHhR+F/U
	WgaLFidu0BkhSoEEw==
X-Gm-Gg: AYBFou2IQ1leAO3+BdEi8bMP/TNxjsrlj+VVgKayD/64k69VfNlNyTIMSMI/5dT7mFi
	EJM+vojBWohJUKCkkclFTe8KvVFp0rQ15qiFAz6uFUkN/oSk6UKCQGSTFFX6mJVz2HM5UF7/XjU
	aq0nPIXyCxMnxSp0T1e9+DeHvNdkfejqdOYIZeo227dKhj73s6ZcqGPKKsMcZFUumbHnRH5ra4C
	ztvp4Cg+V8xWTmrruxsO2/DRcGpGj676nRxz7gPtLkRr+06ekcFg9tI2lEUeXS3bChSu55Lv6br
	0hNwa5HMYqnzeYqY0H59wd+cY0DKMqNUDzsR082RtlcbKJgLFADNukU7SvWeNFVGBgIREd/F5oW
	X7o/sTeeDK/kivWuhTbxqdhU9I5IBDT7XuNAxqlKrHX9LLLrI3jG7djCRiANoR1RNpsfbStSJ5O
	aR4ZJ0ohcXwlUrZnEI+KCmKKa8EhD4YIRKew==
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ae89750f64mr8620308a91.28.1793709471015;
        Tue, 03 Nov 2026 04:37:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85fc9450sm4817118a91.2.2026.11.03.04.37.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:37:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eced5a4cb9so7188195ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793709469; x=1794314269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=g+x+2rVPaheaddyKcmjoCO0G0Ol1zj2g/aORAbTIXt0UxO2LJl1aX0LSA+W+ruyGi0
         ZKuWPAGjMdpQBQYfx7xBMLXRYB0tPysXWTT5JmI3P+NgzmffTqphF2nseUzx7994ixbv
         m07rPadjOS9c/o84GP0to2rSQsW3krkTuQFBQ=
X-Forwarded-Encrypted: i=1; AKwUvBy+gOqFpNx74teqIbRkPvegPB1V4H612CcXuW3qJ4PWuICYq8YfNx9YhNHwAevFCU1TS5ZZnGzjuOX3Ujg=@vger.kernel.org
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ae89536bffmr9829362a91.6.1793709468857;
        Tue, 03 Nov 2026 04:37:48 -0800 (PST)
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ae89536bffmr9829339a91.6.1793709468373;
        Tue, 03 Nov 2026 04:37:48 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm2131567a91.13.2026.11.03.04.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:37:47 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v5 06/10] bnge: remove refcount from L2 filter
Date: Tue,  3 Nov 2026 18:06:46 +0530
Message-ID: <20261103123651.442893-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261103123651.442893-1-vikas.gupta@broadcom.com>
References: <20261103123651.442893-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A reference count was previously used under the assumption that any
context holding the last reference could delete the L2 filter.

However, going forward, the filter will only be removed by the same
context that created it, making refcount unnecessary.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 33 +++++++------------
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  2 --
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index a8bb441ebef9..6316f75ca36e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -4,6 +4,7 @@
 #include <linux/kernel.h>
 #include <linux/dma-mapping.h>
 #include <linux/jhash.h>
+#include <net/netdev_lock.h>
 
 #include "bnge.h"
 #include "bnge_netdev.h"
@@ -13,8 +14,8 @@
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
 {
-	if (!refcount_dec_and_test(&fltr->refcnt))
-		return;
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	hlist_del_rcu(&fltr->base.hlist);
 	kfree_rcu(fltr, base.rcu);
 }
@@ -31,18 +32,19 @@ static void bnge_init_l2_filter(struct bnge_net *bn,
 
 	head = &bn->l2_fltr_hash_tbl[idx];
 	hlist_add_head_rcu(&fltr->base.hlist, head);
-	refcount_set(&fltr->refcnt, 1);
 }
 
-static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
-						      struct bnge_l2_key *key,
-						      u32 idx)
+static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+						    struct bnge_l2_key *key,
+						    u32 idx)
 {
 	struct bnge_l2_filter *fltr;
 	struct hlist_head *head;
 
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+	hlist_for_each_entry(fltr, head, base.hlist) {
 		struct bnge_l2_key *l2_key = &fltr->l2_key;
 
 		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
@@ -52,20 +54,6 @@ static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
 	return NULL;
 }
 
-static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
-						    struct bnge_l2_key *key,
-						    u32 idx)
-{
-	struct bnge_l2_filter *fltr;
-
-	rcu_read_lock();
-	fltr = __bnge_lookup_l2_filter(bn, key, idx);
-	if (fltr)
-		refcount_inc(&fltr->refcnt);
-	rcu_read_unlock();
-	return fltr;
-}
-
 static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 						   struct bnge_l2_key *key,
 						   gfp_t gfp)
@@ -75,9 +63,10 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 
 	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
 	      BNGE_L2_FLTR_HASH_MASK;
+
 	fltr = bnge_lookup_l2_filter(bn, key, idx);
 	if (fltr)
-		return fltr;
+		return ERR_PTR(-EEXIST);
 
 	fltr = kzalloc_obj(*fltr, gfp);
 	if (!fltr)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index ea1acefd70b4..372657cba43c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -6,7 +6,6 @@
 
 #include <linux/types.h>
 #include <linux/if_ether.h>
-#include <linux/refcount.h>
 #include <linux/jhash.h>
 
 struct bnge_net;
@@ -49,7 +48,6 @@ struct bnge_l2_filter {
 	/* base filter must be the first member */
 	struct bnge_filter_base	base;
 	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
 };
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
-- 
2.52.0

