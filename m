Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5377F3D8911
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394582; cv=none; b=F4HWd1AmmsIPqQSPkcXqzPf/mpb3QgfUs1/ZUpgQchgevD9DJ07bFR8bC5ryUjnU6n/eH+J/FuWyuKxMlpZct9aR/AkifkIPbVy6JzLKHez2up7Q84TmFTS81I5oZu9cN87Rs5aIyk/EDAeoM7cMZ7gwU1tzj1ZdIzUGD+3s8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394582; c=relaxed/simple;
	bh=iWA6T1CpjWI8UxLZmS8SblObbmCsKvPQ75NFi5XaiB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUf+OHZdi7Z1BbFWdrVPehdkkgz0o2equ2pr1GXmYImOUSLzV1hkFDwV71Rl3pLN4nqP2r8AhcOxMzVM22DrKTF/f9hvMsulp2pYAl+yMewJp7QYU9iVcdLI6yYk5+ut880H9GzLTirTKyXOOOlTPTKUK6GZv7fXhkF3W7932as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=PGRFNMFz; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="PGRFNMFz"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e027da24aso173081385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791394576; x=1791999376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmeHgE/m1onXKnAwAH5DDKMXEgBrD3yqome89VS+iU4=;
        b=PGRFNMFzDDHXgF+JuzmS3BQks2K37dxnKTDgSE8KWItxXZGzLun6TvDcT9ZhjyVl84
         xSZxh+QvryZrEJZujOZmrAvQs3UbhWYJM8UNNSkV/eQoLT0JiKQu+5Z0pd33+mOcKEwQ
         XrX5pP2TsrUvlBrzZuQsa7H+Iy+7GrZQAn8MJiZJuA/Bj0kNcfr4COfBBulSJ1Bj9HAM
         2u4HqrOl1H2nV94epnphAyKX/23xNtrjCTzqoClb02J2eY9wzbL/bz4itO5pYwkTmOFM
         n1R1YzEZJTORSg7jkpzbS4wzziBjGEyKF4VGLPkyvJeirb0Z5MDPYsiIGWlKS5HtmOHa
         xz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394576; x=1791999376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmeHgE/m1onXKnAwAH5DDKMXEgBrD3yqome89VS+iU4=;
        b=0ZYFCK4LJVjKKBD+FNtrMPI55HCSrdZmzMS+W4m22PHY7g2eKutv1goc5c/avKTIgp
         LMelAsBjUlpqaXwbqsBby0ziKz0I0YQE8G+qbOWkVm/JX0CQqJ291NmAf0fB4MBZms99
         GKQOPHi0G2LLaVx6j8ybjAiRM78Nq5O0Qm0p0ZvxC8jSmvIKV0DPLWOj9UKmVKjRXaRK
         uLRo3B21Mvf3AV2aFX3YhMV5t7W1yEoolYrOEh5gcbTkmwmWqG8yqOqJSWmSNjISwhA+
         7MFFZD0ygnAAr/2NSrfmb6i7oqYZkHUwcbTALV+A12JtwpaHOQBQn1UupgE8cJHkfo1M
         Ho7g==
X-Forwarded-Encrypted: i=1; AKwUvBwFLNpxzjBK2kmwI3IPa5KQVl965OL2QeOJ0lqDBKNsJej1n/BfUu50tRzdbdBWdVa7O3kThqHI6EnGnKA=@vger.kernel.org
X-Gm-Message-State: AFuF++nIbaiK8Sa5Ki4NUT5gFyj8rMtw8gqRS9y9pft+6PCySXVq+TuS
	T+y3vrXLqf3/RycptSEb042K5z1ABSKsYbRvk0zXlc2TcRaBLQruhrQTbOYDoO4giASScroeI29
	1Wnj6M0A=
