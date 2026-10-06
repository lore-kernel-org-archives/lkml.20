Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CBD4A2A69
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306646; cv=none; b=l8asE2/hzdLYDyVoDrkNbd3iwZ+qKmo3VulQJ3Jhe95FgDw5YFYxOms9SilGWb+Mw/Xnak7la3ljqpWoFRDVyzZapkYoAjiLd38Ltr2v8M+QMXw8bRUMKaD0nsGK1LsN+CUi1XBG1NsbvvC66S1sQnlfY5Kd1G5bXDlv8MAfU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306646; c=relaxed/simple;
	bh=DDflBQe9rOFwdyuerX1yW+/JeWMvXhklLxeTuRBv5Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTsvI2ows6w8ppDLQHJ0jc+t7eTqLRBAgIxzwULy0a09E8bYmBCeIFCak8mV3r0yfGcItqRETSZT1obYWv2kw6kJMhW+QbmTlVyB3MYjTsf7Sa5LMMZbS28LsFrMrY3hTHuUpEWWOE9CJ3848LageFm3SlhMTPDIDlvATZ+7tVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=QXSTiVZX; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="QXSTiVZX"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e51d8d400so48079285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306643; x=1791911443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KC6Wx175jqCrvXS4LmjAF7lZT+6ZiBebrhytRBII/LM=;
        b=QXSTiVZX2WsM/3eiJeWWGQMOh7IZqJpJqdUs2zIOtJanXNTe/3+Y0sBpBxMX9m5BUe
         WfiWoiShIqjqbxkX2ALLRL+df9TVc2YhjUrHhVNRLtt6A7WvGSd5ZBsQudGttnk7jUij
         AZ2HS9coFrxqn9jKBbaOvUgMf+XtT/exsgxBKHCf7JrXxDGJ3gA+ay9Yau34JQxJ9SFf
         c24U958GlOP8Jq/ZJDCv+Ir0g++jYC3l7PI42+Po0c66OY5uI4/PqoPwIFodjtEcKMQT
         HbR/KZyP6rQqNUH0Sjhlc7lE6r1lPse/wskkOzVO0Pm/P5UFbwFqhkqJdh9UJw+1jmCW
         mr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306643; x=1791911443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KC6Wx175jqCrvXS4LmjAF7lZT+6ZiBebrhytRBII/LM=;
        b=Q5D9UKkOIDMh8aN4fZPM4m21kdnt83SziDLZqCoFPbuNTvLHVwKrZwJdIIx4hGJ+Ba
         +EJxMAlYCOAkgBQmd24DTGoysxYtzw9KczBKSd2dyAWlNk1RzhEYyxqXYD1m0C3+cHun
         3GbhZnuPYqUPFvnukigi4S8ju4IfWvr0mgqUd6GdVrl3O+hWfkGuoAOTkLUb1axHnL7I
         a1bUbXu8ONc214eu2Ydg8SQ394+neYGcgP+8D3l4YquzaX1WXWaboNZ8XVPzP9QwWR6C
         d78oF715dXAHuwcWSTZioN7zClrnZ++KNxtuipmU1KtXA1DnEQjHOQ/3+CbDKOtjB9Tw
         dogQ==
X-Forwarded-Encrypted: i=1; AKwUvByYdO+LQ2nTTKvnmRPDIkh8ibT9envXc77Yg22fiNTqlzYnokU5wOWsybjRGTgxfcpPeQM/w/rug7WaEu4=@vger.kernel.org
X-Gm-Message-State: AFuF++leg6OGYDgQKo04DJkPZQED+JFQLA+wQi9uGgNnNw3/9zJfPGFY
	LLaXICkJk/IG1gxey5gMOu7YA9hEl18LlnIpdpeXEn7sFMl2eK4HWg1YzUX26x+SiBI=
