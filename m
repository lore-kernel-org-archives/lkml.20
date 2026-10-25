Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896531;
	b=dJIk4GSi4rxl9rX2ENTTj6h2/K7AI5HIT8bYuIZy2BAsbiIE666R/l2n8hSmoGHWs75/
	 HVcywZLWQg8NuV0nuw+msQ6Yh1Lh2HYD/s2levQWrILKeJJdG/zJO6ra4AfRw989/aRhZ
	 xzS9f2Edm8Q69nnqaGX/dR4H1WoAnUAo3aGCdsYLw5rs1mfVDrfGzfqPqG9Mp4RfhDaFk
	 JQQFc2dtkncOO0ez+ZRZE8BUJcKhIg9ClDPQZ2ZhJqSnRV6c+xbQMxNrrI0LcpBUA/cx5
	 A/atJ++Ul9ckBZciQLdZV9Xh68OlfCeED0U+uwTzeyL+IKAoVpzFXRyFa4K1jtd74WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qch+gfvUWnIg/aFjnOTDzOw/h0vbAHOBkhrf0UIuzZ8=;
	b=j7TFRtp15bYXtpTQtSlUqo9FYwRF9MltW7OpxWLAg8MJdoVkItixr1J0OAppxTV1eIDR
	 plv4elyt1s41l1FSll3zuFwHtGiwalNHBGyfzEQcrgOENtUlZnJBEdHmE36IkKfc1f7UH
	 YE/OJgr7XNwsaVQPb2/3Gdr99031K1qKWLEj5ZuWLQ0hwLU8ntvS1Z5maFzSb/dpo6eVk
	 xBBcb3GdEPqCSee+TJSHez6G/UT51JovK+XQYDazzF8pWvUH/Mh5aGQlinvTvPHc7ew5m
	 Vfmshq7z3Q0tERAhOPjhSX2zA+vN5N/J4uF4eb6bxWubIbdmWYA081peMRkzErrDhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D13wWGtz;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15810606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15810606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D13wWGtz
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4724154eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896530; x=1793501330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qch+gfvUWnIg/aFjnOTDzOw/h0vbAHOBkhrf0UIuzZ8=;
        b=D13wWGtzDrlBw9Im7u0R1IdFHg4wNG1163II6ub/nPI2fH0oV74hQzstoAqgvSxI+0
         myknq9Ug9x38jjUUZwY/vyXKIDGMNo3ZKXP0bAWsSPufchByNmfUqbjLR9h5DiQc64wx
         b41VuTc+OHb/42Uk60MIIq5H5njnW+qeWoLqYxKwISqmgf8YvNXxGq+BL+Qjc6HvXh7N
         0UFuKY7bms75KP1rs6qbQXAEM6K6vURDSsJu7wqzwbTz0/lIFC+uDNdCBWcUI60PHNnA
         Gm3DGTK35BKOy4/WnhcBiampzvbAyAb4nyB/WhiSNzemLHUAH++XTonf9uwlP/Mvv71a
         ZGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896530; x=1793501330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qch+gfvUWnIg/aFjnOTDzOw/h0vbAHOBkhrf0UIuzZ8=;
        b=rv18VNqBrLDaTGN7BLXWdXaI5epdEWT7RwyOv7aY5rFM/RXIJpZtiCjAk+/6Bgtiun
         X2jIJ3E44FV1uCWW3eebGT2LfR/lhiLA6kzdXTc2oRqNlew5TneZ11zlLSyOCBv23xxP
         54vX6yi2BqhXbOsL0veMnO0mUh1KqGdUvoOpsaJC9hJA3EhsMYx3cFIpRzW4fNC+a6bG
         /8nNEBOnGl5KQMaA9fX6euo2yhbZGK6hOWpRLp2qhfAfmkgUEI6uh/YrIg1lmFZ10J+t
         l/iP3rkFLltAJO9n5aXbJXUHYj09HwIBpDfDt0QTf8iBgI578zRur/Lod86ZTVjGwK88
         z7Xw==
X-Forwarded-Encrypted: i=1; AKwUvByDLfj/CBqck+fnbj+E6QH6vjeLUPeJogi+iO7/k3VmsRSA8dkXUtyP9tHT9OodHaEGHmx2TggtECFHAY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc5vYBb1pEfC5BLp3tMfu6Fwx+0z1JTtbJseqV9UKLMLBkeG0F
	IOs6XQG04ZOQcf1sgg4GlwIGoGhUXR+Yw2Edftd5glWzeTfwbUWA5o9f
X-Gm-Gg: AYBFou26NjdFac3G0wcZ2n8yb+Hc78l+7Mkyc5iRVmZ5FZ6GI+KxxCfGi3bn8nx4TZx
	H2t2BxYXRD1JBXqQR58MGCbXCSkt3u1oqaFbexPgwCKfOTYcrF6bAMd7HeXyzb1Er2JkCTrcw8G
	1Z3qQdKAAUL1M/6EwWAgILwTQaV3HdRjJxvmilZyPhFpTihQhUy7adQ1dqgyRyxU3aWw/yoKn0k
	ZIJmRdR/J8IAfSWScW4lJQjMLThkEnHWnIU3xXTN+045ByvRDHfcFxLnST3QfRCOwdpxloQBgC5
	8128TKfvzHdg6dVS1oOdoyGSw/lL6FmqctglQnm29qxUCbUHIwT0DHC2s3ioUiBx7q+NXljRWEh
	A6b97Mc/75nfVUjYZlHdH0oDTz6jPrWzX6LliLJC9CwBcreyOYeAMR/c2Yct6+SewXhSm/+AnCj
	agQy+bAjGQ+u4u2CRCTxo/5VFunGY15l/XCvT0WqnwAgs3xnSejbFNKjXyQG7N09CUxMAAMUkGO
	AHsZgvCTs2aPDGRDwyuDViZLAHPwuaJSQ6Dy4xKpwA3A2Dk4piKjFBRqbimrao+vELdcSRonPk2
	T57JkRV4hzpM8yA0dyTQDdwS3rr6KF41O5mxcoiVp0E=
X-Received: by 2002:a05:7022:7f0f:b0:187:c940:21b7 with SMTP id a92af1059eb24-19934e71e37mr4620736c88.9.1792896530109;
        Sat, 24 Oct 2026 19:48:50 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:49 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:42 -0700
Subject: [PATCH 2/8] i2c: docs: update i2c_smbus_read_block_data()
 prototype in writing-clients
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-2-19bb97467982@gmail.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
In-Reply-To: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Update the prototype of i2c_smbus_read_block_data() in the SMBus
protocol function table to include the length parameter.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/i2c/writing-clients.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 8bab8b16ca8a..896bf79ea564 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -366,7 +366,7 @@ in terms of it. Never use this function directly!
 	s32 i2c_smbus_write_word_data(struct i2c_client *client,
 				      u8 command, u16 value);
 	s32 i2c_smbus_read_block_data(struct i2c_client *client,
-				      u8 command, u8 *values);
+				      u8 command, u8 length, u8 *values);
 	s32 i2c_smbus_write_block_data(struct i2c_client *client,
 				       u8 command, u8 length, const u8 *values);
 	s32 i2c_smbus_read_i2c_block_data(struct i2c_client *client,

-- 
2.56.0.257.gf7497c7d27-goog

