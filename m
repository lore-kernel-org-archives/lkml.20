Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742015;
	b=fcKXaX3GlL6Hy23CJCKyw6iX/0GZDnXNYFUoOYkijIMG9QbBQwwIpaoB0OWrpQIeAhBP
	 uG3+rouoYcIfYW/G3TzuN6C6UYreUwKkBxB/r74OlM+N69dSxOyrXy0HlwzUw3UVJgmi4
	 j8OBqAvBhyI/C0egfebxufrw7kb7aMQYarl9hiMhFprfzfmNaxNkLOgdQC6NLm4M8aloX
	 +OfEufa7j/GaiVeju4cyG+7RdBZtr6Bl4e8n5SzjVSuBRp9ccXfoJPlcPNN2Sf2Tqcn2Q
	 Phe2WI5KhBq0c3LdhJT/Fhc22R9ZXPK6vK3HpTcy3ceB3ej2ubeoxMSZccIUOu8A4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=H4dCorQ0ltpix2Z1YFcxiXymoyQEAa8ND+wgKNnoXS+JZ0MJSIz0xfc6POeyKX/26Txj
	 4aUFN1kkeFDV0BWtd/C7LM6jgAlPBc0GIx4v6p6XAV/6V3IjwuDOULoaUKAbwzw8BYzlu
	 ngsyw4dnaCdNKKYwmXrG3rNxEnRAkNpgtcmM9bdlF3nFAiE/C+qTmXtZiq+BoJmZklHkA
	 F6qavHBMYYKSJBXGK9CFEsk/8TWCPBJC76MBfprCtVEDGRHn3L+NCYNwSGraZG3stmhJ2
	 Iuis6HKroLJU0/MBC9kFXPLh+T6hY05VFlvopWSdv9j9lv7KUXV4GgLCNwxZjf+Imhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEBiMSuH;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9DB606D810
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9DB606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEBiMSuH
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4af173320f9so46665b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742009; x=1794346809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=EEBiMSuHQEQBAiNxmoAZwWAQOzZsZRscDbuJCfiW2amM879KWEAz0qvek7925XV0sI
         bifHFqPkH+Gzs+F2ySuS+DbPYgTBlLMMMUE+1J9KZJio6tJAfRMKMyR44JyO+qrRXrGj
         ft0eVdNEH7HmL9RvhGF7+gX2JT5Kg3v53pVUGwd+MCoaBZ0heCSX/ocbUWxlIMaKpq04
         T7H1R3fqGk/2D3KiJeZb2VJyjJTAC4qEEihuEhryuLwDDNYw7xWfNuinxkFOseJCB1Xj
         0vcc01hYOHp4RapZuK4AgHLxH1oq4UpCm+SQkerNQ2Q9YLtBMrBxhZDoVASIXzYIr8/Q
         raqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742009; x=1794346809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=fTyo74j4A3+kbHFOEVnqi2f39Cv0If+a4qnqYpsiCAw9njkcu+XPR4m+iIA93xrVE1
         VvD7gmapqc8UZoT/9Eddyoqj7QxQiCT231qG+qE7UhRiV5L1rLDOUxA+MQQ59MY7gRkp
         xfFgFdhgbunqhYjVhAEHm7kX2PjT5Vc99QHzCtUNHArhX3m3fPxY9mdCimr5ci5RF3WA
         jWVuRMMeoUjfxQUIb+u9eEII6r+2SEqA81BnoW1antxYRc490bXHBzaWyla8t05AXNh1
         028lvnFJka9Fly4iKT4o9YLDrwh/x2lMtHGrrgW3lG0wbuWvM+eIAQ6gWmQaChSdBOQE
         74TA==
X-Gm-Message-State: APuU4Z93tq6bYCt9chhngan7nvTek2zoFD7Q5OFeeTVQmrT5Lk40ghOc
	K7bZe5Ccf/IBpZp8XIPVHep/yY4FG9O+z3JOVG8eThHYjqaA7Wd3FoOj
X-Gm-Gg: AYBFou1NchhmFEM4RXcPWv/++343SuB1AnzpDCCDYJFE1RaY47PM4RI40hn3ODUOYKF
	870ja+vhgoZBCkFR4S/dhwC/zaPLACIYF3HctM0+FrDHvRqNCiURq2mcrKzosoS92BmzPzHUwz8
	WYjDs11rs2x3iIW15Pu5YFna7XxY7zi745b1bOLPHzCaG4VX+5otmOESeLAtlRAdLNTYOUGCLmR
	rq7hliiu+JUT3C+wonHVAktwRJDJswtXrr7QSMhsCRamT3xgFUXRTvaILyoxQ75CpmoQSHsTahS
	m7cCpuIgmV2NTI641u9Z6bNH6toZ1WtaeUrx3TIuTdCdHRktPRxdsJZUACWh78hil5cO4WGVD7s
	9STA4h7wu4WJF02AyrntHtgXkXRH8aGP+KXbf12CXuCjS7peAGqEMHcF++FhJeeuKYD6QscST1W
	tX2zmUhjrbXrD0+fCKTb++UGKkG/tvvQlR6Qcy+DnwLyU+wIgtr8+DaQ3P98VDID/MG6EMr5fqC
	PzyWJTnl1LYYnSqcUO7jebddGybqJq3ie2GLyZ+ABxtF3O42LkxiaQaUR5LCfhbByHHWL5aAEg0
	zEp9qBGLX/iYL2uNS6bgg6EAztFtvCrCDzC5ncNooLnx6r8nahciXNX1c+7I8vQRcAuNfX/0KSK
	NglVxIGKdAnIH6cF68507jYSitsr6kY60jx0MUfm3vB7uWIywbdva1CZfOPVHhoqYWADbAR6iR2
	VDKaoOUVdZtDZrENY/kiHIqivCNZDbVm6KPJbLX5483cinkG3EHWp1vw==
X-Received: by 2002:a05:6808:1715:b0:55c:836:5950 with SMTP id 5614622812f47-5640de0af62mr9879107b6e.27.1793742009246;
        Tue, 03 Nov 2026 13:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:57 -0700
Subject: [PATCH v7 04/12] serial: 8250: expose RX trigger controls for
 custom callbacks
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-4-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0

