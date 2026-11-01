Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553711;
	b=kAzvnbjJj2kWnfjDtgPIq0zR1hIWyzUKBCaKtn6SdVFBZXeRXPcxUFzPBNE/CIoSP7rG
	 JQ4LkDORA5UNsWQ1QslwokMBCU0OtXj5VOwldIzaQljjasdW52j0kdBQxeFmLv2qFEH6p
	 xDVU6gTRWh88e9UZrpfuXWv47LF1OFF6GGOhdQdH7eQQpnJThfoXCgKPgvEh2LZxzzTED
	 om7oLN100l1xp0rX3T89UVSjKTFtPrA4ffA2N2pwi9c2/j47yat8m7aRXxKJxSVCLEkkb
	 +UwaM96+A2gIuczyTb4EuRAKZa7jLWlF7VKb43u7rWtkZgY+Dose1s2WjU+La5H5sYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8jDQySbbwhUBE6Esd8B4uY6dfDK5BBBPW3DY/zlY/98=;
	b=Zz1FmY072ibKtGCSmY6KSulxd82ti589zAIpoDrlESmSKSVff2/8pp5FnbVHXEUnDP22
	 p3AWaiUCWvcDpx3OGeC3lgOagTO7gGRATTewnP7Jh8aPYJclMMQVz9m4jYpwuE7w5GgR6
	 xmKG8rHdJUkDnvMOwit9ENx0HeHgUNgVMPV47Ct3syvlfrdqfZC9G9a49FEl/jxcHhjb1
	 fhOEJLIquyKLzy8H9XC0UT2EkM59nqv6OJrN2hrhApbNIn2AHTxRBQJUPT2oEW3Fvqo0B
	 Hf9ZqBz8PN5Ny3NInqHgfzzcYfZ4Po67QDJATSX+/172NVhVB051L4DbHVfqnP5kfpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=GhMLKGGb;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EC2606A331
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EC2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=GhMLKGGb
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b2d149b483so3835027b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553709; x=1794158509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jDQySbbwhUBE6Esd8B4uY6dfDK5BBBPW3DY/zlY/98=;
        b=GhMLKGGbWofWg2iDi0sQUYKW2qiTFgiMDEKOOwoXhmujiwbLQdjzLNOD4qNos2+BgP
         0QaxFqsXxGbCpNrDBCtNRsJYY4qn+w4WMtncD6ijGeltFWDYOct5oxQddatZvK2yFniw
         FJuFtWAJ+B1zufhYvuWBVdyzX297/tFHPpNt4t0A5oCNAP4CW1ztpDuLM3n3JgkSCcMy
         rz6sx8eIEOAWFJHC0CEWx3ohJFRP5J/n3Nek+DNaKm0WqtrnueDape17bGg9RagFZvoN
         4EoZyHnfzkRaX9YTkCKKgQN5COpFsoJxOr42b3MVbfph9hgmQ0tbzPs2lr6yzlM8PuPl
         0h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553709; x=1794158509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jDQySbbwhUBE6Esd8B4uY6dfDK5BBBPW3DY/zlY/98=;
        b=gdo7rYbcme0n4UTSqcLImXL9lW7W6Vp5L4691nC9zRNEmVz8I5cMLdddVRtRavaNzd
         osBwRgrMBa3w43IDpeuA2APfEkPRtZ7hFMnrOdAg3hxEyBIrL6M+RqJJ8/gtJDqdTOX6
         0uFDYKfPvlG6fD2NyeD8kuoZLsM5Zvk02OzuSngcc4lOeuJ15+CLWTbraxc1CufRF59S
         HcmYzMvF071CoT9F83AKAqpdJ1UqdY8vk5X4opxeY2RN1QF+CNEp4tSJnkS1wGrqSuEN
         +vtV7b6nxGeGMx2T5xvbQdVLo/GcUaFy5f7dTg73kHsNsCH2rp1YFo07TIX+Aax08E6o
         P5jg==
