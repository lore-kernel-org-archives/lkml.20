Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280399;
	b=v2VbmjQCsgxd02CdGms2n5QqyeRwzzZjn0WBl8ThNutZDZL1vlIjEz0w2OfSRXKrVN7W
	 MJIYBY8/SU9ELy0tWxn9S7A1njB8lk3tTkkMbDm5WacQy3GN6eMI6teVcdmp3i6A3clAa
	 /muVJBvia8YN31N8Pxk+VLBTyBpJy3dtV6Tz1N5Uz1B3tXeg8D7armsKAgMntgKUHRxZC
	 FPAzlaMT53e56lHFnEU8aG1h1CEhAp6cRSrchKIHsgJBDjr+JnbmousdtEd+JgmnFzBk+
	 P0wXzTt9NnMmOQ7TEKtfMXzV7+D2b1ZW5/fPD0OUAyp1VhqYNGZ2v6Jxi7xs32mkklA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=rnDKtA4LPmfzDRVobVXvZxO8771IoezzUm5p0109adUHoZSCSbqV76cxLN8em4BVogbb
	 AZT+PO/LdInzb352nZcpNxsEIWCJQZL/jpqiRzQfWvEirYBgcnzf9SUUCnPsCLEVwRlEC
	 q1wnqtyGHbT9cNhl7jL3k4r0h4tAYBk9tsdGVQpnPAExN/jxPrdLZFCpsoxNkIR35g5cz
	 qBkQf/xYhAfcJAHolKMT8aDT89sDaSahtBK/RSQxJSZt5jdtu2Eus3gCpfNAbtn1yGXEa
	 eSa4xxdt6GiBuYFidl8ZjY/yQNmJGJ6gMaoN5KLgqYPwRIWLGagf6lMC5bmNIMgIFWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axK08LBF;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E657060A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E657060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axK08LBF
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53a448f86e0so822842b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280398; x=1794885198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=axK08LBFRuDFSSWcJwC1jUIQaZGsGrA6ISY+1LrR2QblHAU7lPcHZkLb6BfpEGJX5d
         ahV7MoOLNdF+fqNCzn19P6FXisZhnHLKcpJ9FOGOR32nAzXP87CcVvQZfwPSvH1wosKz
         sqoerx7PTEPK/Jn6mQ4EMF+0g8WXidCeo0Jxjz4oikLE79ntsaMB1k0YDC50F7pYX/k3
         tDolPwq9sg04NF6uux87t0z8Gv6u9r2cR2eA2/grZ70wNUKWVpZFp4AhvdrkPYn1HGCs
         Z8f/BwB9y0iIGVlPLUl9mcW4M4Q7oamEbEHw4LXPGE4Ibfb/40fN5LQp7YsNH3/Iqq6+
         6p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280398; x=1794885198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=LqLv8Hx3ck0bSQ1aEe5maXGLF187V1bCrUg77bbo+L+29M93m66hcPTNnpwBN6xr34
         nGNCHeBOtoNh+mzpAIxvF6SYWAYsz5pjPAMPBAzRQ3CZaaNKUeYD2Go9TTqpz/9FEgDn
         +PBXBj4UZmDf7TiaduA1YNqVUQQPBV8EuZdsDNOugI0ysmzXhUSJne4CHMvxJGUjGD8r
         2fth0Cprq17W3GmnqajHMlpXGgma7dfua/nYNIQCaZ4JwSfaW6SyE8OHPCQjdQsMVupX
         ZzxnlZChBzbTKHND3MCjg6xmjYbQP4BGcT6G2d76oCxQCG+UVMlEybGY1/KftZ98858W
         W4pw==
X-Gm-Message-State: APuU4Z/pyJIPkhNpsqsCjdr8YCyLpX2TGg/QAqW4vP8fuw7NUxctPGi7
	GLdDYPfWxoBozbt+wKdNQINWh3IGF+TGKz4KpRsYpvgMiQPELVTrk5iF
X-Gm-Gg: AYBFou2V+nl/OZnbawd7noLaM9jXiEO9UywkleM3rH2sZdo0/yl9y0Ieu/BoVnVZPYj
	KB9kBh8//HIEmTDwKRlq4I2xESPN+GE11n+rkSVZe9GdRyrhZ40nXMBWYVBnTkPSHkvcTZPcSB/
	f4BT2z2JlsyyhaANBIA7gnfpXdEg9Yspe84VUDpk+nEw9SdsWBN1dPZd/PIe0RG8WfGIlZotiw2
	uwIx9NDn5OuAqcWZdLHtPRnM8VCy94lmI2a2IieKNrPWO6xsFcgL9YrQAuCl42vN6dCifAlC1nv
	c0e2uT8AX7fIrkceJjHAhaXrgcObzrW109f2ANAkac1kzscmiSzbUuxQE9umrY/uTe1WgubLatl
	0Gs8MkHfl5ZV5eq8CAzC4CqlvjjZjfT5/K19J54W7qE2/DqaW1Y/BnhxfTh2IRNSq1ZXHnfPORL
	UaVRX1cG3orL7sIPc1iwclsiYCvpubLGcDh+tcageP2uZwPueMCS7JECvgZdVyt/PSk11gvVbXC
	kVYwcq8k6FjW5N6jzHDucqLnDk4gEe54pOEXu16AVA+a8+SPLZGlz6EiUBeoxwkw3RK6aT/AidH
	VD8JGIDBf2c/R0h5ELzKOpt/ZxzhiX5z/dMF8gjuwvYlm6LlTU9/44XqYYRiu1+9lAT4a0PVnOV
	VGnEFj+ao+RMOAi5Hf+cJSjPjwepYT/6C80Qmf2lv7Jz70sHHagchO3QkmpeAhN2WGBG9ZlSgTO
	C75cEeORCFzww55cjBbNs18EN4wTRZdQ9AAp/qGmP7N0wEMZW4ffrdaum5fktNGu1EdrIsnNYA9
	w==
X-Received: by 2002:a05:6808:3c48:b0:568:2e:531e with SMTP id 5614622812f47-5683cdcd52amr1079208b6e.59.1794280397927;
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:54 -0700
Subject: [PATCH v9 05/11] serial: 8250: expose RX trigger controls for
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-5-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

