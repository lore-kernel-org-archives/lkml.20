Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769133;
	b=zpaVjBWRfRMcPOsQtNLZ5JE+OGc34qBoQsf7BBFIpiq5KOQH7RtQwmfE9WWOwIf5S9Rk
	 T/V29pXc1RiHuHH+A2kVA8dnlbEoBT9uue06wLpg5yhZDdGv2GB0iHJPVx8apKn8VkBD4
	 K8lOSSe0KzIgSASIEM0V7L/qsfNr2eMw2zAUNS5E5KxceV2yTreSFdFb3c5gBzy7hMS8q
	 z5jqo8hTbTECRsqz+u4C4kciOx1VGC7ERl4mAcZk/pFVPtNoEalGMMqSmBnLONFNERLqe
	 d+ThOJyJlxv9mTshkTMIb65GGq3NrmMbts5EsYPft8Y+3l4uMxGm0+Q3NfxiQQLaLag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
	b=gPUQqu3VJ9vf0+aKNGJcxTRW0m7Aq8GFutVeoc+Hb3rgyZtAtuZ1zZ3IN+52oA6zvR9Z
	 0vc/R9/EYGP2MPYuy5jYQNOxPEgdj0n1zqkJUYEofp186cOYpeglO3yKCW0dsHjJVHkF9
	 xasIoOO+iw2Rb58CnYt4CkWgdfWrk+WsevnMiDfy9FNyj3PvSqGtJ/CUMbODVbuFSyKtG
	 /9yBCRt/5FT0NM6Xpbm+bSAbZk5lem0lPMM+OX0tN43VtbiVIFPqBpCoRgHqt+hz0tD2c
	 A5ADMAGYTdbJTBKEK08157+vbsJpvAIqIirbDLpIC+tZuQpnlXFLrfot9myKeCrJLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUVTrE+h;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686DE606A89C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686DE606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUVTrE+h
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2028174c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769132; x=1795373932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
        b=nUVTrE+h44fpfEqaLTkpMiSxzCY1ODqEjM4kazkgCVKQqyXisKUc6z8FX5n997A4e0
         tlYsMrauFcu0OaCdlAZCmOhTz9c70jQunJMFn1TLeFEy8ypOBzEFdmda4H2RN/pe4AXA
         Bq/mX42qQcbzwlZwpJYLLLJqA/Xv8Q78ae+E1rKe8EZm1916ysp+jNouDSfMAjxebEzN
         qtHElnaU54EEjMUh+Xne310qRFDXeptNmCHfDpdBSLJgVKZb1zJmRrtjUIUhx2tFygzU
         chnliIWwmAxz2f8DK1+dnq8TsxqdWhGXVtR9NYRzVv0Nvjrl6yosZFzY968aV87im+2t
         Onmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769132; x=1795373932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
        b=ljrzLfTg5R2rJEEOz2e+tQ7SGUuh4E/APywbrCbTNDmb4YOUKWDOSBJCvy2TrAvihD
         5cWnd0q6fl6vaeX9a325k9EnCZBKBUFwhTi5GaV5/Fg1wlE5NQa2NcShVZtULvyBbr3F
         5s07o+B1LJ3joGAf1eA0pnILB6cKtpTsIkEvJ5eOmFPqbW6pTFLol+Ckx08GcwT/MCZL
         yXNUHcX1//zOyBUP5ZHhhKbajyPKPWw6Jis8tp6/84ORhgxkLxVl9g1mlAhYemCLjZY0
         bkhyOhUh8/Vg6UKuY+NsqSBkq6tni6N93zIdbKqES9OmuibKTVbZRV+esZGlHlMFQxI9
         kRFQ==
X-Forwarded-Encrypted: i=1; AL+hErE0oU1dQiFwJ8XGImaMIRRe7+330mrvbNe7p4N3IMB2+h6rq5cia76z22WWy447MY3vWeEACzo/S+vhm8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TcfQ/COqFahIj8MkAcfI7FLC+J5mqr1giFDRpes3LAss8BeB1
	3iUY+rKIOqTYVwIMQFb6yW55xXFehS8nN7ND8bIGllxDkurFSTJ2+jues/14lGOn
X-Gm-Gg: AYBFou3wwmB1iOnAvuxPmgeLY3B5Sxd5VK91hd7rploeCAH8mVwqFC57FcCPBNH8SPT
	cRegQ4wZee+pxoPbAcAXl7FLSRgiWLSYvSEqP2q22MyayWnsTj3jD/nWTYc1UKrojv4Iujc3BBT
	mfT81iaha2bWhJiJcmpkS5S+QT3q/05HDEPyKduPRdgmYy1VKJ5/dKeHwhfk4JMyOWs6dmsADVU
	3HRCweuvcdfLk6ku6o0OI2X5JliyGMpXciqMayzmozILV/c7Lm2822YqFfe3Xz6WdZ0i4GPA4R1
	YzvF94KMPs7vJ103p4aXqM9U8/E7NHQONj8YjYCSAy5qpH4g0KQuJF3O9TbzsoZbD7Q7adxdo0e
	ZqaGexi0HsY99DXtvPTPorxo5MDq5nZC2Lob9vCefegUN3y9HIP62HNPra82pUYa+hUnQmrozKW
	F3AcFVxyAl1XOzLs7TsLvtjRzjRdWctSrpyx9kCyXwPyP5DmRKdwWdxK9aW7wJMU/Dm7TrfcYbh
	gsf4Q5GZDDFSOCPwuEhAqssnqN4V0GsGM3GXY7Gt1eav2yC4de621EE6BWIxwk8etBjscGNl4YB
	MH7ae6Ht5MVJc/K0z9N/kF2PkFuvmb0eB5y/knv1aR2E5b+JbakjHg==
