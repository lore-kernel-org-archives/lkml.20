Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697737;
	b=uVSwpghMxALBQOjUv7kVD5sC7sTMWVbFlm6Je1pBRfUM8pZZJayRYZTGN+RSfARbf+2A
	 cK3tbGuY+fs0LL5WZyY2sc+dR83IWmB+kf1qTegTYLISKSV0X8izcBgghSWX1cP0gtRWe
	 ByXyXfTZOmmh18gkFfxMR2RTJD6G2I+3wVSxvNX3GgVxEIY+RaPYV8HGS6BmDJnJSTmA0
	 TXg0lfZl1Sw/f+fTKHxHE2mMNDduD6dEDtK1rTyi5FqysHZjJ0r/YGTllS2YG98Kp8IlI
	 45Ga9gBarLrH4XhBEPnhRiisUN7QLAPEmAl+y4sjbV0XEpcAxL5/lsfbVkk8fm3g6vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxveAn0EG2iJi9Y17MjWE+pFeZafxnDF9/Vb19n9Ewk=;
	b=Bd6SvaanDoE8P0uwvV5/4mGArf7Ii+nkwnRoe6+qC0SuGCOqd+um3W54pn6VYbPYnWgr
	 Lr/B0DJhrlPHIq0GV8bDizpO7O1nsddyVDdQd8HP7NRgR2dmkY2dIQItqr7Fz21PCToGX
	 9z6JLB0X0HyYwejz1cwGKCLVZFKqEeIrCIaHdDfUw9crcSIG+jExJ08RVU2zyrs/LN8ob
	 P7uObUrGDIFo3mDXr9iouwOpLQPUzVLeHpewuBnjSWxhk6eVysQ3IJIEi/deCL3joq+QW
	 Mb5I6nT0uih0SCpNyqwdPxszaE2/MT9JBUhGz/WyRjEr662yLQBG4EZCP0B7WqqjlNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxtJ4nYc;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0460A6F7B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F0460A6F7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxtJ4nYc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so1471942f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697735; x=1795302535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxveAn0EG2iJi9Y17MjWE+pFeZafxnDF9/Vb19n9Ewk=;
        b=mxtJ4nYcD3JlhG7YDutpAQpj7FaeOIgaBQzUDovzeWv4MAbcvmdvn2lQ+aKk7Po3G5
         /BxoS2VZ5fgpggK0Y7jhBNdDAe7Mp3WIhZJBn3jEM7F0CF32A3TZECkAbaqkNN0YQxCa
         y7iEpKP8aZfa4yI6ARG2t+cxi9s1NH9exiq//CyjY7wOzyRf858LQ+O053LkjfNDTJUD
         MRPpI1t/ncVOfmBFHi9jrOnogVHDbEktNrmpigNSQ6vTxNdleitT73gxskCzjzPwcKe5
         8D4EpfcJhzlJ9HdtVyXqWq0cggrGPV+0bR2Vmz0SCDBQKYOJSNMufDQi+HE2JvrZbSK+
         AFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697735; x=1795302535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxveAn0EG2iJi9Y17MjWE+pFeZafxnDF9/Vb19n9Ewk=;
        b=dNX85u83jtw0ntx2y5yvWD2LSCJDxOlqY6WPHut9nrC/EGXUrfTw9hlWtw8ZfSXqvb
         8gVYv+4/d1kwXJTGLcuVP0XtJTITJq6Axbt6LJdo6XgmvvvL/kJm97qr5hJm+I3i1q1T
         QkIK0nWEiKLmev+AfcHfeuUzhEUAaIjktyQe2DsmSYBd+05xNb8aa2Skiut9Mu0wxtQv
         yH4N6JRs3Jw+Y81WbaAQkaRzbf5ZEWJY3bdXfvREhx9rJ14evwfJmqXrQjdUMCV+SOrY
         sORJKqZdh0tr5RYFUm0f5BMKwaO8SL/L64uH0Yd4yLU+i7wv/yxZpD3vuARV62akriQe
         WD6Q==
