Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734902;
	b=We++ZI8WJ8XQlO18vwQeavtQCG/BhFd/8nKaRcrn0PjR4PYUp7JtJwqEm7c20a+IcUrF
	 Vc7gSR8c2ij6oNu2GpKUehrPslCha5oKmcKaVAYyaQPlAw0bfw7dRvzOhp5Vmvcw5UtT4
	 QE3hGHx/6lclO7tDwyE2pZWOl4BzEa2DpP7W6EBUZtMauMUfV9xNQadA/6rRPiIW2kTVK
	 i+dN6A2Gsd8tudkm6D5c5O7yuvjQkdsq/ZPFBkUB8uwCUrwU1zoMstyVzMbW8MleG0GKN
	 CM4XqJpmVL1PyTX77wStE3B3n8E/xNRguSulELufW+Y2o+Al44K9Mp2MyLxFM6eDV3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xezF0fn8IDQBSoJVFqpD27Lisy+bsjzUf+Sl1jGurIk=;
	b=iAoDaN70JYsxb8Gv5AERVogAQZugZJWfn6SxgEScd4+oV4enuMWKU90VD9W4xburgXVa
	 /IZHbdeGkSoryhkei4lbVleJN/SYFVGmSSbxHVPyKo42YKp78AtrVyyCyMsK4fAOI1ZSa
	 hDJQjrpa0n2MBduuZ2fFDcfpGVkqruap+oCN/V+HJ2qocrlbkS2ja5wV3IEF/vtROkL+r
	 7vCq+R/4lQwT+UvAwuMPHIC+KWA0hLBH/wcBLZ5RQc7zeYcDpjBuBLRl02qpicgNFtMLZ
	 02Dp8KEQkF0Vd/VgxRqudP6Bb+dxl2CHN+1ieXdlgSeOA56xRi43wipPwkDA2IveKHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8nbt7Kg;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DC606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024DC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8nbt7Kg
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so1773462eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734901; x=1794339701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xezF0fn8IDQBSoJVFqpD27Lisy+bsjzUf+Sl1jGurIk=;
        b=o8nbt7Kg4VLEAVGwOT3wfSMSaYrtKlxDWnrkTwbt16DwdSREle9viHmSI61W/yEHJ4
         wva+9xyktj9klqdIbCed9fiX6W7X7j/t7YVxMeY6blmFgg0dRRsLH3CXgoLCjViBVCvK
         X83Onfo09mrcdfTkHUvwXHM6eatj+m3dnpxW0im2hhcdKyfMpPrgjUo6M90Rar18p08m
         Le0mXuEgSmxASxlHveGZJPhCbZj9yZiZy0Q4BHJimV0PSg0T9IKX23jNfIcjM6S8iOVt
         fm0MfMcu5JTlvEr2l1dq2um8Msr7j/k0coAHQqT5pZBz0PGK71L6Za9Ewd2oCBlKkTuj
         upOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734901; x=1794339701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xezF0fn8IDQBSoJVFqpD27Lisy+bsjzUf+Sl1jGurIk=;
        b=OGyO3T4Xk+BRz7Y2C4qM9YEZgidntIpZjmFOSQ9eUncFqaoWpJ1W4cO3BG0NAiELea
         cKsvjXV2/sDIeLgrNjNlP4hrghql00P/jqqhW0XsgqAnHqteD6XZReO9GtdV3uq1KYpI
         wKA4pjO7juyssJkcG9+EuENpGiKWWEglleV0xZicB2KrVS0Yt2P86miz5s+3BRHxR65/
         9cJ8w/VXbUT01Khfptj3C3Wpb4sgK21OnSGyOSb7q1TjmP+96GLMpG36CG/nVemZXPYT
         xSEPfxKFJgz6GCECwmOVc1keyXh06aGlIliQymgNF8TZrOIBaCfhiQca1cLRCVxfxb0u
         1enQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG5pYAeizFcWI8YrLPgTyb5FkHbm5YAht8/wUsicF9MJXVq/Rsphm5zE3WzwR3yEoGl/Tom7SnK6gPfys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tfy2DVFxxXQb5VR1gIo8EAxymmIs0RTmEhajFEjSrW4qUtRoF
	c90ky0URlhBE6ylKwbIs6zKHgyEZ81iUSWI01YhCVM62Q9JzrcB1HpyY
