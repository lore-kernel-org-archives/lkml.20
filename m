Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126086;
	b=rtpDA0ufHxQOB/8fdITNyRNOBilFAZH8tj0+IN6Da8S9p7rQwpDM4mo3/MVo+MxVB//U
	 2OOVH/7hSSa4xq7fxRtYrZbI2q+yTk0jXkhI1ca4oGWXUXji15ykg5BSUPI5xVbHKEz5B
	 uOo003BkARGwPQAa9RHc4RbV3VspV0Yut9o0CL5NspG4oEJnbgWoldlRgDSahSfNKv1BR
	 kxH4KgJUHCD8SAB4X04q+X9/gVWg+sbhCvzoXWyA3v1HAxNJIv4tQdCC5sbbRpXxnLulS
	 VPaiycZeOoKEh+ONtCIbom2JNSGvd1kvhXzeZiP5Af2SKdNA1WtazytUFAi00y7iMBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kBdqOrR4M0OqiRPiZCcUf5luLzFwBf8tcIlsxdbBp3Y=;
	b=Pc0SJGa1omQXHPDNT5wa/sYowiq+WXOLjco5v0OjXGcWDFmaEACSWkDxXpO5AfzBgeQV
	 4cHOFVGIQUnkUoxAMkIYgaEkIJqWX5pAHtvrHAPYCqjhsYnZsVEBUSsU7gToWAbXIIrUa
	 /vDF2K7taYHhYD69IYMUGIi3ENso3b2FcJZUvHMucUVmawsckXA4+vmSdG3DcgZvuElOu
	 nJ9B6f1/vMNIF4jihvB0Sn7lhPMyRqB1uCwXzHO//+m8aduLyobI20xdpY86wfFpbf0TL
	 VeTDEgAjwVkh2fuXaDwKt0BeaGQPY0KL8pKMPOO4WKHEd/GPVZg1bDHQ3xJSDKo+y5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i54lFwIu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EF7606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EF7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i54lFwIu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1319455e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794126084; x=1794730884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBdqOrR4M0OqiRPiZCcUf5luLzFwBf8tcIlsxdbBp3Y=;
        b=i54lFwIurLraZPqA4Uh4kbyi85nNML+LIo4EOniEBmG+Sn1CRE/wBxCQWP/pfZi9an
         jAlKoXXVyIJ+H15cGEcx07FZ7qaa+OgRL6vesvjp10lLUOCppWtRLdnEdGCWBf8s3eU/
         OFeHBeDDcUaPYV/2UB8THllGuX4qAgFtr9GrIrTJP6J0bfUr1IyvIgXfC087CVpbMwe4
         AabAQdh4W16bmlSUj01A/l4uCxRABvIuH9T/VayxgNYsqY/rz5bhEFiEzCbFrmWr+uje
         HAlAFkzUBygcRyRJhbtehtC5kBK03ACid7WWgoqsCzc/nEg6NYKlvkiTGONy+k4ZTP3c
         J/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126084; x=1794730884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBdqOrR4M0OqiRPiZCcUf5luLzFwBf8tcIlsxdbBp3Y=;
        b=KziaTtwj35ccvMMruWiZErQBwyG1+AxWoXUHN85tnzE4Xky2hlrzrsetP+/rAskbtY
         Bnj1e61SyFDf6QtjmqzA4ad2c/7C/YpIJkDWWfmA+j5wKvlfevSge4g42ELz/1run0fi
         2YRIQADF4QVEP2nAWpEwHRm4rTmuOqW22xFV/jInkbqJ9Km62jCTzCSkdgQjBlTsDBM0
         P2aeRYFdDCp/fD7mL8Ih3wzyO4HkZZXh83gRnmR3ZumEdFfDaZnSK0NEhDBqG5dsxB5W
         SnODRjrDzMxbMvtbecL+qUAiXXn+0EQaN0wSoMHpL3v28di7hDccspbEDZCKji/+t/DP
         CvgQ==
