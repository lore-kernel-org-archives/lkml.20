Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180556;
	b=QwGSP4ztCktPMvddlW5ODzBgHhITizlIbdPXebFEvkoOm5Uv2Ns+fMhc+rPbMZu/Dxd8
	 G5gD+hfKEeg93iT6MWy7gsGZ0OufnIgmFf7TypnzDaIR8iI5t/5IadlSpzeqByz6eAkpb
	 EQ1HieuxipC/ieljOcrzT3pXzU0vPt5csBnRBt2GXw2lR5H7N1kubaX3wo8auR/Q+yV2e
	 CxPNCHO9G7bXfZjo/rzFLpBuMAcgrHNcpzM3DUbcu8s3MRBJa9tA5i/kR1F6g4SeCgGnV
	 ilU6oeK10wruSbXts7d+tIhqeT/knvZTuJJNvcPE6NZVyu9dYjvtfn05lyQUIe5w6Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
	b=BXoiGV8ReT4ln+kZI+1Ryq4l/rGrjkw369+LKE9RASS/UdwUV96JM/HUndAIIuezD4pv
	 OSwzDlBaCaCetLYV/sKMduLWnNg27tmKheq8fkqvD99oDFCnocYnBtoO67R7Fp1Il0IdZ
	 pMghNaECcW8jDaPC+jFFQd2n7JDCIyBp64jhY3/igqZewWFPllYwnMyXviRm6itBr/1Cf
	 1iaK26XxkrK+QwqyhrTVXla68bBM5FO2A2/u+5+i3wXd2yRD9cRdgUhJX6wGqPWh5/5+O
	 kJ8ECBF3NZH1S08A5Ci8imkqd9r+sKUqlrTxn2qgW2Mhsbqx+0YV/RTd9dgk2HvfhPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B609Pss7;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E960A383B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3E960A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B609Pss7
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd3310348d2so850893a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180555; x=1793785355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
        b=B609Pss7x1M+vXFNl9WZoVkKNOL9Y1aSRCo2gJtMqpMlah2xfLBYh4elDb65a7RL7Z
         P8vmh2PA7ZXnjcXq1H4rsJWB+yidWlakk+e8CIsx0q7DuRBNsWgs0OSjVqeEBexp5tOR
         XJmiQTW+JPOcwiuVq2bgs1A9HTUNt8LlHf1hrmF6h0adr0PigdN46Ehotm06s0XzICg0
         qTxFG+zJB8WlH2BpWfgR3ODZcmkSI3FOihNdTb+nPhddmpmOnhipMj0HI+ce0WYesURu
         buZ1wfdxBjhbsoE0pNSAe8B9smDvD53IxCsCFyIZh+Lk6fvz9+Go8DBLA/j/ursNXZUg
         gWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180555; x=1793785355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
        b=W8S02YyjnRocRvUDC6p+VJLdwUdh0LghfVaFQI8l4YS1XaGIv0V0Yk8Uc8EresW5A0
         2IJVZKi72pRlItSBGdxGPKT5H/qvP6T7lzeoQnUbsqpTcTxAclKStbdSx3yZsjYkkbFS
         jBi6Raz/SgSmoGUshQCXQFM1k8OPytgcWezuSFgl3NQnoeR0p//629PWK5+zkSMqJ+Gk
         h7Sb1kUFfLhhEfVgqcdioqXmJFnuMYW4I/7q79c7psXYx4UVTNUGZ87m65q0xa/64vYU
         hZuCrSgN0NefCpIIIcmytuoagTYmpfR4L584ATwIQSc+xp9jYMDT6twcH2a7QCOC9kSL
         RIQg==
X-Forwarded-Encrypted: i=1; AKwUvByd3lMP6rL5V9Q6Uh0gFjM5OdcP4L2lIDVdT85sYv4z9aOVpgtcDSR27fLS+cCMHYem0iB3x5gwV3wA9TE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW1XJ+bHJQKf6yFAPVc8X45smgIbRfRMU4tSxIzVKi0VYNVVaD
	JzjTNfVuK99xzAQVeF72rN6x6JetdFvGIft1iMUz5i2u+pkUX0T2mjOJd7Olww==
X-Gm-Gg: AYBFou3q84kGpty+/JKDq0UqNJ4f9nbX2/0W0r/G2xfMtCc3fuIyYzbNMYAnjOhETLK
	gS4qVkPGVwwzWcFW168GSbdjKMOyHp5VHk+aycqFH+7urB1SVtbK8ASCz1qANTHOC8EnL/OVaFr
	2y89i33gkaoV14SfmgR1DkCVf/UYA3AMcq+UalHTcF4PlgmzFihOksH9p/Chd5uvOgl9smhv+lF
	Iz1Zy+RsCemir9pVAQcJI2OiovHa7nlrSc/iAoxBOmkz5kcdI6NRJR9FHwgPN3mleyXu44prsZP
	OQUe4qWIRXgyquRq/zTgglLaeJli6YqkjAwRPNql4p2pTtuUSVl9jKL0Uis0Q3TVuhI2B9NPvrS
	7duCGxEAZc/9ZBOZNggaes4/eQg/kPx7ckt557Czxma2xOewSyikpGC6AvM5RQhwwtOFPrmkdLQ
	nUoGhfP6ZY88QQpNhBPR9UMzB6d8ImlJf4oDOtcLlYIV+jyW8XRcK51QhxXfyxBVq3QsJsSbZWo
	ayQAspbSNUtFGGML5WnovJ4XUGEiHRMfaioJ9HzN0qnb1nE6mgCiglx4TkBtDMZng9WEWGIvS7j
	H84MDBP2V8z4v7tpGIEKXO9c3ZkD/BWo8UTlBId7AVwH64YBk8spDVT58fnzDOANxXmm8Ygpy7t
	zEviidQOau2ZtUewm8HujMHN/2mrT7uRcazL/gnv7xPc/Y+1QpBz2P50Ly19eo66XVDc5
X-Received: by 2002:a17:90b:2587:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae5c86a185mr503200a91.23.1793180554903;
        Wed, 28 Oct 2026 02:42:34 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:34 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v7 15/16] ALSA: pcm: synchronize stopped paused streams
Date: Wed, 28 Oct 2026 18:41:31 +0900
Message-ID: <20261028094132.20364-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

A paused stream can still own DMA requests even though snd_pcm_running()
returns false. Stopping that stream without marking stop_operating lets
a subsequent prepare skip sync_stop and encounter outstanding requests.

Mark a paused stream for synchronous stop when snd_pcm_do_stop() handles
its actual stop transition. This also covers paused XRUN cleanup without
having the driver predict a stop from an intermediate ACK position.

The non-staged virtio-snd partial-read test previously failed its first
prepare with -EBADFD. With the companion driver changes it prepares and
captures 48000 frames. Playback pause/drop/prepare/write and reopen tests
also pass under ARM64 QEMU with KASAN and lockdep.

This changes the core stop path for paused PCM streams beyond virtio-snd.
Coverage does not extend to all PCM drivers.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a2ea44c..ac2e5c2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1611,6 +1611,9 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
+	/* Paused DMA can still own requests which sync_stop must drain. */
+	if (substream->runtime->state == SNDRV_PCM_STATE_PAUSED)
+		substream->runtime->stop_operating = true;
 	return 0; /* unconditionally stop all substreams */
 }
 
