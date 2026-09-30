Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E84EBAFA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791909; cv=none; b=MUkVDnEEckUireJm7xCPExul6/5VNMjV36So6vPVlp1NkYHe6Pm7oZQZhucxtgr5LA8UdGpl9HKU2f0nr9gJsmExOfH6UeslwfvVD7Y6cJVxXKDpkP/V7f+4+MVHpb+siYQ2Se1QHe/Z31hfOL/lEzf/XIHfipGxx0F8J2ARwAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791909; c=relaxed/simple;
	bh=vBfffu2N+qCjfpDNWT1R18S0aAVC69XPWcwFQReNaKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWAejFWqw7jr4swdG6oCY89hpWvBDHXb/+fVrty8QOB+zS76YDp2t/42NlQsThueoUIWUeFeiAztO/R1JXtlE6PGRjkUCQSuqZdK20gIs/PFWwCPfUX6PYZkPlSyPoA6lFg1z1SJsgYXNQ+0Xf9bl2VsN1iTZgzefETFyGEPdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Erf3kca7; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Erf3kca7"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso815229eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790791907; x=1791396707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAPuBetQryTJeSCPbNmynycqrn97QO2HO3B06oG4fF4=;
        b=Erf3kca7V79BngSvAsr1xOF/RP6ENHw0su+ngq3tTwkgZNo3bwCKWGYrN8GFScNgmb
         ke5kuALc3HWb77TQFqI29JSp/0Q9qvIQdaGs1+vMjVB/K+ZjAXCkdiUphFaWJoPufEcy
         nHHwb1n8P0c/cS0PJHXTE/ZcN349qVfFMv07QNa/XiJNxQ4YQ8Ied+/Dpe4dR5FNhiry
         hVxvtMZbx8TDbHBaVAfn+noxen2i/VDhjdFFckNuUYVmN6lNs6A3nbbOVZP8wuE+UV2o
         Akhh3ECv2Bf+WyfkhOf1U9t3LLh/N7Jw/dbmHD1EeciPl98TQo4GUYGBzNYDIkq/SFEK
         kr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791907; x=1791396707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAPuBetQryTJeSCPbNmynycqrn97QO2HO3B06oG4fF4=;
        b=xRiBbwpIRDivaRbl1WnETBRI8rgaC+iIoOwgSjQ5/O+tQt8D4tgN4pCdaAk5KaBuNT
         q2tK40vTceEF29a3rIInVLSCv5C0ZMvMWyNsWmLqf+D01UiZssGJHXtWdFC7WOdyQzsm
         kwqM8XuG/pJhfMUJLbUoumeEZCgNMMqaKoHk53SpqWYL9UJoE26bavzOHSWSjcNqOFYl
         JTnrmSbyf9lUFBXspjaltEHE+3MEMfBJXPzKh8xOynuQQzGAjOaQ+d4/76obnkiIESpR
         ZNF9nEtnXWQ6c8r4orEWUTfDAqFJY2XYwyFZX1txvJIeUGzml9XBRz4EwWIhcBW+R+qD
         V7Gg==
X-Forwarded-Encrypted: i=1; AKwUvBygkpcgsya2BymhgJMuVirCud3Wcy+LqY5zWZ6FciMBoelvzy+Zjcdrx54SyB8PQX6WBu5rXy+zOanuOo4=@vger.kernel.org
X-Gm-Message-State: AFuF++nFEOKTcFTNa8BwIrFS8qMiA0dOwQIDZgGrfYQy8qJ0E22ATqZF
	mYWHM7zTzgE9JSkjwqefbkyngzsRRk9bpKF6iIJ2cPu1mDvwOO0GWzGe
X-Gm-Gg: AYBFou3yBx9H7/hQI1X+5lQLFJdeY+CiIAYNm3zqva1yFAJLkujDT8YmGLmt1BKJg91
	Z4rfUX8LibXcrnHIfdDuX4KS3u2Zb2c62jHJiRnV6GXGchyfuzpcWcVx8+MG6wOL0WHtKnTn2o5
	Ap3H49U+DZpLLnl8oge5wbZP6Pyw+qVG/t7uU9PTZyqxEznIkIG/rzIvAkY1tCzPdQJbK7nj+9V
	SVRIRvzkpXuiJvVsquBkPzZrpB+UsV7N02W+KoWYxYm9Y1sv/o1BPbwBckJjjEqMV9zJXbosv+0
	OuHUsGP9jtHYan7TJxvWShppzcy343S97RaO1cT8csT/v7+MbYWlXYyfguyH2TRNM25avUiGQlo
	6ktPkPiUMR4liwMs40s1CLv5Pr2f1Julq+fM5osi8sWxO0jVGif5xDxiWoClzUVEN5TkHZJb6fk
	AnqbEWrr45nVrXnZvHVdrYpDmN37ndeWnUuxMccDqxM079nTFLupdP7yK8/u9K+2lkUYsYBRjvh
	SRH5lxj5A2ycd94NWyVe8u4JmrC5Pslz9Nu6Yx4C4ACELE3Y2umM7Fx++bPcT9CCashpA==
