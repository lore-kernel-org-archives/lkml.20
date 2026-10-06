Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963A3DD87B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279299; cv=none; b=Dnc0aQMkawNXYB+44BmqfB5yYdVJnFD6dgUTiyMm15uBlxJhBg9doZFwd6q0LqEBR0jhyiyvYPsC5BV2KHwO/cTgAilvazlMLeI2sptvH9CKwdYwibdtnO3WdhLijmsFm2+1szWVNogNQ78i6O01KhRXXTWWV1sOEOvFD5yUlPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279299; c=relaxed/simple;
	bh=WsLJKfD4eIsxgUWDfay5EKa72kdZ0tjnBWJyqqBv1+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=US14PHihEo1rW3f0wvlwIZmLXsnxVDljCd5yYnsGIMuG/3s2EENLXFSBSeZxd1l/G83qZ/RumEuyn43ryhYvZgwwjYq50oJSY4EK5B/qbXgf+HauYVQDSC+7DTdkNt3OuK1itcx7Zy9Cu90uN/2pQWptZz0s/LgFPNj5ZD7KGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjYC2duS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjYC2duS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so358426a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279294; x=1791884094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uz8HoiiEKQyA9qDT7OXJyTdmhx4sEKhN2lImiOzD/E=;
        b=fjYC2duSkBPmoSUheHcKoESsWy1QBtkE/rMGy5MOYYCN4WapRELVFzH8a8Ecnw4/lE
         haJUGx8FOCrJLEqly8GnYPgsGmCHiDTRE5YIST3PmjAnU/o6hnG+JSLf7PuECaU0AD6J
         +D+JwKa9akCqwCVGOh3Jp7NLOkOYVSrwypAhwyhD0181KPnVGha6S+1eXssq4faBG7AK
         lxPWuiPDFbcjf188Ig7LNWW8FHfpeF1OnuXUDHiGUV7QYfvZMEQA1ZC2S/X78mp109nj
         WYkCdwUm5TpHL3UtvK3+182W30TwgBFBhxmr1NAR4Y5RBrahKWS/5UoCiXq9Gs0c7oZ9
         9R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279294; x=1791884094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uz8HoiiEKQyA9qDT7OXJyTdmhx4sEKhN2lImiOzD/E=;
        b=PlyNem0DPYGbhArHv7nt9WUFY2D9qPz1VZRstDTFYyzOfH1XgXHlu4bhdiEMJR8mYh
         LF73LrIu856JZqtJ1D3yxS4/2I/mSSqpBJZ6XEQymqdM4snRU6ji+8awKzV/Z26qrmAo
         7lOvUjd/1cIC7nrso5cpr6SV4OXzLAkBTrUY4b+yN23FBzTWQ1TTfphdg1+oibjhD7xr
         ssNOMLrQkAsCiAecik0O7KacnJIV8DJ0xznKiST6shUkal7hcl2AFdw0floPbKwQ62v+
         QW+6vPI3uBkOU372js6tk7XtuJaxc/44doTU+XJDDzMLYnxniIr8hMXOFPxweDmLtoTD
         MAzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2HS4g1yQyub5lzjl5aLzIa//51wpkXRu3SgApCEI+TarWTwGZZvLWGaiDora+KnaYjX/re3krH+kYPcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDXi9Fgmtiw+3fsAjM95/YlCYxX2qGjMNKOnfGFSJSx0CI1zlu
	oYyL3TcDnq049NjFRT1KxaBoUgbTNB91mDyZAz2zr00TR6swwDD+L1EU
