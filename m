Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010155;
	b=dLbjnm1lZhYTSaFUeHCNByylF5rjdrLGE+UAc8GOZYdC8lSfyYQSm9/zrD7c/vs49lUr
	 bWOKe0xkMrcesyWH7ykfZl1rfT+9Dub6Yx6fnNrcQzNXQLpFSytWdUtn8v6Xu9oyWPRtt
	 CRQn2n7nmD9haMYOxNts7DSKXKhqLiyDG/orXYJ2mCxs9jg8MEPJLwu3wNaUOsSMqnJ/b
	 SaDeEH479OUnEI/bGA+cxD3XSJd8/fm9xetXav+AFdkTgxPMKCSCWAcamxUETSv7T/NQa
	 YuongthY/1rNt7YMEDj58lSnDkGos8FrGOcl8Ns5hs+TMf5DNvHp4C8bD2wYVbDcVWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010155;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
	b=VCs4CdNgtd+B7VTzqjnqmIwrbWnt+b91Vf01HmnShL8qj8fPO7GiL4PkSJ3h6h7mryAN
	 REdsX3Ry4CUX4muzSUrIjxNaHVpSaL+heg399Tq6HEE/cVvZD/XYn9fMTnT6OsecdW0sz
	 Bype0DTLorF6gjV/t4+ILCxE8TdyW/YzXZZLBsjTez8nznj8Of0Ea5X1Bi4CS590A2Nym
	 zq6tH+zCIgcggZMsSphlK+yB6si0xT4XNUoqdeMR50F/JbWWESSBJTm8F5zA6VKeBHMEJ
	 CgkKH/ikHFCCYbJ+DR1lq1QZSAhLjiZWaRxOy6Ufuj+UaT/ZP3oroekjZ0J9bVTfFEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RzeOOp+d;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="LZyX/LJI";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7EE606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7EE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RzeOOp+d;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LZyX/LJI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
	b=RzeOOp+d0fF4k1jMKuYT2h/98JEzCzfMJHXnCX8PD9Ct/oBCT7wW21hXKxqJG7Swo5ofr2
	KBP/Mi11lOusPW94uiznFeTxsiW6yQi9FlXZOiGGLCorn/AX1x6wNPNCUahDt0U3RngbBC
	nvm7iXFk+zxPZxW7s4akknPxktmeDc4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-jrZfi978P76bgSNDoZnGcA-1; Fri, 06 Nov 2026 19:09:13 -0500
X-MC-Unique: jrZfi978P76bgSNDoZnGcA-1
X-Mimecast-MFC-AGG-ID: jrZfi978P76bgSNDoZnGcA_1794010152
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so278475785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010152; x=1794614952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
        b=LZyX/LJIVaAMJ4FErwbeqkmNzu2L2bm+gaJWPMJz4yVnYTlllKLnAcfNiZVuU+CCon
         FBZzP9104xv0Y8Gxn5+gbf7h3qhtgb04zojmTLi7pTy+MJgwVDtyo3C6CpQq5eEK4Fx0
         XH1N8JC/Th+34mlyVoyY9r8w23CpjSsI9Ccc/E2qZT4Uri/tPgaT7VK+J1b2H9S51i0B
         vwU90Rwx1xQ+NkIVBDMbhDRAUYNCeEO6w1GbMZwNzavN9g4tllM6WWXvcs6HMlOliyrj
         tVu/9g1hlMYE0TYJCQAi8jmyZ87SSd2E3dsqJ/YFwzf1/d8a3kSRb7yoATUKcNuHlzkA
         Dagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010152; x=1794614952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTVyRE1l9ZTgud3jh/ZR9Ld7EnoZ/uEnJzYar9RtQMQ=;
        b=0u/IG3HE/O0VpnjVZ72DfBAYxO0EVFhZSlyf8DTkG4ZHAqVahtFYMAHg7ZI6ErGTZA
         q/TaioRbcui/odU4VHnSkASG6Irfm+0uJzEHSlvofW4XEGN2OUWYDpUl+UOIWqlkvwcd
         ZyLlivDwhcA0d2h7Hbc/8M4ukUhjId32HcQb7AuaPQvaRsaqbEnLWbcOiwWys0HXzqvl
         DY7CaCQgItMs9S7ro2b5v1GwvbE9CYY/CFOg6r2yAnd6sbqlr4zXf0csJZdVj20RMNX7
         eTqGgpT4f/NnOENqowDWPKwo8UoUs3EobRgwTk95oYzShYfdqzfCQL4ZQwPX07XC3GJ6
         xkjw==
