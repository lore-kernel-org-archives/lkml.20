Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466236;
	b=S9SAclAyhGGdZZJhvyccw1+Aff/T0GztcsqFt7Eob8jqjXOIE4DPMRCMTQE/6nFg2LNE
	 PY13pSTPA8QTwNbH+rFMhSHrZOnWMtdFEZiW9b4l+0+SJL22qSJHGvvzwX7uoAKExKy8P
	 63mT4VseOmrI82uYM8GVZa0aiwFdo9NqXhk6CiAkaqRLOusIMj8hAIHL92KG/Nl7wDbSv
	 FJPILjr8aJXCS7kPZ2pSJ+VOaoMSJY+FcZIVXzRkRjqHegW1cX8VRDZxblGVcNYdshefl
	 fwpxJRZ7HGfaJHPpsht4CmSDHLyJUk6I8UYgleTrG5Qr+8E2Q07vNr1d1g7QgAr/SvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=XeoXNI3sGTZRVPNUw9cCVWZC7l28AnPDx7MzLoVA9ujsppy5q/lHBS5pGUA/KkZVSzSE
	 0wpSN/sbpplyMXvxvVWN6JQA7Fxq8vmTySjV89cO5KpIm8ZC02PPj1odFI8F3ouAb5EnL
	 9bFZN3VyD7FOSqsfNKKyFGMbkfuct4hzaGNC/W+uN7vkrFfQFqVYd6dgaoFIf254eBWzE
	 bl3LnQgGKh4jWc1MlqtBZhmzFJg+87E8lFg73LEdLWaqhnSow9DHxAbQuazUu8AnJyuTE
	 58/nMKwbbvO4gdxV2HIlTkvxfXKmBWg+sUEIDTTPOBD39LMSQ9+3NEeO/yK4YBgO9Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re5eZ50X;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37D606AE43
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D37D606AE43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re5eZ50X
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so2518387b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466236; x=1795071036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=Re5eZ50XOIHjXAjO+dOkeKxBiLyJrId9sTxxacONgvjzdn3YlBHqF5aH86aCI24vjP
         dAj5VywG+OE4wLv5GJdfFnmSJUVw6ScJBl4uhAnUU7SHyQC15iN1VYf0vsmtluhHg1Ld
         NhxpWGONyRbGqK6ACLzHDJsFerewOD0Zy6YQAPvjUZOe7UilC0nvi3pifQExLCNhfVz7
         al1z2+OX/x6rO4rcziaqcOk5gox/xhzrasBaW0jyk0xwsfn6PrO8LAOMFeZpqxgWTsFU
         G/6fTxvNNYMLdS65ca5YHZr85YjMPJY9JiLti1zuPvD8jaNCu4vsj9xfjEhLmVh8aRaM
         tACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466236; x=1795071036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=Be68BWxP21T9evRxixq4Ni1HJ1U/0bGrCv/mVlt//vLXX4+EBx3zX4CzdvQb0xtb85
         TCb+cd5AhTZ784otHo+/y8rOPM/yfWlStubLFAy3wLIYirzRlMDruudLaNyGHL1watJf
         iLH5J26vit1MuAcoLCRtre3uGYYjNVL+HjAGoovFDamaj5Va0XRaSfjPbcTGABVMGy/r
         vkdY6vw5hv5joMgMF1LitxSGNlkPXA2ahcWqTjniakYacrViaWvR4bem7URQzso9eAdv
         uWH0fMGCtM6rpVbEcEHjDZWp5n4QT8OJMFMcwGHPE7b8qSzamPptQSHBe34TqbLLnNIS
         t6uw==
X-Forwarded-Encrypted: i=1; AL+hErELBXBRnbzoLx/C3cX/ztIjWDpBgZpQ4bp9RNU3ONzxnU55MMMhvonhBjUfWwkQMz9p/G7JzbjwTSz25eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/utSN/Tjk1iraxGy6amnT6QmbaUQFk0bFwfoNRWuNG7vDH3xwx
	zJxCdaGUW9wGeTndhKh35EN30YssR4HkqYyTY8VQnvbUaFrQMiZX0ocD
X-Gm-Gg: AYBFou1+hCIXLGP65gw8a/PoxWqNtWgWe54GAUQOLVSGmq3kjKgpdpqE/egugZSVqHQ
	tNRnyyD8H/7Pz/ys3YpZlioYYgr1G3ErtvtsfzY7grIWn+oZKXeYsCYL5hYZSogGXbmDH7J9li8
	FgCk+JttcbqUoLtnTxe1nCJB+sWuT4HKn8QId/OHo66CDbgMzKNCEaaFLArUOFZiYvPesqTuML3
	cHp0GrFbXARw1so/6ESN79bv3Tc+HhNhlrNM2h+bFee0NFSWmpGm/aVJ2T128dI7r5KlO6XmKqv
	SUwQAJK8bes3iJCn0T7olBrxLabLPXPS4LxW017EJ6YXL8vTFd3kvj/FXD39ftTvLZypo9C9sz7
	ANUZoX7jYVcTcSFDbe97hT9bz191FGClYTmRZIqxAMr8qcUPsfzzVShAb+7Jjap7hYrItzkeq27
	44Ilf9XWBmGzxxMhZEbn6UrqI8wC9P+rc26J6zDUmg1wEENfYYXSsuRoJbDkjAnq5DjmHC/w7FO
	Yw8i8I0MmwmTD4dciJ2GslOdo4FEbx/EUFZAeV13Wv15jA09rtghau9K7Hz5lXursRsQMQ3wDGT
	lG60C80jfJQ5tIPlJFKvOsy4jC0o8Bti1Nhz2fRZxxzjV7v9qmp7JNknQdpA0vR6lw8xskkrQ2x
	GEvkWaJmeBPPr5Uz3xA2yLclsrT0n3T4UHvooq79C3h65C4g=
X-Received: by 2002:a05:6a20:2583:b0:3e1:8563:2a2c with SMTP id adf61e73a8af0-3f2fdd9da05mr5074381637.40.1794466235997;
        Wed, 11 Nov 2026 22:50:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:35 -0800 (PST)
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
Subject: [PATCH v31 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 15:49:28 +0900
Message-ID: <20261112064929.11211-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
