Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173801;
	b=3GACTekj6A7CuW/dpeGdT7OkNgcEhcU0tce2M9+7XIGdcmigrDdjiY7xLVXJM19bawGP
	 ZeSEp+iCxES2w3qa9hk03LnWfIW8M2U1sGbVekk2baoBk2Ephh+wuQ4bjOsMvUt/qLU3v
	 oFRNqP628hCViLeSUEhhLhYUp/qKgJJ+NlbodGHNiTHhVxbQtr4UBq++S2B7vZVpAgzgw
	 urglYJjb+3B215vKPwhTkj+nQZqjBh+VHO7W/1Vd9By+OlpaI2QE1QplveLVUlc4gcRpr
	 gr+PcWU6u6avfkbTzV63cWlas6ZVvh+HOm0wUKCu6DePEPzqawlCahY0UNsbw1JsXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qR8KTb6qvAzIDMlPYHpTftZOot/Hoc7eU6G7Bmug9mE=;
	b=3JGjRQErKSNbRgWzEL2ItHEfy2MN4B+CAcX7c2xh5g8tUXfqXeTQKZAkmsffCJB8d6Va
	 uk7vzJba5JsuDVtq9rZxHXwgjqqvu15gMmANhpVj+YMZsgXd1VE209/ZHPhn2J7gUl5Al
	 V3JbgxNZIbItZ2wE6KcIBZXzQaM9Rgj0/uXPZD3Y7c33OfAbJf00tqhmwuzMj1n57B7/b
	 i2KfvJ2vab77WtarxJXaWxRt6du4IPf4SPxdNbqlufCnPofBSgdKKIien9nfslvHkGm6R
	 Yyn0hwuabHjZe5UNBWiWJWOsXVwwHKi/5bBsj7PSGkXtojAyfYcVhOlSQ7zHs8w2cNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tYEmxW8o;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E1D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E1D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tYEmxW8o
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfc346401aso488210e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793173799; x=1793778599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qR8KTb6qvAzIDMlPYHpTftZOot/Hoc7eU6G7Bmug9mE=;
        b=tYEmxW8o8J3bPZexGykiK9xI66Bm+hvxqka9qZi3rk5p592VDeg03Bnxh8QXuFZsUF
         wR8yA18CA8ucCzFk0WAtEIiCeyzpTENgVLce+IzfrrTZFa+hxIrP5IM+fYi6Owz4+Hfc
         SMzPA3ws7cDRMf4ejy3pEVI7KLHZHbiWf85SSqDx/112f6SAzyTHgBxKn8PAfdmBo9Hm
         DNTHpV9zOYpyb/8oBV7inl2wpeJ0fCqQTeUIv/b8t2CPk7QbhQu0TMXv0Vt3gCjV2bIf
         dEuYMqNRVEuIEiCaFkDqSTfOuqyDzKARt+eZFWiW47sGCshegYgFNN5lnOC7HRc+SdP0
         0MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173799; x=1793778599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qR8KTb6qvAzIDMlPYHpTftZOot/Hoc7eU6G7Bmug9mE=;
        b=rZ7H/e/rHCfmO/HuDlCEMKFr6Ocpbc35OMa1JCGtldwhrTGilkacqRZOzZRk9q8HnS
         HaiO29lqorR08+BMUgEona1hH7l633IHkmNsUkmyDrUMJrsvBXPMZC4eTR9Ffvkb6nds
         bfzl+kbGz9mPDL2awSrN4en4DjsCc29I2V85rdCNIP4ysQFc6vYojzsbmC0LYZosMjOw
         2Pj7vfapPFNjkepHtfFrKi/5OuDqLSiMYfaTbT912D88DhmncqyjGSPnr30VSaVXm1ND
         oWEiHt48Nu5QufE5UvsUVUxmHYWTFPK98hpqWXWVrozp3m1jcAC3vmNzOOVILx0msyMM
         Q8FA==
X-Gm-Message-State: AFq9FYInGRjPXaLYaxEsPV5oDtyQhy2n80OIu9S8hQv8ZjvUUzHTIYg6
	NqfJGbNEGMa9Dqg+s3JmTH/Xays31F2eXc/ZFCs4VfsyWMoJ8qSX8zoq
X-Gm-Gg: AYBFou2cQzEsr5eAhJ0vJSKch6GaccOuLjYuHQiZYqw7ixvHJrszCHr/yMec0oPScXT
	iBDnb/WFgNrVKKg7JYLIue8d9W12y2LOO8MMMCLu571qCF9Qn1z9fDyUzKiElKGeHeBDF8Ychxt
	FTFzsDswdH6h5iJO9mJG6T2YDRFQjgPSnn2RDWyX+oYyM/64Nhc5GnDhbwmk1Odd2eabMakUHQr
	cfdZIa0sQQKqFSG1Wxgx6Nnhdfjr169lDyNilXThZVGKJMsqEQG7wr+KyyM8r7tctVGaU3eL/2W
	59SMvN3v/TOFH1Sn8/Cw+3SUTOi3CgMhSA3KHYIb4can5raOXuJNLTzo+rkRlX9Ivrkta3/ywMU
	vKgSx5lM78TL9mqOmXy7fe7BGe2tYg6Gf/kcDB2mKnCcuG5jMWxSFyCC6Mpl/L9LvgsCOe9W20Y
	dsKfT9NuQw/sypg7ceHeqfBb9+u8tiT63orCSNZSoFW8p75rYgcjKSxAM0KjTw0TsO7rdPR8HRY
	4ItaNLiF5qwCzZzrVuLIZWeH/tWio3mAUHPjR2Xys63BNpqNsxF1nAg8Mt3n5z3oCP2BSWw9NC1
	bsGRotH1gBjW+Iy+ulKjaAfTwLI2GfR/Pk1ShQ==
X-Received: by 2002:a05:6512:108a:b0:5b6:183c:5ca2 with SMTP id 2adb3069b0e04-5bfcad737d1mr539813e87.64.1793173799309;
        Wed, 28 Oct 2026 00:49:59 -0700 (PDT)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5bb09dsm414337e87.71.2026.10.28.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:49:58 -0700 (PDT)
From: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Wed, 28 Oct 2026 09:49:46 +0200
Message-ID: <20261028074946.12728-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Make g_fbmode array const as it is not modified after initialization.
This fixes a checkpatch.pl warning.

Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274..47d2917cc 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

