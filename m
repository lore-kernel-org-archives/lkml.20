Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063B3BBFD8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893428; cv=none; b=Mg2Tpv262V8mk0+IsmBxwYn+TXsCmdBJCFjs9RjkudmtNfegv1AgE6FNd5kZhYkuJ/i+O/oo5fCkWE+diZqNE6w+DXNDb47cM19w8OL+8jQ24ZPIm4KW6RnUFzc1J0P/GayOMyVMK/CpNMXJ4tcb1Su5lAE5zqfaknOtV9L6a/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893428; c=relaxed/simple;
	bh=qk+C6DdEOtOFVsoBZ8UwNfwH8Ny9qDUJK744db+wjDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ai/aeQXhLc+pF/n3WO74WJprfVjhxk3jDfg82WgkjJ8WrRdocY5/zYYpzcb9G+SxD5O8CS4N/y/HsVSr7Y50TMOUl9U5hDaxbr7fpayWA9d2qZWnIWHDog+hIJKymzs2LsptDg7svEmdQZEtVcfR2nRnAUdk1WkKftMVomtLAv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=eUv6I4sg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VKkdsWtR; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="eUv6I4sg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VKkdsWtR"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 58DB07A0098;
	Sun, 20 Sep 2026 04:37:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 20 Sep 2026 04:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789893426; x=
	1789979826; bh=VAy4dxQvBffRSDgtpZCyFUnEL4L5AX1ag2tM7IHI1VA=; b=e
	Uv6I4sgmc1ex/x3FRIajPpy3URg/V4wDliC1UDqpl9KYOVH8Eou9Dd9J/zUGRDUF
	jZRsQrqanjXTvve5W32ts7BYWJkqlPNq/vD0dd6xbAnnCKI7jHxAJOGhDPJf9Z5m
	gyY8NMpf2ezPBzGeoFoTx7zyPap+WSnlXmpPSe8bzqaBqwRR4fbaKNaZrHwmJf2N
	OLVmYX7/yJiH12PQ7koU8F1Tj42uDFBk6N1EBTXb7449LfLQMZl/1VaWMlqPouEO
	nvFFKdUFwKgQdfs2sUv0NhOLtDyaH9wT0HVpQuSxRpjF2WpxpFoOdKq+HpHvdcHA
	o+jUBVajNzYazQnVswLxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789893426; x=1789979826; bh=V
	Ay4dxQvBffRSDgtpZCyFUnEL4L5AX1ag2tM7IHI1VA=; b=VKkdsWtR1XoORQv4Q
	ZCg+sJRfDvpy3mGBqIWbJa/ZKrIAcuXKhdD99xt7b2WRZiosBOZmrwysf8jbiPoj
	Yz8Bow0Jk4kmMpre9ToVlQSaRaGukxQtycRhyRAslqGe70MrWQRM5nMofx+pA21F
	+zeJMKgW+KSA+48jgJ2z/2jaIPSIAHOH9FWsOYirJ3HNVqgAttvthFKGoJ+ib0d9
	C2HMWe5BkVHd5I16hpGMtSYysvhcMHCZ8YDDzsj3gBv2Zi4g4S0qlXuqDb8OSwpZ
	X0ViwdAQCqyM7oBNwpcV+tl3CI31exccMb+dNVDS1s4w0piv0zcEe1ExC4RHEon5
	TnREg==
X-ME-Sender: <xms:MpuvakYOFynQiWiMBnLenCHCuaPBzTo5FBXiEENnGgBhkzcyUNGu8w>
    <xme:MpuvatVABjo0zVb4XpXNAkyjHzIcrFf2BR0v4ZGkbAd64zj-XF4IDXV2VGrrgeW61
    PvlpaJ-ZDf8LCFhLF4_4kFc6bdf5eCnsBTGADKiJsw2QCPYuOEoBaNl>
