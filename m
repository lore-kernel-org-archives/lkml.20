Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792757762;
	b=IB7lOdjmQPex4uj95tozrc3ppek3Y9BNNPx8uma1UvDF3FcOjeqnaKdsxCcIPFV26org
	 5PQKxAFSKm6r0ZqI8aSx8TZl9A5jRom1MgM+zO9CQ/dbLOlwuY7TL3UC8Jt9VKEfWIMZM
	 mauwoDfDbeqB9y1YzTFJ6To8oMdTMeEF7QUyra/OWcxjscjP46xLTfrM4nwYYWraZf/Hd
	 DvO3lQBdVicdpue7RsQOlxPsMAiMBUdhMhfCqN5UFLuM6Kfq5UYtckIZgjw1A1LKZd72B
	 SLFRV8IxarJ75v9KWEfqxCEoqXQe2/lHdrMq3Q07100HIrmsv/C+VMXeCms7NxP/V7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757762;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=wai/fv8He2bUMFBQcGL6ak8rhD3PpppCCtWpYfGfutc=;
	b=41qj/HEY8jdOJcF1y6TPX6b2smC4odQUsQNBcroT5hYPDBoDFI0IInZJxWXlnLhZ1Ull
	 SUB1rXXZe+t0ywIE+0R/QX/LRVQk4EWNAgGs7Sap02H6CGF2PEbLjqDqbt2pt/Wh45ZpB
	 sJol/+3igxGWfhU0CKekgmSkq50rYc1t6Hzxcuwc6KZh7t5RVdM72eeF9/hY2QC0ZuTMy
	 TaoMYWQIqxDX3S3DdZBXT2w0BjqlSg73wjOGrsFAssFhsnEjEaq8ggsuD3laha/7/gLjD
	 M9gF1t9m3z84PAfpE+oJLFxx3VKDuDAFNhnB4GAgUQjgF+Wm2Jzy+tdapae450999jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mJn/t3Vq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DCA606A31A;
	Fri, 23 Oct 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJn/t3Vq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792757762;
	b=P6ociyq7MG5CtUU+Pees8mK0zLXiTUUs6h8x2OYOSR+mkLkXT0qXclCvKmAyL7qogSPE
	 59seN1MDLOaaeCibd1eTmuwvKpX7kIGuh4eiTqRlvMia0RrQ/vtIwijKD87alBT3gg5Wi
	 w0trL2m5Se+l2XciiXIBJ9ldT9kTsYBvLgVtUIjmDAjSbEm13CgvhXiY++Tg/B3MpcaVR
	 pp7GThAufx5GzVHYAGEu9PPZfFr6S42Kqs30LIYgaNJaPVrcBgx1ciWeB+rlltJO4X3TW
	 Qp9Ml/6joDdIRRF3Mnz7n1+WijlH4m1ID1i//j0NwDhdlvz5BdeKFDfnFRV7ppI9fww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792757762;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=wai/fv8He2bUMFBQcGL6ak8rhD3PpppCCtWpYfGfutc=;
	b=fOa8tJPIw/6rPD63D8DeR+h1ORjDCslzkiO3VBei8EbVeK0F3ytZcTGuq5BYLs/DM1Gi
	 zsBTesFz2bHVdveuy3B79Y5GSNQM66aEbEbKmLzq71+pxHM8l6bp3FNEjOl9mWCxaUOvA
	 i3JYlOSjAlK4SyjDnSNjZHC1ULlVI3MhomDZKksPJ4846SEAk3jHJneA1lufMmj/m2jUO
	 PKhvnWI4SvquZ1L2AToMqwvep9RW8xRxhwk0pAL0zBFWFyQEFHfv3J7mUqQnE2esHsYIa
	 qV6Kat+ur+A3M5yxsYIKbGtPmMxVB1bCQCVnvpfzf++ZloGwhpjSE3uFwQfsjsM5Q1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 502DE1F01825;
	Fri, 23 Oct 2026 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757762;
	bh=wai/fv8He2bUMFBQcGL6ak8rhD3PpppCCtWpYfGfutc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=mJn/t3VqeZG4Q3eklWm+HL67p/CWzy4zHr6JrDSBHzjuybRfecXcW8X2nmPsyKn7t
	 hQj0XjovKyQWniT+4SILpF7dV+43bvO9FcmWaPSECq6887kDNu7Qk79xBlTbuA/OlR
	 smR54zq1aVkKYoBx7pEFyLm4c0WRpxxR/E5W+/BpWugvGtOOZauNGhzogNIp4LUD8r
	 SD4zaAblYSTFfgoGU2E3Zv//3F1phWNJe9UMNthfPipBjYTccuAWyclIt21qwYmHUd
	 hA4KJbi+TNehcj1eKadyOeArISHbDa7OqAfMfxt1rqnMXU3zqQeZF+YYofvYLy0YOL
	 v0+jCuE4Noe7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A6A6944502;
	Fri, 23 Oct 2026 12:16:00 +0000 (UTC)
