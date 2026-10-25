Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897514;
	b=HVD0AD1styH7vNdr/OgEnBwKOo9JrlupGP6H0iHsggeg7juywnOhAUmGqZCgHO7PS99e
	 ab89RnkCPO7t23jQnq6GU8ZkpZefwxPobWkXmfwcVFvaV6ePUt+VQBCWE6AErkB1Sn7Q/
	 C6MyGgWx8ltWTUJ1DsTCsClOZCtgWFcMXcmlHXcpR5YLL1HZUuxSeaBGWa3h5UO35TH/b
	 yrpIY7iJ1CeqeNjsaZQzjcmdQfA9RlYSKAB83LdR5OiQz0T5AOQ7r5Zhtvuu80Dt4FCYF
	 VYKSrjnJJz+V4nPklYYCyjmCNQZvxva83hqqmqv6Gete1V8+F7Y1U8vSGNFw6h3Zd8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p/QFAv6ccqVlvHGU85S9cnOjWRRSIovz0rOvr/3uAkE=;
	b=iYd6c1I7+YjXfX33kSD6Ik17wwuzD5ThBsF6a44gKQM7vaQZ5EILKSLchJYVfGwgyMqF
	 9MVO+jAauNZyjuFJpgBRTwHFveSWlkbTcwa3ZPkq0i+eJa63zxpsYITaD+Yb4egm1iFxd
	 1djZxSEfOXWnHIWNyDeIHb+wkmr9R090uhx4eNiynVghmXqXupcTixKaJScKgU3JHkw2Y
	 n9F8k4b0eokR2fpUpqVSIcmJvreK9IDqL0FPViUO82SBm7CkD+l0S7AEeStC3BDwrcJCD
	 qLYUDUw2U5zxtMHeAXwEHsV0HM6Y0IQlDlywafifbf2ECSj0rls+jcNfmvtjhFgkSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqCTg83i;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC9606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DAC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqCTg83i
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc365db987so1458722137.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897513; x=1793502313; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/QFAv6ccqVlvHGU85S9cnOjWRRSIovz0rOvr/3uAkE=;
        b=KqCTg83iJu3JeWaIUmuu4tNCoRuFCECQdIaPpOukXLXn8f70pV7vn8R/FHqf4QYtwg
         YO4qyLCv+q1ulTz8DCGGojOYzTgg1AUFz7UvrK+RIm9I8WYUWpBOXzKz8uYEldwbsnut
         jjVx09MfH0yemePwkXKhmfoC50KVRZFWOBZQxqkTkvH4UdpaEqmM8KJj6JxHFrcFJtr4
         cV/up9zmiEPgOk3MjTXa4m3aEIFTfEWg44bULE+g+2CBzUO3WaAVxgy1atfs2XJMgeYF
         v9ZatU3m8/1OfzfVFzf8h8ctJWA8Bg4S5gkIx0oOFJ3iTelqVyDejIwEuc7rQkingxbU
         lKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897513; x=1793502313;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/QFAv6ccqVlvHGU85S9cnOjWRRSIovz0rOvr/3uAkE=;
        b=ELqV+2rMRb+/hc8hrfJRwtTo+1W+AfKxhry/Mz3mPNnLpc3bmvUtgPcs65RPxPfhmi
         HwMxooLPOgDuuCMSGrMFY6deNEXFP+pMFWEGJDu13RVvJnXzdkX4UQytfIqwQLD5uwH2
         VCGSOnsOBYpccR+msykHfCfyaNhuX8+eRV8CSyg/JkjUdnhP6FEG9f9P0oq9Wjg3s+5z
         kDgz3uOQqoav7EejQg/7iuodXpcQyLiL9twGY9g5bCNBiKjalc93WzGfzyaLHIdFanTO
         68Wq53v9AfW/j/7+dqMf01TkMvoWENw19dCfEuP5wuQR50sZnKWIVKznKsaTWkK81KHw
         Yb4g==