X-Forwarded-Encrypted: i=1; AL+hErHuCh8NSwtb3LjZl06iQO7S4mOzXijSw6XvHJXd59k1wPZDdfULZZ57OcQx6LVIX02Gxh9eslVhRyS0HK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ua+O2ovCajxhMbniNxmFnO/pEwwNDjp/g0GQM+sMi1c5qm8MK
	KYcftWnmBvupkbvActwadgG6H5RD2n/wRR4Z+/VKhZxZf1o0nyhAN2yD
X-Gm-Gg: AYBFou3tXqTBRUpbhMIw4u3xYV/X53K6U7A44DrvQM+7AOyCoq4byAbksb8lUuM2r7L
	Ah+91SnW9B8xZjNZi9GBNlPljG9Ed0Ka2jeuboE4RwQUgFsAowHv1cO4k+1SidqndYMn9U4aIcZ
	R9gisYI5rm52wvDqEuLXwVTf2X/qYz0NBOfH1N6gvaA1cPbugWVjGqc7F1GNbv3W3wN8+NazY1H
	jAXHqN74hy2/g6betBnd48c2SjjJFE/Iks8e2QK0itoyItFkuIt2yk0/vL8ZKYnEe5dBPvea3AA
	3ohroB/cT3+tTDUphKc+gktgp4vb0/NO9AmERbnHsyHPiAiwzYaOyPa4Y4AJuWlQVzNBb+apYvq
	adn0bldMF4eruF33w4tUs66Jj0gTJvFtU+WKlur+G7qxBTHlNxiqfEjZvhUT4xCCIiaFtAAZ311
	pCHjftEcycPHb9NV9ZCdxvu2UUj6i2tR0ch9os1tUEq3tuNf3MevLjaYxMj5zTvWCXz/Ufste8O
	AKLYUSHKeWrmwofuixEgAcWzmzp8otK76x9iMh4+qVkDc1sWQv0Fmx40uRhTC5EmaC29xW8nbIt
	MthwjYnxIUDHXJatUEaKCrN9hRulVwZPLqieN0CkdP1Brkzr4HASrSY/GQp6WiTWhrg=
X-Received: by 2002:a05:600c:5397:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4b963c84476mr15033085e9.32.1794126084090;
        Sun, 08 Nov 2026 00:21:24 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:475e:f800:9c3f:1631:3855:dec8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm43521165e9.6.2026.11.08.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:21:23 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com
Cc: iweiny@kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] nvdimm/pmem: propagate personality discovery errors
Date: Sun,  8 Nov 2026 10:21:16 +0200
Message-ID: <20261108082115.2029038-2-thnkslprpt@gmail.com>
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

nd_pmem_probe() ignores errors from BTT discovery and only propagates
-EOPNOTSUPP from PFN and DAX discovery. Allocation failures can therefore
be mistaken for an absent personality, allowing a namespace to fall back
to raw PMEM.

Report -ENOMEM when allocating the BTT, PFN, or DAX info-block buffer
fails, retaining the existing device cleanup paths. Propagate discovery
errors other than -ENODEV and -ENXIO, and keep raw-PMEM fallback for
those two error codes.

Fixes: 8c2f7e8658df ("libnvdimm: infrastructure for btt devices")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

v2:
- return -ENOMEM for BTT, PFN, and DAX superblock buffer
  allocation failures, retaining the existing cleanup paths
- correct/clarify the comment describing raw-PMEM fallback and
  namespace-seed advancement
- rebase to v7.4-rc1

 drivers/nvdimm/btt_devs.c |  4 +++-
 drivers/nvdimm/dax_devs.c |  4 +++-
 drivers/nvdimm/pfn_devs.c |  4 +++-
 drivers/nvdimm/pmem.c     | 19 ++++++++-----------
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/nvdimm/btt_devs.c b/drivers/nvdimm/btt_devs.c
index d6b2f157368f6..c3c5cb686743b 100644
--- a/drivers/nvdimm/btt_devs.c
+++ b/drivers/nvdimm/btt_devs.c
@@ -349,7 +349,9 @@ int nd_btt_probe(struct device *dev, struct nd_namespace_common *ndns)
 	if (!btt_dev)
 		return -ENOMEM;
 	btt_sb = devm_kzalloc(dev, sizeof(*btt_sb), GFP_KERNEL);
