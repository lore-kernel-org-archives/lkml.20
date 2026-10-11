Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679C378823
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691394; cv=none; b=RDmcYfLeJPwpHSLSUjKPSG0iEDujE0sLawZPDX0XZUDMxW1fG+YlbPERS/udM5uwPuBzxGo+M+XQdZQ2v5tlQInf1xnJ3pkga26kUPEIkXDYd9CtaitVKMgjZeVrDgEaI0S4aWtND5JxJeA0ftuke1jfsueEVWIlZ39MXuxYth0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691394; c=relaxed/simple;
	bh=Ubdh0wkdp0p+m0cvoJkQYJfajsIHUREWttw94ZHvBZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjMHdp6jlEFoYhXLbA1+oUyXYRvcl+uC0rVgSfoT3rqPAdzSCzqlIourSkCfHaMAt7+ySXhnNIIHDEaUNx0KdOFqVQBXJkyPQEDwOO+2zW99XhFyhBGtNCk53vqC0Iaar93vA5hezBmv2MTverCrZxgPJsI0ZzJUVe+Z7wUR+1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=qUq6JtBB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="qUq6JtBB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8875d220446so353250b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791691392; x=1792296192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFj0iQHYatf3VC/X6KIKE0h1vqYOsEeh1yRkVHySjs8=;
        b=qUq6JtBB0uwgS8QqLw6NxBjqn9Kg2ksXbTuTWJP+wHfkdKJrCYk0f5YQHK3ej0XZ0B
         i8BAO+F5qanIgo6rzZaJkJSMx9x+eCrGbgcaCHI3UKd0HkMa0Mws9b/A/E+8Piy0k8pH
         9eCPmp4e9HukMtcOWPpgU1OESetSoqc2s34wjWckXsgKT1XNtyaQBRrqcDJTUPDIturA
         UREsfvkrnZyiUILRmZUxAh9xWf3sUcqDZjYwp0XkmB1PlyzJ9i54utajZ+nViNoc5eg/
         zPOzrBU+vWzyYvNkbMdaCpluH7jRw+FXk8h2FX7fo8XKYNpU2PIMP7LqeKZHsSIja0g7
         OgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791691392; x=1792296192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iFj0iQHYatf3VC/X6KIKE0h1vqYOsEeh1yRkVHySjs8=;
        b=wUDewCk2vaxn50Zh43wakpCfgJzfp2/u6zGjeNtfah7sDkc+Zr0/gAs2MZNxjrnTSZ
         f5ngOqWw53H/U2gDdMkGH5D2xzHENvp6fxRuuuMGY7Na0XEEin/7uZBJaURXnlcTT/8F
         nZVTEJXO2DtgS3yP2UIZZn6Q8MMTgkfvNdwhM6yqpcyBn6Kdf4w69SzpLNh6+VCpsGAa
         rvpuVDziQtEWNWZEHwqiMYRteXgIFA8OY7JslgvnQYpGB6czPsC75K1/T5LaChz/abM2
         fCHbqwEUxe3JOHvV3tmZjUYB+De0hE5c97ilImGqSjS54LDjjR7l6qOshsRZWjzws/z1
         LMpw==
X-Forwarded-Encrypted: i=1; AKwUvBzswaDzJYh0uTrHbHIxjxedr1U1RkF0+jFmu0osx8OBg7bEfEgNK4dswtFExM2iiaWJaaZuqJtajawYMJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgeKXEXyDZ+IiZuyLFxGLQ1sd66+6vb/oFMxrDLLDySL9+0b5N
	H52dPYkbE3QPBMPsEV6hYrXJgIyLEcpvFEXO69IR377wsnF9eyIDStLCIkEJ2gZVd9A=
