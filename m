Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547542;
	b=rQzjQKWoAqTOwHUWEQ0WHce6X06EN65ScIiTaNb06MZkmkB3Y06eBrJ/VVjZr1ouzJqQ
	 Z/6TOUQG9jEIeKMKmpjS51ZvZCb9e73tRYBmYOtqfBUU7szgnrLciD4Mli6hoZULJA0a7
	 87lhtjBz0gEkXbs6MIY1eazBr13xVwPR6q0BJ0PNWjUVejE0iM3PePEkgUV/lJ92u6JbR
	 MBMfqNsW4PLQlaSOuyNbSA/mheGzQgx81yyw+HMmTjph1uom4TCV9xOSbBl+zaXZfq5L+
	 AZxDDbLW3nHJFSxO+qW/x8NcaEgmLgazJ4qxndLAIDoS1W5c2SwvPkGmLw3BBLQ8I/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JEo4SJL60UN9Juaw0FQhaKBHcMW/EpaacJVnI7bYB7Q=;
	b=HZdvYqirTBNGS7Td1J9J6Np7Wq/0cd57t3/bxkOpgU0wPpWEIDW69/jjguPft3Q9prP2
	 88ZVuk429DmNfswyEJW70eXerICrVRHzRee+9qyROJuFOgXaSYXcfmoNNI1tGboy9FiPO
	 Kam4UySOTkRj8LCwYqLE8eFwFoWT6phxKTUJZkAiA0nUg8OXx+0PtAoiSHmz0z248BCjX
	 azAxu6DoE7kUltRsiwA3k/SElax+ON2Q+jEpkiYeurKzW6Ys3mE0O+ROsOidwPoacs6rV
	 wwMV/rTA84VOtqQrxwNEKuwLczTDO375xjvmUtqWE5Q9FMu70SVNtQ4AYjarTAJpj+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGf0ZvmP;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8589606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8589606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGf0ZvmP
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eae12762c9so210383e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794547541; x=1795152341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEo4SJL60UN9Juaw0FQhaKBHcMW/EpaacJVnI7bYB7Q=;
        b=DGf0ZvmPepL8e2KEp1ekz4S6MbmH+GxLJmOKiWTcQA1a7fGC8JtuCGKuHluxXfjY9o
         nwgF+ENBB6JD1mWmr3woVp7TjvdQUwGs/PG+viXzGsozGFLNcmktkQ3wydwVglPdTQRr
         XcMI6LWQ+Zn64nESzIDR/pMONdxcNTJIlNjg0UMpWdP8EXxXXTkjpc5ge/TZFcqb2XPR
         +LB/b3Cv+eH3wG5VuGH8BpeIiOg4yZX7x7ohe48+0tFarYaclPU88iM2Lue7MqWWUOWq
         2xW/m72dGCnqEB3JPoGcVoAMg8aXrV6G+AvEaQe1uq9X5yey2AONliylJp4jcstjMAQj
         qU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547541; x=1795152341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEo4SJL60UN9Juaw0FQhaKBHcMW/EpaacJVnI7bYB7Q=;
        b=nDyA/r/OFQoS97TSKzWy6jo8YRqSxRtYjLd8q0aPrq67uTb1tNljJPwGgxSTvDYG7/
         /pX8eDbl4/O8zCh3l48OAUXo1YOM3IzWeOoqzRX2H1VmmWyJKE2XRGOIKz4QlE8d2a5S
         OAyUqaXmCus/JWX/KuTUJCqQMhT55y0IsT8oXkBZLxGm/23VaSDMEYO/mSrPuiMARJFM
         NXqFyieAWWCe3ksO5sKRooMMpkT2qt4PzPwoAER78n8UGnsN3qqzujFR5V//Pf4PzYtJ
         +ZyqlDwyzjzLPWbpsB+74S5V6/KzoxsKqBw1q0lhbY3JiykewdAnkK1DqIkIDfvDu6Sa
         Xlrg==
