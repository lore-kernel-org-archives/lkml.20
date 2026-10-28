Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193586;
	b=d/HsWBt4h9qoblWc+aG+gmfaoQt4Xo8kUZaYBH094TTnjrRtysLog2qhPA6obVAbFaNx
	 /vvXmR8xlNTTPX6NYowVCu3KQSEfUyF/TGvjzqQviLfQlIJ4OcDY4jbvA6wJxTm6HB4ku
	 Kiy33ic8j4xvM4+uO/XRAcLcIcuJEEUei+qPlEG1rBtaG33tnTrOACE35GEu01OYLeb8e
	 jNUzoPOry7xXuJsnEJExLkXwawA7yuci4btgMpzsONvFHh6MRBapYyKNq2smIZ3I8hA3H
	 tMMXn5dO9/f6hmB7647j7QeEesWdqud8QS9lqHVCcLpeC7uvoQslVxOKVWuJXGmiE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wr/bf4ddaLfe4dUuERT7xlpqqtK0FHujYgWWBDTQd8k=;
	b=MmMyO5FX4+9Lu6ii0q/XIFjlScnjCb6im3HhNlgt9dw/ezXsC0ROfZ/5JOiRID3Ftbgo
	 ozC5t30KaCysTVKHYU7dpHCkvIr4PgNY37AeAW1zTK8I3kax0gc9GGxMISSufnkyD5Uuf
	 kYMQtTYH/KsNIFw6MhYpZ3cFKzcCUV3PjrrC0XUQHOuSHP0N1CxmHvC5JcWj8m+HJETfT
	 GaWaoM/bv0qOvap+a93XCPaPxDFMCD0WDVpbzjQM5DetI8J180wQtStV8iUwPwOt94TUR
	 D3H0drvo5QIdeoe8ktgz6bcxpVWvAcBzNNSte7fDNMaS5hwqE7zr4CFAve62UUwfiuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cTdNjX6g;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27DB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cTdNjX6g
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c46bd7a7345so167819766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793193584; x=1793798384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wr/bf4ddaLfe4dUuERT7xlpqqtK0FHujYgWWBDTQd8k=;
        b=cTdNjX6gOd2UMcj70kcNH+FqHZuhIdirUU/K2/77Q+PRhHwdsi6ZGRH/XC9e5CPwK0
         myhDqw7+yBwtOd+SHw+oJeXQ27CSEEc/UrVDiGyamDnxe9WNHaTF6ohDL6tC1u8IBkEg
         W7neyq/xurB1HzKf5AW5hXkmJyImSGmjODYUlZ5Pwv/Dt2yBG915nQrqniohuFzRJYEa
         JYMRJOgU19IcgI1s5xzGzqDD6VqHMIZo2/xQ8J2dNwQtfj6gXzcV2vhKKFbWXVFDiGKG
         lkzsqKXys3VaadMLHjfJe3kpQms7YrEiPavI6hPyy8pAsVrJBVEtyECWN/WQ0HYu2L+9
         yZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193584; x=1793798384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr/bf4ddaLfe4dUuERT7xlpqqtK0FHujYgWWBDTQd8k=;
        b=Kj/t9jJoXmnA92Kfshn9d9ljZBxLEZhyze220mEETKQPOjL342462p+GMprnVEH8On
         5zULRQ1FCi09oIo44nCvkaPXUzsbHSE9mp8+UT79iV/axL/LDLU+BvvPxZPBDDLKkrwC
         3mYtjuJzwyN0l9Zg5h/7GsvBo36AvCuyKtV6QG37O2WbVaRVCaMu1hnQDbj9gMH7dcnn
         eEnriRsO9EEQt7qcSvtciMRKPxJOj+PZbaTV0xljyuRilLxBo96kT4HtyCqcEklQnjzp
         COMNZHjzDxzNblhcqYQQVRK9wuepVA2UUh1+6yuvgz7kLjYehCEMib0KNpIZg6NZQI8k
         Ttcw==
X-Forwarded-Encrypted: i=1; AKwUvBzTc8FFoXrpetYw7Vzjvdsd84pc3OlusLZ9rbXLTwI/lgrv74h0N+qjEyKucP8dnmpvBYGl1YBnXXdGLGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgkycGGJ5t07+pwW2Vu+t7nULb7FwjyecR6daZdVMekdQw/EBe
	cYAbwye3dqiQoVlAQfLHzVzFJBvE6CXRKz5TL8cvuhIdWqtGdjqQY6yP
X-Gm-Gg: AYBFou1m80Ra+e3eM51KB73cXHkb02EIBZLWNu9YOO8LEkYW2CDbOIB79p6uRxoJ8LO
	5pRd9vuZm4dYF64P5WRKbq79dokfgOrT3o0QZxH4ZGUQbKacLuM08bGo8Ud5qgAau3j40unal+1
	0qzyPZtG34qLOTcXHVTkh6yAWblpyrN51BWPEGDz5Reqso2Pl6hjaoCoeHM0uxkJ8F/55nK+uzg
	irlABZF0AWxjQrSUzDXBVKx3WTFu9xHMCkLddx1zAbN05Yf7DWr2lKLy7HvG/nSK9NYLqBeFwoU
	F0vmITexowRwX71hx01lLz+LDOcYB8CUiV6Bm1vq5u/Hu1loJM8iJzMywJTDcgynj3Qbm4hrMdq
	1eGRmxLALpyWD8n8TqdxHqJZdm8I5BGI3Ef7vg/pbNebMRA4+kTRN+trtkv2hfxmEWQKwRuPXKJ
	xc10enydhbIz37Altgx+vBTy7CXPWIhIZ2izF8aWlf5YCjSwSjh2lf8huyUVhXFSEiooweaKwGg
	WnHT0tsTN7pEmJSf9TMv4aZKS7XmqV0izFXpdt2MwPi/mhgueRKNQO38LRYRQXPj/AzPP5QJ6LW
	y1AL1aYT8C00O09IAsiTqizcCLTwUhyoaZWDG/4lX8MN
X-Received: by 2002:a17:907:6d20:b0:c3f:153a:864e with SMTP id a640c23a62f3a-c49a7425a2dmr540243466b.22.1793193584242;
        Wed, 28 Oct 2026 06:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm597041866b.68.2026.10.28.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:43 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Date: Wed, 28 Oct 2026 15:19:40 +0200
Message-ID: <20261028131939.1014720-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sifive_ccache_init() uses of_find_matching_node_and_match(), which also
returns nodes marked as disabled. The initializer can therefore map and
access a cache controller that the device tree marks unavailable.

Select the first available matching node before accessing its registers.
This also handles a disabled node preceding an enabled one.

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/cache/sifive_ccache.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 71d3f94987fa..02878d54381d 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
 	unsigned long quirks __maybe_unused;
 	int rc;
 
-	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
+	for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
+		if (of_device_is_available(np))
+			break;
 	if (!np)
 		return -ENODEV;
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

