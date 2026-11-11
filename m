Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379658;
	b=CZhkd+CBaXQyP8yrDKZGT3FNuWQdy7LCHvbHOeWLTmZ5Iw81rTZApYydgrRLdbjeLc5f
	 19C4opFj3lXMxW1+SSFb9pLTtn5yaNw1j/z8yQC47kFJFWm+fyvkWxb50Il5V2sLyeFmK
	 lSDooGIC7bQZVEDxP1OZm/EjaseYtGubrTa1Yydsai9eGK98kZ0l1/SpGA7EGkC+AsuQs
	 CtiIS2Ud7bWgbcrJ0b6Bi24JzLptU3XZAljIvJ6Vg2/mVtfxHQyPfcn0/UaeX5G5Nh/51
	 e/sGxCJoN4IsRJL4wII80FYcSVOPcFznsD5kKf/PxH3d8v9hpH1cvEb1VvJER7ICT9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=danRQcnk3B280h/USGxRmGkCh5xva64LrrnpATvfP6o=;
	b=RlZXyti/9TqeU+bHQAsPQtPEgeiXhM3IyQjQGjdAagzbkOA0/gcFQfsth4HEDjuYgT54
	 hTgl+5HaAz6EgIPebZg+QK3Szp51VmAzVWOqDWxXf8WjBG0V4BhwrWQKM6iQ0C5Tv56WP
	 WohqaoytpY06x7rFmdg/7YPGNuTKeHMTx1vecm5fCylSCSf0708GaLh/NulEHNG8fWejT
	 311aQWFvdttIT8vHOkfdT2a3o0VuuIBBcRKTRyOzP0OPNNYd6ZxJ1HaMxsvy1idYNmyQD
	 /TRoZuh8p9VqL2cuQKqQio3WcV8Iv8aLT3cY1GB73kO2ozQOkCYey7AnlRBwhOBbvXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jyxXPrHw;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36845606A9B2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36845606A9B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jyxXPrHw
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1769062a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379657; x=1794984457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=danRQcnk3B280h/USGxRmGkCh5xva64LrrnpATvfP6o=;
        b=jyxXPrHwWjP2gROkYCPjx/nYrnggPL6tEofE356ysgsXm9Xt5gUw8I1zKd/kH9FtGW
         mLx32KUZ6g5LskLuZrtCMDI9BYoIehKWIgEKtLqam4brQAtlTPAeOvEgK4Nvg6Hc0dwS
         WjC7PJht8Q1DVUjLsiM5zCn/gK+6A/LknNc7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379657; x=1794984457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=danRQcnk3B280h/USGxRmGkCh5xva64LrrnpATvfP6o=;
        b=k9odWTQKHA4WPU/Ww+2TqWmvYr1XpLO7xhobA+ZUm9duEZla30oZnMWjNnhaMhJgb+
         cqFORjen5wuyn9zHE8bcgnvaQRxLb9bFffP2lBfLDq5tcvZdA110BVrgEybaesI8rPAP
         9Qpi0o57E1E8y8BIsm+4eylUgEUenqBe6FcKPvnA+AkyryBO2lKAjd39CoHCeOEaOtE1
         P8tK3V1+dPXYPAOAzMBXi2HhhahDjBSWmPqjLLO/5mf8YOgsHDNyOGXEyja4l0jVds1y
         j3e7GnDoMBakVPF10APrGR/xbwXgokRNPBFNwMdN+DTqz3MC3gaSLEBWSfCaHMrqipau
         WzwQ==
X-Forwarded-Encrypted: i=1; AL+hErGrVGcC+/38Y2mG9p5gEV3jbefX8nAtweLM5mkQRE8Kmx4jFbiHTuTwJLGD3fg5ABX3oHWL1gz81Zv4nqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dP2UukCCmcmYCYpwly7UJh53rif9KVAjQdwSpwly+5WCY0jMY
	Tb84qjucDsDSZAgAeP3HQPdI7CeMUI4tEj2UZz32tJPm5FPC2H/tQo5j6YYZ03KgJg==
X-Gm-Gg: AYBFou0mmsiTpBrVdlgO2T+lS3ASo8AFC98K4yYzadb3cTqvyWhKIJN035J8/0vaJaB
	2C0FkeIjmFpWllg2cLYeVvlh1e+Lj15CbH4eeu/D3TR8S+ivGg24SrA4LCHND0IJ+Ac5ib2xtO4
	wDsrrTrNbCjSuNmsKbSfntTSP5KjA/n2O+wp6T/o+bsXg3YBoFzt9P1pJcwlCCjF5iodKBpYfvi
	4rLwkI2SfY464O1a42/GOq61vOy7C4zXk7MeYdrOmc8vhNybdJeqrB0qa1hu1R/M7kHzBN02TBE
	teCohsU0Cc0QZTkbRrPQabn/M5vpBF1aQXlep1PMFmHzjy0HdyYvSaQ614UwVapq+AE3HdT+q6x
	SPreIcro2VpJXh5nHsER0zQdWpWEHPqXsKJVnkbTjKSYJk/VCU6ekqmAnhiiRwI3YwzgpsDmZhn
	Cqtr61xFMVFPiSHtn/5HwWrwrtIaEjQAgHpzf19FSW32gUVSLE8oQz7fph7cp1qD9sXSWhDFmsK
	L4+QeQQ2btCwTGyZYGO83jlkm3yd+fQCPgGjOn8ufWUmlVFFHcpYWkpTf703Ldp/In27SSBOSiZ
	oP5eUMWw7ccZRtnHRUQwKLOyfbHOwLjFw9M11wnVA1xKDCdKDygZYff4iBxPCp/dLCOWZ1OE5m8
	cJwuH8spUXv3sIMbXIXdgfJDypXpR8pY5g/1UfQFm
