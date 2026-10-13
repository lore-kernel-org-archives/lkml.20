Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE193B6C18
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877600; cv=none; b=Ely+NrLybWeXYa5CPLK/qpdYmZLIUVkl27+7QpWmr2BkxHumBo04/YRbyeinObvS7s2tSJ2Ci+eWbevq/HJXW3UZICMQQonbhKJF1eA6OYi5M5qCTCFAagfezHPVoZgNVXu88NAri2X/c1TjKLTZJjIw+Y1ruM6utPsnLPPmTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877600; c=relaxed/simple;
	bh=VWvTh8pRBfLzZYq0/B57gvJ3i39LdOuPQQ8A+wOFzac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCSwIgWyrctsLCqfQpI2OHsHGnUZYpkbDsYFDlM2NDXnsz/RNFkpUNEY14BOVkAOs0ncV4Zip05vs9Ha/T/6gkR4lP8j1j+OiDby7C7F5A59msfstfJnpa6UurgM9MAEuUsJyIGACZwyvfNAe6gnysEayGe60Hbnqp6HXHoed+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W38+HgTd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W38+HgTd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-89a837bf00eso179593b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877598; x=1792482398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRK5JR2R0osIMZXxAjTIpL9VbaaBLYol5dzz9oAakrI=;
        b=W38+HgTdfDU7DwugeC7/Vt0uMe8HpvB8Cn95u+3GOmC+Qa4mwwHaRax+2hQshOio6G
         OcUvF4ac+kmguHej3MsaOhHTp/e4CG1NABSGb+lT0fKtG9loNDgEtTrwC29vSv79dNIW
         A7+fKn60CmaoYXgvSzSfR3y5iSbbNlYnVix0CvjWZ9H9pMbA3lzkHqs4lhqNDGB9Ud4I
         lS22+3VkuycE3hNBUVJLMGIrJuvldWWaRkmrXmFTyPMJYa0uE7YxBEXh7oVRt46EazBe
         cwIHz7vtWSPPKSL4VFtX5qDt7TQl8IFMYizeVpOk9t/FG01avO6dYaFKIp9Gq7L78gFD
         heQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877598; x=1792482398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tRK5JR2R0osIMZXxAjTIpL9VbaaBLYol5dzz9oAakrI=;
        b=Tvn86YGG92UmzThRFFLVpJyYLVbvuHS89XlWQXkr+B04p7eCdz2UP5QkEGVhUnff4b
         /cO4q+kdJeFYjebFOHKeQFp3/GtbBqGCZncCQV9xYaBjiNPY5RT3gg6EQGjMB8zYnAQi
         ktvOrw9YpB2oJa3VOtJC2N7lsWRP4wb4dKvtefCK/JE/LSWoDNxC92cogXCCvR0kTXLu
         5ooLuWS3EiH6C1QcTzgvGLgSvob3D8P1RTYxr0g8Ax2OjikUtOxqPatlpbl0xkEg/GZw
         tMwBHAEW9n7hGsGZAW/xRdTeJ6pZc2ID6Cb0swpEilCDS6mY98uFP+nZ4sxYgW7mEzWN
         /U2A==
X-Forwarded-Encrypted: i=1; AKwUvBylB9zGqohogR2VtrHXPOMY1UfFy4d05Fk8rNWjBmaMX6IDlzNkZa7dCLSa/W19zQbl2wuKr9us4CasfDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeVYNPQRvv8kq+P2fxruNYOQLwuV02GAza2uOgYGYh5ZAhv5IS
	Wnoz9Wt4zPW6BKn9HSGlqxOu1V8yC/LhnabzPCEnzuLKKqmZKNqe+Svp
X-Gm-Gg: AYBFou333GJo38pIBOqPIMyiIOea6pogYt8iixSOHplTSCB3JJ58owhx06z7oVPWMtU
	6tSMc34Yiid73n5/4FL3NfHdyWcVpLgwwhEQgmsVoBtqH/oue5etgMSID72vHAsv06I7xW3DXk9
	SUkKoqDDTQ4n+d4pRUi7g4WcJxU1bRDdxYSSBtL0qgWJirX6lZ0lV7jIqfVCTUTfK9IdThKPP//
	8nj/X4KnHgnd0ne3JDmy7IjqftZKX5PmS8TncajwAdEgj3L+QJHhbQebDyP6tjZ0pBHvGDp5kBi
	jJOlj3qOZM5MAJ5lB2rppu1PYM9BGptOiQGpkOIAHlidTiL6+lLwuYJlQSbjBy3usSOKepla998
	kxMD7ehJT0+8C7uFO0zgKyyR5oVQzgD5NwYIauf8aH0r/WY9PEj+jTVD8bRx/Pm6Wkza/ZAV3XE
	w8aFpsOUzwu0pJMC6rEiB2fEqLuZ+vg2fdsn6cEEjj4tPIzMkV+TMDW8sGEqkG5WThsYe6AAjoH
	VWQ8J59Cutye8cSg91KHe68+ypL1baDSxTp2DWQoXoWoHl0nE1PxpM8wWOY9w==
X-Received: by 2002:a05:6a00:4906:b0:89c:9569:93cf with SMTP id d2e1a72fcca58-89c9578e022mr1635155b3a.1.1791877598420;
        Tue, 13 Oct 2026 00:46:38 -0700 (PDT)
