Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477134AA3F4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411097; cv=none; b=Pn3uRjakOba4zB02XDCRPk0gh5bURg0B3F6spd/EGS6URsYAjAWHTIUed/owgmFxnoqaig2FpehiB2KeW1y3Ka7epzASbGweyt6pQixGRz1WekuB6y8AipteFLAmCI3VGukaykejerNccGSBNW7ooe4B9lRWhzNTBIAlrFVA3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411097; c=relaxed/simple;
	bh=DzwW5JyASFKO5o0HYimeD4i5nfEK9kd3dgoVoMIc3V8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/bWE0vNwGOeyXaeB4kfdGyiTwRCEib8A8DlSJRViyr/yn13KxEH6OriOm7Yelc0iZbPhd5MuqW/w+hKfxbR9mHvinNymFY0p7K1Y06q0XO6+r5swD7eqbbsx8eYxSJ/cmrLyd2Nqdp4XDA80cOumT5BJGLQpwNfrq7Q51eBlC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GsLgADLX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gCKMBkHx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GsLgADLX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gCKMBkHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792411094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=0soTP8rwGVA/Y+n9XNjYC2vUcIBsp5X9RMWteJuwrj0=;
	b=GsLgADLXPdeGV67IEdfOkqOhUk16ATlN/asXPYMrpq8vq5rMT9MXqiB5a5oXG3lZehOqwY
	26DbhxDNB5GTrV2xFyLAXWKkMi67/P2DuaDgsZJnk+Eh+/3Gvz39moqBbv7vCibjFGZyjO
	oaNtaoqm4nI+B5SLiOBQ2Ygk+04Vzck=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-NLpD4pVJODOXEMhHSA55zg-1; Mon, 19 Oct 2026 11:58:13 +0000
X-MC-Unique: NLpD4pVJODOXEMhHSA55zg-1
X-Mimecast-MFC-AGG-ID: NLpD4pVJODOXEMhHSA55zg_1792411092
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso23260415e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792411092; x=1793015892; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0soTP8rwGVA/Y+n9XNjYC2vUcIBsp5X9RMWteJuwrj0=;
        b=gCKMBkHxbI1Jm0tVjPVO1MeAaJ+fmRBanxPAuZ+owXXmLt1mO9qgNJ2ChwdmPLVD4T
         f9qp/RoJ4ZW16RVd4K1gu9C2t4GYyeQC+yDbSbw2tsIc9E+koId2eblN3Sw2C7OZL3lu
         Bg5T+En+nWd3BjoQGsMclQcCr+uaduizKd69G2C6wsDFTOm0WAsiaXfFbqf0APpmzySh
         e1ENvmhT6XuDTKu9RYAx7qI1e9MC7H5/PrRlHUC7atAmoLmreYsOocLuOwUQjszvSA5v
         BVmL2nqQkHqWt/2Udk7bu2p3kRQgZuDIAVMUqVdUFD8wlKF/g3qTXqO5x9f8hYPaNfMB
         z6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411092; x=1793015892;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0soTP8rwGVA/Y+n9XNjYC2vUcIBsp5X9RMWteJuwrj0=;
        b=Fbf5yBIhrRInqe4Sc+5mH1Pp/pjpE2AsBFh9hSv2JaTC+zZEeHiarsvVL/DPjlq2yR
         zVep4ilCrTc+Pu2SXlBSjM09GJx074lIf533nEze1zH3HHamqJ71NMJ9llqNASCMQUn3
         4cSljDlBWjhBMg2udV+yaWN5dBpSP9W5XnJ6ldO/KfP0C/f4Fi3jJrpiwgVvBE+MnD3f
         HIodp9URkLGjUdPAufqcDaI5/Wwqhay+rzejPk8NeE3oBbKnVG7Wu3f5Ah3aPhJPVuu3
         nnMgjTE/H8BOxZkMezhznAGJi+ZrMymiZFjD4v973gCNwfAXnO+O/cuVNwJFgPsZavzo
         Ed+w==
