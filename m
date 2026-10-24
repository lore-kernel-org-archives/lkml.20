Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842098;
	b=WE6GFLxc/lbGyc/+ACV1D9893sP9P5LXhnizfagpKPYxufrfHyOxswjjwsNJXwU6FS47
	 qcuk/y7F0hH4cgLU0ejinpIRGfmv/FAc452nU13ISZsyzwx6DPHIBRCfp9AZIinXPxqT2
	 SxoArulHzm2fQZx0Wp8yTclonTWZQ0ZRolg6IjL1qb32GH065OBquENDk6et/Y9O2os61
	 2R7lfIpi3KPJCloxpmHtCN+lftCg6/NehW6V9NehlfLTLSqbsKUgcBcYSTqsJO6nhd6Z3
	 OweTbhvIqZXVHt18mkj1VJmElU/adcg4coBQi3gFDL63WY+Xn1IfYcqzyv1JcnoZZqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oaXlRZ3005IxCEEktQJCWA32kAoA5lLFSgsDAh94r6c=;
	b=Kew3ujH3RXSzV0gpEZxMjyQxoEs0WuPM4U8LRa9PHkAsva/ChJ9gSL09CU3CZ55djjyB
	 XE9GBXUVxROO8aM64H2/apP/SBLnRkMrR7MfU7oYloE67BwA47WvY+Wf+CIqBU6VboM4u
	 ox7tutK2jsfkPb089pFWmBbT4riuahFPYUQEcKs8VaExbd5ynI7ybPGLk2TWXHPPdYEzA
	 aPXmny8e+zArtVxu9FUvypT8/kxZjN1SvQ+17eHVVZAAvWipoAiCAQtJxN+l47sQ3XZ/U
	 okfA/+0VYSijkeShIfRd1DRxuEEwAu6L9GHX6kHv8KjDE3d1egK8sqZnT4g/qi4o6TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWiK2ltA;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF0606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AF0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWiK2ltA
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9eb579c0eso8530015ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842097; x=1793446897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaXlRZ3005IxCEEktQJCWA32kAoA5lLFSgsDAh94r6c=;
        b=VWiK2ltAXWjzIoVNTKVOvSh+4b/eE/bP2KfDqg8Z2Wc4dpLlXwWm59oPj+FB8oHuw4
         3sCg7YNkAzYFKZUZNbLqLmIRhA5qkWmY/RRgPTZa++6Jn2CE9UXs8vV8FkPpaQ4BDTNT
         +ZSbSfOKCDCjDvSjvjUNZgis0C2fz5FYJ6DIXK9n5fBdYOgQ19RLUa6OIww+wYdACrZc
         smNRh+lTrVQY4vD8o/RW0QDL70WN6ZKHH7AdbCGMzxz7ULJEkZd174Zm25LHDHrFVful
         JTnkGAMYc3juzLuwJZYr2aBa7pnabCjgNND7v6FprvtArU3UlpS3HqRcatZauXo/NDPi
         Xjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842097; x=1793446897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaXlRZ3005IxCEEktQJCWA32kAoA5lLFSgsDAh94r6c=;
        b=Cb0IcADIzOGDcxukyQDrFqaW437phghkNg+b2i66ynd6NZlkEpBjijntQPT/LGMWh+
         wt20NfQ3MmPax6grbZ5ZNKqgXvKft/5bTYMzeNokEswxo+evMRsUqjHsp+ymHdscN8mW
         WVtc6z/uJZrd5rm7Fczq+IzfRottfRfKeDqvbmL74WuMHecMdwHI1QxCJs+68y9pJdHs
         5BNf7nHTjbOLpj981v7ju44qzUgsyFA8KXonYjjaFJbTjsDsQb6IhecFIufKY08qT9Ee
         ES6bdaYNp/GOwCbhuXaXoDcUtpTXcEfcMaHU9OOWvEHkJn/n1Oh4HU2jZmipxra3wuj7
         LQLA==
X-Forwarded-Encrypted: i=1; AKwUvBwEuodem3AM90qN/cdsQW0/+UJGgkvjlz6HzniHgzYPFLFpHlLkXx74KJPOZ9N7QZ8K4qeY/YgAE9lgnxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPzG+3oN87NPY/QaVZLKDIPqTzGARwxT9rKyni+1KddFwu5FrE
	Ablm3z0PM57do9ZH4MAkGdw7PYDJRAovcTFttVzqX/SgXzciZb9A5t4t
X-Gm-Gg: AYBFou216yxEyGrKuEwLuALkzac/oRl4DmAzxon2tLpntTtb60dN8HSg+iAbE7iDbxr
	ZdMohtxkYwucdC0Qst3wvyLH6GIdNrVtxkm/KHugJ5iP2VJGq29X2lM0W0wgfD6UczImcevqQKf
	ItGUAEM/11g/pEeESbA+qsLlBoD4mAx07jbOgMtsHLEzGhH40OMdJMt19UA+3Nb9cnKad545CnV
	PzRhhmHN5yDevlOHPWhOyD9diUkzpXfmotIqJRgLs94d7HuK9p4NliVg55/tY8jAid+76SoRJI9
	jfvJXzPUoZlpjrWNX46o71xFFUTH61+wZEzvL1TDuqK8cvOlHJN7Vu/AGMWmT+YQYL7Ov0/rtWm
	zpzp9zhhz6JrtCKk1+SwCTP+v2GSsJ5KvYzUB92xPnC1iVIQA69sWzDNldzhEb4RUzRMKItErv9
	KDriNKUB9H884tjRbulO5n0CcMLvBXSZUpUGPf/NXMyOlgDrFpNzT4DQ2vNh7wrjJBfIKyiIIWQ
	lzc149WRxL4fbgVmJHUDdqztUSTxnMnhq6Isnu5NZDwrldQwv8=
X-Received: by 2002:a17:903:26c4:b0:2df:8d6a:3548 with SMTP id d9443c01a7336-2ea9c8cbaa0mr13138145ad.48.1792842096870;
        Sat, 24 Oct 2026 04:41:36 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:36 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 3/3] ALSA: hda: Drain PCM users before cleaning up a failed codec probe
Date: Sat, 24 Oct 2026 19:41:16 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
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

A late codec probe on a registered card calls snd_card_register() after
building its PCMs. Some components can be registered and opened before
a later component registration fails. The error path then invokes the
driver's remove callback and frees the codec's PCM resources without
waiting for those users, unlike normal codec removal:

  Late HDA codec probe                  Native PCM user
  --------------------                  ---------------
  snd_card_register()
    register PCM A
                                        open PCM A
                                        driver takes codec PCM reference
    register PCM B fails
  driver->ops->remove()
  cleanup_for_unbind()
    codec_release_pcms()
                                        use PCM or enter driver close

Disconnect the codec's PCMs and wait for codec PCM references before
calling driver->ops->remove() on the error path. Disconnection drops
the construction references and blocks new driver opens; existing
users can finish while codec-specific state is still alive.

The PCM core's lookup reference and disconnection gate cover pending
openers which have not entered the driver. Waiting here additionally
covers users which already acquired the codec's own usage reference.
The later cleanup disconnection remains harmless because each PCM's
disconnected flag prevents dropping its construction reference twice.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/hda/common/bind.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 957feace0f58..3c249d70ac1c 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -145,6 +145,9 @@ static int hda_codec_driver_probe(struct device *dev)
  error_module:
 	snd_hdac_device_disable_unsol(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	/* A late probe can already have published working PCM components. */
+	snd_hda_codec_disconnect_pcms(codec);
+	snd_refcount_sync(&codec->pcm_ref);
 	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
-- 
2.43.0

