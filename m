Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380182;
	b=U002KxtMcJX8jFalrwupDmc4c3a6MH3xW57vAYPfsPSFCZ5FDhFmzTfSkuXc0X7pu/KK
	 OvvP2YZIQNVIjwVjEq2J1ux7gwkV7KEToH0H882uatIj89BAX0uDiHZcqebCmhCeFgeg2
	 UbdaflmegIg+Rq2PSsh3x6zc55HZYRZ4b4mKiuty/2v+AVnbWlNAhCz7OvoxFxy36JW65
	 f++vcpTfAw6PKtj49IlxFFtZVt9OTGTN7knzLur8uku2IFdgD2SlCaFmHwkRSq3G/EZhA
	 yPgN3Z3zGgyPNul66gyT9rArdQyiSS8aQBUC2bIDIHX5axBVKUmdLPiytG6XV9XF7Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jZGS888auqidm4dyipWzlAJPphh1S18LX24ea2d7R8o=;
	b=FixkFC0odh5oK7rZobtaqdDdLNdDRwyx8lERIIBCOnUYcaMtGxCRFJSTvcogxQo5qoNV
	 wtZ63bJrNcRkMYuG6AaLA9Aqx2QtBdDz6H/MeQVxlmOrLMd89lsp0UT8Kv51KDwE3+BCL
	 cuNXQTHYIZuFVr1GXiw3Ch1uhg1iBXvrjao6NIR8XVnJKPfQUbmY42yJOslz0Rh0bo1LT
	 slzDOWDM1P0BeDs7NbyhM2OwlruSWM9ao84wt61ufkfqVg37GNn94+g6HnkM2r6TeSGGZ
	 WwaMQuIqrQzwBu1rKMthLVNMSUPPw2sPhdeuMwi3Ee9L8Bh8WOKgXSYOMgs4ycrbZZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfxHh38D;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A73606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A73606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfxHh38D
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so5978206eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380181; x=1794984981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZGS888auqidm4dyipWzlAJPphh1S18LX24ea2d7R8o=;
        b=xfxHh38DIVXPpsdcjuU8pKLEB2mK63aFJd7Xf0/+nIUJDjugA4HkTepQxYcL6HRZ7g
         2EcAeV07/9DTk6OKKSedGBjRPZrqBUMcMA7mJLxUAMoeZ7Vt6+igoV/Zg1UL6RikXLlk
         71J7FJxjxEdJQzRMTCBE5YfxqQel447lkS/7KiGU9bC4syVAdvytlNuaSnwUEyrAS2uu
         QxHp9lIzqShCZjJmMomKTT3PX3OiFyaGTvs2U96NU/blOoCpoqCNUY74UCuVHd3mvLBH
         Daj9oufapdgCwLPaJnQYx852SZa0qXB06Y/BfW+N/UJ9EdBoYqZ3cOCjbcSoJ+HlUZXd
         zW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380181; x=1794984981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZGS888auqidm4dyipWzlAJPphh1S18LX24ea2d7R8o=;
        b=iX4zWtK+q5ge4XElQ5b6SHj/QTo71kTTdwlnh02ufmb3VyfoSqVFDlkwBUmiBQr3Ve
         ROrkRcNZgJWSmK1fzK3pTdhLPPKBusiEOvj7fa3BgeQVkN9TVifvdkJJmFBXqXDfFLuj
         vn8qAvFfxDnLQD1eWFp6snJIILN8T13ppZJKZdkuJr/1QLZuSeQMbMJScYwQ2txT4ye8
         JwPy55Csbdv4vkkQYrWA+ueXXNhwUvPjEd1AhAfAGIP8Jiw7CXykSb2siAsXYsw4eVNk
         ugaTREQ8y5SlYxdxDfPJJUwVcayTkCkBLsRPB0FphGFgWPvngwSv9w5Xv55Xuw0lLQTx
         PkQg==