X-Gm-Message-State: AFq9FYKbnzheTGlfThhqSzhB2PwIQM9uDYi8KmEOZ7cUu/EqlE6/BDF6
	YHTxUC88IbK01711lrejgcmHz9c/5wM5a7XQcTemGgVT7fEL0xu0EURPt8i/nCpKMHIRzNAECbb
	EJIOib95hFe8s0pnGljlXxnnMWKVbQ0Jr6LaUj3Ar+D7beFjQqEq6gRVmz8VRlPZv0LuHA1v5ID
	yKow6/+KW70yV/uh5s21mtrV7LZBH+T+kJKvmGC836Pm8=
X-Gm-Gg: AYBFou3qumotxvsd4CVIbL8SjITZLnMdr3WqFl8GopqmciohAEdoYuqBgWhb9haOhS3
	3bniabpCnmWWa3+2a6Uoss8kWTu6iVZsK+mPTCoFKUztAAQH3Em4uaSl/3GS/Qlw+GLgHvp5nze
	+PcKlibnik8L7CMhQpo9BdAuHJu9UP73kBGfRH1Mh1Zy6quLluwB/VwQA2s+Xaf5oCpz9Wtdjtq
	MZf6Lzy+M4ZkAJPclfMhM+phoRvvcASvRrSXrGBKJfRC3bOAYE3TeOATOKXXA41gyqOdIzoV5DH
	zrcFfl80AE2Xk+xyQ9zXGqklPCQ+qGS2UbwAargEPM8/Mv5bt8uIiE4slnLrlWcT8TvsEg==
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr145113505e9.15.1792411091614;
        Mon, 19 Oct 2026 04:58:11 -0700 (PDT)
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr145112855e9.15.1792411090867;
        Mon, 19 Oct 2026 04:58:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm222037295e9.2.2026.10.19.04.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:58:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 07:58:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Max Krasnyansky <maxk@qualcomm.com>, netdev@vger.kernel.org
Subject: [PATCH net v2] net: gso: validate transport header before computing
 segment length
Message-ID: <a53dbcdf068b3813689cf2359949578f627f9edd.1792410745.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

If a TSO packet is processed in the stack before a transport
header was ever established, the TCP data offset is read through the
unset header offset, far outside the packet.

This was demonstrated by syzkaller, back when the input path did not
dissect such packets: a virtio net header supplying a malformed
network header was enough.  Qdisc length estimation has carried a
guard against exactly this since a0dce8752193 ("net: Skip GSO
length estimation if transport header is not set"); the GSO length
validators never got one.

We used to, but we no longer allow such packets in: since 44378d02c5aa
("net: always dissect GSO packets in __virtio_net_hdr_to_skb()") the
virtio net input path dissects all GSO packets.

But as a defence in depth measure, let's also check before we read: if
the TCP header is unset or outside the linear data, drop it.

Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
Cc: Willem de Bruijn <willemb@google.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changes from v1:
- address Willem's comments, in particular, teach skb_gso_network_seglen
  to return a negative error, and propagate through callers.

 include/linux/skbuff.h |  5 +++
 net/core/gso.c         | 82 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index a3ff380d43f0..aa5bc608de06 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3041,6 +3041,11 @@ static inline bool skb_inner_network_header_was_set(const struct sk_buff *skb)
 	return skb->inner_network_header > 0;
 }
 
+static inline bool skb_inner_transport_header_was_set(const struct sk_buff *skb)
+{
+	return skb->inner_transport_header > 0;
+}
+
 static inline unsigned char *skb_inner_mac_header(const struct sk_buff *skb)
 {
 	return skb->head + skb->inner_mac_header;
diff --git a/net/core/gso.c b/net/core/gso.c
index e96ef6350064..874e4c8b1f1b 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -131,6 +131,35 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
 }
 EXPORT_SYMBOL(__skb_gso_segment);
 
