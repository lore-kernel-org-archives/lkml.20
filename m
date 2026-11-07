Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011252;
	b=E6karbHJV98qE2wHAGTlBmfCH9sMV7YB3DkkY3aNoTmOductyHL1H3sjLQSfUemLBnqg
	 R56E9Qe/HU7u2bkNqIM7gzs9qxY6bQ7oKZ4PWDaEPL4YQWSi3cOxLVnH+48oHZX35Wxcn
	 8EjjfeREdbDZKVeXiu10cJ90XjtzOU4IPDSK6j8u/YGO7RKuWPgvhJJnHxmt/qZRSTekT
	 aLiGXB6lS4UGBrliJyf7V2MYV60xN7xK4bighEvA0kUX4ZaGqX8r16/al4IFbIM30cgRG
	 sQq4Nf16HvjrFgiDUK/YYBfLUL9DEOG+76zxgpXeeXh28LUEps0gI8T21yPEXtwwZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011252;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
	b=Cf5jZkBxhOTM3u7k74KU0KCtYOWUtaDYoTvU5VIbm9ZcNXpf80CETpku0M6Jo0KzaN0i
	 txTQcbZrhR85VKKQY78TH0vPq0H6ck20AGxZ20Ycth/Xn1Qi/BfecNE3DoMGay79zyu+6
	 0bgjk2BREma52pzO62WylWcyfjNMhWWvpZIWtnx/IwhppjLxtQs4COPidZkqeQq+RoLYK
	 HuiRIYq/qOlGKP5pz06adu2CPs/n68pM/zzIbf0rsiFRFIr7VKfdYKm2JwOCAcgSR+BJy
	 lZv04C16WURE2JQX8UkUKdhpPdwKR7twCxaIiVKYPoL4WkR5iQzJAHT86DJ57wAoayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W4XY2twT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="XRc/9wth";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB8F606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB8F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W4XY2twT;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XRc/9wth
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
	b=W4XY2twT0FzJyAJERSGdkOnAXHgpQxRABk0iQGI/CrhBWOvWSCV8I2jPIRJ7fpUtn1dwyE
	5cKKXwcFtlk4GJcr8UH1uYLvq3vbjf8DXJSw+HyC/pAdAA4wfipVWjHMbhulPRjJV0MJTi
	6MSVbyy4LVxLu1f8DLHT02fSct/eZhg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-GTbdGNF5Og-13JrPN9_1pg-1; Fri, 06 Nov 2026 19:27:28 -0500
X-MC-Unique: GTbdGNF5Og-13JrPN9_1pg-1
X-Mimecast-MFC-AGG-ID: GTbdGNF5Og-13JrPN9_1pg_1794011248
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so400274585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011247; x=1794616047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
        b=XRc/9wtho+AlA/ao6oK3x8Xa9FYeG9zsWUjW02/au1f3alKP58W9CD0VYRLBzHGhBY
         +EZQnOKB1uOyLI90XYyaBbAq3yUy01h+uCqci/J7GgfyQ8X1FJFNGaQhChGWgOXUVaZy
         SZy3Uy0kdByC3rhz/oueukC6F3yBMrrmXA7OE8UgkBAthqvC54gJNLgdgBoHpBW8uuE0
         IWrwxlmo+/PDCFRLoN82jhyRN6M9k4iZIxZ0Qq+owZsybIQd46jn3Zwz2fwU4PHRSCvn
         Tza9BGTgwUbapRprZNj7K/vtjXd5UrUxfQq30QRRw6awVYT7GE/kYdS/MkgC2A8Xe2fh
         Xk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011247; x=1794616047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaMRO2fzvzuS1ux/KmjGKqBbaSfv45k34PkBtBvjTNE=;
        b=RuKDXl2zedehD80BBYqdPcfHR+2nfs5zaTeOF4NlJx63tG2A3OQwekQoAVGq9PzSQb
         lOvwHnmDp7x3OFOU+at7UPtzBhbRn5Hci9I0Iw03Ib3xTOXPeKt0OyZuhT/5LCIEh6nX
         LCw2a7OcxGtH0pm6YtaZoeaesBGm8HlQ2/SSD/L8nOmiDBvi9zNrIMI3dnBFThIsCkKg
         a21GpDOl/wN1d+dbA7sWjH4zPo4V6NcbbxlcGXofdz90d32kfUNiv9NFlLum4kFNR9Ys
         MLsMdFfwb4KiYdqdjlQefP1cSZBspNuiyYsP0HrsKGXtMx0anULf9s8lG/cwdNofAMgH
         dOPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj5bX+OE30/tfGjZv8Xheaq4AZub4SWCkiWVM1EiphTxag1zL3exoUv6wlqhnDow2Xb7s9hX79aJneLgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rw0LY8NK0vOgrWojAikxBsfs+MkWnOk51/aPoSUAUVKp7Uzo8
	Aw4Yt1yxBCj4BBkq8FapDFIJuIkb7pqMeuBEF9fY5sZW2jld7NWXj+LEr5Zb5nYx6wlMutWVcZa
	6Jb3xiMaJwMNvj4HasoYKHsfKKLkn7bOD4H2Aa3DOY4v2A3PHYvXm7EMTLu8fJO1WFg==
