Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218127;
	b=RNO055RHtLEvRLXmPKhv6RNhbQSTTgajVA7DLnYA4eX0eLJ29KI7qzxvuWDSct8VN3mC
	 IyLyQbVBmEoWOP+5qjCiTSHzQ+MgHqESIA7L5L7B5J0GbmN+BnFl43W1ILbK9I0B2uwlG
	 rzzXTPW9Wrm5lPN4DxAvDACtAbRZdNln7zzsR0qrHbIQuEQinze1gCFzMJ54siOf9kfLI
	 jEZK93AgFTNTDuSQ3HTbeTm2wG+nYKs4g2gsrkUYWwYbIVORKrjwlJOlDk6bt/S4+6aUK
	 +Nsi2QyiDh/EppCbWqDefV7tq3YY2h5bVA6EQFd1h10PGCbnlb7K/MhCG7skkHP8DmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=whgz2xp+Qof9xdVTPW28769GBAl4IHLoKq0HlwY7cKs=;
	b=jtbysh0CVT9OCFkewz1fZ9mWm+iDn9ZzLYhNEDqzF8W+YpTa64zqxvxOGWr3GhPZZWbe
	 STh/H1QP8ZJmxX9kttewasmasowb7FoUc7fj0b/luSw9wrBvfdE/OEe0jiXizjiwZAAJ0
	 V2QmT+rGKlXcF1XAzecc3p7dWDgmS2kMcahnebMkUworYgJ8qSJtnX877kzhTR2shSHUd
	 5+2gpai/UEfKPibdcXrYeCYb08Ik6jgaIPBE0Pjp8tMzZakklHxjV9hOLHB/OQh3jx7fT
	 Lnp/Y9IG92TR1O4mbzZYT9mZvbJQSVQ7tCUdAB7ZBdz5bPazpvhuJ+f+gv9mE85ROKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xORv2qdf;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47354606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47354606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xORv2qdf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so9260385e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218126; x=1793822926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whgz2xp+Qof9xdVTPW28769GBAl4IHLoKq0HlwY7cKs=;
        b=xORv2qdff9ONSS3gk/vFQEAVExQiBOVC34Yt8gjGgWCu782oFeqi2xESe2mXz2ixYl
         h1VYq4254ut/hY36SsW721Dd5O5a2VFmKJzL4XNhwIuHfcXpiosIJd2Y0MNway87Yh5P
         xfVY4HPd0MAradlpYlGfj9szHpR4i9NnegHXTSpqWGPjyZdkQVXuQ0wrH7pdwDhL0r5e
         m2XDQ0j55FjNuo/9CM6Ku4m2/Oezs25Bx84Y4lrigvnCoMn4nygoY2P70YEdJpYrrl46
         1BmXvXKd2fVoDML3FkM11jrHKYbb3Uu++cq1WoGrcA+bs+ngNSvAD72pbARjQ9b244YE
         ey0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218126; x=1793822926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whgz2xp+Qof9xdVTPW28769GBAl4IHLoKq0HlwY7cKs=;
        b=tH+f73QrIeLdVhAESaSBfCJfBBIOruTLCFnqPF8nnJwgiQZ3BeG6ADyj0XmkMoqge/
         65LPJ3GkGHuhObgi1FxL77uCiA5bb3veLQ/7j6byLZeIRvZTkNXeGBZTF09kcpRAxVmy
         A/rTheHk++5mH2/GAV/k3ObK40r+mGzajYFehlLGLXSkmv2qVQlCWU9YMU5dE7BgiXRP
         BPNu78Hpaq1w4KCgWW9glRHBZjv04IW5ZGvIpgWp0oye6y8s65XHizXQzM+i+XInWA9N
         +qrQnTfPzIsDckJrtSa1uVKsn+wmE6/bJ5Kzw0rCKf//Dmf+MwFyK1XABmc8DOJUJSnh
         UD1w==
X-Forwarded-Encrypted: i=1; AKwUvByM/H2objeviBi2J1dkXqJDZSY9ZAhO1JVaolr//KDgZX3Rw2qY5BgPNQ4kYUPo6wUtvSP3/T2arPHk+tk=@vger.kernel.org
X-Gm-Message-State: AFq9FYItnAydNWd89IDWOxc9B8iNH5rT9Q3DfLeDMtivsvuvPE5OcpR5
	Rh8+x3OL6I66cNTGUDu8SEWycblChFhMctZeHRAuMNEhzM/6aNchI0Ly
X-Gm-Gg: AYBFou3cVfNYin+7B4piCdAwyILlgJZCPTiqRHssdX1NwDM4uCAqdAEyCEqyDtwqvrw
	9O3BttzCRO1mcMig77fhcnaIumjhcfNxCyDjmZS9f4Bg+0GVysjS3xGmJ21XyGLHmzS1RE9GzTc
	vxit6BWh0t3tPv/pSOV0XX34RKtHYUYWWL9uZWnRs+I3Gqgi7Z6KbG32k64s9l6YtMrAIzCG6hb
	Pe038qnyZ3mJz0qiBAhle2OXX2bn5I77f9ECWQ9AkoIrc8k8bQovn8POHCYNAHXddqwPCHDhUY8
	M7pJp3sBS+Qqfm9afMqL415Rc4K0jfnJeLxgXAZWklH43tSmuTWfiB5TWk29UD69lngFKr2GeNR
	K/2ZD+Pt2G7Ajt98XVi2/nHBAfB7u14+xICGKZGmq94eV9NzLAQhNWsSeuJwB72RbKxfvRjEELL
	L3RN3QyJrzoT+8MBdKqi8zZUWmXYMbtTaNUVA2T82fjD/diFIUcx31rLp8JUp6tZTmvIlyrFNQe
	MZFbYbRnmKZsngVZocVPipS1Rtt3pHsv9UbpdZ9UjKUf6op7R8TyPTk0cHKG0z6R3qtED2R5Arv
	w/s9orG1tt3Eb/4rBQ==
X-Received: by 2002:a05:600c:810c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a967e8d6e2mr76409945e9.28.1793218125585;
        Wed, 28 Oct 2026 13:08:45 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm30134320f8f.4.2026.10.28.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:08:45 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH v2 2/3] HID: elo: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Wed, 28 Oct 2026 22:08:38 +0200
Message-ID: <20261028200839.202670-3-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028200839.202670-1-mail@taterr.org>
References: <20261028200839.202670-1-mail@taterr.org>
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

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the elousb workqueue.

Use flags=0 as this workqueue only transmits outgoing output reports

and is not depended upon during memory reclaim. Using WQ_MEM_RECLAIM

would unnecessarily spawn a rescuer thread and trigger

check_flush_dependency() warnings.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/hid/hid-elo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 86e8729e1975..8a96c0f7d5b0 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -296,7 +296,7 @@ static int __init elo_driver_init(void)
 {
 	int ret;
 
-	wq = create_singlethread_workqueue("elousb");
+	wq = alloc_ordered_workqueue("elousb", 0);
 	if (!wq)
 		return -ENOMEM;
 
-- 
2.56.0

