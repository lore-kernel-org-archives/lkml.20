Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161323392A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791506151; cv=none; b=k0+Y4Qlo9YRUmTFy08HmRrlLku4d6aSSB7v/bHowDdPoVv9SBMErFXsmtrQB4lJP2l7eF6PYREWfbpLhvZtmj0NcdooDOe6jjpbj8V6E1lzkUoGRaC2teim2bN1fd4R379II37HdoVFMQ0R3TcZiIM3O0Tj3+2nJ4lyW8SsJq+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791506151; c=relaxed/simple;
	bh=3pzmoegqDuSliAkTdeqycBq5aa62YqQO38QkmiiEiTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDsNG5URzwaimSWhcAw0ggDfvss9VA+jXnRWxAeCZzIaLNqnJTpFBv9uyKv7d4F12N2Mx/TdXDC7cMptKciPY6WCdQyImxnnB8HY0fqfZzB92OUhNhU8y8oFscq91d5k+qLfbcO5NSpt07RAtceG1CZf5PgbQKPO9byjr6PGeAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgvBlffs; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgvBlffs"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-988d8aea5dcso31794241.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791506147; x=1792110947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDiCydjZ9y2SRlO9gdJts9J1fvejuYVS4OsVz5QeIVg=;
        b=HgvBlffsiavrVkl2PlcLpjXVZcuTdi02bX6PwF6uEG8mqC4+8FN2b0J1XisV+EyjNn
         8XGsf6z46VAfvFFTg35NvhhmwWLQIf8uiGPcZ5k73JcwMk2A84+ermOEDkyy+GwPfbSU
         pzddC/q71vaWOP3KEOd5uy8ZqDptiKSpTYcY+iayopZiakFgP6CDTr+JgLQXIVckx9w/
         9+f90XB5lz/Ol8FlbUddz/v7OlqgRrxQDBzijxT3WMv2irYce+Rn6pT04R/OWEdFuviK
         wV13SLQEzvtEFkKsy7YFLOwb5Ls3EUtabhiu8EJ4vKi2msKmXZuQm5Mn8JZyjqYF0H+c
         QWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791506147; x=1792110947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDiCydjZ9y2SRlO9gdJts9J1fvejuYVS4OsVz5QeIVg=;
        b=FibUsa6qdpzop25fAljnLYQYeBT3wGnVCmdVyvMi47NmbqbeAPCJrZPBh4X5BNjYPB
         b4f0tfHi6kq39rvcH04rsStyTKLlvDIuczETvWTzIfpGVmDCH9J9MoDk/Q+kM7NhNT/V
         2371DUDUyr5WkEd0jRLbQSOTfU6Ir0iX4TaEO0uY1AfLSO/9UsHyzFfVBaMIKRnsoiAL
         osmlythpY1x3yAKeQiK2o+aat3kf8/jb4BzLLJcMQkVB+cbetf7UsdSNAKQiZKhFrmte
         /zjSEs246hD0WouifvVxMGRKTV1K7vT6PmzMVimiERzrCzE9mLgEVVOTveF5htHBhDJU
         rFqg==
X-Forwarded-Encrypted: i=1; AKwUvBwA9dmdISsFaFpKs5M8YDbJyhRruzXkXeV6vBh0U0YcnLDXYng+0GQUAqhd9mWx74Y8k5EUewX+bQbaIfs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3eqMxvelzHwbn1SgEbBW1YzM00UUbAsD6ThPYecn84V/BVm0n
	rvFwNV3Y9Yufs4CMCx8LPcBf/QYckjDjoAKEEiybPmAHcXMv2H2F3pm7
X-Gm-Gg: AYBFou0kKF+rK7O4WUHZXBD20M3xNDEc1XmqfGcXQ0Bd4ATkqqu7mkBuWk0V+XRHnfX
	p0OhTPBNpwZdMHfQ3aLlDzfCfBSa8SXghlRs2ofs+ol5rCaLkeuRZ9i4yMl4t0F3ciDdhcGcjeQ
	pcWiLAP/xUDTVaIGI8dxwLJeHsAs4LXSw6Vy9Rh60nYN01CGa4z6uHolWm+geTiGVwY0k8dP1oN
	Aoy+G7HKYhw936CbIubtkt6+DM38iKa5QBYbRhIZRPlsXuQ4iyfsbSZ1ZaOmnlajl9BbXU/84YF
	bM8fzCfuAosr0ckgYcZCWG0Ab+Qnr4YBrVswgqWEUhXh1e23dLkQXBKA64hJi4Gk1AnLgLPhMcG
	Wl4fIceV4FS7ISYjp/OFtI7xn6z+8CGHW1OHVYonWKP4i/FEQ9pNe9EnmG7UOP8oNqMOO/vIZHk
	PZQa43aRdf0dMxqkvv60nLphkigrLKagCIRDEiN8DjfkCo59fYNwoc6EkhjMK9neKriInivXhJ3
	vvSrnCDenGFQBnZhjBwxC+56tPDbUYa9jzk2sJbZRkq2lAlmq4jbtme4jyYU2qjGka5kFYJelMP
	VHpxKerViJDlJumABC4=
X-Received: by 2002:a05:6102:a4f:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cb367883bdmr130748137.1.1791506146842;
        Thu, 08 Oct 2026 17:35:46 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3539092esm488922137.3.2026.10.08.17.35.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:35:46 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v4 4/4] scsi: target: rd: Avoid 32-bit overflow in protection space size
Date: Thu,  8 Oct 2026 20:35:34 -0400
Message-ID: <20261009003537.62265-5-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261009003537.62265-1-sanan.hasanou@gmail.com>
References: <20261009003537.62265-1-sanan.hasanou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

rd_build_prot_space() computes the number of protection pages as
rd_page_count * prot_length / block_size. rd_page_count is a u32 and
prot_length an int, so the multiplication is done in 32 bits and wraps
once rd_page_count reaches 2^29 with 8-byte protection information,
that is for a 2 TiB ramdisk. The protection sg tables are then
allocated much smaller than the device needs. A command whose
protection data starts inside the allocated range but extends past its
end makes sbc_dif_copy_prot() walk off the last scatterlist and
dereference the NULL returned by sg_next().

Do the multiplication in 64 bits. The quotient still fits in a u32
because prot_length is smaller than block_size.

Fixes: d7e8eb5d9216 ("target/rd: Add support for protection SGL setup + release")
Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 drivers/target/target_core_rd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 2613342be..d7752fd34 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -253,7 +253,8 @@ static int rd_build_prot_space(struct rd_dev *rd_dev, int prot_length, int block
 	 * 		   (prot_length/block_size) + pad
 	 * PGSZ canceled each other.
 	 */
-	total_sg_needed = (rd_dev->rd_page_count * prot_length / block_size) + 1;
+	total_sg_needed = div_u64((u64)rd_dev->rd_page_count * prot_length,
+				  block_size) + 1;
 
 	sg_tables = (total_sg_needed / max_sg_per_table) + 1;
 	sg_table = kvzalloc_objs(*sg_table, sg_tables);
-- 
2.48.1

