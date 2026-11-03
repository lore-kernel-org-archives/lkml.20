Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721118;
	b=1Ph9uinZRH+s5r8fSf9cFGjhKCc6hZ89Bfd6q5tu44jBIaK3f7jULOJb71c5khPtGT1v
	 octufFUHdAWOIM0g1OIPAn35nC7o/D75lgUVpWQJv68f3Ib2PNEmri1LK6yMXM8YWZ6n6
	 sT0ISvxx+44cebuFBOvA5VdoXXBZLgFtnW7wNr1A2NnJXXOdUk/S4RKGj8gsVsFgPMs2f
	 fZ/UcP1IIrFZSZ7tGD4BA1KeT0QGYefJnShkgsfeTk5YDEQGVq2LmYCUJjmx/X+qHK5QG
	 WdJw9ZYi0FTC5w8UbLjZ/qrc8sv7FDjhwmnuD1r2nDDIUaZaz1ongZ81rwT2T+iesig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=H71gfqYcryivhuQjqCzDbHCn1oc9iWNIE78g3IqBiAE=;
	b=Aoi3dP+82RP1JekQgTyH6L+XIIlpc8oxlCRTmDO/q230mcP7ymW5j/EacNg38Sgx2fRQ
	 49XghBaEFybefVs7gN3p79vndVQOJUXuu8BVpecg/nwk7ev4XcYwtCZEdydoAhRx63VCp
	 uiOl96eWSUu/djB63QfD2cGEH0fjVOirnOgSHTJhbABeRuBOuK4smfbCEYfe5gSloH3++
	 b+gudkYKBnbbO/+rOQEMcNv8PuhUlQgdvO/xYPUILdlKdrpC6pL+h4lZKPCC9H+vn5Kow
	 OdfzyAukq4Hf1bwaqFJBQmXXZugN3Al4TRDndYUfG0pbWH7zKhrDB9bMV1F/XhYx3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ey4MhMEh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C01606D80A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C01606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ey4MhMEh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2167821f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721117; x=1794325917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H71gfqYcryivhuQjqCzDbHCn1oc9iWNIE78g3IqBiAE=;
        b=ey4MhMEhJLG/7pgDAb5MNxYJcWkTt1QNfCLrq0lK2KbFrJtWdKv/V8mEbZF3qp3VOd
         NPMpv84Eg3N8AkZtgIQlP0j9Q8pfs73XXnrEfl6ZrwPBJxS1LsjEID/65NeTfbD4Pqon
         T1t1B6gZZZWEjrwuX+kdPRBUzo2q6uNaTBQrHkTB6ElumWDrcc9hnXCRksOsRAk4AfPk
         A46w/8qmvUnZ2eGBYwxZYOhpkeuaElMkA9ravstpAz4qayu3hzxE/xf/7kr0sIKwLkG5
         bqQEuKAHPKI1xx7cWbzbXMDL79fwhGMV9yKnXGM32Lrt1YzE622UJiKSBh8PAaetVksZ
         mRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721117; x=1794325917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H71gfqYcryivhuQjqCzDbHCn1oc9iWNIE78g3IqBiAE=;
        b=JnacCduOkB3WCos23S2wyWT13/6h2XkHy4aW26cae/EiViWF0paWcUUFH37cANMKaF
         o56BApvtKl4VPpvIQZpWOYrvcX8NbLc1dnyQFyQ/JHoLNseu5XRJSqk+9sk8YcqazYBj
         hqrqMuTK1pEPLtUmRGXAIB3tPHIH3xpdJzx/VxRvDp8J9o4ZE3Fp7RarRO/hYTrx4zAK
         wTVq8ZHBmR6tJB86O5DqvOENFsEXqs+dzeWU+bYVoPDo/W4HxzaiHGpBa04U1qI5+6U3
         MYjrdjKAb5URy63wLzlDPo/rybZSjOu6CyzV+6Iiy2An1NMvluboVX0mCdlZy6VSU739
         CNsw==
X-Forwarded-Encrypted: i=1; AKwUvBwbFGfioOeXUdLH/zkG/F8a+Vo0BrQlhNVOKxX8ol6+MWAleMTfLpdxK56LmdJMuKbPLNyhWjVIaI6XZ4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Btp6A0lDiOXbQksEiIp5hZBpsV2dGY2+bW10lMSa9G7s4mUaB
	wKEOxPA6LidGNQqgLWLlIM54KTpRPOoJqgn0SMSRZQvCFDJ4ch+e2C+u
