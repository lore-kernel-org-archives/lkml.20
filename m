Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385733;
	b=hMik9BVA5r4qRg7vKIUWDz2Tcogz8jD4AxHZzF2Lvu5N8YwdJSowaYkyvLYbmf9ier73
	 lp5HRPwpIoKHWED3azFgcKBVEkdFk3UD7ZOE99mwV0QCEE3FtETdohpXhq9maC1cde7ws
	 F87OvrZzxvrswbdFH5mbXgmy1h8Qko3zp/BkgXouT0JFRT3+599MjpEnjNnlJnImWCyfh
	 atav8N8WPF794VPiam8H4CRylxnpzQ5iS8mC/vgLcYjErWBomnHhRtkESQt/wQeYl+OOE
	 KV/Q2GmkctAz2SN7xkqq/VVshTkFfcLV/39rnWWtdtB/4FRD0eyjrwBHwlIAx4YtEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=COi43T72uSgvst2Ku2s94ThMDdsudgyv2xo46Wd8h14=;
	b=fb7za05nQv31R3cZikiai8uwceOk4cFNo8ou+csaN4SPSV5E+KIhFbYUh9MSYr8ROIAV
	 FXFulfOVbOPA/LFStYjwEOol7bodD09p6+j+IBCsbdXlJCFGZmMyPDcoiRB1QRGTGXVUs
	 uiqkFLXU7WyS+vNG4zPcj38mP3vysSDDN1stYHRYm0Mxf8ZEqJa/BK8AeQ977IQ7z0+b3
	 g3oOgbNchTo6j3k8jIw+NYDvYjA1fAdGlpXVnvmzAMS84AowlHmuJ+HTtxz7duuYsR9Uh
	 3wNGg2TxxCMBfsZ5lnztr3HnrPzyGFVfLqpeY114rqIXds/RzRmK93hCv1cO1+kSQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0qUeLFd;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FB160A2620
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FB160A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0qUeLFd
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c49c32650adso246461866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385731; x=1794990531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COi43T72uSgvst2Ku2s94ThMDdsudgyv2xo46Wd8h14=;
        b=v0qUeLFdqRGQ75zbwL5zPUxsSnPAex48KIgU4LR4aCo/yqYvk0sUcZVI9a1Lv043fb
         7gEP2f6aEg9KJnb2CLtb5ZgD7eSIB/80zi+FhXJr4MgY/asM352E4W5wMOFuf8xPfD70
         G66ivnoaRCjtwjr9TXVPRxDt3kU1XGSkMik8bcCks7MVulKoBHllHGFhuj+4zRRlhE3f
         RpdC6WLyjibKrt49xsLM51X3r0kKkfEKPpgy1bNSl3i2pljTeJArG50cBnScFrBmYGlA
         MAE73dRr4XS0nGBLPM/zKWAlowzlpzEVrvpdczoxOIz/xZVX3D/zTS4O+Kt7wSXAq7/r
         ezJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385731; x=1794990531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COi43T72uSgvst2Ku2s94ThMDdsudgyv2xo46Wd8h14=;
        b=Babo0Iu6rxPwhAynIuW+wMy/KERgPDPdvypTIIe6GdM6zNTuL64Q7nQRmLDSfEA9e9
         b9ZYtuAs7+uKchhCy9gpkYeiglmwyF6hsL01c+Mh5iHQ3gUZtjq2lYEg8qWA7gny0EgP
         WB77hphstwuhK3Q0T8lU5Rthz33u5SvnDwdnVOlUwE/7GlgKiGtMUmDE9N+R3b5ny1Wk
         Y0GTTNy2W8Rh8SLlOQpF776Ug8ee3nABuUPwnk34fw2w7x2PHz95kEm13NJhh+W8N000
         dcJIhVnP1rfHYDMPLggFLTaONW7n9+t+5lMEv+7PKSXo5lib6wQHDTaHPiSRQJ8w7ue+
         AiRg==
