Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596709;
	b=GimIJF3kLcqMjgWFHcmlK2zN0GI+MLz3A34be+jPQ0+yLns+KoDAHGBpOcnZyUOdfhcn
	 V9XLGP1Qxfz1vJgz7wAuY/JHyLji0HWpoLiNuY5yJCPSDwL+uWSrzuoO+K7uOf5Ef16At
	 deo0o/GszTveV+u2XVNo8iSU8Z/UBl97ZCZtTMjWlKMhTDfahKzRK9LKBadFAt9JzR1Ic
	 oNbU5GXLJfqoYyZOF/JkqWFFdEz0jp8pxJarzvXcuvLnrAQPtzK2grbOJvEaJdtm8izRi
	 tHuTf6XKr8leXOWG44dcV9NroeTa57sK4E5Qjes2+fJQIAB4rPKZv8YEHYSmpMffJJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596709;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=P5x+xWRNF+UIFjIhMundH52vjybNRXC4bSlmjM77Jdc=;
	b=EqWhFwqVlVKRKT1DIns34/DKXjWcD6P9JXO+81G+o0/bilLbXIyDwtYmzJe2yi+LUkh2
	 iUNkyAwaUpLbZzwicgtO9uZ/Z5h6/B+mFpg3KO8poD8rbN0sGsHJSzCWDUQGF2Vm3E813
	 y0aiZ/4Th8u8zvnWY0FFELmoPXqiiB3XhASgOHstPxxrsuMQPqYTxxM4TLTfQ9Y0FwJS1
	 vOlRCCSv3U/coTK5SAypdl1RT4NG1ShEN8ebUnKLyt7uLF80B4RL+wISaf9a1ZUu5lD+m
	 wYrbkNfgAKrsOAL74SAB+qn3pq7ImjTkXqmx8fvsmbR7AqSOSUPmQnEjV1sKuhoEw/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JkV3EFj0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KAztVmth;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A76D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JkV3EFj0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KAztVmth
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792596707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=P5x+xWRNF+UIFjIhMundH52vjybNRXC4bSlmjM77Jdc=;
	b=JkV3EFj0lT6si7VkdZtcT4ygfCl/bXIK93AT68I8Z9w5Uvta3HeLMFdvGiBtqoAGZInGP1
	JZ4s3XWYZZwsloSSHZQ7QUlYTUIMoEFo2afBspjQpFnTLygFrM//L+TSqf1hmOF+W1Wxie
	5iafHSGZuzVKkuvVjq5Vrhl2SXNNUpY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-GKHEM4AlOkC44LzVUWoPGQ-1; Wed, 21 Oct 2026 11:31:32 -0400
X-MC-Unique: GKHEM4AlOkC44LzVUWoPGQ-1
X-Mimecast-MFC-AGG-ID: GKHEM4AlOkC44LzVUWoPGQ_1792596692
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so789971f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792596691; x=1793201491; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5x+xWRNF+UIFjIhMundH52vjybNRXC4bSlmjM77Jdc=;
        b=KAztVmthULosqd0CBNeH78dN5286Kvsd9qt4Te1fGVFUr/K0swbRbnjnVq8gJi/kVH
         1/NOzyw5ljd+ZeeMtslo9v+FlO0cAGEjifjz0wSx0bP3hEg7jF8bstSnLip7dmAOVxXk
         4GlyWlDix0QxBLbXavj191WzPQW27KB3tHQ5QgcqUxIDr/zXbUxQWwwY1wjO16pekyAh
         UYQkYLrzHak7gVs5ICl7f0Ejr5Gn6Ppbx/SuBIyqXX5dX2GHQ7fObtfwVMiheMcbOZUD
         bxWImMLvVT+MIIMv3CSKk0Txytqxt/dehdhB+AUR/ZYDNOjj3DnQHdI4PiRaZ6HBx3KK
         /ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596691; x=1793201491;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5x+xWRNF+UIFjIhMundH52vjybNRXC4bSlmjM77Jdc=;
        b=BUWt3agOtYsX7Xf1njDW43l1IZoWFpaG6ipHcb7mfxc2akfWDU4zfmMRzR6dBV38hQ
         Qdkq8mQccJvooxlbr4/0Y2A9VLdehDRr9AfSOzLSCIexr2egoVEPwEoVXkI7ZNETN5LG
         a1uV7b1lnyl89BWXisjzSkvVbRhOYlueVXYZFC1GU5OrE/tSrPTmcJhtWFY5smARNW4d
         O8PbVVG8aHiYuSLw6ofnrqjTDu8B4flZKurH3XMXEr0WMQYFwJoruxoBnD08t55QdVJJ
         QYB7vRrPvnpEZ0bzn5F1lszBevHCLp/9JiU7qNDn1ox9DLca7d5YD6m/FD+4Jowz/HZr
         vvqA==
