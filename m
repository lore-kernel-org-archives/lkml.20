Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872360;
	b=nS7IEKnKc+gRz0pArGgdc0V8SBczny6gv9RiO9J283rBnBtwWLrRVcXtd+CdCB7F1bvq
	 qQD8wU/+kr0zcF+QxyZV6py9sAEz/k7ixcIIaZQJfTZvr0yPtHbc45NVisM0hTqdQbdRJ
	 No02+c8Eo5lo+basjXIEAy0MoKSl6izmKOZEByV2gMaVUBBZHTrSyzOd0AOY5n+BJNcaB
	 IVxhFcLCzPEtfNaexHfrwFNPZDjZBnWeKT5f28anzElQUFKv7dPaAgYW627PXzbcPvfjD
	 e2zJoKeyQfI7c62cDG7xFplf8rdgvPwvO/IEBvnu7598JM923oLlCCQ5weFWexVCUnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cgdV2l8OQBJLScaiLLZmyJ8udq04GHVSVzdhmyemrjQ=;
	b=f+4FffiQGU5PM4XxLQRY2Khgg82WJmzMuXXv7AljCtcKB0uu8W/4mFN/sysdhh1uA3qR
	 JZHMRYuO2cJbjGVP5xYDnmCuqceWGoJ4/zFDXrnu4O92PIpegaRWFGQNoV1UgVvfSqpdc
	 FNS58iGq439JOkoGbYFwjhVMViS5hcTgL8z+e6uQq/3l2AGnkn6uBvsQCqJPzoWpYz//E
	 rpNLf+ybusLa0R3TAJUwNUKEfar4brL6TBARlhJWpx0o77/N2KEr+nrJKS506bZil5Sd3
	 SwT8Cei3awb9pA24CLUziBrc8PQ6ghVca9GY8MJPJPnnv2uFfNu3eW9UVLIfXYIpY8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EKnj1Z+N;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E49606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EKnj1Z+N
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6dd4f3f696aso1118138eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872359; x=1793477159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cgdV2l8OQBJLScaiLLZmyJ8udq04GHVSVzdhmyemrjQ=;
        b=EKnj1Z+N2wxcJs99oyz38lqNAF6LDQsvgbmvLwf7S/dPne7EeP6sJvZZS1yl9JLaPt
         F6Ksz0jcflKDiqF98BMlmc0gqIXe9zphn0bXO4K9Nckfbb8zFRIoTD+ZMH8IUo9P9lYL
         Mh7sIxoRH1XI8I//HERZ7cTGjtX2IVtYw7pQcSZr2Lv/T/rcvFoj2TrXYXND7fgDv4UN
         Dh0DANke7dax2GC2kYD4fcq3gT1nfHCTpl3LP4WodyHNAn4HYzJDZvy/3894tedg3yZm
         MwJE9ZCMMsu29xi3Xj53dOa6XRX0FJ3gF7bMu7qc7qPgR/tIkl0U4w1R66vHmhesf3tz
         SdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872359; x=1793477159;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cgdV2l8OQBJLScaiLLZmyJ8udq04GHVSVzdhmyemrjQ=;
        b=0XQMnOW2iURic3o0ZwTYpLeekGvLizs7kGBrcooEsYr1Wnhz5EctUJsgdGLT44PEcU
         XiEQ/xe8JSlLp/38Jazv/OZpS5zxJBDXTYkV/dfzSXclp7ZsOjt2Jk7pAUFXyatsd/x3
         42Atua3PsCVXxAUVVxFuR/J0iWFdpXjdRSQAxdDxZGvvOQ1bfL70hTkB40kwiYl+shIg
         8DjbtPJao+xO1t3C95FAKNoH75YBc4a9n8M3TFkP24dBcxZZDZ12XnoPA30vyk1GCEVw
         s1IkV30eflljk2q1TATW1YHFDLI7ycNblxRZJlcmEcDFbu1DXkoGpZLcBZp1LlkaU9oU
         3EmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWMlAtj8Kscurec3ym9xMtQImO/8vXJggQ6Fg0R8edyCDfme4vra4vZk1kJjUvP/FEyCa+sgrC1MH3lUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQQg+0tRgNEGJtzR3HLraIGmpupog+An7sqwYV69AJ6pMqPgMk
	h47IlZFuyI4sel77mOCoJkx7enbErGqWHqezG1ZtwC92v5zEBcvpj9T4Jyb2z8Nm
