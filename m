Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856B476681
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841925; cv=none; b=LxzBas3CfFgEnmW+3BG9TsCyTJABVUnpPv87GM+1+xOVn14+rH6zkLOCzxqEs3tII6RoaXACM6355Np0yKNEJV+yg4jieeeS3BWaes84PXiESkawQLIfgvN35mdZ+MQtgGbvSETG1Wt9hdM0WDk+S7H7ra/8CVRNCWP/aPUBHgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841925; c=relaxed/simple;
	bh=4g4/QbZgUS13EU/EdWq0ZZBLZPlWqevmmiPOD7wbitg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcnqQmgOZt5rmxxLrBRvOuehBzSiyjT7Z+s1pU/xRUguuA7OQznN98Q9/DGxfmk00BhBRrZuCeN/eaqsddgGFLHOk75QbiiSzF3UScOw7FjjISJJrTPGJlGw4OOPWyEtAdCA78Qbb1qAxp0Jo0JBFpF1QW5glTEdj7tcjUs33aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtwHMpDn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtwHMpDn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so2361027a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787841911; x=1788446711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KczeZElwfYPxEPlG/rv8QuvplNP93y5shDnpCmj/Kkk=;
        b=rtwHMpDnnqOt/mjkWblZWW8x/IIhQKEpB4Jk2lplkk3/CjZ5lY00pHWkYT/upV3fT3
         yU2TsfA5EMQ8edPNSpDHHM2jZ3Dr7g/oCaPI0hbBbn1o+/Ch1apUqRz1jF43aGFw8aS/
         qfQebvkG9WKQVyRQpMplZqmVFOF9cwqYDuH1yV/J3+6CeZ+jPyJRJEJkZTssS49+sLqx
         q6w9PYTDZniBmW+4Yqzn+CvH4fUWORlu8qfQKrHD4VvHltEhcKQ3y4zj77Uy1YqIM4hN
         fdFccCfs2IyucepQb8nFQv0MqeIVzrpsThxzRd/MCJMtzz03izKjK9QPdkdznq9Js//F
         ayNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787841911; x=1788446711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KczeZElwfYPxEPlG/rv8QuvplNP93y5shDnpCmj/Kkk=;
        b=fwNpJ90SjmP0mSZoZHw2ouCcFcBZFUd3hw59g6/OFCowe6n+pV1qi1BWSZ0RYpf9Z2
         vbx1lFQskZ15LudXF854o+tm+PV5V3P0yA1vEcWuHVoGyGWDBwpjLwBo+6dcViZgWyhp
         WHwJLW14p+08cn8ZDUbJ+Tk6jdIxOt0KT/fU3JLzXWIxBsdGZuq4nVy51YJp3FKIe81c
         Z9hOhu/gV6UnfVJciVaJpLhGBW+xqQSx9Av5/3RB05++z6Q7BFvSHdpXMzq9sDgOU2Vr
         MI9EVzz0rQ+6F6yMqpWfAJEtQbURPqbT9fVtDJmrWFe4msqbbYb1Nyk2xzrjKDYswZwS
         V4CQ==
X-Gm-Message-State: AFuF++nMFoYf2u9tsisDn318uk6fKkHac7pRhPOEc8BayIqSyYxwLjKJ
	rt4+Bj3+B/UMVfTxuAdaia1yB2DrxiQDV1ewpp+CefdtBHfnjA3vYRbKS6UeJA==
X-Gm-Gg: AR+sD124TBu7ud3QRTmOhLrYGfBPsY23fI8KiCDU7qHctqfiZBEEg/VR8fDFelrsKNl
	XEVmhEcHpSaEM6BUVhC5v2lW8nAsETF1D3YGqPGBYPUYDkH+r5qtzINobh1Etaa3boZRiTQZnzq
	bKeGmykJ3SEkpFkgbGxHvSjYkdQon0ok1cjYyY149DFY0j1E36SwLEn5pmWtfM0QL7Bzpl/sfhv
	T3xVL/R6tXBkVMPId9EaQHCvnbeM20z3rGXltiHG36dKztdXXNPE4HbJqWUb+L9MhIpy8tuLlnb
	aPqQcikRF4V+Tawt5orFrmklMPGrEqNZNfjBVTcKTX0hM7i9l8c0J0mXENijCCdCMfDAT2x/KWi
	iqtJaln5Db+Y/BzmE3giOk33Yxkf+MC60+K659SqUnr9WwQY0V+GljRoOhlyXx4WdpQMVGxaPod
	KUXIOfZvhu3xA3tABCUAmKXrA1PHiFbuq5rNCV0fnMz2Xp5YuWu3eO6sv1oWqU6iHJYqg=
X-Received: by 2002:a05:6a00:3926:b0:848:46a0:3d74 with SMTP id d2e1a72fcca58-8537499bb90mr26971410b3a.9.1787841911006;
        Thu, 27 Aug 2026 07:45:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-855a2118b01sm518684b3a.41.2026.08.27.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:45:08 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] mm/mm_init: remove zone_absent_pages_in_node()
Date: Thu, 27 Aug 2026 23:41:46 +0900
Message-ID: <20260827144151.486192-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zone_absent_pages_in_node() returns 0 when the zone is empty and
otherwise calls __absent_pages_in_range(), which already returns 0 for
an empty range.

So remove it and call __absent_pages_in_range() directly.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/mm_init.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index d87166a36ee8..1ead4d694099 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1192,22 +1192,9 @@ unsigned long __init absent_pages_in_range(unsigned long start_pfn,
 	return __absent_pages_in_range(MAX_NUMNODES, start_pfn, end_pfn);
 }
 
-/* Return the number of page frames in holes in a zone on a node */
-static unsigned long __init zone_absent_pages_in_node(int nid,
-					unsigned long zone_type,
-					unsigned long zone_start_pfn,
-					unsigned long zone_end_pfn)
-{
-	/* zone is empty, we don't have any absent pages */
-	if (zone_start_pfn == zone_end_pfn)
-		return 0;
-
-	return __absent_pages_in_range(nid, zone_start_pfn, zone_end_pfn);
-}
-
 /*
  * Return the number of pages a zone spans in a node, including holes
- * present_pages = zone_spanned_pages_in_node() - zone_absent_pages_in_node()
+ * present_pages = zone_spanned_pages_in_node() - __absent_pages_in_range()
  */
 static unsigned long __init zone_spanned_pages_in_node(int nid,
 					unsigned long zone_type,
@@ -1297,9 +1284,8 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
 						     node_end_pfn,
 						     &zone_start_pfn,
 						     &zone_end_pfn);
-		absent = zone_absent_pages_in_node(pgdat->node_id, i,
-						   zone_start_pfn,
-						   zone_end_pfn);
+		absent = __absent_pages_in_range(pgdat->node_id, zone_start_pfn,
+						 zone_end_pfn);
 
 		real_size = spanned - absent;
 
-- 
2.43.0

