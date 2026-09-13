Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345F3B9601
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301962; cv=none; b=sJ0FmokkafRtqFgZUijkewI2zHZc29opeY4HslIC3LAyf0wZagk89mWxJ3SXm/BcYrB7AwaY4bhEs/JvBZANLKDh0eWUqqTaR1IqVbiHMUUdhjYXUC1CJgOnhgd+1NrLx2KE9kQN3II2G2JItrmbb6HqvGM+jaYtWenXVmVIthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301962; c=relaxed/simple;
	bh=sSR6Vyh+nxnd03+vCWI09lOpb+G3BwthTFIyLv/Q4I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pkyl2uxGkhGQnmjstlMnTJbM4hc7GwKJlNsPju64MOVkZ8S5iqkDngYoNnTeJWCVqGCcoc7eUzjKX3E1scRCxmH7AVyx691bVuSpLLhW/JTtdBmHOu6o8xbIMPp9wrLVKFejcb78qhq+xRNFdvqFWhCDVowovoqmQY26SYfgqnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=NSdPyPUK; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="NSdPyPUK"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa7so145903785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789301958; x=1789906758; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+GpzslklB0pVWyYTdVsp+3/DknIsG3Ufx16e03zY+aY=;
        b=NSdPyPUKljlU9eTHcdDTTj0/jlEXjXVZvY+QkJ1OaWOzDZaP2n8b8Ip353am+hdSoj
         nl/pAI1nGw5yaLJeRPM/i6R5iaVg92Vt0t3iDJEIYiL7PAnmNDRKkz0yuQUFHsAagm73
         1PXGbFwrpTQWCopGXAzH0l/R1vjRlg9f68iQRDZ9EN7/7PJyxCCdK/6CvQg2bS62LF0V
         kEWuU99lo4jVwlgzKt00bKBfNuQtOetOZrCSvqOjGxUXiOAr5l18b92/G/DElVO/4qDX
         Njo8/q/AKvn6OVmVm6EAzNMU43LIa3eiTMGwKQZs2mMB/G/gS4XEjx7NWuytVf0bsE/M
         cSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301958; x=1789906758;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+GpzslklB0pVWyYTdVsp+3/DknIsG3Ufx16e03zY+aY=;
        b=nJmtwrogyh89XWYahR8CbM/mpqryGKOPEq2Ae8Hhq6frGQrE16/700TM7/6Q/MvfcN
         3+1IPgyol/FSLf56y5UzSV076OCuOO0Qf+yI8CIFBkwVAOM8ESZvscS+hdzmFEJrWbjL
         fMPoBYbmuX14J9WHiY5B/dgxaX56cdA2t5FikuWPfK2CVBVW+1UyeaiiGxQH9Sxn+nwN
         NjQ+lMiyQD1aRRYO2w8cAWEvukzrQiZZHMMG/EVI1gdj6M+HqMeNHGZAlFqTaGn0rhtT
         EJkAfIwN08/7O2MvHNgaKnHR6EE0gUCpaNxbLvBVhb67Y4PqEmQopXW58/5HAFU8jWfH
         CB2g==
X-Forwarded-Encrypted: i=1; AKwUvBwvSKHGbA7mWe77jyPOzq22t0YqzCKaqh2pbm9VPNcPDEnq7AfUavI3wEazPBxQN3ViKscCNP8b6CU5fD4=@vger.kernel.org
X-Gm-Message-State: AFuF++mEx2lU+eREi4Qoe3jwpL68X6lJ2VHmS/uB2j9lH57DTRQcfbiG
	IMXc6IthvYfx6gLRfE2ej1+0XZ80VNOQjAqA2ldXWIT5m7rjk26Bsv6dQB1Scx89fdY=
