Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C923A562
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122483; cv=none; b=rkNac0beeuseLgP1A5MJOMfFYMrbncHmiWLJIgRgzVptBpa5ZIcPDqFfk1qmsPtysvvjCTaaAz6tB81JCT7qGn4U+Ysk6PPTbi/3XYlzcrgc75Q31pZKK1ACIyax6dhTTzlsXKxXr8t8yT9Luwngb36MQtfJ+pXIKLrY/gAdeEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122483; c=relaxed/simple;
	bh=kKxpjMyiHK9lV9OtcBaphCHIS0puTCLcWrgvqpO3mqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSCk901HqsRlgUFSQLygqp/VgEkcmJVMQmGRu4uxWDXASiwm+88w8v5G9uS3kmUTnyaV6zSg3po2UNcTWLzLALUBRoZBbGs2B2GAflARymIG69v3GAM3mpQzvBmrEyoxf6ikTeGxbHfPblxxjhKZaH3yIjZ1RHgJogbWYMo4u1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1jBLwA7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1jBLwA7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1124605e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122476; x=1790727276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=M1jBLwA7BqUBWNgeep3mnrL7hq3utgb5eWlkQ1TUK9mVpJUTud4KlxJ/7VcTH1Gndr
         Pdb/icbgeYg9xBYnJsbfy8jfbl8q5hL3TkAbm/VfzX/cGZWZcn2EDk4U8zVPygMxYkl9
         f4rkbPCsQGHKx6ct1tVlticB4XVMw8aewdvJSx0rW2kNYsfsTO4myJUoe6BJAZOaDEXp
         GTT+ENDUqRNBcGhl+r41P9HgUivb3rZLVB2aKvgPgsAK9w2bnU/Ghc6kwVHCKG7efLOx
         ev8z82cYCPFAjE+/mvK585uH/LQg5y1pZ+59Me7e1s06Tqfef8RwxbeOxB6/sbxwZ/fx
         fx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122476; x=1790727276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=H5I0l2tR+q8QQvaG1fH5gBAnVaP2CTiu6iiPAQ6gXie6ZSLBjcvcukEZhJlpyvDNbp
         7PfRFniPXbLXAXpfqO2RoNvqZokFkXhCc1AETbGd22f5CTwid79UT4Y32BBKrKQ71L28
         g6bLBOoQhIq+HGxEj4RA6Cnu5ZQcG4iq0snGzz7hpJ1D8vOQBLVYY4Jrfow26Xb/ZtjS
         +h+b+NHfOpq8L3u4CFaZPzKs9gWK3Hh45bavTpKoxxILoOw205uspUoI6DZE34fS/qsy
         eLerEAgdRhhZcz9q1pZzJobBQqxbJxBPaUtrG8imm2ASsNB39swCKb9q6FlYlW12bqcZ
         CDGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRd145yOgrWCzcdmY+in862RYhQqoyPh8hG90W9bwbBS8dfsCL5nt92yCVx9UBAjGxqC9FZR3b1Awg7vw=@vger.kernel.org
X-Gm-Message-State: AFuF++kN2W8p0JxGvwzrta8fAsMehGIqpjo1ZHh/QO7yx46FlABziyGA
	1z8ICXplqcbhMsQ2xX2S6gl5Hi0zevuJhdZLuzRx6XyLUGl3CHVKADM2
X-Gm-Gg: AYBFou0KsSqoQXjvpJP4i5z/0QK2M9zzLm8El/jCP94oPNZdjYpc8VY7lAt3neJClvy
	iq+q8cYooHlxMZzqUQrC3hWKvXwBMV0LZOutuVAmhuFYzyzl9CHOuiOHAZDSHY/4kJ+xu4wZaDh
	8OkcFUVW7/0X5DH+B6G5DpfrVWO/BBsr/im57pRi1vpc+jxm/Zbk6S1B/zRJJftdUK9Vjr5AO8+
	Qy0m7vNPlnpG3xWhycjyNZQ7UoevTtjMJpeGa7MBWOWGbnZorrWOoaMBOqSDzwXUWc40rg9klf4
	F+2OtOZcCQDRA15NkRd5Df/MmvonKzOubrj3Yc7Cv8gMszdzrLj2vRMDywjRxWJNa00goDQY/6u
	dg890doteL5xdjDSyfJL/bDFFdvNKflm1fD9jLROh41t5/pBswEQIDf1jiRoYt/56tXi8zZyAbA
	ilCEzltkYVqo/tGh6ncYcAS1t/IpdpK7/wBiJFbHn/xBqrQHiXWUvOAKwdhgHqXyAFjF3Mot4d7
	HORWYB6pRHE8+cvxn9KJVGRrMN30fJpOVimMP32GAsavvY92BN/08kQhTDlKyCdR4gexwzhpidT
	a215lanI7VISkF9/eh4CV6mKhGTXvaeag1fWOkvGPFfscpsC3iU8kxUkaXnV21cPecXzcr8kR0X
	1TIv9t9kjNthG2u+j5Q3wWw==
X-Received: by 2002:a05:600c:6087:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fde360163mr16064825e9.1.1790122475827;
        Tue, 22 Sep 2026 17:14:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:34 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 2/6] media: az6007: propagate USB errors from I2C transfers
Date: Wed, 23 Sep 2026 02:14:06 +0200
Message-ID: <20260923001410.30297-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__az6007_read(), __az6007_write() and az6007_i2c_xfer() currently map
usb_control_msg() failures to -EIO. After disconnect, USB reports
-ENODEV, but drxk cannot distinguish a gone device from a transfer
error.

Propagate the error reported by usb_control_msg() instead. Keep short
transfers mapped to -EIO as before.

This lets drxk stop retrying and accessing the device after disconnect.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 4ce1afe01c3b..5449ceda87e8 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -109,7 +109,7 @@ static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret < 0) {
 		pr_warn("usb read operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret;
 	}
 
 	if (az6007_xfer_debug) {
@@ -163,7 +163,7 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret != blen) {
 		pr_err("usb write operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
@@ -782,8 +782,9 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
 					msgs[i + 1].buf[j] = st->data[j + 5];
-			} else
+			} else if (ret >= 0) {
 				ret = -EIO;
+			}
 			i++;
 		} else if (!(msgs[i].flags & I2C_M_RD)) {
 			/* write bytes */
-- 
2.54.0 (Apple Git-157)