-	rc = __nd_btt_probe(to_nd_btt(btt_dev), ndns, btt_sb);
+	rc = -ENOMEM;
+	if (btt_sb)
+		rc = __nd_btt_probe(to_nd_btt(btt_dev), ndns, btt_sb);
 	dev_dbg(dev, "btt: %s\n", rc == 0 ? dev_name(btt_dev) : "<none>");
 	if (rc < 0) {
 		struct nd_btt *nd_btt = to_nd_btt(btt_dev);
diff --git a/drivers/nvdimm/dax_devs.c b/drivers/nvdimm/dax_devs.c
index decc70f2fe3ff..4d4048578efac 100644
--- a/drivers/nvdimm/dax_devs.c
+++ b/drivers/nvdimm/dax_devs.c
@@ -113,7 +113,9 @@ int nd_dax_probe(struct device *dev, struct nd_namespace_common *ndns)
 	pfn_sb = devm_kmalloc(dev, sizeof(*pfn_sb), GFP_KERNEL);
 	nd_pfn = &nd_dax->nd_pfn;
 	nd_pfn->pfn_sb = pfn_sb;
-	rc = nd_pfn_validate(nd_pfn, DAX_SIG);
+	rc = -ENOMEM;
+	if (pfn_sb)
+		rc = nd_pfn_validate(nd_pfn, DAX_SIG);
 	dev_dbg(dev, "dax: %s\n", rc == 0 ? dev_name(dax_dev) : "<none>");
 	if (rc < 0) {
 		nd_detach_ndns(dax_dev, &nd_pfn->ndns);
diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index 8fa9c16aba7ea..39b8d5eed7ef5 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -637,7 +637,9 @@ int nd_pfn_probe(struct device *dev, struct nd_namespace_common *ndns)
 	pfn_sb = devm_kmalloc(dev, sizeof(*pfn_sb), GFP_KERNEL);
 	nd_pfn = to_nd_pfn(pfn_dev);
 	nd_pfn->pfn_sb = pfn_sb;
-	rc = nd_pfn_validate(nd_pfn, PFN_SIG);
+	rc = -ENOMEM;
+	if (pfn_sb)
+		rc = nd_pfn_validate(nd_pfn, PFN_SIG);
 	dev_dbg(dev, "pfn: %s\n", rc == 0 ? dev_name(pfn_dev) : "<none>");
 	if (rc < 0) {
 		nd_detach_ndns(pfn_dev, &nd_pfn->ndns);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 0766a6949b285..efdb804ad5d78 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -632,28 +632,25 @@ static int nd_pmem_probe(struct device *dev)
 	ret = nd_btt_probe(dev, ndns);
 	if (ret == 0)
 		return -ENXIO;
+	else if (ret != -ENODEV && ret != -ENXIO)
+		return ret;
 
 	/*
-	 * We have two failure conditions here, there is no
-	 * info reserver block or we found a valid info reserve block
-	 * but failed to initialize the pfn superblock.
-	 *
-	 * For the first case consider namespace as a raw pmem namespace
-	 * and attach a disk.
-	 *
-	 * For the latter, consider this a success and advance the namespace
-	 * seed.
+	 * An absent or unreadable PFN/DAX info block allows probing the
+	 * next personality or falling back to raw PMEM. Other errors
+	 * are propagated, including -EOPNOTSUPP, which causes
+	 * nvdimm_bus_probe() to advance the namespace seed.
 	 */
 	ret = nd_pfn_probe(dev, ndns);
 	if (ret == 0)
 		return -ENXIO;
-	else if (ret == -EOPNOTSUPP)
+	else if (ret != -ENODEV && ret != -ENXIO)
 		return ret;
 
 	ret = nd_dax_probe(dev, ndns);
 	if (ret == 0)
 		return -ENXIO;
-	else if (ret == -EOPNOTSUPP)
+	else if (ret != -ENODEV && ret != -ENXIO)
 		return ret;
 
 	/* probe complete, attach handles namespace enabling */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

