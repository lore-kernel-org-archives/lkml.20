Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204685;
	b=GaIRtjMQPewLBx4GxKFA5AhqFYhu+EZqJ9lfEFxoNjK/qLP6Kg+junsliIf65Kawlgzy
	 Gv2jQFPXY6UNt9Zd76vZ5aPGDlQws2lXId3JAkFY1ZzO7OqwKajhiW6N2N6dmtAvLhTpk
	 xsPV4FY8K4v9YN3OxDnsIi0OxXFQw0mABHcCaRM9p2NMyzKCx2ZYxw6WfM3H9WeUNiE+n
	 6R9erRUSda0n+FrRwtQHhwl1qgkJZZuAcmQR033b42Vjcp5iEIWwGQNU5QLnsUT+kwq+I
	 SL8gORrLV5qIQmqMmswbej67WsFVzPQzW2WI/+xvOFme/15OhhCvZX8LC4KCD8oawng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JkolMb8tFJSidUGyY2kChnqwpp2TCm0729AY/AotZ6o=;
	b=uwA5YMc7LFAbDoWqy36P02yK8riy0mTVgBe/BraSfSdcnnDfsiBhFMyfPV6l7BXuQoKf
	 PKR2JoVbM3t93cUN/4PivwDSqA7MjwaAxSsJok8be7UKbkdTanvdFVTwX8GHKQJo8BbMG
	 WJhsY7TD+7nPI/nqt9tF3tQM7J6vQ1iLlCuSVvJnMD7fT5U2pyMG4H1Mq41GVbcJv0Ppq
	 L2pZAt6DqB6EJ6xm109ZEYntiYmxPCpNXxLYxoFcSk//ECZz7fa9pmaBUcmfuDaQg353k
	 jLG3tb3+W9IG6dqOklktfdvuJdrXuikdcYiIl34VHTtjd2QMqlMez0G/D1+2o9hihgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfplylRo;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53A0606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53A0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfplylRo
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1073560eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204679; x=1794809479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkolMb8tFJSidUGyY2kChnqwpp2TCm0729AY/AotZ6o=;
        b=OfplylRoXH6zxkHdL811mTnHG1rZdYJjL1UcZLThcV+XmWvQYL4ogoK/zr1hb9sGIo
         ceYnn4cXghVQFjG77gaIyVwaJUz8isqOcypuV6iWqxcvSpbqtMBCyJTsTl/3YCLr10pk
         DrST9Xfqhp7P1pdZUuplHwm7emcMy0r7CkTs3kJRFqmIb6Aj16anRW6AMlBIAqTaOyiN
         0hVnTtctIONIf0zDd/5DbeR4wDq12Y7NbW06FKYXagBs12se2OE4Mv6v2RgAu7lco0h1
         s8MPJmlfz9t1mMP+gQmRMegX1yq1ANlxvieenGqG9l+JcEyISzYlrzk7/8gxoQqjyN/C
         So8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204679; x=1794809479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkolMb8tFJSidUGyY2kChnqwpp2TCm0729AY/AotZ6o=;
        b=cZW7gcHleI/N2+fNN3L1DzeBxBgojJo5w8YLnNz4AdrEPaq9P7mTReI0Iew/fJ62Cy
         cYxYSkrRuF2hLVzEe98zm4ISAHl9BUG8EvnCMWl4fcPF8cnMtyTrt4JS1cGZY2sS4tcn
         t2v7o5oWHYyx40ED6xZZSwB2wysWSs6YIKeJ8Pa9XbzJghmjCQJVQuTHEWFcmTEVutPd
         M43zguLcjszuZrfWMLGmn3wh7b65huwabitG9Ym42cyzidEmjD8w2t564/WJlTkWmyOH
         ElOZVQajGIU9h81iqpHA5xvIG0M1NfDHK9w+/TkDA2F56McomVPJEE2XDTAm8GyCc81U
         z58Q==
