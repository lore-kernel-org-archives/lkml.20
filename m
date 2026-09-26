Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81A357CFB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421572; cv=none; b=iowEq7qL8ms75RhRaDbBQpQ8B0pRLXx46s79Uh2Zgv7AvjowJsUzcUzD4wwRBNBj0OmXRoA9thJOi73RiA9Q+U3INUu2ciXzkuXAJ++0o1ypcytlNExL45ZyXbcfRP6Rzd68Lz5ZPW74JECYj2y6Rf9d3Kppk/0oFDtvUxAC5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421572; c=relaxed/simple;
	bh=Lww05ZAzWz07fyBBS1Asgti4qwtQR2M2hFx3NPJelho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V1eKNVqFJMiMFfqVKbalEAQ3rpD9sFbRMSTLK72MQI2PkV1ygKjzZGEM5q//zSpiIofKPNLHJ29qFjBcj0bsNOlI+2I/zHi+sqT+bds/Juk3IExfxZMX7UvGuuBYTehbrcJvF+Hk1gkV+bdyqRUtomXF//bjUXSeV0Dhkgm1uo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGcClpWs; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGcClpWs"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1166462a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421571; x=1791026371; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qrMJ0YsFDHzrc+kmXrsiVTStKnHMXKnt5ySd1IaBrc4=;
        b=PGcClpWsP0DM2fAOrFHARMOK1NhObMLjL7nH8gC/775DPZxs6vKsVPplkjo6QlVvKD
         AzahIBK2asAdxQCt7o4lJsW2dWH9laKzt/wi+/xSueLTkHrkTSy/XQWC6xdPwlLP8J+U
         mWGCYFln4lr5RYIUlaMpWU/fqiqnKY0lXPiYDFdVLh4EF4W+d9kL3a25u5+/PRRYARNx
         W+7vJ6ZdDnvbTb+nB/1Mf5qaTCnjC6R49vg5PSNqnoz4UY8RU1F9r3tCoAlsaUdcxAqH
         h/wdNF2ujhdBpRDu8QhwmVuH8ytp/MT6R9qOwqPhgv38JxTv6u3uziGR2oY/F0DsSwdW
         ZZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421571; x=1791026371;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qrMJ0YsFDHzrc+kmXrsiVTStKnHMXKnt5ySd1IaBrc4=;
        b=UfSga8F6O3w8Xsd19hySyCUj0U6RcScPgynzCN5/LnVykHOV2McllhqDGsx3P7vcdM
         iHAXjjAaa+uGTs6gxemU3CTgHytHKEmxw7d/fecL6UlZHXYl7EBSX1rHLiPiUn+y8ft9
         8m1+bYy4bKy4dcp/pILYcZqLUqw0jaxIk+T8ClDzCh3mgPz9NV45ba7QZwh8nQiID0AA
         jjMvpRMaJ0BcN54oh7/Y+LmGfjfGz/QlMFmcxaJV9cGQ+dnSF/udk/FNKQQ1wXu3eSO8
         7et+jsaLqC+UQK7o/ViyeVhHi+zPOaRplfATKusEqBBeL20HqEjjupuclrETnXroRH9B
         j3TQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2UUOI7ybQBuTCdNI94EWYXuHwzyDnwYesgqPWwJvib4NG6pJe0Phd1tVqNuyX+MbiRDsB9JyNh6Y60zU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv2CoqnLIAT9EYMNBvakWWWxoHII35feyuSLHTmaP6sZ3ncQV9
	dPwcAOwUAbOGYvUPxA7vipTvIWldkuCEdnRUhsXaBGwk213lDS4nAH7m
X-Gm-Gg: AYBFou3LqUkhm4UomGr1xYUzrnuxIZDNNqFZHjbEn8AOZhciG+U5WnKIBQsaAkNu5Cr
	FqtTNTnS5yiataOpZ91VPFIgxMb/YaizdhWHXeY9Y09N1kL2CBDoF3gWpqPpIZeXmd3L02B4uPC
	Ayv+HHHVheF7BHcKOhDw0h/PkpAF4T+WQxDypVbxT5GV0zJd+32jlZzzGBxf016FEjwzlhC/X/X
	soRuD0+ML67ykTc+NaFE7EEoiHj0aQWEM/L7UA9MV5KhBFPl8faQp+y/SEP9CTkhsKCx81jX8BX
	CXg0qi2pByqSLNQTHGT8BYvqrC4K8rh+1w9ZeqSBYJw4q/G0Zftrz6z0DAgjrh5ZWmiJ1TF4Ipf
	bpv5Qh0tYKvx1kIwIW8bYiCcn9lznNxRyfBlCz/O9iNEHx3G6+Sszq169fETgLYvhU5anNZF2yI
	a/z86XX5otKWYBNg7ITF7E/FQa6ib0ok4OFYtPDkC97+EaOdjEzy6KtZWZxmvOAj4ClbKdItpCh
	QYUjS1/
