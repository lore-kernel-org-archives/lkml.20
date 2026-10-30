Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334711;
	b=E1Gfu1J4nBLT9LAwPssTHTIE6t93BuUT9dsJ0/dq2AywX5H5y6WE0UXBDnnvvnOjE6iD
	 wR76lIbZdHwTZF7dyIv1a6UScRzSBjRIE6Hd/AzXhCtvuP9hw/IBGiNK1iHoHzZsnFDxk
	 6W/WAZsTvj7fRTGrj9Kdj/Jwm21Oa5Lw6ENG/hNYNVQUlv0Y9qnBuGcTR8vPdSb+aSihQ
	 Jb1GOZQLtO3Gpjj7IVfu9hANO97Ko21FDKWI2dDx38R6K0s/xc2V87WzFll3GUSDx+dpT
	 CFLgSW5D/ebpNwrfh8uQJ6hbUBUZObn4EREKICe/yvh+WuWyyVaO+NJGy0PQ+GOQEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZziXw8Mhu/MliXEzo41WRhscDvJYaH0eawGMV1Y+J3k=;
	b=KlQyBfpL8ujOKTPjAEaGmr3LlKDhLiYC+vxADE5LlFdWWaTeAzJ+vg6JbCcYXPw8AqDP
	 tDA0QeSLG6B/1Lswy9sd1ffriVIcJgD94ZchSnovUB4WalFKCQEAJff2WoQO11qcitiKK
	 gRzDPSxskmPfYo9waECfk5ZErsMHn0mvDpr1kFJKGNnL8vh9EheIwZajAtmSy6Bga6rKW
	 iP0lHZn6PH9v5rVd+7jICo+5SpYg0JIfxIFq7Ve8Rq9PDh8aFXF/Jndr2lU4CaKuO6nic
	 Hq4TTwul8mRRTxnJx65beCQV7mVK2LCGRbapi3OVsyFEKXsYnoGnY408Vi8nVbwwnsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bn+lZmgA;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EB2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bn+lZmgA
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso232572a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793334711; x=1793939511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZziXw8Mhu/MliXEzo41WRhscDvJYaH0eawGMV1Y+J3k=;
        b=bn+lZmgA+J+K0XjBuCBZNUoxB3sifXpY12KNQK8KWDfMsytY/wKL2pHp1dJSeGaE7D
         ZEQazoGfio2Txj+JSTcIdJp8Go/uOHd/z/DwJda2mi+om3+f7rBQoCQjudXJzEtzSRbU
         cWGw8il0bjvGIaTWl3bxtswJiBGYmiT2RsV5EssKW18Rx9648jrtMBg8BMZ4bLo3ZqwP
         sB6MXxj2q/+KqtpYAfNKggECAH7Wdd82b7Sl5NZls6i2eWJ1WMouWQnM+ptnw/hfiHit
         ObpC5AdyslPLqOAFvuWsvcN74r/8beARAhhFgy8UE1fkPiglm5jiYEv5RQgilBA4E9sx
         PfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334711; x=1793939511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZziXw8Mhu/MliXEzo41WRhscDvJYaH0eawGMV1Y+J3k=;
        b=hqtO2+Q0vcTU/reW5UAb+x45GAJJXsnZYzutXtLsw6+sUr4Zz97vcUXM3o+frvLrt2
         JLJD+X7j+99wFRAN1Aui1t3ADtc7wVhUDXdjLPEvYsEpvtIBjnKw6cStKM8c3WTfz/sf
         ce18akPawkSi2mQG4PGcCORU3qgV+JHRdb37jnXRrgtV+8elqI4l5GWQ83zoZprwJFn5
         xjpLijBRSKQHbMeZv6qbqUw7yz8wU+TqRaEHCaVWrqOfqiqN1q8KYfjdP0Mo5ti+AnbG
         YR9ydIymr5IcZoVDAV7rkaJ4yumdvpd8w6cEhpVbG0JFn58tNgydcfQU8x3MRG019mD2
         y0gg==
