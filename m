Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD13BBFBD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345753; cv=none; b=RvDSa4fVt4l0ymX40qLIgBhygWSNo9dhf0KVzY2667B29kcvbWial0BZO+d9qVoz2gNVAC63QFQcyXN6Hh0e8GUAWP43cR+WkNMXX3M9mZ3BxLn8AtWZC8XplPBwYIxpPr7a76nVf3PynwCt+dB/9pLrN8KgdOAchWHANSZLS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345753; c=relaxed/simple;
	bh=HMtSkZz2ZwPqcJHkY55gc25r+vpWT37SCT4ZLZaqegg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcv6Cy9qHxVAYqa7/UH3ZKy0lBoqcSDUqSpscpJY73f6Yd23lQrZytO4Xce7jHROeY/i0qODsJmh5cLp/tyHEUnxOyUZT7sz+yhw7U9THJZhzowmUMv9TwKZ5QXvDLCnwWYJuPU4ZTfyuF7PDZyMr/MScGnMc5JEQOdMy4UI0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Zx4LyFYD; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Zx4LyFYD"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c414e5d282eso147907366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345750; x=1792950550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlOGk4B2S+sC0KxKSWrB/2y4+wcPHldmFXjF9XSW5C4=;
        b=Zx4LyFYDckopX/YcxPxV/0BsTb9SZQKfEAjfjvek+PRDdmQXAEHPx25ZfReUJAOgha
         ES9kttdgJucuwVlaLPxiNtC1WpkMZUwNaYFVl7lQEkaHdX/XhA9CTxm68rPSl+65+Xtj
         9iLifZWX78B2opf/aHV8rOeqwL5COnOhrctPPfejjV7+iOp33Q+S3AsBz4HWFi0pRDv2
         6a3kZ8h0GSGkrer89XZqwHZ6k7h9jZSi65z+Jpgc9PW8C+R0edlTTcrqrTj11OejeWSC
         /lN3/btM5etsk7yP061usYCp0uBFFhAK8LDY9KrOe8Mg15Q+tMHz+g6twzSxKekBlXMG
         X9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345750; x=1792950550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlOGk4B2S+sC0KxKSWrB/2y4+wcPHldmFXjF9XSW5C4=;
        b=BMC7/1n/AdYSiTrbEao9ZyxwEIa7Uk+v86r58Ovf/MB7lQH0PgVV8ELOK1HCeUV5N6
         KK7w5XDYJYGll136p1ijhIyIASTOBSQDiv69PioV2oiHFRXvQcpxOBMf8CEqVSQSCy2D
         d8aZI+KJexN7txr28xv3r3upSFMUI3VW/ww7G5mGugGHsD2VzZ2u4qdtAET9Ooeuc9Vk
         G/CgQRteaN8pJCdGHghuvUQ5wLM41OftYqGrB1lGLzXNoVPGaxW+5ww5Erd/d1rF1fQX
         i3SrNmsUXLFsgSL1JeCDLgKiiYbXnSTSuzBVxOC9L4ZrlTUNH2Ns3/PJyvYpjKOxSQOn
         ICsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5GXhwyeJIl6rP12TL5ubxqKpZX8eZSGMHG4PkKqS0BamXmOivudVRhopznUK9AnW3UMVs0tGJhwxeaFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/SLepCwOW8IAlPpibdF18WQdAnIzFZyJnhbKeCWJqJEswBPfx
	YVwKDfjBdXIkcAjsTbEFFfSVBhKQ1KK0bfLlbrFokpu/aaXAAiabAxWegfl/zWp/eQ==
X-Gm-Gg: AYBFou0w/wB6LO1L841KNXNPoqOteXL8KRELaoKEdsrrn1tAlHgYH4ep6DpTpUNrOvr
	H0hQnGzMh/qzRNj7x1JD9pit7s+6NF4HlANkftqTI4MGnqOo/DJZ+irJz7dQOtTs01kBVCyzjR5
	ivyUnM422QZX2hBnMj0yle+Z2Y8V4WvfqJxBjqm1/oUOH5DCb3fUNFWn8paPopVp37aR1FnF7Ir
	0LJGmGQ/OEAI/KNQREafH2cNAupPHUTLMUge6QX784TVGZQwxwpQ+FpwtkpLvtq98K09MzxH0vj
	P9l292gNLgiChFN98n9HtozyYVBSUgSTUsh740Ix3DTpMdq9QH/aI8hYiU3oKNGNa3DRP77h3a4
	kDcD277Qy61GwPczWINeuNVWS3cxApGOcnB+DzAj82cyHfn4OpM3TM4P8VLH+VfXGF1/WP3t1th
	NfqoSV127zMMKXdOX3X7XF7otQzKc+EZpcMv7TP7VM5KDHPR0mWTOTU0wN49K9MyTwIo1xQ5uxF
	MNrLQwLjZXz9OgJkH/3tdwF5WseUBQ+u2rSI40wxfTY4lZKA12nuPWDN/6RtCSdLM6lU1T/kkbS
	EtA85u+QQHJUuOYCKjLfxUip7E3glz8A38SeunP1dA7vGYN1dy6xqHVkAU4wGLQR8VEiEhG3GbM
	4/64nvGrlDLV0aaJ4WqhX7M+MdKLiGdybdzbK/7GSkTPRIuuAic1sNfDgEZi5NpBswcp17gKYQC
	VQsmdWdmXC
X-Received: by 2002:a17:906:ba89:b0:c31:6a37:f284 with SMTP id a640c23a62f3a-c419a05c3d2mr331429866b.1.1792345749860;
        Sun, 18 Oct 2026 10:49:09 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:09 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Sun, 18 Oct 2026 19:48:56 +0200
Message-ID: <20261018174904.1757161-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath11k_dp_tx_free_txbuf(), reached for the HTT REINJ and INSPECT
statuses, frees the frame with dev_kfree_skb_any(), unlike every other
tx completion path in dp_tx.c. This leaks the tx status clone and idr
entry mac80211 keeps for a frame whose socket asked for status, as
commit 29d15589f084 ("wifi: ath11k: Cleanup mac80211 references on
failure during tx_complete") fixed on three sibling paths. With
NL80211_EXT_FEATURE_AQL, set by the next patch, it also keeps the
frame's airtime charge, and an access category at its limit is never
scheduled again.

Free the frame with ieee80211_free_txskb(). Neither status occurred on
the hardware below; the change is by inspection.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 083aca8ff355b..f7d3cf0ff0358 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -305,9 +305,10 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	skb_cb = ATH11K_SKB_CB(msdu);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	dev_kfree_skb_any(msdu);
 
 	ar = ab->pdevs[mac_id].ar;
+	ieee80211_free_txskb(ar->hw, msdu);
+
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 }
-- 
2.53.0

