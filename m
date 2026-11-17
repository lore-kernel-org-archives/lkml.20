Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913661;
	b=XX6RLgDluvxicILaWevJk2QLQ7LE3OvhGP31hq58iDfnAhReDqDnNflvuqmy9AXvIWlv
	 cq6YWUfV0bYhVoz6biA3tldojwqGb4Tqi7u/TgLYZrqmVnrd3PDxzEuNcNE4fwS/PdDu1
	 FCv/VrJP2cIi1kDIDCLmgbWZ8zg8m3WV73qNDZWDphZS4UMnl0xUdTtbOf+e3sKEm8wk2
	 CP/q+WX1Zft52Af6qHdml6cSVTONuQ02dhmIv/Sv6tJThhh9ghNat7MSZgzrKPSSoy4HC
	 ZzG6QaMMy621hk7X2ejrsSrGIlJc0pVogAfLvRstwciQ5NuUWZepxXDeCK7TNCEXdAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SDu+8SSFg3qgFJ8GozgNasE9VCP5i/wjR68oWFn0pao=;
	b=HFNdbQZJwGYyc7yCaO1Q0/FKsjDF0fej2A4FkSTq8rVaFgQrNKvXXXxOJdQVrRp8E4b+
	 Aepy0xsHAlFDB9ap1QYA/RcPecj3Y0E0tMqNcenA34SJSHJd4h7UqLUXseRTu04iv/Mdn
	 aEXOZMrvQABgx84NXY7OPiuKmz0qQBkETBp8147rXHwlqp4Xm3vnOdcQENwaQIwMR81cH
	 kmOwXfHuVXHgnIr5Rwu3LkIOFEr4X/vM2ftsdRIOJCEP2AMIqjvt3ITftFN/vmb7PKTJf
	 aKJivlUw8PRoVEe4zoJNTxYj2zZTPn5SJbutV7Hiav60V2Rv7Ae4wJXrg7EPNi7tmWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+Z4L6xj;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7BA606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+Z4L6xj
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso5421709e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913659; x=1795518459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDu+8SSFg3qgFJ8GozgNasE9VCP5i/wjR68oWFn0pao=;
        b=f+Z4L6xj/dCgh5W9WP9jwevl1qBdc/IXGonzbBcUUUwG80wyK3QSzgIFTPJa66aCZr
         sFfdsmVLn1qq2mVmZT8He1t26FEF2/Z1+VbllkRIOssBeT09KnAaV5KnVoyL7ZhBqLYo
         2Md6mTiOHAWoRJ7hFWzGqAdVIV9DtnOpdnmAJ+yi0/A8hfGFlVKJdTQR+Nu49YHEo3cf
         HetZvk4LB9BB9BLLy0jThtOpZ0LlZyimUJqo0U4bnxCtkEXFiX/YoxpruM7Jpg2xGf2L
         6d9Drcwukh/6zOs4MvoU9sBRguxXrqlMMEGJnj0jOUr6eYbUi4lYGRl24XGSnZ2wb9Jc
         KGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913659; x=1795518459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDu+8SSFg3qgFJ8GozgNasE9VCP5i/wjR68oWFn0pao=;
        b=gHi4/GI/Vhazmg+8mdHf/WUP8MWf5cRe1ZXWmHOFRsssuoUEB9hYHOs1eEucxY1/OJ
         bAlVTmjUpKE28/2EWTyuGlwhvtIBYI5FSxw7WJ6xtQtKGmRKChFRlke7O17Y2Ycu5luM
         YplNDfdC19BStjx+jwAIDy9TzkrYXANYHJpbdD0VP4zJWLzkbTEgdYamendnhLzLZmXF
         +XOO2yj5QGC7TZ1HY2gIBlyyh5Zs2oyN9s4zaUXbrUu/o6eHY//4rqGssO7OIaQK/DzB
         6egmmyTSkuY1vjK9LwybtWbZE/ML0Xdg4llyVFm1/VGHjlSKNGVfmssXsysEMfPt9sEM
         I+aQ==
X-Forwarded-Encrypted: i=1; AL+hErGG4kpifwTX8LLeJlee3l1wG/UR0B/at1kkedCmJeiTk6wwsqLJxCXJ2pXzT2TsTy539dklgSM/TaDDzwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2J25v3iZPAuC9yC1rMXPSS+42y/NHU16ObA1qMthguAmb22LS
	hNdhuPEd42rsKBUtsvlaL4OvTVZtCgvRcnBEEzsmPnJbsgvbCnuRDP38