From: Massimo Toscanelli via B4 Relay <devnull+massimo.toscanelli.leica-geosystems.com@kernel.org>
Subject: [PATCH 0/2] usb: gadget: f_ncm/f_ecm: do not notify from set_alt()
Date: Fri, 23 Oct 2026 12:15:26 +0000
Message-Id: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
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
X-B4-Tracking: v=1; b=H4sIAN5P22oC/yXMSw5AMBSF4a3IHWtSFc+tiEEfF1coaRGJ2Ltic
 Abf4PwXeHSEHuroAocHeVpsQBJHoAdpe2RkgkFwkSdcpMzqmWHYtM7MlMpIybOiyhHCY3XY0fn
 Vmva339WIensTcN8PxY9WdW8AAAA=
X-Change-ID: 20261023-ncm-ecm-lpm-d8bdaa05796e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>, Kuen-Han Tsai <khtsai@google.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=massimo.toscanelli@leica-geosystems.com; h=from:subject:message-id;
 bh=I4f84Py9CB+7jlDOXX8Ue6geUC18b5pebZvms0M9osU=;
 b=owGbwMvMwCVmIB2leGXyl1LG02pJDFm3/X9L86mfeyQazpK43/2Fad6/dS+9z/o1rdP+2+67p
 OyzRZV7RykLgxgXg6yYIsu1LeHfI2xzw3Zkda2CmcPKBDKEgYtTACaybDojw/bUtj0xhV7snixf
 j5pOLzZrnRIcoPRR/aqvJ2f0/GVmBQy/WVWfLW74+6nfuit0wTrm0K2FPq3BOrv/P1V4qmT7pCC
 GDwA=
X-Developer-Key: i=massimo.toscanelli@leica-geosystems.com; a=openpgp;
 fpr=D6B457F7583D6D56B86A8AAA301B5A21D493F475
X-Endpoint-Received: by B4 Relay for
 massimo.toscanelli@leica-geosystems.com/default with auth_id=1289
X-Original-From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Reply-To: massimo.toscanelli@leica-geosystems.com

f_ncm and f_ecm queue a notification on the interrupt endpoint already
at SET_CONFIGURATION, when the data interface is in altsetting 0. If the
host loads no class driver, nobody reads it. While data is pending for
the host the device may answer NYET to an LPM request, and DWC3 does,
so the device never enters L1. The USB-IF USB3CV tool fails the
"L1 Suspend/Resume" test (TD 9.21) because of this.

For altsetting 1 the call in set_alt() is not needed: gether_connect()
already notifies through the open/close callbacks. The extra call also
makes the host see two connection notifications before the speed one.

Patch 1 fixes f_ncm, patch 2 makes the same change in f_ecm.

Signed-off-by: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
---
Massimo Toscanelli (2):
      usb: gadget: f_ncm: do not notify from ncm_set_alt()
      usb: gadget: f_ecm: do not notify from ecm_set_alt()

 drivers/usb/gadget/function/f_ecm.c | 8 --------
 drivers/usb/gadget/function/f_ncm.c | 4 ----
 2 files changed, 12 deletions(-)
---
base-commit: bdf12cde30830d46a8ef1ba93986356f1164b4f1
change-id: 20261023-ncm-ecm-lpm-d8bdaa05796e

Best regards,
--  
Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>


