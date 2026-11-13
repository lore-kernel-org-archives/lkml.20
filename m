Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611794;
	b=PzvQCNS5SRea/mpRemxpRwrUoekUlAxt4MQ3IMgNh9S9ay6LA40GjDAN90j/nW2Sx2Pa
	 g9I2WQcS7x2GtHdLxq0IP2C1lwv2nvf1LqKGq2x9kVM1D/Di1Nrqap02UZq7N0xgS17xi
	 FP3EJht8k5zrgpBVUbETrGqed6zCqbqlzu+in2JpXwMzf8FmhgWzlK+TslyPWkz1I9mDl
	 vMFlGfrCdtkyoLydwbrx74mB0aedMPJZxtHjf9pzZtqlsXsnajepsD8fIBkTWcmnpc+S2
	 q4Rs+Rp0oVc+8aYlN5TqEkQ79cOfVORN2qPXYvT7u9lU2Dgkr2/2C1hYdzcjVkvYBnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B61Pzgho1QEzJ7TAhjDAzykpmBiR4YFWAuFRQ9Hawn0=;
	b=dv7waoVQxbVp1twkasM78tNzJ2pjTExhIYPjbSgTiDNygi8N/kflajCUcE8FADLplt4T
	 xtDV9JYvqzf3FGptnQlFTqqH1hNsPmoq+8AhEY57E8VLI3vCdNIWGquF6lmBUVVHy44A1
	 kUIkk+kVmf7c2G8QbALWDpglztxC4HrWE7cpsJpPxs/k4hqZYeOTCK5sPK8ANoW5GYMTi
	 W7MB1r18iFTyLbd80wzwydCKGdWdl6aJsPqC1rMYpPrzQ+Z6170DCBYRjDQP6TawnRr3j
	 8N+Ovb9IKjpJvaCT73m3uPjJqqwGDjfya1MXrNfkBteRNKxGfYPed1IEFUmstOqZyHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zs36U6Qw;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE8606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDE8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zs36U6Qw
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e977109392so8791115ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794611792; x=1795216592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B61Pzgho1QEzJ7TAhjDAzykpmBiR4YFWAuFRQ9Hawn0=;
        b=Zs36U6QwtPY6yyOJFmf7Q1I6/sz92RF2XgU7zP04h1EkvjEUh7staS8tHyR6rq7NRb
         9pf/mUP58lJHQ0yQuloB8g01pw+8CvhFNh088a3OaFo7L2dB3wf8T3FDblQLuCdf1v2i
         ELHsfL49lpUNHfHbJ+xqc494fMEQwYTJnquDGrLITcyIGH/kus4DNCD4XeGvYRiN5CES
         f2hiWyjrc8bWPdbVnkfxLj/PaNDozMMnvvM2Y3wkBpIvEHeFDoo6lW5M9updcXBksCsJ
         aFHdZy+Dm+dfaQ43StkfF/k3AAW34sFsfOUB5QYn6SvPs3Aj/Hv30uQjI2BXUt7eiuOD
         rsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611792; x=1795216592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B61Pzgho1QEzJ7TAhjDAzykpmBiR4YFWAuFRQ9Hawn0=;
        b=jOAaWVQaXUH1KWfkLsgnKC0C0D9p5Tdkr+7DNacLhxP9joBADCHRwDPlmNjWxZOGDi
         asjFyLkby4MCS0NoJFB9IuxBDy6gDJpwv3G+QF4z9D+1ABmqT1O/xUja2kbR5zu/K8QQ
         HvH0enXiHYzAdIUWYW88fXn8Ze0p9IyN5617Yn43ECW3AhT5cJ4n0vFRyTOlPnsxxmvq
         mHWwE5/QYztnPWyUxxJA8R4FVKMMyOu7XYgD0GaLlMmiTBGIcGDKU1T8Y6CtcN3RYocG
         bB/VqfM8JfoKWG2PRQgsZcnF8TIPhTtgdUsy2n/TMGbUj9CGB2ib3BlbDT5Kbi7D8qhC
         lm/g==
X-Forwarded-Encrypted: i=1; AL+hErHUa8SCqVrakYGRUELUv3XaWlzTKpwLPVlqh3Qznak6VRSMlzgOY9zAjgXodu+6Z1VPizRb7o7QgbZYFYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+leJ9F/GHezO//sXU4dqSJwQz1GPxH4qhrWxk7j69x4OxFD4rr
	Lsv7/xRCi5n9uT8jUtbqAFrUb2+L0+uhjVmq6Fu2i55mnc/UlUwXSvMf1YCAH6Gn5mY=
X-Gm-Gg: AYBFou3Q49qP1pKtx75MIlxY1wef0haKA87iDz9XJOAeyOXlvyk18uhvSnz9SeT+RVc
	vIWI3ucsng0O8DEV2psVMYJVLH4wN3nhyVaqVEJTzTI90wyHghvrXyec9oH/rovvpbwZg2aEC+8
	2+isFXfeR0/kVxjqi+airlzxKMYBdwrfwAZMWxJgvmFr5O8GBBKCQWu9ZiEoUqpyhrptgXlyiBB
	57AxjABTN7NHPHt9pvUi9SSFtC38N/SWCrHBpcGHVhCRoMMEY6Gp4Tblc4X4yPYQVN6VV+Umx+y
	+ykQiq4w1eregVOBFCo1UZZ3d4tBSHIoIRCy0hLnB7n08SJLViyICZdg1+PyzHj07sUsETMInlV
	ibr3+97uWsowAoaRwgwmsNmgl0hCL5JZG3824XzW9MJAXPOIU6jyW7fpNR+RIbBPEz8qUARMUI0
	ZlBoblaUX1Xu4qFEOJD27/hRQOhk3On1rnk7dCXgbjyJZFbtVZfMuyYHKRBI3MCtZmHLzETf9NI
	sc3tGbEy0sZPrG+nw3i4Q9og6pBEo8/Gqy8HspLfZxKQagSB2WMKdlMdr3ruj+hPcA/Q41geFJk
	tWST5r43gv94Ao8TIcudasHgrgkKTEEfTwoc9ft8Zx+wze4=
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr45369915ad.24.1794611792061;
        Fri, 13 Nov 2026 15:16:32 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862426sm16398055ad.46.2026.11.13.15.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:16:31 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH v2] staging: octeon: fix asymmetric output buffer pool accounting
Date: Fri, 13 Nov 2026 23:16:22 +0000
Message-ID: <20261113231622.17907-1-singhpriyanshu9838@gmail.com>
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

Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
v1 -> v2:
 - Make it clear in commit message that, this was found via code inspection
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

