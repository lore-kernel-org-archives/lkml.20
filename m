Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5089378D9A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397005; cv=none; b=fcczULQ5/H0gGVsbEAt+E8bh9/aXuO90ewo2395bW9huTlcZtA4cbwkLJ3dV60hDDlwq6TOcaRaDyWPoaN4hDYqN1byH6Ij0bHlbD+ZF1lQCJWTahpEAL9fcvCmsnMwX4aSq1aQXbOBRuUQwIzc3+gQcyvMc3Kvv0fWIzJ7PPc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397005; c=relaxed/simple;
	bh=SzoPfHs/Y0Yp5wMeUYR89lBIZmoL94dSQOZucEHgjz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jirZWYSum7sZjql4hw47X8jh0J3/XyOUeIcU89p46464mX6xqbeTHjEF4Yjw8CciyYBruqyhATNfiMcDRxnr6VggHczPTwGqZJsWEbYPQCJP7wNSVRjBMUgoaBiwfOH3sZMQl3Ch1fnTz1hoRT5kyb3O/fvkwiCpQVVpD0pBa+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=d4+ANOMq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="d4+ANOMq"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53391022dc0so21610811cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397001; x=1792001801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSCgQuUXGYAa0Wwwh5eq4aENwa4g4z1qSYLp4/+HlX0=;
        b=d4+ANOMqLQd6vaXq58mBx7KDBFy6O2Dk1NcGS5lbCGIG373CAwwyjgnjLku5vXmwpF
         /4eiox/2pnDftlgDCG9N/k7m/PtCqVFVJCjbEcIu6pTaYcYZklEXbv8YkKuhnURowrcT
         ZA15BmW4/mmR/8u7EH558b6ieLd6UimyhDobXW80oBisJdybcahIm2KKAzYI+9JOWCld
         ZfEFJkRhfvDu4wOzNZopkx6PF/p1+UJLau24I9um0sSByT/xsIJqA3gu9RM8rFYRZ+3p
         p0/3vlq5cYi4v7MOzj09MBz9c6vfcAofj6aR9qQwYdaehuKzbGJXdUr1HvN2NLL9VUIo
         SWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397001; x=1792001801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSCgQuUXGYAa0Wwwh5eq4aENwa4g4z1qSYLp4/+HlX0=;
        b=dRO0JotA8qgYl2IfQ2wXE/wdSbOLDvjehFR1qDn5OsFzg00u0HfB+yjbsDqkZOV8Db
         FJKKx9ImsQvLuXUvwRERegxfnidyPx1b8c5mCdjHE+D7h+M85beA3hQeBiR9A7qVLmiu
         1cnD7IoYJN2xD2te8WBfmezlSVDYaxavMVu4viXjYnobFc3iJyhK6tsNxk0u0JX6HS8w
         lW18e6JIwYtaipvAp1IHavnFquCu2A45jKqDTPiXeVURpJN50pdB+bIoC72DLbfmIHpg
         xk1wUtwd1yTtEOFc+yDiPbgSVYZO2tiIWGLPwusAU4EYyu4OWU9Q42gXjXdzM/aHVQoc
         Ox3w==
X-Forwarded-Encrypted: i=1; AKwUvBy041fcrcGpen+EdGU/LiqojnIINFKf+TK8MhZp8IyMaASACiNTt6XEcgXSVXnxvvtiP1uL3rWtanQ1XUA=@vger.kernel.org
X-Gm-Message-State: AFuF++kcfXFcxY9ADtHKtSKoJgOhrga+iHB11powFLYK5Yxa6Yynf9eS
	X3aczcE21aYft65RosxihR82O5eOfYdvLoAEcqNuHvSgx0QUiJ4w2S7lY6pD8/wmSkM=
X-Gm-Gg: AYBFou1JeU7e4+17WyNwLMxFqFOrPRMRHFkpr8lS8ZfaW65zqsJbk1nXkBTZn8RAfdp
	Lu5ttBsDloBNnhGLlOHAv3tHhntNQKdkVBZA8mX4usjV1yKPX28o+aAB0o94BzUcu0BV2/hnMVL
	MNZwKH8d4I0psK+a/A1+3xAlx8uFEfKMua/8h8oVC3TJkDADWi3s2Ly2wqubIcbPVZEetg9D5qp
	85orwl6gpFrRddl8iNdpeg0MFa7o58Wmji3KeVFXXtzWD6vErtKAyDk4neB9tNZAsLKr82djKwx
	bX5rLBxCg7YA56qDs303KXL9i/kRbh2KzT2+QWx/mUwgDvitIfU7NFbNxAPPTIBKuTmsOKbCTZQ
	r9dgGcWG4IqhJpY8pYgG7ogYNuHO08mt3RZnB7cooD/Vnoe/CLXzIwxWNkdKVROZwbGCEbGuYW/
	pP+W1HF3Pr6RjfXvIoHqxAScYxvbHXacHb47JU45eweZeNX2Jh3SOPLKm2aH5o63YwakNWBq8DF
	r9zQYNzd9hLxFM=
X-Received: by 2002:a05:620a:29c7:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93e9b7436bamr598926085a.28.1791397000824;
        Wed, 07 Oct 2026 11:16:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e9915a259sm272174685a.22.2026.10.07.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:40 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:17 +0000
Subject: [PATCH net-next 4/9] xen/netfront: check for failure when pulling
 in xennet_fill_frags()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-4-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=2095;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=SzoPfHs/Y0Yp5wMeUYR89lBIZmoL94dSQOZucEHgjz8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE2mPs8pQLqezwaIQAKe007VJT1pjZBj9lcqG8tW/4kuSaDQpOlcqMEPoJV+xlZe2oi4kfjBSKZ
 BVy2K6gSrcAQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When the skb already has MAX_SKB_FRAGS frags, xennet_fill_frags() pulls
the start of the packet into the head to try to free up a frag slot.
It ignores the return value of __pskb_pull_tail(), which works out only
because the nr_frags check right after it drops the packet if no slot
was freed.

Use pskb_may_pull() and take the error path explicitly if it fails.
pskb_may_pull() does nothing if the head already holds pull_to bytes,
so the BUG_ON() for pull_to < skb_headlen(skb), which protected the
subtraction, can go.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/xen-netfront.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 2ed673649c48..6e01a883cc64 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1174,18 +1174,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 
 		RING_COPY_RESPONSE(&queue->rx, ++cons, &rx);
 
-		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS) {
-			unsigned int pull_to = NETFRONT_SKB_CB(skb)->pull_to;
-
-			BUG_ON(pull_to < skb_headlen(skb));
-			__pskb_pull_tail(skb, pull_to - skb_headlen(skb));
-		}
-		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS)) {
-			xennet_set_rx_rsp_cons(queue,
-					       ++cons + skb_queue_len(list));
-			kfree_skb(nskb);
-			return -ENOENT;
-		}
+		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS &&
+		    unlikely(!pskb_may_pull(skb, NETFRONT_SKB_CB(skb)->pull_to)))
+			goto err;
+		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS))
+			goto err;
 
 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 				skb_frag_page(nfrag),
@@ -1198,6 +1191,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 	xennet_set_rx_rsp_cons(queue, cons);
 
 	return 0;
+
+err:
+	xennet_set_rx_rsp_cons(queue, ++cons + skb_queue_len(list));
+	kfree_skb(nskb);
+	return -ENOENT;
 }
 
 static int checksum_setup(struct net_device *dev, struct sk_buff *skb)

-- 
2.55.0

