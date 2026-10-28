Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211632;
	b=15teZBybzW4JvgxguZbI3HGYPlv8ikiW4509mX7/OVC1zsRwoNJG7rF3OMMh+curGVCh
	 g7NCVDfdOpomW9Gq5mFo3CjR3hSNXjAP26EvJBpBzeECHNo0O/Or+a5PDzoMb359DGtxg
	 a8Gwg6HK4BpO9625DXJJ0LU2+19XgPn7WGtc+qyBn/B07nJujE/EzBky+wzd2i9Q+3spi
	 RDu4i/lecckMX+11wtF1M+hogrUdp9ENpY+aTbukk282rJxJ/D+oEDnLi68/jE15tC1vB
	 WnbGHEk17Y5At+70AILIs4I/1uMNeQKhp79WL/GL98GfUqwWS3QJUv2wwM63JJqpjFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=4uO2B4i+X0iUGOelR5bWeEjLphajp/+pThE8nLQBq6k=;
	b=ycT5+47lZIQKB+ZwIP1a4HpDcyCwlW+50ql/hprDkXWf0DZM6Zy4rkdr3psffJwVv0g+
	 sAZOnK5aP5z1+CMBAm+48l94jok5f8/3DxjghwOf5FWXpl6ewu+9Ws/XqOAxzqOtKKGXs
	 6JbGo6nWM7UiweXaFJzHEZUGoL+8xrYVwg/IZcq13tzg0Dph9vyRkK37EKxlyM6SnBXKc
	 yNRPRl7mUg6eWuvPMsPqC4XAdBqrC3GlfwQR0w23Elgjddl5EKgFtAd9i7mNbD7IxCJo1
	 r/kcAYM2LoDfHhqCaeUZthGxTSSul/Pwb7Mrsm+xe+WoPHtt0nMZ08gvssucAvjeGxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hW10tW+V;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hW10tW+V
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0f59a5fdaso12788267b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211631; x=1793816431; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uO2B4i+X0iUGOelR5bWeEjLphajp/+pThE8nLQBq6k=;
        b=hW10tW+VZlLZOxI22cxY7CW5Pu+xV6eqIrB+GksqKnByu1oGalxQCG2957367+FOLK
         eGIluyXiYsKVDoYWdU195rnfHAlDi+QUwfgd/MNseJf/001AWXMENYPlqf5bk4by8CnM
         K5QTRCqLMaFcsCdxOkvJDyojeC8t7frf0gze89fS/n/ao43S4ZPdhl2Ocgo0vqrvUarg
         F+ovZg/JzKiZmrhTz6/JmSlsvyWE0bAvjPe5BDE5IeI3SNtK+DIfeLPEhuBe4Ljl6FXE
         Rxguyco1kkR84jfxFIUSLDIMgOSL3r1B+3Spch5P2hi0XfVu0BOQuIHOMhaix5P25hCH
         5c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211631; x=1793816431;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uO2B4i+X0iUGOelR5bWeEjLphajp/+pThE8nLQBq6k=;
        b=Vc3cl4TkCyfOtIDw9HqxUwpngAYOAPFdGnZMLKR2G56cznmdDCCWjrUIcRRkPIBIcu
         6XZ9uOfI5nTb569uhBzkfxCGVqV/HbmM+ayO+Ta+hwgto2nVkGo/fDC0MND6mvXPQtKh
         2XOWfEvSqfPIp/BdKsdE0dRu9Pa1FKV5Na5eyKsgBlLoVp19KE5FwMRv3mAZm8v4NFQD
         Dava/HuYDBoZ8SipNwKd0bbrLBOIJL/KWnxQDawj39yP56yfbrUb4lbZM44ApBZNNHdq
         j5IlpRhWxe6tJBLqpX2KVuQlIFUAMAVxG1BZXL1zsgd6k3lkX3itGzf5dpeDm0Y8hzAU
         9Jmw==
X-Gm-Message-State: AFq9FYJIeUQSQs1nEeYFif8cWNrLQIX96jt5i0Fpv1vGuYQHOZ/eS5Rs
	7iZBhEvbST8sT/MuUTyC3ro5IR1w5JmyDSo50u/JjYrQFAyWkMPKWMqG
