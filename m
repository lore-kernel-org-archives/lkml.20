Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B0453A2F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755164; cv=none; b=Mq5hcIWeH4yd/VtjnuM9z+wUjuFWUpiZ8Se46LCSErl8NhDvvp9aZFfvC6WJ5hLrWGrMetsOjUUH6i2GIRbcdSpvPn2OUg2RYkV7izHAOnvSoxt+iNiVwG7dd4Q3x5pvv209urar3SqF1tubYGcMMKqIqhvpFPn9g1kdnswaHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755164; c=relaxed/simple;
	bh=NI4deWyXYxlDZ5Psff3uegs1r20u4xH144iUxLKtfAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4Bfu2d3OH7OGyOnwC5jewQ8jpZuMl/Es2vR7sZ7s/l8LBKjHdrPYI7Oa+GB9TVwMFVroncPAXURRHBiXtyUmst+9nr8CdbmEzyLAgkcQcqpcczwJrbmXpVxhbLinB+1WzBk3SPHgzm4di0p5WbMfdAwzN44dvJBUJSAp+LOLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2eNdHxO; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2eNdHxO"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a856865so2437449b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790755162; x=1791359962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfbBhg1DcI7KV0DOQuXjyz/HcnuOmRxLvnIDKvsQamY=;
        b=X2eNdHxOz8hAbHiEVDXnjJ94ztLEUpz6coimQq6Drda5TD9sVliEdREHaU9Vk6jg/4
         xPZL0nJXhwbU5JtRvwiqbne1MTrX5S5PDe5xpl3+c0No1I3uanhc1AXSo4zgpfDNL3Ap
         1XEIbQbGoiaiXaFU+u+0YHjiRFfCpEC/G6t0MJAoDQqWOg60zHGer+ZtM6UeJ8s0XCk8
         RPIm0v+mtOuMS1Vm0smiIxYubQUWdt0nhrUP4E9mMk0S1gU+PKRVsZQ86kZHS7w7Q46z
         CLPDlHuj1pFVT8lZpttfeNEgvbBpRklOXxloDvDgCkxpCYT/bdmavf9Mop2p13gMGprq
         l1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755162; x=1791359962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfbBhg1DcI7KV0DOQuXjyz/HcnuOmRxLvnIDKvsQamY=;
        b=qU0aVATz3CIqoaodH/ekgon4e0Iqel380zYr/VYTF6dAwIqspMxfDRx0kG8IrPqGQq
         SuBZdyR7cEwIRXbNjrFewxqE1FO1zz9oGdEAzbZBct5Lc5MQTKflzdC1Hs8y0OlU/LkJ
         wx6jtnuCfctfmHAfyQnJHqiK78BivC6NYt97kOwCzIfOJMxL4qA7jvIhJHpQijrjIrGO
         UCV9mNCyeEfB6tBZu7mCfZngKX2oHjjvX5nqpN7JCOOHALbEt5zyIqbJd/BLKecDQ5KV
         8f3rzX2LXsSsuz9tUh8MU9hK/yboKQmy4FugHEwrDHjg0/OqMOIa8sTRd24+N3Pl9XD0
         kDxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3/tiD2Sb2Jt0vexgYmMpKTTFARRPrSOk/6kdAYOtOcwS0xUJdv1931DygsoarpmArG6HCwP2qdVwIOro=@vger.kernel.org
X-Gm-Message-State: AFuF++lk7OCf+KDdSVgeKjcpNls0kElS9bStICbit6O9ewKfZxVhs5if
	cyCpldeFITzuJXHQ0gHXjD1XMe/0E/1N7bBlxykJz5zlZC7e+pNyqXdx
