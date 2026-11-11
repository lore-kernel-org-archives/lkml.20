Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380193;
	b=cb9o1gQGQGobEluDMXaQwVxBAAE/oFFdfZPQsXGwdG+4fvIEDB6exhiUS046TnmTScKW
	 Yn/s0aq+MSO5niRSPHSWCE9EfGf2cGvLdDs5YyRxGAQLwXB8h1TK7QSrdUcoV5bTB4bBw
	 WKcOE1bEclui5Jdg6wQxv7qVsFLwvpTuvGo0LGWue/6eMLeQ9l+qVH4rvxuCeKCmMiqT4
	 lmVmYo0bFIzWY3+PCeU5IRV2lllmEUxOvjgRQdmBr3mBLUB+rL/4LeJDyPLW3+yw+MI5Y
	 1BdHUNNtgtIfWMljRCRQ4JE/MTJQXpekVkvmTgPi/AjvtDMOZaa53H/zWnzmV+Ddpxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9jhOOC622dmlAeDDXE08OsOwQ9rbd0t9D1tGFsBggw0=;
	b=or5VITX94rwmk8X2iQGwRQG9365JYk3+s4P+D4Z6ZoTBC3aHP3UUdJHC3/hGI9UQtOm0
	 Da6eZFMpufSB39wA5FVx/EeVwe9tglW2IcZx5Qhf812qwdEV6WboorwHh1ayxUXB+ZVjD
	 yt+WGBL28O9ABnIEODsIhs41AM4v2l0OLPtHf2+qnOIkbgJxZDVQaRU+XZu8PczzFmg9m
	 g8BlSIeZW/Hv8OBGfPqXAYH149v7CcIaXCFjtty9BY3ObX23edC9G0RLYjfzB/Yn3bEZJ
	 wfGRhhPxUqYCoY6DnuVeT86qAOF7u1cCvWJwGT1jD8jAL1FOS+2+PkJTjisZRA5uWoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsBkwh+R;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16260A2608
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A16260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsBkwh+R
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so3679341c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380192; x=1794984992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jhOOC622dmlAeDDXE08OsOwQ9rbd0t9D1tGFsBggw0=;
        b=SsBkwh+RkvYyTpBTtc/4YgnN7aLAWLHZYO7IaApfZg/2+mTAURxhK77U4LOuamHTSu
         jkFkqCfyuaMmtT0wzFNdgVG7m+iuWt4idS3/lGzNjhfCRRgDTLRyBOJas3oH3WKoL2uP
         zkj3mIEaV/jebvGfL4BvKZ6nIZUfw8qc7jNHIvr5JGMHJYYdhVTgtVfmD9Za1zaIM6Rp
         DDI3WFIcsBe3/fSsOo/440Mz6TSKbTXDzC5bE+50fn/VvNa8V+vb/LCtusu8KTWhFqzQ
         tkG1oSN8dvPWpgWUA/UITBPpy5UJK4X0H83gp3Yter7D72wb1o9nAIdY7J6eQVz5NOE0
         3eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380192; x=1794984992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jhOOC622dmlAeDDXE08OsOwQ9rbd0t9D1tGFsBggw0=;
        b=IcEu1lFeesk5qP7UxR64yMOJRUG9lz6BkZpWr2TCCJaG1j12bCPgoVSFKam1oD7QTI
         MN9+8UVD3OVvQmBhzrczuYcymF8vP/OsIurMnaHRBfX4T2tHX8BUBGIVc27Qg60xpD3K
         wu8pA+OR9diPF+2sxrF4leDM0VEzs0yRvWyUzbo27GcsRvkL6VVhgdYEXjIrINo6AJcS
         IdCc3Cp9EJReDm+WDHGHPp+RyQka8bKvA4oaY+U7p31VtqxrIrI81hYUNK04lumcG5ZV
         vryueHraNl+R4ZPdVCab3Ck6mzNR0G9QiKCJDJfPBn/CAM2/KLnBBuHzW+tF8OOj7/et
         ZuYg==
