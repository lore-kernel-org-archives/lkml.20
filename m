Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDE3E121A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702816; cv=none; b=Viqg27O1xnK+JV3xsOBe7KLMv720eS7ljT38HCJqwhnjEEXd+h6EiWQ/qYYGO3LG7IXD1YIV6MSC4ufA8hV22wrw7SH1+c1Ar3nUqUpjjItnUIeHBGxkUurvYPFybqp2zfANw0uFac1taBme88Bpzjdshbnhc3QzZ7lNlmO0khQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702816; c=relaxed/simple;
	bh=WhlzzhRCicb1j2i2d+/jwh7J1No3blieLLU3VJwXzBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhdh+18GOkb+YUGEsEixAf0EYZcC3KIDW/C7zRcnZoCs+RkRaOeVdxhP5xGQx+9Ur2upDi3ubWo7z8hoF2woNhfDqrmhkzTQN5AQt50SgxIffRhir3aA4wmFSBRAYvKWbcD0IzIB+mCZiA0WcUl/RdABR1JzaIJKs7XybsTfr1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEDipd0s; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEDipd0s"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so119712a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702814; x=1790307614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRYy8S+vbAvgrHPn+nros3c78n1/jZJq1PBt4RQ7keo=;
        b=WEDipd0s4qfO+l/qsqaNZakGEUj9Lkeqd5Xs9OKIU4eTSAwNLdbvxw+4YVMUf4P5He
         s/KN4oeRRwXz4VezZrjP7Xf5LR0aV1mHPr6iLvB4yEXPym9wVFYhwo8pnp8pQ+RV8ull
         w9rir8xIsFtgutcpTv7Dd2KSoK2jxX+23jgRIptXKtFFGvMshEbXJtszsuQwocpQ9f9y
         pbwYkvMvq6OTbfFAPpVLCQNTwFDu/Zuhe3KKZnhNNOT3n0CZSgDmrTk23IcEIIqRd1n7
         7InL+RzFk+sKWl9dLq+Mk83aR9gFm//hYZcpejxQrOH7VXmZGSl8qfXPXO8ujv63sSwq
         68ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702814; x=1790307614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRYy8S+vbAvgrHPn+nros3c78n1/jZJq1PBt4RQ7keo=;
        b=fGwjHQgs/gRM8Ic9QmTmxtWobs9+145097B/qibJYDP82KkblfHJEgJlk465OgeSi0
         rbnQ/1TCHk1/ni+A5SFEYqdkN/2yIzg/SPdg73TJpTDeSWdzPTLil3l0yinJhTQMtxBH
         NqYgLfYPEDxNagxg1E0Y4bi9N8SOakiBlCGoo06tYK2Fy6Q4eWpG+1Oz7IvAnB8ekUpx
         CoOLwBFX9PSJHGYruHaKnbBQA30ohmQuVqrmzTkA3h9sbA1BiTaoHdHNQ7uuLMfOuvpV
         LZ+LtqppY/UqEW7p5y9e8+ZhIUWl32mKVwuyVpjmsc68OoNTc73D3s/a1Vb4jtuShKlb
         0sYg==
X-Forwarded-Encrypted: i=1; AKwUvBx2rJs1wZsCjgwbUpQDijx3Dwsf5bUS+Jgc4dPPZAmU16Scb/PBvCR77WhT9EnBT4ViouAzcV1JBZI+5Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/CgtN9SJAq64Fmzr+ri9oJx8GtkN7yO6myf32IVGqKfagpdGA
	jHrqIBuzQ4tWqv4/UvFGpKvfEaISUUTebYBi03tWBnjDnRoRC+E1FiEXt1X73Y77cQnXCg==
