Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464753;
	b=c7h9f2JYLijb4uJXNAPc6sIqJ1dsQxGH9+u5eh3ZHGRMrBlbdJNqnJnYxeFf6PWNpspp
	 VeQxjerH2+jvtUORBno2PNpO/2A/wupEBHHVSsCy1NW/Aze1LcsX/BxVzexDTXYBNo2GH
	 l1jT9G6q5zSw/3zuTI+9cg7Av61IqJj8FELmPnNSrNhwFCIYdlByHhVkQKuPxHVIZtvCO
	 gt6zt1RISpJs+Nm8gNbCyHBwC1R3DRzEtTFqW9QXetwrFZZxoBoGWlzEULNX1d/jisAIC
	 qnjQROx+lopVHEkV9vM4ExpscZwMJ96BgHDpUrsS+oswxQg5rxg0JS+40I+W+4KA2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=R1+L1i/RLGspwirfSrQbhenATKL8HlbeFnXFJuxl/IgYTZ0LQPc7quVioarVJ04hhz3c
	 m27R5tFRQHPC9fIoSf4hfEP5kVayAv2qLUfl7POAfjBwCES4Gry1cZK7PVluJt7HBg6Kb
	 Xgpok+GzAuMATCjR1AfvdZV0isaOkt6tbCFk5215F5dHCwuwSMJx/VTsIqFBg634kGSUf
	 nKSFr9Hk9q1D/fFHiE4ampHwiExRf+DDpOa5k0elrm16EwaMhil9SpueHzv5mBSzPA4hW
	 sJy7zXfwrRmbABVVhxnYCyMCvyfSZzj3YRsUkyIbj0MtC/AdJCPcEYHXiowbMSIrYMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4NX0ko;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D43606A89D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D43606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG4NX0ko
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed39646f04so14941905ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464752; x=1795069552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=AG4NX0kofxyTGWkr7ZMsHsHJMtcdFPkZT3aA4nGIL5e/N2nyEbZ6jN4euwhkSZs6fT
         yCbeX8SacyNQ9bFadQ9anb/qkHtHPdVD6GxC8TmPe+Y4S1RBP3oZIvwJ70dLYE+zJLru
         6SgykBvc9O/2rJsll2pFG8PTdplmiQsV0f23VBLOlXWLaih2FVqsZxHVzV+B4NPPWGAV
         DTYArBAGm1ismZfucfAJKs2+J0GJxkI85Ma3krHNELWR7ybpBJN3rSlzE4Y/vNxf/iCs
         VikcK6FD7SxFAyWMv/4Up2VfWjhUA87KWJULtPkKcLUqQzPwy0LBPNuVOzQ2WHebwVuj
         Yl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464752; x=1795069552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=cnNJcx6LnRYM/szSKnCzj0LbpdUBikbjeKtv5dACXXIKZq82MNhNlw3Ld6OHoDgczJ
         86sxrVmCwqVU5VulfkLJ+vm3+PX4yri4gTolUcLM1OzxKwH9IpNXpSPWctBCix7Rp/iX
         ww+ASrQze30UAMkb0ASspJSWbWn7JH5jY0fAqoU5vyq5q8ZlZBCl34wPpNN0xFukYWN7
         q4YVnbXe2x15FiphpHfPBtK9v82UsGrgRF5l4vvwdhj40ixq4lwocydM49quFOiKEM8m
         7ZeI6Ci2k1J4P8i8aAPA2LnzLQ9yPUMWm4+URVAKTf0xh9LQCajgWd8/313qDkjueGpU
         mBqg==
X-Forwarded-Encrypted: i=1; AL+hErEwDD3yuW2NzneK8Fr+VUmf+JlHILjsGqnJJKYjQlLXnR2lJKc84WvSMPWXKYBLTa6Ogw8duguY4QfDb/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gal5ojHf6bvth7TTncAFMnL8IMMfVAEwtxRsRsq7ZrOOplMuW
	gp34HKv8jZtbzGEhqsH6UAwnoU1ZuaFJDDBbuiR4Z3PH7yf+C1RCkUwz
X-Gm-Gg: AYBFou2W0nm50f4R8PCKfgCKP4feAdz8/36GUTzSQBbhqNlKaI9OEJQ1qTkJL5buEcZ
	Gk0UMMSFVYbsWhGrzGJ1Bm2/WiCaHNBZ28PKYtv/U3VnZWszejJ2Vj803ie8gw4r3CXgC5Oh8Yv
	rTCRDf3BhieOcPTv8WYInghz98wgEdYeZcapgH1x7iCrdoei7BNYWLWo5RFD0lwPsfzFG+nrCCO
	ow50tuXmzpe/syj82DjHuv7qHeqzYrvcLANNLzQStuXIsbP7HAJkzYlN9/PNSaFkWaTlLpxl6Gt
	LY1GkPC2QB4fANBbQGZidwzmXWGF2zcI9R9JI3WxaMsqWq4kzH4tdR1jGb+q3oceS0eJCYaXMPb
	WQZHY7Tv25QqH6sGyeaBDzb04m6c7EklOiTaSFjkdj1gpoPcjwg5Tg0qa03dI+Cw3PzuN959Lq0
	TvDjiHZKRKvVwEBGlu/njcp4MLCDV3bLFv3xLLwcKzhvKSnyiiu9upu5agkcrTP6HQql14YrsuT
	+7vK8DOYG3ZTSGjsQIuSDmTn10efwcJb2GiXsFAsbs2G5tx+Y6We1cR5ZJa/QSOMJU9YqpTdd+h
	cfw64cRcWY09nLwUam4kqm+DfXzwLKDJm5zZqTC09JGDN+a5JM1NoYwfwAHCNktNPh5UJplzCbl
	lwROaR6hrdA9Rk3VTFpS1SLtrTKl/IoGFCvX0OL7oqEelbOU=
X-Received: by 2002:a17:902:f546:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2edd7a20edemr51204535ad.31.1794464752290;
        Wed, 11 Nov 2026 22:25:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:51 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v30 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 15:24:45 +0900
Message-ID: <20261112062446.159-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
