Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380184;
	b=im1jEHLGjDLLXMddKsYaeH4EFQT8yp1Byu1yB0WbXnz0NBOCeYkLU64hGpH8m4er0aE9
	 TrqJClO7dsGJVLm5tuXocw1rPyNfocxGiRuSD7frwFiKmdKkROu/2r8h3fsw3q+ezniYz
	 nCigsyT2J8D4d2DhY7ksyPfGi3QRq5qtdBUz8OegzGcB14YOInrcZ14XOdf3mI+/V1pua
	 VwSqRong2Mpachv1IFoMltWr/4uq/AYrEcsFmt2EfLOqVg4qr2E+8+k8DhCwfefHPkqSZ
	 6TUHpQLheTQ4Mo2FqHJWXX7HOtpbd97tW2czeT2NDrlRhJqw+YqU1gOvmCJKpzxSXKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3WwYpXODrollnKl9doC+Ig4NeUhbbvobPTJNo/DEkIA=;
	b=cjbZMfZ2kfFQ5VO2X3Gh5BdRtIq9Rhii+VSxJwSJdGshok1QI8SXFlfNi2YMwfv6u2hy
	 vwhzr97vwvKI9O4vFYvUP1QM0aTY4lQOmcTLL3iKHyTnNV0YBPDwuNAALGtu8yx2Dp7OH
	 2tg5Kn09JfYmhLOhm8mFmEvWvNUnYX4hlrm14vS+k8adlHrzSi5Iq9DY09xv29e23+StF
	 J8gBxGUPVk47shbEbd4O/SNjE3mD3/95OaJoBoTQuDvFu+khVIbLX+Nmoh90mz77Qqj/8
	 d4QKHk0ME+9kqzOG5MCcijLYvFsD2WV7lYCfw6mZMHPaKpgV+/z400r+p+VvK7zuRrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXCoiDdt;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BAE4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXCoiDdt
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso1693979c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380183; x=1794984983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WwYpXODrollnKl9doC+Ig4NeUhbbvobPTJNo/DEkIA=;
        b=tXCoiDdtwAe6e5LUqM+TZ75gFQdHTToiQ+MlZ0X2R+n8axPdUzIfrYICPYBEEI6OwY
         CZbY7ZHZ/KgvSJA5pGAueBmb2KzqNqDz1pp3hENzwfIfifPAoXrTciODGpLS7xmM+AHJ
         7VneEbNUUO1V0bglyx8EQgypDS79Bn+T/5h1MdqOUmst/q1mnAJEd7FkuJgJpU5oEbga
         oY+fGaVQg9cRGjfjJXyIjYC4EphH55Hx/JYpas2S/KXUsR0CsM23QL6D9I9T8OiDRPYD
         DQNNhVg1Kem98rXutd/TcsMs7TDhabTrhtwVL9MW/GOP3XYPAE098HPv6HqZbD6GAbA7
         z+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380183; x=1794984983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WwYpXODrollnKl9doC+Ig4NeUhbbvobPTJNo/DEkIA=;
        b=zYqtY04otYnxO0xckBTaigQ3hbimsSny7r5NuAbIeo6Nr1TUT1f63EgpiZHF2RBgW4
         tLOkfcACYR/w7eXt9fgUiet9FKBJIFQUoG8+VtcMbJ1GHaZRMzqjXFZoHNufUtZW4ky+
         EwvIX435FPcPAsVnH/31wkXkmvxMk2oMOX6SLVfeJ8qkrGy9rP9OO+uvoeoqG4ULBlOq
         u9N2AZ+EDhAUCQSbIQJnVWGM0R+iu0tyqIlUNjrDpirB31G5deg3GIIZexifbwnEHlJU
         YvtuzvS3GYl/Qrcv+OeETnFPg8VpnZt0Q8fKMbb+GhPnHKxo5vzTco/yMbTyLdJlCxls
         ORNw==
X-Forwarded-Encrypted: i=1; AL+hErGHAF7CiwDz6p6re5xHsTPhWNFWkOXZvg0r4pnF7R6Woh/FxA8WtZirFBax9eRHlbiCmH/Swi/mxylRbJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X+PLKQjpPvRcVzHqbTBWsj3I5//k0YqQibuDP+BS0CR0g1Ikw
	66tViYQfEdLLtW9nTnB0SsYh5CBzHdxiBQYL5sld0XtkqBzd7LvKJwPV
X-Gm-Gg: AYBFou2ssbp36JOO414jcuSOySp+b7Na/sbzHVj7oSthWuks9uwzUkQuCvLymNUpJ53
	AEf2/zI0a3v4yJdLzTQIL+L8CTGHClGGlpp0mf8QbxmEWZVYpuvM4s7EunSk05cXnRNrBqS8eyn
	tmmb+gnOkZqm1fx3Vd76T4yYFHbj3PbzqtzxFKHFUbxhTOjVW2aNG1ldt3AG5cOwPS0mqu0QEnI
	tCvQmfiW8DlAmkIiamgd0GzEXdXxNSeJHsNXm62is8wegfRALZxCQtGyBa0j1pzNaJ7bUZfgGSJ
	53+Hoi/V6m+B3EKK0GOBZFjQv5gxhXFTfrDW3BMc2ybuHfsFuF/FojWK1sjKIkehzQMDvNcIjRj
	VBhA9StvQo0T75GUv6qbg9Jn4vzT2k4ES5hyd1RfAL43EH/z7BWgrai4NjWY+iFFOC5EU2R/4ln
	0tpZ6iYqTWAIU4Xqo7Nk64PWvCGA7L4n5Cnn/5cveY3HJulS+9WtNx+DXGt7cesT+ibUFPtPC4i
	WInHusPFMp7Ot+u7KUw8fuq01E5zAABci8vR1auIblj0+USdvLQRb+Qi3f/ARY4U38W5nFPvFTz
	prmySh5Qe9JPpGpEsfFu0t3bcrHB5eqbXd7LoGiY0aXI3HSW3MLVV7H0iCseUAM39WJb5xo0ckZ
	I4dteT/nLnBfWZKiFKA==
X-Received: by 2002:a05:7023:e41:10b0:19f:cc98:f603 with SMTP id a92af1059eb24-1b3bee81671mr2167785c88.1.1794380183087;
        Tue, 10 Nov 2026 22:56:23 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:22 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:00 -0800
Subject: [PATCH v2 02/33] HID: logitech-hidpp: use GFP_ATOMIC in
 hidpp_ff_queue_work()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-2-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Force-feedback playback, gain, and autocenter updates are invoked by the
input force-feedback core while holding the input device event spinlock
with interrupts disabled. Allocating work items with GFP_KERNEL in
hidpp_ff_queue_work() can therefore sleep in atomic context.

Allocate work items with GFP_ATOMIC instead so force-feedback commands
can be queued safely while event locks are held.

Fixes: ff21a635dd1a ("HID: logitech-hidpp: Force feedback support for the Logitech G920")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 85d8d168ff15..d9342a3e8122 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2542,9 +2542,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 
 static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id, u8 command, u8 *params, u8 size)
 {
-	struct hidpp_ff_work_data *wd = kzalloc_obj(*wd);
+	struct hidpp_ff_work_data *wd;
 	int s;
 
+	wd = kzalloc_obj(*wd, GFP_ATOMIC);
 	if (!wd)
 		return -ENOMEM;
 

-- 
2.56.0.542.g3ef89b7020-goog