X-Forwarded-Encrypted: i=1; AKwUvBz44TVTUGKlqrxgcAirzpI2bewZLOlkvyrrQDpAY7XqP7X697NX9j3enA/HYpIoriEmDLTt+Ep6tNnk3Cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iSRjfuTXHz9ynlThrNiyUmubGlCQSTMHXmRH5+Y29/eSKJdE4
	Kk+joEHAN3xnRpUwOIkJGBPb24YOMfM1hS5gF0NMNDKltdAn/Xmf5n2ikD0RsXZRyw==
X-Gm-Gg: AYBFou34t851xCRUYHvboMYXEkmRDOApXtLEjTfVkuWMjse2C9dc/85QaafQ+3g41xL
	Puod12lUELzanI2/2UYufBEbKAWzF5hUJgWRsDZiQBna2EOgwjLwK0vJBzOtjU7vlmxQ+6xZFNY
	AYbHyrpGFL/bdEg3x867gViS4VVBLUdte/c5xlQaOzRPC5dXyWRSjbrUNoqO+ZaEG8SmQxd9c2S
	o2W3PmfwC3+va5Kfjr/szhZCaspVFaYQ63sCbFT+cHx99AS00MJgMymcZovAOV/mp//hNmDBWLo
	SY0ghAn/q65GOyfOZehRE6ai4s4SPVhPyjyBsQbLhj3KoPj0NvKJ8ZjAl3EpqHPohaJdMT2FweC
	dAgnDEMz6QtTxeluC3r2bQfpkHZIqxkyxf2TkmLCRy2ljn140eYng0y9afZ/nWmKTOdbqSSusnO
	vKcVGhXcSWktj/tGUsBfttGuLq+s6BbmvVgMjRdi+E1ET0ok0uz1FNkYfCzVY0bgmqdyM5zq9hA
	JbnCZjftgUvbUBwjtlv4aeomXw+ugYM2emHW44tZp74jWWOYPZFT0ht5/xTfVNAwu7Y/18=
X-Received: by 2002:a05:690c:4003:b0:8b0:ad62:19aa with SMTP id 00721157ae682-8b2b671babcmr40938347b3.33.1793553709612;
        Sun, 01 Nov 2026 09:21:49 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:48 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 3/5] ALSA: cs4236: Make snd_cs423x_pnp_init_mpu() return void
Date: Mon,  2 Nov 2026 02:21:32 +0900
Message-Id: <20261101172134.3451066-4-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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

snd_cs423x_pnp_init_mpu() handles a pnp_activate_dev() failure itself by
falling back to SNDRV_AUTO_PORT and always returns 0, so the error check
in snd_card_cs423x_pnp() never triggers.

Change the function's return type to void and remove the dead check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/isa/cs423x/cs4236.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index ecce31b348b02..167a198fa0fb9 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -236,7 +236,7 @@ static int snd_cs423x_pnp_init_ctrl(int dev, struct pnp_dev *pdev)
 }
 
 /* MPU initialization */
-static int snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
+static void snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
 		dev_err(&pdev->dev, IDENT " MPU401 PnP configure failed for WSS (out of resources?)\n");
@@ -253,7 +253,6 @@ static int snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
 		}
 	}
 	dev_dbg(&pdev->dev, "isapnp MPU: port=0x%lx, irq=%i\n", mpu_port[dev], mpu_irq[dev]);
-	return 0;
 }
 
 static int snd_card_cs423x_pnp(int dev, struct snd_card_cs4236 *acard,
@@ -296,10 +295,8 @@ static int snd_card_cs423x_pnpc(int dev, struct snd_card_cs4236 *acard,
 			return -EBUSY;
 	}
 	/* MPU initialization */
-	if (acard->mpu && mpu_port[dev] > 0) {
-		if (snd_cs423x_pnp_init_mpu(dev, acard->mpu) < 0)
-			return -EBUSY;
-	}
+	if (acard->mpu && mpu_port[dev] > 0)
+		snd_cs423x_pnp_init_mpu(dev, acard->mpu);
 	return 0;
 }
 #endif /* CONFIG_PNP */
-- 
2.34.1