X-Gm-Gg: AYBFou3mCTEt8de1Wv7nR53BF5yXYBLVmgWuuYvNfmPCzuRJ7iktTxloPK26isrdECB
	6NAesTROa+xdUFhSDp16pcMe1jfhPGePP43WMUL6ytO6m3H+L90RAHRg23iygwQtXFLpTMzIQJZ
	j3WtfhoOqcab1t8geQ4PlOLxK7+oZyuM/rFshGnoeXvxjwIIqBZ+33Vr+RTXA5bUGbpbVHORMO+
	KPuvgAhoBxOcV5quK6OcWUEK5ThiKPH61Yp6/gcegLnmYZ+ycr8hkvCmMzTmfu8FVfV9Wd113DH
	67algzJ/SFrJfz5L2ZkJebwl9LlCL0FCddwYwBLiS73O0avIeQiNQfk0cDRAViyhb44cUjeMMTp
	CyFzqSVtUKJTkXGINR4OYSfXmjefmknLtK0zdCRGrFAfRGHfIDbTCib/I4pXn+5mtrbor1wZ5ya
	trzZ4ArnawjhbCN4lqapZcVMztWQ+bm1/8jXc29I0xMTczW7qLxwxw+r9jF2sv8qsTHdEdDtTW+
	YTkEj4ICbN5sxVvky1VYhy2YVH60xTw
X-Received: by 2002:a17:90b:2886:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3ab3acf7535mr5100737a91.46.1791691392177;
        Sat, 10 Oct 2026 21:03:12 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:9657:9541:a576:7d2f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm10519758a91.5.2026.10.10.21.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:03:11 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org
Cc: Mike Christie <michael.christie@oracle.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v2 1/2] scsi: qla4xxx: bound the ISP83xx reset template to its buffer
Date: Sun, 11 Oct 2026 13:02:56 +0900
Message-ID: <20261011040257.2017421-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
References: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qla4_83xx_read_reset_template() reads the reset template out of the
adapter flash into a fixed buffer:

	ha->reset_tmplt.buff = vmalloc(QLA83XX_RESTART_TEMPLATE_SIZE);

It then takes the template length from the header it just read and uses
it to size the second flash read:

	tmplt_hdr_def_size = (ha->reset_tmplt.hdr->size -
	    ha->reset_tmplt.hdr->hdr_size) / sizeof(uint32_t);
	ret_val = qla4_83xx_flash_read_u32(ha, addr, p_buff,
	                                   tmplt_hdr_def_size);

hdr->size is a 16-bit field supplied by the flash contents and nothing
bounds it: QLA83XX_RESTART_TEMPLATE_SIZE appears only at the allocation
and is never compared against anything. qla4_83xx_flash_read_u32() walks
its word count storing one dword at a time with no end check, so a
template claiming a size larger than the 8192-byte buffer stores up to
~57 KB past it with flash-chosen contents. The checksum test runs after
the copy and cannot prevent this.

  BUG: KASAN: vmalloc-out-of-bounds in qla4_83xx_flash_read_u32 [qla4xxx]
  Write of size 4 at addr ffffc90000057000 by task init/1

qla4_83xx_process_reset_template() then walks the template with
hdr->entries as the loop bound and each entry's own size as the stride,
and the per-opcode handlers read hdr->count items from an entry. These
values all come from flash and none is checked against the end of the
template, so processing a crafted template reads past the buffer:

  BUG: KASAN: vmalloc-out-of-bounds in qla4_83xx_process_reset_template [qla4xxx]
  Read of size 4 at addr ffffc90000057004 by task init/1

A read-modify-write entry adds one more: its 8-bit index_a flash value
subscripts reset_tmplt.array[], which holds QLA83XX_MAX_RESET_SEQ_ENTRIES
(16) entries inside struct scsi_qla_host. Only 404 bytes follow the
array in that structure, so an index of 101 or more reads past the
allocation:

  BUG: KASAN: slab-out-of-bounds in qla4_83xx_rmw_crb_reg [qla4xxx]
  Read of size 4 at addr ffff88810644aa28 by task init/1

