Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B1F43F4AD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493409; cv=none; b=T0rB6z2prVO8A8ORMtjIaJZUkmiopvxMmDblH5EVf/pk5YSvsNj9wgyEZyPCNa2GJxvjCt2cvus2h1Nusjc/CWDg2Y3iMFxrPvLYdZAX2QuqRenRN1x+ImbyBsGTzpnHFp0oGf1PHe9Ocsakr+3wVBrMfJFiGuKysZQC4OX/PdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493409; c=relaxed/simple;
	bh=YaVSidg1Bo1cVWoGQJzV4z/nBT+SLxbK+9NmCYkL+oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LStwPEB8HNKczUVJZTc90TVIbjmXhUk4UidVytcTLuDrZMLDLnu0tc4q5vWcgj8XNQGvd+eulh1etyCdNtGCwrzCUHj9tT7lKXexjPUtV98ZKGxDv38a/RhxSZvfDyKQ+bEQJv+wRgFStK6tmauN3I2ycMyu1YsftseIaVqIifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=AjOYLTDS; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="AjOYLTDS"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e56c287b3so460761185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791493404; x=1792098204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3FpKl0vN7petfzZgqIhlc2NP9KQ4OIDsR/ta4Cqq6o=;
        b=AjOYLTDS2cqWkdkUZGMU065Mk5FOnngjH2nFmADmNP1dwfBF+IFoGU3kgPLaBFf0XX
         DZ3RNrFPdTram8cF9juATXQ3BVS+xAOvEWXLSftPRlZDZj3yn0kGPQhpLzubJKSlHlP2
         2VaSzD2wwo1dJmIHeTEKETB97ri2QWKye+H30U4IRBfw9MMTro6VE6qp9pXA+G/aC8oE
         F3BL6ri2SE4TordWaZXfakliW2CWezh7B28Pne1M1QX3mZWkq20GgFqxzvt60mimd0Xa
         wRATTpDM2dWJLpb3jrpO0ChV5F/e4nYs56TPh4NrWSd7apC0M2bDZe7hwNbmkWGJbSue
         cBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493404; x=1792098204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3FpKl0vN7petfzZgqIhlc2NP9KQ4OIDsR/ta4Cqq6o=;
        b=gXd2NP5V8MgvzgKGiNyEqrvW3G5BZaxWso+sSWP3C0o0OoTaQKvAhNNzTZtWbvixLX
         i02Dkp9w7ThDVtS8NmLm2R9Xth13adKrsE5d7BSy/0b2WGPRf0Qtz8hgVRNaYQ6/lemN
         KVTzQG8K0LSjXm7DnV99P75Tj0TTilRnZ5PUjAR0V9+0AlIY0iahEeRIY5eus/8nVfgT
         3JDHsdnlS6hc8ohLAOSdqQ7EJ4tj0BzaZRx8FegwHpdn26vajbxihEjdeYj6CslpePdI
         J21yLaMhZQxagpNndQqJ1j8v+tu3YD2rrmpxDZFCtbjYLoosVGG10eP8/2+fHGtqA93T
         myOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJHTZXNtv/WzKn1C1zJbO34qFhn/YVqiW0jzTIeHgMHUninbGrfo2Y9jFOiD3DLnBzBEsUx7S33xK8o34=@vger.kernel.org
X-Gm-Message-State: AFuF++mcqfkx8zbq+YuLwtqaypGSuqo9eEpmOJgACbqUef9HpKDloUGF
	3N1WbMEo7/2OCIHvxFV5s7evpUqPXod1QNqCaw0VODM48TLK/Kdy0rBeAig14juIXh0=
X-Gm-Gg: AYBFou0CiStBvWEC3SJk7xbqioBeCDKfy6jQ9FwGFuHCft+yiTuMqDaMiHAs4ckl8p0
	2NE0xamzK0jJjVSnv5av3/mc7UgEdnkJJXVALrpXQQnTENe5VkcHCo2ymo1qDI7uic3EWrzUg9g
	ahcN6Tmkmt63rBZ1Z9DjKod5GdafytZ7yxo1ZukhicxrP7WDHspTSHL7dr398l/bZ25zMO8hcyB
	qBDkid0kMGcUGB1FaUehVbwWfRBab2uJMgsyZe/HlH5aYHnBmujUZfXv0we0vkjDM25jBnqwFmv
	sP6jdqFOmhdsBTKvZCT7s9V3hNwpRyJDZIYGcpBmVScxk+G3mKhqYwNd/har8uc3RGqI3XGVCE6
	Q5r3UI2J2j7zwvIfeHr7unUahAgY15dTmIkO9hCyMO4WrnrxbJGD58n79w8tnC9J+chE6VWkEPA
	bW2Me5qaO1jdrpG4Ve9H7zjdUuK+0FQBfzZdlqPv8oQ9hEQi4P2qgRV/zNGTUwZlCGWm/zYD5uF
	RRDh9MqTQCpTx3HErB8Ti3ISA==
X-Received: by 2002:a05:620a:29c7:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e9b807709mr1263365385a.49.1791493403829;
        Thu, 08 Oct 2026 14:03:23 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9724fd1sm26327885a.1.2026.10.08.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:03:22 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:49 +0000
Subject: [PATCH net-next v2 02/10] net: ftmac100: check for failure when
 pulling in the RX header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-2-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=1745;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=YaVSidg1Bo1cVWoGQJzV4z/nBT+SLxbK+9NmCYkL+oY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKPRKOQSDQ67QodM++vQrU2bAaf9t1GHfgEbAcRMIyyvBlr3tTyXLKb7mAyGosVPXukX94UmJf/
 pTxPq3ZQboAQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

ftmac100_rx_packet() uses __pskb_pull_tail() to pull either the
Ethernet header or, for small frames, the whole frame into the skb
head, and ignores the return value.  If that pull ever failed,
eth_type_trans() would find less than ETH_HLEN in the head and BUG()
in __skb_pull().

It doesn't fail today because the skb is freshly allocated, isn't
shared and has room in the head, but that's only true because of how
this driver allocates.  Use pskb_may_pull() for the header and
__skb_linearize() for small frames, which is what the two pulls are
doing, and drop the frame if either fails.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/faraday/ftmac100.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftmac100.c b/drivers/net/ethernet/faraday/ftmac100.c
index 40ba001d4b3f..a1eb04ead2d8 100644
--- a/drivers/net/ethernet/faraday/ftmac100.c
+++ b/drivers/net/ethernet/faraday/ftmac100.c
@@ -469,15 +469,21 @@ static bool ftmac100_rx_packet(struct ftmac100 *priv, int *processed)
 	if (length > 128) {
 		skb->truesize += PAGE_SIZE;
 		/* We pull the minimum amount into linear part */
-		__pskb_pull_tail(skb, ETH_HLEN);
+		ret = pskb_may_pull(skb, ETH_HLEN);
 	} else {
 		/* Small frames are copied into linear part to free one page */
-		__pskb_pull_tail(skb, length);
+		ret = !__skb_linearize(skb);
 	}
 	ftmac100_alloc_rx_page(priv, rxdes, GFP_ATOMIC);
 
 	ftmac100_rx_pointer_advance(priv);
 
+	if (unlikely(!ret)) {
+		netdev->stats.rx_dropped++;
+		kfree_skb(skb);
+		return true;
+	}
+
 	skb->protocol = eth_type_trans(skb, netdev);
 
 	netdev->stats.rx_packets++;

-- 
2.55.0

