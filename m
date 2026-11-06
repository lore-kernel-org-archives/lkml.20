Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957768;
	b=nwjOKS320om2sSXegaBDKFg8Oi3CDmxRZOi+nP+AAR5zK/N1A2tZtC9wM5qS7/93rq+m
	 omVZ9GQntQK0nHS+nI7ATzTWdx2fFFGlz2vfokHjBE5Jg8EVBkI//npvzreWQa5lJ0T36
	 g6RlGYhtjGfGAJDdGyQslweKeiE1XK9E6dfIz1ExYhi87shbqSp3HtoKY7jpNNRjwzHQi
	 SZRI5x1l8LPFQ9ry8+iJAakyssPOwBkCMhuuFMRv+O7r00j1p9gKLbDUAP6tSzETtHUuh
	 nGp+nTvmXTQJf4R3UVI0nesVsuF6woUT7kiYMam2rZg5hGMvSPP90AmRHKO6JL2pm3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957768;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=dMuKtbvZ5JLoOd7UmvFxJVmeIVmKykUhp8Hv6M6BVjFuwUh4sWEM0vNeh9Pc2GybTCRi
	 fc/90zVXlVQ4/CoRpOOPLv2ZV3Hq9Ym/2vLJetj8NN5nNl42B1Cy3P6ijZzoL214Pg7c4
	 hvH0o0hmscmDqebON4Evxc1XXemnK6XFds3NE3ld7ngFrp0ivZ6hLJZ/joh8AFXdPDm5f
	 eDZEkaucZfJTKEQg0bRPKZgN/YznDMKhhNVP3hxsJ9VPe+1NPloLGRvzZ8V9R/AWnFy8W
	 Bw0FxATko0QOvXjmlbi85qpBol3b2HAfZWB2dxcx5ofP4EPq3trHHfCajZnZr+WLfOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bsUCLy2q;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5D6082BE0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A5D6082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bsUCLy2q
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-91e7fc8265aso6307556d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957767; x=1794562567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=2SwPs9A96pjoNYhRezZXgk+OEFd76J16UnOXE2Uc4v/FdrflpNMCn6J8Pd7+Y/hiBU
         DF3q68jvW9EQ57GDUvemIC8TVSkG6J+qUAwjcEL47LuNAd53vXHWTQeB9BmXG7hd997Z
         mqzP4b36EcYi6LtXqX0dAb55L1+da+h7rMo0hJBpp/hbLIjQ9rRtTx8QrDcIMfPzDw1+
         /bVxBMMBLEA0fuOVG9WI2JiafMl1c6ot05fdainedTl8so+D3wxwqb746TxfAjyO8M5x
         DiMFFvfcYW0VAU5HdXrOMb1omz97txBvuJ6r3OhWzt5KPpAMwbuCMjrrh7qJMWgMPYS2
         MIrQ==
X-Forwarded-Encrypted: i=1; AL+hErG2GTzzlltHvQNCDqg9TJNkGyXg+Xx/sXkLLOlEB1A2ut/Fh4EPiNyEgrsKmIJW20hByQM4G+aF/5C8Fl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j8mdiiiq9ZJf8kvEpBX77IX+b/O+4uYEbK3HYQ7fOCG+a8ZdD
	y66YVLIF3v+39R97NpJR46THVp68TYdbDyc2gZfaErBMLSHCgbwjEjgi1bN8WCoN2P/pKG36cDl
	qSCjSmk1vOiuwJmk93wbDjELvA/0YM6iS26SdnyNNJsN3qvA7cAvrHiqlzvwLGvsJYrFo1Qisw/
	mqsaMALS2HPHb19Qzfa/CmmQgcPv/CiKFEzZvG+zRJdkN/ezQRXTgWmGZn67Y7cTH+bND2VRRHf
	o7ymUDbWXd4ysMOQg==
X-Gm-Gg: AYBFou3tUn5yms16vL8OFcOUjCmvfj/Z90w1alHfjLwticQsiWrLQ408h7EGZQTpscK
	6LPBbYCNqr/ZOUdpEK2MFiOMeU6ZJGO/frNXp3nVRzGEzB8SgSmYC7domQliSCdrvkkGC1P+ZYl
	9RmvBlIWNtAsHgnbQrK3GqFgg50DH11JgI/Ra+vc4xEaxC2FILKCTlm9d+c0cjc3vRn9OLgETxW
	5q1Oovah1H90mZohsPJExdKoKlkOvben//Slygxlxw8DPjz0d9LDOp6PYLb145gHDGLQ5qWDmiN
	4TPdBaSuio1WJLAqQ2lUK3lMI8D7cIMw6ZKSZ/r0gWutf5qwFpTkzxNYv7htSn3An9quQyhThWX
	TEj8rrhIDyViglF8TPAhToM0CjaSujGRbGugOT/fyIWFLsuFCFaKEbZXluHe+0ppCYSr2s5Ce2O
	cdHySB/eNOpgXaiph8WQN8eFXlsRzchKOzXA==
X-Received: by 2002:a05:6214:590d:b0:91b:b26a:9791 with SMTP id 6a1803df08f44-91ea9889334mr27237316d6.56.1793957767503;
        Fri, 06 Nov 2026 01:36:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91ea69ff532sm297316d6.43.2026.11.06.01.36.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:36:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so756548eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793957766; x=1794562566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=bsUCLy2qmD/k0R0cLX2xaoIbsGXQBefIwY+NP9PXtgtAvhnK+3szIWhsqZykoncrEi
         Ot7ew9dcGvzxKVvCtvf/byDkHwEiDr5XkEauR9pS4TP2VJ4NZxnh/ZU2CEjyQnSA0XO6
         IKeyr8IDyUymMRQLb0gzELls80PffirYFJl/E=
X-Forwarded-Encrypted: i=1; AKwUvBwQ061mnax0zfAjrSynMv7NZ5J71WUBuXV81hkeOVmf3YPwhUgyAEvhXgDvHLCWcUHrlUItVUTHZ9r8JRI=@vger.kernel.org
X-Received: by 2002:a05:7301:d813:b0:369:fe81:a575 with SMTP id 5a478bee46e88-36f772fa7e5mr2669863eec.35.1793957766026;
        Fri, 06 Nov 2026 01:36:06 -0800 (PST)
X-Received: by 2002:a05:7301:d813:b0:369:fe81:a575 with SMTP id 5a478bee46e88-36f772fa7e5mr2669820eec.35.1793957765360;
        Fri, 06 Nov 2026 01:36:05 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm6447726eec.19.2026.11.06.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:36:05 -0800 (PST)
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
Subject: [PATCH net-next v6 06/10] bnge: remove refcount from L2 filter
Date: Fri,  6 Nov 2026 15:05:20 +0530
Message-ID: <20261106093524.838341-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106093524.838341-1-vikas.gupta@broadcom.com>
References: <20261106093524.838341-1-vikas.gupta@broadcom.com>
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

