Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115C3DA5A8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279295; cv=none; b=ubPPb0bWfoQTOjXnxpkOJdIBXY8I+InCd4ZHSwkffck5IeHO7YRz6I3Lyj+hxeMdM/i8qi2Wc8BF78SwTgR+Y8IAmwcqEOX4C0pmiFis56ImXvbVnUQ6aoNmQ2IkDwLNbT7nI62OcqnpZkJH5dPamUDV2CYatUJn8PSrpaa9J/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279295; c=relaxed/simple;
	bh=Cl7VqJEIWRMpNSC0QtvNARN8JpERw/rX/idDF/Zmv5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mHvpw/y3xbLu/jQDdtEjxxn84E/Se3TIebdVOeyerGXe64EaopXNrrkra/yKDuLjH8+oVCNIWW9W6ja66/b4VsYxswJknQzIthLOEKaV3qjIApE1e6ieGZf+CvJdLFmeriT/iFymzD/A5wpaz375ASk5fYFCEh8SJfCmWtxctSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsDuSiK8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsDuSiK8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4a7eb86a4so504249a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279289; x=1791884089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1Ln/9VxN6ySADYGeFTkesQbRiqqtYrWtn23BhcT6ng=;
        b=PsDuSiK8LpLWFAl0h7xi4Sw9gwUoiV+y6g5DmMdu5irVKK2GdqJgk1PYIDetrcOy0M
         HYlxN9j292d2rFWx+kgbiv5p1HcfAEeIrKrK6rGQD/bef1Ip8qUst1al2A9fBxy1XoEn
         NufYUzsu5JIUCimJ3iNF1FygCZPYSBVlBA2lxH3BNrV7GnfNhaubi78yqJRxbaFbix62
         kWI2yKhpZaiICX9dRXoHCY4Hfm7NnfeUAE/wg9ImkjYkAMUC4Ezg6IOmhAGLISumC9Wp
         h8GoENvTJwuJwmXf6PznvMG8QdzoUB7gBfk8/n9p3V3REzsjNAOnqq9lk6w04xQqzFWO
         RxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279289; x=1791884089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1Ln/9VxN6ySADYGeFTkesQbRiqqtYrWtn23BhcT6ng=;
        b=LxbQKgY6u/EML2GnhvC47x0Nw4fZto+7U/b0wqWWziPQmZUwGJWeezYMi3HPbsih1W
         FQMyfsa+J3C1lWukMnpzVcxgOC2hnvL0+/7+mN2CCBHbLqogwripd/zLdnbf2zZxloCR
         uNgwGJesFV6GDpoMlFdG/W8VitPjkX12kh/vE/SvE/BgMPw2VvCNNu9hOrvHsZegN/pL
         eIwIP5HaqO6XpVuPFM4eokkaQ52qBpzt28VIJwtovrYJF87kuJVbtMXk3mTGsLybvevw
         O8zTZsotRuhB344ngNKMcEATK331P+sOFne1wAVDcHz8K5tfZKzQOu+O8Z/O/1KqQHFR
         cpkg==
X-Forwarded-Encrypted: i=1; AKwUvBwxKpobnwEMJYyKlq6P6eKefP0tXRqdCyUVzfuiszzqL7TjSYMt+Pe03LDxHJFWqGQXCm+c3ANkAfyx/J4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKek5QKH2Ca1q+V0JaykBAW0epdefhSYI8YRYlDVAAkOsH8wU4W
	T/wSpbKQ+D7Y8cw8TvijV+bcvb5FL17cTQQhzy0ulUTTtq5YW9Ihklac
X-Gm-Gg: AYBFou14+HtPLMx1Oo6J3vhjbWJDWD3d5MHkscY1NV7jR6WrDEierd+6m3bSFPkRSTL
	pbHwHh7ZlQY83gHOpGFlAOA9E4uUE+RughXe2Ym0QtOvweNeuIsLD2LpHyVfpZW1BnGeRnMuLyP
	Px8kRPc5O/nZxpXk7OaZjN7k5YBkE78+MUt5kQqZiZteqoauYMXrt0y7hK9KH7yNH20gJdyy3jU
	MagjyZSx2lLx/tiexfDTy5WPnwDwpnarrCqcqd6MRK11BJ6l1U3AeGtJEjnGkj8qY7LrzaZh7wi
	FRHxHTTavElZzq55Iy2MUaR3B5gW/H/8m9rxIpXeW70lGwP/VyXgLm0YiVpD7Mwf/mdBIyCV6Gn
	cbdQu8mO8fvjlHxBR7loFXGusgrAft07gVfJyrebnprr9IK832CL4ypsZhUkmwv5zhmI19NAwyI
	UQVXU8bkfwvq13oR9ChN8IAOwN0u+W18t9GTImYEjl6ozeJbYCstDP2CzgabQNBSjTXHaaq54=
X-Received: by 2002:a17:90a:f94e:b0:3a4:c18c:b8a5 with SMTP id 98e67ed59e1d1-3a8737d4695mr500390a91.58.1791279288855;
        Tue, 06 Oct 2026 02:34:48 -0700 (PDT)
