Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812270;
	b=m14rczYeYp+WtgxnkMBsPc6j4XdHiMLwqI2OULVU8NEOeFwQj8G21sZiHsVrVz6XgAf9
	 pDqDr/GrvUXdMNspcO+XHu5UBDgsI038dTWqNoEdvqdfRsqDEPYplJcmoWkT7H+4ZLHl1
	 B6L8K4wF0ZPTbgyvfCYlhW4SjyQJKetRpglyfpPoc5vY3KRoofBkkUb4Wn4AGv+2ijmmy
	 qaplrQYRuYuuh6DwbtR7G1CHs+pqKnYo7Nm24eHq4AOdC9yIT/kLfRsI06wWjtwQLTCa+
	 X69gNfrYKWw/E+MHtXP36213x4dTAOBcX1RylX19NeUO3xxGo1GXorHuR5XUEGoD+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xi77D0DVU5EqgHzkXh9cbyHVlos1O2la4EdJ9QT/wME=;
	b=TyuAlvah4iZD4Bakj2Yh8NBmU/ilIX2buNbwOGq6RegGV0U20OyLM4lOz/GWJ/ief4tG
	 rv5zDeuUuF8jJIBjmXqpJEdkLLYSZaPDShsjcFPOsGMvJ54PE7Oy+JjdTAap5sUg1XzBH
	 HDrhlhkRaCotZR/cjZo+IiU9KF43eYCeMmKYHy4bNKIqXHwUx8bzndzNz7Yb+2vLea6AO
	 eSb0yDNT+37LYPipx+2oxif3kj1zsBHrIM5uUWQXA4fdZ56BGypoYr12c2B5sVm2kLCoM
	 yMD3XcGnGcPaokWbvyNuQ3Uohg61/cVemb7iyJVtxPeJQbTTN3EloVNUacxVdRCClVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4jBjYPj;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53530606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53530606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4jBjYPj
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1786166a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812269; x=1795417069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xi77D0DVU5EqgHzkXh9cbyHVlos1O2la4EdJ9QT/wME=;
        b=Z4jBjYPj9nSuH9Qto0drbLxn73EtJ4yNYY6fR+qOIPeT/fcD1AWqFjJERY3IZn2BA2
         PPEO2agLRomfxcQhu/hxjIFl56u7EqQilkTEKbScEG1FiPnP1lS/x5ZL2+r3qjNQ94ub
         q+XfQ/zdD67IxzikswtsSv1Pte54Deqomj7MVt7HHOonRKqJMaofSJZBVoCztBCN5Dxf
         OCwH/hV/TizmkcZg4Xxj2WKnZd4jIwvIxzDKQ2dAGlJ/Ko/DQfcEt8JYAp64SD8igSH7
         o+nuvyX79KwxqGo6EbngFRVOqdVeBvrwDzuZKtCKITfOoYqHcmNI9EGAJjj1kdhN0i90
         Kcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812269; x=1795417069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xi77D0DVU5EqgHzkXh9cbyHVlos1O2la4EdJ9QT/wME=;
        b=L6xtIMLuPqdslSCZRU/GdEv75E/6tueHlZntwv1ZOAOEGELHMP61ujAieNncz7qNPf
         NXnQY2wX0tOwaypDFgmX1uRFdlUdisPHbhnv9ksEa1ihhj2KhwiTqp112+DweL3l3uE2
         YOhArgm25Z0qZvr4/wdKc4cc91VArNp37/SEnaIZhCVteuchFA3czyIwWCEmNA+5MPA4
         2x9gy8qMZ31is3RJgfxV8kUTx8V4+Z3I84zdEvsIFLFX48jrhNqjIyzmEMCR2EOBDmlb
         QByJ79w8PrttUOt8iQIhkJJQf6fk+wMMO3pcxkate2PZrG3GzIYREgIGtFTLtoPN/L/s
         0uSg==
X-Forwarded-Encrypted: i=1; AL+hErGdvTHjH6QZddgPj9+F2CVCdgiisB8C4R9ZUbvJP27CuU96j3ZRiqyKiQg5g3U12oiD3je+vZ9lFn/T/S4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dXpgyTt22xVnlMlfVzkYTfpZ/Nrxh5wXKrSA1WVHXXvPoYntR
	+jULjWPkOXcs/98fpq+YXboH9lrEEEJhzxnxdw8ohdvS8JfQD5XVigqk
