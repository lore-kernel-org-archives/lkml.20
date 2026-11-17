Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912178;
	b=VdU54acYVQExbf3evDq1VNrEq7p+LBR5kxvFnfBT/Dd7PN1X7k71ZAljwOcHbQ8nfLfJ
	 2RFsJpX2kEZ+mLiU9fGyzx2qBE/CDKV43QbkIpU/c+onT3Ki7q+zZLVD9w0wYglx0NUGI
	 hBVDv60H+XaQuLD5f4AUGxhVFlJbg94njdfg8t3Y2oTX4+7+D8h3DtsSPLcuZ8XACfXzh
	 KHxYFDeE4q/qUyHdSU6pg16Bl6Cx8zU4MDDmca4u2lVGafi6taPslLa+PBDhC1fCq0W8X
	 e73ldsCZg9gsqoz7zQbU4qbdjuLuzJ4pvYYQDAG6ug1Xxl5qEbddiCqvN0GlT4V86fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U7SopeEUa2pillwTN6+8DDNBymjaFoXaDMJYKKpBO1E=;
	b=VKkGE6Sb/F2fI83QH4pN7ciwLflRpw7z/qB1z9mrbRxdl6TdFN3ZHVJDmDAsmK96PfwF
	 B2F/r7CD4H+51GKWEryhSGC6ZILHgYeN5yK/6/rZrIa3Z06BOG1kzMjspp4hOXCkyji85
	 nHpN7tEn04hLYxVFFc7eixPe2NrbdXye+lVi3iucHoZvMCzE5bRPhi8+9bjiqaOdGTgCs
	 BGwSjhkdts61woo3pex2MiuVq0kOqZE6mAsTni6yO7d11fTnyQr+YcreKIad/NuIlDrbI
	 B5kLp3ySonhpdPk/8QbHlxLA9JKkFS30uOwiLelDmGASIHsa8L2GhCY85FSPPbSE2IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da9aoFN6;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB041606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB041606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da9aoFN6
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380c28f9e35so820688eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912177; x=1795516977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7SopeEUa2pillwTN6+8DDNBymjaFoXaDMJYKKpBO1E=;
        b=Da9aoFN6YS6i7RBLhBqjrBXsNaYG+ifkgQr1kYPFIJw6km5Fv51909jC7gJz0uHoZ6
         wQLMIiWKxzr9Yn4tID1WHZZa91/p4nCA2+OQWfLSicq0JvRb2fTgsAPAL0/JY+JybCwh
         fE+SvWbxl5mK73qh14OhRgDA51QnPFPxr5Ci0CmenYQVR4Vf/L/wrKFknv97SabmJJEV
         CoRR49d03yPNDsq94TvrxwC3yezvZsL9WkHrk7I/OlbNOavUj8EqCxE5mVSON0I3NGpB
         otV2iRh792qZNdXZm2rc8xomEXfC3tlSNT1S/GKxbTUX6w5rVUSeMfo5cv5aYjAiY6HF
         UKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912177; x=1795516977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7SopeEUa2pillwTN6+8DDNBymjaFoXaDMJYKKpBO1E=;
        b=WBE7PM/uWzgQpOhDpXkP1X8/hePpaLGIr1uNrYbJzNHsuS+luNXPHvosMCuVea/fU0
         RIjYRm1a0leSDYqgkVMs9Cd+gFT5ctstpyjOPrP5deClOeQdMbaDBj7hzNnwsn9LcKQK
         a9JFmZzqNYYWH074wEhL0dGfHuSuuh8wLCwS9xS6TbN2gCjDiv/gHYXODZ7WiUwZ5ND7
         dwmfYoOTYRT0Kpm1UgpYX3WdGZVP8xeaNbiD1BxMz1fHmAhHTZuM/WUks/frfST428gs
         9AE2LB9cGfPgRkhdM6tzeeLgUn0eerqHMw5QdIKZiUvxZhHRZ4yrTbV3PRsUuJ7OoYdA
         LElQ==
X-Gm-Message-State: APuU4Z8o0syabim8b0WEHSTXioPH2/bVN80+E0mU2SvSmpn9xJq9kBsz
	ev1rUe5FxIECkZOFVOxyRavwc45hM7tyGT0bzFcHL+6ShutldEZpnEkN
X-Gm-Gg: AZFdTZe/TW2MG39GqJhumRoEvE4Rpz9b3RZUUltphGLGc8cc5AHpYn7Hfp0KD9I2Ggx
	/iOy9kjKTNUTUTovo8XrIPBbhdVMgMG9eD5+AIqrB26/1sNQ8t8F9ISF0pzG2C9yaGN5WR7+1N3
	cNSczFOgw0xB2AUlnUAMu3Sw9MVl8fe4U/8anFUR64epz2T04QQ+KoRZark/srRHqy8/a1au2CK
	HjrOlHOrtZCIwqlomPg/jmqgJa+Zxgkaz0D/zk4iW9pxHArmoYv8SWpdLhRXP8BeQZVuNzQ0y4R
	98VhTRwTkYXu7WRc0ECWzDGPQp9ZFoK6EwfKuLjsKy3AV3RzM2jlNXLnUcJEg+EgKiq6ol8o0/V
	5Bm5ApcDg4Ssc1Cxplz4V/Ea9+tIGDdgpDDWVpF82IKwb4hQ4BistLmyt0Fqg6p+hwAAHEp7Kr9
	iJWxu8aJNfNNl9Bn+0PWPG/cFh0if1ZKG37Y1a4fX8SLsPXCndPj6IA9dFutOqJbkeCr19eG8bU
	dGZEjqli1+ZhYWIrE04Hh1O+ZmTxDQ0o4YN8ksBedfBR5ZM6ocnF326MnnTYWwwRczwjN+7kIeU
	1a+cFaSxU8VXLduEEKPrJRjkfcNsfWe4kjH+Nm6rJg+4+PWXsP4=
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr3061483eec.7.1794912176912;
        Tue, 17 Nov 2026 02:42:56 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm5069981eec.13.2026.11.17.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:42:56 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: core: Validate card indices in lookup helpers
Date: Tue, 17 Nov 2026 10:41:54 +0000
Message-ID: <20261117104155.3080-1-sreekuttan2156239@gmail.com>
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

Ensure card indices are within the valid range before accessing
the card array or lock bitmap in snd_card_ref() and
snd_card_locked().

This prevents out-of-range indices from causing invalid memory
accesses in these lookup helpers. It also protects against
invalid indices passed by existing or future callers.

Return NULL from snd_card_ref() and 0 from snd_card_locked()
when an invalid card index is supplied.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index d518cb838777..f79b63c69a49 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -384,6 +384,9 @@ struct snd_card *snd_card_ref(int idx)
 {
 	struct snd_card *card;
 
+	if (idx < 0 || idx >= SNDRV_CARDS)
+		return NULL;
+
 	guard(mutex)(&snd_card_mutex);
 	card = snd_cards[idx];
 	if (card)
@@ -395,6 +398,9 @@ EXPORT_SYMBOL_GPL(snd_card_ref);
 /* return non-zero if a card is already locked */
 int snd_card_locked(int card)
 {
+	if (card < 0 || card >= SNDRV_CARDS)
+		return 0;
+
 	guard(mutex)(&snd_card_mutex);
 	return test_bit(card, snd_cards_lock);
 }
-- 
2.55.0

