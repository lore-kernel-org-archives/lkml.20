Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380232;
	b=qE4hxupdyfDM019wNKW2oL3XakKT4TXlSsYv6NYBISTIzklf75PscAPJr4vG/7hsO6WC
	 LFKtcDk2OKzc6IVuCO7Sh9J01eogk6FgY/O/AHLF8KucILJDucr7xVUseHut3Ed5aLHtP
	 YADCuBjkgLDrC1NewdUorSVVvXkyhBrfN76q4ghvmIW5if7QGOPP0SKBv+/x9q4osWZM2
	 DkTaA7oRD23Cng7XNaCTJH0rgqCSVjvT9Lu4CtidhadPHN4YAyB2fFpimgLTZxy8R9IiI
	 673KmU3MQWgMD8ZVo2J7zjZQLC2EsRbZsjQZ0q/r/Y2k8xOkEjWi53DHf77jnE2JMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7cAG0LFOyDFplTYOgTeu/80XNthLT7QaiGEz/0QjoBw=;
	b=UbS9KcsVCmbglXh5d5NKowzWgxKfqVFc7PILVdnCtirIZxrooyC/c8yyNPx6dYtAiKHH
	 wuj1oA8Dy4wcCMjp7EWf/65jWLUsxV5s6k9g43BiYEJBAnKt40Wh8/flU+nizysA0wQ4p
	 cPbkrac2UYP5HH00dvKSXOJ2c7gI+K/a3V0xAmw+dxFOkzo4BGt+WEL8aCONZEE98BOce
	 7GKAAL5fBOm7MM9hQ/vE7VbMDrL/pyk5cgbYFf/cUwg//n05AG3tvntzL6+fR2JiDlPc1
	 5yrRzGB1IaDe2jvI1PFtRqTFqS5SE+PrQQi/dfF30GJGdbQ8ohxk0p/Y/8/s11wqVHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpY9bAxH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD56606E231
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD56606E231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpY9bAxH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5873229eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380232; x=1794985032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cAG0LFOyDFplTYOgTeu/80XNthLT7QaiGEz/0QjoBw=;
        b=FpY9bAxH73oZ5SmkvIIbJrU0L1zcgFIpDl3vljpy+mMT6JHmwjGXFxqBB9HZA5tdNc
         Hy5kpaFvoIF8XwC6BfAqZGD7UdjPsCYVj1rQ9AaHT6dUTwM2CJaYpq+VOpnAFKNhkW9A
         g39AEBpFHLYli6Mw6TZJ3RZFGcplKvl4O87MERlT38svz0ij25r4EF3rYTOuFeSFW5Y/
         a5A0Jj6PDGrO+hDUsnumPyaKJJ8C/clgSC0YqAUzFHx0z/SO8/0MrsN947QQ4bU7+NC5
         kaqn0l2VnSFliRPnLqDGQpZwlZmSpPeikpQFycfxr4hk7o/O1+Dw3Qf9CX2Saj8VqUnj
         IWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380232; x=1794985032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cAG0LFOyDFplTYOgTeu/80XNthLT7QaiGEz/0QjoBw=;
        b=saE6qHIr36rtAy2gu6mq+oiF/yD4zCd+45TPPNaF1KyZI64jpmypxSrbp6qKyeiSDE
         U2M7h7JFmRH8zXb7TbiepjACyXpb04W6MRO/1KfMtGdsMBZK3kLDUCsXWzXPK6ZDWEQb
         0WeIr5ZUo74K8FM8RQ6OsmiUmsJYY7ZK+95aNcpNkffIZ7bUhHi48/DtuvD7ykh8YaK7
         rXJu92H3f3sSyif5FlTPfg+NCNfSa+GVpcJghqb2DIYKIEO0D2ZxWdCs0hWCNRo3fVM2
         1g+wEkAyIS2tIMjALzVDmOYhCWLPdRGuxQ3ImqGWk9uYqfOkE4SsvmMIhvns8x7emxwa
         tVLg==
X-Forwarded-Encrypted: i=1; AL+hErEWQEnfRoALXK0fhS2sazRKS+u4ebNj9IyxBrpNcqiTiSehOMxISlKaBh51TwFwZ6kavfTxa8+LzIADg1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ceXYCAal0ga9WAxguR2f9XJot6jh/GaL7xQHVBUu6BYltROAi
	oPmz8gXePB9Gfxm0TybYTnSg3vXphH1iRgTknnYA5TYuXAyVhQPj/0wH
X-Gm-Gg: AYBFou0bc1YAsqrfB01FAGTDWOqhXf1A1UdIshrpBO7E7NEohZYbLmUaHc5eaQv6M3m
	/A7eWvMLiBHjMD+54N26MKzRtAWyLQ7Md+57GbpC9dHy30asugcJ/QSuV3AbLlUaMg3n2COWOTr
	0o8J379GU4TGcow0opP9MMmST15T1xadfZaUV8rD2QgVrnxAlZFm8cSkICkh5fW7bCxjUHh+IPb
	EK9XTVsHZc7g33WixFYtV+ilVyifQpBitp/dO+Ky7yU+sw4F+Ftk4xV/2ancyNy+0nJtGBfSobu
	5It7LQymyotqvxuJdRfU+MY95x0+XyWVtT9VRUlNmyUZaEAeOA0+y3tYWMp3nN7qIQ/dppxDasA
	jQ/p6CPnfTDWH2WDxPkDk7bv5fB7jv5STmH30qS2PZVLjO0k9eMB+G/eI5HLjQTe3pZ7RkDmfsU
	dWCB589I8B9VWge5F7J9mpz8gG0NtY619qYRtX+2DMZCCILZOpKVDgmcrPo+G55ovvJwjPK1u1K
	FkRelcpLc5LWVj9sHDETJps9i6o/Sstv2DWOoCQv7pAQFmOB3GqlFudMXb9gCS9lwJwnWtGdU6J
	aPyGVwTjL9QUruvcrJAJdEdVZzkkJWR9PM+Sm0xVhQfeZR9QlG1Ufv4fXfVPCu5TM/FCVK3Yd3M
	P2bn2ziGjqAUWLyM8kw==
X-Received: by 2002:a05:701b:2415:b0:193:3274:aac with SMTP id a92af1059eb24-1b3c0362a89mr1547534c88.37.1794380231494;
        Tue, 10 Nov 2026 22:57:11 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:10 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:28 -0800
Subject: [PATCH v2 30/33] HID: logitech-hidpp: use
 alloc_ordered_workqueue() for FF queue
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
Message-Id: <20261110-hid-logitech-hidpp-v2-30-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

create_singlethread_workqueue() is a deprecated wrapper around
alloc_ordered_workqueue() that unconditionally enables WQ_MEM_RECLAIM,
allocating a rescuer thread. Force-feedback packet submission does not
run on a memory-reclaim path, so allocate the send queue with
alloc_ordered_workqueue() and zero flags to preserve strict in-order
execution without unnecessary rescuer overhead.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 67b4f1112168..b6c7a951cc94 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2791,7 +2791,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	/* init the hardware command queue */
 	atomic_set(&data->workqueue_size, 0);
 
-	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
+	data->wq = alloc_ordered_workqueue("hidpp-ff-sendqueue", 0);
 	if (!data->wq)
 		return -ENOMEM;
 

-- 
2.56.0.542.g3ef89b7020-goog