X-Forwarded-Encrypted: i=1; AL+hErF/52XRHnOoZltU5Q3B61EbvU12wQ1RQ1OAWV8oQ4r7qOIqXymz50lqsRPwhn+9AKC5qSnYtEtiap3mFwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQnUq7IUz+o4sesW/2INF8FQMTPz7aiAYd40dBGENp0T6Pn28
	6tAJdybz+VDnY+YCt8CHymB0EJYioIMtTv15HI3jgwnnCOkLI9NOrX7X
X-Gm-Gg: AYBFou0DtMIJnlXzOi/e3jxQ4mO7cf+XwPKAqAg8D/buUMvuEex0yYXG8fntJGrNUpF
	s9cY6hK1MRcgy7Qt0Ztbl1Jrwq3EOqjR7rAC8j2yC48I2s5X6ODhTGOqe/aPAlEHBn63CLtbLoL
	uGTogk9GIkZb2j1CrzAmCW894cSdEi65usTJ7YFjSiqpjwEjxbf5x6HLkF94V1pliv/XgmD1xuX
	KJSn686DMjlRPd8uzXRXtLfu9tEi6Fwun7F0KKz8TUjcVEIHOreHUpNl3qqttIdnJ5hU/E1cKt7
	gyvQwo/8YeMAxJVJvdqGc5Y1RhvwoMI8mS0p4rVW2jzapQvowEF7D4+ur0N1c8bFsJZ243awoMO
	IdKzA22RdmxPu3NdPBvbCJwXbLB0VyYja2oONAoFS+KDaKojQDluyxPEEPObnicKdVf3kK5UXdC
	5vpZ5hH2+xrVu6j1V1NeOOxw+ZMow6mBdZQPhb/rPNbXNcb7xpdItkUwDAKWOU3fCnmnLSkVrJn
	WJEDWpGYStwVo3kKHTdwmh+PMk+UWM5h9O2W/QfLhhMvubIxvxG/8jefliRO4smCF4n5kXpcaXm
	XB3XLdqkKvv26AIi8pw=
X-Received: by 2002:a05:6102:6cf:b0:7d2:754c:23e7 with SMTP id ada2fe7eead31-7d64d83f820mr356046137.35.1794547540758;
        Thu, 12 Nov 2026 21:25:40 -0800 (PST)
Received: from [192.168.0.8] ([2a09:bac5:565c:aa::11:1e5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8425d142sm880439241.5.2026.11.12.21.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:25:39 -0800 (PST)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Date: Thu, 12 Nov 2026 23:25:32 -0600
Subject: [PATCH 1/2] iio: consumers: fix kernel-doc parameter name in
 fwnode_iio_channel_get_by_name()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-iio-kernel-doc-v1-1-e382fc9a47c2@gmail.com>
References: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
In-Reply-To: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794547535; l=1097;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=XLVBA7MkGfQk1XAHfgQHRCqSoV3TsMKT/Mo4vTanYWg=;
 b=4UNaLh4Xjy9XLOyTAMCY+rMNrM7R7jbPfavdbwChqNzbyNvqMxAuBKlo/AoeLih7yM1iPuUw+
 B9/VHGt962TCllskNza411pnfSIrX3rV35m5UvJja9eFJjaM+XLrreC
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=

Rename @consumer_channel to @name in the kernel-doc comment of
fwnode_iio_channel_get_by_name() to match the function signature.

Verified with ./scripts/kernel-doc, checkpatch.pl --strict, and a W=1
build of drivers/iio/inkern.o.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 include/linux/iio/consumer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index 5039558267e4..b9593d24950c 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -101,7 +101,7 @@ struct iio_channel *devm_iio_channel_get_all(struct device *dev);
 /**
  * fwnode_iio_channel_get_by_name() - get description of all that is needed to access channel.
  * @fwnode:		Pointer to consumer Firmware node
- * @consumer_channel:	Unique name to identify the channel on the consumer
+ * @name:		Unique name to identify the channel on the consumer
  *			side. This typically describes the channels use within
  *			the consumer. E.g. 'battery_voltage'
  */

-- 
2.56.0