+/*
+ * TSO processing (but not UDP/SCTP GSO, which uses fixed header
+ * sizes) reads the TCP header as specified by
+ * skb->transport_header/inner_transport_header.  Make sure it is
+ * there to read.
+ */
+static bool skb_gso_transport_header_ok(const struct sk_buff *skb)
+{
+	const struct skb_shared_info *shinfo = skb_shinfo(skb);
+	int thoff;
+
+	if (unlikely(!(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))))
+		return true;
+
+	if (skb->encapsulation) {
+		if (!skb_inner_transport_header_was_set(skb))
+			return false;
+
+		thoff = skb_inner_transport_offset(skb);
+	} else {
+		if (!skb_transport_header_was_set(skb))
+			return false;
+
+		thoff = skb_transport_offset(skb);
+	}
+
+	return thoff >= 0 && thoff + sizeof(struct tcphdr) <= skb_headlen(skb);
+}
+
 /**
  * skb_gso_transport_seglen - Return length of individual segments of a gso packet
  *
@@ -140,12 +169,18 @@ EXPORT_SYMBOL(__skb_gso_segment);
  * individual segments, including Layer4 headers (TCP/UDP).
  *
  * The MAC/L2 or network (IP, IPv6) headers are not accounted for.
+ *
+ * Return: the length, or a negative errno if the TCP header is not
+ * there to read.
  */
-static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
+static int skb_gso_transport_seglen(const struct sk_buff *skb)
 {
 	const struct skb_shared_info *shinfo = skb_shinfo(skb);
 	unsigned int thlen = 0;
 
+	if (unlikely(!skb_gso_transport_header_ok(skb)))
+		return -EINVAL;
+
 	if (skb->encapsulation) {
 		thlen = skb_inner_transport_header(skb) -
 			skb_transport_header(skb);
@@ -175,13 +210,21 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
  * individual segments, including Layer3 (IP, IPv6) and L4 headers (TCP/UDP).
  *
  * The MAC/L2 header is not accounted for.
+ *
+ * Return: the length, or a negative errno if the TCP header is not
+ * there to read.
  */
-static unsigned int skb_gso_network_seglen(const struct sk_buff *skb)
+static int skb_gso_network_seglen(const struct sk_buff *skb)
 {
-	unsigned int hdr_len = skb_transport_header(skb) -
-			       skb_network_header(skb);
+	unsigned int hdr_len;
+	int tlen = skb_gso_transport_seglen(skb);
 
-	return hdr_len + skb_gso_transport_seglen(skb);
+	if (tlen < 0)
+		return tlen;
+
+	hdr_len = skb_transport_header(skb) - skb_network_header(skb);
+
+	return hdr_len + tlen;
 }
 
 /**
@@ -192,12 +235,21 @@ static unsigned int skb_gso_network_seglen(const struct sk_buff *skb)
  * skb_gso_mac_seglen is used to determine the real size of the
  * individual segments, including MAC/L2, Layer3 (IP, IPv6) and L4
  * headers (TCP/UDP).
+ *
+ * Return: the length, or a negative errno if the TCP header is not
+ * there to read.
  */
-static unsigned int skb_gso_mac_seglen(const struct sk_buff *skb)
+static int skb_gso_mac_seglen(const struct sk_buff *skb)
 {
-	unsigned int hdr_len = skb_transport_header(skb) - skb_mac_header(skb);
+	unsigned int hdr_len;
+	int tlen = skb_gso_transport_seglen(skb);
 
-	return hdr_len + skb_gso_transport_seglen(skb);
+	if (tlen < 0)
+		return tlen;
+
+	hdr_len = skb_transport_header(skb) - skb_mac_header(skb);
+
+	return hdr_len + tlen;
 }
 
 /**
@@ -253,7 +305,12 @@ static inline bool skb_gso_size_check(const struct sk_buff *skb,
  */
 bool skb_gso_validate_network_len(const struct sk_buff *skb, unsigned int mtu)
 {
-	return skb_gso_size_check(skb, skb_gso_network_seglen(skb), mtu);
+	int seg_len = skb_gso_network_seglen(skb);
+
+	if (seg_len < 0)
+		return false;
+
+	return skb_gso_size_check(skb, seg_len, mtu);
 }
 EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
 
@@ -268,7 +325,12 @@ EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
  */
 bool skb_gso_validate_mac_len(const struct sk_buff *skb, unsigned int len)
 {
-	return skb_gso_size_check(skb, skb_gso_mac_seglen(skb), len);
+	int seg_len = skb_gso_mac_seglen(skb);
+
+	if (seg_len < 0)
+		return false;
+
+	return skb_gso_size_check(skb, seg_len, len);
 }
 EXPORT_SYMBOL_GPL(skb_gso_validate_mac_len);
 
-- 
MST