X-Received: by 2002:a17:90a:10cf:b0:3a0:b7b4:b649 with SMTP id 98e67ed59e1d1-3a0b7b4ba36mr3032731a91.52.1790421570582;
        Sat, 26 Sep 2026 04:19:30 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589bbfsm9595972a91.9.2026.09.26.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:19:29 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Sat, 26 Sep 2026 20:19:27 +0900
Subject: [PATCH net v2] seg6: fix HMAC validation when an extension header
 precedes the SRH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-seg6-hmac-transport-header-v2-1-8087b76f6375@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD6qt2oC/4WOyw6CMBREf4Xctde05RFw5X8YFn1caI1Q0laiI
 fy7gO5dzuTkzCwQKTiKcMkWCDS76Py4BXHKQFs59oTObBkEExVrhEBVYKS+QjtIjSnIMU4+JLQ
 kDQUUvKxZUatC6Qo2xxSoc6/Df4ORErTfMj7VnXTazTtmXUw+vI8XMz/g32D+Z3DmyDGXVJdGs
 86o5toP0j3O2g/Qruv6AdhfmVrhAAAA
X-Change-ID: 20260922-b4-seg6-hmac-transport-header-2158048b4bc6
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, David Lebrun <david.lebrun@uclouvain.be>, 
 Ahmed Abdelsalam <amsalam20@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5383;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=Lww05ZAzWz07fyBBS1Asgti4qwtQR2M2hFx3NPJelho=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqt6o/vhL0NINjeQJyM6BskYTOs7UokyoXsEDBb
 8MTdPXGhMyJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCareqPwAKCRAq19F1Kl0b
 Tb29EACUo8C+jJdTlLC33sXyIHv3vjFPcedpZ81zMwBNGAkh+iV6Zg3AO+tT6XVlFAor7Ph3Wgn
 jOr6KFvu1thbV+las6W9Me2qEDMYD1gQ1M3wbBd3tk6W2+SgPj2SP0ilcil3qyPOSWSRmKWOWaA
 QbWM0SZuJ9zWQJxhIL8OQogg0Uuz4Zus2eg+Z+Ik5WLBWh94ig1WlfCScxkjoMwBWCWsatK/c+/
 87M//ka1b/wCBMNVLp0TVDSL9+XXgKP4qvEgFZseZxYnljncRBSssVUr2kwIVGfJ9JTz/KbZycv
 kQFts63T1t11cyCf+2r8Acd8IXtujSHvZPWpYAdFpglhFrd1qOBxUvd5k1vCbkK5m/ZntKMME/h
 /v83ME9tRPyekf+49sjDY8WzoZDm3sCnNz6NxRacUXd8X/heNl9goGAt0IkMIrldfZlCMZy2gcD
 dBcRw8xMXqB7x0QU6etrKFMcP0z1x0ydRhYCQReu7tDsHO8D5V4tG/OmtdjcSjoTxJYF0JDC5lV
 y0JCLObqQDaK2XvOpiFgFKQpJm0650f63WZrQeTugLs1YSVi7aHWapzmNawnMHBmLMMIfEApWQ3
 1Gg0WJ0w5//0LQ5zPEYSDvRgf7qlaOpDNu6Ho1CWTYQeIU6Y39r/us9ePloDiZXXBCRNNvWloMu
 3epWtfs2fXDSM/g==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

seg6_hmac_validate_skb() derived the SRH from skb_transport_header().
That only holds while the two coincide, which is not true on the
seg6_local input path.

ip6_rcv_core() leaves the transport header just past the IPv6 header.
A Hop-by-Hop options header is consumed before the route lookup and
advances it, but a Destination Options header is not: the seg6_local
lwtunnel is entered through an input redirect from the route lookup,
which bypasses the extension header handlers. The transport header
then still points at the Destination Options header while
seg6_get_srh() has located the real SRH further down the chain.

