Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334161;
	b=PNBJOgui+f6tPSq3o0+Xbl/+q09U/FusNsAjwnhIaaRDzpB5T7PM+YPn/w9PpRDobtnc
	 F9g4JvX33OxbYf6YAblvy/w1OAGa2NR83VPFMnid5Y/Q6xaztx9CHwWkQCFmOH1i95tL9
	 ax38T8keluoExzrKHQInjZniipUADV4I2M0hCkgmn2EOGDc5LoFoCwt1XdgW3jbA+5G1c
	 73Q4kCyJMe4HxXvraa37TkKGj2WIwhRJLCB8YB5N6YlrMMTYabKId0LEcTG4FfChs+Fp0
	 qUeNeg9TTgHoiF7na5JRP1LWUsJDtX/vn2qygWOn4Q9yHwLw7fLTLnihWxSm9K7TyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=67W27p/QagU+bgmoCOvDgTbuvJiSS6L9t9Om4gfOTck=;
	b=VCc5s+m2FrzdSS0mpTLqBCGX6CPq7+B+leaA1aoaYQfyGcXcwW3dtb2Ryo9g5ec42G5A
	 ieACqknW7UbaMh/KefmpGOqEkL90O3LUrq/FABSAn0LXtOUanwf2HZXD/ukZS87p7gp8x
	 ohYqQ1OMqU9Ph144h3TETHu3qCWWZe+csFOHDur2Mu6AXQxP22vKRz4Yd9f7cofPJJuhy
	 RXGain50cxAIXaQHSrzrivervbvtPKr+qKS7YOkNGR/vAmKUnHeu5fkGJxcANFCGj0F1G
	 QAXXJAux53133Jc9+ZllHz/p6cA/U2z2KujisS2AAS38+Gy6EwfXxI20INRy50O6xuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=aNhDxSLy;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACD6606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CACD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=aNhDxSLy
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a77761ff8aso200451fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334160; x=1793938960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=67W27p/QagU+bgmoCOvDgTbuvJiSS6L9t9Om4gfOTck=;
        b=aNhDxSLyz1ZkZUffll5tb/D9lBZYdQj51d9JB9BCY+u3aDDAsZHi82xdG/llhnRlZT
         gMdeEH11C8c46kyEN/ZoCYdOHPAzncXjp2uRi4YXr2+CdIQPG19lTICxGtSKTezs4YQW
         qJPHDehTVxR70DLxIhqAbGeMx2SynNbZsfWFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334160; x=1793938960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67W27p/QagU+bgmoCOvDgTbuvJiSS6L9t9Om4gfOTck=;
        b=1BKJDmEtI96Q41nxTzrBf+XqDzMa7mZQ/9KV3wAQJc7ivAr2OEBIhEjoC8ez8YTxs1
         uv2uERF+i+ObimIRkIihqT2NVYn+Vkuusap0BzNqwicsBnCtEaGlkoWHWMHCsmlmQjDO
         2EJuGsFfhBAN8aeuVIfG7W1+lne49UC0NInjfV6lhus2XfYKLTiihZ+pE6xMO8VBsmO3
         1lUP4RlpulmK0rA/FcRnggkCSiDKyIT8gNKYVO7hFdNBXybRNBlSalZOi3Nj1WcPSQk0
         fNNOhRnXCQBQa86X74wa3eD2xwA9D48DuAfoC2w+i1stb17aJNKZg/wnrEaZ91eR650/
         8Phw==
X-Forwarded-Encrypted: i=1; AKwUvBxs7HAl1vNoAAU8rWWlpT2ZaNBvd4AnfUX3y07A8QPf4XjCsjoFh8GbFXDaNebVPRJGbeqEotEbBLrt+4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSEQGackHrYpVzSLiwyUqRA1CocLNIQQmaWSnnqeOYl+/jXay9
	/x2cvfsKaaT/8mfYt69hFB/OPN4xOOdO28HUxs8PlqqkyqnucsE3s9sMbI0HIr9n6lY=
