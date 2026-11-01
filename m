Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553718;
	b=D+JnquEk10ALmvFCQbHF3m09vgs0YBIkhe9MUkhUg8g4LTZhQsED3el9OkMaEoAt1cf8
	 DXgF/VR0ax7A8wfV8XNnuscL/R2qKvD+0q6UsJ0hzayMO42ilSXXRYpUI3c7KseE4luEN
	 r1ARGX8EVo3Gkt//EozFZCkmjzyKQLZg51fq3zHbMt56XAl8wqyZLJS3XkGuvqa1oIeVn
	 pgPKzzGD7cHbnlg95mu4hKkiCxBuSZi/s9CuFdYyVpJbwdOyp8nKTyAvLEAGHNtlLOJso
	 Ba4BxbsXLDsroI8CyDlvOV8XwXEgLbRjAmjJQUxqwwzrzqZrrk5zdJdn7OYVXMuE1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XwQq4VnLXbeP8zDqe6ljK7RGgnNSD2hLCp0cnoXnZkY=;
	b=j10Ov8W2PdI5Ip9eiH7BflrrHjtib65S2eQ9UOlFLd/Ev9Cts2g7ATfVzV4qjvJmfQA1
	 ztwx4gAmvrDIcORD/jUSOfhxwim9voW8MamDReA4KI8G73uPCl6DZvvhsuIUMP/vkpxU6
	 5vWzLsZB/g7V8Duewwz1mmrfEge5EQayP64MAMDjNWCiHsumTw405pdd/hGjhKXHXnHD2
	 UQSox86aEg61NDWe9b2gvQopPkrGg0kqcK0GBiQU5d0gnGq31CCppLOPL48sKuLIMCsjx
	 QMYFARlVpAPxVe0y28FBc+IwHJwK6wqT4wtM8iw3fmi2t58VkTeJIqcVn1bKkM6D5/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lNAliZbR;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92800606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92800606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lNAliZbR
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ab432273c5so19145207b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553712; x=1794158512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwQq4VnLXbeP8zDqe6ljK7RGgnNSD2hLCp0cnoXnZkY=;
        b=lNAliZbRZepolAFL5w1/QzHVy1Hhc9QMo3Swv1kkIP5kH6VbR1UQyQOiTDRbp4nMVv
         hqdn1Z3Pz3Upf8Sku8O36Wx0l8NoZSIUQvQyBSodxisxbBYQk8ZQ9WhdlGhtZrV7deis
         XgkWHuIhVWXN9SLQFREMoGPVw/pxsPppgBUoUORl1uPw54YClUxBXjN30g8MrFwaBUkj
         6hPTS8Baj0NOEnMnPDzDSpUFyuhwiecTjzhX42XeQyfxTKWIckn3NdliXEKzN4bL6TnR
         Zr8YlEZKrHW2pt5ihR15c2//cwtPd3h8MW1yMl3TWa1+TAFXAIB6BQZcQnfM9po65yhR
         x0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553712; x=1794158512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwQq4VnLXbeP8zDqe6ljK7RGgnNSD2hLCp0cnoXnZkY=;
        b=Hl4Pkbn0kLNy4Aig0fX14BOHoOGl/3xjOWMQwdhYbTSOdzAWRr7ceFb6bI07hqIaa0
         3fiJ+x6CzvWILZyJZ7FilYxR9Q0kxvxIFPFw5XTr5hBpVmihMKUcxiuwHf5eDsx65dTI
         3/2NhHh8yMzb03G9j7eeztnTwhJq1AMWBQihsv/cSKDfO8Q9PrYaVpUhWapVZjw4nDKu
         21gCas4bpIp0TLdIg7677yvR+99Ar6aj8nNsTwBsvEVLJ9LDT1rgxSkPWrzwT8a1ubBC
         lTRQNhrqAI/eIEghbzgC1ReTvswlV7W9BS1qFpYclgG5MZjLRD8rbn2+YtGJwVeqgCGS
         RqSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK2Mp5oRrsI/Udfsrg2gAHO0q+ZtXChTXaL5dOamHhyHHseyObDuMi7BL8k3RPxpXJvt4dyxA/Du4KzbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FJo2ZyCpQK4yhFJdLymJvWrWn3nph+mcDPP6S+YpJsJPBH2oz
	n7hcFP3CQCOfl9W/FhYKAwaq4HQTqGWM2Ksrk0JBwBq/rJK9fM/o9p6k0ZlJwlWkoQ==
