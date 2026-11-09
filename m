Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204696;
	b=BgWJGoopDz5Q3Qcc+1CZY+Q+il1KCBVtnbDkOVjRBCUA2HkdUWghVPgYo7xDFo8n2ahv
	 GU331iEQQ+4OS6TcXCfskLUv51I+/VXYS2P1ZSdTLJkXFw0AMvQ4mg6Hz7W4/QLWXP3F4
	 iIMFx5CycbBnl06nBRTYWiOg9jH9RPCstLs7pM2akGwnchxJxKSEjGe2j8X2xoRcKNwSj
	 SFZ0fvWxdEa0hldA2oIFMpyF1oNoLZiV1nG0gjqM7vvRjxUi2tOLYuGUWdKkKZpS+RGHd
	 Vrhg6CNblTt0+pMYdJveSfN9ff5rbmwmOz3LApbLrLL1/PqhW42RHIHOvPNbmEKB3uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MVofIXRExu5WXM840EB3nQvSdANY3ZBB2XNgoi+7ewY=;
	b=FU6B6FW8oRtHp6a2we6WvlP2kDeTSMghWPahtszuo3TaD8ttRnTDgiimGIqyhRyu7bUK
	 b8aaz6L3toe0R5ZnzMRsHYcSILTJiynufaqDaDlSdGBU1DmIZeGd7fruLVzKmqDozA3Z/
	 CvBfoqLr6PxU1GZcfnuMwfBgqb3uKgbZ/ejb/pIA+puEp2Dt2hFNvlicwVKBVJec76YnA
	 K7FpH61f8zMQRHWgQjU4qMCikLDGaMVCJCdgKpxU5fu7GPchUhEjZSM6WBQqU3n5uEEgH
	 jMp6He8DoOLJRDhm0BR3XvZnXAvNSt9l1olNJbYV+QY1YYT7zaihZaGKr77Jux9VWow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFv7XEw;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70BB6082BF0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70BB6082BF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFv7XEw
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1aefd1bf74aso416924c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204695; x=1794809495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVofIXRExu5WXM840EB3nQvSdANY3ZBB2XNgoi+7ewY=;
        b=hVFv7XEw98NrbNshaja9Osj4W1Sr7vtDcJmy6W06uOPwuz1RQS8BygFJArhFsmvkI6
         Q2zbCoOuNw9wKzdaZ9SQ9jgs2Z7UisUuB4EaMk/E+nTqlMrdVDFCO0wQrVxshTfHi/Y8
         zC3Zkdkp3i28n0KzEkt0d5Cv5b/zWE1JV2VSYyoLBKBuHgNoy7cb8PGuC+e7IhcocRpI
         UgWw2wHpqT1aHeA34MR43OCG5Jt1p9e1DdX4ukfYtHMPK3UexlMhFiiu+kIC+5Cq3UdG
         JxFoda5KqLVHMaXnBm8eG7osbjXy1lB5msL+KqzJPXdpkNc2SQpengx82gIa2TQHm7tI
         kKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204695; x=1794809495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVofIXRExu5WXM840EB3nQvSdANY3ZBB2XNgoi+7ewY=;
        b=MyKMu18a0kT/HwfJ+5LYCtVwEBM5vgbBuKEmBrHR9b3Kek3ENqy0N0hE0Y1xknzedX
         3FENnXstcbFCSyp1TMuBbd7gyJnqEuu5XM9HF7d7WN0mnjYkOmkQw+ayILDoLR+WeCf8
         xFjWiRuU/lPSlMEyCzGP7y1ZYpxEbZa3dq8jB0FjIiLEA7tfwWdkCKpFry31weuC9UmZ
         OQ76CrVpIPebqhgUeknm4ck7gtdVL3tvIK+Jh9fcwptJMXcistV6PeDJU6aePtJdeQMC
         KCEcTXmSrZkiBgZwFK26+/jpkWOlsNM70ky9Wx7oX7hrOZAWtfi7uVOSB+d3/P4pTDPj
         J2hg==
X-Forwarded-Encrypted: i=1; AL+hErGUcJoFlKqFKvhp0ShK4gQnsfpuhB0xO15n4SHklQSqcj5duiM7FUTcgAl1Ne2LAH25XAhRlZJI/JAnNVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bvcQ2UYN1c2v+RBB+h+i2Yq98EnmyC2gnZHT3+GfjolZni3UY
	UP8PO+J+G+gNZrM3rcYuH0/3MAUTE7LqWheH92IrFjabWUUqIrPNHMue
X-Gm-Gg: AYBFou0AOZsNQ9snmlTIUpphSv0QEENddPydFLJnOgn2orAZ77eRhSHESR1jBVJrKAa
	jWa1cX4MOLbKCrQJpeUJUvWH26l2HjePIvoDjaH3spzBIKlO06l3am7OdxG8Ns+f4X5cTIxBFg4
	2tCg7XF8td+D2TYtuLnlivxWXIBck9UQflIzgDr6hgzBquspaUFafWJM52Rny74w1lD8PfA6AH6
	MZvh2nnTZlSMRzmxz17piahe5rGOUIJNLck+AxzpEMGzAYhAc6zXrv9g1MnQ+cgwqjvckusTpt5
	GSi2gTzYRrd7VSBOZkDsXUnU8u+lA+hzXCk7uhUw/rulChPfZMWutpd+2Gw3ufqXTka+Km0Zh5m
	akxriLi7ONCAvNJhhjTONGPbfWKL0kzBwZMUFFneEzpm5qaZdSxCilcR9RvPx72tvIq4CnncC0T
	GkJ6Kv90zl3zblKin3yQIYA/1AqarV89dQRGzza2dwFwsnk5GQd4+Z5duXNT62xHaZlPdIEd/Us
	9/Ax/TMdVfXe0fDCaYiTcyCIDjDU/3ay8QoWb3TXwUtXT+aa0mPw/b2C4uBlG8uY4Yk1CpTMwpb
	oY+okmZpN5I34T+TyJtcZLF5YrjSfEdT4JdU2SttfBlLQjuDpTQH3pB7qVKUUGrZVbbGfoapUc9
	R2zmIfC1ALOYHjSTHW7Vqt9zQvIPid4jdZ1lzYg==
X-Received: by 2002:a05:701b:455a:10b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b269b37232mr8648978c88.23.1794204694674;
        Sun, 08 Nov 2026 22:11:34 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:33 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/18] HID: logitech-hidpp: use alloc_ordered_workqueue() for FF queue
Date: Sun,  8 Nov 2026 22:11:00 -0800
Message-ID: <20261109061103.2887636-17-dmitry.torokhov@gmail.com>
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

create_singlethread_workqueue() is a deprecated wrapper around
alloc_ordered_workqueue() that unconditionally enables WQ_MEM_RECLAIM,
allocating a rescuer thread. Force-feedback packet submission does not
run on a memory-reclaim path, so allocate the send queue with
alloc_ordered_workqueue() and zero flags to preserve strict in-order
execution without unnecessary rescuer overhead.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 7f5de4caf118..d0ec973a4b49 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2870,7 +2870,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	/* init the hardware command queue */
 	atomic_set(&data->workqueue_size, 0);
 
-	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
+	data->wq = alloc_ordered_workqueue("hidpp-ff-sendqueue", 0);
 	if (!data->wq)
 		return -ENOMEM;
 
-- 
2.56.0.506.g506a7eabc5-goog

