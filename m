Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820312;
	b=mkW/QrwRoTXntzMRRaQIrSvtuAsa+LvHC7Gth2Lw45HeVwZtKYiLbDM+PmN88rXRFagO
	 vbdUQfFVRjEgfU4Hvl8wMVB32iSC8v++60VF4kP43BydKw8+aeM6T6v/OiNe4nCFFJVhT
	 njcURde1DWAvldeT/5c/fiIKVxRXq4ytGUF+4g9TJj0tN6BM3avCExok3tSOGJUppBubj
	 +denn8pK+ImEJ99Ktjxz70MgYcMQyubqkZaweJSGEQMb+6DRN+/Ak/xmdy5xiUkYZqPwk
	 PlMx8axKG0EZZQX2RJgITSI9yAyyrErk/G4vmnQ1w8TmC4xxyUBC5V1MIBIkr0+Xg8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=BL6nKDVsFtkU9pyKl6tEz6HM9F2JB3NKIc/S0PIS7l9w4XtQPkki5bl0UuTWXVqTNigV
	 WV0OnccRYUiD7AdAMBpsURfbo17CIMV/z4UDl9XUotXrb9R8YWDkrv59Ig5Vy8ZQ+9SOH
	 GpF0b4vY+T3yazN+xO7+OZhDoCnzlQRHuXYBWZlZq6n6tAIlcduFLvq5UlB3oEkLNderX
	 FwFKhkIsjR/u0hOF0FqsxSzAwtBqIumPLPSkK8iPqekO0qhwB6EPgbavKvHQplLCrh+Wg
	 jDmKdV4mNeEyC2nBgJIRdrHQUyTQMpmOPehua2GmICpoHEI4LFFZUaXD/8eSTHOww8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+q59A3+;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAE06080787
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAE06080787
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+q59A3+
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4d7034a99a9so691909b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820310; x=1794425110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=l+q59A3+sOw7fKxiBQJb7McYT//0hRwvDg8Ct786G6Oy50j9vWzWGmZnEV7RHgdMWu
         98SHuZlY9XUQYHhg0iDB8rrqf6CjaScx0qFGzrVUN0aP6NK7YhnwwT8RGc6I0YOYPmz7
         /ijtTs/dmM4lZMndW+0EfVVvzaPyJMvxKkrZiE0N3yRt0lC8+mNAMspdIwrbCvG3R3LB
         un2KOxhfWDqnY13nwSBSSUqN83H1QoAUhTwyPLwvH7CEdDYly3uur2iMlYthKDNftoGF
         TErHkRGKcn0k6N6C6MwT6/0kSLXFRwfiMjdkjOMZkhK4PV+aHmUuewZwVzCuNNZ7bz8d
         1Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820310; x=1794425110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=wHUz469znKZyNbfHrlHDnk/RyvT9SkH25QyF0o8xUzxYf939IpIvTNXXFvornO6S3e
         eAvfi3ICF4a6KDQFX9ZhP3kgMhGyfnFWiSepIhoj0XFkVWVUP1+9LrfNMT52CC9ZcR2e
         VsRojMGJfyvAFVB4R8mYXFQ7P/4G9FTVSRQS4zFACIufsh2Q/Ia+Uvwx+r0qYIJSeefZ
         mKR1QC/4q2fpCKKSEfFsEiY68GMBbcJpmJHhx2zyVmXIPLZI4t6RfxiZ64JyDVyctUQD
         awIWIAWfB0Jq61YgOVXzCH+GWPOG7CygtnalgHIAWR/DWSPqoN6QkWM9k5J7LEdCvGX1
         1xIw==
X-Forwarded-Encrypted: i=1; AKwUvBweSr7QKSM81urnrGRgi3q1zaWXNVKEVvuqHy9TXGUmHmXjOUWf3FwrK9lAUc0LvuQHcUolCwbkMb0XpuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z86ToA9JCP7JRvcUxsFLfihj9mNWwiyjek5vuwirz7bK7hpHDOl
	Ub1gBkzWEIEWVtkXyg6vOok2tghIjtQ/n/vxecbTaZSyRShTRZ/Ca9qz
X-Gm-Gg: AYBFou2aHnGIFaZX93MABFrGoXh+h9I/EX9FT4YOxbISmkWnQVJS+351BN645jDYhnk
	ThLznRidZ8OTCFxta1BluoCby2+14Kj4OXwJ10B1WHfQTbo7/YQSb0NFnIJaiUUD0dJC1T+oNmy
	Sx/CmF4yriArXXf8JAoGIN04getFg0O137QNU2v2YdJFGmyXmx+hbkKRx3NeounJixGz/RWhesg
	ArEGhwZwxUvnBM7zlLUtV+trpb/rd+kZo3FwRGBTzTy/M4OwYAy7rfyPoaJbqlHv+SyFSUJtm1h
	pooWKW+DhZRIQ5nqylkMrhfug4iY6uPdOdgAr66b9YysaTwasOKniCk0sBnLKfK5aTj+GKAXLQu
	bAIEUxmtfguX8B3lNA/laVwfOQdi+vjQKsEpzg/fN1C0FQC8LB4PJ9Ek6qbTpc58FNMCl8CWw7A
	Rg9CI8+idA9ItWMzm75vtms8fXIXaAvqEmm5Vguvos4U+uniw1yjfqZ9FWHC7MgKAhlYhL2n6LT
	p82tzQ6X2iNIBaEtN3NUWlLHr+sgs/4sXkdhXQPC3jCHGO4vAYJZ7aPVHtotUP+QmnKtA22B6sG
	LIhZp+niQc1xp+OEGhYc+QhsJ2K0NP24WXYr/eVitbuyMeWEvgmRW606myWgczJditaUqtUtHhz
	2U37svkjr1XsZetHTWOyVXJK7tBMsnAKyZ8MVmcXbcZ0VeE8+sQDGjK1OtDmsW4UBpX9vJ8Fky2
	OomN5zBU6ucrd+ScOX/Rph51FVs29CYYNIuR4lFqBfLVMhm0Rq+2R1
X-Received: by 2002:a05:6808:198e:b0:4d6:9293:9b56 with SMTP id 5614622812f47-5640de2e892mr13003756b6e.62.1793820310505;
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:55 -0700
Subject: [PATCH v12 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
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
Message-Id: <20261104-h616-pwm-v8-v12-5-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

