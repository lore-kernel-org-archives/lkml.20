Received: from mail-oa2-f41.google.com (mail-oa2-f41.google.com [74.125.231.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2450F531AE4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169209; cv=none; b=kjZlLVjjxOzEC/LP3w7lMtZXHq0bwkN/ixM5fNUINOCnAwvssJ/ImdrxLk7YNHIrFyeAj581gDGm+hJ44cKxnxlWMl324TcuxQejZMeMrfcsVQyHmfhqk0BmIPi68g7i1/MW/Wy/x3V8OR4ULMbM81Hz3T+98EEINvaeai3z7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169209; c=relaxed/simple;
	bh=II6lr93DMg9hJaSLm8z69j9Y0iee9yw5A9DTDMf4bQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmVylJXiUcXxn71FlCyHdqh0rCVuFZo2ROtgOWpCgtMZgMsAjPDgIppbAgxDkCeDTAlTx1mUEg/hX3idyAaJpbL0Tqs1X7iea/5xzSApcOGFVaUDqZbJQbI8hWhVtIF58Z1xsJ6CM12ctuhZ4bf4ok0XbYnWvugLndq1S3ejDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kU0vMsuK; arc=none smtp.client-ip=74.125.231.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kU0vMsuK"
Received: by mail-oa2-f41.google.com with SMTP id 586e51a60fabf-47bc923fe6aso768874fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169206; x=1790774006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQYxSBPSGsPGEpCxfkSkSGM9Wdwhb7nPmrXw81ANLdI=;
        b=kU0vMsuKteMPPQ/3hlyEZx63hvWccEeH9bb/AhG2W8fdrSCA0oCWVqy3nLIBNoWs/z
         Hu7gZSnsnE5V6DZIrRVPy+eqh37GDvU/Ipk7rPSiUMbl5uZOHceiN1GSJgQ7JVM2Eh0G
         Jb5WBeI43c1G6BvJFnmebsqQuTUNqIiLyqF5c54nIuklWeqvmJOoqKyK5QFIf454+NIN
         zgkMtAxIirjB5Ppw4MjagH4l71FRsXrIelMYVLCGdxVii+VueSNxN2mExBg8i+6uLJi2
         8+bAtmTap8H2nyzL2d6h4wfWxonnSyBqX4ohNWnPxxUhfZDfzyUFijBsyWddr4vZLimb
         qHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169206; x=1790774006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQYxSBPSGsPGEpCxfkSkSGM9Wdwhb7nPmrXw81ANLdI=;
        b=qen2m4WYiNfxs0XojOPTnSBLjR3NP5HmjfiEuYTtWkJ/Lh3sfZtyQEfGtFu+snU93g
         0EH8DUdQhTcbploZ3CPZ69O2DRzB4BYNt3+YTw23+o6FxE7hiObe8TNHa3xieq0STbdX
         dD3K3lvdIr2Zr1enJhStnSkeZ4yJ6TqGVgezXoiihfZWJueRReW1psdULS+MnzYSAJPO
         teFUl6KSkbdA0YF1o4rxX3GGbKHhO+DmQInSUYn2QS0ujDnzMfs5f7w8HJn8EnZrDfor
         aIcTLRj42KHvD2GTWURGIcyy2qPDax1Osa/tKSxk0NW7kVNTRFU1VyuooUdgMz5ztGNS
         IV5w==
X-Forwarded-Encrypted: i=1; AKwUvByGh1+N9DcijnIAZYBNtAqTp0NgJUwxjWiBhZVvRNQi7GcT41vy5CXd9UPuz44wuLSoXcyU7RV8UI1WC/k=@vger.kernel.org
X-Gm-Message-State: AFuF++mjPlklP14iSZQoNCju0o8iFr8uQp0e2Y8UzrRw28YbP7RZTklX
	jmBMrcGsxGeGSEgfAPogJb/Ug1SZkaF6vnuxWbbcXUkUsQl3AAoOReR6
X-Gm-Gg: AYBFou2uwkDN9FWS/RvboAC5HqnQyuIJU0c6GcEgA4/yKSX0OOIyWP7cG41bSo9qiWw
	kbl359hD/S+djPN5CJtvSXnqDslsjFhGufoKtTni1ZmUO4Fju0OPSyhebKimO4GzMxRb22LrD3Y
	xmdjs3QxcXZA8WaDLc1IfXyNdeSdzJ9KvBIa8/NgGy2uIfC0jT7fNVsafYzxRhUKo0FhKyEohQ2
	N7rLlBCGWNOL/25plrmmdlMQXWlxA49YmemzNdki4bB+ZqgeWCUfPSdesTQhhgOYrkfO20BVZCK
	A3mZ5cKIFPfKCXJshm0kTzVza+o3wpIh2/lYSR6NagaWM+g5T7SMuR+E0SAa6d8ZJ+08uO3wSvd
	1/wSD2q0iQdh/R38sYj5jney3C5fgelzsF2VIU2tUBsSxasxxXov+DlSnVYtwohuRyhmBpwqcS+
	Bt++eez8W0vwIXQkETzy0F1rXg9su4WJ8z7f1eMTXgcGn2YUpoYUo2zlJeCQps/leamlqwPcUIA
	H+GWGF6tdbUxDq0ErWe2IsJSbtmLCnSBsA/18J/
X-Received: by 2002:a05:6870:9129:b0:48f:e0f6:bd68 with SMTP id 586e51a60fabf-4908c5f00c9mr2317244fac.57.1790169205681;
        Wed, 23 Sep 2026 06:13:25 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908e54f277sm1599838fac.7.2026.09.23.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:13:25 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] scsi: target: core: Use kmap_local_page() in SBC emulation
Date: Wed, 23 Sep 2026 08:13:19 -0500
Message-ID: <20260923131319.310123-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923131319.310123-1-danishkhateeb03@gmail.com>
References: <20260923131319.310123-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap_atomic() is deprecated in favour of kmap_local_page(). Convert the
kmap_atomic() and kunmap_atomic() calls in sbc_dif_generate(),
sbc_dif_verify(), sbc_dif_copy_prot() and compare_and_write_do_cmp().

The mappings already nest the way kmap_local_page() requires. The
protection page is mapped first and unmapped last, and the data page (the
rd protection page in sbc_dif_copy_prot()) is mapped and unmapped inside
it, including on the early returns. compare_and_write_do_cmp() maps one
page at a time. The code between map and unmap only works on kernel
memory with memcpy(), memcmp(), the CRC helpers and pr_*(), so it does
not rely on page faults or preemption being disabled.

Apart from dropping the deprecated calls, this lets preemptible kernels
preempt the guard tag CRCs in sbc_dif_generate() and sbc_dif_verify(),
which run inside the mapping of a protection SGL entry: up to 512 blocks
per page of protection information, 2 MiB of data with 4 KiB blocks.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/target/target_core_sbc.c | 56 ++++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 55a8c2f0a286..2c79bca5f6e4 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -406,7 +406,7 @@ compare_and_write_do_cmp(struct scatterlist *read_sgl, unsigned int read_nents,
 	ret = TCM_NO_SENSE;
 	for_each_sg(read_sgl, sg, read_nents, sg_cnt) {
 		unsigned int len = min(sg->length, cmp_len);
-		unsigned char *addr = kmap_atomic(sg_page(sg));
+		unsigned char *addr = kmap_local_page(sg_page(sg));
 
 		if (memcmp(addr, buf + offset, len)) {
 			unsigned int i;
@@ -418,7 +418,7 @@ compare_and_write_do_cmp(struct scatterlist *read_sgl, unsigned int read_nents,
 				*miscmp_off);
 			ret = TCM_MISCOMPARE_VERIFY;
 		}
-		kunmap_atomic(addr);
+		kunmap_local(addr);
 		if (ret != TCM_NO_SENSE)
 			goto out;
 
@@ -1222,8 +1222,8 @@ sbc_dif_generate(struct se_cmd *cmd)
 	unsigned int block_size = dev->dev_attrib.block_size;
 
 	for_each_sg(cmd->t_prot_sg, psg, cmd->t_prot_nents, i) {
-		paddr = kmap_atomic(sg_page(psg)) + psg->offset;
-		daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+		paddr = kmap_local_page(sg_page(psg)) + psg->offset;
+		daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 
 		for (j = 0; j < psg->length;
 				j += sizeof(*sdt)) {
@@ -1232,26 +1232,26 @@ sbc_dif_generate(struct se_cmd *cmd)
 
 			if (offset >= dsg->length) {
 				offset -= dsg->length;
-				kunmap_atomic(daddr - dsg->offset);
+				kunmap_local(daddr - dsg->offset);
 				dsg = sg_next(dsg);
 				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
+					kunmap_local(paddr - psg->offset);
 					return;
 				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+				daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 			}
 
 			sdt = paddr + j;
 			avail = min(block_size, dsg->length - offset);
 			crc = crc_t10dif(daddr + offset, avail);
 			if (avail < block_size) {
-				kunmap_atomic(daddr - dsg->offset);
+				kunmap_local(daddr - dsg->offset);
 				dsg = sg_next(dsg);
 				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
+					kunmap_local(paddr - psg->offset);
 					return;
 				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+				daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 				offset = block_size - avail;
 				crc = crc_t10dif_update(crc, daddr, offset);
 			} else {
@@ -1273,8 +1273,8 @@ sbc_dif_generate(struct se_cmd *cmd)
 			sector++;
 		}
 
-		kunmap_atomic(daddr - dsg->offset);
-		kunmap_atomic(paddr - psg->offset);
+		kunmap_local(daddr - dsg->offset);
+		kunmap_local(paddr - psg->offset);
 	}
 }
 
@@ -1336,18 +1336,18 @@ void sbc_dif_copy_prot(struct se_cmd *cmd, unsigned int sectors, bool read,
 	for_each_sg(cmd->t_prot_sg, psg, cmd->t_prot_nents, i) {
 		unsigned int psg_len, copied = 0;
 
-		paddr = kmap_atomic(sg_page(psg)) + psg->offset;
+		paddr = kmap_local_page(sg_page(psg)) + psg->offset;
 		psg_len = min(left, psg->length);
 		while (psg_len) {
 			len = min(psg_len, sg->length - offset);
-			addr = kmap_atomic(sg_page(sg)) + sg->offset + offset;
+			addr = kmap_local_page(sg_page(sg)) + sg->offset + offset;
 
 			if (read)
 				memcpy(paddr + copied, addr, len);
 			else
 				memcpy(addr, paddr + copied, len);
 
-			kunmap_atomic(addr - sg->offset - offset);
+			kunmap_local(addr - sg->offset - offset);
 
 			left -= len;
 			offset += len;
@@ -1359,7 +1359,7 @@ void sbc_dif_copy_prot(struct se_cmd *cmd, unsigned int sectors, bool read,
 				offset = 0;
 			}
 		}
-		kunmap_atomic(paddr - psg->offset);
+		kunmap_local(paddr - psg->offset);
 	}
 }
 EXPORT_SYMBOL(sbc_dif_copy_prot);
@@ -1379,8 +1379,8 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 	unsigned int block_size = dev->dev_attrib.block_size;
 
 	for (; psg && sector < start + sectors; psg = sg_next(psg)) {
-		paddr = kmap_atomic(sg_page(psg)) + psg->offset;
-		daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+		paddr = kmap_local_page(sg_page(psg)) + psg->offset;
+		daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 
 		for (i = psg_off; i < psg->length &&
 				sector < start + sectors;
@@ -1390,13 +1390,13 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 
 			if (dsg_off >= dsg->length) {
 				dsg_off -= dsg->length;
-				kunmap_atomic(daddr - dsg->offset);
+				kunmap_local(daddr - dsg->offset);
 				dsg = sg_next(dsg);
 				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
+					kunmap_local(paddr - psg->offset);
 					return 0;
 				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+				daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 			}
 
 			sdt = paddr + i;
@@ -1414,13 +1414,13 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 			avail = min(block_size, dsg->length - dsg_off);
 			crc = crc_t10dif(daddr + dsg_off, avail);
 			if (avail < block_size) {
-				kunmap_atomic(daddr - dsg->offset);
+				kunmap_local(daddr - dsg->offset);
 				dsg = sg_next(dsg);
 				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
+					kunmap_local(paddr - psg->offset);
 					return 0;
 				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
+				daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 				dsg_off = block_size - avail;
 				crc = crc_t10dif_update(crc, daddr, dsg_off);
 			} else {
@@ -1429,8 +1429,8 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 
 			rc = sbc_dif_v1_verify(cmd, sdt, crc, sector, ei_lba);
 			if (rc) {
-				kunmap_atomic(daddr - dsg->offset);
-				kunmap_atomic(paddr - psg->offset);
+				kunmap_local(daddr - dsg->offset);
+				kunmap_local(paddr - psg->offset);
 				cmd->sense_info = sector;
 				return rc;
 			}
@@ -1440,8 +1440,8 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 		}
 
 		psg_off = 0;
-		kunmap_atomic(daddr - dsg->offset);
-		kunmap_atomic(paddr - psg->offset);
+		kunmap_local(daddr - dsg->offset);
+		kunmap_local(paddr - psg->offset);
 	}
 
 	return 0;
-- 
2.55.0

