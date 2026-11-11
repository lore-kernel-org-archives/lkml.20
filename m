Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380229;
	b=G/ogGd96HHSWxZbLPMdSMfsO7bZRddIylkxQwgGJ0xWxULNTQUFWO3ibZE9+YOIZ/sV1
	 gsE5ATR6p21KRLcyJyNceOub1HxPkn/u0QI+eOhcQP01qgC3bI0YTqt3ql/n7gp1eMPxp
	 wjCkpn2obE94B/T90xGYNTTNkdm/vuyQJ4/QttSg2IVwj7CC5QMZdoahgx58BQEPl0iKK
	 aZivkxcsiSCrwLOe0JruSgCNsiPUi7FUMMzqN+UXZOeZfulhGPTzZRrhYy6U+j50fkiah
	 fHPL7cEHcof0Yd6JhSqpzlO8nVz9t/6R13xlQzXy4mw1KNk9GszNz9WcXbg0rW5FLgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wvhnAC7SrNPA1IezryM9B4GeDXBzhih+NbqStJTienk=;
	b=K3MmiD+67+pMCrOxZOYo108Vhbz6gcWSufMFeUVRCJJtgmzJyZbvhlt6NAS/gIdD16PY
	 UURxaTK7MrQX+8xvZ1q26WxTBXbZ7+meERP8nN3nTsgY9+9ywiaw2+5XGkj3balY0PRNa
	 eYTq6wEod47tC7yjXiM9XiJf1gQwDTXiDpCkN2SqLwsMCUnM3FfMRkaooQgeXuyBF4fmY
	 rT03gl5x3sctit8X6osrBZl7C5laSHOoho97zIddc5/g9rSPjF6UWEucI5E85T+RTerqL
	 e8AP98hA1DcMdBWJuNBXlUuPWIzL80SMQUFsjfG+O9yzSrDwzq7IzehlcT1jAGFDXIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4RXHGn0;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43B606E204
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D43B606E204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4RXHGn0
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so4165831c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380228; x=1794985028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvhnAC7SrNPA1IezryM9B4GeDXBzhih+NbqStJTienk=;
        b=B4RXHGn0wuxKptvyXxOkT8G0RimCNlH1mxyYQqNTyFZRstM6hb6EXUynYpBYGdTpcv
         3FWWZDn4ewlTMfDoa+sTFQP9iJi16AKgBEBV3HymVs+WvlWoaf5jgDlmE2qAgqyULANl
         DJ8+V4CJv31UAtdsw1qE791sIze4CblGy6Gy94R2GUdCtFqe2mx4tG1gYXZ++GUBzcdv
         9aFQoFp6PrjZtaBtPyHba9r1NobVDNtCS0X+xK76ONjDpxWYt+tAaRkrJEPUMAaofUaF
         aajanxTYFLhJCSimi5WP0On+1e/YMXqJqE1PhBI9MZ+pg0Gf9WPTk+W0WZOif/1eZkXe
         L9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380228; x=1794985028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvhnAC7SrNPA1IezryM9B4GeDXBzhih+NbqStJTienk=;
        b=iZFoUYHFt0woaup8I77NHfbdIJw/Pan8ELgz7i4g2siWG2PK1IDS2kY4l2tzG5nxAX
         A57/Ou4riujYd5FQwDrx5TxRFiBtWtXmzDScnbgpjDTLdc7oDfCTWMD+gl8koIKnfe4l
         J9xucrjlX126cFsGCViIZjyHaEM8CIzm5stQhcP67eZC1PEMke7ukI3lOpqPRqPELNm+
         XrU2FUCRkkMg58oaX06sq1nKR2OkHgBrB6x38QMp8fCTlhxDZOVubRKfLPu+QULJaP6M
         I6R1Axsx9NJMUHqoiW059r0xwZLx7SR57WHgZt0S7fqoRMi4YR+RsIBhkV0rBePlvETS
         9ysA==
X-Forwarded-Encrypted: i=1; AL+hErGkzZS8f302on/HwQLv3BWCWZx84r05IoZZnVzYCmQtw/mnG1sC0FScdlEtvRXYTBrKE2jxnuARNW6pPJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y81o0MkgSjgm1PAZ2BQ112S5kBdB2Dvi7Q4Y8MiFnqiGjDaf9
	JLIxPhPuGiucnctX9G+O/L+dq5G9dNjLXqQV2fOoqBqJoGQXTOeym1Bd
X-Gm-Gg: AYBFou2lP49yLujdOoyZ3lmmgdYfX8tFdLPvYeq49bnYqrLM3ihbVTmhZoRl7Bb62Mf
	1zfASJBEihF1K2GfBfGf0puSDVAJJDaBn4GbmKhHgV8z5XcRgaLogoXTPKkn2+i1qPDJuU5STJR
	xkGfqMsOH5rLrzrrQmUafCbWbdCbZj7IZtg2tPQmdBz0IwEnOz+CBWMTXGhI/T5+9/Ve5Xd1dCu
	zc89MnEF1buMuW/7HVisPdOKA3qx4MMtilRjRy7CyoqCnFMF+9by8QFsWTQ2RiwbXdBSZFfZKEA
	zjeltyQajXu6EtTOIc1yy0oEC6oseCxR+K6LTUntshZRmEos0qCokNd1+m32jIutUR3p+M6EBHc
	pWdX5dtVIFqdBjYGRqLpdwTvlHYI1b8YzON7dJReooLJJUJ0CbJVvpYRciFqW48st0AzEdivzaE
	KBJmES5VkQpAZdFLTz4coZvxFkR9hrBoeupkCWvAgEMfFWKr/LpJgv9rI7wuwFoeMrIPxKayktc
	T/HxHuerw8aekw8KzTAh+bmB1onN6o0yWOx5Jj+302JHTz8Sz4kHI1VBeA4Pzcbz9SQCsO1YgS4
	EESs6bZkRx00P97aUTwMZt+N/4ZWjszwdRWno59jmEPDnAeOus2NXEExYeb+fwQL3b/JQ3HkPcP
	8zKSH+b88HgT9iIRv8w==
X-Received: by 2002:a05:7022:ea8d:b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b3c036ee70mr1539668c88.43.1794380228376;
        Tue, 10 Nov 2026 22:57:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:26 -0800
Subject: [PATCH v2 28/33] HID: logitech-hidpp: use guard() for send_mutex
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
Message-Id: <20261110-hid-logitech-hidpp-v2-28-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Manual mutex_lock() and mutex_unlock() calls force early loop exits to
break to a shared unlock path instead of returning directly. Convert
hidpp_send_message_sync() to use guard(mutex) so lock release is bound
to the function scope and busy-retry exits can return immediately.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 181b791b3e0c..8f2a9d3e0f74 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -380,19 +380,17 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 	int ret;
 	int max_retries = 3;
 
-	mutex_lock(&hidpp->send_mutex);
+	guard(mutex)(&hidpp->send_mutex);
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
 		if (ret != -EBUSY)
-			break;
+			return ret;
 
 		dbg_hid("%s:got busy hidpp error, retrying\n", __func__);
 	} while (--max_retries);
 
-	mutex_unlock(&hidpp->send_mutex);
 	return ret;
-
 }
 
 /*

-- 
2.56.0.542.g3ef89b7020-goog

