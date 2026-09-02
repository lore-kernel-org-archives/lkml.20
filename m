Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A65493653
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352861; cv=none; b=dJr/8mCd7SUoXcSu62FGMIqBeFKMgl1W5/zdGUq7+iiqk39nKS0+lK6ikE18H603Ogxkt+KK3mzEpSVtlpqZRMf7SJ8RLid//KfGiZ1ciROzZsTUpdjurZzMLvdMXo6yxhJZQxuPSvKR3aPdj9DIIysunjk8w4OUqdObuwU7Zf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352861; c=relaxed/simple;
	bh=69ncB8hBajtEa8HDapr1rxkd8n/GxAyhRCT8Oborio4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8efxEUH60kTPoLGjTO7xre6reD/d1Vuz0dA9iDpMbX/fSxpWd6mQiXcLLDYqqOWb4QlqUtz96n3a/ZLAM5toLCyS2ZNrkJPaBmV7iaIAhIW7LFzxXwTOybW6dna1xlKlhGtHsR+2P8K0hUfbkcQWH4HekGLBdgBii0PjbpvTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL07uXIK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL07uXIK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1231414a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352859; x=1788957659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+i1+hLinUt3Q2bK2ZT3Wc0emmUMZr61lAfSOzdane8=;
        b=QL07uXIKeHZgy+eT7hNC39PGCw9CxqidJDdTdLfROj9P22mXs5mETheHi2CmZnvHF0
         HRud3iv6Z0prAGUZR7Sd8xy0R9zzl8Scx2VgI5gtTgEbKNcqCq2FVTPL1cmCy5X1zte0
         48Y3gStBNWIJYj8hzUu+abuE7ZnfEBTwKLArm9xM/1iJegrBzKpkXXWDVP9J298pypM7
         EiWYrTgB8rLej8BK/T4ORYb3/8nSSQTM0/r9FbUENcyZGgYQ0b9pQcDG+k2Idpv19y0+
         gf6K4muorfIv59mNoUV3ujgPRiCjL7ZhMMHeV0Z8pWyvxWtuTZAicvDWBF+Ym/UB11lF
         QJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352859; x=1788957659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+i1+hLinUt3Q2bK2ZT3Wc0emmUMZr61lAfSOzdane8=;
        b=h8CKxeYk2LHydQR/o/9eCEH2rqPQh5NuuPHC0r7bdV7ucDQDwdEmGnOQZ80epidQsP
         +N5NZ2/ILlugA5VRKnxE04jiKGkIXq6zO19gCu7K0bTeQ8ZRY+coYmwDiSv4Ou7GpfrN
         NU/07Ki6Bs7G7MQjJWHx6PrvDQBNW7pjXPOFa0nadkMcgy4z/ALnFskSY9Tp5Vbu5THR
         vcQGf/czbezMJHiBKIfJ6sme1sE0uyDF1S7aooBhl1SLj0eghIDkpZ9tNjtXpTJtGS3r
         nL2C9SFi7TSsEc8E3mG65SjB7GhVA2ULji2weSD3f40Mb4Gi8H8qyde38k3Jt0rvAQyJ
         yS1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFi17om0DMVD9toV+W55zOB9n45KETmw3KisyALAdEtSrZu6dFjKyzYmqTKzN+J7Ljm5nB/1kUlbYl2Kg=@vger.kernel.org
X-Gm-Message-State: AFuF++nhwU+khg8zrQz2dmCMZFtyCs4Ori34hdJbEsAcICvViG8Uz6Bi
	OVXfHEUj3kFWqWzXPvuQigArLFUaK7gE/0Viv42IrQR7KIMfHoZyPOuF
X-Gm-Gg: AYBFou33bFslW5/SzG8IybQq3+99zBaN0PQj0sAntpdUsMBlmzPFJgeywAcMwEcuJPK
	XfTjYJHDIaCwuJbwBiveSkXOFGHxK3NCgcXWQRMVjtpJ0CBt+3zN5pNMw9l3/+W6kR2TftN49ns
	IkXK7teGbxLKFw0rp2wAutZ2JadMDRaStq0fwUDZGa0A7NSgDlmJGTDG2Myzk9ONEmU6Iadcgre
	6bS4FkR3Ha1rgGCmpOqNaAzlsH8D5lOuhEVZ5CPs7/KsZ9/fb0S1L1cF9jCwnjVMtvlJK70CCvX
	dkOKi34zY/WE5EURf+oJvhmBU0h+OLvasp4z3puvoLS1YnKnV/G5ATBBhyS2zgFROM7xMiwtXGM
	jJYPsa/8zskMNr1UNiEXP98+pcdJgCL1DTukfZkWatOXJdwbmLs9Av8acuhGILZmLs8F9A6NtEA
	5yS3/GjBjZumByHz4/yWZ+XeYZwUTO2fBwuCtgJwBNJd5jkc9YRHCGc3bDYBdp1p5aKBCIipHjz
	P80nd8sC30SIO6pMxCWe7dF30qXJiBhHA==
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr6732990a91.18.1788352858942;
        Wed, 02 Sep 2026 05:40:58 -0700 (PDT)
