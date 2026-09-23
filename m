Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA846A61D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150349; cv=none; b=oECkavQ8vUJL/Hqq3QS4rnr8KclPbyhMSqDinKQZOnmWVPP2JsMO4QEC8zc55r99gdTbejs1P9jnmjD5ebQTjR3rDV5w2LazlE6r9RXvEbIKkWqyqV9No5oWvu/D0VDOeszxlctMdwXeihQRWxUFwLskNIZdtmqEhP+cSV4SciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150349; c=relaxed/simple;
	bh=yyJfPPAEIt/EVKO+2+O8gepOzQn6BvxvOS8WipJumGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mNNq1DXelmnkfJCErW+rh3+eNoQmR/6K/vMVYStKmAEG9PSTerLtQUcTxAzdc8ccPE1cGEcoQZe5o8Kegzjd6XlcXeC3EvhZiKsqp/80TWjdubhmGTdBt/+6ezrULy562OIWw1yu/YiviQrdTC88okJbzC19RqnQgcZpGfOP/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kH1covcu; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kH1covcu"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so717835a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150347; x=1790755147; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vLJZPmEwAEYLI74+W02hyeGgNOZF691D2NvOqlwqxA=;
        b=kH1covcuN8riMyj9vWAexE1+pnGqCjpXt9RY+vpfJQV/oNvVS8eWhx4yn2pLStJqa3
         S/YaUgFDZQitI3A7p1Q1p5EsBK7T90H8p7zTVT4KrfNHlbBPmvpBX8MjtwuiYfk9BeOG
         zXwrKaJDQ6TyEiw6ZGzpoEVrGOkVXn1GmOd4DOWEOXrJ7mN+cSn4nwIMOdQAf729c8yh
         Jr0XrAx4Nf6gkaGJIMM+hptM1E+0mRdwT+R5g+Y+cFUc0uMkMZ7EPu69ws6SbIzv0oRm
         Evb4kyy/OLUQFMhxq9a/LggY2/PXGwNFt+GW/VXDXhbqNPRQbXi+q1EnI/yPsuFAc+8O
         h4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150347; x=1790755147;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vLJZPmEwAEYLI74+W02hyeGgNOZF691D2NvOqlwqxA=;
        b=rUNet7NOP6e03/h2H6G9HvROViLGSgrj5ojOVjz4X4kmXoEUzShO8LYJIbvbXxPjVV
         isi1vsKx0Pq+hh4C52MRC8B5VF2ofaUfSue0Pjrhc3nMFUqfPC8rv4zy/qk5P41PSEuO
         udu2IDDmitYog/U+dc6yMFdvtXD053vqNBoytq/ctmqiEtrpsG0pDGJneAk2yOP1WiMY
         qIFwB4N0S9a0aLv0D6q6sXebpRNaiaOYJMD3Wa1y6ZjWFWynTNdpiiak7imRtx/vc6jB
         Won6rVgDNgQQYBfvPOtyKkVOtB2W+YhEOlBYJ7ZuRkK/cT6mtLH5Y/5l35+MCZu4cUec
         XETw==
X-Forwarded-Encrypted: i=1; AKwUvBzlwtawGgIiwhLX6b3XzML7XAxMgdQprgX7SHnNI5n+zu5KCgJo/OfubkG6e6byeSC+NUn1BQoaNihZnao=@vger.kernel.org
X-Gm-Message-State: AFuF++kFH0sgcbPhiixI9Sb2wWwnFBtfgHZiIsy+KzpCEhlDMV2lPEOh
	ZZaz2uOfS/FK303njjQOUuVbAtN+LnOWDQePaYymEQeoKvZk2NjP09mxrtz8jGgJuTD9CDJ/grm
	uDPwHHA==
X-Received: from pjbmy12.prod.google.com ([2002:a17:90b:4c8c:b0:3a0:77da:6ec2])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fc6:b0:39d:f4fd:8075
 with SMTP id 98e67ed59e1d1-3a07e5ea295mr1605582a91.19.1790150346825; Wed, 23
 Sep 2026 00:59:06 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:58:36 +0800
In-Reply-To: <20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790150341; l=3802;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=yyJfPPAEIt/EVKO+2+O8gepOzQn6BvxvOS8WipJumGw=; b=G1ypuZYU8ICSu62zcu8z/GGCNpTHCpG0L+6Kp5XGF1sx4s8/1GQtGthUFk+WfGsVHSA7onAxL
 g5H1RyMRymoCZPOP5GXmkorDSpB71ifmVE3tuk/diGjja3MXYt6rGoV