X-Forwarded-Encrypted: i=1; AKwUvBzJHitHC8jok+xsYuSY6kF8daGR01sgXPSR2/XKabvY6d8oN8gMHLa6H2lPX64pyCtUVg+fCjFqMF4+wsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiYael98VafiHSkU8l5o9ORIY9p1SPyZQbskBXgjrANAgjMQiq
	IExEOqHBVWtlfG1Uibt8ozl2kq7uSnX4UK/KbBGcJJ0vBk5iCQoxzuPG
X-Gm-Gg: AYBFou2ISk/sujj/COdd8wCvDsf7R0/uIWS2BAQ2chGkKoP0gkBG/DkAKYic92QVIYY
	QQwdBMg+/luYR7UM7xUz2WBmxhjr2Ar44/4k74vgalLiE/MzkvB+YL8ZBPlkXPp4uzHgUnKDhxA
	RiLU8kI9qqNIFi+Jw2O9JaO/0W632QBBu5n9cX0VSe6VHBUoUsnlAMsR0JT4hJW/+/on7Os8tRF
	kdCPczPZMgEl3QbP6pT2KAztROtwOdCUaRWlgyXJNx7FT7j+rAW5+klfKZdulzgGt5L8lElBoNe
	v3Sd2w93pDZqfBlnhm9sACmyaCQPPDhGSnzas495oHM2wEOANf7T7lzf3NrIs19BsDM/MUpy6dc
	Hi+JjpB3H2tIZToe3bnqPGhQYHCpZWNIaVRkWvsaMK2tBoBCosjG+gdlo5MyRVTAr4ueWkZ9xkv
	zzE7H9KzQ0EVNS9Zo8wXiy9/7mEkocCCNwXlUod0OjgQBeMpFsIHorTjBNrfwe4zZ0zHtKeP3vM
	/6h7uuKmZMRqw4TDZ64N+qXbcOPW/dcmkhd3B6fW80qmW+HRuQoUCrpUvykNpu5rc7kTEaiu9tH
	r24MLYW+ywsSzqk+pWB/xj4mzAzYrCwB8GxHuJmO6f0K5hpf/lU=
X-Received: by 2002:a05:6102:3e8f:b0:7c3:1395:a090 with SMTP id ada2fe7eead31-7ce5cca8d37mr1117124137.6.1792897513242;
        Sat, 24 Oct 2026 20:05:13 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2804:7f0:b101:277b:8118:1af6:d493:fe05])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e80701bsm4189123241.11.2026.10.24.20.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:05:12 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: protect the mesh RMC with a lock
Date: Sun, 25 Oct 2026 00:05:08 -0300
Message-ID: <179289750857.55325.15619359041208016782@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

mesh_rmc_check() looks up, unlinks/frees and inserts rmc_entry objects
in the per-interface recent multicast cache without any locking.

Until mesh fast-rx support was added it was only called from the rx
handlers, which run under local->rx_path_lock.  Since then,
ieee80211_invoke_fast_rx() also calls ieee80211_rx_mesh_data() (for
plain frames and for each A-MSDU subframe), and that path does not take
rx_path_lock.  Fast-rx is meant to run in parallel on several CPUs for
drivers that set RX_FLAG_DUP_VALIDATED and USES_RSS, such as ath11k and
ath12k, which also support mesh.  Fast-rx is enabled for authorized
mesh peers as long as the driver does reordering itself and no
unsupported cipher is in use.

A frame reaches mesh_rmc_check() on the fast path when addr1 is our
address and the mesh DA (addr3, or the subframe DA in an A-MSDU) is a
group address.  With two such frames being processed on different CPUs
(or one there and one in the locked slow path) whose sequence numbers
map to the same bucket, both can walk and modify the same hlist at
the same time, and both can unlink and free the same expired or
oldest entry, corrupting the list and double freeing into rm_cache.
The sequence number, and so the bucket, is chosen by the sender.