X-Forwarded-Encrypted: i=1; AL+hErGqf4HlsJIi2DcTigKDXfK8rit57xn9nE11KlflYqBQN/czxX3NJd/R28aCo95Z9xw8kLw9kittUwV0LNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z91FtsRPQRiRBTewBllNt8OhZElcnIy0odKCSDTUdAF/YAoOfrS
	ctKEkha3tgIE4/T3X2+nwyM+FVpnD8YuqJLtXhyDVrl9wIoPJihg7M0k4CF7FOBb
X-Gm-Gg: AYBFou2NRu+CwyNu3r/fU6pI4PvLbar4InetEG/8/j0U5enhXZJm8WGtIfaYQUxBzcX
	CUFJPJmEB0TTTxSR/mY6lLJLooVgWW+6ku24/Klnav3dyBxvTfXxWcKG2ZN2VKBLsy7D0qD51zE
	HScDCG7OlvcX4+qY5X6GTFoIX0eV58tISEDDZablte6FjWQjcoaRYqB0mmPwKdUg6q9chL3bScy
	XleKsAOehNWWma1OB8Z6dlZiN7QcywkEMZ6hTXT39Lqc5C4NPu4TLuo55ctOk66CrWCqu/bZXqm
	hf4z1aLY1/fMn6GiHn6XTDxa98P4yRuTh29OSbwupxorAG1TdmCW0GyAGvBaNicnM4eG8s1Mpa+
	YMWWG0OFO/3CMu0oU9jlePZZUJDyATfJVqYosT3SIcNLGopYMCeE0dPKounFnvQI6KXo8dd3Y0+
	+cPrKgqev5k9YhMmNiJxWpZpYveVRe8DNogF7BNIqGY8bzheMXhK6YQ1Kih5I3LgiWQzsYeLJbt
	SMBUj2DrDco/O27Zl6vRjh9hR2eh4RhUpywUP3ZPm55JkSnf3t0tjF4rddhJEZPnxU2jelZHBzc
	2SC1rqRQLse3UKwf9T98zKHPbXeSINWd8R92YyDXcq7pPdzan+RKBFO4arZmP1KUKg8A6o70Z/m
	zQSELFu5qDgsRcP3D1okBOs1v/v9qR7tqvg3UYBgEE2IbUp4VVHXeQb2GGGxKCbtNVV0qj+BQi1
	w84CyHmxaXZihXgs3uTlJwpn406zUp4JxzNU899mLgOjwb
X-Received: by 2002:a17:907:96a5:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c5066dbc955mr119859666b.48.1794385730957;
        Wed, 11 Nov 2026 00:28:50 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:50 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 3/7] hwmon: (nct6683) Enable fan control on ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:34 +0100
Message-ID: <20261111082838.1418051-4-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

The NCT6686D on the ASRock B850 Steel Legend WiFi (customer ID 0x164a)
uses the same fan mode register and configuration phase as the NCT6687D-R
on MSI boards.

Enable fan control for channels 0 to 7 on this board.

Tested with pwm6_enable set to 1: pwm6 written as 255, 120 and 60 gives
803, 577 and 342 RPM on fan6. Writing 2 returns the fan to the BIOS
curve, and so does unloading the driver.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst | 4 ++++
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 4c137eda6583..026515c35243 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -57,6 +57,10 @@ Fan control is supported on MSI boards with an NCT6687D-R (customer ID
 pwm16 control the system fan headers that are present. pwmN controls the
 fan reported by fanN_input.
 
+It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
+customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
+by fan1 to fan6.
+
 pwmN_enable selects the fan control mode:
 
   * 1: manual mode, the duty cycle is set with pwmN
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index d43dcf90048b..29fbf438c04c 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1539,6 +1539,9 @@ nct6683_setup_fans(struct nct6683_data *data)
 				data->have_curve |= BIT(i);
 		}
 	}
+
+	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
+		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
 }
 
 /*
-- 
2.53.0