X-Received: by 2002:a05:701b:42c1:20b0:149:c766:2965 with SMTP id a92af1059eb24-14d32ec2b8dmr3393246c88.2.1790791906401;
        Wed, 30 Sep 2026 11:11:46 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df34a8385sm36083c88.6.2026.09.30.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:11:45 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Antoine Tenart <atenart@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] net-sysfs: release queue trackers before allowing reuse
Date: Thu,  1 Oct 2026 02:11:06 +0800
Message-ID: <20260930181106.271547-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An interrupted sysfs_rtnl_lock() can drop the last kobject reference to a
removed TX queue without holding RTNL. netdev_queue_release() clears the
kobject before releasing queue->dev_tracker, allowing the queue to be
re-added while the old release still needs the shared tracker slot:

  CPU 0                               CPU 1
  netdev_queue_release()
    memset(kobj, 0, sizeof(*kobj))
                                      netdev_queue_add_kobject()
                                        state_initialized is clear
                                        netdev_hold() installs new tracker
    netdev_put() releases the new tracker

With CONFIG_NET_DEV_REFCNT_TRACKER enabled, the old tracker is leaked and
the new lifetime's tracker is released prematurely. A later queue release
then reports a double release. The numeric device references remain
balanced.

The kernel reported:

  ref_tracker: reference already released.
  ref_tracker: allocated in:
   netdev_queue_update_kobjects+0x23d/0x5c0
   netif_set_real_num_tx_queues+0x111/0x820
   veth_set_channels+0x327/0x930
   ethtool_set_channels+0x3ee/0x490
  ref_tracker: freed in:
   netdev_queue_release+0xbd/0x130
   kobject_put+0x1f9/0x280
   sysfs_rtnl_lock+0x18b/0x1f0
   xps_rxqs_show+0xad/0x250
  WARNING: lib/ref_tracker.c:322 at ref_tracker_free+0x49e/0x6d0
  Call Trace:
   netdev_queue_release+0xbd/0x130
   kobject_put+0x1f9/0x280
   netdev_queue_update_kobjects+0x3f9/0x5c0
   netif_set_real_num_tx_queues+0x111/0x820
   veth_set_channels+0x327/0x930
   ethtool_set_channels+0x3ee/0x490

RX queues have the same ordering. Their removal and re-addition are
normally serialized by RTNL, but CONFIG_DEBUG_KOBJECT_RELEASE can defer the
release callback to workqueue context and expose the same reuse window.

Release each tracker before clearing its kobject. Pair full memory barriers
on the release and add sides so that an add which observes
state_initialized clear cannot install a new tracker before the old release
has finished accessing the shared tracker slot. Keep the numeric device
reference until after the reset so that the queue storage remains alive
throughout the callback's accesses.

Fixes: b0b6fcfa6ad8 ("net-sysfs: remove rtnl_trylock from queue attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
Changes in v2:
- Add an explicit full memory barrier in the TX add path, paired with the
  release-side barrier.
- Apply the same tracker ordering and barrier pair to RX queues, whose
  release callback may be delayed with CONFIG_DEBUG_KOBJECT_RELEASE.
- Clarify the paired barrier comments.

Link: https://lore.kernel.org/r/20260926173315.2452612-1-nicoyip.dev@gmail.com/ [v1]

 net/core/net-sysfs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index 352173df7578..2af972f5d3c3 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -1156,8 +1156,11 @@ static void rx_queue_release(struct kobject *kobj)
 		kvfree_rcu_mightsleep(rps_tag_to_table(tag_ptr));
 #endif
 
+	netdev_tracker_free(queue->dev, &queue->dev_tracker);
+	/* Pairs with the smp_mb() in rx_queue_add_kobject(). */
+	smp_mb();
 	memset(kobj, 0, sizeof(*kobj));
-	netdev_put(queue->dev, &queue->dev_tracker);
+	__dev_put(queue->dev);
 }
 
 static const struct ns_common *rx_queue_namespace(const struct kobject *kobj)
@@ -1230,6 +1233,9 @@ static int rx_queue_add_kobject(struct net_device *dev, int index)
 		return -EAGAIN;
 	}
 
+	/* Pairs with the smp_mb() in rx_queue_release(). */
+	smp_mb();
+
 	/* Kobject_put later will trigger rx_queue_release call which
 	 * decreases dev refcount: Take that reference here
 	 */
@@ -1906,8 +1912,11 @@ static void netdev_queue_release(struct kobject *kobj)
 {
 	struct netdev_queue *queue = to_netdev_queue(kobj);
 
+	netdev_tracker_free(queue->dev, &queue->dev_tracker);
+	/* Pairs with the smp_mb() in netdev_queue_add_kobject(). */
+	smp_mb();
 	memset(kobj, 0, sizeof(*kobj));
-	netdev_put(queue->dev, &queue->dev_tracker);
+	__dev_put(queue->dev);
 }
 
 static const struct ns_common *netdev_queue_namespace(const struct kobject *kobj)
@@ -1967,6 +1976,9 @@ static int netdev_queue_add_kobject(struct net_device *dev, int index)
 		return -EAGAIN;
 	}
 
+	/* Pairs with the smp_mb() in netdev_queue_release(). */
+	smp_mb();
+
 	/* Kobject_put later will trigger netdev_queue_release call
 	 * which decreases dev refcount: Take that reference here
 	 */
-- 
2.43.0
