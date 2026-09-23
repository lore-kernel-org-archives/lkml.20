Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B23439F7E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141794; cv=none; b=ed5JS/g4h/xujEaOiAxECHKJ+fx5Jvpryyv23J3n/A74lJWzG9zhlAsJrHMI8xSApUS0/d6istPvL3iycBGTBSH0pQO2ieo1lthOqwzVtOFNMm5owx0ACzAdE7+Mn7G8ucYC4cPqwK2dojqpbWO7eRaR+nZP5VzLieiVC0orZM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141794; c=relaxed/simple;
	bh=OJS6mQlRWmTTimOyj6kC0TvQSBszoDm45iW9XPqV2AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J68lSf5g69eJlgXN+zG2Gm88/rML6W9zzcrIiN65MwH10YGXrT6N4cqvVA4khRVZXw1dfYw7yDskHeqS/tL4ahi41gdU9fhxQhZGpgpSBi5ruGxcJ44NYm564jHPJFFYLMFsQ2yNtRdV9zUQ+DAOGypYwFvDC7+1C9BylAM/XGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxUBZbHV; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxUBZbHV"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso283893b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141790; x=1790746590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=hxUBZbHV6QCZXuCz2XUqH4RtTWSjfTtAuoAbuFYn36LKQ9UFFzkyYjzF681zZBcisc
         8gX0HdHSSHLXMLJWsgtY7NJN8Mh3EKqnpDidPuVjlB1MQQfIqsVIwhx4aN57mur4AG2C
         DLJnCIaN41i/bMg5PjAzqI5BQQu7GQp3OGkgLYkVTaiH1tGvvvFKuBgo8QRZfr0aBtpH
         Ff+a2hfus3Hb/uK/Bl+HCweZCBtrfxN3/DSHnWNc1UatibpDktP5PmqUCHXkPQSlA9NU
         G2PmBYaijuANITHl0C8Ihh0xfNXA+UExUFohEDPfEW13k9XpVleZQAEefxpKgSmAPg7+
         wxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141790; x=1790746590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=scQuIgkyYatrYN6oRzIk6/atQctMmWvi5r7yPgoJ8nbIh5TYDH0ZFm3/xFNh+dxPqy
         1tBVqGJ4pZtuxmA/KnFmJ0CEf5ACYtTTmGwC6lBMVofQJbb0uwN/01/RvrKNc6pWy/HJ
         BkeKL8slntOE3qSMUS/rp+XTed9fMnN/Z0hB8X9FX8R2Uuov6J18AfaNE63vAQ1MVn29
         ejzvT/aveNbPaaA0L0yzIEZlrjlVgjTBwp8CALWKP6815jzLE4gxsagfnsZ+ZXK7q2Rm
         MDiGKb3J5UaitMZpJJt1TA5Ze7xWP5H3aoYb46e/IZIN/YXG0OnHL7ksmLgx7qysII+D
         9R0Q==
X-Forwarded-Encrypted: i=1; AKwUvBww65w6s5P6n9Eo7jU9XQvpITOgfjEZKfKJe7udN4CO34ey96+k1zDPTOMSV3Q6XDtytGIpGBilrGolXDE=@vger.kernel.org
X-Gm-Message-State: AFuF++nLDm3qHcei3NFZ3FcXsWNJJqVKSRmutv53JJUocqi7M8pFHyAv
	Se/QQ5LvlMofTY4ov3U8dpZ3V91v0+s6+iajfgJhBmS+xIIFqsOE/jrM
X-Gm-Gg: AYBFou27qZA7s/VlMW4bVKpfj36aVTeQMV+Y2imTDr+uaJahVIvS8hlDwfAIpSOhZhN
	eXi/M2EaL8YIzS/GzMhFFQDzSw8AAT+hyJ3jxr+7ktBdt/l3sl9AA23ONPnP7VoyVH24QjcBVlC
	ZL3cn5kYWD260+YieGFfG+gwQO2HMjFjbQsFysloHhalPea8PM5SWyLIbP8ELNN83mmQfkhjzCz
	Xil1hnDxQwprDSSBl7GbNjARfVWv8uCedriyWFhxDdK4SBy3urfDdMuyjTgYq/fqJHO9QlWmpAP
	nkNEXZVhW6HnmEfjPSJha1b0nk1LZ80MnJ11CvcKSxG+eYYXRVnjx27/Ww7BamqF19rWROHTccr
	HeUpAP24ZLZ0ZPcG1HolArCUSNs3CM3Ql5uMuRK2pKt2jj5WA4jTorwna88x7HVC4GTHbtUSYsC
	tdekUr/Qzf0+6tnGLSlp8In6Nmbv7uNGG8KcWAxe+SLIJGIB2FzjeXw3IVU4mywBB+SvJSevAht
	ooxUG63fxYDfOgD0d7/5Ks1S+zHsyZjisY1afpgHzDRWUNx6ChszIvyygXJjV/AuYVJXyiojy8j
	WBqReB2NB7Z+Nfje7HKesOswpSg+FE2sMRWcJoGxJzuSFFyN8C5IHkH/NvF3pvYMh0NLs7lZgN0
	q0DnN+udZlFsEEEuThb1s
X-Received: by 2002:a05:6808:1495:b0:4b9:e5fa:8a1d with SMTP id 5614622812f47-4d5ba092ea7mr1861997b6e.34.1790141789974;
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:18 -0600
Subject: [PATCH v10 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-5-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