X-Gm-Gg: AYBFou26WrGCuWMD9eFgA9Ow+DEJaJEmpaoy24EM9w9Q7RfJcJBfB2icOVYOmoz+cMG
	plcfTqTEuAJC047n53RPaUjCOXy52drSqGkvAm+18XtqNvICeVhhiykEC3cyUwiepyz0Dnyc6cT
	qU9nxj9aXP0fciHY2EQYSiX8i6W3k0qWyNoLQgdz9iP/hYbaygVvVSFX02iG7srTxNpgLnhqvfM
	mpkCvYve9Z+VEVIYiwYgMO+s2GxVIQotKx0XCBBYLSmzKWcF/CLFTqp6BuIih/mTLR1uhHc7dg+
	kvRMNYAz3I0BaRPrt3F4yWPmpo7HgdRP3las0KK2P0qSlbAv0ipnQ8XchytXROqAlYBbReBWnaL
	cQtGvzKkKNsjA0ieiVQL9MZF2PpkYHglLybXudapbQJgoAx5L2J7t53bH9Y7z93MOAZY0EbL9dH
	wZT6NrBHbU8IHNRSbx2j58QWJHDi2FyEYE0oeoo//NEep3DIyT3OU94xNYXvUtIoWfoStepMVkR
	nZYSADhtR+WKyY=
X-Received: by 2002:a05:620a:2707:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93e8f4d12ffmr400757785a.43.1791306643375;
        Tue, 06 Oct 2026 10:10:43 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e99158463sm5742585a.20.2026.10.06.10.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:42 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:18 +0000
Subject: [PATCH net-next 3/9] net: skbuff: don't BUG() on a bad frag_list
 layout in skb_segment()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-3-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306633; l=2534;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=DDflBQe9rOFwdyuerX1yW+/JeWMvXhklLxeTuRBv5Qo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNE8FgLFm04/MQTMOVst4PWyNQnmk9EEN41GATHccJiCzZ/FVf0X+tKmZ9HEHAWvOay+M3p0Q4f
 dh1IsN6pStQA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_segment()'s frag_list walk assumes the GRO-shaped layout it expects
and BUG()s when the layout doesn't match.  Anybody who can get a
malformed GSO skb to a segmentation point gets to crash the box.  Most
recently commit d5dc1e69fd72 ("inet: frags: strip GSO state from
fragments before reassembly") fixed one that an unprivileged user could
trigger with two writes to a tap device in their own user namespace.
commit 3382a1ed7f77 ("net: fix udp gso skb_segment after pull from
frag_list") fixed another.

skb_segment() already has an error path for a bad layout: the
too-many-frags check sets -EINVAL and frees the partial segment list.
Warn once and take that path for the four layout checks.  The packet
gets dropped, which is what should happen to a packet we can't segment.

The one check that runs after skb_clone() and before the clone is
linked into the segment list frees the clone itself.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 5d856948cef9..405d27e9bc9d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4916,7 +4916,10 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
 		    (skb_headlen(list_skb) == len || sg)) {
-			BUG_ON(skb_headlen(list_skb) > len);
+			if (WARN_ON_ONCE(skb_headlen(list_skb) > len)) {
+				err = -EINVAL;
+				goto err;
+			}
 
 			nskb = skb_clone(list_skb, GFP_ATOMIC);
 			if (unlikely(!nskb))
@@ -4929,7 +4932,11 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 			pos += skb_headlen(list_skb);
 
 			while (pos < offset + len) {
-				BUG_ON(i >= nfrags);
+				if (WARN_ON_ONCE(i >= nfrags)) {
+					kfree_skb(nskb);
+					err = -EINVAL;
+					goto err;
+				}
 
 				size = skb_frag_size(frag);
 				if (pos + size > offset + len)
@@ -5036,9 +5043,15 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 				skb_shinfo(nskb)->flags |= skb_shinfo(frag_skb)->flags & SKBFL_SHARED_FRAG;
 
 				if (!skb_headlen(list_skb)) {
-					BUG_ON(!nfrags);
+					if (WARN_ON_ONCE(!nfrags)) {
+						err = -EINVAL;
+						goto err;
+					}
 				} else {
-					BUG_ON(!list_skb->head_frag);
+					if (WARN_ON_ONCE(!list_skb->head_frag)) {
+						err = -EINVAL;
+						goto err;
+					}
 
 					/* to make room for head_frag. */
 					i--;

-- 
2.55.0

