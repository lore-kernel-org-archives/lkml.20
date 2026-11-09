Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204683;
	b=1XBdX5Wri8DUry/273xNMrnnceOBa+LW/QAryEdUI8UgJeoUVwTF1o5AEzd9UXNKeD8q
	 I+rIPacfLVqtChLwqu2Tu6GzF6h8HYYPQnl+5+34tZ1X6yksjAjur7gZltzTYvuhvZ4EB
	 dfuyhv6e3PdGiUvchiN5dbsVI2O/Dcb8Sla5wXS8SYElFSs7DbOuIYRRiLsXD48HAxcEb
	 oesSSbsGK2Wbd0qZ+lAMoCRGFcpnZbncDNPiRmK1b7altDgch3koCx0TNmB0dm+eIHPeA
	 bhSrsQzf87BZLZA6Rib2BtsCeptrsWq1iuCcECXWAJJryKbNbhU3AGOkWlgBQsY+E+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a7gqQCE7m2HcC9JXg0W4AViJmVsQ3/d2B0qIqfzhxCs=;
	b=UJYfTduv6mQjBDGLVQ9gYpAAe56hi6V4CKGg1XfWSp9hdBawf1HT6S8M/oYfghgWXrzt
	 Y5gM8l1Gsthj+mLVtf6OLjbjae0aalz1opCAIq5g6nNYp9059z7ZQBtgBYZRt0RD9VY/5
	 ma8FQNTEb5rQgvKOTm4wkorjR3H4ovWVS+zF1AEa+tBFb8VBWz/N+2SOk5QAa0RMHWh5P
	 PZCmUxladA/84iNH26IFCajZXq4GDehnlUKJJ88/wLkPfuj3wq26hgL4X7q5D/Ay0VqlT
	 YTDjyIPC+hn4COkpQVXmnyFDMLxCE14oDKeW87wtfacOEHlNx5n175JAgU9S/4aa4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijQpypUd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A5F606D82C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A5F606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijQpypUd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1230808eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204683; x=1794809483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7gqQCE7m2HcC9JXg0W4AViJmVsQ3/d2B0qIqfzhxCs=;
        b=ijQpypUdFVKiGv+vQLOqzPulMs9nwKZebdBfLKi3prmngSfONCPy9LKCVKay960cxN
         QxdHyXNONs27fF5uK9vOAzKfph50ClbNcgxvgnoa7gU3uoWOp0Qh3xxCxFE1ZfbfuOW8
         qUuS8FKTLY4pkpbXd/KTn5wWTfulmeNkbd1tRYEtUYI7UWQ1ofX8Axwtij0PFjsNrc2k
         fFhhvZ/r6iyQI54E4G2iHfOycqPvuK+YqQoNDjc9OWIW1zIHPEvc6HGsiaCfwc7TGulS
         hafcagAqe/+IPE+GHRniso6qEo+olSSaHptgrbugY0U9wdLALkoekbT2C9zEePEP2WuW
         Lf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204683; x=1794809483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7gqQCE7m2HcC9JXg0W4AViJmVsQ3/d2B0qIqfzhxCs=;
        b=za8mcRPddB509CWB/khcIfKHOYKSfVB7TO4t3kaBEaQEMwK/fOuc/piUiCUoxt8l/B
         kimcD83EI55IePhXvbH/ixZ2J13Ypm016rhC4U7rzc2cv9ocslg229P7FjI2CpF6ARsW
         kYUG/8Jg96kUN0gH4HkFDhqnM/Kn0fmnQCN7b7B95KqQpgewMEmZuNnvxVtAGIFioLrQ
         QH8oMyx/+UmwaSdhB0XROgbgIa2zxJjrOLzGlOWAR/L89OFYQDnNaZpIG5yAskEqQYrf
         aS8jhh8j7oGRAcNl/jNlftgfrr9bPVwWhndfzOwz9ABSI5HJkskS1OPecRem/xysnWVP
         FjUQ==
X-Forwarded-Encrypted: i=1; AL+hErHwsqXmspurou5sCv46742xYgEW5vszuroL2Rzvl+FRtQZbTuy1eIouze0C+w5cjBhcmS+HbVgh+2Wev2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BBB8WWpTMTy6QEOwW0h4iaHE1UJOV8HYwXma1bcCgumji7N2/
	p27arS5uDBPhHm47xlXW1/QX1njahuVRv7WdisnYdJ4UXdMlXuMYFZPD
X-Gm-Gg: AYBFou3WARAtlmOyDoMVsIcEFfYRlDbv6B71DEjyJSsvc6ZXYDXf8xq/15hNfGd6zBe
	St/EcSJeNXYx48lYdcnST4ScD2gtdX1l6bq8jcKgBc/6QFGuIBJnSGum6jKadOGyyn24QWOkyaz
	yJx1BUvhrXSg/BeXIypJD1aIP378cwc/oHf7RkxqCeMBG661MIul1iQVNZbUf//hydCJxoZ48gE
	3fa/8FgkMKZB1lDvf/3UJMENwxXDXQ6FtTEZHLYa/qeizlHqV+owx9Jo0ZZ6r3y4CPPC2AYo1Uu
	5tUFunVhq3Ul5K3k+qYxXjwsZ0BhGel1lVF79rqCSYzTwNIp5wifsfkwHY+TNkuG3oc3UlfkH4E
	etvzkrnBuYhy9cPRYKz9PggxvKD0O0bkelvp9Po593QUdc90UycCU7IYehLpnnuwW/dCvRYHrxg
	kFTsAbnYnldQZLjVPLd8rRqwraXMgulK8MxqS9s827WPR7I1QIrykY6Gk2+Jedu33t8+TZni9WP
	e/PezFdouif2tECScPWiXvaMo2SSPUsY0DWTc7i3EFv8n2FnC2ezknKNAn71ptCjNNC3N3CGp+B
	RB1p5eo33MxyF6QVIJZZmFfpZCmuu63qzfhbqsoGFbiLNIb89EwH5bl3bIdlS3CEx8cCJGOMJ+R
	2kGF5gKR1JYMnqqec
X-Received: by 2002:a05:7300:824b:b0:369:d6ed:f2b5 with SMTP id 5a478bee46e88-3725f013280mr5779318eec.39.1794204682322;
        Sun, 08 Nov 2026 22:11:22 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:21 -0800 (PST)
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
Subject: [PATCH 09/18] HID: logitech-hidpp: use sysfs_emit() in hidpp_ff_range_show()
Date: Sun,  8 Nov 2026 22:10:53 -0800
Message-ID: <20261109061103.2887636-10-dmitry.torokhov@gmail.com>
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

Formatting the G920 wheel range sysfs output with scnprintf() passes
buffer sizes manually instead of using the standard sysfs helper. Use
sysfs_emit() in hidpp_ff_range_show() to align with current kernel sysfs
conventions.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0a82914ea314..1ed940352fd2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2784,7 +2784,7 @@ static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *
 	struct hidpp_device *hidpp = hid_get_drvdata(hid);
 	struct g920_data *g920 = hidpp->private_data;
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", g920->range);
+	return sysfs_emit(buf, "%u\n", g920->range);
 }
 
 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
-- 
2.56.0.506.g506a7eabc5-goog

