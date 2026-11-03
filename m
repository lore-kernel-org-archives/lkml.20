Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695243;
	b=YKaGx/7uuRknPA6T5k0/NFeddhg3z3Y98jnS/obsLe8rwufOo4gn9wFFt4QXrdyzjWsM
	 Q7I2sPeNgtHxYDhCsp2olRwj5yN1feMm8qthE1chwcLMRoq3XPr5N2Dcqo3tshu3ZlzA6
	 eujNbhKFPtDoqVuWXoFy23knO3MidSKNDpb2KKNrdetmpyPNtTxEoaP+6uZ0jK2iZMhea
	 6Pj2gjzjtmdUgZgBTIlPele3UlWm7nOkC+ZqmGNEDv+cLa2C3UCTxGNsBP7gJ6QJCTCky
	 G//MzkKYwQ2tKKu9vCkkfSWPMOO/NGUhusrorUPT0FaUzkXRn3rYgPyKdu7k/g6MeLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=HhIHAZ63d3zoI/XscWXScJWhF860Ls2kp881PfM5mVCo0YAnXJBwg2I22qYBIsUJs/TF
	 XspU3No52/l73dAxOz8BRwxrv0X+4f7lOxx0Nn7ayoMJGfueM15u6+ltCScAnmmOfB6F4
	 rnqXzCrOBi+7cvgvu/BOcni9jF5rpMUOq150ofY9qhaFU4mvGjraonVuefHXsjak8O/rT
	 NxTJydOjGUxf4euScllb7B27BoxuTbIWmrDE73o59Z5+2GtOUD3vkB215Z+0E0qRZhulz
	 bz4sNW5IRoLFxylQ94ISYZdho9UuSl6Ve8F50xhRG5bsj+Hzlq5wsZoe+TK+gkiJY1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOLJ3DQY;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391E4606D829
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391E4606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOLJ3DQY
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70b875f6f1fso3695838eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695242; x=1794300042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=tOLJ3DQYUFTqy8+wS6aTVUgmEJDaN815utBQykLJtiywUfcmccsn78sCFPD8ZoSt2G
         aAnrlwTAZcUd0R81aIngQrYfShPsw5b/1f+sc8Pvpb0YW9CxILEJrup3gvGCi3ngRyAU
         CPu/cNvPg5SStaa/HH0Pc3bf3TsfSaIJbu0R0ot7eOHE3JrpS1zUQbwx6nByNeDLjMfJ
         CWr7H/cfO+KEFKPRT+NfQAsJOsajqJk9b/G1x5Zgj5yTcGdqAgk6/J5K7wFSYCp+SdLp
         uSXAt+TynZBZ5IfBVxLwRmOQOtNrRD2Yh/CPIre1vvNVHFNuJzLE/c5watJNX+FII9on
         SwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695242; x=1794300042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=BzgsSc+bIBElJjFK7rggrP9zyKAHMnmMASwP6RWF04C1pd833uQbipZvcLZnJR4mfN
         lvZFdphiTxfZsQCmMONID9iEkfzeO8CPlgbeip2aLMsT/P2HGzdhvqxftlmPIS6GVmO4
         P0CFgcAYMjVL+KoLunuCceIr1Lc6Gb1TZaSAVGkcPebKIVo0A4qy8r62JkwKDbMgIKxk
         xfJjyqDMo2xeRHhNuSF41MmY4yZaVN0RJX5BdhIPkCgAu8IrvMsunE9RLwrp5ozNJaX2
         akleXhsAtyfFDnxiEfdIrWDKUoiMSNHOFpjnAgXsseWUXMnGrPeDnLmFUyyk5WDhQSNb
         6l/g==
X-Forwarded-Encrypted: i=1; AKwUvBwGJPuyCZ0oKYxJ11irlQf2I2zpbU4eBB60EkVP00/p9K7OzPAYyZrBUtH3MwQQVmZgEWaQvLUQrSOy6Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z939QR6ENpZqD0UcvX8FJwwgJ2ERgqxiJ/7/JHxryHUljm9N7z6
	JNNuu9nTTQ+WLZXdXM6HsZ7WmmkFip7rvCsPWbOAk7In9542SQvZQDO5
X-Gm-Gg: AYBFou1RVUqTJMCoe3sP4yD+gin5vyD6PD+W/VLZiFFIASx6r6l0g/ktqI9porWOwAB
	L6+3Hb8fbcmyz6PkeoXYF0/hiNa57sppj6Y9lRZMZmdItoNMqUNs2OetJVvTRw3qN5IpzLhBQab
	oYwqQ7Pvk5vn5gEwbuW0zEvUWNJpvfiYq4PzperXwklaJ6pDEY5gobBf/sxxnpP7g6pb7HY4loo
	Mm+ghgiXi3XTbIPAGoaN/7A2KZyI9agGNbuGTJBAqqgblrLqpRxDWfbFJ+FPCvUDulK9wrbBjqO
	s5tjMAdrvlrxdtpOnAhD9P/QoGdbTVadHs+qKI0LorkwT7mLYCcxgH8md7FtMcMf6+Zw6phDI69
	xt4sRZxtXL/k40HIPxXbr093K6KBc9ch3hz13CPO0kcblnIrHYPaU1WzHJNme1h5G7VurBuaTwS
	1OHFDQ4tXfyivf6ic7fTFSwnrMW7K4UwWTTKU+VOVXXd+/rVTtoiNMK6Fw6YKF/AuTKAhnowKA4
	C1HSoDoyZq+o/SptS3+6lZ7tAZZDokxl8RwF7zsbdFe0TE12VtUinKOjAQ1oPQ6/luSyh7Ia0sQ
	Dc5S2zxprFRCKNY9rJ/7znog4LI0BFGQ35P1X1MBYFHe8+XAMHl57FAqxmRHBiCeUxAWu1gbMet
	95oy5vgQVQCKJlFuesiAnrdiZow8qnQYB6Yt/xrRfFgRA/r8tthqW5bryb+3/xLDbwWetLrnvuk
	8v0PpI/aAoXrjBZkm2ykueGrdzMBn+VQ54YNKbLFnZH9x5T7kTygE=
X-Received: by 2002:a05:6820:240b:b0:710:8db7:5f57 with SMTP id 006d021491bc7-714f2ab5e9amr5840218eaf.78.1793695242282;
        Tue, 03 Nov 2026 00:40:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:30 -0700
Subject: [PATCH v11 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
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
Message-Id: <20261103-h616-pwm-v8-v11-5-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
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

