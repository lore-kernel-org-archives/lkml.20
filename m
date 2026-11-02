Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647074;
	b=HeAiDkcU8THpqnlyQ+yoOMLUrARLCLeHOVTo5M2Hu8taan3k2plWpxhexdaeoJWRoCzD
	 tW4C0BI1xuBSlNW7dtmV+8w5FCMwuiqvrtSbsSeUXnVw0HGHRbfDU5fZ8T1Mp5fGudC+z
	 qY8WVZT0VoU7EfkReBmd80CBtR96g4jRhlSH2kaDNwIBzKwngTatz3WWJpGYtLFacoBXy
	 00S9JjRuYxedR3gAd0+Qn7Jl29J353n23UiXT5jT7zOprWRLDkR+BQqttN0kO441a4V+8
	 T/Yqpsthpl51XfadD8p1NGrspdNyYBzjtgYgY803DCemouyhq9nsVrCUkE1tiNvgs7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aVE8zme1iRyvaHJJXQb1UnPAk3BxoHJBltYK6kSmEUE=;
	b=uXNe7lc7mTPEbPMjcv9bLaFcBSbMPUi6jaNbFVc4l52QYcEh8PCqXRENd7aFlucHIshe
	 zNMnCuByHbCjmDdIagUCx3VzTMBSyb1QqetpvYE6c+dFKPF6ajlIBFmtJLKOE65OC/Iym
	 tFAE8EBOo90E63vDudOg3GLiz/EkSvPrOnpc3+rLTyOuDNPWMovHdqvblXRDqr3Fwx6jx
	 KeDTEm6YSAUGlZQgh2oBbnFKa7UBZS9chUYWhzu6VFXIIxVji6lHEHq3p/U39pT13A0fa
	 E4R+eXeri9e9t44aevrCudeZBabN3kt4NUpgfI02W2fgB7GkffaFLrbEkqnK301Pnww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3pS5Pyk;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14BB606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14BB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3pS5Pyk
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3605161f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647072; x=1794251872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVE8zme1iRyvaHJJXQb1UnPAk3BxoHJBltYK6kSmEUE=;
        b=m3pS5PykhHodyqYuJX7hbI7UnTabwyROLm/nHosoRh1WH8eaYcpdCffqwnGJZ5vlr6
         J4m2HnK+qSU46GAGHphS0pQUdIaTe5eS4fHma2m1WlWvOIB15TWZ4hydxRUI/f7DrznN
         ZD3ekvoY6/ZfUGzRvI8oKEcF2VK6+fwODHyj5o4MPrfie8oWYl8BGgz6HWGrbPV0zwxz
         sBblv4fRnzBuKs4k71fXjtr0z+ahRidzy6ORUFT4YXW5Eu/yBwItKZe4BhpG/LqE6L1x
         DdYY3GY731RDK5tnmwm3ZYI9Jxd9jb6cCSH0jaU4WJiQqbg2DBg5iGdCap9sblMd2+Yt
         4ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647072; x=1794251872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVE8zme1iRyvaHJJXQb1UnPAk3BxoHJBltYK6kSmEUE=;
        b=UpOWUX5xZpcAq3ttZ/RDZa+HfkkpeF9pqk1p05XFq4odgHMGDmbK/dLGzO6O/V8L2+
         /vJxhjLKzyI0PifdbRk6GiiXyJuVyaBPvwi3XX2Bf6DEO3ny60uNZbQBPVAcfG4A/zTW
         R7mKYPZ5i83hKX0HKfSgXK1tlENsYpLga7tYv7r9GL2ZX+KhXIobZABZXCybBD6NUKe6
         TBppct+I4eIq8scQrlbI1/nTMejOhmGvyevbFZOu0DKvQNR3HzA73HpEGypU7oC/v7hm
         MwjOOHrLM+RfeT6xAWrKBpmmK4mItbardewwmnCv+3gg/5PQmIVqQeqoRVZ1eUb/6ycd
         3fPA==
X-Forwarded-Encrypted: i=1; AKwUvBwfl58JshXXq85WXdhk9F65yx7oD6mkDMYLqXfhD9TWseM7k2NGJxL4mrr/IkpdhY+FysM60Fnn84tsnPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbNzHSqMuRuYFtDW3zuovqwxuaXnvyljcnGyk5r/FtNWQdy6v1
	5Qi0zAbggvxmEUFOpaqM9bNdB6fTQUh2+L0r2NfbKPgJUid6T5HkdLYyjnSq
X-Gm-Gg: AYBFou2EdnlSHzZTl5NhGL8YcWcpFcm0L0YSjz5WnpBbhYvqsculJlWh/1p9QP3hjoq
	pbl6Q+EIqkWRKadm5Lod3GHfdd/UY95rdQEcj37DNvuoKAu1QvqGymrVzf78wS/gTx1tXFGTeKJ
	plCxq7SECmZLhJlabjKq/+ZSfYTSrmW3iGmqNb8bA4DMZqZ7+fsTkueR9d9XGiqWynR8LczooL8
	hpg+5zfqPnsEgETSmrU79tLbcrZhm0bpSBfBKfd6RnmO4pij+pvujFUivVi4rag5D8pf39qFcfa
	aZUk+6gjHxLF/vv1WNw0FtDGjCF6DaWGRAdfIsPGDaz+hQ6uVaLeY3ssEEP/kczL4sQXm0md06b
	9G7pIeYT96UXuu4RQONVo70ntNXyFjnB2etfeooSFsZxPayEj2qsvKfm8i2IDdCStFsCNq4T4R/
	1Dn7PY6V2S9/Ywnkn8RyJY68DwndIkacZQORsonq0/mBUAHi6epqa8M3PgVB5Zp6rrYqLzFEgkT
	j0EAkal9uWMmeq7Pe/f6D4itames4XFxOar0D4WSs8kk7YNCWVcyci4dV+r4PL4EHCm/R0OfMoo
	g3+R8TqtoI4=
X-Received: by 2002:a05:600c:3b18:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ac1932b542mr261291925e9.35.1793647072092;
        Mon, 02 Nov 2026 11:17:52 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d4f9sm21801298f8f.2.2026.11.02.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:17:51 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless] wifi: mt76: mt7615: cancel coredump delayed work on device unregister
Date: Mon,  2 Nov 2026 19:17:50 +0000
Message-ID: <20261102191750.2308294-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

mt7615_unregister_device() calls mt76_free_device() which destroys the
workqueue without first cancelling the coredump.work delayed work. If a
firmware coredump is in progress when the driver is unloaded, the pending
timer can fire after the workqueue has been freed.

Add cancel_delayed_work_sync() for coredump.work in
mt7615_unregister_device() before the mt76_free_device() call.

Fixes: d2bf7959d9c0 ("mt76: mt7663: introduce coredump support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index a9178e077fd6d..c06b0301a4e4a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -124,5 +124,6 @@ void mt7615_unregister_device(struct mt7615_dev *dev)
 	mt7615_dma_cleanup(dev);
 	tasklet_disable(&dev->mt76.irq_tasklet);
 
+	cancel_delayed_work_sync(&dev->coredump.work);
 	mt76_free_device(&dev->mt76);
 }
-- 
2.47.3