X-Gm-Gg: AYBFou1J8muBIZ6EIQsICV+bvnSpppoxc0+pemaQA7k+hlDktr2CaSUTcMrpEiMiH1z
	inzEvHXGJiyjIvDQuid6RmcIUgjS6JVIB3Seik0cEHnGsQ0EbVi5Sxylw4vGMexji1t25fOszYV
	bNgNdqiYGlevR85MqRgXohf1Y5o3KxN0TcI1XMa64baRg787Sx6XbBrhUptcwdFdor9u56dhg6O
	1tzhzH+1JY62zlUijk9EXsmnhfmkPT6kWTz3I6+lgbciVITnQCRPAi2EDTZYAvlxbqwM/AKiM7O
	aTcD/WKJ4AU8dyjMKAkSyZEKvY9WhVAfGW6GUuKQZz0M9Zp8H+U2zbKTqEaZexJpEKIxDqzeWZK
	gP+s45IiOlh9vu6ahkOu9Jx+vVBe44eI8oboOfUmlveH77NxnNCYy9twwqiCSYRwHu2V3xZ7der
	pUpJDVT60tyjNuM/S9qzcjUENq68iDB2ojwnciZ8NfxelbnHYeCNngJPA82VcZQtPWoSR0cwhn3
	Xn6iAwFeHLaVUdhgzJqLUyHAcDN2zQOG2ETaUqu0Q6RcVYa1WjKAyK97V2Dl7QnFJpJXXeP/V07
	/i/Z3RxN2A==
X-Received: by 2002:a05:6a00:1da0:b0:874:705d:f656 with SMTP id d2e1a72fcca58-8874ba252a9mr413795b3a.36.1790755162269;
        Wed, 30 Sep 2026 00:59:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d684ccsm403996b3a.40.2026.09.30.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:59:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Felipe Balbi <balbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4] usb: gadget: f_printer: bound PNP string copy length in printer_func_setup()
Date: Wed, 30 Sep 2026 07:59:20 +0000
Message-ID: <20260930075920.483189-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In printer_func_setup(), when processing a GET_DEVICE_ID class setup
request, the IEEE-1284 PNP string length value = strlen(*dev->pnp_string)
is copied into buf without checking wLength (the host's requested buffer
size):

  value = strlen(*dev->pnp_string);
  memcpy(buf + 2, *dev->pnp_string, value);

When the host issues a GET_DEVICE_ID request with wLength smaller than
value + 2, memcpy() writes past the end of the transfer buffer, triggering
a slab out-of-bounds heap buffer overflow in printer_func_setup():

  BUG: KASAN: slab-out-of-bounds in printer_func_setup+0x280/0x450
  Write of size 3074 at addr ffff8880024f8000 by task init/1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x70/0xa0
   print_report+0x153/0x4c6
   kasan_report+0xf1/0x120
   __asan_memcpy+0x3c/0x60
   printer_func_setup+0x280/0x450

Bound the PNP string copy length using min_t(u16, wLength, strlen() + 2) in
printer_func_setup() so memcpy() never exceeds wLength.

Tested in QEMU against Linux 7.3.0-rc3 with KASAN enabled by binding
f_printer with a 3074-byte PNP string and issuing a GET_DEVICE_ID setup
request with wLength = 64: on the unfixed kernel this triggers a KASAN
slab-out-of-bounds write, whereas on the fixed kernel value is bounded to
wLength and 0 KASAN faults occur.

Fixes: b185f01a9ab7 ("usb: gadget: printer: factor out f_printer")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v4:
- Re-target fix strictly to bound memcpy() size against wLength in
  GET_DEVICE_ID handling in printer_func_setup().

 drivers/usb/gadget/function/f_printer.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index a27792966287..f8726e3d849f 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1033,9 +1033,13 @@ static int printer_func_setup(struct usb_function *f,
 			if (!*dev->pnp_string) {
 				value = 0;
 				break;
 			}
-			value = strlen(*dev->pnp_string);
-			buf[0] = (value >> 8) & 0xFF;
-			buf[1] = value & 0xFF;
-			memcpy(buf + 2, *dev->pnp_string, value);
+			value = min_t(u16, wLength, strlen(*dev->pnp_string) + 2);
+			if (value >= 2) {
+				u16 length = value - 2;
+
+				buf[0] = (length >> 8) & 0xFF;
+				buf[1] = length & 0xFF;
+				memcpy(buf + 2, *dev->pnp_string, length);
+			}
 			DBG(dev, "1284 PNP String: %x %s\n", value,
 			    *dev->pnp_string);
 			break;
-- 
2.47.3