X-ME-Received: <xmr:Mpuvamh2C7fJzcKrw6qbrRS1fSZLbIvhRd13HP4iv5RMyL_SIyBbCun04Hj-M7KCC2q9w92isoA51sf3ItaAh0gRHqEb7c-uI4Vb4S6nTpnVFQ>
X-ME-Proxy-Cause: dmFkZTGDk/LFpyNUjatZXtdF1Ol4AzGXx/XJJ00P2lEzdhwaC2OHMWKjSTTwzDV54eA+X9
    hZWqO2Pt/aL/IC2w3tQSr/WTF4eOkuQx9cqr/0YQjP0U9qRxKTeqqjpjHmtjKI87XBl9+k
    lkd5l3xFN7T6QNoFdRqVZKYZ1HWzIwBUYfdAsZeZatUOA0ZPe1QtaXNtpb/kZMyNG2cCW0
    AkYYFkNOpR9jWdo4iKO92TpJWkC9Ldvc/R2dYRYBWP9D0fI6R6CxUwbd23p5Y6XPLXkugf
    TZapV8K2F20wWYZVer0gd5Qw3eZniou/ncwHg8BB5HxRPprNSXyj1Vu1JJpcJt8AGbY0hP
    gWDMCdhsNrmukiD/e932BTXetrlugJfjs0zZeCdx4VVhF/RCW6NH4aZHIB7Nqk7yszoLxG
    TuGXbMIEkYi2IIdK++bv4d3djFKyxX3eGYCzVUAt+1+hUF9qjdXXP6oOOq3XPO51M4jc7f
    Nuja5vCX8FQD1JOEAJaWHmZqxTq5v/bUXsKB9Uf2qtVT2oqVibRoj9ck/lQ0XRJaunxxwu
    2YN0RSQW6S1zbRQWGZHGa8NVxPUZpeRll69FZZqGPvdjFCrRf4g3C1FGjRJz8EC2KqIViu
    tPpSgB26djrcKNZXK3E16GtXBaDim+bZ6VlHTk/NQwHEZ/ff+mNhpCERtDzg
X-ME-Proxy: <xmx:MpuvarXFujErodk4qAp-AJIW0Tfsob_45XNeRqUOMYpPvtFBi-3A4g>
    <xmx:MpuvatN-lw4rRdSp-XgnaCDW-29lgVBBPflNLKEwO0jaEsaqjcU7dA>
    <xmx:MpuvanaJyOhsyfICEUjjq2sl9R_f3hJcSuz0ra16x3p3IGRch4DUQA>
    <xmx:MpuvapqTKIqdCrAAlwu7dJsg4YCn6INONd87-9IyrDnPirwKCPQR7w>
    <xmx:MpuvapM5Fjl2jPvvXxkI7Trn0b2eJWzvZ1EkkpV3ZBJtit1NtX6gPjDn>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 04:37:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] firewire: cdev: use mutex for phy receiver list
Date: Sun, 20 Sep 2026 17:36:56 +0900
Message-ID: <20260920083659.191855-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
References: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the cdev layer, the list of phy packet receivers is currently
protected by a spinlock. This requires GFP_ATOMIC for memory allocation
when enumerating the list in fw_cdev_handle_phy_packet(). However, the
function is guaranteed to be invoked in process context, so GFP_KERNEL
can be used by switching from the spinlock to a mutex.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 6d91a6e7ad0d..3dd8ea1991b0 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -47,7 +47,7 @@
 #define FW_CDEV_VERSION_AUTO_FLUSH_ISO_OVERFLOW	5
 #define FW_CDEV_VERSION_EVENT_ASYNC_TSTAMP	6
 
-static DEFINE_SPINLOCK(phy_receiver_list_lock);
+static DEFINE_MUTEX(phy_receiver_list_mutex);
 static LIST_HEAD(phy_receiver_list);
 
 struct client {
@@ -1751,9 +1751,7 @@ static int ioctl_receive_phy_packets(struct client *client, union ioctl_arg *arg
 	if (!client->device->is_local)
 		return -ENOSYS;
 
-	// NOTE: This can be without irq when we can guarantee that __fw_send_request() for local
-	// destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irq, &phy_receiver_list_lock)
+	scoped_guard(mutex, &phy_receiver_list_mutex)
 		list_move_tail(&client->phy_receiver_link, &phy_receiver_list);
 
 	client->phy_receiver_closure = a->closure;
@@ -1765,18 +1763,14 @@ void fw_cdev_handle_phy_packet(struct fw_card *card, struct fw_packet *p)
 {
 	struct client *client;
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for local
-	// destination never runs in any type of IRQ context.
-	guard(spinlock_irqsave)(&phy_receiver_list_lock);
+	guard(mutex)(&phy_receiver_list_mutex);
 
 	list_for_each_entry(client, &phy_receiver_list, phy_receiver_link) {
-		struct inbound_phy_packet_event *e;
-
 		if (client->device->card != card)
 			continue;
 
-		e = kmalloc(sizeof(*e) + 8, GFP_ATOMIC);
-		if (e == NULL)
+		struct inbound_phy_packet_event *e = kmalloc(sizeof(*e) + 8, GFP_KERNEL);
+		if (!e)
 			break;
 
 		if (client->version < FW_CDEV_VERSION_EVENT_ASYNC_TSTAMP) {
@@ -1943,9 +1937,7 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
 	struct client_resource *resource;
 	unsigned long index;
 
-	// NOTE: This can be without irq when we can guarantee that __fw_send_request() for local
-	// destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irq, &phy_receiver_list_lock)
+	scoped_guard(mutex, &phy_receiver_list_mutex)
 		list_del(&client->phy_receiver_link);
 
 	scoped_guard(mutex, &client->device->client_list_mutex)
-- 
2.53.0