X-Gm-Gg: AYBFou1puS3VcITtrn9+0vcQXpcgQojh+9AsDuiRWBBr3kCNU+guXJ6Ir1n7DKm73qk
	qj0s/2zULvDG+fiZsjjG0azRSW7Cqule371zHQHSK7ttUtKJ/qQc6bDu4KtJr+Ty4whwPrMRyWy
	69P2QKTqbxHqes7UCnzbk5cG1UQqw1H/45JxUaQXmXjbokl39/6jxYLjD09o23Y8/HepZPJ6zHb
	u57EOv9jdHKkhC97w1fvTNlFkYqa4s1aCUwAmWoAN3fLMd4VPDM/80x4InbLJnDQO3ZeFN5u+CR
	UsMfiiFgH0EZn2Qv6xiHN9gqdtTtcaIpVvFHN5puCWy+I1hyCerYxliyyF13V4O1RDoCFiEvSiu
	ma1Gy9gAmaZ9MhAr+ffB9y/Xw0BiMreMmlEhuE0+NEi0N/3ToNcDCtpGtVgtgfIv6QgUCMJ9iEE
	FmI0KmO0TwJGazh9AROHz/MAj0H7zvhv7fPnXV+mzcADBlyhuR4MgR4h/LS3rqzu0Wz3Yi7g==
X-Received: by 2002:a17:90b:384d:b0:3a4:c11d:b794 with SMTP id 98e67ed59e1d1-3a8730eacd9mr324677a91.14.1791279293582;
        Tue, 06 Oct 2026 02:34:53 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm3905277a91.13.2026.10.06.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:34:52 -0700 (PDT)
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
Subject: [PATCH 8/8] scsi: target: skip an escaped DIF block inside the data sg
Date: Tue,  6 Oct 2026 17:33:38 +0800
Message-Id: <20261006093338.27342-9-physicalmtea@gmail.com>
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

sbc_dif_verify() treats an application tag of 0xffff as one skipped
logical block and adds block_size to the data cursor.  The next tuple
folds that cursor across a single sg entry.  When the block spans more
entries, dsg_off remains past dsg->length and the following CRC reads a
full block from that offset.

A 512 byte block split 256 + 100 + the remainder, with the 100 byte
entry ending on a page and the first tuple escaped, reads the next
block from the next physical page.

Walk every data sg the skipped block covers.  Those data pages are
mapped with kmap_local_page(), including the page the cursor moves to.

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
 drivers/target/target_core_sbc.c | 46 +++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 76dbc986e887..7c4f66c2607a 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1521,6 +1521,46 @@ void sbc_dif_copy_prot(struct se_cmd *cmd, unsigned int sectors, bool read,
 }
 EXPORT_SYMBOL(sbc_dif_copy_prot);
 
+/*
+ * Drop @len bytes of the data sg.  An escaped PI tuple still covers one
+ * logical block, which may cross more than one sg entry.
+ */
+static bool
+sbc_dif_consume(struct scatterlist **dsgp, void **daddrp, int *offp,
+		unsigned int len)
+{
+	struct scatterlist *dsg = *dsgp;
+	void *daddr = *daddrp;
+	int off = *offp;
+
+	while (len) {
+		unsigned int take;
+
+		if (off >= dsg->length) {
+			kunmap_local(daddr - dsg->offset);
+			dsg = sg_next(dsg);
+			if (!dsg)
+				return false;
+
+			daddr = kmap_local_page(sg_page(dsg)) + dsg->offset;
+			off = 0;
+			if (!dsg->length) {
+				kunmap_local(daddr - dsg->offset);
+				return false;
+			}
+		}
+
+		take = min_t(unsigned int, len, dsg->length - off);
+		off += take;
+		len -= take;
+	}
+
+	*dsgp = dsg;
+	*daddrp = daddr;
+	*offp = off;
+	return true;
+}
+
 sense_reason_t
 sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 	       unsigned int ei_lba, struct scatterlist *psg, int psg_off)
@@ -1559,7 +1599,11 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 			 sdt.app_tag, be32_to_cpu(sdt.ref_tag));
 
 		if (sdt.app_tag == T10_PI_APP_ESCAPE) {
-			dsg_off += block_size;
+			if (!sbc_dif_consume(&dsg, &daddr, &dsg_off,
+					     block_size)) {
+				kunmap_local(paddr - psg->offset);
+				return 0;
+			}
 			goto next;
 		}
 
-- 
2.34.1