X-Gm-Gg: AYBFou1VA49tpxYu/QvQNCAAlCbT0v5clwie7MKv2o4NTiA4Gy8vnLHMatuyQ5sazpq
	YE9daG8u0+UoaVze5F10onHWoJGJeZQfiMj7Cl4xXsG09rkyT0SwizQOfO7AELgOhKHsJAg+0Yy
	O1XNb/Yn2sD14tjAkWfjSJV/DmzzbVJeZN7rN07AIsCGS0Tl22RRB65NuXh0DdZrWwRS4nsuvLx
	JhT5zIiWLq2SoUuC8FGmzq7DLaBnU3IWfrU6hnXZG13lb4INMOI1mujcaqvuIvQ98sGEqMRSnnB
	AEHoqKTOrlGwVzPEIRKKfDllxELvWxoEzDtligAzA1kO4pNLQILVIXPcnJEKExv0Awxf1m+uGAb
	9Wqsl1/61nOJ89JA3u3xCdLJddmSUR7BkAkVLybVdhpq4edlijDeAKd7u+lscZjfqmGXyYLCtLn
	pFYThlsAFmmg9eBa6u82BoHn57oioLWEfhatylIA3emWC3YipsFpZ8Pl7H6PgA2ueoTkZYylZqA
	KtVAHLCLl/JxspvgBUBBWlVuw4YAuUfcJM4EZrVXmHtP7x5h6EPxrAbvLMxachS5Jfb2Do=
X-Received: by 2002:a05:690c:9d:b0:8ab:485b:9be4 with SMTP id 00721157ae682-8b2b6431e64mr58964837b3.0.1793553712575;
        Sun, 01 Nov 2026 09:21:52 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:51 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 4/5] ALSA: vx222: Make put_xilinx_data() return void
Date: Mon,  2 Nov 2026 02:21:33 +0900
Message-Id: <20261101172134.3451066-5-ingyujang25@korea.ac.kr>
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

put_xilinx_data() always returns 0, so the error check on its return
value in vx2_load_xilinx_binary() never triggers.

Change the function's return type to void and remove the dead check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/pci/vx222/vx222_ops.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index 40f3716c478f4..348666b422f5c 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -321,7 +321,8 @@ static void vx2_dma_read(struct vx_core *chip, struct snd_pcm_runtime *runtime,
 /*
  * transfer counts bits to PLX
  */
-static int put_xilinx_data(struct vx_core *chip, unsigned int port, unsigned int counts, unsigned char data)
+static void put_xilinx_data(struct vx_core *chip, unsigned int port,
+			    unsigned int counts, unsigned char data)
 {
 	unsigned int i;
 
@@ -347,7 +348,6 @@ static int put_xilinx_data(struct vx_core *chip, unsigned int port, unsigned int
 		vx2_inl(chip, port);
 		udelay(1);
 	}
-	return 0;
 }
 
 /*
@@ -374,8 +374,7 @@ static int vx2_load_xilinx_binary(struct vx_core *chip, const struct firmware *x
 
 	image = xilinx->data;
 	for (i = 0; i < xilinx->size; i++, image++) {
-		if (put_xilinx_data(chip, port, 8, *image) < 0)
-			return -EINVAL;
+		put_xilinx_data(chip, port, 8, *image);
 		/* don't take too much time in this loop... */
 		cond_resched();
 	}
-- 
2.34.1

