Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB03A3DAADA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040836; cv=none; b=d7+mdo8PHY+NEbBWC1ZFlEECuLAb8/kbhqvEdiKmCsztOltZmX3Ld7vniuM0hdStE92w9okjXrjCF7h9ThKhCp0nKCzSPqWUfNpuwypB2NV4WwIZT8sxysb7y3n+R/2ZxOlFnEEk8cjIid5Wtn2gEfrWxMQrfNhq11/U+1xWz84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040836; c=relaxed/simple;
	bh=4laeaYnyM82VkcLLI0+4iJvrSAWDDWZ+kak0dp7QhoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaJYQJ3weXP9TNw6lZM7t2up4h0Wz+p2iP2dFONimLeecK3FuGWSFZJTEjPHZ5Zz71vNZxBWmuOGYeNWs5yqBmrRKr0F61LDlSiDdxQ2tCjGlRC5WmKj6pQSs1+l/4sndfNTTrbX5OnETwIdWvvKWcmxHJm2Ckjj9yx1nfMcbY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0td4gQK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0td4gQK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so949125a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040835; x=1792645635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RG483f/vXFgd+W2LD/AsmPv9HxoY1L8OX7tqUMO6Cp0=;
        b=T0td4gQKEiTmfqZ8oMoVvo/cv1CVno7rbOSroMIrA8UjJvKDR2PTsjhH+US4J6UmbV
         4YeJcTELQ/Yt0OVsgkEqZjbraJKPiEwI6/AAUYoy+IydgK8Ti3l0ua+I5mg92RrOXvPn
         ELr/7ioisvgg8RJ91SYHcydOB8uV6qqWph3XXBjgN/eAg8gukf5dYS8dYvjzp6Y395wn
         RxUSM80C35QTY99072S3VeSsjuao42gPZP/nEKZNQ+faGycVLSntlAqO2QZ5F6lPCC/o
         +lKXAVWldKuPa5cFaeMbLmSHSbl02/llKyf+TP5fyKrd1FLbnwMh82ouc6SVnlzGopBg
         Uwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040835; x=1792645635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RG483f/vXFgd+W2LD/AsmPv9HxoY1L8OX7tqUMO6Cp0=;
        b=Fv05HARV8rpUj1sHvBe6DsoOGGxz+/YLhRFdfbz9Ozvr3B5xywLpEfWj3c5/jAQilE
         oHOrz15AuyxJLunOrMPAt3g05PuWIzasceolJO/tBL47KtzXJsiJMQMYUv3zu0WLnf6S
         KBamEYcREPs0q6nmuCsPnS9TEYn3R40pLEmJYRFTKp+Hzy+M3N8SiXG2HXwIMCK+v02k
         O6mre4JGBqYzDnDmRZ/JnlH7mmts9StQK7v1A4mGdhO7bTIHc6au+YH9gM8LuRbjQSV2
         ybG/KehjZserruGVs3+PoZM6XEZskP3fUb1LB46fy6tPefo+ebR7sNJLSaITJQqAx49S
         RGlA==
X-Forwarded-Encrypted: i=1; AKwUvBzAJkwgyfmiCiUy8TuHxV/yOWL8wX57skI+5pnsjaOezVzXV13caAz1H3KPqgXds4EhfkpK9KwqBlckGwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB1nL9LeBYEawTkZFU/3lDZGuQusCKgstOWf3DqSLJNxLqbBqa
	GawmCEcKqglFyuIs8O8wA6xYNEwD0e3uSFyxghMAzYFWU1516/enO8kF
X-Gm-Gg: AYBFou3Dk0tYF1FXAKlg7TYWvNW9BmV6AfdzEhx+I4s/6dbotiI0f2CqI+gtd1nDzEP
	KNMPuqEYIQssRL67sipWqNfnc8bRcpyCY6QOfZ18tQqd8+t97OL6JVqJ/6Sa+XgwDkaZvOVivZ3
	WAhJAxuwUyY6hrL+9QXATEXde7BrQB1j9EuvC3V6PV5IOqRFA7qkc4bdOrGD6RsGIPcYLIkgO+J
	wJCONbJYQPoP0JHZErozmx9eKT+QAIdqliobPIvR+yHe9clS5Imtb6DQsogp5DK6hRgbWObZKKM
	Z/qQ/o4/cOm4JOP++Akz/i7dpwAYguGkNZa9Upc2/1x2NeiAgQpVdeCe2c3jijE9AXZlv29rLxD
	R1+JUni4AWr+BB1niljNi6Q3YayJ8nvJRqBjAC5DqKjq1aG0xGD945ACDQtJYpVkN8VR1+tKncC
	OeaqvGDgR0oM7Pv1go2/sZyrb+F1QJ5F4AoSnn+nDB+r/EMrc9S3folZ4K3MNHo6OIOSARRM1+u
	M7tmWwB0ZY=
X-Received: by 2002:a17:90b:498c:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ac9176f12dmr1864528a91.46.1792040834893;
        Wed, 14 Oct 2026 22:07:14 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm2548033a91.13.2026.10.14.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:07:13 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v4 2/4] ipv6: serialize address publication with device teardown
Date: Thu, 15 Oct 2026 14:06:49 +0900
Message-ID: <20261015050651.1841557-3-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015050651.1841557-1-4ncienth@gmail.com>
References: <20261015050651.1841557-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipv6_add_addr() checks idev state before allocating an ifaddr, but
publishes the object later. addrconf_ifdown() can mark and detach the
idev between the check and publication.

This happens when a non-loopback device MTU falls below IPV6_MIN_MTU. A
forced interleaving published an address on a dead idev, and
ipv6_get_ifaddr() still returned it after teardown. Later device deletion
remained blocked with:

  unregister_netdevice: waiting for ac0 to become free. Usage count = 3

Protect the dead indication with idev->lock and keep that lock across
both hash and device-list publication. Recheck dead before publishing;
if teardown wins the lock, reject the unpublished object.

Non-unregister teardown does not set dead. The preceding change covers an
add that misses the initial hash scan but reaches the per-device list
snapshot. Both changes are required when backporting this fix.

Fixes: 8814c4b53381 ("[IPV6] ADDRCONF: Convert addrconf_lock to RCU.")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/179161099408.434549.14449036924552933828@kernel.org
Link: https://lore.kernel.org/r/20261012145306.GB779501@shredder
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 72d7df23f79674..3bede30d4e989b 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1168,14 +1168,18 @@ ipv6_add_addr(struct inet6_dev *idev, struct ifa6_config *cfg,
 
 	rcu_read_lock();
 
-	err = ipv6_add_addr_hash(idev->dev, ifa);
+	write_lock_bh(&idev->lock);
+
+	if (idev->dead)
+		err = -ENODEV;
+	else
+		err = ipv6_add_addr_hash(idev->dev, ifa);
 	if (err < 0) {
+		write_unlock_bh(&idev->lock);
 		rcu_read_unlock();
 		goto out;
 	}
 
-	write_lock_bh(&idev->lock);
-
 	/* Add to inet6_dev unicast addr list. */
 	ipv6_link_dev_addr(idev, ifa);
 
@@ -3897,7 +3901,9 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 	 *	   Do not dev_put!
 	 */
 	if (unregister) {
+		write_lock_bh(&idev->lock);
 		WRITE_ONCE(idev->dead, 1);
+		write_unlock_bh(&idev->lock);
 
 		/* protected by rtnl_lock */
 		RCU_INIT_POINTER(dev->ip6_ptr, NULL);
-- 
2.55.0

