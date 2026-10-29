Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299656;
	b=QsOwNtomduy3zbAIRogno4HzzAsmTuGrh33DdPw5GmHDKRJCHM/Z0bCVtF67reidJr9a
	 jjRPA3ku7CEL7u2J0Frqn7eu95qPxyNKqX3kpEJMmLaC/Yitu8Ux2HI8DJdRYNYsoM2u5
	 v8QtsHxX8+yvfoZtCL0+PX1KEseGMpCsItgSKCObo3CjzrsjPWqIo+9mwwGnWO6MEQEmo
	 4WawDWyy+Pp8IVsN/1ehK3kWbkL6Og0XjwhC1FI+Kr4Xup2acvk4AmNuRMhJgqMouN5Pb
	 PtXmR2T58oFLIBFLi2tw3fgzW5MdzduWSPcoT2rtRY6QwieTjxdCQGMAMi7x2r8uWiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
	b=YrEuUH2C8GfNrRa/Ger23/1ImfgKskU38+r8pojqD0gBlv3EpivR6UJ6fHvPbLUP7X5k
	 zb6TAZ69VQ2Wj+ez6v6XSSqyckYetzdeJ8H9HoEmjK3VFOfw4cyT4V6TDLqyOgFhsSQLo
	 jyixstqgzGloU6fyTi08uXRt3GSMY8hYS75D/xLoYMT36z8rwQ/ipmJGpxKFmH2vzI/OO
	 ZNPJuZiWbRpqPF+UkGfKAAH8vKS78fN8G19wiEzpdJNyv/SMG0ykPOYXs8IqXm+r6JHNo
	 vIZBN0qQv9XebKZSGpIHRTjtehrMm41CX2/2X14ivojTINwdkmiHPWPBFl+3xgVZ89Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gLDIyi7;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9ED60A2600
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE9ED60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gLDIyi7
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-823e4047037so1761427a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299655; x=1793904455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=0gLDIyi7Bah1ok5NjU3W+QnQrCgcCetVDDOLnLlhSnQN1Rvm/TxnOHDei2dNZF0EL5
         bmZL1Ez/VkXDpzym1vcM+APlpMcFY5IzWsahAxbopCebue9c5GilZhKDzvDv1rw3DTah
         d0umgizm5JiR9pfOauDoHhz0B2tA6DqTWsfK27iyZ181qfBRXbRxKJhJBHqM5q7vczTN
         NuGVn+qDWvFe41dzhNCRUe5RhuyfNEUTg17JxUI7Hy2A6z2mKksNIzXoEBHmvfcQRRGi
         FjMAkfzGzTG9NF0v0VMnydD5H/ttmpDM44k4xi9U/xJRhtLFzzhcMy0jWAwGmdJ/KqCH
         TC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299655; x=1793904455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=p5rw7q63/QHh3QS3Jmec+Ysse+Fy193LKXm9kVsgqqBInHX1c7+nS2mm7Ih+qh4hTB
         77//OXzdnkPomwpj6QgWVU4uwHJLLl9AzICdZ+EbCIa1WZvHcokM552SmyjsoxJW1mH7
         rDwRBGcvEYTzaDiw1YeMF8ztf1YbadMCxk/IWRMyDPQKAxghhGF78nm+AglKNBpm1lwj
         USc9DC99rbEgYm7P9KTldN+gWsrZKvVdeS6+lCzgGWUnTGJ1COx8xjGyMRKrwqSyceKo
         YqbuULWH0yFhaHLTI5YLY+1HdAOKYk0CXH4jb0jN1RUqhxG67monONDOdojnM2cm/QxL
         FHhg==
X-Gm-Message-State: AFq9FYKq2dbz4WrssNTtTWqL60Y+UDus6uR6gVUYRlZMgbSur/Pcib5Z
	i+h1lSxoUb52gaLoYj3VnG64y0RU45xujYPQcQX1uyYODkZIQkdF78lp
X-Gm-Gg: AYBFou04aQGXniIG88h7yWNjXlvNm2cI6JKlIRbQGf1B+clwtBMwOLiN136vGn9V1BE
	mQTYAlYBWJ33yzg0rs/2H5saKcf4/FAoTW7jf8cuzwMoUnDCLuIWXIQQEVzaEqV6K+Awg4pFish
	frksSrVAGDgNgjeDEChSPj34lGb2CyqvULXxkiax4oVS4bqREHZKOLkHifDaKUZUODRMoNfLB24
	gdqq8UzvYPkYXs6EqB5Eqx9LBqIKkcVKWLIUzDWnKzuBNq62WngQ1mv7liwRcLyRPddABb9o9cP
	Ihmwl+M6ontSb8i3cxCqoZwI3NSNYRA6CEDBZviHgpCL9qyo2Vmgr13K3zwHD96YX1z0rrlNDDc
	HcELJMPd6mCksOscq+1oz+qWuL1zRReiyxhezqrgvV+S9MD74V5IH+8i6eObxzy69cdNy3aUQE2
	piEE5TtSZmEPQxg8trpeA1yWZw4hsxOT/llt89l5DbspzPzZCMn301n7IczufYd74Lwa172Mast
	cN2M91KA8plmG0T4ndgRD3RRIF/R+kol+m0KDG8YKYsvQPHKhD36tYWaTTuMUrsGomNLVvvpbPm
	G8r55dv6AmiqmOxz+xesaoXgAAPWjfEYGQtpoLSi2th+iTJ+RRIkyiOJcEcQH6PMmcq/74jXnyt
	2rpiuVBtNQCSkO+s5mYhvp9+r74ZyfiT4PCPXXhmxNwN/zu8d4YKG0NJyVdou8MVoy9HdAXmq/S
	5EsP3fQw5b2/uZIsAfP5UiVXBtg9IewOfBEHLjvd96x4m7tUm5TuvRcRQNWcYMcam4R4U4uZlf
X-Received: by 2002:a05:6830:913:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-85d361417afmr94378a34.2.1793299654718;
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:23 -0600
Subject: [PATCH v5 2/8] serial: 8250: share the RX trigger conversion
 helper
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-2-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
so drivers with per-port threshold tables can use the same conversion as
the generic 8250 implementation. Keep the implementation in 8250_port.c and
export it for subdrivers.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..1600f2e45d76 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..fc3987b5a70c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,22 +3015,27 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
-
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
 	}
 
 	return UART_FCR_R_TRIG_11;
 }
+EXPORT_SYMBOL_GPL(serial8250_bytes_to_fcr);
+
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
 
 static int do_get_rxtrig(struct tty_port *port)
 {

-- 
2.53.0

