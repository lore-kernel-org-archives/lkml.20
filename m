Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E063EC802
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896552; cv=none; b=KfRxNUUfanGKPPsaTroYA/CvQIzg4EEIc4CT4qp9vGxcV/HJI5zuel8Xsk0geuoNei4/1RQm6HsrkAtyYZN11FRMk0uxXr/59uPxuXXEL+eaSAirPPTR0EKHKVi5UN5b2C3in8+3JUxBJ8e/j7BDhoK9Mg+fcXfO2CYsIeoRwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896552; c=relaxed/simple;
	bh=HLAKvhJkzr2wMQTL4lMwFebMpdVfGJZuNPiX3c2LAO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svpjZhXTwK5oi/GDwIAj/XmHtq/0bbYAYT6UB9vh65jN5fD23g8oFN44AAj4UoC/U0J5nSALjOxn7zX+S3fJl5jU/PJ6/wtMfAFvlWnvz7TmsIzL5Q0tGdwbtwdcV3Ykel1QSGRcDRx8mrqPa02a4RrcS0v94pNvVHJDQL24tcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwmiRQ3o; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwmiRQ3o"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1158477a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896550; x=1790501350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr//weXOOHxuEsChSdCH6E1epplNkMkMoIIsD/MpGSM=;
        b=RwmiRQ3oS+nI+MC/PGwh2+OfOmGABNSPzqt4f6i+RlD9znKWwRMJhBlw3dR8KXm5w4
         Yr0cPtrp1MOQVhF+qNIY3ajZzWKjjX+eUpGawvxpF26iTzb0zmDYKwHwaiuoQWvRbSVy
         xxMbmHteTL1u/ZAEVBaV1K8NtpfJWbJT5TZSHMnmaJDEyBU/t8RFyNPRUVIQFocKObhu
         T+ov6XhLivsJSpo8T5DwTt94/aZxEtEeDzcYx9CqifPzvwFzFxVa9n0Wq9QOV5tDbfVc
         noF5/tJ0Bi0tcd4oJwt/zajaRDQp2fHJjYZucOgPMlz8k9O+FIcH9CAO2ZOx6lJ8mPD3
         uYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896550; x=1790501350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr//weXOOHxuEsChSdCH6E1epplNkMkMoIIsD/MpGSM=;
        b=WBiEXrFd9YqDm6JVG1ueYNYIpo7tfSPKTEan34lUPUpCIfuGblVoqGpFrRWum0chZt
         fLxs2NvNNVbCKFO4c1CeaST1hNL9trR+NzfskgiGFLnDw6A9jqLwGpP7o5eHJJP4CQBf
         9AYiZYZA92D7qQlWfHIWJqjYj5TFNFra3RdTUtQbiesCo6TRr5Qr+UOvE+9ohcwQNuy9
         EbjCiNHQrZqyDkN0zUdN2UK21msUkwZRUBbguyhgSI8oS8/EyQy+IsppUd52TTNGDFfT
         I/hjqzEm8/NFTyU6pdzmj/HoLNwT54VOjTySbhjGAnvkgi9w77Mc31d4aapbwWQuFynL
         RNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz87+oELqz5+q26EyrqQzZsDbKAOCsSu27i7IAqNyYHfh1UUYwqqoeOkh5k8S1rNvOP2J/cFKjxGNu3RgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kTOIfC7uUK51IfBe+GqW6H54U6GUfUjE+cPYhqTfbgFR0k1cjp
	ICe/qfGGbVBrlxVEsDFznH4iNFxaFrWmQcBcnaJ476vV26PCa/zlyc88
