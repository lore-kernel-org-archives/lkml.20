Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808882;
	b=3WT+gAdMt2xoAJWsXjbMhcefudC0ZkB2/E9yY8tMVCDDzvfpxp7fD3e8XL1Sp0SxyyCl
	 JVCeLBnQ7sKXJzcJpvGe9FGsv1rd6gqb3rbgkBgYIvnzJOIU6YIwi3Fn97K8ccvivN/sg
	 q+F8eQD6GnC23LeoLA1psd7+1lsBgpPtaeLlQ4DHJJfiTZO2XniM4R3p/mjl1bML4ZCRe
	 nIcewaHR397Iqi2bCVhthkU4zrBvHl7ywuOX3Zlb8w1spgiTRL9XbQQ7l6wnqNuSY6mRk
	 HrUTLIkOAgjreHFRhMMCO+K/8VBOjYeQaP5pJUFfFdBRh8S2Q6UsjCoETd8te/trrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=vJVTQAafEsVj7hyPeCUYTmERk7nU/bZ/qQc3mF/+p7glY72t6zKZAjJjcURqM6XKIRpi
	 FnA3F5chCc9Cs+vlV0R/FCfAsX9LEiZDWbdCqTmkmSfepwLUMVGorom9yJbPoFBiwXKLR
	 NNOJxeTAdlcgra4L9z75had8f0J+meOiCctwjVJDNUyvJArS7hrJaMVetlNYufQsx6crX
	 7Bd4iuuY97XO6Bj+lg8zjBCjah8jsdcheVAVzO26CTSfTHsy/qdGFd4tCnSrxMHFHmaW8
	 NopgJ+5uP0/7q12gDEWrOPlGdO8oVne9a4PbZ6IgzDbw21mJOrEQPh/dBf09DdPbeoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx56x4fZ;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82703606A899
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82703606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx56x4fZ
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f48c750afcso2497216a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808881; x=1795413681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=Xx56x4fZHENreaibOQJxd3BcFbCwzQM/QbbLPcvvbQHwFUJtXrD/LVH8ONfHv8yQ3t
         PbBGA+bbkNVy+7coQQFSg/akw05l59WvVDM2sSM48LZyb6VmWep/6ikll1KNtSSBFIiH
         SeP3BqZatpaDMuOEHrNb6IFKI0Gdmw4ZBrVeVzR0yAxljB3vhokVxTx23LhGOfr42Szo
         mFqqiUeGW1e6KhRMOq8lr+KkU3nZ1CT+LuZ0FB0EQQ4xmdb5QTiQailRQ3KFZlFVbh4I
         /LT9g+1IfwXpNgx/cW5ICCKBssPi88WYjS4yMXAw35D/N2Qr+Dzo3u7XekuiI6oRRkM9
         wtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808881; x=1795413681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=dJQLAfQuFg/Du3Ypuc0XDBWzM4YD0oGifN6g1ZNS4TggEqBirn+1/Or7v7IzOfpBq+
         YvPxwZdoRrhsIgLqhuhYgPXTPT8iBzDN8BTGUxq6Bc+W4rpUxLMLOx8oS/qOourlnEuN
         OuwxVI2tf/UGcqYyeLIVE7vrtI2ohsSdSfzxd3ajz70BG5jc7fmzb/FcxRr6mScmftl6
         sV6mS2s6kP/uwEukDT0G5371ItpWj9GZr0jhTRTcJ1rKyfj/BqMzIzBfA6l/medsOeOS
         TzmDjxe+TwGKXnBgwJdPr7DG5nSNlPGlNHQWbnBFUOoffIG4/yRwaP9BEjeS/d1PZO4s
         TAJg==
X-Forwarded-Encrypted: i=1; AL+hErHpPLqJY+1rbVylN/ya5C2aB1majLf3a84fOJ9OPFBm+EXSg1tG1Bjfi6YDUk470FXaKkCEQIwQD9OBHXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cw9x+E0/MxHm+egzS/J8MWDYyo1SLX3upLlZ3NxA7LIo29pP2
	XinWxf/6CidIaUNKA2KSl9OaQkStfPXYqKV9qXkafung76KUIfF0eMlp
X-Gm-Gg: AYBFou3ZKyV2wVTbuoKSrioNgYB9L8g03+xmT0dRut3xhEWonESFBOx+InvR3u1M48o
	vps1OdAUL9XnkKb2PPReK+ZS8BD/UVcWBHaOQTaXaMJmcBU8NIYfbtp2I2+UK+GUdg8XaDkunz2
	y2DL1ObfeSzrVpvxcEZUodm7kPDF4dTyS5RTVkzO1CwooN/uY+uzMd/y7RCodASr4juvNZmIPYq
	EgfB5pLy1dJJ12YOQDKmIj5n0BoNGZ2L0cQiTSQV9n31VXjRVeTLGZUbl0/jWXftcDJeVbJfurk
	kQHSm2mYmK5NaZQDTPiFKE4yCXBcsg6D9sd1AfPrAitWuPgIUVBqGgSW7WylFOgjE1jn8c9IuFZ
	/3qnH1eI1CTtxg6VSgrExIvh1wf313LDMp15RK/+lM7mx008XeoykCJYvc1h46kAKBKDm5Jz9Iq
	dYNYAJD+/NV5fPh85gdtwCTgIk6QswMa0exdAjeKLTCuljzGaRROsRrCDGzr57DjA3rshtRA7gg
	J+BPt/Sb8OXmBrIxILu90es0h6/tF1TTrVYcVAj4uuVrRRCnb2x5yz7BdSOnxlUpwwlhRiF8u0M
	a2F5wQ7dFbbo4tYAM1KQdpf7C3E58VLCSgGzYgEn7u5z/ELPaXpPUEgH4cPwLGBCLhnrp6F+9i4
	CUf6NYrhCNNd5fY/S1uE/N7msOoHsaSTeCPOIBOxy1vy+r3xwI3nqbhuthT3bjXY7X9Zy0Or5jR
	cZB+MW7rtOpA3dhTkcLcJCbLEPrDCjpkDBzsMnUqPvJOPzlJyAcEA=
X-Received: by 2002:a05:6830:2e11:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-8628980b3demr10326540a34.6.1794808881474;
        Sun, 15 Nov 2026 22:01:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:44 -0700
Subject: [PATCH v6 3/7] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-3-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 405ab9a78955..040c12d07db2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1185,22 +1185,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);

-- 
2.53.0