X-Gm-Gg: AYBFou07HavTG9LxQt0Ujf6SLbYIDQLo8+OWYWNh0J0eR31Xu5D493nDAF96Snc+Z/y
	Ha7qNSS13fx+EsiMGed8Khpbm0NiUxKaSFk0oK4gGVf349qra23dpynd+jTeWO6Y7D7KGhJqpjt
	2ZmG3nY2lukLwUjYWAY1QRhmi0DdEu4rltgK53gUWWxIuXsLwXnDVn5d8lDf/xYjudEVqjgcIkj
	ywrGHa461BH4xbSSe/0SBb8gvYGsVqdWhdZ4x9x7FwC7ZwCDaDF7R15MaCBGjRZUy1/NZvDnB4S
	5iYHsRcL69mcE9xp1Uquv2/5RYtdGWSLN5MA0rDVJQic92tJWlLxapFayISnWNkecgqNmwkmkou
	QcM9Meny/UaBTf5QLeFHY20VBoAYhaXrzZxZYqon0iQ6b2cqCF26CCHVC2eEPugbK6hM7bLIn1q
	e5KNkUp9gBZ7K6NrBpm/3+2CK73p2aCFr4YoePk4mLOsQ9/MTmWx/rXvJ+3Hn38rUEg8CcBPeug
	raa81Nh/+v3Pilf8aFvlsKy2sqeZKrFaleuGfNzsvOEC51CjnZmbvjAtijK0C76af2Z0Y/5IIJb
	Js/KjaAGEX9ynFM6rMPouA6v6F0kEq+iXFumob2iuu5m5VKzfuJKBleAyD36mQZlukb5QcUcFw+
	ACVc0Age0FGLF7r1VDmwdf8TndFemPzrkWNRnMA12YJ2ZJGlH6ZU=
X-Received: by 2002:a05:6808:1925:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5640d919f60mr1177894b6e.8.1793334159798;
        Thu, 29 Oct 2026 21:22:39 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe45587sm703285b6e.15.2026.10.29.21.22.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:39 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] macsec: reject frames that decapsulate into runt Ethernet frames
Date: Thu, 29 Oct 2026 21:22:37 -0700
Message-ID: <20261030042237.74106-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an SCI is unknown and the C bit is clear, macsec_handle_frame()
removes the SecTAG and the default ICV without checking how much of the
frame remains. A short frame can therefore become an skb shorter than
ETH_HLEN. eth_type_trans() cannot pull its Ethernet header, and a second
stacked MACsec device can copy stale skb headroom into a packet delivered
to a packet socket.

The matched-SCI path has a related hole: macsec_validate_skb() accepts a
short_length of one, so a frame that passes the existing length check can
still become a 13-byte Ethernet frame.

Require enough bytes for the MACsec overhead and a complete Ethernet
header before decapsulating an unknown-SCI frame. Apply the same bound
in macsec_validate_skb(), using the selected SecY's ICV length, to cover
the no-SA, synchronous-decrypt and asynchronous-decrypt delivery paths.
Leave other unknown-SCI handling unchanged.

Fixes: c09440f7dcb3 ("macsec: introduce IEEE 802.1AE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 drivers/net/macsec.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/macsec.c b/drivers/net/macsec.c
index 87f3f4bdb026..240ba0ae07d1 100644
--- a/drivers/net/macsec.c
+++ b/drivers/net/macsec.c
@@ -408,8 +408,10 @@ static bool macsec_validate_skb(struct sk_buff *skb, u16 icv_len, bool xpn)
 	int len = skb->len - 2 * ETH_ALEN;
 	int extra_len = macsec_extra_len(!!(h->tci_an & MACSEC_TCI_SC)) + icv_len;
 
-	/* a) It comprises at least 17 octets */
-	if (skb->len <= 16)
+	/* a) It comprises at least 17 octets. The SecTAG and ICV must
+	 * also leave a complete Ethernet header.
+	 */
+	if (skb->len < ETH_HLEN + extra_len)
 		return false;
 
 	/* b) MACsec EtherType: already checked */
@@ -1331,9 +1333,12 @@ static rx_handler_result_t macsec_handle_frame(struct sk_buff **pskb)
 nosci:
 	/* 10.6.1 if the SC is not found */
 	cbit = !!(hdr->tci_an & MACSEC_TCI_C);
-	if (!cbit)
-		macsec_finalize_skb(skb, MACSEC_DEFAULT_ICV_LEN,
-				    macsec_extra_len(macsec_skb_cb(skb)->has_sci));
+	if (!cbit) {
+		len = macsec_extra_len(macsec_skb_cb(skb)->has_sci);
+		if (skb->len < ETH_HLEN + len + MACSEC_DEFAULT_ICV_LEN)
+			goto drop_nosc;
+		macsec_finalize_skb(skb, MACSEC_DEFAULT_ICV_LEN, len);
+	}
 
 	list_for_each_entry_rcu(macsec, &rxd->secys, secys) {
 		struct sk_buff *nskb;

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
