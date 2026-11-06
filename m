Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989213;
	b=uwh2A68ySBXF3kM7HEulZdJbKojK4fzPa1t48CHRvITM4a52wF8AzGNbk3x7Q7Lv2QUd
	 6qjYx+AhddxpfmSXJix5BvevxLV0S2dNhiRi5cqlJA5UvTP8X2qPhXkcw9uDURf3YMFKA
	 x+33xwt8mLmyLuQh9Qvt74mEwNcXqySilMetz6r9jiMabsaN00b5tJJMtMdb4RIQN6pu9
	 zXxiIHM1TXvfkY5Z3D3JNJzFuptvCb0V9yFR264f9w5UjX/DKLfaIeOVDdHKxtIE0PP7B
	 5VwCRqyag60xG4ALtptcxue5WopmPM59NIb4eoz8yk39IWrUL97su5UrMNN6h5OXaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vVMMjsoejtuZj+6jaOVjoI+Z/1D0Mv2jKvwK7taNrxA=;
	b=5IF84kfdIFUZzT1e3gRUC591llVyhZJCvgEx8gzvC0yLojTc3BXXGvQYFjIN8ovk1JIh
	 ec8oCok5JE3eYzDpwiRI4ErqU6IhbKT1wEkK1KXeeJ2HWjLI+hZholDqYyD2WfLcx47AN
	 BeFgMFQWEW4HlE7JrbUehTNGSTiVkk8lmstv2TYLoCXMGEM50VEVQA78S4Ytk4N6Gd8yh
	 IR86OhfvcO2/jo3h5cvmTpowwTZ3kpWP6Btb8xTw6A5tOcPRm274v8TpRO6eufEDA5And
	 +3hJspurBJRhKEGAwY7AnqyOmqyrw0rMNi4+x/zXxCOR13xmokqIyaPXC3QTTcXDg8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M77jK3Gd;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929D606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A929D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M77jK3Gd
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so11951495ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989212; x=1794594012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVMMjsoejtuZj+6jaOVjoI+Z/1D0Mv2jKvwK7taNrxA=;
        b=M77jK3GdF10MK0SFm6xKbtL4I00S0TgdZ1/xKISKVEwsLGZwbFJ5bkE2ZalS2qQ+HZ
         e/gRLQ+TmqQtBTZ0nZkGwRkfBPJcDoulaP6hf1G0DgprojSww+q87VTESrOXgN9oMJqz
         9S2bO4fxfoXa5ZYXnfnby+Runhw1YLjcmb/ssfDdRHSuVztt/GupfikH681rI4O5JMVf
         uCLqpC2RUcmtYHzdtuI1Kc+UaOBbJJOTOH5XQr+Y1Ccr4AlB6oV0YlEVxDRACnCycsz2
         wLThmIvFat6LnreBgVQ07hlVMVodSdAKEMskqAPxFztARFTEVSTaueF+TfUN6Q0epKnu
         tx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989212; x=1794594012;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVMMjsoejtuZj+6jaOVjoI+Z/1D0Mv2jKvwK7taNrxA=;
        b=TJ4JworPOcsf6pb8M6afxD/Fr002GAdvrmrGIg5Ue0cXz9K15cxaAFF6KEZqDIz0RN
         EjyE429e8s5pyie/ky+FLRXafix01BS2xCgDtNsgaO729LVQP89tI9tthGayrZqVppVc
         QOEIqYb1XfwYRbYD1AT0bNGhM8uIK53y0/6FgOnnHpPX4Cn+xoEu3cuODvtpQgq5Dmlj
         8UBrlmpvSe9b33oN3BiOlOCZvNFUBIBNrGnzl7FP6IcgfOam1/JwvPBuPjDbGApGBTKE
         H7U3QEl4pzWdEc8aF2JWh+2km55QUrRhIb0sWclRo3FMzPQekc7ouAHWd7ePSOsTTeBp
         Un7g==
X-Forwarded-Encrypted: i=1; AL+hErGB/IGLmBePALA8rSVbO3I6b4/qC4cj1T2+HntXrI9O3d0w6m+72AmtYEt+1aa8rU39JeIlGPwnc4RlQb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z//NRdg9nOmEhanDOvjAcID8OeZ0jsW3BQnmvRNrm9P8gMqQJPL
	3+7L+WobMz2nmKpq71RCMcji1l5BxMOtavEtsXmkQa3gxG01ec6EWUnfL7pLlwM7axhWXVL4Qx9
	PhsPxag==
