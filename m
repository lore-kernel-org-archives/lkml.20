Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0AE35F5ED
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443571; cv=none; b=GnF2o//H8f+/jB7JAwEFZH/keOPNEYjkm7Ua0jGIMZllGnDZ8XfYPr10SNourvx71rpyUbLhdDW29R5hJbUhY/uOKXRxWPF/HFxIY3OPBTttuY/mLkKJHGn2pncgyHMzI6qTGetPFtJDV24KEs3hpn0IwvPm3FKnPh4GnL5vO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443571; c=relaxed/simple;
	bh=YrOLbTb4WC11G1oCe3DzqAF0PEabQll1BC8UXZrUNds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPK6LuZkOhpIyZvc0RqntIE5kmCqQa+PZ9sPW4KXZTARZ6VZ4seGmZ72RKyegw86H+z3pFfSzzD4F9StMeXm0cdbk/4QBSau2qkG3KSt7N9OPmS8AOLsBoYkhLvIaqpoPLOa/twDhP5CumjfLjPon3vsF5j35EQlJRcFOdW92qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erOvpFhA; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erOvpFhA"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-334f6631916so213616eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443568; x=1791048368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhocdDFq9DeA/HG//FXJunjEWK5CDGAQOC1NTDBHIkU=;
        b=erOvpFhAUyDL+m+/cdpbdJtVZtvKXnwSbCc2Mz6GJOUvZwNsTdmLgBW6CCi7XyCL+3
         xee9+YxHld3IiPmFmMdELSZ2jiO/WbhuCcYsvlSLkBChSe4fTU1QXmxSCc0r8iLPuV6t
         CiwZnxZ2DfX8en9kTxrr7vFLOpBsax6kyduBQoXGs3BYkq6A9povu8Sad12+qgoXgLaf
         WNWNC0B89gVyGlegJsO/+PxZqeGchSPkmmkYY9UDf7lSq1Eb/kPuvP/YE7s3d1wynJHa
         dy59pm4GBynBEkBqx/LYmBYo3B51JWNhDVAHbhyO12qOLRltJDPX1RBMS6Vt/RviImEw
         5B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443568; x=1791048368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhocdDFq9DeA/HG//FXJunjEWK5CDGAQOC1NTDBHIkU=;
        b=mnYSIz+I1laySipgSqey6q4wMs+R92TqcssUMymGA49PQKe3DWC1kxjdylHU5Oh5XK
         +pTJ4UxNP6CZYgk3K68Iq3CO8jYxZEIwBQLTbG32ol9IzxPFGJQmpl5sry8RV4HHmzAv
         UPV/YsLv5qtI/U3+2RPXqduwIiG+Bo4w++nwj1vaWYEMfdd46qsu5Gyn7tl6GrPY+GTU
         lBakWZpCqFHQBAG/yG/sU3HaNOrUBOxXDrXs5QfAp5Vwp7r+OrtUOwIxPQjX0U+l+iGG
         q5tGMZnqqXKVSxTg4SqCUR9M7DHBoYsiOKngmTllFIPz7uw8QjlUxvcz5VhpbArKouaQ
         QEBw==
X-Forwarded-Encrypted: i=1; AKwUvBxuuZGh8sU6z/JQvtQ/BonI7PBGtRsnCFje1mLDuDJekL26FqInI/O2LOqz/GsD39/W3zahaQUaYdfU13U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVYM4ssmE1wAHUfKx8q5PU/nmli+MJ4HXMHbWN6xM8Sc68AsTy
	v0Ob9cOAhk3xKvWwksVpDp+fHldzts7w2hWDMf6foGIwMLK2oEdpL/yhTeZdXG//gKOPhA==