Add a spinlock to struct mesh_rmc and hold it across the lookup and
the insertion.

Fixes: 3468e1e0c639 ("wifi: mac80211: add mesh fast-rx support")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Found by code inspection, compile-tested only (W=1 with
CONFIG_MAC80211_MESH=y).  I have not hit the race: it needs a driver
that delivers rx in parallel (ath11k/ath12k with several REO rings),
and I don't have that hardware.  mac80211_hwsim does not do parallel rx.

 net/mac80211/mesh.c | 16 ++++++++++++----
 net/mac80211/mesh.h |  2 ++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 8f88141253..e3718a2252 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -184,6 +184,7 @@ int mesh_rmc_init(struct ieee80211_sub_if_data *sdata)
 	if (!sdata->u.mesh.rmc)
 		return -ENOMEM;
 	sdata->u.mesh.rmc->idx_mask = RMC_BUCKETS - 1;
+	spin_lock_init(&sdata->u.mesh.rmc->lock);
 	for (i = 0; i < RMC_BUCKETS; i++)
 		INIT_HLIST_HEAD(&sdata->u.mesh.rmc->bucket[i]);
 	return 0;
@@ -229,6 +230,7 @@ int mesh_rmc_check(struct ieee80211_sub_if_data *sdata,
 	struct mesh_rmc *rmc = sdata->u.mesh.rmc;
 	u32 seqnum = 0;
 	int entries = 0;
+	int ret = 0;
 	u8 idx;
 	struct rmc_entry *p;
 	struct hlist_node *n;
@@ -239,6 +241,8 @@ int mesh_rmc_check(struct ieee80211_sub_if_data *sdata,
 	/* Don't care about endianness since only match matters */
 	memcpy(&seqnum, &mesh_hdr->seqnum, sizeof(mesh_hdr->seqnum));
 	idx = le32_to_cpu(mesh_hdr->seqnum) & rmc->idx_mask;
+
+	spin_lock_bh(&rmc->lock);
 	hlist_for_each_entry_safe(p, n, &rmc->bucket[idx], list) {
 		++entries;
 		if (time_after(jiffies, p->exp_time) ||
@@ -246,19 +250,23 @@ int mesh_rmc_check(struct ieee80211_sub_if_data *sdata,
 			hlist_del(&p->list);
 			kmem_cache_free(rm_cache, p);
 			--entries;
-		} else if ((seqnum == p->seqnum) && ether_addr_equal(sa, p->sa))
-			return -1;
+		} else if ((seqnum == p->seqnum) && ether_addr_equal(sa, p->sa)) {
+			ret = -1;
+			goto out;
+		}
 	}
 
 	p = kmem_cache_alloc(rm_cache, GFP_ATOMIC);
 	if (!p)
-		return 0;
+		goto out;
 
 	p->seqnum = seqnum;
 	p->exp_time = jiffies + RMC_TIMEOUT;
 	memcpy(p->sa, sa, ETH_ALEN);
 	hlist_add_head(&p->list, &rmc->bucket[idx]);
-	return 0;
+out:
+	spin_unlock_bh(&rmc->lock);
+	return ret;
 }
 
 int mesh_add_meshconf_ie(struct ieee80211_sub_if_data *sdata,
diff --git a/net/mac80211/mesh.h b/net/mac80211/mesh.h
index 3f9664e4e0..27f12ebc28 100644
--- a/net/mac80211/mesh.h
+++ b/net/mac80211/mesh.h
@@ -216,6 +216,8 @@ struct rmc_entry {
 struct mesh_rmc {
 	struct hlist_head bucket[RMC_BUCKETS];
 	u32 idx_mask;
+	/* protects bucket[], fast-rx can run on several CPUs */
+	spinlock_t lock;
 };
 
 #define IEEE80211_MESH_HOUSEKEEPING_INTERVAL (60 * HZ)
