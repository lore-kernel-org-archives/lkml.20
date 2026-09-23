Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEED330D4C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172125; cv=none; b=PGrJDuziIwEIhbSSa9yv84eF//qfDHuSgO6DvKfnvCUdGO08lVRupwvvB3S84gp27mkDzmKTEeWKz+3/rnE5aM/zDfxxRKJQFMJEBPhOfzxkz/lU8+7R1tJZiQWwfWn8hATLBQq2ssJ+x5wFkqwNNN69f/5E4dj4t+XVH2DJZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172125; c=relaxed/simple;
	bh=7o0r4xT7dU4ZLo/lsVvqnCyZzuGUywIQIsoKQlG7wFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoHVq6BKdKjdEqTH3gcZ6s3EnB93re48qqVWiCm8QKFP/A7pcGI7k3bH/XyjiXre/Xh80k9csPzglHsEo4mZRp5Kfo155kYcYPIGBXQxTpN67WtJziY5ngJTXqfBOJcHAdsYbMfxUVUH53CVo65aUDcgiq/IV8AbSzaCWO6nmNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=GgRGbmDs; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="GgRGbmDs"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso486191b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790172123; x=1790776923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOvcdYU0dRk1zgquznwCGjvnJFZcKqDjbV30BWWVegg=;
        b=GgRGbmDsr4NPig8ge4zIZkclt4AIbXOu75bBSKH/+h3SzN1HBq3alFoJMQd57IBfSW
         /YBmd5WX0RIO4Xw9YN6nvzuiqqXlcq/yqGLppBLTHOWCYmkwGvbfPfgLc3Zan8YO4fHD
         mn5KV9TvK8xbsslA1G8Y2/Uf/RAjjS8TPfJ2Ye1/dyvcH8Vm/6s/j91CHWeEQ67zeXo8
         w+OgsC3NPXqXR5G+YC7c8FcR9KZkz4tv9R/1HK0GHz9SUpY2oGfN5wi1i9hFLWOETAnV
         3C5HAOAq1HdJqh75N6GkFxubwe4wt/2CACRy7DeWVM6F3jltMLJof19LqGUxlTIbGg+R
         Seuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172123; x=1790776923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOvcdYU0dRk1zgquznwCGjvnJFZcKqDjbV30BWWVegg=;
        b=cRb2dWovOYOXWG6MOhqO/q5Jx4fF9pRm9EBb6gCJVmNa66sFc7epvPxH+W3rsn9bLq
         oOYVBPJquvje/FlYV2Dra8vtRn4UxY/PFnIGWlK7l8rK43m7uUk4q9+JCB1BaNWR+OEI
         ZrIVRen1zqdYjNE+HcWsNr/+ps6/Fz3y8gu4kyeQxJ5k3ZbsuEeUKMfU6bsBPKgvOU1U
         iycPrFsS1Xc3q2L88HZZuQWStJYPo3eWv9YBzG6PrISeqTgEgZvJRK5a+xMqkZpHaU/z
         p3yMt6hwecHPzv3fYRdNwg8jgi2Z4S7UrxnqNMo+M7wK70RcCiWcm7N7KzydaL6D20bJ
         NUJg==
X-Forwarded-Encrypted: i=1; AKwUvByybLxGl1S275nOhsuqpHunK62PKT3Nd/sQjCshdAHDpNEtd9rBvHr1wPnWEn9kPVxz80Lt3/NbmB7yhAo=@vger.kernel.org
X-Gm-Message-State: AFuF++mHlXfI4SUTFG4lCTTOX7/VEzoMyg9HdxL95zW94RbGNWZ+wRxx
	B/t8EnIoHcx8rkKTCKgpHNP0tPPQ+Yi5hFmcJG3BaXsVTQHq62UXfbI54DQALwEwBikT
X-Gm-Gg: AYBFou09GkT7ZQCMfsXC7uxBZglpvXTwZf5V8DCXo2cwxRGfjBkSMjal+kcWCA3OICo
	1Z5S51hilF8suDd/C4bcOnzI5CO8IMcLT1y2IPVa/IE3my7uPGhO483cKYgVZq5vkJym4q4dd38
	0OHC+hc/wXUcWbq3uBezv5RlqMToHllkAMOUBGAcjIWwSw3Y+fI+y86XyrKx1oLS5mfFOv27cui
	yEaISkGNrUP+6iUU6wJd875IUlSBkcGOrzhBwOxfTh/lIdp1L9pGRuQ+uc+32xq3IJc2Zt0AYjb
	lE5JMxP1TD8CCc/KtFa/6tj3vFWZBVU3a32jSTf+Gvtk/p0HNqR3QOfeEjgsR1us9WyFfA6LOC3
	cumrth0DvINB1dIHl+265ioWEryVT6LEBCe8c7PWeKFahtcoEyyW/3cfI0pe9buOufU1gd8vWp6
	FsbyGBYzegu7xnOlg6G4BQtrmyzcjgTvOJVlKsgohfiMHAZy3Cm96GhFl7Rdk+/DJgov0muMVHC
	cCd/gkyCaOuhVCOxcByq/FdukLJvw==
X-Received: by 2002:a05:6a00:3316:b0:86e:8deb:fbd4 with SMTP id d2e1a72fcca58-87d1a7af6fdmr2599123b3a.11.1790172123010;
        Wed, 23 Sep 2026 07:02:03 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad42fcsm1328940b3a.35.2026.09.23.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:02:02 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dsahern@kernel.org,
	idosch@nvidia.com
