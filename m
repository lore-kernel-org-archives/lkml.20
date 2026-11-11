Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412229;
	b=hvD+UYH/o2ZiqBCRo68CIVXyZWkHVLNy1nFeRCVQlEjX16iB5jistmRqs5pvZaV+F6w9
	 WvRsHt6Yn0lKQOBLqpp221R5lN6O1RjePG/JLUuLx4/jvs3tGDj1PTBKLTdKdT0EKYwe7
	 FhaC7YjESavAJNf38ssRP9fxbQiASLGK4CYd2U3xFkOvX4sQ3DpVr1Rv75QyGBNarKJ07
	 1en2990X6sbJJU6viqWA5s4CMIreRkorRCRGCZ/TPq0u5HbXPFXhXiCedlMqpqGaj7Xbj
	 ubHf5YNc7h/5/2TNZQcgesHONxXXaszMGobo1zCmy3aDclyx2qPrcL3zIdS/KgMlX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l8rEbBk/frWGcm8vmmYWniZSKnyFmveilgeQC55Mq48=;
	b=bzZvQIKPhffSlocMnUyBioGbfzEp68bO7HNVv2kQ/sig1gWpxMyZCcWhn1nhEoZqwYEb
	 Wbg44Hb8JWlyA+Eqn8gBkUzEE4ZQH/xvYkgwoHU5TwQsmFx76S85zwPsTzu0u2TY4e4Jz
	 V4NFDmWjxr0j2b4/qu6/ISBFyOKOYhUQk+zPoee1TGxs2BUnwrOLZgyM2ImOBMR1Lavzd
	 67SYf4yhHjPHUa9NYXknttH9huOuYAhTPaLPkrIsUOD1BjB/uiAmMviToLoKa5jlMqNHK
	 Rps6yMOnMUJ7aEDAAbwO36odDMi4gsWBXDTxpUd6FLtth8xjPl63onlQNzsMWXWEuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="bpZ7D/T1";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB47606A8A5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB47606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bpZ7D/T1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so30743305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412228; x=1795017028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l8rEbBk/frWGcm8vmmYWniZSKnyFmveilgeQC55Mq48=;
        b=bpZ7D/T1om0Dnu1J7Jdz5/M0x9dHkxaNYIPDAzADm9LQuevaC8rduM3GvgYPYVevqS
         StT7yJ7gWX4X4ruLI3837CZLSj4T/hLtle5KmosWTDIbsd3oI8zRzsQdlWV6mqpO8aC7
         rnBO73TEPrtnmRuasnjlkfClGdekahxeb2/IWZwV4jO+5ypkovHi3F/mHp03eDvzl/0M
         VT61jcDOcX0GN7Xyf1MP6B63sYJsvESiYRgr8Ojo06Rmz9WmAkiRLV9esnCmwKK/rLj4
         7h31InsfQGvpZUyeKxmeTIuet98tNhiVcQ6qeJcIX7/fX+hODM+nOzX4Ye6oO1GGe8lW
         gvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412228; x=1795017028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l8rEbBk/frWGcm8vmmYWniZSKnyFmveilgeQC55Mq48=;
        b=ULEldqVgLw5u6woxACo/LbLXyclL0eDydpVibRYiJKHN0fpikBXjUJdXRQDvXFN9oa
         e3cDnyOtRfdNy2YIHdtDhMPLctGvtDcOWj+otRZ1beZnMJ8ATPnVxLk6M0tcN04c73BT
         Kh5gGxOQrAVWmNEu2Qdkb2vieuU/8SdFAipsKJxKqFdq3guAeDz4FGW2V6QQ+IKli5SP
         jfPHElCDpqHewlLrryocodQr9hsCuwlGFqCRn3vH+Ic3n6KRTGq56ibYF1csI3M3nWZR
         GXNOkOUFnw1Nr9BH5PioyGX7TVAztIfWziRa3Uu5+Ws3jzeRuYcOKE1lvZBmFb8She9G
         LEtQ==
X-Forwarded-Encrypted: i=1; AL+hErE6XAb5VQ8x5Hvwfed32DiiQS+NsgE2r1uVuKYEhCqeyYX2IDQUp6sVV27Z2Df8EfzEaq1BXiL29MDBwmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3zgJc7+9pH8POOFyRrund8kR+eixZXNVAEJx9M0FA+hEGjMxo
	O50ZvRFDMUyk2COsrm7MrwIosO3aVuR6BdrVqZLOP8xYq5d6sBffGBM76W1HrWktUmk=
X-Gm-Gg: AYBFou06im/Tmxz3gv7QRprfO78OB2Ag5FLy1qcv8OwWdLI8+LuswkxVImDZuKdVmpX
	8mwDBolf5S9TypDinmrpJ+rGe7rrPdip2dha0+JgSw4OZ9YmZyfTZaJg16nQxZqzrtxDIvAgzIW
	NQzFFEI/sADTYW2MMt74K+m5LIgdiOrN0mnH61pJbVOGl3kuuZwKglodaE22qGK0PtubFcVnZs9
	egzi5CnTydPLH2Ndkjenyq5hzXMIimCKoou+K9p/ke+3EDYtJpRvjmKtbhI2qXbLr6+25cN0SXt
	qLq0DRYmlBX3lx0wG1fY6J/2Nh5DH5TzXG1igkVd3ast6ZG+Hzsd4WmeM77YnI2JUS2fQu7QRmX
	NWFDuEAA+GrW/iOvesVZjZjJuvGbAgYRWPT9Nb4P81Osvmu0Qz3LYcZ3GF3GHvZ0JW55BtcBdW6
	UbY/6GQNB9cqr5z2YfqJC7B7XTdqC9RHp8KhJPGKkbJYKOcFORFmSAz+waHNSVyz0tu01+jzSAU
	zAobH0CRTZhm7PBje2UBo178b0ekSh34ZQPnXTQzFq5ThbweYcDcGkggCNBK5QH1w6JdgSfXKdt
	gPsDnGv1N7iVBbBYhQNIJMJdYzNZhgA=
X-Received: by 2002:a05:600c:1d1d:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ba09365d6fmr50914325e9.18.1794412227371;
        Wed, 11 Nov 2026 07:50:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5c320dsm4460995e9.4.2026.11.11.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:27 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v7 10/17] printk: Allow to debug misuse of add_or_update_preferred_console()
Date: Wed, 11 Nov 2026 16:48:09 +0100
Message-ID: <20261111154816.71103-11-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

__add_preferred_console() should always be called only when either @name
or @devname is defined. Allow to debug the case when they are misused.

Use WARN_ON() because it is rather an implementation problem, it should
never happen. Also the consoles are typically added during boot so this
should not panic a running system even when panic_on_warn is enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5275bcf32578..60ae813769b4 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2585,7 +2585,7 @@ static int add_or_update_preferred_console(unsigned int i,
 
 	pc = &preferred_consoles[i];
 
-	if (!name && !devname)
+	if (WARN_ON(!name && !devname))
 		return -EINVAL;
 
 	if ((name && !name[0]) || (devname && !devname[0])) {
-- 
2.56.0

