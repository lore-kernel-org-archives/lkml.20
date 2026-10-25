Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896529;
	b=SPmwafX8VNYbilC00Wn1V+UO4phxVru9vbvP3bVXipIAdTOSg77WiEu6ohZi6cQ2Db76
	 I5N9eP+Xhdsn6mN2PINIdxozqhKN0eFauOKXwmPoV5a+yJ6NgIE1YXUckEa7ivQ/da4ui
	 8oG+Mb6oTsCouEJMqw28sWO0unAHSGWXHbuPZYKieg9jrcO6SnzMlWTbI0SYhP/swpEEI
	 n2GjscVC0ZnQ8B9IYcw0I2p1O7xJxzuK91HygyHEY6JIbCgzdfpUEHzNPQQK4s/5PSq2d
	 aGC6Qit+6lHHmP7hEV2Po8akYGLFhFafglTk+cmSxo2L8jiMmefenKEF1qQYHl4wNDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FRxwvjYywW2EDj8EBeP8mrgqVWNhsI+cL4nt5lpU7sA=;
	b=q1+CSidik8JDtmP8fFflaRqzyg3V+3IZm9fAskPhBYj0T6spN8Yg+J7idlA/PHWF2+jy
	 RYtwU3TfC4nbK3i/J9Po1wLBcKZGHtJ6wdVpC8RY4PQ9XVGHsvONbrx+fMaoKZ1LTzEZx
	 F/TeyO9gktdmD+aEGLAg3MV5aIzCYCqZAXFIJCkoBAeuVUGUiOWUvIqQOWmlZmQgVSDzs
	 zdmKqa1nefIuzgY4MK8YgWEjr4uNzVP1pirRsrHqGx4bR8+bFrREagIvMa6qGGf5J+X4f
	 0WxS1RDN/hEVFgHAiEpwL7hnawID49e+WGRSrI47wkLs2TUiM7ShgnrO4U7ToZpjNiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TpxwA813;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B3B606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B3B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TpxwA813
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-156cbe59524so1130235c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896528; x=1793501328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRxwvjYywW2EDj8EBeP8mrgqVWNhsI+cL4nt5lpU7sA=;
        b=TpxwA813+P5znsifZUJ8deji2Cfy3YNYm07xUH+eLP83aZg54OT8spSktYMe6uqGRE
         iQECHez5gjvBbx6xLGeVbfT8DSZ1k8Qt62vdK8EaDhI3b1+wztqIkJbaJlCtnuCA5esL
         QRH/IaQA0IS4/4rwKKtRZShp/VJZY5B2CGAQ4+oQP9868SHQzHcsRMqbIUIJIrKAZ80n
         lruFtXxmDd9FsV8X+PllJ668rF3ZZJTTNnl5/6dcw99NfAg8N0Yo5T4C0J1RuHQYX1ve
         +cFbn2eSkjaZFV55MBT+LCMMz8FPEg4aiNN52QkcwWnlvHZrZ4/6zCg7MfQQ7POzh5gG
         lE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896528; x=1793501328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRxwvjYywW2EDj8EBeP8mrgqVWNhsI+cL4nt5lpU7sA=;
        b=K+z4ccl8QrqX2GBVXVR6MyR1GAxxv5yIJhehtXgijJu0J5ox3sY2AeaOf1dkE2xlAt
         kBAcsTvfIMlwr2kARi0E3PBzdQ/gal7KAJ7gAN3muoUZ6/obgZWLcfuScnYZ9tK1SpxE
         KBUwaBcIRu+AmoQjIkC+kjq7S2ZSqKhoWjsZmNvM6ivEPkX5uu3R5lglxj3QvY9biiOF
         MSSCEFuXtUCQ2vXG1nsslGD5D/zSLaANFqbIhrOUDZRGzMUHMuqwUXE5gQ1HHsSG3k/G
         YgBAdQA7EKQRZFP63w5e4E/cABLZE/r8E6f/WTUybTuT2h822f/c3ZEFQ2CnzDQ6G0Vn
         IUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/rChaRTYiHG4IvSFrkc4RdKCzPAkXq42tZZ5PpnN5gNX5ZtsCC4M4riyJx6a4E3S3o9n9pTQCawHjaxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy8sKMBbMie8n2+tg94XjV2BSpMQw0b2A0DoC0+uZL31A+5kIJ
	kkJijtwggd2qWd0StZxo7zF9pTh5NIffOYzcDwDT/Io/Fv5Xk/o7GACu
X-Gm-Gg: AYBFou3kfSW/jBZf6YsZdY9HbUw8Bc1Jv9X4guwx1ma5OZrblzi2MEQdfyAQF8JoYlj
	sd9FPs1B0gkmbR3VeWkYIGCOImOQV3VDtWJKF4qecINWm3D+PdtH214o5TAvrC/h2Ho4RzGC2OU
	wfDAHQy99kWa4Jl0fDQ5gAKgg8wKD1yLeZfj44WwdkTx+BcJXOAvnFc12UXKoMiafRpKSTqJdgu
	oC8tnF+nI1fm1bYZMgSYt3/xq4FPvpJRUQuiW+ZLy5mf4OHzjgcluhXCJ957GJcTLeAMfI/pUFL
	595gV7xM3nI840HC72ReLOy8w8SykGBdrVf9D5t5aAX5G4wG/b/dvh77+znn+UGraQgdfMfeZnT
	4KzrT2eOb37mgPVOU2F7NLyFVgD5ulCTchPf25zjy0Yrwt6BqSxHCBRTLISTAX6a1v1TOlNDK8j
	YuDP1Jk3sX4i7bbMh1xg5WXdDOq/qrzx3afAsRPzEZshcxSiaY83+r5AsaI44Is5UqS11TnAy6v
	in1kj7Q2CkdaCPUwlFIhkU2GOfiBHqGzBMEfyqVcA62JFJQ5RFnOuRN3eIZ3sMrap+dG0rQSBZv
	QYqkTASZZRY6fbeGiud9L5hmPDOUYI4Dg7dSZA2Em6I=
X-Received: by 2002:a05:7022:1087:b0:17d:7b45:f905 with SMTP id a92af1059eb24-19937025befmr4633321c88.31.1792896528487;
        Sat, 24 Oct 2026 19:48:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:41 -0700
Subject: [PATCH 1/8] i2c: acpi: use 4-argument i2c_smbus_read_block_data()
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-1-19bb97467982@gmail.com>
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

Pass I2C_SMBUS_BLOCK_MAX to i2c_smbus_read_block_data() in
i2c_acpi_space_handler().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 84841ed13487..4acce685457f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -751,7 +751,7 @@ i2c_acpi_space_handler(u32 function, acpi_physical_address command,
 	case ACPI_GSB_ACCESS_ATTRIB_BLOCK:
 		if (action == ACPI_READ) {
 			status = i2c_smbus_read_block_data(client, command,
-					gsb->data);
+					I2C_SMBUS_BLOCK_MAX, gsb->data);
 			if (status >= 0) {
 				gsb->len = status;
 				status = 0;

-- 
2.56.0.257.gf7497c7d27-goog