X-Gm-Gg: AYBFou1TkQ544rXH2jRoseswGtPBrbsgRXFSBffvYQPVFhMD4ORrIfmtHMiRbDNrfWb
	beTR29Flv8e61pKfNSKtGdX6E5TYhYZSd4dbpAmHeHKOvmCrnmP3LCHTvHVF2Wy1xa9m57DIqhc
	KSVHKd6/e+5JHRW6ftD00ZHD+qnzg7IeZdtL5epv9VqRAiHqftHFoq76mqeL+SMLMhaqz2wTPka
	de0bDeHnxDg4w/L5oYu/LoITuLJdEankvNV3O0fMsF5ZQCwIX6HLGBy2fLG4gAf2yqlWXNQtOif
	86uHEwBoEUdxiFJ4WiuYit/ScrtXiNHOjJXTjuOxoKZxQQOTExcBsEEpW0d9xF4IsvrpdCjo+14
	Mg4j6CEaMFUheXDlIS5rOgWO3slH6lD0uc0h7NnYEIFcHZHoHnatec47nAdRKREEV2qpfLTbczp
	/CeBGgZTgqQAuUzCg4edf4k0UjkXVWAoNp1gVhjVhEpqTv3WuGMldSOw7s2nZEinZGCg5pBXk=
X-Received: by 2002:a05:620a:6cc4:b0:939:c3e6:86d6 with SMTP id af79cd13be357-939ea2bff16mr1780801385a.48.1789301957825;
        Sun, 13 Sep 2026 05:19:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:7971:31eb::4f9:58])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e811cffdsm723852285a.46.2026.09.13.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:19:17 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Sun, 13 Sep 2026 07:19:08 -0500
Subject: [PATCH net v2] wireguard: wait for per-peer crypto during removal
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260913-fix-wg-peer-removal-v2-1-0cade985245a@cloudflare.com>
X-B4-Tracking: v=1; b=H4sIALuUpmoC/22NzQ6CMBCEX4Xs2TXd4k/w5HsYDqVdpAYoaaFqC
 O9uQY8eZ/LNfDME9pYDXLIZPEcbrOtTkLsMdKP6O6M1KYMU8iQKQVjbFz7vODB79Ny5qFo85LX
 OC2FETgRpOXhO2PZ6g55HKL9lmKoH63H9W7HGhtH59+aOtME/jfyriYSEZyWoEPVRm4quunWTq
 Vvlea9dB+WyLB8gX7jJ0gAAAA==
X-Change-ID: 20260901-fix-wg-peer-removal-43fc390d0311
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789301951; l=6772;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=sSR6Vyh+nxnd03+vCWI09lOpb+G3BwthTFIyLv/Q4I8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMSxQ1nmKbDBAMNq6D5B6PGnLJ2lrD+9lnFAtOS1bJq274mAcUH1SHHe1z/u1REI1cGduj/fdWJ
 +cAliKfksggY=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

Calling peer_remove_after_dead() currently flushes device-wide packet
crypto and handshake workqueues while holding RTNL. This is problematic as
unrelated peers can continue adding work to those queues, blocking other
tasks that want to take the RTNL lock.

Instead, this patch tracks pending crypto handoffs for each peer using a
counter. After marking the peer dead, synchronize_net() prevents new
submissions. Next, wait for pending crypto workers to schedule TX work and
for RX NAPI to drain the peer's RX queue. Then flush only the peer's TX
packet and handshake work.

This scopes teardown synchronization to the removed peer and prevents
unrelated peers from extending the RTNL hold time.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
Changes in v2:
- wait for RX packets to drain from peer’s NAPI queue
- Link to v1: https://patch.msgid.link/20260902-fix-wg-peer-removal-v1-1-7a0190f5cdb1@cloudflare.com

To: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: wireguard@lists.zx2c4.com
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/wireguard/peer.c     | 30 ++++++++++++++++--------------
 drivers/net/wireguard/peer.h     |  1 +
 drivers/net/wireguard/queueing.h |  4 ++++
 drivers/net/wireguard/receive.c  |  4 +++-
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a932e0..34842b33b28a 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -14,6 +14,7 @@
 #include <linux/lockdep.h>
 #include <linux/rcupdate.h>
 #include <linux/list.h>
+#include <linux/wait_bit.h>
 
 static struct kmem_cache *peer_cache;
 static atomic64_t peer_counter = ATOMIC64_INIT(0);
