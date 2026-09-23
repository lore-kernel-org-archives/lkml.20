Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD6053163A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169207; cv=none; b=hDwqAo08ugX2Dau5EknLm6Rc7sHnDpfJ2qwBkR6iK4yDWaIIvLGloQWboqNJc1uAfr36XvNlxsZpMX8GGnHbkkrruYaxQdhnAeWugQ5DouRLJmhBXyLTd/VhUPgzwMhDzvSmDTXUmfPTNyKpWUVgiUUgNzLQ40B6HRstO/Hbm7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169207; c=relaxed/simple;
	bh=wJPbewVAsF07/WKXUvjLddxh2zDS4t1o5x9ugWJR6EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2YO0a5qjiwhNd3zWFyexATw7xHreDtO/rJwudG19ui/2sj0cuu7D+p6Ew46P5JS0+6nM0FVBuRnA0Cw/F3DUi/wRWC0DebDwhtEC8MMUT300VhXcWt1/Gwe2KiuCSrCfSdafeBAJoMcC9mySWqTscbsKr4JcqWF/+vw1+NZBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orjoyvcP; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orjoyvcP"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc39so824931fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169205; x=1790774005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWcsyWerzXtmqpdXsdvwUzYUFNtc0z30AKuwtSX4TlE=;
        b=orjoyvcPw50EmeaJOqhxKIZRhoxLAo0uWIso4JrS2ty7Fu2oIiC2cuNQ/IKlbXs7FK
         2lpXLkPr7Zxtq37lmWZK3N+wK1/skKq0e3PfRzjhj3K476kaBYLA5EVrWqoOTcNcmqS4
         LCntTxW5YLc6VMFlJsvmlmtAR/Myf+UpG8V0JtdVxdMqV6SE9/JLVs5DsqBJlJ+JJJM4
         +hGxyh4VPZ3yVH2UzHwyMRuhfsIn9yIrfbawgcDG+ZjJePnuM51SG/oH0d343SUcTNi2
         lrj2jEwh1YXwMIv17s3Te6U6kMhuwiy+e1tE6yD7MOC1128R1WcfsGzSgOc/28osm8fT
         REQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169205; x=1790774005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWcsyWerzXtmqpdXsdvwUzYUFNtc0z30AKuwtSX4TlE=;
        b=Pb9RajO6eLM54ZJveB2COJZal9p0yavRWT1a8Vm0IFZcKOm6kj2sGqW4l6hvc2Eiwb
         HMjWW6B1UEMjZvubEnZ+devRVVJ2nnGIYsYDN/pNReeOiDkaulvEIw+l4xi4v+C3fnyv
         ThK5wz5iv3FELg2IUFmpHxKnWY/cbEsYT//46v4KITetn9elPTFTyX/Fv1tlfVY59EwH
         APGW4WSdsKRGCQECBJX4GcD6MJ3kR0OawxozwlUydAUg1acLJ4Bsn6wJ1YJ6MgY0yfZ7
         XK1BPpEQSi7e63NmQgotvsWDLTAsJQcqX/IqHqKNw/57EuT1AsQlQNNcV/TAD6sIeVaX
         Tc3A==
X-Forwarded-Encrypted: i=1; AKwUvBwdr/dVu4xEDggYyYec7fX2xutRV3LghzORmB3xdavxuejxSdahQLIVunx0FRmziQ9Q0R5+v0IR6/VhChg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+eaSd2O1Cfd4rFYgG3jtahLx/YRtrrwUp+llVVY0EifPLubCc
	Y+6SPGuFaRF3n9l8iKlcKJy6NZ1CF5J28eEolP64rsSkBA21Wk2+5iId