Cc: zihanx@nebusec.ai,
	horms@kernel.org,
	kees@kernel.org,
	willemb@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 1/1] net: gso: limit recursive IP-in-IP segmentation
Date: Wed, 23 Sep 2026 14:01:46 +0000
Message-ID: <8b7e7dad82a40e7bdb4721516823c8a7ae6106a0.1790161599.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790157745.git.zihanx@nebusec.ai>
References: <cover.1790157745.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IP-in-IP GSO can re-enter inet_gso_segment() or ipv6_gso_segment()
for each nested IP header. encap_level tracks header bytes, not callback
depth, so a deep chain can exhaust the kernel stack. Making
inet_gso_segment() stackable introduced unbounded IPv4 nesting; IPIP
GSO/TSO later made the path reachable. The IPv6 stackable path was
introduced separately and shares the guard; Fixes identifies the IPv4
root cause.

Count IPv4 and IPv6 GSO handler entries in skb_gso_cb, initialized once
per top-level GSO operation and preserved across GRE/UDP context changes.
Set the cap to five, matching IP_TUNNEL_RECURSION_LIMIT. Allow five
entries and reject the sixth with -EINVAL before it can dispatch another
GSO callback.

On the patched x86_64 kernel, tracefs observed six
inet_gso_segment() entries for the 199-header reproducer; the sixth
returned -EINVAL without a stack-guard fault. This validates the tested
configuration, not an architecture-independent stack-safety margin.

Fixes: 3347c9602955 ("ipv4: gso: make inet_gso_segment() stackable")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v5:
  - Replace the header-offset budget with a shared IP GSO handler-entry
    counter. Entries one through five pass; entry six is rejected.
  - Initialize the count for each top-level GSO operation and preserve it
    across IPv4/IPv6 dispatch and GRE/UDP context changes.
  - Use the existing IP_TUNNEL_RECURSION_LIMIT value of five as a
    practical bound. Tracefs observed the sixth entry return -EINVAL on
    the final x86_64 revision; rerun both IPv4 PoCs on that revision.
  - Avoid rejecting a single-level tunnel based only on header length.
  - v4 Link: https://lore.kernel.org/all/cover.1790041241.git.zihanx@nebusec.ai/
 include/net/gso.h      | 9 +++++++++
 net/core/gso.c         | 1 +
 net/ipv4/af_inet.c     | 2 ++
 net/ipv6/ip6_offload.c | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/include/net/gso.h b/include/net/gso.h
index 29975440c..18944ff06 100644
--- a/include/net/gso.h
+++ b/include/net/gso.h
@@ -19,10 +19,19 @@ struct skb_gso_cb {
 	int	encap_level;
 	__wsum	csum;
 	__u16	csum_start;
+	/* Number of IPv4/IPv6 GSO handler entries for this packet. */
+	u8	recursion_counter;
 };
 #define SKB_GSO_CB_OFFSET	32
 #define SKB_GSO_CB(skb) ((struct skb_gso_cb *)((skb)->cb + SKB_GSO_CB_OFFSET))
 
+#define GSO_RECURSION_LIMIT	5
+
+static inline bool gso_recursion_inc_test(struct sk_buff *skb)
+{
+	return ++SKB_GSO_CB(skb)->recursion_counter > GSO_RECURSION_LIMIT;
+}
+
 static inline int skb_tnl_header_len(const struct sk_buff *inner_skb)
 {
 	return (skb_mac_header(inner_skb) - inner_skb->head) -
diff --git a/net/core/gso.c b/net/core/gso.c
index bcd156372..e96ef6350 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -117,6 +117,7 @@ struct sk_buff *__skb_gso_segment(struct sk_buff *skb,
 
 	SKB_GSO_CB(skb)->mac_offset = skb_headroom(skb);
 	SKB_GSO_CB(skb)->encap_level = 0;
+	SKB_GSO_CB(skb)->recursion_counter = 0;
 
 	skb_reset_mac_header(skb);
 	skb_reset_mac_len(skb);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 32d006c1a..18037d8d4 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1375,6 +1375,8 @@ struct sk_buff *inet_gso_segment(struct sk_buff *skb,
 	int id;
 
 	skb_reset_network_header(skb);
+	if (unlikely(gso_recursion_inc_test(skb)))
+		goto out;
 	nhoff = skb_network_header(skb) - skb_mac_header(skb);
 	if (unlikely(!pskb_may_pull(skb, sizeof(*iph))))
 		goto out;
diff --git a/net/ipv6/ip6_offload.c b/net/ipv6/ip6_offload.c
index 78f50c93c..099f14e09 100644
--- a/net/ipv6/ip6_offload.c
+++ b/net/ipv6/ip6_offload.c
@@ -104,6 +104,8 @@ static struct sk_buff *ipv6_gso_segment(struct sk_buff *skb,
 	bool gso_partial;
 
 	skb_reset_network_header(skb);
+	if (unlikely(gso_recursion_inc_test(skb)))
+		goto out;
 	nhoff = skb_network_header(skb) - skb_mac_header(skb);
 	if (unlikely(!pskb_may_pull(skb, sizeof(*ipv6h))))
 		goto out;
-- 
2.55.0.windows.3