X-Gm-Gg: AYBFou0B+WwT8VYvPI705Hr/IgPFqNUGRWVz6QQaedC3Q/gMKgSXFrulsnjP5qyYr55
	AM9UuPOHXI3RyiRQ2kC43EeAfzgedThM374/l/48L4K1fBIsaJb2aSkFhm/eIgqvc1NvTJ584s3
	5GMMGdwgXBj54ornMp6CZ75TSmIeIbOSID3QEbZ4EDm25wEXbWerSBgPXdFFx7/DSjY3kk5feIM
	Xcja+cKsduF8q856wwKKqPje4skxElHO5o+8JUDv4tEUqXh4WFNHD+SCIpk8QtJNI8NfzVmyQ/6
	utKHPZlU+2EdUA/xA+RkfaUVRn2YSkwjtHXUrOZOmzsfFTDTMmqlEe6rAZ4WM3vk6ePGdo5Zjbx
	3afyh3vL2SuTxrz+e20pXJnmJIeFp3BA2Tmjf8gQBNR5xBF8r3uK1SxpsUwNrerM21i26YVrWK6
	ri4Jt+12MTs/VtknUiaPtlwCDpdm9lTG1d4H3TwA4JvQqmxIw9Erp60T1xWf+W1j+Qro6xf6zs+
	d5q280xU126sin6PF6S8ouF6owFduzZ451Sf0XB15jhygkGofh0ppbAQEsXwgA6pNOBOGykSAIl
	CwcWUSSJMTRAROPbJoJ7SkYovnpwWChr59T6pxfrIuwVoR/ksjsaSYXnTf9exQK0s0pKHshi389
	jri03JHq07kfoIrpNKe/Hzzk8zoNV/WW/Y++5S4eGdbEH9Ct94l1tgkDy2w==
X-Received: by 2002:a05:6512:669c:10b0:5bf:d063:608 with SMTP id 2adb3069b0e04-5c1a132425cmr611403e87.17.1794913658742;
        Tue, 17 Nov 2026 03:07:38 -0800 (PST)
Received: from yantra.. (nekmmqtgno85zc1flee-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5d24:e63:61b2:db16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133c8f5sm3935812e87.44.2026.11.17.03.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:07:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: Re: [PATCH v2] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Tue, 17 Nov 2026 13:07:34 +0200
Message-ID: <20261117110735.46400-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117033741.39724519@jic23-hlaptop>
References: <20261113230241.82046-1-zoone.rupert@gmail.com> <20261114013817.476f8fb9@jic23-hlaptop> <20261114083525.11972-1-zoone.rupert@gmail.com> <20261115010203.2a939bd6@jic23-hlaptop> <20261115183949.11591-1-zoone.rupert@gmail.com> <20261115203150.7faed0b1@jic23-hlaptop> <20261115223817.10568-1-zoone.rupert@gmail.com> <20261117033153.608b124e@jic23-hlaptop> <20261117033741.39724519@jic23-hlaptop>
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

On Tue, 17 Nov 2026 03:37:41 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> > I actually looked at what was messing up this time.  It was just that
> > int rc; had been dropped.  It's just used locally in this patch so I
> > put a declaration in.

On testing (d922ed738439) temperature read ended up in
dps310_fifo_interval() instead of probe. That runs with data->lock
held, so enabling the buffer without a trigger hangs on the board.

Diff below on top of testing moves it to probe, tested on the board.

Thanks,
Rupesh

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 9b52cbc2372a..ebfaa67a6b91 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1058,16 +1058,9 @@ static unsigned int dps310_fifo_interval(struct dps310_data *data,
 {
 	unsigned int drain_interval_ms, fill_ms, want_ms;
 	int scan_rate;
-	int rc;
 
 	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
 
-	/* Pressure compensation needs a temperature from the start */
-	scoped_guard(mutex, &data->lock)
-		rc = dps310_read_temp_raw_locked(data);
-	if (rc)
-		return rc;
-
 	/*
 	 * There is no hardware watermark, so take it as the number of scans
 	 * the user will wait for and drain at that rate. Scans come from
@@ -1478,6 +1471,12 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/* Pressure compensation needs a temperature from the start */
+	scoped_guard(mutex, &data->lock)
+		rc = dps310_read_temp_raw_locked(data);
+	if (rc)
+		return rc;
+
 	/*
 	 * The device measures continuously in background mode, so a triggered
 	 * capture is just a read of the latest results. The setup ops run the
