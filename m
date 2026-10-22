Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703504;
	b=Elhruvgo/je9Gtrytv1URCO0KAcb+rOpBNt0QuZq+04OcWfjUVE62WydvfSQ6cbgHs6Q
	 jOOxjb2wlyfbsYbMHOnL46FvO8BfzN9AUv6L5boBMDAZTc26FjHUQxPTpUuPCPAu+QXLA
	 f1KYZ+iwdUM1sXf4asSpwxlfIO5yWLcphxlKJ+tm8cEpz/ltM5TM7a2TM8p5vx6o5pE6d
	 Kj1AARp3o+fo63YcROehWMHm+bH8lqjG/+w3JtCOGkuENslMCO3Xyk97RuR1/Ns3OPZ5B
	 ++fkpckE8XkWOjwwzF2tFiF+EPEqTEGW+0Mml5swiE+Rnfh/G8jUBp63UqBw3/DOqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
	b=lr/3J3eG27kuIFW8TVs0JnHfXX52wA2IkYe9VVmo0cRUFZZ5Q67DhTlaDVAITmiO/wFj
	 1YAgIZ9VTNf5Tgr59C2eJWwn8S6cAfHSE2t4TW/UwIBcCzb/enV2AS/XaJcK1CRj6yEww
	 VjrkiMwEdTTzD6V294CbDAuOoE+JHrytuK27/CNH0IKYzswTXBALmCVD3Bh6IKhRYPf+h
	 llpMKmdyVV9W1ZQvILqQ4M8c44LPHmsDHl3Ue37SU1vV9uCpvBfZ3P+dwq5VkkNsK0cLF
	 OqxZ2oA4ARshzjOVQqdrL5EH6VmTY9YreBgHD2mLX1CP8Dgi+o5+1PAvp7rCudThNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=El094RDy;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C3A606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C3A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=El094RDy
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84d5e56f876so119509a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703503; x=1793308303; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=El094RDyL1Lws/bHb3SBNKi/bky+9gn+9vrrLhK+j5PmnCrRD0pt998UqvPrlz+/uO
         fhyBhzAcLcZ6zZmoaFrIQE/GohnkTtsEsjx4mmsCrwPV4uEB5M44rnp/DgqARi7jyUC0
         QAY2nNhzpPe1uWC/0rEpKpPalW8IKXWXpa8KsFB9k1KsO7mDddstls0u7R2smgKPAlqV
         GBhMfi3Ot1lMK9Rc2CrbVLRkbU7jvXyuSthFq93XpKk0MIqK+kEEe8KruOit/NapzEqL
         /GNKBcRdia5qcLYfDWTTES7+HVr/jzSkDcw7QT6tq5OIH91t3noWu5dvX6SL0lsecDo+
         BSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703503; x=1793308303;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=KguDGziLT0S/rjd1B5oKCVoe4TvZmL6LNm25N9wr3JwxjYAxUr93Fa0KHwr0SCa+aP
         BOiJwMHAAS0mGN2gwpVpt/53guB25rpx6idUy+zljUVh7lUeOE2QNBnFjpJuIERNWvtP
         YzMpQypckyfWcxJ5eRnIMu2v7gjUv2XrfDjGjGAPtSV2w53/WXoKhzb8nw09f73ezm7B
         KePtaiOBR9ynw1pv8PdYbR3LFA8X/P6X4B0XGn6PDZCGZ23w+Iiz3B567eYMrSGTHRyD
         4mGaIfQ8VjTH9rGGWk+ckEQuszmY6nc2a+jGJtqLvDTlsWjCS1rZtVVRDureHZhp4zAT
         L5mg==
X-Forwarded-Encrypted: i=1; AKwUvBxDv9qgJoMa2s7623HQ8V+pm1rs4Bmpn1HfiATPpnKhbYWAzx7thyPK4zGez35eDOoSPQpQkykxBd1G2pI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrdbBmB7O6LijW+dEIAxIw+CJQ51oaNIeeuTby44jFVYqoK3je
	sIaibGnOWFZ8ycCgZz/5NEBYOb/x31eVla66VFF5g5OTXc66zMeOe0sf
X-Gm-Gg: AYBFou1o7knU4rBTSpKEn59V3nxlOwpuBI+Oc7h3Go8wWzm3ciG7NHC2rNikY/GRbz0
	7Lcy1sOLMotbDhahNVMlVnY45ojcauCycPK1MHyEmcGwo2D8SSPPn/GRzq3WEeInMO+zbsdx0VU
	doexmEOYJFel6/M+B7j3jD79I93LqrHqQrvpYJZfSgiJE09iGMl0is8/aDOzrR+5yrx89k1ggWF
	NW5Yf5WfmhkyXETDtAdhn8ncHafRQ2Pjp1gmyAGK8Ib/qbifeayxy6iNht91xJ75Uy/WclcEdHW
	uUsFgqXDUzezBmEYlENVtf7rHVEQLIcnDk4/zhe/QKInmhddYRlNfBniDWoHgIkneu0mTYmGIMM
	iAke0xK6WN6ndWOMM52aiUgINvARcaeQL7bXYb1kwE/Xni1rIybSYLzjOh1Ma6VXpjQYFQxLnzP
	pjjUkFr+ZAJTBaTqYLyHBwvYNcrQ1FONGg0hrXiTlThEDcgiBdmDaz0c2iF5doqrBB3TvmfJgRH
	g1Hx+1gJH8PMrWxlC05beRAW7gqi7sIlncBs/3gc81DATbTPqAuI6dk1qnWQqLvNE9oXqY1HfBQ
	aSmlLGiwSH1pS6JxBUwwpp5E2IKOH5xvoau2jP+Eb+NTNFk8leZXmSqdaIBwArSRZ6m4Bi6/S7o
	GHnbzwdxuHflIIvusu+Hi+EVGTmYz9bnAx8qfU+g9zC8rrV4Niv4J2Zhj0fPALRN9BIQ368cUeF
	Welw==
X-Received: by 2002:a05:6808:1715:b0:4d6:92d4:c806 with SMTP id 5614622812f47-55be87540e8mr194875b6e.62.1792703503249;
        Thu, 22 Oct 2026 14:11:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be934e467sm78324b6e.1.2026.10.22.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:11:41 -0600
Subject: [PATCH] dmaengine: mediatek: uart: clear the active descriptor on
 termination
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-retire-v1-v1-1-3f9b99a9d89a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUrB1sIrXgVcRFmr60oyTKJC1C6
 d1N7PIf5n2bShBGUrdmU4KVE79jCX1qlJttnEA8llamNVfdGkNpGQJnCvlFi5VMY7AkyCygVZN
 Hr/vu4jrtvSrGR+D5+/fvj6ML8ITLFa0fg02gQWx0cz0VDnHiiPOx2/cfk+Fa1qMAAAA=
X-Change-ID: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtk_uart_apdma_issue_pending() keeps the active descriptor in desc_issued
and stores an alias in c->desc. Terminating the channel collects and frees
that list, but leaves c->desc pointing at the retired descriptor unless
the completion interrupt has already cleared it.

The next issue_pending() requires c->desc to be NULL before starting a
transfer. Canceling an active transfer can therefore leave the channel
unable to start subsequent transfers, even after synchronization.

Clear c->desc under the virtual-channel lock when collecting the terminated
descriptors, after the existing interrupt shutdown and synchronization.

Fixes: 2537b40b0a4f ("dmaengine: mediatek: do not issue a new desc if one is still current")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..d9427d56bc50 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -433,6 +433,7 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
+	c->desc = NULL;
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&c->vc, &head);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