X-Received: by 2002:a17:90b:4c02:b0:3ac:450a:fa22 with SMTP id 98e67ed59e1d1-3b182e02b4cmr1701761a91.2.1794379657428;
        Tue, 10 Nov 2026 22:47:37 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:36 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 08/11] zsmalloc: encode 1-based obj_idx so valid obj is never 0
Date: Wed, 11 Nov 2026 15:46:31 +0900
Message-ID: <20261111064707.2568433-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

The next patch embeds struct zs_handle into zram and zswap entries,
and a handle is considered allocated when its obj is not 0.  But obj
can be 0: object 0 of a zspage whose first page is PFN 0 encodes to
0, and some platforms do give PFN 0 to the page allocator.

Store obj_idx + 1 in obj, so that a valid obj is never 0, and adjust
ZS_MIN_ALLOC_SIZE so that the largest index still fits.  Unlike a
separate tag bit, this doesn't take any bits from obj.  zsmalloc did
the same before handles moved to handle_cachep, see commit 67296874eb1c
("staging: zsmalloc: Ensure handle is never 0 on success").

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 2385c1951ca7..9be538d0be22 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -61,7 +61,8 @@
  * Object location (<PFN>, <obj_idx>) is encoded as
  * a single (unsigned long) handle value.
  *
- * Note that object index <obj_idx> starts from 0.
+ * Note that object index <obj_idx> starts from 0, and is encoded as
+ * <obj_idx> + 1 so that a valid encoded obj value is never 0.
  *
  * This is made more complicated by various memory models and PAE.
  */
@@ -169,9 +170,6 @@
 static_assert(ZS_OBJ_IDX_BITS >= ZS_PAGES_PER_ZSPAGE_BITS,
 	      "zsmalloc: ZS_MIN_ALLOC_SIZE would exceed ZS_MAX_ALLOC_SIZE");
 
-/* ZS_MIN_ALLOC_SIZE must be multiple of ZS_ALIGN */
-#define ZS_MIN_ALLOC_SIZE \
-	MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> ZS_OBJ_IDX_BITS))
 /* each chunk includes extra space to keep handle */
 #define ZS_MAX_ALLOC_SIZE	PAGE_SIZE
 
@@ -189,6 +187,11 @@ static_assert(ZS_OBJ_IDX_BITS >= ZS_PAGES_PER_ZSPAGE_BITS,
  *  (reason above)
  */
 #define ZS_SIZE_CLASS_DELTA	(PAGE_SIZE >> CLASS_BITS)
+#define _ZS_MIN_ALLOC_RAW \
+	DIV_ROUND_UP(ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT, ZS_OBJ_IDX_MASK)
+#define ZS_MIN_ALLOC_SIZE \
+	MIN(ZS_MAX_ALLOC_SIZE, \
+	    MAX(32UL, ALIGN(_ZS_MIN_ALLOC_RAW, ZS_ALIGN)))
 #define ZS_SIZE_CLASSES	(DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
 				      ZS_SIZE_CLASS_DELTA) + 1)
 
@@ -794,8 +797,10 @@ static struct zpdesc *get_next_zpdesc(struct zpdesc *zpdesc)
 static void obj_to_location(unsigned long obj, struct zpdesc **zpdesc,
 				unsigned int *obj_idx)
 {
+	VM_WARN_ON_ONCE(!(obj & ZS_OBJ_IDX_MASK));
+
 	*zpdesc = pfn_zpdesc(obj >> ZS_OBJ_PFN_SHIFT);
-	*obj_idx = (obj & ZS_OBJ_IDX_MASK);
+	*obj_idx = (obj & ZS_OBJ_IDX_MASK) - 1;
 }
 
 static void obj_to_zpdesc(unsigned long obj, struct zpdesc **zpdesc)
@@ -814,9 +819,11 @@ static unsigned long location_to_obj(struct zpdesc *zpdesc, unsigned int obj_idx
 {
 	unsigned long obj;
 
+	VM_WARN_ON_ONCE(obj_idx + 1 > ZS_OBJ_IDX_MASK);
+
 	obj  = zpdesc_pfn(zpdesc) << ZS_OBJ_PFN_SHIFT;
 	obj |= (unsigned long)(class_idx & ZS_OBJ_CLASS_MASK) << ZS_OBJ_IDX_BITS;
-	obj |= obj_idx & ZS_OBJ_IDX_MASK;
+	obj |= (obj_idx + 1) & ZS_OBJ_IDX_MASK;
 
 	return obj;
 }
-- 
2.56.0.542.g3ef89b7020-goog

