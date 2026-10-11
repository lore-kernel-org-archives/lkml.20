Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E4F435508
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791714212; cv=none; b=drjb5LezArZa+PKXuvyQVH/kYrC3+Q6GvG0XmbFbPTf5Iy8Fzs7beUuYjxpOQLuoDuKGUTZ1ueUdugrlDkYB+tn3FjFBo+ZIzEyRXi/ry8ru/3QGoPjohL0kU3cgLsV1SFFRdNoInRckGcC6/bFa9vIkhC25maiV6MYed+k5PYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791714212; c=relaxed/simple;
	bh=UkejspJMABV8XUO9c0J8pEcCukwX/riAy3KkeTFeYHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4S66bwrMAtKEEyLHjWwbyVNIA3x2+XaksUHO0wnzcDPAYwteRLP0XViKlFoJrzdzqDo1BTOEoJJG6RlfU6Tuu76VqiSAAjBKQgHjy4rKdO63ndXziaKSwo45IrHPsH73TPqyalpWyPf8jWSLdW/PQ+ViceimxxH59gHvPyoBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG/VeZju; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG/VeZju"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e60f9af6e6so8588345ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791714208; x=1792319008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pPRjimeEtxmh2P3t5S8/c4gUxkBAEeUK/IaL4NUFWU=;
        b=LG/VeZjuTNhOQlaNyNNty+Tw9LA5wyw94Pu0AHb/tIGDweky9q4RY+zsvvgoBi+10Q
         hnaKAB2Ph16x5ly+bL6YT0Tv6w/VjDUUDzN2Ro8iv7ttHUwL3WcYxTn3aqZWjWerCGoY
         zRZFVGqW++4q84pdN/Foywa7wpBmU+wVFPT4PHAKHieUlsLCdcmj7wbronfZTd+9HdJs
         PLYzwHxYDN7PdXwbxHRuQ3dWQs2hVuccPfg2R7r3aY8uc5CgFyG2f8gA2fltKtH4O8wo
         Ez63YUjw7CizndcyWUwzP3d/8qE177+CkrM+5hbK8osBnTutqDOmuNGUfholu2FPjNsO
         lvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791714208; x=1792319008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pPRjimeEtxmh2P3t5S8/c4gUxkBAEeUK/IaL4NUFWU=;
        b=fXWz7PII+q6WztpC84kQDmMqvVmVHNK1gfvqhbYLtBpbszNKgXGJWeYO5qrxwx0K5c
         lsKbWyIndx6f6V42GMknn7Cr3liLxC5pGnlPGPhCSKarVIaZbCGjTWFBmt9LSG4sFFXg
         vC+KmbTdJn+5FXrq2HV9FZzKvt3k+XNBmRpKzZFHMmjevtiACII9ic/6kmzVespXpYHi
         hkOTZgiixdgvm/GEx4e5lO2el0YiWqnX5uxcN8aY+yrB/04Uvmatv6RcD1wnaY52MsLV
         VBMrfycYRf6fgjfPFUfZ7JF1PgUMCQIM1WvJq7gjWL03++Mq96VGhCsoRl0ThHUiMpcJ
         EolA==
X-Forwarded-Encrypted: i=1; AKwUvBx0m9CGHcDnEpqJwPAORhAjiDd6JpT87CRCDWxH2/95vsfhroRR3CaSQwCHvKB9YcssFtzEnZ545EKv4+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb3jJwnNbzakazbsYAjbZh1v/9k2dZljQ4Pp32Q/soiGLfxuf1
	f+XjP/E2lpSggx0TSo18ZgamxC8i2+KaLYxRgIsqMtRkcKaboIB8CFWL