X-Received: by 2002:a05:701a:8148:20b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b5030ad3f8mr7907297c88.15.1794769131451;
        Sun, 15 Nov 2026 10:58:51 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:50 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
Date: Mon, 16 Nov 2026 02:58:42 +0800
Message-Id: <20261115185843.64633-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115185843.64633-1-maoyixie.tju@gmail.com>
References: <20261115185843.64633-1-maoyixie.tju@gmail.com>
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

brcmf_fws_rxreorder() allocates max_idx + 1 slots when a reorder flow
starts. It then uses the indices of each frame without a check.

	rfi->pktslots[rfi->cur_idx] = pkt;

A cur_idx above the allocated maximum makes the driver write and read
past pktslots[]. An exp_idx above max_idx makes
brcmf_rxreorder_get_skb_list() read past the array or loop forever.

Store the allocated maximum in the flow. Bound max_idx by it and the
other indices by max_idx. Deliver a frame that fails the check without
reordering.

This was found with a static analysis tool that we develop. A userspace
harness that compiles the fwsignal.c functions unchanged runs under
AddressSanitizer. It shows the out-of-bounds accesses and the endless
loop before this patch, but not after it. No hardware was available for
testing.

Fixes: 87edd8916ee2 ("brcmfmac: add AMPDU reordering functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 24 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
index 399b6810e394de..19cecb987a87bc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
@@ -52,6 +52,7 @@
  * @cur_idx: last AMPDU index from firmware.
  * @exp_idx: expected next AMPDU index.
  * @max_idx: maximum amount of packets per AMPDU.
+ * @alloc_max_idx: highest index of @pktslots, set when the flow is created.
  * @pend_pkts: number of packets currently in @pktslots.
  * @pktslots: array for ordering AMPDU packets.
  */
@@ -60,6 +61,7 @@ struct brcmf_ampdu_rx_reorder {
 	u8 cur_idx;
 	u8 exp_idx;
 	u8 max_idx;
+	u8 alloc_max_idx;
 	u8 pend_pkts;
 	struct sk_buff *pktslots[];
 };
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index a43f1a38b0e30e..e81105154d6543 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1721,8 +1721,16 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 
 		ifp->drvr->reorder_flows[flow_id] = rfi;
 		rfi->max_idx = max_idx;
+		rfi->alloc_max_idx = max_idx;
 	}
 	if (flags & BRCMF_RXREORDER_NEW_HOLE)  {
+		cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
+		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		max_idx = reorder_data[BRCMF_RXREORDER_MAXIDX_OFFSET];
+		if (max_idx > rfi->alloc_max_idx || cur_idx > max_idx ||
+		    exp_idx > max_idx)
+			goto bad_idx;
+
 		if (rfi->pend_pkts) {
 			brcmf_rxreorder_get_skb_list(rfi, rfi->exp_idx,
 						     rfi->exp_idx,
@@ -1731,9 +1739,9 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 		} else {
 			__skb_queue_head_init(&reorder_list);
 		}
-		rfi->cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
-		rfi->exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
-		rfi->max_idx = reorder_data[BRCMF_RXREORDER_MAXIDX_OFFSET];
+		rfi->cur_idx = cur_idx;
+		rfi->exp_idx = exp_idx;
+		rfi->max_idx = max_idx;
 		rfi->pktslots[rfi->cur_idx] = pkt;
 		rfi->pend_pkts++;
 		brcmf_dbg(DATA, "flow-%d: new hole %d (%d), pending %d\n",
@@ -1741,6 +1749,8 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 	} else if (flags & BRCMF_RXREORDER_CURIDX_VALID) {
 		cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		if (cur_idx > rfi->max_idx || exp_idx > rfi->max_idx)
+			goto bad_idx;
 
 		if ((exp_idx == rfi->exp_idx) && (cur_idx != rfi->exp_idx)) {
 			/* still in the current hole */
@@ -1811,6 +1821,8 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 	} else {
 		/* explicitly window move updating the expected index */
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		if (exp_idx > rfi->max_idx)
+			goto bad_idx;
 
 		brcmf_dbg(DATA, "flow-%d (0x%x): change expected: %d -> %d\n",
 			  flow_id, flags, rfi->exp_idx, exp_idx);
@@ -1830,6 +1842,12 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 		__skb_unlink(pkt, &reorder_list);
 		brcmf_netif_rx(ifp, pkt);
 	}
+	return;
+
+bad_idx:
+	bphy_err(drvr, "flow-%d: invalid reorder index, ignore this packet\n",
+		 flow_id);
+	brcmf_netif_rx(ifp, pkt);
 }
 
 void brcmf_fws_hdrpull(struct brcmf_if *ifp, s16 siglen, struct sk_buff *skb)
-- 
2.34.1