X-Gm-Message-State: AFq9FYJ3O4pA3eMI2Ayp3C/JbXb6i5vYS0k6VAiO89hP5hN75kD0Pp16
	r2zthYDPrM8NDVot2UszMuRbaPnoDcB7Qw9WtXCRhGVXp51IpDNo52wdX3ngAbWDBo309DMYYhp
	v8uzKmkfhgd1mBGJHevu8I6pHIewUwH5/eJFOID94aPrCp3lDfauZADg0te50JaD/nXgsSo+Fh0
	6PsYMavoH660eI8F+9Qi6ti9fJp4iggDULVr8fA30rFNI=
X-Gm-Gg: AYBFou0aVsSLt4/bDbiZFWweKSitngHPhbST8Wz2ndAqbys04LNZ09k5FGx0iFGjXgT
	2Pqn1yBgvTQlZubPSnqtGcfge119HjlFk/V7HRSAoox/b+IBTwL9UX1Wf1i4jr8Hu/Gj/ZRvzoe
	yynOm1+tWaK0V05RAWLqFIhRaDqqBEUBhiKMfjaWef3nfVJsPtmmPL5r9Zf5xCSrPiBBUfEh7wk
	UzH/uIN5XeNc1HaInLw53mH9ELdx0UTxsOpnLrYo9pduEg5pMx3wOnF3VmEfOh1uuBKOwOm/AF+
	P3IaTSQXi48ba3TDAPkOAyUexjkOHVXviAlMfucZ1r5gU5WRFuBmp3d/LS0tQHNCvnE=
X-Received: by 2002:a5d:6f04:0:b0:48d:f72a:338c with SMTP id ffacd0b85a97d-48e264f8889mr5089891f8f.55.1792596691196;
        Wed, 21 Oct 2026 08:31:31 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:48d:f72a:338c with SMTP id ffacd0b85a97d-48e264f8889mr5089763f8f.55.1792596690386;
        Wed, 21 Oct 2026 08:31:30 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm6122348f8f.11.2026.10.21.08.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:31:27 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:31:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>, netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3] net: gso: validate transport header before computing
 segment length
Message-ID: <52b8bfe4ee848aff8ace47752352de486171d45f.1792596586.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
guard against exactly this since

commit a0dce8752193 ("net: Skip GSO length estimation if transport header is not set");

the GSO length validators never got one.

We used to, but we no longer allow such packets in: since

commit 44378d02c5aa ("net: always dissect GSO packets in __virtio_net_hdr_to_skb()")

the virtio net input path dissects all GSO packets.

But as a defence in depth measure, let's also check before we read: if
the TCP header is unset or outside the linear data, report the packet
as not fitting.  What happens to it then is up to the caller: the IP
output path segments in software, a forwarder answers with an ICMP
error, policers apply their exceed action.

No unprivileged path is known to produce one - IP input resets the
transport header to the parsed position, local delivery pulls data
exactly to it, and tunnel decapsulation clears it altogether - but a tc
BPF program can leave one behind through bpf_skb_adjust_room().

Found by code inspection.

Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
Cc: Willem de Bruijn <willemb@google.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Notes (changelog):
    v2->v3:
        address Willem's review: fix commit reference style in the log,
        say the packet is reported as not fitting instead of dropped,
        reject the ~0U sentinel in skb_inner_transport_header_was_set(),
        rename skb_gso_transport_header_ok() to skb_tso_transport_header_ok(),
        check the outer transport header as well when encapsulated,
        fix declaration order
        move the check to skbuff.h as skb_transport_header_linear()
    v1->v2:
        address Willem's comments, in particular, teach
        skb_gso_network_seglen() to return a negative error, and
        propagate through callers
        keep the offset signed and check for sign

 include/linux/skbuff.h | 30 +++++++++++++++++
 net/core/gso.c         | 75 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 95 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index a3ff380d43f0..6f33c014e568 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3041,6 +3041,13 @@ static inline bool skb_inner_network_header_was_set(const struct sk_buff *skb)
 	return skb->inner_network_header > 0;
 }
 
