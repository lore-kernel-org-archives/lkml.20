Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793318561;
	b=1j0LuQJJQ6E/HfZhAYImpHAGAWtR77Q+DmPksr8sFLMoJygSs0XS0Z0I65woFS6Fw4N2
	 +2KhuU9DpKlLr+jLbeBsY1Ku0EK7plwd+4i2154WmxtDhB9GBiUFLlKm7Ahe9955qi8Gs
	 QKjvNFgdTT/7Tfpt2vYqvTDBRBmkcu+IbgEJUs9jrJOl3Xuhxx6/4cdSU0IFc5XgQJoYp
	 C+FnZ/m4L88uyuGMtCx/7YrGu62ILp/2itiwejCVtOjQxpRsYkMsQf+QdyshjWmpkuc21
	 syMFXkJ796sOiyCoOJylmKtOg9UKwU2Smkt/lJHds8jqE3j/BvZvLIuHPe+KGN5QYqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BPyNGElEliISk57S6blDx0U3B+pcSFCYiKtsa38E+sg=;
	b=rL3i42MWV94Csy3pQKMa3aK0XOs5NTQ582k0EbPzXroHoEzrD+mGVvrgdUjRqStV//Mp
	 VVdDnYJYw7ZN9VR88uqyevq1tfu3l/IcW8G8EkBEX+ya6bBNovAmFoSvKJ3hC22gzYDeZ
	 bap60L3XCkRTyh15BvpIxnU/3ebTpcW2pvDvjNj4ftcb3ubAg9CUmD/Kwd0IiixcnXSQP
	 JVucYUmHvHklqwnLYGPqXXAVpvDbW0rdCgehv37DpyiSqSvYAoOIabWiUmNDabGwhpq3L
	 UwKAprDzX0u2tXestGvpL7NpftuS40QzhtN2xwV+trZH3LiSxVAedGcfnHzyX9/nFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaKsK4fS;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 630CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaKsK4fS
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so86994f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793318560; x=1793923360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPyNGElEliISk57S6blDx0U3B+pcSFCYiKtsa38E+sg=;
        b=UaKsK4fSLtRnSxdtQfvYUQKukCZu8sg4K7By1Ygyx0vbJWQ9/P6GeyopsKfexAzgny
         CTcS9QqkZsz2h6U6psU6dFmL3VVfbIERpQ9S265XF2OYeZ03GpiloJzRvxNWVNiH4r7d
         6n3OdzP/313dNtHsngfYMhRvzeny0VYkraSlepLgM1Qi9R+bavfoQNxRtqqYVht12mfM
         1WYjZl/IVaQwljd7WeErJI0JPUQWTIaN79SoO1fF+vDfMrpyd0NlSXdYdgG1x2iaF9NL
         YmiaZJGWhzva20U1t+Et3GEHPLxGx9ZieEERiMJFgB96kpXa1Sh0uBKytLZMajKE7BvU
         9tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793318560; x=1793923360;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPyNGElEliISk57S6blDx0U3B+pcSFCYiKtsa38E+sg=;
        b=fxk4NSIlRI5VPxTlVpIKlCrQGFytaQRLw2D9nlYrS8jYZQj7j2J9GqbrV2NoY7Aooz
         xoTC5FNzjF660enbDzo9XG8+hu1eAhAt8/7AMv7kXCxRsqtSpCbaZUkXPOqXeSw+fz5a
         zfFQUKeRzbUgP+0XvFJvjEsVUYJt+2hPrjJCSxRyOJQ2zJsmt6gC/klQNV6+GfrVkE0+
         ikFlMP0ZNQTjYH5jHuq7YLFEmzOokwimvw7zAg+WwvnHREULF1AsmrxaHbc6cAgWOlkt
         1Eet0MgZcTgg4wYhtz48h+AeDhQ5ZNz9B64BHoRgvbdpj6lm2egNFpZ1yHL2md5DQZeH
         L7zQ==
X-Forwarded-Encrypted: i=1; AKwUvBw96ODgNsdzcundVN4teLCGgy2Xp7/P9fEdpzCQLHO0DGhJ3/scjX7HJesVprDjYhilSMJkRAhp+gztmaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4rqI2uFbn5xM5g4+uGCN0gRvyJP1B20pZiouXhssbzFqZVrqn
	dfP1M3B01jUGXFTW1/N+yPsJdNwvcVba5OyD1/fKJ/pEQJ7mUe5MrWIChPWf8o36EVk=
