Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844498;
	b=uOlcxjeXgKe5e3TpEMyOPvftylt6JuqFJ6xjOBcVvH0aTR/Ad2L3nV3M+td8mizv6HfH
	 ISNMZr6wGxkbyWSuBbygwwl8xkFUB+yKCtm5aujwocsJXpoSIHZPu8u2JklwBe0SvbT7I
	 pYq8r+SbTWJrb+9zYc/UI2LwnKpJvQBovRB3/4dPnIeYS2kr93wHrt4kgnYgHfUMTKVaf
	 mDznbQcJ0Y7ar/p8hQDN05aBc8T9T2Dty52LgxBk0AII5PV/hOXmjQRTwA0cP6LCT5vac
	 2P+aPlbFRSS6hMERwh193N5/EVvPTPcvu+UJMSFtwi4nIpftVVtYRnHUMg1P0Ghchjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jqt0c/lDmpmJvJHzNqMywlimWKbXZGChu8Ayeo3lkSc=;
	b=fC0BZ2J0x39aIbkOXQIEjch7a0x8YMkH9jnetM9qYu3eSvC3iwv3Pm3MlKg2gC5/8jRo
	 C+c8a07ZXtbQ/Wvw14zZVnpjB2Li25ftgNuFkz+D3oOxe2BvoW+5QUgfVzsX3UwQmANzn
	 TGbFQwvIUXatfwh1ugk8bVIs/dxHHCfbhUcT9rgbLB1WpZkRed/7yEw+A4D8n4b5/90km
	 xWsDEk9K2zwQNYQYsLr91MAPbx7VXDfBz8oiL9I6DIwbNRGq8JAcIfIU6wgjdN4Qc0jsi
	 t3IqFSRlc5TAZCnnyE7h/zypT5O3rfKQLRjpSpTqpdTxD/ntC+jsi/WRI6HzoXNeSDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="o6ca/lm6";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E9606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o6ca/lm6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3827943eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792844497; x=1793449297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqt0c/lDmpmJvJHzNqMywlimWKbXZGChu8Ayeo3lkSc=;
        b=o6ca/lm6V4UU6dl/RTS33waZdfKti64hPX9pDpIVPS9Ntr95n85UNLonAKVQ48RuVA
         lo43EdWq2izqtWowWq7T5w03Nhwj6NsN/QTMybG1ZQ9JhGl7dTPBX4CGhgcA7BHYGE82
         qGjz15hZUutPNjYyidHcV7lGHOotCXy6ZZT6b8QDiwFaLiLSWSclcPopx6luMSuVdEmF
         SIxhZjD87d85IbLFcaTt+TAc0yzeC9YovYGRu9CUm1XhU5eVL1k5J0Iq8FppMVzVDAs+
         4mulrH9CJ9o+xbkJ2BnJshn65Tdn8gL3jhlmScebyZ/Eo2cCXMqwWLe3rsWjygZGuZzj
         VeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792844497; x=1793449297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqt0c/lDmpmJvJHzNqMywlimWKbXZGChu8Ayeo3lkSc=;
        b=AeoO8epKaTfUb1+4ZFMLMpazrID1qgBwfWKbo9XGPJoYbn/XGg/xp9S6m6E0+UMYc5
         IDgjHuD2Xe9QTFHKNLc2hRtpNujBH0efzglUHokK1ABOL0SXe7/wp6ivD5NI/jcp/2O3
         DB/Eb6S53SzQW+h4Aoq/itnI6wmYXSn7CYIUMkhRjzJAP/O1piN0Gs74jMIcg9hhWNdu
         E/FDD5bFQJYoITo+IjsJeLFWP1GXMfUShL4RpPT1KwGedh3urku2qQDPrUJ/mD7wNjYd
         DfDBMD5zrNc9/QUwVN7weW0cN0GC3fFzKcycBda7FPqizPHfhYMPphfKi7GsOsQY6wl4
         Eurw==
X-Forwarded-Encrypted: i=1; AKwUvBzL+9qVN/uA7LPkEcBxlazl0YwOknUxYTHIMGU58XWSX2cOp/PzERQllFkKd34/jBk7uSJpKhTQvOj2DAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLE7X4zMmcOo6I8F3XO2fhf49A8yhq7/lxIzvfDA4OwBg5u74a
	pm/sjtfbLNzJ59+39OpYjR2fYUj/PpZ27WepRUKL52HzkiOSetulFp4T