Received: from gmail.com ([188.253.12.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm3905277a91.13.2026.10.06.02.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:34:48 -0700 (PDT)
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
Subject: [PATCH 7/8] scsi: target: keep pscsi mode bytes inside the data sgs
Date: Tue,  6 Oct 2026 17:33:37 +0800
Message-Id: <20261006093338.27342-8-physicalmtea@gmail.com>
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

pscsi_complete_cmd() writes the write-protect bit at a fixed header
offset.  MODE SENSE uses byte 2 and MODE SENSE (10) uses byte 3.  The
allocation length is allowed to be shorter than that header.  One byte
at page offset 4095 makes the store the next physical page.

On a tape device the same function then reads the MODE SELECT block
descriptor through sg_virt() of the first sg.  MODE SELECT needs byte
11 and MODE SELECT (10) needs byte 15.  A short first sg is not checked.

Read and write those bytes across the whole data sg list.  A header
that spans entries is still applied.  A buffer that ends first is left
unchanged.

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_pscsi.c | 98 +++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 28 deletions(-)

diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
index fd1b82fc7290..0e37a44f1e30 100644
--- a/drivers/target/target_core_pscsi.c
+++ b/drivers/target/target_core_pscsi.c
@@ -21,6 +21,7 @@
 #include <linux/ratelimit.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
+#include <linux/highmem.h>
 
 #include <scsi/scsi_device.h>
 #include <scsi/scsi_host.h>
@@ -585,6 +586,51 @@ static void pscsi_destroy_device(struct se_device *dev)
 	}
 }
 
+/*
+ * Copy @len bytes at data-buffer offset @off.  @to_sg writes @buf into
+ * the sg.  Stop when the command buffer or an sg runs out.
+ */
+static bool
+pscsi_copy_buf(struct se_cmd *cmd, unsigned int off, void *buf,
+	       unsigned int len, bool to_sg)
+{
+	struct scatterlist *sg;
+	unsigned int i, skip = off;
+	u8 *p = buf;
+
+	if (!len)
+		return true;
+	if (!cmd->t_data_nents || !cmd->t_data_sg || off >= cmd->data_length ||
+	    len > cmd->data_length - off)
+		return false;
+
+	for_each_sg(cmd->t_data_sg, sg, cmd->t_data_nents, i) {
+		unsigned int take;
+		void *addr;
+
+		if (!len)
+			return true;
+		if (skip >= sg->length) {
+			skip -= sg->length;
+			continue;
+		}
+
+		take = min_t(unsigned int, len, sg->length - skip);
+		addr = kmap_local_page(sg_page(sg));
+		addr += sg->offset + skip;
+		if (to_sg)
+			memcpy(addr, p, take);
+		else
+			memcpy(p, addr, take);
+		kunmap_local(addr);
+		p += take;
+		len -= take;
+		skip = 0;
+	}
+
+	return !len;
+}
+
 static void pscsi_complete_cmd(struct se_cmd *cmd, u8 scsi_status,
 			       unsigned char *req_sense, int valid_data)
 {
@@ -610,21 +656,13 @@ static void pscsi_complete_cmd(struct se_cmd *cmd, u8 scsi_status,
 		bool read_only = target_lun_is_rdonly(cmd);
 
 		if (read_only) {
-			unsigned char *buf;
-
-			buf = transport_kmap_data_sg(cmd);
-			if (!buf) {
-				; /* XXX: TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE */
-			} else {
-				if (cdb[0] == MODE_SENSE_10) {
-					if (!(buf[3] & 0x80))
-						buf[3] |= 0x80;
-				} else {
-					if (!(buf[2] & 0x80))
-						buf[2] |= 0x80;
-				}
+			unsigned char wp;
+			unsigned int wp_off = (cdb[0] == MODE_SENSE_10) ? 3 : 2;
 
-				transport_kunmap_data_sg(cmd);
+			if (pscsi_copy_buf(cmd, wp_off, &wp, 1, false) &&
+			    !(wp & 0x80)) {
+				wp |= 0x80;
+				pscsi_copy_buf(cmd, wp_off, &wp, 1, true);
 			}
 		}
 	}
@@ -643,28 +681,32 @@ static void pscsi_complete_cmd(struct se_cmd *cmd, u8 scsi_status,
 	 */
 	if (((cdb[0] == MODE_SELECT) || (cdb[0] == MODE_SELECT_10)) &&
 	     scsi_status == SAM_STAT_GOOD) {
-		unsigned char *buf;
+		unsigned char bdl_buf[2];
+		unsigned char bl[3];
 		u16 bdl;
 		u32 blocksize;
 
-		buf = sg_virt(&cmd->t_data_sg[0]);
-		if (!buf) {
-			pr_err("Unable to get buf for scatterlist\n");
-			goto after_mode_select;
+		if (cdb[0] == MODE_SELECT) {
+			if (!pscsi_copy_buf(cmd, 3, bdl_buf, 1, false))
+				goto after_mode_select;
+			bdl = bdl_buf[0];
+		} else {
+			if (!pscsi_copy_buf(cmd, 6, bdl_buf, 2, false))
+				goto after_mode_select;
+			bdl = get_unaligned_be16(bdl_buf);
 		}
 
-		if (cdb[0] == MODE_SELECT)
-			bdl = buf[3];
-		else
-			bdl = get_unaligned_be16(&buf[6]);
-
 		if (!bdl)
 			goto after_mode_select;
 
-		if (cdb[0] == MODE_SELECT)
-			blocksize = get_unaligned_be24(&buf[9]);
-		else
-			blocksize = get_unaligned_be24(&buf[13]);
+		if (cdb[0] == MODE_SELECT) {
+			if (!pscsi_copy_buf(cmd, 9, bl, 3, false))
+				goto after_mode_select;
+		} else {
+			if (!pscsi_copy_buf(cmd, 13, bl, 3, false))
+				goto after_mode_select;
+		}
+		blocksize = get_unaligned_be24(bl);
 
 		sd->sector_size = blocksize;
 	}
-- 
2.34.1