X-Gm-Gg: AYBFou24kiwWt6vRdg2cy7+smCurh8si7HHAlrIiH0lnME4XI5jfIdNzG7WK6QXMFsM
	lFKvzgbZqY/TNAlduLRlGB3YRA0SVUVInYkdNtyI2azYIb/FDVcL5xwMOPLBIK/+uzByT1MJOBs
	KLxV9pyHQpkCr2G1jSEs/WlIHuSWT/RVx2IBBfXEvkllmxI92hBdge84wPMgp782cc/O8O/h3/8
	gxMocQjcZmlnGL9ojQcogRAnEJTsfsPaGyzKLGh6KmgZsP7PjdvXL+27KG5BqwolVZrij+lqyuA
	GxnfwkaOE7jnO+I2O5luyBt5uLdBMylCyCAa5SXqNk8Bwwn13uBi//qp65r49/l8uvm5jGBHDnW
	wPq8VGeylxyHgEmVkDfMN5qHqa9/1PLZCasOgHNaGrxyRpzwz8WEd7kO4tQFACrRXb+rREikOgr
	7vgbWncC6T0AmlqQFlwFLXN55wx7KmXywK+U0axnH6uGc8dcCynzHb44Vt2IQS0UWh53YYKl6Av
	8DZoTlc0Yn5eBc=
X-Received: by 2002:a05:620a:1a0a:b0:93e:66e6:fa4 with SMTP id af79cd13be357-93e9b72e5b1mr557833185a.16.1791394576316;
        Wed, 07 Oct 2026 10:36:16 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991e9e5csm261941485a.37.2026.10.07.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:36:15 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 17:36:01 +0000
Subject: [PATCH net-next v2 2/8] net: skbuff: don't BUG() on a bad
 frag_list layout in skb_segment()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-skbuff-bug-on-v2-2-b9a5f732895b@toxicpanda.com>
References: <20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com>
In-Reply-To: <20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791394570; l=2697;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=iWA6T1CpjWI8UxLZmS8SblObbmCsKvPQ75NFi5XaiB0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFi3QIvWhd2Mxhv3Aen91UpvjyXdXR8IZmFpsWcV/heEJdJkDndaF965IV19Tq4zgj0euoLfffo
 UnGoNh1cN9wQ=
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
Take that path for the four layout checks, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels.  The packet gets dropped,
which is what should happen to a packet we can't segment.

The one check that runs after skb_clone() and before the clone is
linked into the segment list frees the clone itself.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index d226fe77d484..a6821ab13969 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4916,7 +4916,11 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
 		    (skb_headlen(list_skb) == len || sg)) {
-			BUG_ON(skb_headlen(list_skb) > len);
+			if (unlikely(skb_headlen(list_skb) > len)) {
+				DEBUG_NET_WARN_ON_ONCE(1);
+				err = -EINVAL;
+				goto err;
+			}
 
 			nskb = skb_clone(list_skb, GFP_ATOMIC);
 			if (unlikely(!nskb))
@@ -4929,7 +4933,12 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 			pos += skb_headlen(list_skb);
 
 			while (pos < offset + len) {
-				BUG_ON(i >= nfrags);
+				if (unlikely(i >= nfrags)) {
+					DEBUG_NET_WARN_ON_ONCE(1);
+					kfree_skb(nskb);
+					err = -EINVAL;
+					goto err;
+				}
 
 				size = skb_frag_size(frag);
 				if (pos + size > offset + len)
@@ -5036,9 +5045,17 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 				skb_shinfo(nskb)->flags |= skb_shinfo(frag_skb)->flags & SKBFL_SHARED_FRAG;
 
 				if (!skb_headlen(list_skb)) {
-					BUG_ON(!nfrags);
+					if (unlikely(!nfrags)) {
+						DEBUG_NET_WARN_ON_ONCE(1);
+						err = -EINVAL;
+						goto err;
+					}
 				} else {
-					BUG_ON(!list_skb->head_frag);
+					if (unlikely(!list_skb->head_frag)) {
+						DEBUG_NET_WARN_ON_ONCE(1);
+						err = -EINVAL;
+						goto err;
+					}
 
 					/* to make room for head_frag. */
 					i--;

-- 
2.55.0

