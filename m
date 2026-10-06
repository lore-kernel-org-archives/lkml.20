Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF03D890C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279293; cv=none; b=q1lZBQ/blOjI9rMeqFuBRNrKcddiqZFNcPLovVfiRliZl8b5Ap94ziztEvrSGGXXZF9yYQAb1F9U39YB9OlKk+MNtkgU/k14c5o9/6reJnKkcvwPAJHAtmRejR9662yRX4B7sk2EOnKVm+LF+x7qDzn2o8Ve4qztkpqUfPthPoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279293; c=relaxed/simple;
	bh=K1Cdy0hZLUv7y3GkdQGg491Yxdx0wxO32Vu+2QYlCcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R5t6lLJCiqnSwcSivUdwP86C6lSwcQICbgu2iSykvXphOwN3FnmJpMULmDCC4gp1ZXmEVI2oSjIMu9Ltv58HaTP6KHKBccle1WsqLG4KFXBhD/h0w77sjaKVCaGvVkIZzo/cRFKsLe4myZaKjFiRg8t9DUo/4HvsZDthOPx/ca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmbH++Q2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmbH++Q2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so261088a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279285; x=1791884085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL2jFqv3JPAJHulSvum0HPm0fQ5nZHPbZHfKCLsG7HQ=;
        b=FmbH++Q2Q4k/xIr9KgqRdDqC3nC1znkFPCfirIkSoCrxxKXwgnZll/WfU2t0S8XGUt
         sSOOSA3Qsi9p6uVfqW8G/12SpgM/zO9pO9pMyMg+dgZrMxskX3DAqHPWEfbZho72iUpO
         kLRgqWbKNWX5xGMmOh+x4Dc5DvYKU0rZuV45ctqotZYVwSdf/FC9HLcQNeL5u+mtjIC4
         o0TYBlXJ9cj4ZncBtwC2hOA/BS3bgFiIsTfU+tCTzM0YKMr+LLibgC/ODzRobkAm+34r
         SClfDUtMFpvqIvt6tRTH1RLgscNsAcvbHyj5J/qetOO0z+VqVrQvvjdeAuZRskNa0XjL
         5RjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279285; x=1791884085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cL2jFqv3JPAJHulSvum0HPm0fQ5nZHPbZHfKCLsG7HQ=;
        b=jea0F2OZt09FUfcMHRpgDdZ6Eodwz6SYeUpX5efLghST7I9CX3TPMWh0lSVeI1IbAC
         7L6nFeoZJfy/karAEqZPmvt+1r8mIGnDXqNs9zKwH07ZI86bInkCBnXzw62d1nnYSc2r
         e5ThyXOYKbFmfbZENMfkt41S02CatkxerMDteaxz37i4WliYP/2Qo6Tz7npxExLmSoSU
         RyzlJxD7x1UUdIFLrnKtBXZ314WnO1dxwyXlczt3C2SQOvExb8OsY92G0+tm+p4l0CVf
         egaxWT5c1T/z3G/B+J0KS1UMuwtYHRi3rWnT2fA2Yc8mN47bud3R37ikbjhPKmX2gxeT
         T4ig==
X-Forwarded-Encrypted: i=1; AKwUvBy4NBqSE4NM9c9lB3DH4iQTBcw/Mrp3UG9DV0K1HzLRmXeMpeS5GO0vdNGjea41yEdW4LUOlvmA/h4hUoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa/BJxO74/sCTZxRlXN8xM2D7HBIkIeYv7VnouqwXRfKv4TbiN
	FfncnUG0E2D7BK4BGdBGQXRnCzex0rlSenJpptlRxktiPv+XTGxHTGKF
X-Gm-Gg: AYBFou1pdk1ztWHIflOt4gBbQOCew7tTRmIATlWjW8yMAqcXm6BOipQ4EvuPjgq/HhU
	9jVWeqdxF5xgnRuzjhz5/7Pmgk7ZRSvq0VuCrozbb2VrAAj8ntI6auGbdiwncnEmCJwFSwPW1sZ
	9VR02mCpry8nJy1hxCTWR6wKtcKKI7d4yv/rpHRa7NNYXZnes0tbqcxGu3799NlGAbL+cJQ2LEo
	C7+DhYDuJgGVxNyFLHoKUbGieo1AbehSUMpd1ZG+KNvyGBH2B4lBqh4VKkmIRA3BH5Pt74yneay
	Vynmw7ces/RiGvHjtSzWp/TO2iPorC12aVT3jTh2OGuK3YrZk8BAiDsOAI4VCS3dbwIZqwphpan
	1280mENz1uOw31sAcFnSQeUg46c89FmheNHgRuaAThivT5Ai/+eL3bUZBGZwrIojZGHLVgz+HUk
	N7JoFpyJ8Np/BF9PioJUR6Xr1GIIQZJ64dbpV8TmlcgsO/a/lFeiN2Z+w2BqFYMN0OskYs/A==