X-Gm-Gg: AYBFou21GGwsEQAh7k593zg0JkRi+djPd4Dvd7ErribJU9ycSHMt/RV5rZrx31xiDY8
	Jfgv3jOZyAGnRag3f4qxe71nPkTNvRqzi8BkbkTV90DTqtToeH6e3tfhajcsOBNquMrHg97O7Sq
	BZUSyGM6exn12tP4pYsGIM9kGuk4O2DfGdDKbw47kENO3O7+HeTp8yVB5cEqNd3bHeHx649VGdQ
	lXwFZAwS1/CAIkaCsE/xjbt22HtrHISWdWK/kl7wojcL/xvCOG+iQE3ZbmdB5RVSIEHlWkeS7DL
	9JlrkOlurVr+/MgnLcVAMc0SRKDK08trh1+N+MS4qntj/WQoKwOngc02Ik0FCZ75qxBjqfWDTzb
	ZTQkNUqC4wquALe/QOg4DN0WgQBnr407YIIQWqfSBe3TUJgc8QCju1ylGOi6orxrvl5L0KzcbdQ
	TInUtMWPMfX5ejhDcjmEZmGvMKnSN38065C24TmXImpI9CNsHXXZj6gypdNviS2dWCHBSYf9nIU
	eSpk3lxw5FHkSfRU1qE/GhJjtqqIv0jwqyVo3gXXREVZIw+QGZnHmAyJCgTa4DMbol7u0c=
X-Received: by 2002:a05:7300:de0b:b0:341:f4d6:d9a5 with SMTP id 5a478bee46e88-3427169be76mr5652722eec.1.1790443567319;
        Sat, 26 Sep 2026 10:26:07 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm16943267eec.25.2026.09.26.10.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:26:06 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marek Lindner <marek.lindner@mailbox.org>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <antonio@mandelbit.com>,
	Sven Eckelmann <sven@narfation.org>
Cc: b.a.t.m.a.n@lists.open-mesh.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] batman-adv: Close OGM aggregation before transmission
Date: Sun, 27 Sep 2026 01:26:00 +0800
Message-ID: <20260926172600.2394088-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OGM send worker leaves its forwarding packet on forw_bat_list until
after batadv_iv_ogm_emit() returns. Aggregation holds forw_bat_list_lock,
but emission reads and clones the packet without that lock.

CPU 0 can therefore start emitting a queued packet while CPU 1 takes the
list lock, finds the same packet and appends another OGM. The sender can
observe the new packet length before the corresponding direct-link flag
is set, or clone the skb while its length and payload are being updated.
This can transmit an OGM with incorrect flags or inconsistent data.

KCSAN reported:

  BUG: KCSAN: data-race in batadv_iv_ogm_queue_add / batadv_iv_send_outstanding_bat_ogm_packet
  write to 0xffff888100fedcf8 of 2 bytes by interrupt on cpu 1:
  read to 0xffff888100fedcf8 of 2 bytes by task 70 on cpu 2:
  value changed: 0x00c0 -> 0x00d8

Set num_packets to BATADV_MAX_AGGREGATION_PACKETS under the list lock
before emission. This waits for any ongoing append and makes the existing
aggregation limit check reject further appends before inspecting mutable
OGM flags. Emission walks packet_len rather than num_packets, so the
queued contents are still sent normally. Keep the packet on the list so
interface purging can still wait for the worker and retain its existing
ownership of the packet when freeing it.

Backports before Linux 6.15 need count-handling adaptation.

Fixes: 9b4aec647a92 ("batman-adv: fix rare race conditions on interface removal")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/batman-adv/bat_iv_ogm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 53fbdbbe8f4f..59847299a123 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1909,6 +1909,10 @@ static void batadv_iv_send_outstanding_bat_ogm_packet(struct work_struct *work)
 		goto out;
 	}
 
+	spin_lock_bh(&bat_priv->forw_bat_list_lock);
+	forw_packet->num_packets = BATADV_MAX_AGGREGATION_PACKETS;
+	spin_unlock_bh(&bat_priv->forw_bat_list_lock);
+
 	batadv_iv_ogm_emit(forw_packet);
 
 	/* we have to have at least one packet in the queue to determine the

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0
