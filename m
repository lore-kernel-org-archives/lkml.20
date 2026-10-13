Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DCA2E888C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911857; cv=none; b=dXB97wr3fX4sHY5idfqlXc2wGIWjBHpdpP8aDhdn1IKyut9G98wSs3wtgdgGCKGu/Me00NEXFlQX9BMaaMMzQSnlsieL6EH6TydeC/D72CtQ2X2hmSTN5fBzWAvfNlmux2s2frf73jn+SrltElC7Nip3VNWAG6G5UNxCJQiE8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911857; c=relaxed/simple;
	bh=+4OV03i0EJVYJAj0s+f12i9tbSSJEF1awclvr/932vA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cepYjowt5jNCptTH6GdQ3WEx32vZ6tDbdz9jcxz6RABCrEn9h9XF5HU5gUtrKJsce9u2AJbICsQTG7Eh2utwyHtzGHDWIoTrL9nfJY9GOzuRNSUmk21PD1+A6uxbDzmmzzMmDwZ+EgOMq2j3av3XtlnrtzyN5FyeZ92RGgMFZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slmVQe3v; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slmVQe3v"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1517bda04a0so2039503c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791911854; x=1792516654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eattSOlERH03Tw84P2kHaA8gAf3HFT+7yXhlaXTMwtg=;
        b=slmVQe3v1rYwSkRLjiT4tWub0gGOGc17+s0M8X0PfvchWOFLWdh0r9CZ8Une7c3BRj
         kWBu6AJMioYjmIBf7GVnHX8WIgdjv7hmB613PX9jc2GL4AgGMWHHuiL1z4AVW+5m37zJ
         WPozao46eixgByesANgDBkoyz29HL4I3kSVgLo0Q3hTrP6GjoYm2EK9hLElJA/78XR7e
         S31a01NKsflVtDNAO2w/yGsHkgB7I2ZuC7qJANtPn+4IqL/PjsgpH7LaHFdgSevB+z7r
         oKvih9yQYgmy78e6RHs3i1OA6CFJTXxBNvGKok2ZwR2gQ8TROTEA2ANVDoSrRRBZolr0
         GF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911854; x=1792516654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eattSOlERH03Tw84P2kHaA8gAf3HFT+7yXhlaXTMwtg=;
        b=IAnI+QGU17VxlZZbdS+VZvEs0Ir4ozXLkR9gneQKnW/GHFClS4jQFeNtZTjEFxPWy8
         ao5nwVhC4lodgKZOJyiKHDdiKZ0aJeenBURktDv0NE7xGE/U2DhURs3RMl0F/eBlPYaM
         Yy7qZR13/viFNgd5VKJke3gsgxG9oiXhge8k3yDFoAlHYl/48Ho+x5CIGUFp+mkDU2iy
         MFL2TVQi5lS96VCuHMHqf+LBvuWE3fOqFfHrkRNJz+sY4d/1A07E2vmFIW8C6SghZ8oB
         94EvyiYs8JZF3wMQ7/xKYi20N2sEimXbhUOHY/4vBlP7elOKxZWbkumddyQ/WEDvRuwX
         mycw==
X-Forwarded-Encrypted: i=1; AKwUvBy4Vz/UAz5PricRIsUMAlxz3dPiwApBInFUaXYZHut2TtocgO5awt+EQ3qGlR4Y9KiGZTXX03mTgmlhO9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaxCwjHXM2hNiWP9+ysGhjqn89jrQqxVBQml++9ps6HqwplLNA
	Mzq9soTQNjT/PSUqF2r9LEUf+QTorS9c2AOs0+5jeSMpsB1ox9+UCNs=
X-Gm-Gg: AYBFou1QtAnv18qqRpR/UHLZOVTQivTvypkNVgE9zUfEqcEfRSKKKPX2YnkmxoEOXbv
	DlZ52ZBrd+Y+t1WGksDVUTkycEe/5YuHpgroxi0iCUQv6L6LZ4h4Rklb74D2sGCz45Fb1WVCuvs
	bBKQ3I88qVi0Ki3s9Nn1/Map8Oe5UTrLA7FZbtC5Nk8poD8IalVSNl9pupc1NhJpctYlYYo2r4x
	jZ8qCsuOq7oYWahMxiHNLXwkvgsPLKbYDQrTkS/AfS/Vtgatf0x+t+1vBd0L/FYavodICrU+QDt
	KzJiFyBa/76+j3qYOxL5tlnWXX48KZl+mfId1ixbQ8AMPF/1LazxjNHJy2bgu0cy6JJdYwShymJ
	yoqEpIsCwCCbdm2atXdugGZdbFH0G/lhg5sjcunlZr7dwha2E4ardK+Dbnyq7LyHDUGPwH2OUuy
	YKCVVhX2bIWbJS7F4Bk7Wt0ZKmWZrrie1uG2DUb3UN+wA3khUxq4KjrQ47LbcXtUzC5emhT6rK7
	54O1G4ipcUswzwtJLwPKzDXogo46oxvwpwdgg==
X-Received: by 2002:a05:7022:ea8a:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-16a5bf3ee1emr16409864c88.18.1791911853663;
        Tue, 13 Oct 2026 10:17:33 -0700 (PDT)
Received: from localhost.localdomain ([101.0.62.171])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm47268839eec.21.2026.10.13.10.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:17:33 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: anshulusr@gmail.com
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH] iio: chemical: ags02ma: Check for short I2C reads
Date: Tue, 13 Oct 2026 22:47:26 +0530
Message-Id: <20261013171726.15670-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that the I2C receive operation transfers the expected number
of bytes before accessing the received data.

Return -EIO if the transfer is incomplete.

Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
---
 drivers/iio/chemical/ags02ma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/chemical/ags02ma.c b/drivers/iio/chemical/ags02ma.c
index 151178d4e8f4..2219965d044f 100644
--- a/drivers/iio/chemical/ags02ma.c
+++ b/drivers/iio/chemical/ags02ma.c
@@ -61,6 +61,12 @@ static int ags02ma_register_read(struct i2c_client *client, u8 reg, u16 delay,
 		return ret;
 	}
 
+	if (ret != sizeof(read_buffer)) {
+		dev_err(&client->dev,
+			"Short read from register 0x%x\n", reg);
+		return -EIO;
+	}
+
 	crc = crc8(ags02ma_crc8_table, (u8 *)&read_buffer.data,
 		   sizeof(read_buffer.data), AGS02MA_CRC8_INIT);
 	if (crc != read_buffer.crc) {
-- 
2.39.5