X-Gm-Gg: AYBFou34rtvmdZ3UgZ3jxh9SXCYjtAm7gnCZDYAdKBBqIUbx5yg6bBDiXpDsMouwKMx
	oRHj3Hra6VwFNOFluu6LMJCkqe1hK/mmeMSbqpw1Ix8q7fHHsYz9wRGDNO/WG6+nGLOu2+2g31n
	hEJZbxIRLexnC9oTxHoe0iJuirz8Pd1uA8G+ad250xoViAj/smLuOZ7xB2qZTF7QbQeNApm/7h7
	Am4rFOmOGUkzmCMAPrOzT3HrZb/cKp2yNtTgRUA8hHFxfekBS01/smLCp9dCoU33n2C79Uu3chF
	+hKEEo8mC4gCzl37uC3sGLRkfgT+wOabHShSev74/4lMT5PsoAP3I0T+wl4FhKUDk12mWmGtM8L
	2Ys/p2y7vUDyuBnezNpqDdi3VCPs1JMCJpA7NSmhcyhKcLtk7JlNU3+eeqpzKYD2mTdRCrQQ1Yt
	Ss9LcoxkuVDThSl7DyaFNIWOz9za0MkNpV4St0+Fnmk1zYmEPNwuyK6JoJDjTXHwtnDuXqu1Gfh
	RRDUVx0WJEcnaF50POqWq94G6Tef5/c+UHwS5LN39ssZLqIyG2EdPpahyJ1m+rY1qDzTdliKj0R
	qv3LCJvZHWOPs6ZQGWojAF710wmq/A7Q9X3dFciu497vCK8DlZ777xl7pR6cN96GdXgRUZ9X3e1
	+8C2KvbtxRf1IXSvgx1tPeWkYmtigxdujr4NwSEOATi0gBjVhYReN
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e6e4f4ff5mr23255855f8f.44.1793721116508;
        Tue, 03 Nov 2026 07:51:56 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:55 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luan.r@variscite.com,
	alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Johan Hovold <johan@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: [PATCH v1 2/3] serial: core: Allow drivers to enable TTY wakeup at registration
Date: Tue,  3 Nov 2026 16:51:26 +0100
Message-ID: <b73bdbabd8d8fba2a2ff5d8576261bda6d8b0b5c.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793719239.git.stefano.r@variscite.com>
References: <cover.1793719239.git.stefano.r@variscite.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The serial core marks registered TTY devices as wakeup capable but leaves
wakeup disabled. Drivers whose suspend path checks the TTY wakeup policy
cannot enable that policy by initializing wakeup on the physical parent.

Add tty_wakeup_default to struct uart_port so a driver can request that
the core enable wakeup when registering its TTY device. The field only
sets the initial policy; userspace can still change power/wakeup.

Apply the setting only to the matching TTY device, leaving serdev wakeup
policy unchanged. Drivers that do not set the field retain the existing
default. Warn if enabling wakeup fails without preventing port use.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/tty/serial/serial_core.c | 8 ++++++++
 include/linux/serial_core.h      | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..aa18d0820060 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3121,9 +3121,11 @@ static const struct attribute_group tty_dev_attr_group = {
  */
 static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 {
+	struct uart_match match = { uport, drv };
 	struct uart_state *state;
 	struct tty_port *port;
 	struct device *tty_dev;
+	int ret;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3196,6 +3198,12 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 			uport->tty_groups);
 	if (!IS_ERR(tty_dev)) {
 		device_set_wakeup_capable(tty_dev, 1);
+		/* Serdev clients manage their own wakeup policy. */
+		if (uport->tty_wakeup_default && serial_match_port(tty_dev, &match)) {
+			ret = device_set_wakeup_enable(tty_dev, true);
+			if (ret)
+				dev_warn(tty_dev, "Failed to enable wakeup: %d\n", ret);
+		}
 	} else {
 		uport->flags |= UPF_DEAD;
 		dev_err(uport->dev, "Cannot register tty device on line %u\n",
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..d5a0666d782f 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -573,6 +573,7 @@ struct uart_port {
 
 	bool			hw_stopped;		/* sw-assisted CTS flow state */
 	bool			cons_flow;		/* user specified console flow control */
+	bool			tty_wakeup_default;	/* Enable TTY wakeup at registration */
 	unsigned int		mctrl;			/* current modem ctrl settings */
 	unsigned int		frame_time;		/* frame timing in ns */
 	unsigned int		type;			/* port type */
-- 
2.47.3