X-Gm-Gg: AYBFou2C7czUShWBkyJBTA397VwNl0i1ekfJI8f9DC7e5VXeqqWAWAu1WDG2aHeu/Yo
	jEcRZWITBzWBOkMmdgCktYNr7enXl8neozDIsVb0mIZ1IDNYxrbnibPU0G+NygwLjRmabTk6AzI
	qdtSoffkwGGBD+dPcRDlLAuZ6IUZ77WsQyQ2kaZTPy6xeno1Sa2MhmMXxLxi/eYliPJO+Asnjh0
	Y4ui9rCRZwSt2bR4fZgieBkMOfhXKDmqBtoHg30s1Gvjo97O55l78hXsCjUNpQ8De327ExQqQGw
	vnASdfXxc1qkNBYJznAuCR1crLICSTJ7EQdrmdL0cRyPm88M7/qlB/feW90yoV2X2lXbKKq0Xnt
	/y0p1QjppatN1pKbqP+9a7rJXn6sQG6oeutCwpqVGUhtGTVwjNVqeBNCjhGZcc0qDWbSVd5ISOJ
	JDMnqsblZ97DXF512nW4epEHSLzLHNoMcypkbWkUeNyfRauvOTXg3ejkEQFerLUjEqtjmS/nTJf
	vRXWUmq2y4=
X-Received: by 2002:a17:902:f78c:b0:2e5:98d7:821e with SMTP id d9443c01a7336-2e8428207f8mr61319815ad.7.1791714208455;
        Sun, 11 Oct 2026 03:23:28 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16c8::245:79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1643sm31643955ad.70.2026.10.11.03.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 03:23:27 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+de9701a2cad597c14d34@syzkaller.appspotmail.com
Subject: [PATCH net] wireguard: mark racy persistent_keepalive_interval accesses
Date: Sun, 11 Oct 2026 17:23:22 +0700
Message-ID: <20261011102322.355167-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wg_set_device_doit() updates peer->persistent_keepalive_interval under
device_update_lock, while the RX/TX paths read it locklessly in
wg_timers_any_authenticated_packet_traversal() and in the persistent
keepalive timer. KCSAN reports the race:

  BUG: KCSAN: data-race in set_peer / wg_timers_any_authenticated_packet_traversal

  write to ... by task 3648 on cpu 1:
   set_peer+0x...  drivers/net/wireguard/netlink.c:457
   wg_set_device_doit+0x...
  read to ... by task 3652 on cpu 0:
   wg_timers_any_authenticated_packet_traversal+0x...  timers.c:217
   wg_packet_consume_data_done+0x...
   wg_packet_rx_poll+0x...

The race is benign, but the reader also loads the field twice, so the
zero check and the timer expiry computation can see different values.
Load it once with READ_ONCE() and mark the writer and the other
lockless reader accordingly.

Reported-by: syzbot+de9701a2cad597c14d34@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de9701a2cad597c14d34
Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/net/wireguard/netlink.c | 3 ++-
 drivers/net/wireguard/timers.c  | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 1da7e98d0d50..fafe2900c92b 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -454,7 +454,8 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 			persistent_keepalive_interval &&
 			netif_running(wg->dev);
 
-		peer->persistent_keepalive_interval = persistent_keepalive_interval;
+		WRITE_ONCE(peer->persistent_keepalive_interval,
+			   persistent_keepalive_interval);
 		if (send_keepalive)
 			wg_packet_send_keepalive(peer);
 	}
diff --git a/drivers/net/wireguard/timers.c b/drivers/net/wireguard/timers.c
index 4016a3065602..c4697e8522b3 100644
--- a/drivers/net/wireguard/timers.c
+++ b/drivers/net/wireguard/timers.c
@@ -140,7 +140,7 @@ static void wg_expired_send_persistent_keepalive(struct timer_list *timer)
 	struct wg_peer *peer = timer_container_of(peer, timer,
 						  timer_persistent_keepalive);
 
-	if (likely(peer->persistent_keepalive_interval))
+	if (likely(READ_ONCE(peer->persistent_keepalive_interval)))
 		wg_packet_send_keepalive(peer);
 }
 
@@ -214,9 +214,11 @@ void wg_timers_session_derived(struct wg_peer *peer)
  */
 void wg_timers_any_authenticated_packet_traversal(struct wg_peer *peer)
 {
-	if (peer->persistent_keepalive_interval)
+	u16 interval = READ_ONCE(peer->persistent_keepalive_interval);
+
+	if (interval)
 		mod_peer_timer(peer, &peer->timer_persistent_keepalive,
-			jiffies + peer->persistent_keepalive_interval * HZ);
+			jiffies + interval * HZ);
 }
 
 void wg_timers_init(struct wg_peer *peer)
-- 
2.43.0

