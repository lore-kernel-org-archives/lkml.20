Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0DE38D3ED
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853806; cv=none; b=EGp0LGuCcwy02EqYFG3PxMlVQRK7TwRtjGeRI+Uq0bM+w9Au90E9+1GSJQVMBkXKYWDHVvApVVmBsavGLK/gsC6UZktX5s/NWaPnKnopLU4bl2esPWhOOfHMBHst8XfOVXxMUSd+1M7biLEWWfWDABxB+P4PaE9AiatjH5GkZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853806; c=relaxed/simple;
	bh=JzVmTdq3Q7Iq2TH3qdkMpYUeDuu0LJqEMcRNJCqtMFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dvK3ct2PMN1RJUwfHfGn/xzfixn41bVML5snysahrn2RBbk+MnKJAaTDGvrjlD/27Sv46851R2/2poRrCXHSA99NCCVUQEfc2BfVUha57vdzcTOJ3/matNFSd+txoPnn3VUDQiKP9aT/GkBMP/4+b4xHDJ+R09Ha0F5XPMAD5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSkGLWk9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSkGLWk9"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6558685ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853799; x=1790458599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRiAGPXf/bDE6W3u+fknYqS6n6eKeAu3CAyIqYAtulg=;
        b=aSkGLWk93vpkFmPKP4eU5BGpqsr026Sz1L4HmhdQCM/eM4pQD+q5xWUZ5X+VGDsdHx
         fk+sXPrMbzKOHgzjUsiOnNeEBwWcJZ9zxo7W+jxoYwWlcvU/kU6HEOqPr0IIfdSlZsJy
         HlROJgXVKQTEzh+k3+By4yQ6/qFC9To3ehNs6o7firnZZhnWBUiUCCM2FF9Iw+GCY3Ro
         vgCYu/Vm/S/4DZvG5FtQwtmex/w7xK2EsoJ8NuWnO6dzjrBCfM1oIGly2q7cTdKvSdkU
         gKSGX780UkR2b5GR9xXuJJRrRCMTnd+Fey/bJOmO2pGjLdc4yt5OECDxJJFv4w/Wf3Lx
         QEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853799; x=1790458599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRiAGPXf/bDE6W3u+fknYqS6n6eKeAu3CAyIqYAtulg=;
        b=sX2LcKkYXThIRIsoPQXT3rlIgRY0pev8uAFWvlqaDU206zrcj8QTVP31rrab0RvDTa
         xQVVWDTqjYVfDyz90hiobX0Hf82uNAv5t5euatHyamFTcYxHCGIcOuQWtC1TGlts9ait
         OUItxeep6yfZ/8rZluDZIEJ61wKd4AunS15clsHHYyKlLKUagOFXJwKbw39rmBI7WIzX
         l9r3/TGsdDvQStEFtsEEjKNu4r4qiwVZIRarLwLXwy6BcvbFFiId2W47/4ys/49td05F
         grJppq2hqw8QzxorUC4f1DN5PE8+tC2J3a4LcH5yRFArL0gsiXM3s/ApPxlN3m+iWZJz
         J9nw==
X-Forwarded-Encrypted: i=1; AKwUvBzMUlPOiFKZKJo142RZUDqBa/bXrCxVoBPvOZQp4aFgFb+ZQpz7NE2bX/2bcKAnKYxy8ql7SEpepZn6f7U=@vger.kernel.org
X-Gm-Message-State: AFuF++kQqtr8N//9RwgIj/aOhQeBr4nVGspq+5SnoqF5NuYrVMmqLDZO
	9HMlw/VB4qNZZQjsEB3k9XugOWWVjdtlIRPffkvm8W3Wfml2HY83eElC