X-Forwarded-Encrypted: i=1; AKwUvBxM7ylm79jK6ZZhnCMya4mTlZNAHYytr9jkzUKM7nnMAbtvwDrbt6tUG1Q0ZIW5BBDL0suRWg7XLXj69iQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cxb5RtsOrJkpKoGq9FzQG7i6fa0WHWap9ApqGXsZPT8z6pPKp
	qdsuKavHHoG5DElI8FpNRb/uI4h83M5XPYpZOqQ08CPYAi8wkPypPgXWY2wWTmF5Qhx5R2THF3g
	AK93d/3QTqA9cAWrewmr/e/L35GSj2GM13JEoQhKRRK0v/fGAPnLAy1RwcWs/3N7Buz6zPFXwZw
	==
X-Gm-Gg: AYBFou16cHVrgfhUhh7n6kUGS1Wei9kgKr4G99wOxJBpA1SjxjUUHeiBtNqBoDNJAiF
	mzUvzhrDKRN8iMWafT3Ioaog4GTVOTuVPAedBi6ioDaoPYb7F4lT35HMxyVtL4Dt+13w47aaWRD
	MB3tXCRf1NBj9dPngTTXOvxpvrqnFhzFrybilkD1+uwzCvHVmrgqMzoUn0k1/mkhPTf91EJqSGE
	9Eo+zNW6u1TvOLupRbohWN0wPHqrgvZgE2vDA1qxRP1aGhg7IKcUcgRrLJFp8DajVZ1Ix5qqYh5
	0KOScFut+0rcBRzltm0mTfDJ9Hf+IUxuE5v1A5btY8peivAa8kfAk2itFaEXBmYMTQ5DLGVZPHD
	jWt1MValFEkzx3K/8wDJMgOpqu6mN97XjniI/Yp0gl5Y3VaSMOmUwO/Yh04uNAN7Ah4PFzk0z2W
	yHdljXKo29XGXa58Rw
X-Received: by 2002:a05:620a:2811:b0:93f:3120:6c84 with SMTP id af79cd13be357-945f349a5b6mr594090585a.36.1794010152431;
        Fri, 06 Nov 2026 16:09:12 -0800 (PST)
X-Received: by 2002:a05:620a:2811:b0:93f:3120:6c84 with SMTP id af79cd13be357-945f349a5b6mr594087485a.36.1794010151996;
        Fri, 06 Nov 2026 16:09:11 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c4b8sm31998536d6.15.2026.11.06.16.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:09:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:08:45 -0500
Subject: [PATCH 2/2] gpio: tps6586x: convert to subsys_platform_driver()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-gpio-subsys-v1-2-0785e37520ee@redhat.com>
References: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
In-Reply-To: <20261106-gpio-subsys-v1-0-0785e37520ee@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YXtBr3z+8RrgCDqQfttBQjV0XZCNC1l+hikSMXOKPrk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5cjJvbou8GC9eMYkhxMuWrH7U8t/yd2e1zs17cwp7
 ZTAH1EHO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIZD/Df++q++Krnz+d//2O
 /pyXf58ox92Sa3Re7/J72tTMHc6BrWcYGQ5p3fneeWV9s/hx7XUGL/yuvBE33/p5hn+6WFzVH9m
 rWzkA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpio/gpio-tps6586x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index aaacbb54bf5d..e19af562ec3a 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -116,8 +116,4 @@ static struct platform_driver tps6586x_gpio_driver = {
 	.probe		= tps6586x_gpio_probe,
 };
 
-static int __init tps6586x_gpio_init(void)
-{
-	return platform_driver_register(&tps6586x_gpio_driver);
-}
-subsys_initcall(tps6586x_gpio_init);
+subsys_platform_driver(tps6586x_gpio_driver);

-- 
2.56.0

