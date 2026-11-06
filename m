Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956812;
	b=zAmRVkOExBgX6te0gOXz0MWDyVcNOMsqGT2gBRPfgztnspHgp9Y2QAAEuJhbFnE2vbye
	 UsBbNy29H9qEGPtwUcmmABSNa8wVzaBDaMtgA0H1AIZHnU1V7rko7S8eJgkFRH6f6C8fM
	 YwmonlOUlykqYwVEvgmH6Jb2yxwvmQDiqtIYwPpvvQ7DZ5HGHDgEymF6UJOxzo2z3G7jO
	 Yu+XGc1b9v+VKx+4tDfiThKHVJ8YnM5/UXBgvuq8hgvdgkRRVGhZudRl7FznCYy929zHp
	 yJUFMSjKAEwPEByEdyILQUzPenjHR0T8xZiL+w+4YrAyX52uzBk1zebI+WRjIyNMmnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BKerVZtCZFwecLdtYHkc8Z2DgusctMkHx27dYOPZMso=;
	b=0iIdQD7EYTXiBwJZZUBA+Y6tYC7sELfvqf6tGffI7TynbH6gE0Zv10N5PWDFSq9DoOUf
	 gWdaNPoX2787iiG8lmHw/6pChfaC+N8gsoa77DVmEfZY3u5QvQtCJhQso2dg7KnopsnNS
	 XUuLD0tlZ1bKbtDTh9sivnyphpo2P8f4tXSVm9jdX96sXM9fIlFvabi/hlJqny7Mq1AD1
	 fEHZbn+WUIk9n7Pq7lvjaVJKv2HY0CbaDNALfVZbKc6QnNwMDQBunoV6Z1qeYc0oLBkXr
	 i02W87ewpMesXOeqaJUlWCPwWJKfqmx5lEboxgncsIvtc65tzoxfosHkem08ZmUaOXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YB9MA4lw;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B844606EE86
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B844606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YB9MA4lw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so3247125e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956811; x=1794561611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKerVZtCZFwecLdtYHkc8Z2DgusctMkHx27dYOPZMso=;
        b=YB9MA4lwBxStiouVrtcdnPQGCzOVF1UehqAaZuv7DxdSERaz23YPJ6PkrQ6A7eVaP5
         IwnwJxuVEDeupExS+TobQjHDN5w2HoGk3KMn3TLst1/zC81sx4oLVPclabeaX6OH8Mxy
         X1a1QPiF1UXmmF9etMn+YLF3ZhhqCcYg8q3lCORpQy/uiZW950/aWuxPkGRPh2nGPo64
         XGyU1NcfwR475BTyWg/SogOWWJ3jJamrMLz43TuzM0u4hLCPz/Knt4ok0UKT+ez/8VWB
         5E4czxvdNEdggWuCLaeolQT1Kq6NvGaAL9OdKEdY0bMcgCoJmmlZseDtkgQeduWYjBIH
         /ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956811; x=1794561611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKerVZtCZFwecLdtYHkc8Z2DgusctMkHx27dYOPZMso=;
        b=h0pvA4x7NdTuOQfe019Qz5pQCONqA2lV0BJvcYmlVYSfbLuYLNq2E7CbsfUU9PSZ7D
         o8sZanbS1YuyDRx9dXU//Aho4FrmofdtE5KuE2e/t/y344XgOrLBuJG+gjHY7kPLGylA
         BKDFo7nyLdMh0tYq9SFHHIUic/sTNB/hfRqS/aCJRwPKX4oZsI17il7TtcAk7cDfflLd
         hRCidzSy+HApa5eDIyLGDA2h0MmjsX7IZba9rXGGSR1QRlXhTq+aRKznSqInXsv/zqB0
         xIe6SODYPxCSBddBAqJVwGKMmKP+2F/X+EBoPCNJwpNIb9UewTIHGnRIxP4DDdzsGajq
         Vgbg==
X-Forwarded-Encrypted: i=1; AKwUvBz+PXK+x5jav/S1NSMobRi5Ot411FHMTIpg2Hu27/n8b/DRPCpNWgw3Ujg5vQkZS3sKz+VNRcpnEaZOmY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+19Fkn+mX8NIdkGjpVh4mANaIZOeX15CQwssoydx5nUkbjVLFP
	UTQQeZS0Gwqix4ZyoiSPvYcPsmfw0mvHcxe+53q9+0EiWl/nWYrXQtI3
X-Gm-Gg: AYBFou3+2kTv8UBgKkdRLQKladB2AOFEVc1QEG/1Ly4AM8N8kHFIrl8BbGvK2vbZUmI
	Z+zmZaKhpkVYWCiHGoCZBRqhXrSHWZ+ySMg7rNwF/FCnpu3pb0Zxo09PG6CD5YK5xhP3M4V04jP
	pVZKC+sP7SmY200XSlc6wwb6YihuWZb6knSMADxxFV5SBQpQl5mvzBY7ZY/DWGeXCvWDwVUv/OA
	QkUgOYywxXAEh+8C99lffGCndy8Ti3bMyRwT2vm7+VgYX5JAn3VbtYmw1c52C1TdudR4jROA7lW
	r90Aee5EndvMb7yThVRrMq6+X/yZ8NjZDDGBfEdgt9LkwqvWqnHxHszlXpDIlQm3WYq/jSJaU5+
	pY3AxV9PsYLommLCE1ZloIsXlqQjz7vdeW7O4zvTCILHTkxs9pztU1hJU+UqZwIHT6JqToDhShR
	xP19oNEgHw5FHdLJqiDJgovYy+z3YsqUyfmsuYmFvSz/j9hj6x23zYIpE1TiDrzBQ/iUdraxvwN
	ZQc/bpKU4aiIMXl5GGu8GJMk0vtee1FicsbZodnEFWRRGub1hmZ3SKfngd66XPLkeq5NoW5aSb4
	sIoRTvz35UEskZY/jBQxSEbDnAI6pRxih3/jyg6YlsFlxz/7tmHA0a/8dT6MghOrvplAfnPkyqq
	bTDu+L/iFlg==
X-Received: by 2002:a05:600c:4e8f:b0:4b6:540d:6317 with SMTP id 5b1f17b1804b1-4b6df3fd1cfmr29585725e9.12.1793956810406;
        Fri, 06 Nov 2026 01:20:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Fri,  6 Nov 2026 11:19:39 +0200
Message-ID: <20261106091943.35783-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

---
Changes in v2:

- set IIO_PROXIMITY channel to scan_index 2 since driver will not handle other
  id properly
- add IIO_CHAN_INFO_SAMP_FREQ for IIO_PROXIMITY channel
- isolate missed ALS register calls
- add commit to use read_avail operation
- convert to use modern chip info match
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 383 +++++++++---------
 2 files changed, 184 insertions(+), 200 deletions(-)

-- 
2.53.0

