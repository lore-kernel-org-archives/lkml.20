Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7683D967F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279291; cv=none; b=KntTv3pb2A2k1wPiV4QHthqDRM+SgBZtZhtalTzqJnXAqG89TO4gOXP/EyVGQbQGuMudq1dYjBPoUh6ek6EHtNCeA32MIUl+fGS9D8zP/qeHTKBkm+nvxBpboZdMkA2Y/bDs0ElAQ7LgUNthXANFA5fA55I52auNj6r/6O8E2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279291; c=relaxed/simple;
	bh=v2LleU7DjwKjyo5byw/PeaE+ykCm1p6AnsUT0DG35ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dxU6GXDB7juAXW0hpjS5E8NyTrsRAbSOYBlx6277HVlLP2FJKj0L5/CKtTqXcSFpKyqq5MKAkUnFAV9qLowI7syFKugbhrNXtZYAsduRYx6rpvJb1aOSxAFUcO3fYhZNrJgPqUdHz9qHgHYccpzw2PDlQL7K0QTIXf8lduczfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xma5nqY0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xma5nqY0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so949330a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279281; x=1791884081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiH8I2vivbUrNosTf6kMbDPyLsej137IHvnAUOusej4=;
        b=Xma5nqY0pynAzbViNIbPat6cJO99vODJZn1Mta03msl0n95hdeViM1BuTVZC/NDfo9
         JENZbkM+b3G/jrIaDOc8RpFvFrmRXxMYB2aF7lCi6D6fH4TnVZCp0Hti8jWQ9d4jd1x9
         LYZtcRFrP8gKwBtu79IA8WO58O4NtUWwDwpOOeGXv/B5xo4YWBrkdkk0QXtN6DSiCd6E
         EnujXyUE4hyvb0OpfvkyQ4bLSRT5bHRZJBnUpgDxrmY3Q2lNOD8SyFclG2meuO9wGtAq
         gOebO4eZD1HJ8zoijJI3Phy9M8EW8lOwZBwd3ntPUrhfxzG3s1E6FJ0OJHSOvCB4IlPH
         tIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279281; x=1791884081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiH8I2vivbUrNosTf6kMbDPyLsej137IHvnAUOusej4=;
        b=NCw9ns7OiREZtJyjhFaTOzQ4zeUVGsJF+7GLR12ikp4T0/nXQhWe0BbQIhV0olZ5Qi
         raassnRT596FDTW/XxrHwzEpEGmyq58m1LHjQqvPWRnWuw6X+bjQEbmRsfQCSC1zPg3p
         FMUiLNsPitNiqO2OUlsQg0/z6Cx83PBPuF9gybP9SEIXebu7tRdZb6OAXvZACA1HWK/o
         OvWTL5bMNf9jE7MORqt8WzHYhTLIseLrtQGqXlbbIfRQu5QAmHhmkl3LmqSxgPOCZpWa
         JlHsPUIwrwq51xcGGtSZTnAzCO13f3/mWkWmr+otjhwihQrVdM6j4xQAc9IASsVTjX3h
         JIMg==
X-Forwarded-Encrypted: i=1; AKwUvBwdMqzl9uq5wcZDWf4xkE331IkLBct9SrNyRKFDC1Syy8D2AfGTWYffTWIH3ovKbyly8FwQAEYAbPzvPqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL63V7KnDJxY+qDIvy0LrB5GlmFrVYXoLfTisnotseuWSs7Dbn4
	hjBB8ZG0ttN28rL67wMV9ADYuZx6CWyz5/W8fQbfaDoAPsl97lKQ2O3j