X-Gm-Gg: AZFdTZfjrHv3X8ybL8AtEUM4LGeWkSWsuo6svsxPAUmOF2GLmgSullF8xrfsxcnCuZC
	OF6ReHe7294WIrceY1inVTZPz7HWvgmQnI0XXdVNG5tDn1jx7XGcN2ihoi6/tz+omoMXsYzdFkv
	+aPKe7l/qmt53wWpscothuQenGkTFat1AJ6HTjbZ3NryxRvVe3cnVXqwpxoNp6RpLscvlB/M8Em
	wjchnwzPKWwVgRtZAnVUjpuhkNZN5ZwP22qmdp94S78ZhG3HJVPoBHMLRMyAy/enby1k9i+P9DP
	fycD2JstO9e0xY14vtOBmReAYOqrf1BpcG1W519nZfx2eXKnu4JJ6/BN2+W5iEnAhtpw272EfCj
	nnJ3ZyyYIlSrVCvsiHynn/GoBMaVqIWV6o1QmKZI5Vgxw1fJRk2AYP2qOXjecgigbg/32Kuu+QT
	yxXX3FmzwvEcCsdoAO8jEKtS79phJmbu2kVSkpjPZT1hnZj30mEj4PBwnz1MnKwrdqr9y+0Blvv
	BbZgmLse+HIVpbTx0rKRTgHXn+wgiadTmdEDM0xc01NvbU0W3/KG4UGieesDCW9KikVr6vG0x+1
	BtirDsL4+Qr5ZKwISmY4595IBrEEIMvYB8C7bR9FrCPNwWwbc2vXAl+cKQpKZ9b9yUgY/Q==
X-Received: by 2002:a17:90b:4ec5:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b1b0a0dd02mr8290448a91.30.1794812269453;
        Sun, 15 Nov 2026 22:57:49 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm15684846a91.14.2026.11.15.22.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:57:48 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	=?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH v3] staging: octeon: fix asymmetric output buffer pool accounting
Date: Mon, 16 Nov 2026 06:57:30 +0000
Message-ID: <20261116065730.472784-1-singhpriyanshu9838@gmail.com>
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

In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
(err_tx:) and in cvm_oct_remove(), cvm_oct_mem_empty_fpa() is called with
128 instead of 1024 as the expected buffer count.

This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
false warning ("Freeing of pool 2 had too many buffers (-896)") upon
draining the pool.

Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
constant across cvm_oct_configure_common_hw(),
cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
and deallocation.

This was found via manual code inspection and is compile-tested only.

Fixes: d5f9bc7360fc ("STAGING: Octeon: Increase output command buffers")
Fixes: 4bcc688a11da ("staging: octeon: handle rx/tx initialization failures in probe")
Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
v2 -> v3:
- Add Fixes tag.

v1 -> v2:
- Make it clear in commit message that this was found via code inspection
  and is compile-tested only.
- Fix missing space typo in commit message.

 drivers/staging/octeon/ethernet-defines.h | 2 ++
 drivers/staging/octeon/ethernet.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-defines.h b/drivers/staging/octeon/ethernet-defines.h
index c060374a3da2..3ce7c125ccfd 100644
--- a/drivers/staging/octeon/ethernet-defines.h
+++ b/drivers/staging/octeon/ethernet-defines.h
@@ -37,4 +37,6 @@
 
 #define TOTAL_NUMBER_OF_PORTS		(CVMX_PIP_NUM_INPUT_PORTS + 1)
 
+#define CVM_OCT_NUM_OUTPUT_BUFFERS	1024
+
 #endif /* __ETHERNET_DEFINES_H__ */
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index dea5696a6642..e0e6d40602f0 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -162,7 +162,8 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
+				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				     CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 #ifdef __LITTLE_ENDIAN
 	{
@@ -974,7 +975,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 	return ret;
 }
@@ -1009,7 +1011,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 }
 
 static const struct of_device_id cvm_oct_match[] = {
-- 
2.53.0

