Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998272;
	b=hiYJsWJlMOyKp1w7mjSCvmIszEdfSCpObnHHC3gOuhZ1u3Op+w02m2FwAeyzHlMjVGUn
	 0b++ayYEPW3iECM8yn52q7GMsbnpfxtueq38rakzmJYYhNJzRxkx33q+RnXrtLbgc5S3l
	 s13yqtWPSqnX8w4lhFRdFH7HifR20ePiVzTQN5IqOYUcxIVN111soKVi1+EEIflfeUOLS
	 s/G5yDPZ1Rc2tRq2IDtV2XlSTR62IcBpy6FYOsFTow+y2yxEZgscw4+UXT4jF5Fu9N3Hr
	 UZDYpHjfSqqVCOdUzIN/oBw5Yn9Lv+t8mRMfpEofmTOnCxRfXOgjN4aFoCYxajY9nCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xMKIvqBHSojUYc+gMYW2pQouvXFob5OFUcbc/iwXI+g=;
	b=uFXbWRL1jZE3qq/pwj9A99rMeQ6lg+tra4r17XTnhaLedrc0vmdv+FRsf7jAI1no37dc
	 zM+i+lR4K1fIcYfJ9J+pYlFavCju4hsWgpDJLuWNJVhzG9Cvvgw91I+bOMCQnX2BgALyJ
	 ZVZ7rkydcP4rc0pn6FVex3mDF1TPhJybNWoKA8V8DPo1/ddNRrwi6+a9gZi+atCOPtJmt
	 8iagBUiPo8+C6+6JDsqfYtEWK2xjLQdK129+pmYJcGax1p9cIDbi+Do1OPj7EJ9pF4JAl
	 awQU5iFVxBOXKf/L5T9wgfnhgiDXa62jL5ZVBuIxuDs/UwXZdUtxGxJzb0IHbmegusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JonuSYig;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D326606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D326606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JonuSYig
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1333874c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998271; x=1794603071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMKIvqBHSojUYc+gMYW2pQouvXFob5OFUcbc/iwXI+g=;
        b=JonuSYigM5wLpSpLysMmYjr8rUPEc8x1WhRFARKvUe15FZLFgiVRHVnoln5ZYk+ioe
         uFGImKeIOL4HZ7xmG+a33Kqkk6PzkjUqDhYGBodLkfY0/U3gOZbdbjW1QMl8gwURl6Kc
         ZNMX5QwicpIvSJwt3JpEDZ1P1EZwNNS3FBP4t2cJTHhvOX+Uxzd0IOAooFrJFauomeVN
         7DS57rYBB2QXUTRs7kBoDFtbAaPw7u0A8OprnbNNHFeS4BLiZK0c1XxHZeWz2cCcUVPs
         ox9/JgSM2KKSGKB9JWQyGSh7OmlpvEQyPNwH5rbFE7+hEefPayjOkPy0f7eMLmo+orn/
         IXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998271; x=1794603071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMKIvqBHSojUYc+gMYW2pQouvXFob5OFUcbc/iwXI+g=;
        b=hYnr7yFpruLY4ba2dgkdfQfbDjmOoNwpT9df0z0fNBM5H0+9m2GPqoddO1U56TpTjY
         eO4n62ET2NEykdCgzirpl+SkcPaizljKOK/OB4M0dBfK7/oJlnnAXWiE/1a/KYXhfPJC
         /6qBbxqWEv7UjVqJmNjrYGEysVS8xVPbzkO2S4OwM5ATrtrqAQ9muh96oGae/ixIm4NU
         2FVZRxoeNGTJliG6yJEjbN6sNExnjdFG88kA4mAUVY01LwU8UbQc3VcjEfJCypFFJBKe
         RGoK0ib/KANeRoiSYtdK2K56bOeJQul1fb7898KFbBcVtibkBjZFUI83+lnyLzkf/MND
         orkA==