X-Gm-Gg: AYBFou0RbGqpLQMiW7ZoVnNNS8WDrD7oNQ8h519H/ak7blvZMAPWhx9cK7a1RwM3V5B
	/GpSCreO64Rv7QjcZwxmCNIJo+mbt/+mEqj9q3yF3cybc1SjHniGGgS9DGYUf5ZP/4g9s40qkYg
	XRnGDHzhatlLX6+YNtC9edazw0ySdlkxVApVsxCT/ed9OIgIH7ZBn75aTURt54cuDIaAB5nFUk7
	as2/xN++aXfztz3zNfL5pxeyEDIAYcsKtGz7kNcTcB0VGQ6DSCSqEXzWEtHbSVaSr0BPR04kEfv
	BQv6nW1gWpDvcIDv53brpt5v1DlYbZsEnNad0amzwWad0c90vLfeyX7EOyJQTqPR6ERKsomUEI7
	qEcxmfZjE5sBAE0Wkhoa+rPMcug5lENpg8HIDTwUmeMvkpAV1qdKDC7Q4IsfrxDWp4/JbpoasAH
	fBT69MHr6JBFk9I7wm74an4yafQp29N+NPj3VVMsWydGB2BC1aCw30iA2W735XqacId4yd9J9z3
	J7ozJhw
X-Received: by 2002:a17:90b:4d02:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-3a87267ea23mr746760a91.6.1791279280466;
        Tue, 06 Oct 2026 02:34:40 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm3905277a91.13.2026.10.06.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:34:40 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>
Cc: Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	James Bottomley <James.Bottomley@suse.de>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH 5/8] scsi: target: copy a DIF verify tuple across prot sgs
Date: Tue,  6 Oct 2026 17:33:35 +0800
Message-Id: <20261006093338.27342-6-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006093338.27342-1-physicalmtea@gmail.com>
References: <20261006093338.27342-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sbc_dif_verify() loads an 8 byte t10_pi_tuple while i < psg->length.
A protection sg shorter than 8 bytes still enters the loop.

vhost-scsi keeps each sg inside one page. Eight PI bytes that start
at page offset 4092 are mapped as 4 bytes at that offset and 4 bytes
on the next guest page. The first sg still satisfies i < length, and
the tuple read continues into the next physical page.

Software verify runs when the fabric does not advertise DOUT_STRIP.
vhost-scsi advertises only DIN_PASS and DOUT_PASS. With
fabric_prot_type 1, a WRITE is TARGET_PROT_DOUT_STRIP and
sbc_dif_verify() reads the guest PI buffer.

Copy the 8 byte tuple across protection sg entries before the check.
Four bytes at the end of one entry and four at the start of the next
stay one tuple.  A tail with no following entry fails the command.

KASAN reports:

  BUG: KASAN: use-after-free in sbc_dif_verify+0x5ab/0x790 [target_core_mod]
  Read of size 4

  sbc_dif_verify
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd
  __target_submit
  target_queued_submit_work
  process_one_work
  worker_thread
  kthread
  ret_from_fork
  ret_from_fork_asm