X-Gm-Gg: AYBFou2RbjFdOTFm2oOo60+kHQlANdswbngp8K2Lka+uTA/HxXQMILSL0ip5V5GCqUS
	oC3PaC4GCYP+tB++LAbRyC+d1tj6kzDoxRERLx5ehhmIKu5pExFaq5X1lD50zOtSspzpwQ7KA/p
	6sH0cvCjzPUmQgQO/Ob5jA8BNriKjaXSXwm8OfFP+rjKC3CICa4gN/lSmnRhJ+QIa3oNXr7/jGZ
	sQQa9G9vnvsi9f42zzteYIW+gl5YKHB5dSo5HerPLpzAGtyaFQorHm5DQlhWBmJEI93rc62YLpM
	kWq3lFDS2mwcL1erWeKkzajRYy4+rSHuDJm4Sj+fDweT49drGY950n5tmRnEgPzyX2iyWhY5Q63
	xiByu1WspnEnL3iOqO/HD0JvR/OGGN9ZW8zeheO+5zkzVuyuLvMmqYOjsOCF0RxZWqGkQGGm/Li
	7/T/Lc4HBO6oU566irjIp9XF0d9ZoaaUDRXpaHf88BtrKf3V8QPsquYzDyqxxYP0t3wGLgGdyA3
	LPapslysa8gWch2EezPrlQYkAUEOn6fGojLf084
X-Received: by 2002:a05:6871:5814:b0:48f:e0e5:a1fa with SMTP id 586e51a60fabf-4908c3d6c7emr2513096fac.46.1790169204734;
        Wed, 23 Sep 2026 06:13:24 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908e54f277sm1599838fac.7.2026.09.23.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:13:23 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] scsi: target: core: Fix kunmap_atomic() address in sbc_dif_copy_prot()
Date: Wed, 23 Sep 2026 08:13:18 -0500
Message-ID: <20260923131319.310123-2-danishkhateeb03@gmail.com>
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

sbc_dif_copy_prot() copies protection information between the command's
protection SGL and the backend's SGL "sg". It maps each page of "sg" with
kmap_atomic() and unmaps it with kunmap_atomic(addr - sg->offset - offset).
The unmap runs after offset has been advanced by len, so it is passed an
address len bytes below the start of the mapped page, inside the page
below the mapping.

The only caller, rd_do_prot_rw(), passes the rd backend's protection
pages, which come from alloc_pages(GFP_KERNEL). kmap_atomic() of a lowmem
page returns its linear address, and kunmap_atomic() of a linear address
has nothing to unmap, so the wrong address has gone unnoticed. It matters
on 32-bit x86 with CONFIG_DEBUG_HIGHMEM, which selects
CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP so that lowmem pages get a real
temporary mapping too. kunmap_local_indexed() then warns

  WARNING: mm/highmem.c:623 at kunmap_local_indexed+0x148/0x190
  Workqueue: target_submission target_queued_submit_work
  Call Trace:
   sbc_dif_copy_prot+0xef/0x310
   rd_do_prot_rw+0x115/0x140
   rd_execute_rw+0x354/0x3b0
   sbc_execute_rw+0x2b/0x40
   __target_execute_cmd+0x22/0xb0

and clears the right PTE, but x86 flushes the TLB entry of the wrong
address. The stale entry keeps the slot pointing at the old page, so the
next page mapped there is not the one accessed. With an rd device with
pi_prot_type=1 exported through tcm_loop, reads and writes then fail
with "DIFv1 checksum failed" errors.

Unmap the page before advancing offset, so kunmap_atomic() gets the
address kmap_atomic() returned.

Fixes: 57636388af32 ("target: Fix inconsistent address passed to kunmap_atomic() in sbc_dif_copy_prot()")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/target/target_core_sbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 21f5cb86d70c..55a8c2f0a286 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1347,13 +1347,13 @@ void sbc_dif_copy_prot(struct se_cmd *cmd, unsigned int sectors, bool read,
 			else
 				memcpy(addr, paddr + copied, len);
 
+			kunmap_atomic(addr - sg->offset - offset);
+
 			left -= len;
 			offset += len;
 			copied += len;
 			psg_len -= len;
 
-			kunmap_atomic(addr - sg->offset - offset);
-
 			if (offset >= sg->length) {
 				sg = sg_next(sg);
 				offset = 0;
-- 
2.55.0