X-Gm-Gg: AYBFou3IYgYZlOdKRnJc1lMVyHG08IgMTZZddCd8jt0t9nvhsDcI7ya9/jm1fJPNadP
	8AA2clmYGGng6lHxVrNoCDsbOeJXQM3uSlM1h3h8UFoB/SUpD3+mpOFUCGlX9bt9UuaR1LjJyek
	obaf6iXxvoAqpK6UquGNaGW8tDkA7ksgVkqp2+EU33DVTZO3d93z1hXtD08Um7W8ou0Br06adI4
	4QOTXVdMMcaygP6YVJK51wMJvrvZYCQ7eZxTlpy/AzayPlPfWfT3tD6bBcEDzWYPBPIDkS9jW43
	05RrHZVWyV88w9ZCX01Av5bVcv9e7Ue4mNgtlYeP2fWF/GBW7G+Sq7vOyR98t3A3nflSsk8kcYx
	tdm8vTwz23nLBDgex4TRIL4Y3/jorfDjJOPDU13U/y/yH70/3SOMu0ny/ftfOR5hITmir6Vq85r
	2+Jtc5LfWwl+p3OzAKktXo03E8xpHcfneiVVve25BT0dI++3QKhfhyuQXHOAy43hBbcCXLZCE10
	f1hlpLWr5MkUNsgJO2BZ+VXQVGvIR337+OIVjNvguEMnqBumn/mZ9Qfsemmt2Ydv3mcydv7Yatn
	/eCaq5ZrIg==
X-Received: by 2002:a17:902:e946:b0:2dd:c100:2516 with SMTP id d9443c01a7336-2ddc1002577mr36107355ad.31.1789853799128;
        Sat, 19 Sep 2026 14:36:39 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc1803813sm12928885ad.82.2026.09.19.14.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:38 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: alex.aring@gmail.com,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] 6lowpan: add missing pskb_may_pull() checks in IPHC and NHC compression
Date: Sat, 19 Sep 2026 21:36:38 +0000
Message-ID: <20260919213638.3314763-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `lowpan_header_compress()` (`net/6lowpan/iphc.c`) and
`lowpan_nhc_do_compression()` (`net/6lowpan/nhc.c`), the transmit
compression path reads `ipv6_hdr(skb)` (`sizeof(struct ipv6hdr)`) and
the next-header transport header (`nhc->nexthdrlen`, e.g.,
`sizeof(struct udphdr)`), and then calls `skb_pull(skb,
nhc->nexthdrlen)` and `skb_pull(skb, sizeof(struct ipv6hdr))` without
verifying via `pskb_may_pull()` that those headers are present in the
linear data area of `skb`.

When a short or non-linear `ETH_P_IPV6` frame is transmitted over a
6LoWPAN interface (for example, via `AF_PACKET`),
`lowpan_header_compress()` and `lowpan_nhc_do_compression()` read past
`skb_tail_pointer(skb)` and trigger `BUG_ON(skb->len < skb->data_len)`
in `skb_pull()`.

Check `pskb_may_pull(skb, sizeof(struct ipv6hdr))` in
`lowpan_header_compress()` and `pskb_may_pull(skb, sizeof(struct
ipv6hdr) + nhc->nexthdrlen)` in `lowpan_nhc_do_compression()`.

Fixes: 8df8c56a5abc ("6lowpan: Moving generic compression code into 6lowpan_iphc.c")
Fixes: 92aa7c65d295 ("6lowpan: add generic nhc layer interface")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/6lowpan/iphc.c | 3 +++
 net/6lowpan/nhc.c  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/net/6lowpan/iphc.c b/net/6lowpan/iphc.c
index 37eaff3f7b69..b2be70036ee7 100644
--- a/net/6lowpan/iphc.c
+++ b/net/6lowpan/iphc.c
@@ -1140,6 +1140,9 @@ int lowpan_header_compress(struct sk_buff *skb, const struct net_device *dev,
 	if (skb->protocol != htons(ETH_P_IPV6))
 		return -EINVAL;
 
+	if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
+		return -EINVAL;
+
 	hdr = ipv6_hdr(skb);
 	hc_ptr = head + 2;
 
diff --git a/net/6lowpan/nhc.c b/net/6lowpan/nhc.c
index a4dde85664f2..a9bf340c090a 100644
--- a/net/6lowpan/nhc.c
+++ b/net/6lowpan/nhc.c
@@ -79,6 +79,11 @@ int lowpan_nhc_do_compression(struct sk_buff *skb, const struct ipv6hdr *hdr,
 		goto out;
 	}
 
+	if (!pskb_may_pull(skb, sizeof(struct ipv6hdr) + nhc->nexthdrlen)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	/* In the case of RAW sockets the transport header is not set by
 	 * the ip6 stack so we must set it ourselves
 	 */
-- 
2.55.0.1082.g2b9226bbc0-goog