X-Gm-Gg: AYBFou2waP6DmYqE7MP/o6TAE9oR2CKuDHHbNyqHS2kZFLV01NY6WB5V6uI1XDnMAZD
	n7mNLw/s0sUwmBNnvREhfzrh5WWQY3gTW7Y85vx2S0ou5lrUJ73bE6rDzq+B6zHCSbfRnShsU/X
	RdtNBeCu2O7aECGLTicGg1yxVn/0+xhbLqSdDvJhZ3gVvF3sylnNc8nwGFQ5OTMtrIvy99KfVbL
	z2CzPQynvCSKmC1H1OYaUzEKzy9Kj/0Hp1jXz6ex+N4a51RGURZyxyGqo7+fj/xyTcl41n7yLTd
	NRlV1GCjdyay1ygtrcRDl2XVJGycpxLNGxq49KNL7oSLBQaQWeZem6lNGwGXTxaYYmdsleO/bdF
	xfoYbkYIDVcR28GmYeBZV+PRUvj19/GN2mYQlq00wWmSZdrhqX+uYpFRWnELgZ5xlebxU5sVCis
	G5eBq0jxtNJht0qhmxBhCzaiCjuWjQfAf3ZruDBSJIpdhV+xyO9YGs16qJRxZIufDdL9flAkIhl
	rdnHfrMK0A4U7d0tJiAreI/SRNBih/WxLDiVLgbhHgs19ADTKdkERRgKkHm1OdcGVzWnne2+zb7
	X2LwlMpPupMfjkrkCHNdcY+IdmpMf7lD1JzSCufiHlvn0WlY3sbOESRK
X-Received: by 2002:a05:7022:1402:b0:193:9568:b42a with SMTP id a92af1059eb24-1ac5c45fd35mr19813397c88.8.1793734901021;
        Tue, 03 Nov 2026 11:41:41 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm304564eec.4.2026.11.03.11.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:41:40 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org,
	jack@suse.cz,
	shr@devkernel.io,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] mm/page-writeback: avoid overflow when reporting BDI byte limits
Date: Tue,  3 Nov 2026 19:36:26 +0000
Message-ID: <20261103193627.71959-1-dennylin0707@gmail.com>
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

bdi_get_bytes() multiplies unsigned long operands before assigning the
result to u64. On 32-bit kernels, the intermediate product wraps and
min_bytes and max_bytes report incorrect limits. For example, with
vm.dirty_bytes set to 104857600 and max_ratio set to 100, max_bytes
reports 268 instead of 104857600.

Convert the page count to bytes in u64 and use mul_u64_u32_div() to avoid
overflow in the subsequent multiplication. This also handles large dirty
limits on systems with larger pages. Combining the two divisions keeps
the existing rounding behavior.

Fixes: 00df7d51263b ("mm: add bdi_get_max_bytes() function")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/page-writeback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 499a35473e4f..ddebec79d8d9 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -665,7 +665,8 @@ static u64 bdi_get_bytes(unsigned int ratio)
 	u64 bytes;
 
 	global_dirty_limits(&background_thresh, &dirty_thresh);
-	bytes = (dirty_thresh * PAGE_SIZE * ratio) / BDI_RATIO_SCALE / 100;
+	bytes = mul_u64_u32_div((u64)dirty_thresh << PAGE_SHIFT, ratio,
+				100 * BDI_RATIO_SCALE);
 
 	return bytes;
 }
-- 
2.43.0