X-Gm-Gg: AYBFou2FVTE6w+qcb5wi2Osm8lYvlkXwvxyNDxnU6/ykYiMaN4Jo6+hJKrYHFS0BULu
	r/aKdSyY6gpE6K+mCQhEcnXLqer2tHUaKa/EdcBrqunE/N+eX3/flNNQbsTNXIqv6/EXQcWLgQn
	BM6OQcyF1WIH9yom8umlznSx7zTi+9HOQ1fH9otHgnqJsZM/KIoOkf7HLGXyX/suWenwVLqM6zI
	1pLSobIDvvh/ti79E0qbCFa46leHd52rr6lzYgz8eHliMgERW3WNU9qHL5T1TpIzashscy8w+jJ
	qn6ObOddjKlT93UXBQf9w0BnOQwhMi2V+cZk1EktrUKtToFf432TGPxB5e6usVmGZcoTVAcWbVl
	RTH6weF3cbLm50mmvMQh7X0zc5EnUJoXn7EE2P/Tp56OslZj+OV0hvSnHOmYHWKeVsMKzWxGDo7
	Hgkz/bv5Ev8J/0a2prBU6XqU46eWJ2hDzeqI7QanlErNxmuVQ9i3qXzynvwilSBIfVyEjni2KkM
	jKyPeYRXBoFCwYSBCZ+aSOQt3OW75Ym4RN4i5SKz+jcmHShIVqH0MFTLBGYO41CQHmnq2g8ok2O
	aPdvfN2s68HHbm9/cSo=
X-Received: by 2002:a05:701b:2501:b0:163:8b44:902c with SMTP id a92af1059eb24-199374f457cmr2427790c88.17.1792844496879;
        Sat, 24 Oct 2026 05:21:36 -0700 (PDT)
Received: from SAJV1N5.lan ([2401:4900:b9a5:d1e4:f9f6:478:606d:146c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm8559529c88.6.2026.10.24.05.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:21:36 -0700 (PDT)
From: Divyanshu Jha <divyanshuj2006@gmail.com>
To: Oliver Neukum <oliver@neukum.org>,
	netdev@vger.kernel.org
Cc: Divyanshu Jha <divyanshuj2006@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org (open list:USB CDC ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] net: usb: cdc_ncm: add Apple Silicon MacBook Air (05ac:1903) device ID
Date: Sat, 24 Oct 2026 17:50:51 +0530
Message-ID: <20261024122051.14427-1-divyanshuj2006@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Apple Silicon MacBook Air exposes a CDC-NCM interface (05ac:1903)
when connected host-to-host over USB-C.

The device tested is an Apple MacBook Air (13-inch, M1, 2020), Model A2337
(MacBookAir10,1) with an Apple M1 chip. Unlike
commit a5148bc2fa27 ("net: usb: cdc_ncm: add Apple Mac USB-C direct networking quirk")
which hypothesized all Apple Silicon Macs share PID 0x1905 ("Mac"), this
M1 MacBook Air exposes PID 0x1903 with iProduct string "MacBook Air".

Like other Apple CDC-NCM peripherals (0x1902 and 0x1905), Apple's
firmware omits the CDC status interrupt endpoint. This causes the
standard cdc_ncm probe to fail with a missing endpoint error:

  cdc_ncm 1-7:1.0: bind() failure
  cdc_ncm: probe of 1-7:1.0 failed with error -22

Add device ID 05ac:1903 to cdc_devs binding to
apple_private_interface_info so the driver bypasses the interrupt
check and initializes host-to-host networking successfully:

  cdc_ncm 1-7:1.0 usb0: register 'cdc_ncm' at usb-...,
  CDC NCM (Apple Private), ...

Relevant 'lsusb -v' descriptor output:

  Device Descriptor:
    bcdUSB               2.10
    idVendor           0x05ac Apple, Inc.
    idProduct          0x1903 MacBook Air
    bcdDevice           10.01
    iManufacturer           1 Apple Inc.
    iProduct                2 MacBook Air
    Configuration Descriptor:
      Interface Descriptor:
        bInterfaceNumber        0
        bInterfaceClass         2 Communications
        bInterfaceSubClass     13 CDC NCM
        bNumEndpoints           0
      Interface Descriptor:
        bInterfaceNumber        1
        bInterfaceClass        10 CDC Data
        bNumEndpoints           2
      Interface Descriptor:
        bInterfaceNumber        2
        bInterfaceClass         2 Communications
        bInterfaceSubClass     13 CDC NCM
        bNumEndpoints           0
      Interface Descriptor:
        bInterfaceNumber        3
        bInterfaceClass        10 CDC Data
        bNumEndpoints           2

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Divyanshu Jha <divyanshuj2006@gmail.com>
---
v1 -> v2:
- Retarget from net-next to net.
- Clarify hardware model (MacBook Air M1 2020, A2337) and contrast with
  commit a5148bc2fa27.
- Add 'lsusb -v' descriptor output and dmesg failure/success logs.
- Fix typo in commit message: cdc_ncm_devs -> cdc_devs.
- Add Reviewed-by tag from Nicolai Buchwitz.
- Link to v1: https://lore.kernel.org/netdev/20261023070419.235361-1-divyanshuj2006@gmail.com/

 drivers/net/usb/cdc_ncm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3e4a..6848b9421137 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -2019,6 +2019,12 @@ static const struct usb_device_id cdc_devs[] = {
 	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1902, 2),
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1903, 0),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1903, 2),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
 	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1905, 0),
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
-- 
2.47.3