Fixes: 18213afbd8ce ("target: handle odd SG mapping for data transfer memory")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c | 117 ++++++++++++++++---------------
 1 file changed, 60 insertions(+), 57 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 12275ebad95c..c0aeb8886743 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1492,81 +1492,84 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 	       unsigned int ei_lba, struct scatterlist *psg, int psg_off)
 {
 	struct se_device *dev = cmd->se_dev;
-	struct t10_pi_tuple *sdt;
 	struct scatterlist *dsg = cmd->t_data_sg;
 	sector_t sector = start;
 	void *daddr, *paddr;
-	int i;
 	sense_reason_t rc;
+	unsigned int poff = psg_off;
 	int dsg_off = 0;
 	unsigned int block_size = dev->dev_attrib.block_size;
 
-	for (; psg && sector < start + sectors; psg = sg_next(psg)) {
-		paddr = kmap_atomic(sg_page(psg)) + psg->offset;
-		daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-
-		for (i = psg_off; i < psg->length &&
-				sector < start + sectors;
-				i += sizeof(*sdt)) {
-			__u16 crc;
-			unsigned int avail;
-
-			if (dsg_off >= dsg->length) {
-				dsg_off -= dsg->length;
-				kunmap_atomic(daddr - dsg->offset);
-				dsg = sg_next(dsg);
-				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
-					return 0;
-				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-			}
+	if (!psg || !dsg)
+		return 0;
 
-			sdt = paddr + i;
+	paddr = kmap_local_page(sg_page(psg)) + psg->offset;
+	daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
 
-			pr_debug("DIF READ sector: %llu guard_tag: 0x%04x"
-				 " app_tag: 0x%04x ref_tag: %u\n",
-				 (unsigned long long)sector, sdt->guard_tag,
-				 sdt->app_tag, be32_to_cpu(sdt->ref_tag));
+	while (sector < start + sectors) {
+		struct t10_pi_tuple sdt;
+		__u16 crc;
+		unsigned int avail;
 
-			if (sdt->app_tag == T10_PI_APP_ESCAPE) {
-				dsg_off += block_size;
-				goto next;
-			}
+		if (poff >= psg->length && !sg_next(psg))
+			break;
+
+		if (!sbc_dif_prot_copy(&psg, &paddr, &poff, &dsg, &daddr,
+				       &sdt, false)) {
+			cmd->sense_info = sector;
+			return TCM_LOGICAL_BLOCK_GUARD_CHECK_FAILED;
+		}
 
-			avail = min(block_size, dsg->length - dsg_off);
-			crc = crc_t10dif(daddr + dsg_off, avail);
-			if (avail < block_size) {
-				kunmap_atomic(daddr - dsg->offset);
-				dsg = sg_next(dsg);
-				if (!dsg) {
-					kunmap_atomic(paddr - psg->offset);
-					return 0;
-				}
-				daddr = kmap_atomic(sg_page(dsg)) + dsg->offset;
-				dsg_off = block_size - avail;
-				crc = crc_t10dif_update(crc, daddr, dsg_off);
-			} else {
-				dsg_off += block_size;
+		pr_debug("DIF READ sector: %llu guard_tag: 0x%04x app_tag: 0x%04x ref_tag: %u\n",
+			 (unsigned long long)sector, sdt.guard_tag,
+			 sdt.app_tag, be32_to_cpu(sdt.ref_tag));
+
+		if (sdt.app_tag == T10_PI_APP_ESCAPE) {
+			dsg_off += block_size;
+			goto next;
+		}
+
+		if (dsg_off >= dsg->length) {
+			dsg_off -= dsg->length;
+			kunmap_local(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg) {
+				kunmap_local(paddr - psg->offset);
+				return 0;
 			}
+			daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
+		}
 
-			rc = sbc_dif_v1_verify(cmd, sdt, crc, sector, ei_lba);
-			if (rc) {
-				kunmap_atomic(daddr - dsg->offset);
-				kunmap_atomic(paddr - psg->offset);
-				cmd->sense_info = sector;
-				return rc;
+		avail = min(block_size, dsg->length - dsg_off);
+		crc = crc_t10dif(daddr + dsg_off, avail);
+		if (avail < block_size) {
+			kunmap_local(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg) {
+				kunmap_local(paddr - psg->offset);
+				return 0;
 			}
-next:
-			sector++;
-			ei_lba++;
+			daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
+			dsg_off = block_size - avail;
+			crc = crc_t10dif_update(crc, daddr, dsg_off);
+		} else {
+			dsg_off += block_size;
 		}
 
-		psg_off = 0;
-		kunmap_atomic(daddr - dsg->offset);
-		kunmap_atomic(paddr - psg->offset);
+		rc = sbc_dif_v1_verify(cmd, &sdt, crc, sector, ei_lba);
+		if (rc) {
+			kunmap_local(daddr - dsg->offset);
+			kunmap_local(paddr - psg->offset);
+			cmd->sense_info = sector;
+			return rc;
+		}
+next:
+		sector++;
+		ei_lba++;
 	}
 
+	kunmap_local(daddr - dsg->offset);
+	kunmap_local(paddr - psg->offset);
 	return 0;
 }
 EXPORT_SYMBOL(sbc_dif_verify);
-- 
2.34.1