X-Forwarded-Encrypted: i=1; AKwUvBzZwjR97cjSo18btX07KqpiKmVhpHoTSRg0oUmi8YPZugLZqH1zc9F/D0Rn+Xcvdgdva//DMxtymDrKTHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gfDEt8m95zDAshjEo21VOzJvvMhJL8I0tuqsIMLn0P4v6/pME
	pPJ55JtyubmfR/Fz1aeZBtLaORxRrZ4YZWCL76oSlZuL90bnDdWMsImE
X-Gm-Gg: AYBFou2sJc04FOxwb2gt2OnPDh+e1VVArLlHzV+VCqW87I2U6sxBOT2mTQZ+TlReb+c
	QiyaBLHssZ+UR66w1v3d0VJVa1HI5Xh+NiQ4F5Jh80RJ1Yr+MXITP+wspqTVUGCzLdVrTvPTky0
	FI9JMnP8Ap2GKK8PLghsEFNIgeaf86/o9DZHgcZrTdXyQuekhmxkgbzcFM0akxxeg4kwhd6OGS1
	pvcdC6Kk6PIC+lzf4WjxcpCy0O9EX/8699BylfUB0S9lHPD9usw2I6akR+CEbr5ryGX5SpJXw42
	lraADscGIly2CzISQAW/XOVwt83wSg41PvosY4UWTlOpquDwITuwPocFAcD+UR94xEg+aodlvKW
	bBIezvLWDQEL9zAo5QxMuo0EidlyqykC/3cb7L+E+mzTEDj0dJFoEopsamWeKJXnh4eCYrElDq7
	MZUASlPuA/UGnchYnHhDODkhlq5HgrvRjjEWNBi9FfcREEAwNZzpSy6UJ0yPkO+0jfTiPKMPr6g
	pVZPXM62RvJGtQQ0+7YHKFYrED4CcX97pItubsS1GIVJdkHk7sq1K1mKQoU9l43EVeWN+NtbRN/
	GF+O71uA/oedJaU7988NHgJCfs/7Z+IeiwrkuoqcuW88kDZFOFRhGFueKLFkgVn8fdfbb+sx1xm
	tShqUKuqumjWP6yaqRLKF8Q80YKqeIw==
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bb0mr1903646c88.2.1793998270605;
        Fri, 06 Nov 2026 12:51:10 -0800 (PST)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm8445952c88.17.2026.11.06.12.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:10 -0800 (PST)
From: Yifei Gao <gyf161023@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH 2/2] ALSA: hdspm: Take hdspm->lock when masking MIDI interrupts in IRQ handler
Date: Fri,  6 Nov 2026 20:50:47 +0000
Message-ID: <20261106205050.8048-3-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106205050.8048-1-gyf161023@gmail.com>
References: <20261106205050.8048-1-gyf161023@gmail.com>
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

snd_hdspm_interrupt() clears a MIDI interrupt enable bit in
hdspm->control_register without hdspm->lock. Every other update holds
that lock. This includes snd_hdspm_midi_input_read(), which sets the bit
again, since commit c0da00145f9a ("ALSA: hdspm - Fix locking in
snd_hdspm_midi_input_read"). Updates racing with the handler on another
CPU can be lost. This can stall MIDI input or revert a control setting.

Take hdspm->lock in the handler. All other users of the lock already
run with interrupts disabled.

Found by static analysis. Compile-tested only; no hardware available.

Fixes: 763f356cd8de ("[ALSA] Add HDSP MADI driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 sound/pci/rme9652/hdspm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index cc4cf43e5a5b..135761278556 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -5383,9 +5383,11 @@ static irqreturn_t snd_hdspm_interrupt(int irq, void *dev_id)
 				/* we disable interrupts for this input until
 				 * processing is done
 				 */
-				hdspm->control_register &= ~hdspm->midi[i].ie;
-				hdspm_write(hdspm, HDSPM_controlRegister,
-						hdspm->control_register);
+				scoped_guard(spinlock, &hdspm->lock) {
+					hdspm->control_register &= ~hdspm->midi[i].ie;
+					hdspm_write(hdspm, HDSPM_controlRegister,
+						    hdspm->control_register);
+				}
 				hdspm->midi[i].pending = 1;
 				schedule = 1;
 			}
-- 
2.34.1