X-Mailer: b4 0.14.3
Message-ID: <20260923-u-ether-gadget-npe-v1-2-ff466c55ecc0@google.com>
Subject: [PATCH 2/2] usb: gadget: u_ether: Protect dev->gadget access with dev->lock
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Faqiang Zhu <faqiang.zhu@nxp.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Commit e002e92e88e1 ("usb: gadget: u_ether: Fix NULL pointer deref in
eth_get_drvinfo") added a NULL check for dev->gadget in
eth_get_drvinfo(), but the check and subsequent dereferences are not
serialized against gether_detach_gadget(). If unbind clears dev->gadget
concurrently after the NULL check, eth_get_drvinfo() can still
dereference a NULL or freed gadget pointer.

Extend dev->lock to protect dev->gadget across gether_set_gadget(),
gether_detach_gadget(), eth_get_drvinfo(), and rx_submit(). Also use
gether_set_gadget() in gether_setup_name() for consistency.

Reported-by: Faqiang Zhu <faqiang.zhu@nxp.com>
Fixes: e002e92e88e1 ("usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo")
Fixes: ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with device_move")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 043b4ec80808..2a9ae598e612 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/gfp.h>
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
@@ -54,8 +55,7 @@
 #define GETHER_MAX_ETH_FRAME_LEN (GETHER_MAX_MTU_SIZE + ETH_HLEN)
 
 struct eth_dev {
-	/* lock is held while accessing port_usb
-	 */
+	/* lock is held while accessing port_usb and gadget */
 	spinlock_t		lock;
 	struct gether		*port_usb;
 
@@ -113,6 +113,8 @@ static void eth_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *p)
 
 	strscpy(p->driver, "g_ether", sizeof(p->driver));
 	strscpy(p->version, UETH__VERSION, sizeof(p->version));
+
+	guard(spinlock_irqsave)(&dev->lock);
 	if (dev->gadget) {
 		strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
 		strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info));
@@ -145,7 +147,7 @@ static void rx_complete(struct usb_ep *ep, struct usb_request *req);
 static int
 rx_submit(struct eth_dev *dev, struct usb_request *req, gfp_t gfp_flags)
 {
-	struct usb_gadget *g = dev->gadget;
+	struct usb_gadget *g;
 	struct sk_buff	*skb;
 	int		retval = -ENOMEM;
 	size_t		size = 0;
@@ -153,6 +155,7 @@ rx_submit(struct eth_dev *dev, struct usb_request *req, gfp_t gfp_flags)
 	unsigned long	flags;
 
 	spin_lock_irqsave(&dev->lock, flags);
+	g = dev->gadget;
 	if (dev->port_usb)
 		out = dev->port_usb->out_ep;
 	else
@@ -788,8 +791,7 @@ struct eth_dev *gether_setup_name(struct usb_gadget *g,
 	net->min_mtu = ETH_HLEN;
 	net->max_mtu = GETHER_MAX_MTU_SIZE;
 
-	dev->gadget = g;
-	SET_NETDEV_DEV(net, &g->dev);
+	gether_set_gadget(net, g);
 	SET_NETDEV_DEVTYPE(net, &gadget_type);
 
 	status = register_netdev(net);
@@ -890,10 +892,11 @@ EXPORT_SYMBOL_GPL(gether_register_netdev);
 
 void gether_set_gadget(struct net_device *net, struct usb_gadget *g)
 {
-	struct eth_dev *dev;
+	struct eth_dev *dev = netdev_priv(net);
+
+	scoped_guard(spinlock_irqsave, &dev->lock)
+		dev->gadget = g;
 
-	dev = netdev_priv(net);
-	dev->gadget = g;
 	SET_NETDEV_DEV(net, &g->dev);
 }
 EXPORT_SYMBOL_GPL(gether_set_gadget);
@@ -915,8 +918,10 @@ void gether_detach_gadget(struct net_device *net)
 {
 	struct eth_dev *dev = netdev_priv(net);
 
+	scoped_guard(spinlock_irqsave, &dev->lock)
+		dev->gadget = NULL;
+
 	device_move(&net->dev, NULL, DPM_ORDER_NONE);
-	dev->gadget = NULL;
 }
 EXPORT_SYMBOL_GPL(gether_detach_gadget);
 

-- 
2.55.0.1082.g2b9226bbc0-goog