Received: from localhost.localdomain ([139.159.170.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89805c75343sm4459011b3a.38.2026.10.13.00.46.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:46:38 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Christian Hopps <chopps@labn.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/3] xfrm: transfer the skb->dev reference to the input path
Date: Tue, 13 Oct 2026 15:46:10 +0800
Message-ID: <20261013074610.17808-4-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
References: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vti_input() and vti6_input_proto() cache the tunnel pointer in the skb
control buffer without taking a reference.  With async crypto the
receive callback runs from the crypto completion, after a possible
device teardown, and dereferences the freed tunnel device:

    BUG: KASAN: slab-use-after-free in vti_rcv_cb

Taking a reference while the pointer is cached and dropping it in the
callback does not fix that: on the success path the callback drops what
may be the last reference before xfrm_input() hands the skb to
gro_cells_receive(), and taking a new reference on skb->dev at that
point is already too late, the device may have been freed in between:

    BUG: KASAN: slab-use-after-free in xfrm_input

Make the reference travel with the skb instead: the receive callbacks
install the device in skb->dev and leave their reference with it, and
xfrm_input() releases it once the packet has been delivered.  vti,
vti6 and xfrmi -- the only callbacks that replace skb->dev -- take the
reference when installing the device and drop it on their error paths.

Tested on arm64 with KASAN and an async AEAD: no use-after-free on
either completion path, and RTM_DELLINK on a VTI device with pending
async crypto now waits for the completion.

Fixes: df3893c176e9 ("vti: Update the ipv4 side to use it's own receive hook.")
Fixes: fa9ad96d4905 ("vti6: Update the ipv6 side to use its own receive hook.")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/ipv4/ip_vti.c              |  6 ++++++
 net/ipv6/ip6_vti.c             |  7 +++++++
 net/xfrm/xfrm_input.c          | 13 +++++++++++++
 net/xfrm/xfrm_interface_core.c |  9 ++++++++-
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index 3b80929994a0..1964482064c1 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -63,6 +63,8 @@ static int vti_input(struct sk_buff *skb, int nexthdr, __be32 spi,
 
 		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = tunnel;
 
+		dev_hold(tunnel->dev);
+
 		if (update_skb_dev)
 			skb->dev = tunnel->dev;
 
@@ -109,10 +111,14 @@ static int vti_rcv_cb(struct sk_buff *skb, int err)
 
 	dev = tunnel->dev;
 
+	/* Drop the reference taken in vti_input(); on success it is
+	 * transferred with skb->dev and released by xfrm_input().
+	 */
 	if (err) {
 		DEV_STATS_INC(dev, rx_errors);
 		DEV_STATS_INC(dev, rx_dropped);
 
+		dev_put(dev);
 		return 0;
 	}
 
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index ab94b3a4ba9c..a47acae4756c 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -322,6 +322,9 @@ static int vti6_input_proto(struct sk_buff *skb, int nexthdr, __be32 spi,
 		rcu_read_unlock();
 
 		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
+
+		dev_hold(t->dev);
+
 		XFRM_SPI_SKB_CB(skb)->family = AF_INET6;
 		XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
 		return xfrm_input(skb, nexthdr, spi, encap_type);
@@ -355,10 +358,14 @@ static int vti6_rcv_cb(struct sk_buff *skb, int err)
 
 	dev = t->dev;
 
+	/* Drop the reference taken in vti6_input_proto(); on success it is
+	 * transferred with skb->dev and released by xfrm_input().
+	 */
 	if (err) {
 		DEV_STATS_INC(dev, rx_errors);
 		DEV_STATS_INC(dev, rx_dropped);
 
+		dev_put(dev);
 		return 0;
 	}
 
diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index f293d5e124d4..bdd493f9d877 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -487,6 +487,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 	const struct xfrm_state_afinfo *afinfo;
 	struct net *net = dev_net(skb->dev);
 	struct net_device *dev = skb->dev;
+	struct net_device *tdev;
 	int err;
 	__be32 seq;
 	__be32 seq_hi;
@@ -767,7 +768,13 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			skb_dst_drop(skb);
 		if (async)
 			dev_put(dev);
+		/* Release the reference a receive callback left with
+		 * skb->dev, after the packet has been delivered.
+		 */
+		tdev = skb->dev != dev ? skb->dev : NULL;
 		gro_cells_receive(&gro_cells, skb);
+		if (tdev)
+			dev_put(tdev);
 		rcu_read_unlock();
 		return 0;
 	} else {
@@ -775,6 +782,10 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 		if (xo)
 			xfrm_gro = xo->flags & XFRM_GRO;
 
+		/* Release the reference a receive callback left with
+		 * skb->dev, after the packet has been delivered.
+		 */
+		tdev = skb->dev != dev ? skb->dev : NULL;
 		err = -EAFNOSUPPORT;
 		afinfo = xfrm_state_afinfo_get_rcu(family);
 		if (likely(afinfo))
@@ -788,6 +799,8 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			gro_cells_receive(&gro_cells, skb);
 		}
 
+		if (tdev)
+			dev_put(tdev);
 		if (async)
 			dev_put(dev);
 		rcu_read_unlock();
diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index 688306bf62c5..f4859be7ed18 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -375,11 +375,18 @@ static int xfrmi_rcv_cb(struct sk_buff *skb, int err)
 
 	link = skb->dev->ifindex;
 	dev = xi->dev;
-	skb->dev = dev;
+	if (skb->dev != dev) {
+		/* Reference travels with skb->dev; released by xfrm_input()
+		 * after delivery.  Guard makes a re-invocation a no-op.
+		 */
+		dev_hold(dev);
+		skb->dev = dev;
+	}
 
 	if (err) {
 		DEV_STATS_INC(dev, rx_errors);
 		DEV_STATS_INC(dev, rx_dropped);
+		dev_put(dev);
 
 		return 0;
 	}
-- 
2.54.0 (Apple Git-157)