+static inline bool skb_inner_transport_header_was_set(const struct sk_buff *skb)
+{
+	typeof(skb->inner_transport_header) th = skb->inner_transport_header;
+
+	return th > 0 && th != (typeof(th))~0U;
+}
+
 static inline unsigned char *skb_inner_mac_header(const struct sk_buff *skb)
 {
 	return skb->head + skb->inner_mac_header;
@@ -3250,6 +3257,29 @@ static inline int skb_transport_offset(const struct sk_buff *skb)
 	return skb_transport_header(skb) - skb->data;
 }
 
+/* Is the (inner) transport header, as specified by
+ * skb->transport_header/inner_transport_header, in the linear data?
+ */
+static inline bool skb_transport_header_linear(const struct sk_buff *skb,
+					       unsigned int hlen)
+{
+	int thoff;
+
+	if (!skb_transport_header_was_set(skb))
+		return false;
+
+	if (skb->encapsulation) {
+		if (!skb_inner_transport_header_was_set(skb))
+			return false;
+
+		thoff = skb_inner_transport_offset(skb);
+	} else {
+		thoff = skb_transport_offset(skb);
+	}
+
+	return thoff >= 0 && thoff + hlen <= skb_headlen(skb);
+}
+
 static inline u32 skb_network_header_len(const struct sk_buff *skb)
 {
 	DEBUG_NET_WARN_ON_ONCE(!skb_transport_header_was_set(skb));
diff --git a/net/core/gso.c b/net/core/gso.c
index e96ef6350064..204ab9d08c18 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -131,6 +131,22 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
 }
 EXPORT_SYMBOL(__skb_gso_segment);
 
+/*
+ * TSO processing (but not UDP/SCTP GSO, which uses fixed header
+ * sizes) reads the TCP header as specified by
+ * skb->transport_header/inner_transport_header.  Make sure it is
+ * there to read.
+ */
+static bool skb_tso_transport_header_ok(const struct sk_buff *skb)
+{
+	const struct skb_shared_info *shinfo = skb_shinfo(skb);
+
+	if (unlikely(!(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))))
+		return true;
+
+	return skb_transport_header_linear(skb, sizeof(struct tcphdr));
+}
+
 /**
  * skb_gso_transport_seglen - Return length of individual segments of a gso packet
  *
@@ -140,12 +156,18 @@ EXPORT_SYMBOL(__skb_gso_segment);
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
 
+	if (unlikely(!skb_tso_transport_header_ok(skb)))
+		return -EINVAL;
+
 	if (skb->encapsulation) {
 		thlen = skb_inner_transport_header(skb) -
 			skb_transport_header(skb);
@@ -175,13 +197,21 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
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
+	int tlen = skb_gso_transport_seglen(skb);
+	unsigned int hdr_len;
 
-	return hdr_len + skb_gso_transport_seglen(skb);
+	if (tlen < 0)
+		return tlen;
+
+	hdr_len = skb_transport_header(skb) - skb_network_header(skb);
+
+	return hdr_len + tlen;
 }
 
 /**
@@ -192,12 +222,21 @@ static unsigned int skb_gso_network_seglen(const struct sk_buff *skb)
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
+	int tlen = skb_gso_transport_seglen(skb);
+	unsigned int hdr_len;
 
-	return hdr_len + skb_gso_transport_seglen(skb);
+	if (tlen < 0)
+		return tlen;
+
+	hdr_len = skb_transport_header(skb) - skb_mac_header(skb);
+
+	return hdr_len + tlen;
 }
 
 /**
@@ -250,10 +289,18 @@ static inline bool skb_gso_size_check(const struct sk_buff *skb,
  * skb_gso_validate_network_len validates if a given skb will fit a
  * wanted MTU once split. It considers L3 headers, L4 headers, and the
  * payload.
+ *
+ * Return: Whether the skb will fit.  Also false if the TCP header
+ * is not there to read.
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
 
@@ -265,10 +312,18 @@ EXPORT_SYMBOL_GPL(skb_gso_validate_network_len);
  *
  * skb_gso_validate_mac_len validates if a given skb will fit a wanted
  * length once split, including L2, L3 and L4 headers and the payload.
+ *
+ * Return: Whether the skb will fit.  Also false if the TCP header
+ * is not there to read.
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