Received: from localhost.localdomain ([180.101.244.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm11879576a91.4.2026.09.02.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:40:58 -0700 (PDT)
From: henrymei <ljp1205831794@gmail.com>
X-Google-Original-From: henrymei <henrymei@tencent.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Aohan Mei <henrymei@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: inftl: validate MediaHeader partition geometry before allocating tables
Date: Wed,  2 Sep 2026 20:40:19 +0800
Message-ID: <20260902124044.3942821-1-henrymei@tencent.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aohan Mei <henrymei@tencent.com>

find_boot_record() trusts the on-flash INFTL MediaHeader partition
fields without validating their relationship to each other or to the
device geometry.

The sanity check

	if ((ip->lastUnit - ip->firstUnit + 1) < ip->virtualUnits)

is evaluated in unsigned 32-bit arithmetic.  With lastUnit < firstUnit
the subtraction wraps to a huge value and the check passes.  Control
then reaches:

	inftl->nb_boot_blocks = ip->firstUnit;    /* loop bound */
	inftl->nb_blocks      = ip->lastUnit + 1; /* table size */

so PUtable/VUtable are allocated with lastUnit + 1 entries while the
boot-block marking loop writes firstUnit u16 entries:

	for (i = 0; i < inftl->nb_boot_blocks; i++)
		inftl->PUtable[i] = BLOCK_RESERVED;

A crafted MediaHeader (e.g. firstUnit=7000, lastUnit=3) turns a
kmalloc_array(4, 2) 8-byte allocation into a ~14 KB out-of-bounds
write:

	BUG: KASAN: slab-out-of-bounds in find_boot_record
	Write of size 2 ... 0 bytes to the right of allocated 8-byte region

The MediaHeader unit itself is also marked through PUtable[block]
without verifying that block lies within the described extent.

Reject inconsistent partition geometry (lastUnit < firstUnit, or
lastUnit beyond the device) as each partition entry is scanned, and
reject a boot record that lies outside the extent of the selected
partition.  The existing virtualUnits check then subtracts values
that can no longer underflow.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Assisted-by: CodeBuddy:Kimi-K3
Signed-off-by: Aohan Mei <henrymei@tencent.com>
---
 drivers/mtd/inftlmount.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 87e246a6f488..b0f01db95280 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -192,6 +192,23 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				 ip->lastUnit, ip->flags,
 				 ip->spareUnits);
 
+			/*
+			 * Reject inconsistent partition geometry before it is
+			 * used: lastUnit < firstUnit would make the
+			 * (lastUnit - firstUnit + 1) check below underflow,
+			 * and lastUnit must stay within the device as it later
+			 * bounds the PUtable/VUtable allocations.
+			 */
+			if (ip->lastUnit < ip->firstUnit ||
+			    ip->lastUnit >= inftl->nb_blocks) {
+				pr_warn("INFTL: Media Header "
+					"Partition %d sanity check failed:\n"
+					"        firstUnit %d lastUnit %d "
+					"(nb_blocks %d)\n",
+					i, ip->firstUnit, ip->lastUnit,
+					inftl->nb_blocks);
+				return -1;
+			}
 			if (ip->Reserved0 != ip->firstUnit) {
 				struct erase_info *instr = &inftl->instr;
 
@@ -233,6 +250,18 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			return -1;
 		}
 
+		/*
+		 * The boot record unit must lie within the described
+		 * extent; it is later marked through PUtable[block].
+		 */
+		if (block > ip->lastUnit) {
+			pr_warn("INFTL: Media Header "
+				"Partition %d sanity check failed:\n"
+				"        boot record unit %d beyond "
+				"lastUnit %d\n",
+				i, block, ip->lastUnit);
+			return -1;
+		}
 		inftl->nb_boot_blocks = ip->firstUnit;
 		inftl->numvunits = ip->virtualUnits;
 		if (inftl->numvunits > (inftl->nb_blocks -
-- 
2.43.7