X-Received: from pjqq12.prod.google.com ([2002:a17:90b:584c:b0:3ae:825a:57e3])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec8:b0:3ac:ad90:7090
 with SMTP id 98e67ed59e1d1-3b0db72df0fmr3414472a91.67.1793989211751; Fri, 06
 Nov 2026 10:20:11 -0800 (PST)
Date: Fri,  6 Nov 2026 18:20:06 +0000
In-Reply-To: <20261106182007.374660-1-weiwan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106182007.374660-1-weiwan@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106182007.374660-2-weiwan@google.com>
Subject: [PATCH net v3 1/2] net: Make PSP skb extension survive packet scrubbing
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

skb_scrub_packet() drops all skb extensions unconditionally via
skb_ext_reset(). It runs on tunnel encap/decap (ip_tunnel_rcv, vxlan_rcv,
etc.) and virtual device forwarding/redirection (dev_forward_skb,
netkit_xmit, skb_do_redirect).

When a virtual device such as netkit is associated with a PSP device in
another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
decapsulated by psp_dev_rcv() lose their SKB_EXT_PSP extension when
scrubbed during redirection into the peer netns. Without SKB_EXT_PSP,
__psp_sk_rx_policy_check() rejects incoming TCP data segments at the
socket layer with SKB_DROP_REASON_PSP_INPUT.

Introduce a static skb_ext_scrub() helper in net/core/skbuff.c to
preserve SKB_EXT_PSP across skb_scrub_packet() while dropping all other
extensions. If SKB_EXT_PSP is not active, skb_ext_scrub() simply calls
skb_ext_reset(). If SKB_EXT_PSP is the only extension in the skb_ext
buffer, nothing needs to be scrubbed. Otherwise, save the PSP metadata,
reset the extension block, and re-add a fresh SKB_EXT_PSP extension.

Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")
Link: https://lore.kernel.org/r/20260910-bpf-meta-inside-skb-ext-v2-3-0b21e42180b0@cloudflare.com
Reported-by: Daniel Zahka <daniel.zahka@gmail.com>
Closes: https://lore.kernel.org/netdev/DLODSKPY6ON6.1G6SP3CFFLCPJ@gmail.com/
Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Wei Wang <weiwan@google.com>
Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/core/skbuff.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 93c2f440b9ec..ddbf0f3342ca 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6369,6 +6369,31 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 }
 EXPORT_SYMBOL(skb_try_coalesce);
 
+static void skb_ext_scrub(struct sk_buff *skb)
+{
+#if IS_ENABLED(CONFIG_INET_PSP)
+	struct psp_skb_ext *pse = skb_ext_find(skb, SKB_EXT_PSP);
+
+	if (pse) {
+		struct skb_ext *ext = skb->extensions;
+		struct psp_skb_ext tmp;
+
+		/* Nothing else to scrub if PSP is the only extension in ext. */
+		if (ext->chunks == SKB_EXT_CHUNKSIZEOF(*ext) +
+				   skb_ext_type_len[SKB_EXT_PSP])
+			return;
+
+		tmp = *pse;
+		skb_ext_reset(skb);
+		pse = skb_ext_add(skb, SKB_EXT_PSP);
+		if (pse)
+			memcpy(pse, &tmp, sizeof(*pse));
+		return;
+	}
+#endif
+	skb_ext_reset(skb);
+}
+
 /**
  * skb_scrub_packet - scrub an skb
  *
@@ -6380,7 +6405,8 @@ EXPORT_SYMBOL(skb_try_coalesce);
  * operations.
  * skb_scrub_packet can also be used to clean a skb before injecting it in
  * another namespace (@xnet == true). We have to clear all information in the
- * skb that could impact namespace isolation.
+ * skb that could impact namespace isolation. Note that PSP skb extension is
+ * preserved across packet scrubbing by design.
  */
 void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 {
@@ -6388,7 +6414,7 @@ void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 	skb->skb_iif = 0;
 	skb->ignore_df = 0;
 	skb_dst_drop(skb);
-	skb_ext_reset(skb);
+	skb_ext_scrub(skb);
 	nf_reset_ct(skb);
 	nf_reset_trace(skb);
 
-- 
2.56.0.455.g6c5a503b38-goog

