Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738026;
	b=DZxt/tA+P+8hZEICk/lo0sQU06P9k+IKzkpe50UOjC6B/o4uFpt8DOM/ij8OuyWm0eVm
	 kvyFh+rApWAd4pWdiLJgGtVv2x7R1aFNo9R/KeoPr1JSdat6Sj6AVI318TebwLe6RipiB
	 ImOQ4IuQs+KX7J73iAH4bgPEer2QpFo40qJ52Z7Nr2b4CyT3Na2v5htTtV76CLBdAoX1h
	 uBj8gT1BmzWvkLQYCTlu6rqMbcowLI1tJQqN09LewJVjhXlQ/MZac2PKeVnWPrOZmY6Lm
	 eU3qdk6weTbPoI4uvJLJNbFD9pku9N+GAZ9yrtltwFtfHlDyq2JloHfh8gmEhB9WChw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xQfYxpL6lo9pYgDOJuLLgqLwsPxOt7f8C+HuvbMdigk=;
	b=RDI4t/2PCtW2fo5StMYUpqyNO+3GZr1tZSbDkLEyfuASDwqXVXRzaXClVS0yeOm9r3fW
	 l23nAmwpknq8O2NUxk5s5hLtY1GpqYBUmHyiVQIU/wLercld/0iBd5gY5qQtMM7equWLQ
	 fCsfP9y9HOvoP9UwLSbzwujXrsD18Kc7mD2iVzA0OZc83XpU7oToP1ZZGY8XLPdEAnWT0
	 AjRlltdzt+sRImkSQJH8+sXEhbGYkqXSajOvjbUIkMAZM15jtswx8LbnwMNwm9bfC56wX
	 xyGG2E3NLkKhl7SVom8Tvtps1JqN07iBG68Ai0ctE6yeqsBPa1wNZ7WFxWZrz/nMotw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZwsyJNt;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C2E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zZwsyJNt
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3002647c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794738025; x=1795342825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQfYxpL6lo9pYgDOJuLLgqLwsPxOt7f8C+HuvbMdigk=;
        b=zZwsyJNtGDWan8kATjQgxksVa5Zz5IpF1j8UPJmNbFBAAgKI0T9ghwqkX+KSvXVcpM
         +Ew7Bk/Kqg47mkM+fQ1mb08iJaEUk6yuRhFLZmsZb26LJ9MQvrZ6v4+sfz9bevCqy2IZ
         +htLa2KlfZTE/ohqyozttdy66yvV00EdTUWhysKgWXyZPSrA71c538aZVHm42QzneWpt
         6P+1dtM6Sej6RHsgbJH+8BJEmsU6cyuyvPqTDd+TnGdUbX+nxHUDX3PjWJXX6UOJenZ7
         1CfNx4hUIGNIaGCgntIjqV3tJUgDE8AMOiZ+Of8CxkGJTMuj8Fb43LKw9wAAvlj15rUW
         qV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738025; x=1795342825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQfYxpL6lo9pYgDOJuLLgqLwsPxOt7f8C+HuvbMdigk=;
        b=kPwrXrGH8/QTQhPvpP+3OeGFA+56K5juMNZpxXGk6xsxlGoohjRdDyCjLunBfSO5DP
         d0QJMN+MDFBqCT2SYzzopCZkoRh3r02yDko4vKUz4NFOSjePKfZDLFBSkNVGY++FsAca
         NBD6O9s57iDGaZKO6BVQUQIYkFJnPJOvg1Yf2lhHWPAxVf1xG0KJ7IkiybU7tfoTO+/2
         r6O+MDRjpederXoxU4MIXCuQ5fyaD/GnpY3Xf3C7VOcqhcqBGdWiu/KIYdv1OQzg1D74
         Jr3MeFf3Dz2aTBnM8c+fiu05qLBGPbqlTXZvM1aOQdpQPXUIttAk1V/DVJx9pkeBBMvN
         9crg==
X-Gm-Message-State: APuU4Z9Jkpm6lOxeMsIxz7PcvyeafN079yItDVJJrEB9RcMUJcs5tAGZ
	njb2oTleGBm82yZMq4LJhrcGllbjdhoE8ZTxFwkOiVaVRkk5EIlEtnjz
X-Gm-Gg: AYBFou065j9SFdD8yipAkPfbT6xDu4Si7Z+/1iIWX5l3dOi+mn54xzsX6iMf+8YtoDD
	T5bLiVZPhfZ5IQFdYs6ObBTQRY2YepBR9l5XL2lROzH196EBRvAKN+gauGebwFOmjxfjtKiKqT4
	48VjmZzlOxRJalMjWry/+u5box+6Vb1+KzejD+77+nNXD0cvIEbdZr+AyLpGeMgJYTan2iS2ck/
	3Ziax1RD6263yLixga95vj3vPu35rweKOMtzRYtkXmEIGjNM4EAKtzN12tuUeFiBcXCIMsd5Kkd
	0puJ9skzc/o8EcSNE54g6yZANs6ITZWaTI78X5IuUvpItm0eJdyel6RoXTQXAZ3Zgg3y7X0hs8+
	DFBefF6o3I2umRqov1657YtHB2Bnp363rmkReSGiy9eebl84tZ9qxWTOUYsuiOcGnIKPt15TozU
	oISWStHewkCyuqbc5dC/gXJRf16l4Elj/AvCdEiffc5Oyc5JE2fwlZHfBQx3XtnR2GiJPj3oPNz
	Qn1dXJBD1DtovprW/LpWwHUs0vBPqzXmKn5BqGZJ+emYsAgnXHDWrPZig4s5f5OADpGeYfya7mV
	v4LOt5oRZfJ7qpBQwZYu5RLiApzhF3TA2b+mKZfveVZlp9++hlxC
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr11465212eec.2.1794738025200;
        Sun, 15 Nov 2026 02:20:25 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm40237254eec.25.2026.11.15.02.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:20:24 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: jack: Fix control leak on jack allocation failure
Date: Sun, 15 Nov 2026 10:19:49 +0000
Message-ID: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
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

snd_jack_new() creates an ALSA jack control before allocating the
jack structure.

If the jack structure allocation fails, the function returns
-ENOMEM without removing the previously created control.

Remove the control using snd_ctl_remove() to release the control
and its private data before returning -ENOMEM.

Initialize the control list before removal so that the
private_free callback can safely remove the list entry.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/jack.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index af2dc2cfbe19..92febcb42a8d 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -555,8 +555,14 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 	}
 
 	jack = kzalloc_obj(struct snd_jack);
-	if (jack == NULL)
+	if (!jack) {
+		if (jack_kctl) {
+			INIT_LIST_HEAD(&jack_kctl->list);
+			snd_ctl_remove(card, jack_kctl->kctl);
+		}
+
 		return -ENOMEM;
+	}
 
 	jack->id = kstrdup(id, GFP_KERNEL);
 	if (jack->id == NULL) {
-- 
2.55.0

