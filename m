Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911943;
	b=c7URjYzJ7lGyDr9y0UET9HMZplrr5h5lpY0TnyIK45PpeEoFNhJUwHG1kF6j3aJxRgkE
	 dYfgI7ruEahX+CeXWMO3kI8A8xmRP1BjbgfDK/gfXkNZgAh0R7GokB7hAVB9Qh5Lzt1V0
	 9fSUIRc/Vv26wyDXNFMpmA5T/KAhNIZxw+kWISjJM+fh9Xl4ylJEpUg4WP0dwUH498Yto
	 mX/4CCpTu4EibZIwFvPfGci3n431it1nDsv2U473Hu3alpqjTXX5lf+r5Ilo93EVLhBuy
	 q81qUQtWkLGOhiBbUYvS0mg3MMDpmbK57gVRzN1w9GbqS3heYOCCvbHUCC0JLesVa3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=WRbO4uL1ehrrPhGfqGn8nNf49vcy6VHnW82R4Fj9MlFprHgyGi14tYwUmSHP7BwRLdDu
	 fBpjaCMsFFrrRbuFxctx82AdA2sRlq0+ojPXdcOLX34fOtm7Q6AKV9BwMmkAdm9wIcBAE
	 4ryBBxGqs3mhbTT2WWYy77MkV5zprZl2BPvD97PHIrXZR7IS0M2j2J0Dl38+nenlGsGpZ
	 D+i0mArQJRuMBhbhHymrpLAqFrjn8EjUrq5wVtjpNAwdwCMBbDiuP/UFcOUn8T1cMNFI/
	 0akvSN+l0E+Gn+msMrOYojwrGJ4ToOHOn0t0+/WK33wufgj2ZWS3LwV8AtlWQojC3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x1/1PkbX";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A827606D81D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A827606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1/1PkbX
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1afdf5196so2531eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911942; x=1794516742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=x1/1PkbXEl/xKNPfpHRZjkItcLdgBOL+Mw1jDWTDrVr7UMokvg6+rz9Cy+eHHuHq1l
         4Jc7U8Gpxwd7lpPLTvVtM6tEbTYgAFClce8IrSCJBlmajP8uEcPPbmdiEaWFO0rctCSV
         F94/vc0VbpMw3fUoU5AoEZGtt18WMNIjKSMltoaTx/5Gis1Rr3wllgJqQYWGId81Syrh
         1MRY0jqeq2Qz8EUZOB9TYWyPyZNtDbLpHKedSzNUABMkAxhJMHUNi3I6Fa87OXbIXRbm
         A2mwv8EY4Mlx5rwpTzf8A2M2gTMdYdzkAtq5/32Mh/cnIwsiOPUwtyWyWHL39R9T4nzZ
         1ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911942; x=1794516742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=mf7keqQvXs0+9GAzIknae41paObWYA5ttsJIfxeoweyBBOcD1bEdJqjyCB/nprmVIu
         JCNuuGXNP/DcAUYH0BKUkLeRKxjmuqeYbZgiDXmiNFC6B97o2urSjLB63s2eknCcjyHd
         1PylAC02SZAozRD0pl37riDVbbawnaV+MJfVIbymheru+Il7HQ6a9Y+eAzQPWVE+EiiZ
         v7dVgm0hOQ29QSZDTQIfSVaHrskVaqab+04Mjx36v9Kgs4Nm69xstQ9ccxEHrM87xu5w
         IzhTyjz0CyxAWhWIaB2JXilOptjB2Ka3QOMRr1C5dGk8+FUcEsb/9JQXFHfp9bxBNWw2
         B9lg==
X-Gm-Message-State: APuU4Z9jybF+rAVWOIwfGIwINH1AaM3RTE7gEwTc+1l9op1lB0X5eH30
	IutO9wh0Iv4KVsNfdZKTEUNLdOIGK236Rc11D8pMvcbbVrUj9pzv1mD6
X-Gm-Gg: AYBFou3k+sLD5JTfgGu1Js/wvGTjN7yNrvNHwET7YJ6oD9V2NVcSdLl0jG4QzH772pb
	Ih9ekomMeqBSC5WliYCH+Th4M3h9RuVbqOFzfraX2yt4LPom3NK0P98fae7UPzBgdqX6t6iXTAw
	atdeP2SIVsao1SBKqPxI5pmoVGEKXd/U4t4++MyVw12jJrY6eeGx1Z3pV6mMEeXmW6QtToXfELr
	MQ/Y50TT8ba2OZ+yesomZHUvuvTIL6OCshsGUP7thDhZbocjGJBEtFlACYBwycS0r3uQdt64elZ
	FrfNXzxYnWc0SiX1hrHgfg+Jj48tjTWS2jJ9kpheqSTWtVIj48ARTHwsWKcAa41sJQwCslQ8X2J
	Pcn2Oj2e8dDxuEmqouexJyXRn2C+BFYC5HjluPkxAYB8VWhN2bQIjHWTw6Y+iCfuek+ysg2TShi
	huMAdFKU3q4vN2UHOpOcO1N/GIMi/q26aCovwO499Wy8gfDR74WfIyE5dOM+ic5pNsbi+Gm1sZA
	byGIscZgTE9WtX9DbCcW1+m/wo/K6BFACePTEjS/bMDiFxQFPesRWZE1T6kSCpP0CfMdrY6TV44
	7EK39L009voeIMsyD2Z+suoAg5EsLEZYfFI1TSfDMSQJZuvuoPJbNQgDe8/Hw9J8m1eHnxKpaKf
	bVOwxjJm3FI4zgGNSPJErO6+R8mxLq3PQjCInr5hkYOWkZkrUq0TDvllMIJ1PyjCbMH4nLXutC7
	9a5QQeiRkqpxh2lJAbsN5XHBJ5sNxBp65/QbM6CbfnG5sOsvy40/Y=
X-Received: by 2002:a05:6820:1354:b0:6f9:59ee:cf9a with SMTP id 006d021491bc7-716e73d88b9mr513073eaf.7.1793911942466;
        Thu, 05 Nov 2026 12:52:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:06 -0700
Subject: [PATCH v8 05/11] serial: 8250: expose RX trigger controls for
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-5-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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