X-Forwarded-Encrypted: i=1; AL+hErGsSAkjgJXJTgkdD1vxDgOtfmJYyhddPLvKhXbgYDsptS8xkCilIjDKc9asYPafR3oKP0TLHsP00vi1a0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nva+frln8X68Mt4efNr3JRKCJEHKurloDTgxvh4ssy8QUrbpf
	EWUZKIXuxpL7nI9speNQgSGHzgovkiV1P58nR+mLHB1tIL8WEy5B0l1n
X-Gm-Gg: AYBFou2MZCQr8OfBd7QremDJEtidqZCbOHPPDPcVnZF0CK72EwYAZJvYeLBO09u4Z+m
	H1YO/dhSg4VYBGFcl6QoRpgZlj+n13Z+LB6qs1t7fictzInwzhc+F4sYpU0yZRd3guys95X0FwU
	dPc2p79ys8QADiVbD1o9wpXf4ZrKIHh3OcHjtj1nxT5w5+Q+uHFQF0Fy+JEGoZtvKU+VByzjlSY
	OurNx7x0AWf2JY2oBuuAL6nKX63rsS/VgXxwloOmn2K97jHpCf2eiA3Ol0t4N+5lHZFvGsxeqh+
	7wZwocHd/Vs5HAsaublPvCzUpW8U74eKF20C59qE0BPaDTivuEVIPxvza6ZQdJP0FRWDCYmYuLQ
	UC/Yo2yd4I63Dmhk2bdY5ecbsgLlJS1V+bDLWOBEgrM64eArkZQNfzB3aWeJPclmzv5YIWxgAr4
	C7pW5y69eSx5Q6WAFbsXdUnS49m04fzph3AnpS6hXRIAxzaXMA7fuG+IkwdQLFUQfAjZrHql3cP
	mMHZAMVSkrNOHIyMgT43CpKrzO5lbVP2MB8Zl2wT8GsgxvVQQRGlSu30jpKU3zDwkslw/FTKHce
	1GASfDs9VtExFt+DvMZ9BESsO7sn+Gl5WeKYp3+Mgd4Sh8VHmOG93bU5Ig9ke7s5prJX4BNoTe6
	Eon+IOS3gbxQTtwoU
X-Received: by 2002:a05:7300:268f:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-37256bed4c7mr5983858eec.19.1794204678753;
        Sun, 08 Nov 2026 22:11:18 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:18 -0800 (PST)
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
Subject: [PATCH 07/18] HID: logitech-hidpp: fix off-by-one in G920 force-feedback slot tracking
Date: Sun,  8 Nov 2026 22:10:51 -0800
Message-ID: <20261109061103.2887636-8-dmitry.torokhov@gmail.com>
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

Logitech G920 firmware reports 64 total 1-based hardware effect slots,
reserving one slot for the built-in autocenter spring while allocating
the remaining 63 user effects across 1-based slots 2 through 64. Because
the driver subtracts the reserved slot count upfront before sizing and
bounds-checking its slot mapping table, the 63rd concurrent user effect
is assigned hardware slot 64 and exceeds the stored limit, so its slot
mapping is never recorded or released and remains leaked in wheel memory
across device close and reopen.

Keep the full hardware slot count for table sizing, lookups, and slot
bounds checks, and withhold the reserved slot count only when creating
the input force-feedback device.

Fixes: ff21a635dd1a ("HID: logitech-hidpp: Force feedback support for the Logitech G920")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index a1a69705338f..c4c878c9061b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2865,7 +2865,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 		for (j = 0; hidpp_ff_effects_v2[j] >= 0; j++)
 			set_bit(hidpp_ff_effects_v2[j], dev->ffbit);
 
-	error = input_ff_create(dev, num_slots);
+	error = input_ff_create(dev, num_slots - HIDPP_FF_RESERVED_SLOTS);
 
 	if (error) {
 		hid_err(dev, "Failed to create FF device!\n");
@@ -3480,7 +3480,7 @@ static int g920_get_config(struct hidpp_device *hidpp,
 		return -EPROTO;
 	}
 
-	data->num_effects = response.fap.params[0] - HIDPP_FF_RESERVED_SLOTS;
+	data->num_effects = response.fap.params[0];
 
 	/* reset all forces */
 	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,
-- 
2.56.0.506.g506a7eabc5-goog