@@ -49,6 +50,8 @@ struct wg_peer *wg_peer_create(struct wg_device *wg,
 	INIT_WORK(&peer->transmit_packet_work, wg_packet_tx_worker);
 	wg_prev_queue_init(&peer->tx_queue);
 	wg_prev_queue_init(&peer->rx_queue);
+	/* Keep this above zero until teardown prevents new packet handoffs. */
+	atomic_set(&peer->packet_crypt_pending, 1);
 	rwlock_init(&peer->endpoint_lock);
 	kref_init(&peer->refcount);
 	skb_queue_head_init(&peer->staged_packet_queue);
@@ -105,28 +108,27 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 */
 	wg_timers_stop(peer);
 
-	/* The transition between packet encryption/decryption queues isn't
-	 * guarded by is_dead, but each reference's life is strictly bounded by
-	 * two generations: once for parallel crypto and once for serial
-	 * ingestion, so we can simply flush twice, and be sure that we no
-	 * longer have references inside these queues.
+	/* Lookup removal and is_dead prevent new packets from entering the
+	 * parallel crypto queues after synchronize_net() waits for pre-existing
+	 * submission paths. Drop the initial count and wait for existing TX
+	 * packets to schedule their serial work and RX packets to leave rx_queue.
 	 */
+	atomic_dec(&peer->packet_crypt_pending);
+	wait_var_event(&peer->packet_crypt_pending,
+		       !atomic_read_acquire(&peer->packet_crypt_pending));
+
+	flush_work(&peer->transmit_packet_work);
 
-	/* a) For encrypt/decrypt. */
-	flush_workqueue(peer->device->packet_crypt_wq);
-	/* b.1) For send (but not receive, since that's napi). */
-	flush_workqueue(peer->device->packet_crypt_wq);
-	/* b.2.1) For receive (but not send, since that's wq). */
 	napi_disable(&peer->napi);
-	/* b.2.1) It's now safe to remove the napi struct, which must be done
+	/* It's now safe to remove the napi struct, which must be done
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
 
-	/* Ensure any workstructs we own (like transmit_handshake_work or
-	 * clear_peer_work) no longer are in use.
+	/* clear_peer_work was flushed by wg_timers_stop(). Ensure the remaining
+	 * peer-owned handshake work is no longer in use.
 	 */
-	flush_workqueue(peer->device->handshake_send_wq);
+	flush_work(&peer->transmit_handshake_work);
 
 	/* After the above flushes, a peer might still be active in a few
 	 * different contexts: 1) from xmit(), before hitting is_dead and
diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 718fb42bdac7..64412c67f413 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -37,6 +37,7 @@ struct endpoint {
 struct wg_peer {
 	struct wg_device *device;
 	struct prev_queue tx_queue, rx_queue;
+	atomic_t packet_crypt_pending;
 	struct sk_buff_head staged_packet_queue;
 	int serial_work_cpu;
 	bool is_dead;
diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 79b6d70de236..5ce57565c8ff 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -11,6 +11,7 @@
 #include <linux/skbuff.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/wait_bit.h>
 #include <net/ip_tunnels.h>
 
 struct wg_device;
@@ -161,6 +162,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
 	 */
 	if (unlikely(!wg_prev_queue_enqueue(peer_queue, skb)))
 		return -ENOSPC;
+	atomic_inc(&PACKET_PEER(skb)->packet_crypt_pending);
 
 	/* Then we queue it up in the device queue, which consumes the
 	 * packet as soon as it can.
@@ -182,6 +184,8 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
 	atomic_set_release(&PACKET_CB(skb)->state, state);
 	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
 		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
+	if (atomic_dec_and_test(&peer->packet_crypt_pending))
+		wake_up_var(&peer->packet_crypt_pending);
 	wg_peer_put(peer);
 }
 
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 824bbefce61c..bb35e3205491 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -476,9 +476,11 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
 
 next:
 		wg_noise_keypair_put(keypair, false);
-		wg_peer_put(peer);
 		if (unlikely(free))
 			dev_kfree_skb(skb);
+		if (atomic_dec_and_test(&peer->packet_crypt_pending))
+			wake_up_var(&peer->packet_crypt_pending);
+		wg_peer_put(peer);
 
 		if (++work_done >= budget)
 			break;

---
base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
change-id: 20260901-fix-wg-peer-removal-43fc390d0311

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

