Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282208;
	b=Rjj9nXxy2+McYZ0dFkh6KHAeSIhCAz/hP3oKIEMpuqVC6O4yTu64DpbeAoW/kyH8ZF8c
	 UCzhzwGo0gSH49ZwXLxR/C89GoAuFXnnO+4lXr6B//BS0mBbmcK0j/cJ6rojPy3R/B/Ph
	 twmTtJJ7x+Von6VCEY+81PR8wUzUcYZD5eXXJTUc+VdlMNAXKgs+GUae9Ilv+pM8ZLv7H
	 EeEqoDfcg91BwZ7d6kUkaGX0rPd2Ktsud8iaoKQPMuJp2ITomd0WJI70915dY1VeRqzmQ
	 RqEbRzCpk6TfxWVPKQLdkG/iDhpkcQ9tHN6NJquKqVrRy2Dsxkf0KDfjPAOFnNk0i2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282208;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Mfy+MrqgC/u6j99S6NKHJ1FXHCmP3H0+Wet2GvhRJfM=;
	b=c2w+olMiHfWPdA+npGa7fUvkeUwREWv2gyjTeddXiuP3RL8rQaigM9ospjhfJMEgUBuu
	 c9rEzN5q5NPp/pHzygBJkckVpJasYQTiHXXCcTsFBYpPFGQKbqPJqSHJk1e9kokts50Dm
	 HxqtwaChR5ctMeZprnLVKCE7tEf3Z9qiNuA2BPTgrUPODFinVoTUNGDsscLEpnhBDG04Q
	 00ukSOIbWt4pysqREnWWka0CsAYGIXKmY4C5J+fjA2QBGA4MgdUAbDytylyLZQy6Cycwq
	 f8rnmjzuN8eODJXSsaUfc+jS7EzsEiIYv7GCtKZqZXMbwyBYDieLqZo1jVuztzFKrPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039BA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8468290b866so3188999a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282207; x=1793887007;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mfy+MrqgC/u6j99S6NKHJ1FXHCmP3H0+Wet2GvhRJfM=;
        b=Vm9tY4B02HSKRilNnPtfSaj2G6rmCsHeIUNtKAbSgMO/u/y+LDfB6YMT8rbyll/MXn
         dCicKhMLnhcB5txbDksfhfWNTwcfmVRF962s0nrCS2O9kxC+oRCowktT8sYM2j/8sFwl
         5MaR95qUGjAjqwA1q+K/Kee/d4rsRlmqOKR2+7O1czpkLlr8/V85R4IbFG4P1IOyEUrQ
         ifpkx1bGyvtsDTOcfIt4+VpjLi3WgNqzqTSbGSYN7ox2It78sY9DJ6EY3RBmaYPAPI3G
         WZ9Xuj17BwfCrVN7fdZFhCMnr2KkCHhrs7/NUeYNp3s41fC4iLHBE+cAzbz0XA6uvisP
         /JKw==
X-Gm-Message-State: AFq9FYJpgmzy45ZQui9cXWU5ZpvdGFFdakbANWCLCnIBcbPOnfmgYGuh
	FNQ/2V0jD+DTfhhqM3P5tGyndkM8JrC4uuPp1roPSJ2q4+MmG2M1TXUdyxUeI0V6nKTF+iXKmH2
	l8m34+/wKJ/PJTBVGlBBAMTStejo0nPXg1TSOnXoxe6V6YLTrB6fg+8HWuyo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:151e:b0:4cb:f21c:a794 with SMTP id
 5614622812f47-563a264a092mr3594627b6e.28.1793282207089; Thu, 29 Oct 2026
 06:56:47 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:56:47 -0700
In-Reply-To: <6aa95fe1.a211d2ce.1a5198.02af.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae3509f.5f8a1920.22d248.0027.GAE@google.com>
Subject: Forwarded: #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 master
From: syzbot <syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git master
Author: omermetekaya0@gmail.com

From c6056a11b2100b30f1ea3b921055a40a48010bfb Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?=3DC3=3D96mer=3D20Mete=3D20Kaya?=3D <omermetekaya0@gmail.=
com>
Date: Wed, 28 Oct 2026 21:38:11 +0300
Subject: [PATCH] batman-adv: batch softirq drain in tt_purge to fix workque=
ue
 lockup
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
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
Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
---
 net/batman-adv/translation-table.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translatio=
n-table.c
index 68f79853032e..915f5589e056 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1386,21 +1386,29 @@ static void batadv_tt_local_purge_list(struct batad=
v_priv *bat_priv,
  *  inactive or not
  */
 static void batadv_tt_local_purge(struct batadv_priv *bat_priv,
-				  int timeout)
+				  int timeout, bool may_sleep)
 {
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_hashtable *hash =3D bat_priv->tt.local_hash;
 	struct hlist_head *head;
 	u32 i;

+	local_bh_disable();
 	for (i =3D 0; i < hash->size; i++) {
 		head =3D &hash->table[i];
 		list_lock =3D &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		batadv_tt_local_purge_list(bat_priv, head, timeout);
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
+
+		if (may_sleep && (i & 63) =3D=3D 63) {
+			local_bh_enable();
+			cond_resched();
+			local_bh_disable();
+		}
 	}
+	local_bh_enable();
 }

 /**
@@ -2363,11 +2371,12 @@ static void batadv_tt_global_purge(struct batadv_pr=
iv *bat_priv)
 	char *msg =3D NULL;
 	u32 i;

+	local_bh_disable();
 	for (i =3D 0; i < hash->size; i++) {
 		head =3D &hash->table[i];
 		list_lock =3D &hash->list_locks[i];

-		spin_lock_bh(list_lock);
+		spin_lock(list_lock);
 		hlist_for_each_entry_safe(tt_common, node_tmp, head,
 					  hash_entry) {
 			tt_global =3D container_of(tt_common,
@@ -2387,8 +2396,15 @@ static void batadv_tt_global_purge(struct batadv_pri=
v *bat_priv)

 			batadv_tt_global_entry_put(tt_global);
 		}
-		spin_unlock_bh(list_lock);
+		spin_unlock(list_lock);
+
+		if ((i & 63) =3D=3D 63) {
+			local_bh_enable();
+			cond_resched();
+			local_bh_disable();
+		}
 	}
+	local_bh_enable();
 }

 /**
@@ -3750,7 +3766,7 @@ static void batadv_tt_purge(struct work_struct *work)
 	priv_tt =3D container_of(delayed_work, struct batadv_priv_tt, work);
 	bat_priv =3D container_of(priv_tt, struct batadv_priv, tt);

-	batadv_tt_local_purge(bat_priv, BATADV_TT_LOCAL_TIMEOUT);
+	batadv_tt_local_purge(bat_priv, BATADV_TT_LOCAL_TIMEOUT, true);
 	batadv_tt_global_purge(bat_priv);
 	batadv_tt_req_purge(bat_priv);
 	batadv_tt_roam_purge(bat_priv);
@@ -4156,7 +4172,7 @@ void batadv_tt_local_resize_to_mtu(struct net_device =
*mesh_iface)
 		if (packet_size_max >=3D table_size)
 			break;

-		batadv_tt_local_purge(bat_priv, timeout);
+		batadv_tt_local_purge(bat_priv, timeout, false);
 		batadv_tt_local_purge_pending_clients(bat_priv);

 		timeout /=3D 2;
--
2.56.0