X-Received: by 2002:a17:90b:5101:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a87254fb70mr329706a91.6.1791279284761;
        Tue, 06 Oct 2026 02:34:44 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm3905277a91.13.2026.10.06.02.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:34:44 -0700 (PDT)
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
Subject: [PATCH 6/8] scsi: target: limit DIF block CRC to each data sg
Date: Tue,  6 Oct 2026 17:33:36 +0800
Message-Id: <20261006093338.27342-7-physicalmtea@gmail.com>
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

sbc_dif_generate() and sbc_dif_verify() CRC one logical block from the
data sg.  When the first entry is shorter than the block, the remainder
is read from the next entry with

    crc_t10dif_update(crc, daddr, block_size - avail)

That length is not limited to the next sg->length.  A 512 byte block
split 256 + 100 + 156, with the 100 byte entry ending on a page, reads
156 bytes into the next physical page.

vhost-scsi can build that layout from one guest data buffer.  Software
verify and software INSERT both use this CRC.  Walk later entries and
read only the bytes each one actually holds.  The helper unmaps the
current data page and may leave a later one mapped, with the same
kmap_local_page() calls as the rest of the walk.

KASAN reports:

  BUG: KASAN: use-after-free in crc_t10dif_update+0x91/0xf0
  Read of size 1

  crc_t10dif_update
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
 drivers/target/target_core_sbc.c | 54 +++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index c0aeb8886743..76dbc986e887 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1310,6 +1310,44 @@ sbc_dif_prot_copy(struct scatterlist **psgp, void **paddrp,
 	return true;
 }
 
+/*
+ * CRC the rest of one logical block.  @need is the byte count still
+ * unread.  Take only what each following data sg holds.
+ */
+static bool
+sbc_dif_crc_rest(struct scatterlist **dsgp, void **daddrp, int *offp,
+		 unsigned int need, __u16 *crc)
+{
+	struct scatterlist *dsg = *dsgp;
+	void *daddr = *daddrp;
+
+	kunmap_local(daddr - dsg->offset);
+	while (need) {
+		unsigned int take;
+
+		dsg = sg_next(dsg);
+		if (!dsg)
+			return false;
+
+		daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
+		if (!dsg->length) {
+			kunmap_local(daddr - dsg->offset);
+			return false;
+		}
+
+		take = min_t(unsigned int, need, dsg->length);
+		*crc = crc_t10dif_update(*crc, daddr, take);
+		need -= take;
+		*offp = take;
+		if (need)
+			kunmap_local(daddr - dsg->offset);
+	}
+
+	*dsgp = dsg;
+	*daddrp = daddr;
+	return true;
+}
+
 void
 sbc_dif_generate(struct se_cmd *cmd)
 {
@@ -1358,15 +1396,11 @@ sbc_dif_generate(struct se_cmd *cmd)
 		avail = min(block_size, dsg->length - offset);
 		crc = crc_t10dif(daddr + offset, avail);
 		if (avail < block_size) {
-			kunmap_local(daddr - dsg->offset);
-			dsg = sg_next(dsg);
-			if (!dsg) {
+			if (!sbc_dif_crc_rest(&dsg, &daddr, &offset,
+					      block_size - avail, &crc)) {
 				kunmap_local(paddr - psg->offset);
 				return;
 			}
-			daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
-			offset = block_size - avail;
-			crc = crc_t10dif_update(crc, daddr, offset);
 		} else {
 			offset += block_size;
 		}
@@ -1543,15 +1577,11 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 		avail = min(block_size, dsg->length - dsg_off);
 		crc = crc_t10dif(daddr + dsg_off, avail);
 		if (avail < block_size) {
-			kunmap_local(daddr - dsg->offset);
-			dsg = sg_next(dsg);
-			if (!dsg) {
+			if (!sbc_dif_crc_rest(&dsg, &daddr, &dsg_off,
+					      block_size - avail, &crc)) {
 				kunmap_local(paddr - psg->offset);
 				return 0;
 			}
-			daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
-			dsg_off = block_size - avail;
-			crc = crc_t10dif_update(crc, daddr, dsg_off);
 		} else {
 			dsg_off += block_size;
 		}
-- 
2.34.1

