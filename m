Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755286;
	b=wqHoDuSyUSyXCgJH4kO7Mu+NSdozluBVR73Cmq8iH1QK4TbaoFEIlOrZLmtekW+xpys2
	 Heh1Q0G/dMCYxUKxexV9VmuFL+nL3n4uaLcM9vN7luPLUP/cLWhIqos+2Zgor7yk/Hd/h
	 3orILNE7l4Dn8y2DQRIVKgbTS2cY/02lxN3Pv4fy4GuCE1dxjcKVuXkxwL90/GbWOT7II
	 7W3nSx36X1uWYkGev/LzrNCP+Loxyv4A1P1cAKlKgfqQW+70ExZv2UCEs8EBbN4uY08wq
	 8ocHqnVd55I2L1eTnGZ0+5UNT+7Y8XvansRnV0rNHtm7LDIY952fgPj2KA4tlzLqJjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2rnyfsy2EldrWz467K7SxAMK6OUc0htpUc0SitHaE/A=;
	b=nCDoxiwIciYyoYI5wizTw7U8xHXWBF/2iEazKsIs+zM+Ta8+Hm/MymXUwHUdOzTdvQ4P
	 ClvcVGp/v0e+i7K2YblqcmkNjq4LzrK7GMVVaY+fBvNHaXtPvzHfYc3SxkNjjKIATUpTM
	 0GU4MEUz6uN4vQW4d4J4MSZ9vQUjRIzFiowMxstGT2hkPP6FMiH0tXwvgzPb62WCJaduz
	 SR9Q6UOfJPFwZhUPRHnJzkvwAFzw9TJlmf3sajUGamzJ99kAcp8+MNXAzV2NNKQT/sYc/
	 8CI9dm9yTdgsTNBxIR3IXcBGvKgfqWwlZY9hx5OP+6E1a86MVUQq4b6bSdWKUFG+LAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFNcllD9;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B7606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17B7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFNcllD9
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1721021f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755284; x=1795360084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rnyfsy2EldrWz467K7SxAMK6OUc0htpUc0SitHaE/A=;
        b=QFNcllD9vJ9RNYjanp/aZaO5cSt+y8OFpkd0tT7WqUbmE4G8viItw1o+rGNNrn4bAf
         mBF9HV6cmgq80xojU1re335TX3kmQPovNQOb898f/aPnjGVcWLpWko77f9ZD1XVD/D1V
         3Q29PvwYoyWTxMDyc5GZagtfn+ZEebJdzhG4KJAw96ywma5q4vBIBc1qs+GOANjZbtNh
         arHrZ4ZIav7EOHxGBLeCZE0qHy7WUluTtK5W1aLo9L/0aBgF7VoJAVDPfEqBJIi3ELoG
         OGYRhy4W/3KAw8e5mjsbkQVV6aYXT+6UZ62kVUWQh7HPKUsPr60i41tEsPt7lzjNV3FN
         z/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755284; x=1795360084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rnyfsy2EldrWz467K7SxAMK6OUc0htpUc0SitHaE/A=;
        b=FgJbVKGbq/rdOzyf9pWFXBuC+rMeqwIXwW6Cird/GEeh77gCeOFcLPiQQQKmxpM/0k
         GYq87iIkT1mQRoNO2AzCW5ZZscQWscSGRHPf41EpOAiJt4bJAnVg0pYjdn2sbz9U3Oyd
         wKyJbSF6KqoYdTCrKQFjC6Il2mvaXQKBV4pqvvFnnu+R/oCWRg04shiqiEopajXJ+Op3
         qrDvse+rDTld/i+LR6jacXrSgg2WNnvnl6/HpfzgKF/ROy7g9oyzGtqH3YQDauG4Vwrs
         7poIoZhDbEbzi8XwKme4cwGh3Jop70eEL6+Zp9tOQOO6o1/VN/ALq0hE4w7GtnJeUUSB
         uV9g==
X-Forwarded-Encrypted: i=1; AL+hErEJRqU4+LKF7p9uFWcZe9AIiyPqZ62aBnDvCRRet9CniedIh4ff8S0V1A9vWNtu4QC2KnGs2SV8lGKp1Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z816/k5FcxeX15u6Y4/Ssx0LTHfckxMbkQWh+uL/hpLkFB+zHD4
	SahoAtkDpszLp9KwprZBf90Eu4t1C6w4SfGTLqm6opoX1PTDSgXe44N1
X-Gm-Gg: AYBFou0esAHEyBFQ469yLzfbfV8VazTbsynSfj0JORhnL4HFSy0sDxIJuaw9RThCEyr
	JKih1mhbfhG6/0WI3CRT4SQiuAAoHYgPOsSfUIBqVQ9BrV/hSLqfsgUFuDAg5aNF4LM8fFFT8fH
	NUuj2rIXByxrtpQkTUjs8Zftgfb+vHnlHcNkVDf61yW6eUnVqs5sotUxekYPpD/rdkCR9aV6ICD
	vRxKTpJtFYtLJOwpx8muYkRc7X4NF+86GEK68+FwHzdJ3U5TTOJVLqdVyDPIORtIrSM0iSmeXgn
	Wd4SyYyQm0J+VevRHfzkQWg708XPNhfPESIF7luJL6aGAqQgYMwgNOWG6b4TqF5Wo+s1lb9t9Sx
	ZP17K3nRwWm9UhcX8UGof97xMJJjLMP4q3WTaefMN76KamxRMb4gcBgCHwlVz1FuG2QOQfNDxiW
	jZlfFOS8s/7D+obBDbFKOzJC0QRpNQwH3EHG+YbrB6FYaYuxwxPeufmn6baFzk9q7eP764TgSVw
	8F+M9/FaHbb1j1YBdU0xR1VIB4AkgtQfS9bmkcOuxYWFfw6UT4842TMTXDQDF0LGF3tB7fkIR3E
	cyQ9f4Sv1arFPyaqu/7FO/6SKTmMBzI61GKMUvi/brE=
X-Received: by 2002:a05:6000:290b:b0:499:9ffc:59bd with SMTP id ffacd0b85a97d-49c70a0ee43mr17121286f8f.30.1794755284178;
        Sun, 15 Nov 2026 07:08:04 -0800 (PST)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm17642477f8f.52.2026.11.15.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:08:03 -0800 (PST)
From: Bramuel Barack <bramwelbarack89@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bramuel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] serial: mvebu-uart: drop of_match_ptr for ID table
Date: Sun, 15 Nov 2026 18:07:42 +0300
Message-ID: <20261115150742.24126-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.56.1
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

mvebu_uart_of_match[] is always compiled in and already referenced
directly in mvebu_uart_probe(). Wrapping it in of_match_ptr() in
mvebu_uart_platform_driver is redundant and prevents ACPI PRP0001
matching when CONFIG_OF is disabled.

Drop of_match_ptr() to reference the table directly.

Signed-off-by: Bramuel Barack <bramwelbarack89@gmail.com>
---
 drivers/tty/serial/mvebu-uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..8311e4c244f3 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -1016,7 +1016,7 @@ static struct platform_driver mvebu_uart_platform_driver = {
 	.probe	= mvebu_uart_probe,
 	.driver	= {
 		.name  = "mvebu-uart",
-		.of_match_table = of_match_ptr(mvebu_uart_of_match),
+		.of_match_table = mvebu_uart_of_match,
 		.suppress_bind_attrs = true,
 #if defined(CONFIG_PM)
 		.pm	= &mvebu_uart_pm_ops,
-- 
2.56.1