X-Forwarded-Encrypted: i=1; AL+hErGOMgy6neGu/AHEUSUiAtBJb11sWltTbHBQ7Fe1Fw9ez58EJBNQF3JnDntMplPONTNwU6AO5vmy1KCEUvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v+ZVk9sIq6d+mtGlfTkoKoNn4w3DMmJb0ZgqvEdQkOhfEaJ7M
	/pHtksD2ApY9L5gGGfqQFRXtxQRnNWwYaYdQmpu5BsHBOONUaksjpouR
X-Gm-Gg: AYBFou0GfuSkCS0XtqIYsDGBTILKkZA32jLUoMIoYytIjEhg1sv8HipbIun0lT6f6fM
	dxWKettUkCbGOGDjlz+pgOcbwMevBWDfVonpsie55wZx81FzupRrouH13U6kE+KxkEzPo6yZRGt
	SIbl9S6/uzjAG4xk2d9rtMfCpqgzsHiMHM6R55ZwWrsEJ8Usz1UPL3UlLdllimsAwsn0ET53Sft
	WJKhunF86Q3U31Duw607Vzxauxj5ML439cdtECyvcHHyUiB5qdyBruL/rTduntM+B5oojZj192K
	pPyiPKcz8X3cQKrURRDtjF8HM4hJ99pnCEmn7Ly8ArTkVJ4TOFAwdPYp0n4IwQ8J9jLsC7pUQp7
	DbtS7KCPJ6avvXdhel0Cso7Ie0tDAAzOh8InxCJjTGgM7UlENOKOuqOWtCtDqBTC8HijRjfQU8t
	8FgJkmmGUfZha2Kujxxb+Z4+Id7/IqXrIUL/XqW6tJT8RsFc5zO61Hzanaqr1pv/YbZl6YQ2GOq
	544e236OOJ9gciLsKY5CcBRkOjAfuy5t5ISEWyyFkYYNeJ/P2Vno6QfuzPOsOQPOGYivMKYQdQO
	JsCJmpbCGiXdLfvLFRvuStTiOkt0T6uUBjmxory+HPWLt5q1QDGyVDKk3YZRI28V5dVcabhRc64
	45yC7bI+ND6U1xWNcZg==
X-Received: by 2002:a05:7022:ea8a:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b3c0334a40mr1624823c88.7.1794380180963;
        Tue, 10 Nov 2026 22:56:20 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:20 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:47:59 -0800
Subject: [PATCH v2 01/33] HID: logitech-hidpp: fix G920 force-feedback
 initialization timeout
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
Message-Id: <20261110-hid-logitech-hidpp-v2-1-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Commit 544315e40172 ("HID: logitech-hidpp: move FF initialization to
.input_configured()") moved Logitech G920 force-feedback querying and
initialization into hidpp_input_configured(), which runs during
hid_connect(). Because hidpp_probe() calls hid_device_io_stop() across
hid_connect(), incoming HID++ responses from the device are blocked
and g920_get_config() times out with -ETIMEDOUT.

Temporarily re-enable HID device I/O around g920_get_config() in
hidpp_input_configured() so the hardware configuration queries receive
their replies during input setup.

Fixes: 544315e40172 ("HID: logitech-hidpp: move FF initialization to .input_configured()")
Reported-by: Gideon Heinz <gideonheinz02@gmail.com>
Closes: https://lore.kernel.org/r/CAPb1+K1-pirdLGZ1wTUw26G6pvhg7rGP3QZ172ys5DB7rNCf5w@mail.gmail.com
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 60fc6b86a085..85d8d168ff15 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4096,7 +4096,9 @@ static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hid
 		if (!list_is_first(&hidinput->list, &hdev->inputs))
 			return 0;
 
+		hid_device_io_start(hdev);
 		ret = g920_get_config(hidpp, &data);
+		hid_device_io_stop(hdev);
 		if (!ret)
 			ret = hidpp_ff_init(hidpp, &data);
 

-- 
2.56.0.542.g3ef89b7020-goog