X-Gm-Gg: AYBFou2aVlCnceMNE4rmieFA4Kk9K+R8Kw23ufp+l5Y8igjirpCpb1SmAio1LxajORz
	pBJNW2bQPCR1sJWyDtgZL+NVT23MXuElhJguXaRYxXfa04km/jD5ix7IwQWPB9nPpdBt0cEkUK2
	JoNSLb27I4B0Msuo/1LFsQiNIFFLXq1zYT+1ZUbu+CpxFEZXwixWCplie684Cvi38pwvq5d8XsN
	hPG5ml+Wzc0Ekt7vMlAMbZysBbgneCHf8UP9ilYDD+YWf54VrHxM5u4ORs4scM/FPgnfuppQyQN
	4gQWByCHQd1uc5PA+bK7sppXKu+BcK3/s3bzonFkGVB2a/rPkpYoqf3o63uXmoE5jZOHpVejYPP
	54kL9YxxuDM/ZY7mBzZnmU9tjFQvY8FTAN9N48pbacFvbUhcdRWWIqg3jsvg4F2zp8UhiI3AXS+
	hLP9Fw0lTvBL8DXc7SirxQLNfqvLF9CXvr8Ck3Vv+n7UxMgDVg8PQTJQwTXhYL5FlIHzMK5pQ9s
	S4RmNCuvxPbV10uIj0VCji/nsZqX/dGhVM8FExKzuLTkPxMI1fIkWw1oIZ9AoUlNRtIWbjt4cJS
	UdYQ+RzsXcAfE/egVKFYScscbAQ/
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr2140228f8f.31.1793318559503;
        Thu, 29 Oct 2026 17:02:39 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e712cc231sm419592f8f.35.2026.10.29.17.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:02:39 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: marek.lindner@mailbox.org,
	sw@simonwunderlich.de,
	antonio@mandelbit.com,
	sven@narfation.org
Cc: davem@davemloft.net,
	b.a.t.m.a.n@lists.open-mesh.org,
	linux-kernel@vger.kernel.org,
	syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] batman-adv: reduce softirq drain in tt_purge loops
Date: Fri, 30 Oct 2026 02:59:51 +0300
Message-ID: <20261030000222.286935-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace per-bucket spin_lock_bh()/spin_unlock_bh() with outer
local_bh_disable()/enable() and periodic drain every 64 buckets
to avoid excessive softirq processing during TT purge.

Add may_sleep parameter to batadv_tt_local_purge() since it is
called both from workqueue context (where cond_resched is safe)
and under commit_lock spinlock in batadv_tt_local_resize_to_mtu()
(where sleeping is not allowed).

Fixes: c6c8fea29769 ("net: Add batman-adv meshing protocol")
Reported-by: syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=61b202fdc410840f0198
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/batman-adv/translation-table.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 68f79853032e..915f5589e056 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1386,21 +1386,29 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
  *  inactive or not
  */
 static void batadv_tt_local_purge(struct batadv_priv *bat_priv,
-				  int timeout)
+				  int timeout, bool may_sleep)
 {
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
 	struct hlist_head *head;
 	u32 i;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		batadv_tt_local_purge_list(bat_priv, head, timeout);
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
+
+		if (may_sleep && (i & 63) == 63) {
+			local_bh_enable();
+			cond_resched();
+			local_bh_disable();
+		}
 	}
+	local_bh_enable();
 }

 /**
@@ -2363,11 +2371,12 @@ static void batadv_tt_global_purge(struct batadv_priv *bat_priv)
 	char *msg = NULL;
 	u32 i;

+	local_bh_disable();
 	for (i = 0; i < hash->size; i++) {
 		head = &hash->table[i];
 		list_lock = &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		hlist_for_each_entry_safe(tt_common, node_tmp, head,
 					  hash_entry) {
 			tt_global = container_of(tt_common,
@@ -2387,8 +2396,15 @@ static void batadv_tt_global_purge(struct batadv_priv *bat_priv)

 			batadv_tt_global_entry_put(tt_global);
 		}
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
+
+		if ((i & 63) == 63) {
+			local_bh_enable();
+			cond_resched();
+			local_bh_disable();
+		}
 	}
+	local_bh_enable();
 }

 /**
@@ -3750,7 +3766,7 @@ static void batadv_tt_purge(struct work_struct *work)
 	priv_tt = container_of(delayed_work, struct batadv_priv_tt, work);
 	bat_priv = container_of(priv_tt, struct batadv_priv, tt);

-	batadv_tt_local_purge(bat_priv, BATADV_TT_LOCAL_TIMEOUT);
+	batadv_tt_local_purge(bat_priv, BATADV_TT_LOCAL_TIMEOUT, true);
 	batadv_tt_global_purge(bat_priv);
 	batadv_tt_req_purge(bat_priv);
 	batadv_tt_roam_purge(bat_priv);
@@ -4156,7 +4172,7 @@ void batadv_tt_local_resize_to_mtu(struct net_device *mesh_iface)
 		if (packet_size_max >= table_size)
 			break;

-		batadv_tt_local_purge(bat_priv, timeout);
+		batadv_tt_local_purge(bat_priv, timeout, false);
 		batadv_tt_local_purge_pending_clients(bat_priv);

 		timeout /= 2;
--
2.56.0

