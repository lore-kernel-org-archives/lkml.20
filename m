Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949840;
	b=UTjmt2+/oSnHgRItyLRC6ljWs+D2ec2bVi9/S4PwCOVsftArNJQ7G0nf081DbvUKD4RG
	 s0p+P2sS+pKF/IqnuLFYGomroJ48powiEXTFAYp/Z0nxVI2eU0zJXYRugdazL3VYl/WEs
	 VU92BTXaCvC3gFTrNYarJDcgOhuFMrHOjDRBiQWhmgTPXlnZxnfztwaA0ZbmCfvAOBdPz
	 hH9N2NJdVa4+Sthifx/UcvkpYJH9Of1raW4pSCsh10uDYjUtoWHkhHSQ03T6KNoe2Esw2
	 JOK3TYvppSC2gbK0nZciiCKrUFowGXcOHnVfoIJBm4jWPNig4chNEqULEMfaKUZ4Vqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t8XtYL0CMtSz8VjOCnnSQ70xiU2Xw1jxqraDN3jPXMg=;
	b=Sg9kt/mldPsRkT9caTXCiNK6UjZzZjJ2GvR7e5jpoTA4PbueTO02E83rvJBPu327uTYP
	 FsYm8y1CW8RdO09jgB8XCLOLgbJ6oBiiFpmHdQ0f7bmFecLub+703pYAIryBOOVS8Acv0
	 DXyXfLaclBk4O0gkUSTnzSiAd3ramhh59iEjX4iPPRKyVqalmh3sVbhlsUrnNOuonSRXs
	 Uyr6Pa1LDJCnHyyMANJzpiDtQxITJWhIGwpAw/6s5M+UEbL4PxT8omMlwy+FIr5rUwowp
	 TSjp1LIjpbs4We2RAB7FYtwnouDe292B2V8Cj3cPAtSTs2CxX7goN+0pKEdqC9Mhf4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGBbZnod;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A402606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A402606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGBbZnod
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso144763f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949838; x=1794554638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8XtYL0CMtSz8VjOCnnSQ70xiU2Xw1jxqraDN3jPXMg=;
        b=kGBbZnod8XQnKie+neGU0oSsdMf640fuVY3LMH62Kdx/RsV0wqM9m/4fWuO+TFelZt
         CEyOZWB+UMLEwvAqwtOjrQDeorsnSWzt2ybuhLKtpwoARVxcFelFWLt9jUyS8/ZFkPOJ
         6G4wPFiK15XIeZyiK0Zam7UUEq6m0NncvzKqwJ90FOSXhk/n8jrX9TqzkO1tVJfBpiLG
         YITZu7Ba3fp8nLzg5pxAe42NXVImf2N2UQT6EoE6hBb55s1SrYnfPi/s3tBH+ckVDhR6
         QvDW3w4GpVV0cOgxFQEDRmkFAVswgfkxBvD2Gh1e8jqJl8acqtFFslJ6uzxpgKE4reVO
         Z40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949838; x=1794554638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8XtYL0CMtSz8VjOCnnSQ70xiU2Xw1jxqraDN3jPXMg=;
        b=vFrEVo24QLBIJ7Y4mcJEbBXhItAg05T0RgUkcOGu+X9ChVuXe+wtgQxbVv99+GcdVO
         jXDrtCj8xkuY07CWzZLRVSF3WUYcyFLb6DXL/kD1rZzXBQ9hEkfneZA73vxKZVHVK9oV
         FmW0U+8EQT1YwTrAcmq1XeiXA4rZB0g6Y5CEQN6xIKgO4zusHx4QWuinug4jFuh3Mwgw
         La4kwFsgBuyXIUck/2Q9parCF4aP4vfg+TWdm7gnmTC9XVqC2oSu+7AoDq0Fic9lJtLM
         owPimI38RThcx5dmUBrq3hjKADT9ChY6TFOLjteYFfBSznukvx9hvzwrd+PRhPG+5gqN
         FlRQ==