Bound the template size to the buffer before the copy, keep the entry
walk and each handler's item loop inside the template, and reject an
out-of-range array index. These sizes and counts are little-endian
16-bit flash fields; read them through le16_to_cpu() where the bounds
are computed, so that on a big-endian host the check does not run on a
byte-swapped size while the copy and the walk use the raw one.

While here, fix the state the error path leaves behind. It frees the
buffer without clearing the pointer, so qla4xxx_free_adapter() frees it
a second time on remove, and hdr is assigned before the header is
validated, so it keeps pointing into the freed buffer and a later
adapter reset dereferences it in qla4_83xx_process_reset_template().
Clear the template state on the error path and refuse to walk a
template that is not there.

Fixes: 6e7b429259fc0 ("[SCSI] qla4xxx: Added support for ISP83XX")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/qla4xxx/ql4_83xx.c | 114 ++++++++++++++++++++++++++------
 1 file changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/qla4xxx/ql4_83xx.c b/drivers/scsi/qla4xxx/ql4_83xx.c
index db41d90a5b6e9..44d285af22727 100644
--- a/drivers/scsi/qla4xxx/ql4_83xx.c
+++ b/drivers/scsi/qla4xxx/ql4_83xx.c
@@ -745,7 +745,8 @@ static int qla4_83xx_reset_seq_checksum_test(struct scsi_qla_host *ha)
 {
 	uint32_t sum =  0;
 	uint16_t *buff = (uint16_t *)ha->reset_tmplt.buff;
-	int u16_count =  ha->reset_tmplt.hdr->size / sizeof(uint16_t);
+	int u16_count =  le16_to_cpu(ha->reset_tmplt.hdr->size) /
+			 sizeof(uint16_t);
 	int ret_val;
 
 	while (u16_count-- > 0)
@@ -773,7 +774,7 @@ static int qla4_83xx_reset_seq_checksum_test(struct scsi_qla_host *ha)
 void qla4_83xx_read_reset_template(struct scsi_qla_host *ha)
 {
 	uint8_t *p_buff;
-	uint32_t addr, tmplt_hdr_def_size, tmplt_hdr_size;
+	uint32_t addr, tmplt_hdr_def_size, tmplt_hdr_size, tmplt_size;
 	uint32_t ret_val;
 
 	ha->reset_tmplt.seq_error = 0;
@@ -807,18 +808,36 @@ void qla4_83xx_read_reset_template(struct scsi_qla_host *ha)
 		(struct qla4_83xx_reset_template_hdr *)ha->reset_tmplt.buff;
 
 	/* Validate the template header size and signature */
-	tmplt_hdr_size = ha->reset_tmplt.hdr->hdr_size/sizeof(uint32_t);
+	tmplt_hdr_size = le16_to_cpu(ha->reset_tmplt.hdr->hdr_size) /
+			 sizeof(uint32_t);
 	if ((tmplt_hdr_size != tmplt_hdr_def_size) ||
-	    (ha->reset_tmplt.hdr->signature != RESET_TMPLT_HDR_SIGNATURE)) {
+	    (le16_to_cpu(ha->reset_tmplt.hdr->signature) !=
+	     RESET_TMPLT_HDR_SIGNATURE)) {
 		ql4_printk(KERN_ERR, ha, "%s: Template Header size %d is invalid, tmplt_hdr_def_size %d\n",
 			   __func__, tmplt_hdr_size, tmplt_hdr_def_size);
 		goto exit_read_template_error;
 	}
 
-	addr = QLA83XX_RESET_TEMPLATE_ADDR + ha->reset_tmplt.hdr->hdr_size;
-	p_buff = ha->reset_tmplt.buff + ha->reset_tmplt.hdr->hdr_size;
-	tmplt_hdr_def_size = (ha->reset_tmplt.hdr->size -
-			      ha->reset_tmplt.hdr->hdr_size) / sizeof(uint32_t);
+	/* The template size is chosen by the flash contents and nothing has
+	 * bounded it yet, so a template claiming to be larger than the buffer
+	 * would make the read below store past the end of it.  The integrity
+	 * check runs after the copy and cannot prevent that.
+	 */
+	tmplt_size = le16_to_cpu(ha->reset_tmplt.hdr->size);
+	if (tmplt_size > QLA83XX_RESTART_TEMPLATE_SIZE ||
+	    tmplt_size < le16_to_cpu(ha->reset_tmplt.hdr->hdr_size)) {
+		ql4_printk(KERN_ERR, ha, "%s: Template size %u is invalid\n",
+			   __func__, tmplt_size);
+		goto exit_read_template_error;
+	}
+
+	addr = QLA83XX_RESET_TEMPLATE_ADDR +
+	       le16_to_cpu(ha->reset_tmplt.hdr->hdr_size);
+	p_buff = ha->reset_tmplt.buff +
+		 le16_to_cpu(ha->reset_tmplt.hdr->hdr_size);
+	tmplt_hdr_def_size = (tmplt_size -
+			      le16_to_cpu(ha->reset_tmplt.hdr->hdr_size)) /
+			     sizeof(uint32_t);
 
 	DEBUG2(ql4_printk(KERN_INFO, ha,
 			  "%s: Read rest of the template size %d\n",
@@ -845,17 +864,22 @@ void qla4_83xx_read_reset_template(struct scsi_qla_host *ha)
 
 	/* Get STOP, START, INIT sequence offsets */
 	ha->reset_tmplt.init_offset = ha->reset_tmplt.buff +
-				      ha->reset_tmplt.hdr->init_seq_offset;
+		le16_to_cpu(ha->reset_tmplt.hdr->init_seq_offset);
 	ha->reset_tmplt.start_offset = ha->reset_tmplt.buff +
-				       ha->reset_tmplt.hdr->start_seq_offset;
+		le16_to_cpu(ha->reset_tmplt.hdr->start_seq_offset);
 	ha->reset_tmplt.stop_offset = ha->reset_tmplt.buff +
-				      ha->reset_tmplt.hdr->hdr_size;
+		le16_to_cpu(ha->reset_tmplt.hdr->hdr_size);
 	qla4_83xx_dump_reset_seq_hdr(ha);
 
 	goto exit_read_reset_template;
 
 exit_read_template_error:
 	vfree(ha->reset_tmplt.buff);
+	ha->reset_tmplt.buff = NULL;
+	ha->reset_tmplt.hdr = NULL;
+	ha->reset_tmplt.init_offset = NULL;
+	ha->reset_tmplt.start_offset = NULL;
+	ha->reset_tmplt.stop_offset = NULL;
 
 exit_read_reset_template:
 	return;
@@ -894,6 +918,13 @@ static void qla4_83xx_rmw_crb_reg(struct scsi_qla_host *ha, uint32_t raddr,
 {
 	uint32_t value;
 
+	if (p_rmw_hdr->index_a >= QLA83XX_MAX_RESET_SEQ_ENTRIES) {
+		ql4_printk(KERN_ERR, ha, "%s: Invalid array index %u\n",
+			   __func__, p_rmw_hdr->index_a);
+		ha->reset_tmplt.seq_error++;
+		return;
+	}
+
 	if (p_rmw_hdr->index_a)
 		value = ha->reset_tmplt.array[p_rmw_hdr->index_a];
 	else
@@ -914,12 +945,14 @@ static void qla4_83xx_write_list(struct scsi_qla_host *ha,
 				 struct qla4_83xx_reset_entry_hdr *p_hdr)
 {
 	struct qla4_83xx_entry *p_entry;
+	char *p_end = (char *)p_hdr + le16_to_cpu(p_hdr->size);
 	uint32_t i;
 
 	p_entry = (struct qla4_83xx_entry *)
 		  ((char *)p_hdr + sizeof(struct qla4_83xx_reset_entry_hdr));
 
-	for (i = 0; i < p_hdr->count; i++, p_entry++) {
+	for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+	     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 		qla4_83xx_wr_reg_indirect(ha, p_entry->arg1, p_entry->arg2);
 		if (p_hdr->delay)
 			udelay((uint32_t)(p_hdr->delay));
@@ -930,12 +963,14 @@ static void qla4_83xx_read_write_list(struct scsi_qla_host *ha,
 				      struct qla4_83xx_reset_entry_hdr *p_hdr)
 {
 	struct qla4_83xx_entry *p_entry;
+	char *p_end = (char *)p_hdr + le16_to_cpu(p_hdr->size);
 	uint32_t i;
 
 	p_entry = (struct qla4_83xx_entry *)
 		  ((char *)p_hdr + sizeof(struct qla4_83xx_reset_entry_hdr));
 
-	for (i = 0; i < p_hdr->count; i++, p_entry++) {
+	for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+	     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 		qla4_83xx_read_write_crb_reg(ha, p_entry->arg1, p_entry->arg2);
 		if (p_hdr->delay)
 			udelay((uint32_t)(p_hdr->delay));
@@ -948,6 +983,7 @@ static void qla4_83xx_poll_list(struct scsi_qla_host *ha,
 	long delay;
 	struct qla4_83xx_entry *p_entry;
 	struct qla4_83xx_poll *p_poll;
+	char *p_end = (char *)p_hdr + le16_to_cpu(p_hdr->size);
 	uint32_t i;
 	uint32_t value;
 
@@ -961,13 +997,15 @@ static void qla4_83xx_poll_list(struct scsi_qla_host *ha,
 
 	delay = (long)p_hdr->delay;
 	if (!delay) {
-		for (i = 0; i < p_hdr->count; i++, p_entry++) {
+		for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+		     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 			qla4_83xx_poll_reg(ha, p_entry->arg1, delay,
 					   p_poll->test_mask,
 					   p_poll->test_value);
 		}
 	} else {
-		for (i = 0; i < p_hdr->count; i++, p_entry++) {
+		for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+		     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 			if (qla4_83xx_poll_reg(ha, p_entry->arg1, delay,
 					       p_poll->test_mask,
 					       p_poll->test_value)) {
@@ -986,6 +1024,7 @@ static void qla4_83xx_poll_write_list(struct scsi_qla_host *ha,
 	long delay;
 	struct qla4_83xx_quad_entry *p_entry;
 	struct qla4_83xx_poll *p_poll;
+	char *p_end = (char *)p_hdr + le16_to_cpu(p_hdr->size);
 	uint32_t i;
 
 	p_poll = (struct qla4_83xx_poll *)
@@ -994,7 +1033,8 @@ static void qla4_83xx_poll_write_list(struct scsi_qla_host *ha,
 		  ((char *)p_poll + sizeof(struct qla4_83xx_poll));
 	delay = (long)p_hdr->delay;
 
-	for (i = 0; i < p_hdr->count; i++, p_entry++) {
+	for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+	     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 		qla4_83xx_wr_reg_indirect(ha, p_entry->dr_addr,
 					  p_entry->dr_value);
 		qla4_83xx_wr_reg_indirect(ha, p_entry->ar_addr,
@@ -1017,6 +1057,7 @@ static void qla4_83xx_read_modify_write(struct scsi_qla_host *ha,
 {
 	struct qla4_83xx_entry *p_entry;
 	struct qla4_83xx_rmw *p_rmw_hdr;
+	char *p_end = (char *)p_hdr + le16_to_cpu(p_hdr->size);
 	uint32_t i;
 
 	p_rmw_hdr = (struct qla4_83xx_rmw *)
@@ -1024,7 +1065,8 @@ static void qla4_83xx_read_modify_write(struct scsi_qla_host *ha,
 	p_entry = (struct qla4_83xx_entry *)
 		  ((char *)p_rmw_hdr + sizeof(struct qla4_83xx_rmw));
 
-	for (i = 0; i < p_hdr->count; i++, p_entry++) {
+	for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+	     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 		qla4_83xx_rmw_crb_reg(ha, p_entry->arg1, p_entry->arg2,
 				      p_rmw_hdr);
 		if (p_hdr->delay)
@@ -1046,6 +1088,7 @@ static void qla4_83xx_poll_read_list(struct scsi_qla_host *ha,
 	int index;
 	struct qla4_83xx_quad_entry *p_entry;
 	struct qla4_83xx_poll *p_poll;
+	char *p_end = (char *)p_hdr + le16_to_cpu(p_hdr->size);
 	uint32_t i;
 	uint32_t value;
 
@@ -1055,7 +1098,8 @@ static void qla4_83xx_poll_read_list(struct scsi_qla_host *ha,
 		  ((char *)p_poll + sizeof(struct qla4_83xx_poll));
 	delay = (long)p_hdr->delay;
 
-	for (i = 0; i < p_hdr->count; i++, p_entry++) {
+	for (i = 0; i < le16_to_cpu(p_hdr->count) &&
+	     (char *)(p_entry + 1) <= p_end; i++, p_entry++) {
 		qla4_83xx_wr_reg_indirect(ha, p_entry->ar_addr,
 					  p_entry->ar_value);
 		if (delay) {
@@ -1117,16 +1161,44 @@ static void qla4_83xx_process_reset_template(struct scsi_qla_host *ha,
 	int index, entries;
 	struct qla4_83xx_reset_entry_hdr *p_hdr;
 	char *p_entry = p_buff;
+	char *p_end;
+
+	if (!ha->reset_tmplt.buff || !ha->reset_tmplt.hdr || !p_buff) {
+		ql4_printk(KERN_ERR, ha, "%s: No valid reset template\n",
+			   __func__);
+		return;
+	}
 
 	ha->reset_tmplt.seq_end = 0;
 	ha->reset_tmplt.template_end = 0;
-	entries = ha->reset_tmplt.hdr->entries;
+	entries = le16_to_cpu(ha->reset_tmplt.hdr->entries);
 	index = ha->reset_tmplt.seq_index;
+	p_end = (char *)ha->reset_tmplt.buff +
+		le16_to_cpu(ha->reset_tmplt.hdr->size);
 
 	for (; (!ha->reset_tmplt.seq_end) && (index  < entries); index++) {
 
+		/* Both the entry count and each entry size come from flash,
+		 * so stop rather than walk past the end of the template.
+		 */
+		if (p_entry < (char *)ha->reset_tmplt.buff ||
+		    p_entry + sizeof(*p_hdr) > p_end) {
+			ql4_printk(KERN_ERR, ha, "%s: Entry %d is outside the template\n",
+				   __func__, index);
+			ha->reset_tmplt.seq_error++;
+			break;
+		}
+
 		p_hdr = (struct qla4_83xx_reset_entry_hdr *)p_entry;
-		switch (p_hdr->cmd) {
+		if (le16_to_cpu(p_hdr->size) < sizeof(*p_hdr) ||
+		    p_entry + le16_to_cpu(p_hdr->size) > p_end) {
+			ql4_printk(KERN_ERR, ha, "%s: Entry %d size %u is outside the template\n",
+				   __func__, index, le16_to_cpu(p_hdr->size));
+			ha->reset_tmplt.seq_error++;
+			break;
+		}
+
+		switch (le16_to_cpu(p_hdr->cmd)) {
 		case OPCODE_NOP:
 			break;
 		case OPCODE_WRITE_LIST:
@@ -1163,7 +1235,7 @@ static void qla4_83xx_process_reset_template(struct scsi_qla_host *ha,
 		}
 
 		/* Set pointer to next entry in the sequence. */
-		p_entry += p_hdr->size;
+		p_entry += le16_to_cpu(p_hdr->size);
 	}
 
 	ha->reset_tmplt.seq_index = index;
-- 
2.43.0