The HMAC is therefore computed over the Destination Options header,
and a packet carrying a valid HMAC TLV is dropped when
seg6_require_hmac is set. Such a packet is legitimate: RFC 8200 allows
Destination Options before a routing header, and get_srh() has walked
the header chain since commit 5829d70b0b6c ("ipv6: sr: fix get_srh() to
comply with IPv6 standard "RFC 8200"").

With a Fragment or an Authentication header in front of the SRH, the
same mistake also reads past the data pulled by seg6_get_srh(). This
happens before seg6_require_hmac is read, so the default configuration
is affected.

Reproduce by giving a node a seg6local End SID with
net.ipv6.conf.<dev>.seg6_require_hmac=1 and a key installed with
"ip sr hmac set <keyid> sha1", then sending

  IPv6 -> Destination Options -> SRH (carrying a valid HMAC TLV) -> payload

to that SID: it is dropped, while the same packet without the
Destination Options header passes.

Fixes: 5829d70b0b6c ("ipv6: sr: fix get_srh() to comply with IPv6 standard "RFC 8200"")
Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Changes in v2:
- Describe the out-of-bounds read reachable with a Fragment or an
  Authentication header before the SRH (Andrea)
- Link to v1: https://patch.msgid.link/20260923-b4-seg6-hmac-transport-header-v1-1-3ae85dc0fdb9@gmail.com
---
 include/net/seg6_hmac.h | 3 ++-
 net/ipv6/exthdrs.c      | 2 +-
 net/ipv6/seg6_hmac.c    | 5 +----
 net/ipv6/seg6_local.c   | 6 +++---
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/net/seg6_hmac.h b/include/net/seg6_hmac.h
index e9f41725933e..3161a8104b89 100644
--- a/include/net/seg6_hmac.h
+++ b/include/net/seg6_hmac.h
@@ -48,7 +48,8 @@ extern int seg6_hmac_info_add(struct net *net, u32 key,
 extern int seg6_hmac_info_del(struct net *net, u32 key);
 extern int seg6_push_hmac(struct net *net, struct in6_addr *saddr,
 			  struct ipv6_sr_hdr *srh);
-extern bool seg6_hmac_validate_skb(struct sk_buff *skb);
+extern bool seg6_hmac_validate_skb(struct sk_buff *skb,
+				   struct ipv6_sr_hdr *srh);
 #ifdef CONFIG_IPV6_SEG6_HMAC
 extern int seg6_hmac_net_init(struct net *net);
 extern void seg6_hmac_net_exit(struct net *net);
diff --git a/net/ipv6/exthdrs.c b/net/ipv6/exthdrs.c
index 09a4552f7f08..3ef3c2635581 100644
--- a/net/ipv6/exthdrs.c
+++ b/net/ipv6/exthdrs.c
@@ -387,7 +387,7 @@ static int ipv6_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
 	}
 
 #ifdef CONFIG_IPV6_SEG6_HMAC
-	if (!seg6_hmac_validate_skb(skb)) {
+	if (!seg6_hmac_validate_skb(skb, hdr)) {
 		kfree_skb(skb);
 		return -1;
 	}
diff --git a/net/ipv6/seg6_hmac.c b/net/ipv6/seg6_hmac.c
index e6964c6b0d38..bd2704d4c7a0 100644
--- a/net/ipv6/seg6_hmac.c
+++ b/net/ipv6/seg6_hmac.c
@@ -173,13 +173,12 @@ EXPORT_SYMBOL(seg6_hmac_compute);
  *
  * called with rcu_read_lock()
  */
-bool seg6_hmac_validate_skb(struct sk_buff *skb)
+bool seg6_hmac_validate_skb(struct sk_buff *skb, struct ipv6_sr_hdr *srh)
 {
 	u8 hmac_output[SEG6_HMAC_FIELD_LEN];
 	struct net *net = dev_net(skb->dev);
 	struct seg6_hmac_info *hinfo;
 	struct sr6_tlv_hmac *tlv;
-	struct ipv6_sr_hdr *srh;
 	struct inet6_dev *idev;
 	int require_hmac;
 
@@ -187,8 +186,6 @@ bool seg6_hmac_validate_skb(struct sk_buff *skb)
 	if (!idev)
 		return false;
 
-	srh = (struct ipv6_sr_hdr *)skb_transport_header(skb);
-
 	tlv = seg6_get_tlv_hmac(srh);
 
 	require_hmac = READ_ONCE(idev->cnf.seg6_require_hmac);
diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index d1070aec7b72..67eeb27ee43a 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -222,7 +222,7 @@ static struct ipv6_sr_hdr *get_and_validate_srh(struct sk_buff *skb)
 		return NULL;
 
 #ifdef CONFIG_IPV6_SEG6_HMAC
-	if (!seg6_hmac_validate_skb(skb))
+	if (!seg6_hmac_validate_skb(skb, srh))
 		return NULL;
 #endif
 
@@ -239,7 +239,7 @@ static bool decap_and_validate(struct sk_buff *skb, int proto)
 		return false;
 
 #ifdef CONFIG_IPV6_SEG6_HMAC
-	if (srh && !seg6_hmac_validate_skb(skb))
+	if (srh && !seg6_hmac_validate_skb(skb, srh))
 		return false;
 #endif
 
@@ -771,7 +771,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	srhoff = srh ? ((unsigned char *)srh - skb->data) : 0;
 	pinfo = seg6_get_srh_pktinfo(srh);
 #ifdef CONFIG_IPV6_SEG6_HMAC
-	if (srh && !seg6_hmac_validate_skb(skb))
+	if (srh && !seg6_hmac_validate_skb(skb, srh))
 		goto drop;
 #endif
 	flvmask = finfo->flv_ops;

---
base-commit: 17741334d00bf5ebd37f8c1c36bc9c146a351deb
change-id: 20260922-b4-seg6-hmac-transport-header-2158048b4bc6

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