X-Gm-Gg: AYBFou1P5/wthoXJ/CsIrkdv5uUijLFnC2tnqNNTFdjKGATg5KrO5mKeRTYc73jSsz0
	e/ETlrXmfFQlztltOUktfV7TCPiCP6SeIPJVOW+tRaS3o3EQLr3JDrG13+OcS5tCONhqAufh95J
	BLTdMZRyRv5W7EGwrXSjLhPspKHpbwad2kLjQJ3seovrCiUBZXokU1V4FSDA4xpX01ikzCVdCAg
	pchDdzrkHQ2ufyZMt/1vB3HYeM129cll2D6qewXXMejjdOnZVnq4j/74a765F1rhX72PDe3WlIn
	TcfKa6N6m/kWCrp0qMBF2dTtwlgQqP4nGZpgMKTyOQg0izwFdKdUORBe9A9FKzscmkdWkh/DmsJ
	CYGpOhtbW8YIDzLB6R73UabYD5AEeWdL+KxtDHJhU/gsF/+wIWHFquK3mSj3ZtyFFL2cMfwewzs
	vCJtyXXOPUjryEPc4CZpYLCZA6WlA0ayHUx9shjGZGoq3Tz4bpt+gTJZNo3aeMHYRWrzR1AIRmn
	m2ubhXmOSFLyM7paFyX/PhdJ0vn79lRZydw4AhA6EerGmj4yrpjJIDY2eB7MGLEuPTojo6UpjGp
	3CG7ovqx1nkEdC3f4w5MdF31h2oh6/xiFIl2OuBYd2/cZPVrBAQEN0QHfCn8Mk6kefKlwmv85tH
	jVULLQwqxA0nNkWK+/W6K3I93BgWOOEYxy9ab2bMEdKlS343OrU7KmXwCe1Smj0aTZILzJJ5dNm
	++zw==
X-Received: by 2002:a05:6820:c2cc:20b0:6e0:8fc2:84a3 with SMTP id 006d021491bc7-70ba0e26b06mr838530eaf.39.1792872358767;
        Sat, 24 Oct 2026 13:05:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fbb25f59sm3017611a34.20.2026.10.24.13.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:05:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:05:57 -0600
Subject: [PATCH] serial: 8250: clear RX trigger callbacks when removing a
 port
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
Message-Id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1J5jUUStfyuglikwWmN2oASUwVVv
 TsJLLx4o5nnFRJFpgSXZoVICyd+hgJ614AbbRgI+V4YjDIHrUyL6d3PLFhndsKT6RTGLJEHnNi
 T8Ey4aGy9PbfKqKOlDorrFclz/v253v5cRA9yUuW10dtE2Ecb3Fgjkc++HAbKAtv2BdlBIe2oA
 AAA
X-Change-ID: 20261024-submit-serial-8250-rxtrig-lifetime-v1-4fa940207ae5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

serial8250_unregister_port() removes the device supplied by a driver and
normally re-registers the persistent slot as an unknown legacy port. The
slot retains its RX trigger callbacks and sysfs attribute group, so the
replacement rx_trig_bytes attribute can still call the removed driver's
code. Unloading that driver leaves the callbacks pointing into freed
module text.

Clear both callbacks after uart_remove_one_port() has drained the old
sysfs users and before registering the fallback port. Its RX trigger
attribute then uses the generic handlers, which reject a port without
FIFO capabilities.

Also copy the callbacks unconditionally during registration. A replacement
port without custom handlers must use the generic implementation instead
of inheriting callbacks from the previous owner of the slot.

Fixes: 8a6c543cf8b3 ("serial: 8250: allow UART drivers to override rx_trig_bytes handling")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 42319843cb5b..c638e10c43e2 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -830,10 +830,8 @@ static int __serial8250_register_8250_port(struct uart_8250_port *uart,
 		uart->port.get_divisor = up->port.get_divisor;
 	if (up->port.set_divisor)
 		uart->port.set_divisor = up->port.set_divisor;
-	if (up->port.get_rxtrig)
-		uart->port.get_rxtrig = up->port.get_rxtrig;
-	if (up->port.set_rxtrig)
-		uart->port.set_rxtrig = up->port.set_rxtrig;
+	uart->port.get_rxtrig = up->port.get_rxtrig;
+	uart->port.set_rxtrig = up->port.set_rxtrig;
 	if (up->port.startup)
 		uart->port.startup = up->port.startup;
 	if (up->port.shutdown)
@@ -953,6 +951,9 @@ void serial8250_unregister_port(struct uart_8250_port *uart)
 	}
 
 	uart_remove_one_port(&serial8250_reg, &uart->port);
+	/* The fallback port must use the generic RX trigger handlers. */
+	uart->port.get_rxtrig = NULL;
+	uart->port.set_rxtrig = NULL;
 	if (serial8250_isa_devs) {
 		uart->port.flags &= ~UPF_BOOT_AUTOCONF;
 		uart->port.type = PORT_UNKNOWN;

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261024-submit-serial-8250-rxtrig-lifetime-v1-4fa940207ae5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