X-Gm-Gg: AYBFou14KgDCOUt8yiIplw3Gta0tV6f3Fn1woWXQpX38zihCo/S1iGv2LNjF/u6ku8D
	gXLLmuPCwYdb+vl9Keml79v0bEoRCmDGMNz/Km0eQcPjftdwft/kOo2ka3+ImekvnYSgwHKhiED
	gquAeGDc0+mijtYS7NyfNtzF23g+Edh0oWeh9HrV7YfWkG+HOOmIkD+kYJh/rez4BI7WU9B7V4d
	wxtOhbEz1eG75NKu+vhQqUX1ZScMllBy+kkGdXaXxQX3wbMirRWTIGmCAObP6kC/uNgVOdbbe91
	OOq4OsHAtCX4ESCXyJxNwtVK0+qjhthz3qGfF4UVIRsGSDxLuBheWszXCT4nDVPGIvONUQfVbyk
	JL5TEWNnaHa52s/Q2X++XzXpoeeo5Bp1QHU6d/ieUEX1SGwV8M1Q5NxO7lRH7+2tSfL1DF+BPUX
	oBckDxOIQf8/JhSqZONaxLPyjc04tNAItKu+BCDie16wSI5lDKa2/RuTf2xYjDgE+s6D0Sr2+ow
	eFPdmFnTC4=
X-Received: by 2002:a17:90a:d648:b0:39e:6c6a:4b70 with SMTP id 98e67ed59e1d1-39e6c6a5518mr5665139a91.58.1789896549933;
        Sun, 20 Sep 2026 02:29:09 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:09 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 1/5] of: reserved_mem: release dynamically allocated no-map region on init failure
Date: Sun, 20 Sep 2026 17:28:48 +0800
Message-ID: <20260920092852.614973-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920092852.614973-1-chenwandun1@gmail.com>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Dynamically reserved-memory regions are added to memblock.reserved by
memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
reserved-memory region's driver initialization fails,
fdt_init_reserved_mem_node() cleans up the reservation. For no-map
regions it only calls memblock_clear_nomap(), leaving the range in
memblock.reserved and unavailable for normal memory use.

Fix it by freeing the region on init failure when it was dynamically
allocated.

Sashiko found this issue in [1].

Fixes: 7b25995f5319 ("of: of_reserved_mem: mark nomap memory instead of removing")
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f55ed3b5aaa4 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -112,7 +112,8 @@ static int __init alloc_reserved_mem_array(void)
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-				       phys_addr_t base, phys_addr_t size);
+				       phys_addr_t base, phys_addr_t size,
+				       bool dynamic);
 static int fdt_validate_reserved_mem_node(unsigned long node,
 					  phys_addr_t *align);
 static int fdt_fixup_reserved_mem_node(unsigned long node,
@@ -308,7 +309,7 @@ void __init fdt_scan_reserved_mem_late(void)
 
 		if (size) {
 			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
+			fdt_init_reserved_mem_node(child, uname, base, size, false);
 		}
 	}
 
@@ -518,7 +519,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 	}
 
 	fdt_fixup_reserved_mem_node(node, base, size);
-	fdt_init_reserved_mem_node(node, uname, base, size);
+	fdt_init_reserved_mem_node(node, uname, base, size, true);
 
 	return 0;
 }
@@ -627,13 +628,15 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
  * @uname: name of the reserved memory node
  * @base: base address of the reserved memory region
  * @size: size of the reserved memory region
+ * @dynamic: whether the region was dynamically allocated
  *
  * This function calls the region-specific initialization function for a
  * reserved memory region and saves all region-specific data to the
  * reserved_mem array to allow of_reserved_mem_lookup() to find it.
  */
 static void __init fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-					      phys_addr_t base, phys_addr_t size)
+					      phys_addr_t base, phys_addr_t size,
+					      bool dynamic)
 {
 	int err = 0;
 	bool nomap;
@@ -659,7 +662,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 
 		if (nomap)
 			memblock_clear_nomap(rmem->base, rmem->size);
-		else
+		if (dynamic || !nomap)
 			memblock_phys_free(rmem->base, rmem->size);
 		return;
 	} else {
-- 
2.43.0