X-Gm-Gg: AYBFou01C40slyH48ngact/kMwHILMUdn5AoSsuNTPU1KSwtTDXKk4XYbj/3sbVGAM6
	/ElFuqGksNWm6DuoyAVroB6EHAm0Alx1sTrTalJE3WC12WBcUUngmInpodivEkhlZoUNvk5ftw2
	Ww5vIgNkmZ8KpDhFHkNN7xTa1Qven9tqpfJulwd0DmHpJLmk2FVgXQHfxqIjGIbz7EFe1rutz9E
	pxaXuzzhmEioQIKFN56bWscSSfzALrun/OCMUDRvpjpcMW7xgYxHqZ+2v770/JDxc0HQIa91lV3
	v69ZQGEd8O67THBsTttfd/SexQCl6+LfqXUs4uVjFt8dkxWBm4gAsYko5vtqhKbKyNqO1SJHT1m
	grKKC/GbQJ4iRFiM0piOhK15z7fKhuPDpHbXILPZaRZ2rIePmXsc21gVcLgLxzvsmFujlPklxBp
	xCdUhJrIpKzzCNB1uX
X-Received: by 2002:a05:620a:8006:b0:93e:d5c1:da49 with SMTP id af79cd13be357-945f3638186mr601942685a.82.1794011247485;
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
X-Received: by 2002:a05:620a:8006:b0:93e:d5c1:da49 with SMTP id af79cd13be357-945f3638186mr601940585a.82.1794011247091;
        Fri, 06 Nov 2026 16:27:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:27:12 -0500
Subject: [PATCH 1/2] pinctrl: ingenic: convert to
 subsys_platform_driver_probe()
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
Message-Id: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=qS7kwaZ5wh6601gIdwcEGb6zbpvJGdxwP4MG7PQygYA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWTp3nPdUTrPJvBSdKhO/ZnvHFMFpqiUzJGS9Tv4Z
 dmbtWlfO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhI7UtGhkm+j/8kuD6sSome
 09n+9tHBlVbb5tQlz9FQ3iKUMe/so4UM/yumeln0B6hXrmC0vWC46/dB0fglDgpu5z+GtnCeW6c
 awwoA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d8ee489897ae..bdadb343c7cc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4698,9 +4698,5 @@ static struct platform_driver ingenic_pinctrl_driver = {
 	},
 };
 
-static int __init ingenic_pinctrl_drv_register(void)
-{
-	return platform_driver_probe(&ingenic_pinctrl_driver,
-				     ingenic_pinctrl_probe);
-}
-subsys_initcall(ingenic_pinctrl_drv_register);
+subsys_platform_driver_probe(ingenic_pinctrl_driver,
+			     ingenic_pinctrl_probe);

-- 
2.56.0