X-Forwarded-Encrypted: i=1; AL+hErFbSyzmvXenJw5ILv/SCyj/EYV28ICn9M5eGs3lci8Y4J3Z74qrqmVMaQeIL40m9R1m9FoDa5Nu7Uxvfj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xS3tHbvYoGLVHexl4pHW+NbiVxLQ3blQJZ4RnCaCcqetStEFh
	WDDLXlBM2uPvK21SgKtt31KRkUNkENIccPzd2sxgFQwvS7mgo43Gze12XtIQd/yWYDU=
X-Gm-Gg: AYBFou0TodsbkqCcKF+bHXtsg00AAm6YV7r3L+3zoDFJJr8iwUivYdPiHSdnO73YocF
	vzkQ3zPEgaqjqFQWWiT86o77J5G5TdQRy8xYtECBaOHg6pyLFTfKS4z2oduVam4ZRDzaRZpgecm
	lq3rrUpucJN7Anjhi93kw/lyKUe8Kim7/EpWIGWqYuwgdeZre70/c1IgMcKpwZUPMLPzqCee2v7
	8gG9Wf3jgAYikl++nts/vFxSq77YITScFiI9a+b2hjtRcavAvqkugSFLSZmMxMpKnRb1KgDo/Lj
	tfSlI9PjH2KJufrMhrZr/hE5j+i+Cfg2JRMuoPs/+H6uQmot3jFejuGhOqCiVtVRiGFfYMcVEXj
	McDm35VY0yVry5R/oCIJccRX1VfP4Q/UY4qzZIe3I8gDe9yU60TIteem6cc/WX7h0yUBW6TQpxI
	Y1p9rpy1e53sm+zwIRbLNFVZczRjGfIMQhw8+vL4wCC+1UMAkbOkNUKTslAquovN8pttmYqPoky
	qGKn1eZawMouqyCpCNBz3BvxFVuBYKZQKFtyR0oklGxorO4C2a00xQ0VZPbQoniPPoZNR6wK6Dx
	i7lSkX2ygrbeggQw0SyNULf/N9J32wjBMjwH0dMje3puzzNSaA==
X-Received: by 2002:a5d:6f0e:0:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-49b01734a32mr21424865f8f.6.1794697735316;
        Sat, 14 Nov 2026 15:08:55 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:54 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 14/16] HID: ft260: i2c: fix i2c_reset sysfs store return value
Date: Sun, 15 Nov 2026 01:07:58 +0200
Message-ID: <20261114230800.1344401-15-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114230800.1344401-1-michael.zaidman@gmail.com>
References: <20261114230800.1344401-1-michael.zaidman@gmail.com>
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

A sysfs store must return the number of bytes it consumed. kernfs
hands that value straight to write(2). i2c_reset_store() returns
whatever ft260_i2c_reset() returns, which is the length of the
feature report it sent, 2, not 0. The "return count" below it never
runs, so every write to i2c_reset returns 2 whatever its size.

A write of two bytes is right by coincidence, because the report is
two bytes long. A caller that leaves out the newline, as C and Python
code usually does, writes one byte and gets 2 back, which is more
than it asked for:

  echo -n 1 > i2c_reset   1 byte, write() returns 2, bash ignores it
  printf 1  > i2c_reset   1 byte, dash reports an I/O error
  echo 1    > i2c_reset   2 bytes, correct by coincidence

Return 0 from ft260_i2c_reset() on success. The value is discarded by
its other callers, ft260_hid_output_report_check_status(),
ft260_i2c_probe() and ft260_i2c_abort(), whose own four callers
discard it as well.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 391128e4bb35..80b300893658 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -615,7 +615,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	}
 
 	ft260_dbg("done\n");
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
-- 
2.43.0