X-Gm-Gg: AYBFou2yRPTmFTNwfOUOp77G89gRl2jPrY/tSiDIDAO/h3gpdZIxQDItu5J/o3aCED+
	XyIpfBexUV3flvaWGPJhCv4WdPAT9QJREsJWYZeTLRsU7zWQ5CKCGLnhZ2sGyckA/nWpTS9UqvI
	4krcuCRzHcn9+RS+el3+dD413H5ecaiGJYL2pLObUSbCnZ93YaiPBKHDhtaPmsrhjLVoRIQMRQ6
	AoJ/l5HOwzRD1krcJ76cXjkCuFvGythVKbcjUIFCw4PbcOhmZkkHkUnO80cz3wgOXMofHO9+viw
	wOaSsFdHsnutJn5NgfgLfX8ife+TtjQatW7sde2lI/6472V+tf7Maplepb1CqYPray6F/USzhSQ
	04m3Q9WfN7byrVVjpOOb3gmdFaYNuHpujnD94Wqz5bPNNJk5OfDIDU78dqIf4ofGaV2uitiNZUq
	aHsof2+cQvK4rqOhCE8jppCBQiqoNg01j9uQ38lTVBuzQm/7LkUCWb7EzMudCOM61Ilc7RoEtDb
	S9pbgL+E2jZ+32/nDFqkjuSTeOE6E/F2PM9nIA=
X-Received: by 2002:a17:90b:518c:b0:39e:345b:3335 with SMTP id 98e67ed59e1d1-39e54af367cmr3070690a91.6.1789702813731;
        Thu, 17 Sep 2026 20:40:13 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c284a8a2asm706032eec.1.2026.09.17.20.40.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:40:13 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 1/1] wifi: mac80211: drop oversized fragments to avoid extra_len overflow
Date: Fri, 18 Sep 2026 11:40:04 +0800
Message-ID: <20260918034004.85078-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918034004.85078-1-ndaugoing@gmail.com>
References: <20260918034004.85078-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ieee80211_rx_h_defragment(), fragment payloads are accumulated into
entry->extra_len as subsequent fragments arrive:

        entry->extra_len += rx->skb->len;

When the final fragment arrives, the head fragment is dequeued, and
pskb_expand_head() is called with entry->extra_len to ensure sufficient
tailroom for all queued fragments before copying:

        if (skb_tailroom(rx->skb) < entry->extra_len) {
                if (unlikely(pskb_expand_head(rx->skb, 0, entry->extra_len,
                                              GFP_ATOMIC))) {
                        ...
                }
        }
        while ((skb = __skb_dequeue(&entry->skb_list))) {
                skb_put_data(rx->skb, skb->data, skb->len);
                dev_kfree_skb(skb);
        }

In commit 69f132236827 ("mac80211: shrink struct
ieee80211_fragment_entry"), entry->extra_len was narrowed from unsigned
int to u16 in order to reduce structure memory footprint.

However, an IEEE 802.11 frame sequence can contain up to 16 fragments
(frag numbers 0..15). If a sequence of large fragments arrives (e.g. from
a malicious peer or rogue AP), the sum of fragment lengths can exceed
65535 bytes (for example, 15 fragments of 4400 bytes total 66000 bytes).
Because extra_len is a u16, this addition overflows and wraps around
modulo 65536 (e.g. 66000 wraps to 464).

Consequently, pskb_expand_head() allocates only the truncated amount of
tailroom (or is skipped entirely if the head fragment already has >= 464
bytes of tailroom). When skb_put_data() subsequently iterates through the
queued skb list, it appends the full payload into the undersized buffer,
causing skb_put() to trigger skb_over_panic() and crash the kernel in
softirq context.

A legitimate MSDU in IEEE 802.11 is at most 2304 bytes (or up to 7935/11454
bytes for A-MSDU, which is not fragmented), well below U16_MAX.

Fix this without increasing the size of struct ieee80211_fragment_entry by
checking whether adding the incoming fragment length would exceed U16_MAX.
If so, purge the queued fragments and drop the frame.

Fixes: 69f132236827 ("mac80211: shrink struct ieee80211_fragment_entry")
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 net/mac80211/rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 5e26be8e27d8..e7292d5febf5 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -2499,6 +2499,12 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
 	}
 
 	skb_pull(rx->skb, ieee80211_hdrlen(fc));
+	if (unlikely((u32)entry->extra_len + rx->skb->len > U16_MAX)) {
+		I802_DEBUG_INC(rx->local->rx_handlers_drop_defrag);
+		__skb_queue_purge(&entry->skb_list);
+		return RX_DROP_U_DEFRAG_MISMATCH;
+	}
+
 	__skb_queue_tail(&entry->skb_list, rx->skb);
 	entry->last_frag = frag;
 	entry->extra_len += rx->skb->len;
-- 
2.53.0