X-Forwarded-Encrypted: i=1; AL+hErFUmMEg2xmr7bxLw3doaUtuQT+Rh6wJscufkRZfgMauFrmesOcpp6AYPmItCqSzjIeyGbbztlQV0s0i1jE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d25m2YtGdebHCKujEfQqXexTujnktWIYrmMGgsulx0HlxgP5r
	9NxYNTnUd/ED1FTVtJ1zmqPzLIEn2pGI3qyOF4nn3JE64azByz2HQLdj
X-Gm-Gg: AYBFou050OOFUEc7MczqrHyWKZ862HeTDrwW3Cei1yJBszW8LIugrcNAjEbk6509jTU
	0+tKGX6JmrFl4Kpa6crTN9CMDquBmWj4kXfGjp533sPGVIrq+T/H8wFGbKglM8mBvuxmREk8FWc
	UMR0OHbfDdCNte+vUFqoIaKHO0jQix/XB38tdTBoRxtKPiJaRBHq/IgnWpGcB46XwyfLK0onDLm
	xiTBvKYe9o4tSgSs+GGxbOQEHDIOcj/D5SJTF4QPpineKuqHvg4sn8mseZP+bosJWv6b47sjgqL
	JdYI8sW4DoF2+tbj5hfXjYBkunjdQDu9oA2utWdC/Kf8JtP0NY9hcmoCA5+Yb1dOt6dXkJEbfmY
	GBRWEpBhIPBlXwFBcqTmvys+/Z9z7nHNLRKqx+ardCt6pNlt0WTohY80TDtoyz1/sSCpfj1qK6G
	b+jCTE6g+f/nzHAQLSfdC5Ogpy1d6i8naOhUa/S0DikYhirwMBWi6O/xe78PS+5uw24QTKib+tE
	wPk1j29/m1byR+4wDfbYo2Sn561IT9xnMxlWouJWkf25HKDl/HnxVgg08n80tRiWeUermeth0IH
	XMqqSXmlPTq5lFYkAd1bvdd6xOp4DgRf8etr
X-Received: by 2002:a5d:5d82:0:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-49273e5b191mr3119041f8f.7.1793949838028;
        Thu, 05 Nov 2026 23:23:58 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:475e:f800:a7fc:23a0:3fe2:eb8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609c8sm2201123f8f.6.2026.11.05.23.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:23:57 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org,
	rientjes@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/mm_init: avoid overflow in percentage-based core sizing
Date: Fri,  6 Nov 2026 09:23:55 +0200
Message-ID: <20261106072354.2234189-2-thnkslprpt@gmail.com>
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

The kernelcore= and movablecore= percentage calculations multiply the
total number of pages before dividing. On 32-bit kernels, the
intermediate unsigned long product can overflow, producing incorrect
memory zone boundaries. With 2 GiB of RAM and kernelcore=100%, a
32-bit HIGHMEM kernel incorrectly creates ZONE_MOVABLE.

Use mult_frac() to calculate both percentages without overflowing
the intermediate product.

Fixes: a5c6d6509342 ("mm, page_alloc: extend kernelcore and movablecore for percent")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 mm/mm_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2a0e782a151d..27a50ecd5c20 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -7,6 +7,7 @@
  *
  */
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/init.h>
 #include <linux/kobject.h>
 #include <linux/export.h>
@@ -448,11 +449,9 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	 * amount of necessary memory.
 	 */
 	if (required_kernelcore_percent)
-		required_kernelcore = (totalpages * 100 * required_kernelcore_percent) /
-				       10000UL;
+		required_kernelcore = mult_frac(totalpages, required_kernelcore_percent, 100);
 	if (required_movablecore_percent)
-		required_movablecore = (totalpages * 100 * required_movablecore_percent) /
-					10000UL;
+		required_movablecore = mult_frac(totalpages, required_movablecore_percent, 100);
 
 	/*
 	 * If movablecore= was specified, calculate what size of

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

