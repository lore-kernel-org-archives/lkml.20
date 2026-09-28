Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B70236F916
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619361; cv=none; b=ayV3vkLo2fbiyfHQscEexWGoA2zyP/vs7vVEnoQcbNpVM9CjxQ2xmZftPBw7bZ4LCIkpGA9WweTnxodrXdITN2EtFuAAPnXF46n7Gbkpz6T8iIPROWm/IGj/icuoZtkjvGXFphdFHlk/CIYI2PujTrXTZiPL9iSRkFqz7SHSmiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619361; c=relaxed/simple;
	bh=GT1LroDYquZuKN9P1VaTunu4972QFEhqkweltDDMUnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWjdKbOmzA9qDbJnsvK0xQrPYUjtwGOX92Ds75F1RLi1LG4/EuASFIrjaWc2ghF3XuOQL9cMHnDyQGWw4Y6gv4AuoSihtUlm2GbdlFluAUY4yp+f3uZTGuCIlbx/iw7z0uPqaLfDfLTVXrCkcN6EwvtyAUIKqO7i0pe55RhGMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=oIAEujcv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="oIAEujcv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso36086675e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790619358; x=1791224158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/9cYRqTei+7vgfSHJssJHkmRcktsrl19sr68J1vLis=;
        b=oIAEujcvh65xHFFHGfcXmy6w2AFJdqmjpHMrK2dCM9kxG5h7eoNre+LLYFDUeAMzU3
         6CsOHLVxamaNHqLsnJ+rypc+4yR9OvHcBBJa5Yn8eiiVDaNnU0Prla714aVnJfb2hevB
         kaoZkJ1b9cNRZBD8r/XJ3st5iuVzYvuoJjJpjqjYHia0PwBstnY+q5wes7gZ1NC5Jk9Y
         17VLshH+/8gVPonb/rkW51AUPafBie3lJ4QSb4pF2qCNo1K2/nWsneRWdf8vpf1sORw8
         Y8kiHA24AbPZYcriDL32aD973pOu+DEBzOxRzWzy7TI6Wor0Y7MZHb0H0KrrjaKP9L01
         3WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619358; x=1791224158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/9cYRqTei+7vgfSHJssJHkmRcktsrl19sr68J1vLis=;
        b=MXliPdI9DRM4hNkyPJTH0TvLBu59bAXoLEQ0w4j49EFNaYhXcunE/Upt4fKu51WGea
         MLmmF7ugBXSaUqisLcGlF/4LpVjayceWecK2R24ZqqmrQOQXDMINVSlnWevOnnClCPSR
         BPNQIt9hnZwccy82ugi4A6dlrv4JNaQ9vJejhgMAr7TLWo3KqB+GvtVrx0NU/3EuU5KX
         86lcfc0m+4o7FxfYAJuUXwdkGrT4wp7iMebuN6bHVsAL5Q3Omi3aNGY4ZdaDtcKq0N0K
         f2YbUPOPtG7xfsYuujGzeCuJSJdLR3uLNhgbqW1iKFjslD6j7K5DY9y46cM1f6XySJEE
         +cFA==
X-Forwarded-Encrypted: i=1; AKwUvBwb6XIAKuCHNzwMt7NeBNlvfjoIwyO/QsH1vyXHNg5xG035uedIrbeOaPGbBuF7+QuqBfxamyaTFsD3alE=@vger.kernel.org
X-Gm-Message-State: AFuF++nip9SoKC6ROzY1jX7/Gg1C1uD5ZZuwWaKXfzBc3VuNkBaxReH6
	bmkmBMEUV9pRqWu0uqUTeeAncXdx1DFNDyIIy6xBVUm5IFku0b05KBqxXsdgAMUlQmg=
X-Gm-Gg: AYBFou0HnoOYT6f0/84N4mxSUuXe9M2+6G3+2m/doeSZuu8k8vKFCfl8quftKBrZIfx
	LjVEaepVcGzWj3pfduaTJxPM6YITwiPkTmxSSSAEcAgj8M2auUzjZo0Ck/Y6LommNuuIJjARpJd
	OCnVFymN6CwWvZw6cmFhBaib2LnWPsFwjAuzT5OAZXPiJZQagRrAX68AzlKiyywbaFuML/pxGd6
	tZiI8edqqD+k1Db3nVlyKMZctiA9NLPapWINJKOG2CRmUXqhmShL+jJMlHsAcNfGbu0eaBt2Q0h
	1orwvOgfzVcv4OUe+30TzLkDYWH9kK6HtjAo25QhPjV0Z6w80lofGHMLoDx8/6YLDAInCvlKxRf
	yyGNa+V1SPKuusFuY/HKaIKMPGJfRkUt512QXaqnblDpm/kdrEBAAHD3+s/N5cc7yCfc4FyDpXk
	qtZ48f61Hz2TL+Pv3T0sZgkmsnqgleCBwXjQhJ7itOTiat7SZ8Kig79iKBQ58/eHVDHXA+1aEB/
	bEdR0GA7rxLcW+dwkj+dww79VFigqI5NGUhOcd315MMneHg4CZg/mFWEce00MjBpDbw+3eNPDNh
	z6L98w3Dy9YY
X-Received: by 2002:a05:600c:46d1:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49fe7bab928mr213407515e9.16.1790619357625;
        Mon, 28 Sep 2026 11:15:57 -0700 (PDT)
Received: from localhost.localdomain ([197.51.38.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d46ec56sm3035035e9.2.2026.09.28.11.15.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 11:15:56 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] amt: do not offer software GSO on the amt device
Date: Mon, 28 Sep 2026 21:15:54 +0300
Message-ID: <20260928181554.85766-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_link_setup() puts NETIF_F_GSO_SOFTWARE in the device features, so
the core hands amt_dev_xmit() a GSO skb unsegmented: a UDP_SEGMENT
sender, or a UDP packet GRO merged on a link with UDP GRO forwarding
or fraglist GRO, that is routed to the amt device. The relay copies
the skb for each tunnel in amt_send_multicast_data() and pushes the AMT
and outer headers, but it never marks the copy for UDP tunnel
segmentation, so skb->encapsulation stays clear and gso_type is still
the inner SKB_GSO_UDP_L4. When the outer IP layer segments it,
__udp_gso_segment() cuts the outer UDP payload at the inner gso_size:
the first segment carries the AMT header, the inner headers and part
of the data, and every later one carries raw inner payload behind a
new outer UDP header, which a gateway takes for a malformed AMT
message.

The amt device cannot offload segmentation to anything, so stop
offering it and let validate_xmit_skb() segment a GSO skb before
amt_dev_xmit() replicates it. Each gateway then gets one AMT message
per inner packet. Neither mode needs GSO: a gateway only sends IGMP
and MLD reports.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index bddc24e18..6eb148c9f 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3155,10 +3155,8 @@ static void amt_link_setup(struct net_device *dev)
 	dev->priv_flags		|= IFF_NO_QUEUE;
 	dev->lltx		= true;
 	dev->netns_immutable	= true;
-	dev->features		|= NETIF_F_GSO_SOFTWARE;
 	dev->hw_features	|= NETIF_F_SG | NETIF_F_HW_CSUM;
 	dev->hw_features	|= NETIF_F_FRAGLIST | NETIF_F_RXCSUM;
-	dev->hw_features	|= NETIF_F_GSO_SOFTWARE;
 	dev->pcpu_stat_type	= NETDEV_PCPU_STAT_TSTATS;
 	eth_hw_addr_random(dev);
 	eth_zero_addr(dev->broadcast);

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.47.3