X-Gm-Gg: AYBFou1ZBXz4HqDb4sWxdCbQPfZ2/35t54J3H21r4EIVVXSiSlSKuL8UsYq+3qgya3x
	bThXIA6qXBZnb1SzipxFVsmCjKUZvmkmhLh4SWrmLZr4UtmkixLRE4KAciolblahG0CI4gr86zV
	Rb8Sv3HJ63R0jeyLxHjJLLoJCKkKsvCpKW6w8PF32m83djXhJGO5dgREKJ+dTQo/EQ8v7julwwn
	SygzyoWzZAn73UfIcYMVzfsBP+eKhHQV1nQo1hsX8DSsuGZJrxM4/pmehgecuzuF19okeDq/Abo
	tiiWIg6hEIwBQnF5jJW/LcvfNQtvjQSOZpvmndnjxZx/VaEGZ+a0dLez7tAKkrwIpKuN0r/DS+L
	v2PVVCtBMdflVuqHMK/i6lEk5oAaM3xtO69rqDEcwrW96Pu/Uv+4gYL/2xE2GUvIfFH7qxR3MSv
	w/rgMGnwp+NYGddELr9afSSE71GxDyAJE0LNm7emYLeQI91irMt+aTn5eYdqYFBobpZxMxPQVH+
	h676FwV7EaMpCZNxnDPcfulCAcrDYXU9c+zx8TJlsNBTHCRFUa0+2RB6j0NS6WP4qpULqxgHsAh
	dEpYZGRPAvm9vEMzOUlXal5Vma8a4Va5s+mEFlDR5FZsIYV9xDf8Tb6q5Ik=
X-Received: by 2002:a05:690c:e3c4:b0:8b0:d9c9:3fc6 with SMTP id 00721157ae682-8b1b5c4b5ecmr24468597b3.13.1793211631353;
        Wed, 28 Oct 2026 11:20:31 -0700 (PDT)
Received: from daniel-HP-Stream-Laptop-14 ([2607:fb91:1841:4f1b:a405:ce72:6854:4034])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5b83b9sm32900937b3.27.2026.10.28.11.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:20:30 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:20:26 -0400
From: Daniel West <daniel.west.dev@gmail.com>
To: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: rapidio: pointer adjacent to function name
Message-ID: <auI86jtl4-Da5mph@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updated pointer asterisk to be adjacent to function
in accordance with kernel coding style guides.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/rapidio/rio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index f45e58b0971f..8cfbc3807124 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -233,7 +233,7 @@ int rio_request_inb_mbox(struct rio_mport *mport,
 			 void *dev_id,
 			 int mbox,
 			 int entries,
-			 void (*minb) (struct rio_mport * mport, void *dev_id, int mbox,
+			 void (*minb) (struct rio_mport *mport, void *dev_id, int mbox,
 				       int slot))
 {
 	int rc = -ENOSYS;
@@ -318,7 +318,7 @@ int rio_request_outb_mbox(struct rio_mport *mport,
 			  void *dev_id,
 			  int mbox,
 			  int entries,
-			  void (*moutb) (struct rio_mport * mport, void *dev_id, int mbox, int slot))
+			  void (*moutb) (struct rio_mport *mport, void *dev_id, int mbox, int slot))
 {
 	int rc = -ENOSYS;
 	struct resource *res;
@@ -400,7 +400,7 @@ EXPORT_SYMBOL_GPL(rio_release_outb_mbox);
  */
 static int
 rio_setup_inb_dbell(struct rio_mport *mport, void *dev_id, struct resource *res,
-		    void (*dinb) (struct rio_mport * mport, void *dev_id, u16 src, u16 dst,
+		    void (*dinb) (struct rio_mport *mport, void *dev_id, u16 src, u16 dst,
 				  u16 info))
 {
 	struct rio_dbell *dbell = kmalloc_obj(*dbell);
@@ -434,7 +434,7 @@ int rio_request_inb_dbell(struct rio_mport *mport,
 			  void *dev_id,
 			  u16 start,
 			  u16 end,
-			  void (*dinb) (struct rio_mport * mport, void *dev_id, u16 src,
+			  void (*dinb) (struct rio_mport *mport, void *dev_id, u16 src,
 					u16 dst, u16 info))
 {
 	int rc;
@@ -1380,7 +1380,7 @@ EXPORT_SYMBOL_GPL(rio_mport_get_efb);
  * 0 in case the device does not support it.
  */
 u32
-rio_mport_get_feature(struct rio_mport * port, int local, u16 destid,
+rio_mport_get_feature(struct rio_mport *port, int local, u16 destid,
 		      u8 hopcount, int ftr)
 {
 	u32 asm_info, ext_ftr_ptr, ftr_header;
-- 
2.51.0