X-Forwarded-Encrypted: i=1; AKwUvBzNo+TfeF+OLuro3HP8brVlqV5yxnf/NoKl7pBuV0spPlSznBhthMml5W3z+TdnitjX+ojr7ia6mseRUwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAq3WIXBf0xJLNK5JvXP+fUBgZfjLzH1P2B72burs1z8uR/aGT
	KoP+aUrYnV+MbZJb6o2ai43KJglMADAfZ2PgRl8AvxZo3DJpLtHd3lSZOrT6RTunyY8zMRx9fYI
	HdKkkCg==
X-Received: from pfbgi11.prod.google.com ([2002:a05:6a00:63cb:b0:8a0:4085:d831])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a94:b0:3e1:8a37:bf1e
 with SMTP id adf61e73a8af0-3e928a78297mr835173637.42.1793334710498; Thu, 29
 Oct 2026 21:31:50 -0700 (PDT)
Date: Fri, 30 Oct 2026 04:31:44 +0000
In-Reply-To: <20261030043145.2185700-1-weiwan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030043145.2185700-1-weiwan@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030043145.2185700-2-weiwan@google.com>
Subject: [PATCH net v2 1/2] net: Make PSP skb extension survive packet scrubbing
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
reset the extension block, and re-add a fresh SKB_EXT_PSP extension (or
clear skb->decrypted if the allocation fails).

Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")
Link: https://lore.kernel.org/r/20260910-bpf-meta-inside-skb-ext-v2-3-0b21e42180b0@cloudflare.com
Reported-by: Daniel Zahka <daniel.zahka@gmail.com>
Closes: https://lore.kernel.org/netdev/DLODSKPY6ON6.1G6SP3CFFLCPJ@gmail.com/
Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Wei Wang <weiwan@google.com>
---
 net/core/skbuff.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 93c2f440b9ec..5c4a2e982ebc 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6369,6 +6369,32 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 }
 EXPORT_SYMBOL(skb_try_coalesce);
 
+static void skb_ext_scrub(struct sk_buff *skb)
+{
+#if IS_ENABLED(CONFIG_INET_PSP)
+	struct psp_skb_ext *pse = skb_ext_find(skb, SKB_EXT_PSP);
+
+	if (pse) {
+		struct skb_ext *ext = skb->extensions;
+		struct psp_skb_ext tmp = *pse;
+
+		/* Nothing else to scrub if PSP is the only extension in ext. */
+		if (ext->chunks == SKB_EXT_CHUNKSIZEOF(*ext) +
+				   skb_ext_type_len[SKB_EXT_PSP])
+			return;
+
+		skb_ext_reset(skb);
+		pse = skb_ext_add(skb, SKB_EXT_PSP);
+		if (pse)
+			memcpy(pse, &tmp, sizeof(*pse));
+		else
+			skb->decrypted = 0;
+		return;
+	}
+#endif
+	skb_ext_reset(skb);
+}
+
 /**
  * skb_scrub_packet - scrub an skb
  *
@@ -6380,7 +6406,8 @@ EXPORT_SYMBOL(skb_try_coalesce);
  * operations.
  * skb_scrub_packet can also be used to clean a skb before injecting it in
  * another namespace (@xnet == true). We have to clear all information in the
- * skb that could impact namespace isolation.
+ * skb that could impact namespace isolation. Note that PSP skb extension is
+ * preserved across packet scrubbing by design.
  */
 void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 {
@@ -6388,7 +6415,7 @@ void skb_scrub_packet(struct sk_buff *skb, bool xnet)
 	skb->skb_iif = 0;
 	skb->ignore_df = 0;
 	skb_dst_drop(skb);
-	skb_ext_reset(skb);
+	skb_ext_scrub(skb);
 	nf_reset_ct(skb);
 	nf_reset_trace(skb);
 
-- 
2.56.0.317.g454f8302e1-goog