X-Forwarded-Encrypted: i=1; AL+hErHPmRIA3GJJN/opzmadQ/cILcfnCBvq2bOAdU4rboj6SUejyxom3otDLXZ06iUOYOvho3fmqTGx4gPvJ6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mNAocEj1RMwzUqRUYKS6nz9XoxQTIZOaVruLZWy4oG6Mq74fX
	hsfX+CCDmNoYOnK4S6EwInS97sOb4VVwGxkXSb7ww9/0KfNAXWxAgliR
X-Gm-Gg: AYBFou0EpKexsNaIflB0HaAUnyCSNdMotrCH8B3CYkMJWXKzi1uWzhdrgfBSbDYhGXS
	8F4Ae2EQ7N99cV/sApQ3VXGgFV7GxDu43rUZUXBHfGSLWkyQ6lnG+a+dov9jAw4YihNXaxQX+DV
	4wolQgSVL1VrP59vOeXOuzb/sfn1KA7sVQLm1xEV9T0s4anZQ4atWQ3XFxEGYmrZoQqwi9yruhh
	mxXXIgmwxpngOyRskr+i52f3I0YNx6GzY1sOHh/BNsWBvAQ7XEQ74nCO/yC3skRZqwg0Dg0rI+0
	CRHKlIk/3JomX83sJn3c/zeE4q4+iIYxdlvTZDCKKtBlMllzznXcELQmGZHq5GuKPA8i6dUjk6X
	8TsuGybTzoRDHjwY7oWOxcTAv40Y9+HINGOXBWlWQplGLwQNh5GOh7Ar8k3/o1hosAId8uPwmzI
	3Oy8vWD4DZfKXClN1ryyu7FuKw9Lj9nup7gSLb/NqlPiiK51eQ4VHmuuQFn54yjdha8zDGBbk1a
	JshvmiIR1g92Ft43SPJ5eHSXiRBhD7FXyNSeProUvgovgc0BjraM2IPYm+w9lG+VYokXeTS9DxJ
	gkLIVeSMVtUTiSAk4gbhLW+/aBgSPylOJ6yJp+dbvTNVqL2PzfwIh5SANjP8PyuSWpcg4mlIJuP
	aIk1aGHF44By/ljppvA==
X-Received: by 2002:a05:701b:4513:20b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b3c023deaemr1635953c88.4.1794380190728;
        Tue, 10 Nov 2026 22:56:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:30 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:04 -0800
Subject: [PATCH v2 06/33] HID: logitech-hidpp: avoid NULL subtraction in
 consumer key report fixup
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
Message-Id: <20261110-hid-logitech-hidpp-v2-6-30743e91d83b@gmail.com>
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

Report fixup runs for all 27 MHz devices because the keyboard quirk
is only determined later after parsing the report descriptor. For mice
and other devices without the consumer collection, searching for the
descriptor fragment returns NULL, yet the remaining length calculation
subtracts the base descriptor pointer from NULL before checking the
search result, triggering pointer-subtraction undefined behavior.

Ensure the search result is non-NULL before computing the remaining
descriptor length.

Fixes: 42bc4f3129e6 ("HID: logitech-hidpp: add support for HID++ 1.0 consumer keys reports")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 6ac41b7d76ee..53c171dfcf96 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3872,11 +3872,9 @@ static u8 *hidpp10_consumer_keys_report_fixup(struct hidpp_device *hidpp,
 		0x26, 0x00	/* LOGICAL_MAX (...                    */
 	};
 	char *consumer_rdesc, *rdesc = (char *)_rdesc;
-	unsigned int size;
 
 	consumer_rdesc = strnstr(rdesc, consumer_rdesc_start, *rsize);
-	size = *rsize - (consumer_rdesc - rdesc);
-	if (consumer_rdesc && size >= 25) {
+	if (consumer_rdesc && *rsize - (consumer_rdesc - rdesc) >= 25) {
 		consumer_rdesc[15] = 0x7f;
 		consumer_rdesc[16] = 0x10;
 		consumer_rdesc[20] = 0x7f;

-- 
2.56.0.542.g3ef89b7020-goog

