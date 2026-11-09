Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204670;
	b=EHro24NH4M1N13Nk4BmaBo166G3DW1WT2LOA8dUMa3qViaMabCMJAPsyG5J1q1Z/pgbx
	 3mWxAnKUXGAu6e8pVLnzfNX8UfbN7XoDAte+l2Dk4kH3iESvrCBSftFmuvN5YId1BrRLQ
	 jRE1dPu8t9HcfU322+Om5FLjB120202jJeJ8m6HN3qi4XCdjDtRlAzM7m4NzuGFDqt4JZ
	 mHbvPC7ht+IfnwX2JsbyxN0irZtgpXRXqEgP3FitILaagukdX2XAIXY6cRBYKDgNBXLKl
	 x4Lq0Y25AhKvb+y0ypcgfR3yA0omGa1NU5SWDZLSpGmRme77OacmogdLomU1y2udZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SHjqr5HyPYfvrMsyfIovF4S0TyQhn6m/GOYAgfH2pZs=;
	b=VfSObTPmtVxaOD7K+UnIywO7rFxnTL3ztLbj4gU9JTzoJxYqa5+b/hknBHY2P/isqyCT
	 xvw6wT6Ryt2ZodGjhqBZPjZN0YTSMfVjHQWRefKBuRJjsY2C2Ewevg/lpqoSYFPa6Hqdv
	 67/uR063KHK2cDU4tm7SeuiyTFVPD9GAZLias5EVWnYjSRjOdn4dxQryJxxqqGlSkGfIC
	 TL1RJ5Lt5dj6Mof+/Ry2hX5TbMXJboL+tGN1NL6zrFOVbNIVVe/dGqqKWASppg4KKWXSc
	 i0Q/Py+35lgu+spwzj/ldrzrimKcMcO4KgZbL6Fut/QR++08HD+6mkeTanPSKOFwjqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q08c1eXv;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A99606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A99606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q08c1eXv
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f6295304dso560253eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204669; x=1794809469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHjqr5HyPYfvrMsyfIovF4S0TyQhn6m/GOYAgfH2pZs=;
        b=q08c1eXvQtmYgarguocZ7+LNJOMZe8a9nkncbRV01G4Bd6itebPqLXWs2rz9Z+aE4J
         mNYn91zQNXGndloIFG+FUOJdsHcBwfugOFQxt1IjXNiSJzDkaG7GB7uqWmt760hl2sEV
         xs3eBk/FxIq3qytUXlj2gB4mh91Tljvw1RLk2q/+W3y94BozIjvGhDesvMVe14/x6LOJ
         XKbQJAXYMWx+D1o1eHioZlvnzyjynWdZa3ds6AKKP59AioigfP/if+TYKROPzVU0THKf
         ++jH3GMYmkRR7Pxtkot1go1t0MhKFIDH1jn+ADwwTlH7BhJRO/azo+qOkDvLxYMAfYU8
         9ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204669; x=1794809469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHjqr5HyPYfvrMsyfIovF4S0TyQhn6m/GOYAgfH2pZs=;
        b=ni769tbYdqLKFgydVVSlaQgruhb6mI1UwHpHmgV0Z7kr8Ju3o+4TLIjiJ4k5PUoDH0
         ixPnY8gi7H6XR5JQTBctDTXRrCmCJ1Tgxmxv6n1ubJbdy06fRcqEbjiG12fiVSRXUWUp
         u0RoaC0hTJkeekMfW+0Ujr7YFeSZHV7zmV0f2eyUDH/1Brd5Djb9IsCF4BPB7ikSnxsb
         KAfuS+uNsMMJHLxwkIoINTz1VX81WSZlYwf6y3hV7NpNLZcK+GqynmdHIrfHGlXMKa2l
         cSEVCOVAW1zXqLsV/BkblMMse2zlQuRErJ14pd9cs5i5DmTkG18nIulAxdXDgNdCALA1
         diTA==
X-Forwarded-Encrypted: i=1; AL+hErGYSLkUzayfUxbmh2EQR4F3T0tz7wpTlims2ACl1HZMfOOyKbPkOjldcAsppH69S1253/taKKfI4yetOmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gvQRwyg7tsUo4sRb6rW0ZDDv/a9RLQdROFTfZZQUTXgNWVFiQ
	TL8ekhpC8OgAfYFD1DUIhp6O8aeuZl6yk/WcVb+fLtwuB6e9VUvLC9N3s13KEw==
X-Gm-Gg: AYBFou0f71/ypdruc+E9ErEaRuASIqwhDblOZlVek0dIT0vMkx3yFueX5sFshYdmSuZ
	A9LwIGgxJtSU3+l9gLvfQ5I+spRKYy9K3nIpMhyZLGy5gzzYRNYQkkpXVo7NAmVpe3zvl+5yJro
	8A6LjiY167kuuon0NI8VDkv9jEU8yaqYRnmnFQ7NcswflT/C3Zfjk52Cfm/xWc0BfSmU1cGfmj4
	JcJf3bMXys1rCZ6MIOUrhqk5BYtT6D694+zNTj0S+H7xTPdkDsOla1qcriRSEQKo7rLlMnl9TkY
	bQ+XIdGaBmAU1+Hi9iJ1WrJPLcpYexCdC/U98HUNjVvMUHZtIrUAUEqaVsmZoffgKVWIjlvupFQ
	7g7OfTFGAC0/ZCTeVdjx7uJyJZqI6WOLf2bmFsvtdRdyPM49voNIyULg+MykL9PMQNMQBRiBafV
	I/GmoCr56Ka9FM2617XAVS5j8IoGfKKNmqD424b7wuFojhAC2CbJtpuL4629lCgPsLmQzYWycuu
	gYAW6WgmgGf0qv6vPJvgUeH86zPILg9egX9dL0sJWNSiJ/S9MBL6lxj9mwk51uuwUsRuhZMQfsH
	tFEOwL2SMtP4gZ6hE0T0k8ABvSv2bAv68owjdMK1j/SkUA1QmGnMTneOP/vtUoXpYvY8slPmuRP
	R5jgBBa0Lfrf0g/Up
X-Received: by 2002:a05:7301:fd04:b0:36e:c07a:426f with SMTP id 5a478bee46e88-37257aa83eemr5915584eec.39.1794204668922;
        Sun, 08 Nov 2026 22:11:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:08 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 01/18] HID: logitech-hidpp: fix G920 force-feedback initialization timeout
Date: Sun,  8 Nov 2026 22:10:45 -0800
Message-ID: <20261109061103.2887636-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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
index 9646380febac..6b1f55483385 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4098,7 +4098,9 @@ static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hid
 		if (!list_is_first(&hidinput->list, &hdev->inputs))
 			return 0;
 
+		hid_device_io_start(hdev);
 		ret = g920_get_config(hidpp, &data);
+		hid_device_io_stop(hdev);
 		if (!ret)
 			ret = hidpp_ff_init(hidpp, &data);
 
-- 
2.56.0.506.g506a7eabc5-goog

