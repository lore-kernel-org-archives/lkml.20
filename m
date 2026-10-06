Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D106249BD8A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306642; cv=none; b=ReG4zJJLuXcP4Nzk1xHLwRDqgwIviuebs2OYeCByvqpHjhJJOb8/4DG7VWcjMbVv1lrnsckGzKwb6RKZSwdKkcKxpQ2bnMB4YLOzmvanN7uV6YG/lAYzSi5tfX+3vket1KVDPCxkmoaqicmScbP0F3yXWMoCO47e21ovoFBMcSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306642; c=relaxed/simple;
	bh=LvUip6sg4zC8MHIDQcH+Q74Y1I2oBLSsqvHL1CWpu/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+J3xXp2u4CgXJkyvzOonpeB/0X00F3NhAbI+CEJGjNgwajCRP3GbaNDnP5+iO3vrjcFkEENisYe3kDOpjo4Sch+z0jNKFlndLJKuNIZq9ERG5vvWN0dEenMlNbJgn8umDVwt5h7HRWmobdWuUO5svGBo2hTxDgIJIzkHZv4l+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=b8OYYecO; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="b8OYYecO"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9178d514951so25014846d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306640; x=1791911440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRSEhk/ukaPGF86WvMny5m3lspAeG/UVjcvU5kzCm7o=;
        b=b8OYYecOtG/8i5dvazzj0vmoFLeyzR5reQy5KVB8l9JQbt0dqq8XP1P1s7/0Zrt6yN
         WK5WL0gXqNCx52PakfPPWjv2Ze8blvJTXLIZMJc9KsetOaVlFo16XpiQf6twuCNUhUdQ
         90VO4pAhkZIPMcAZs2ZZ8aKpKR7q2UKMIu2djNtwTSAGVWsYeLmW0TEHAf0ppNlSDeyS
         +DQZ5mvqwnXdym2YpLbODcE8sr7stvYQs0M9dUScc49n5UN0Lwjx8/VMOpFh/8GivJr6
         7vpbkXdtiZRsGdohgdW2r7Kzm35SdzB9xTv25ax2IonGfAU4jA9OopwS1Y4m4tRuc3SV
         RKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306640; x=1791911440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRSEhk/ukaPGF86WvMny5m3lspAeG/UVjcvU5kzCm7o=;
        b=nSe4hyfmDE4aIFBEiAaa57F3JtLiV3g1iYKlH8xSsa+1+cax1blDEZRTj4Qoe5nCmO
         tY646aSqg9TNLszokZlYc0m2Ez8WVOUxOMPt01UHlwY0xYb+LfQiOu0vS0bhhTCLUes4
         E5PsQgryuC7tUkk3cVbSrNcw7lUqOlMTaX+ZfVyB4wtphaJuHQhV+NeiCYlU1WYld/XR
         JT+YkgA55xD07pU21Wyd+QK/lmEMEV+CmqUn82E74MU77LqcTPr/pc/hLtv26ku317aF
         k2QVbhOllscNAUCMWF9AOHWA5yPoE82SD4LXZLASN6k1/zwg5wFMMIFdLMP8325giukL
         z7qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzKYy20TEAUesYMR426HkwLp9B1eOGIs0HGGAakHr5ES9kVG85/gjMYfuJC5pQBMJ0wrlwAWO0sBpqX5A=@vger.kernel.org
X-Gm-Message-State: AFuF++m7QEl4s6b8rAWJ8p22GBZkGisEMUJ6FpXr95yx4ZlQmk+gaLFF
	W+Gcm+gNc6u3sXn7WmcP+TCut/PaMQUmJVvDiTkWCu1QjLBf8f7ufAO7QZXTqEfyB6M=
X-Gm-Gg: AYBFou0j3j0Zvi5tfUOyw4hpZgUJvMWAWnfGkVA1E1lgJCafguPUfYfK0Kknph9KBnT
	ea7Hqriu4m140OCse4RAi89qpyTsuFy8tjzzIxf6xjictHhrkdlf7DDOvFOwTcelg9rNBAGqRYj
	G1azWtI1GYvR3r7+zpOCOS4cgQ6Tkv4MDFnLXubDcwP12lPBeCa3yXU6TEKHxx8UM3PDrnHhyBr
	/CBgC8A2mfuxuBEdgoiTz2xN6FsQyGuOjW+U9PLti/EE2WzhonARC3z68mDUBPErjGJq37BURDu
	AegNvGkt/W/oOtrdOfuPjlH9D2cP2GD6aqkRHS351muYAnukiQdG+zgx6bmS/Sm36G8Z1+6oWGE
	W5zAZkpbXSKLVLQzzsGNnQ2P2H2EX0v6OTujimBd37cd/i1TfDdBBPP0mYbYhR3OXRncqJ5U3VY
	k+5ifOuVjlArAGG2BD+0iceZADVJFzt8XZVX6WMs4CMlLKhnRj+qwwq3QxuV+u/YtKL1zBmljW/
	IAplfEHxh9JJRM=
X-Received: by 2002:a05:620a:6914:b0:93e:9808:b9e3 with SMTP id af79cd13be357-93e9808be3bmr95038885a.72.1791306639172;
        Tue, 06 Oct 2026 10:10:39 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0bd29b1sm117233516d6.34.2026.10.06.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:38 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:16 +0000
Subject: [PATCH net-next 1/9] net: skbuff: don't leave stale bytes in
 skb_copy_and_csum_bits()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-1-1b4434c5357c@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306633; l=1482;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=LvUip6sg4zC8MHIDQcH+Q74Y1I2oBLSsqvHL1CWpu/c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDmkAUy8kW3bakdV4LNq46AXJrMyBElWpcUZtAqWSXkkZAnpkvnxX0s6FBBSWcXGzGVtOhKQ1lX
 yTbXr2FmIgw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When skb_copy_and_csum_bits() reaches unreadable frags it returns 0
after copying only the linear part, and the rest of the caller's buffer
is left as it was.  The callers copy into a buffer that is about to go
out on the wire: an ICMP error quoting the offending packet, or a
driver's TX bounce buffer in skb_copy_and_csum_dev().  Neither buffer
is zeroed beforehand, so whatever was in memory there gets sent.

Zero the part of the buffer we didn't fill.  The checksum is already
wrong in this case, so the packet still gets dropped by the receiver,
it just doesn't carry anything it shouldn't.  Only zero for a positive
@len, a negative one from a broken caller must not turn into a huge
memset().

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 5c4024a03e10..512ff9cfa269 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3633,8 +3633,12 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 		pos	= copy;
 	}
 
-	if (!skb_frags_readable(skb))
+	if (!skb_frags_readable(skb)) {
+		/* Don't hand the caller a buffer with stale bytes in it. */
+		if (len > 0)
+			memset(to, 0, len);
 		return 0;
+	}
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;

-- 
2.55.0

