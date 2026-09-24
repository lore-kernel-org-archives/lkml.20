Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3443F4DC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228791; cv=none; b=db2QIDqGMrLtDQO6noowxoptgE8qMNJNkcB50tHGckwn0Bd8VKo4jFbvEKSyKydGbVqKhAVEkUxH+yph/nKGB3XXWyECp3UQhXNyQUVG85rJUuaGpUrgtNzZqGzqs6rIQaz7c/kzxIgxu7SLiPMdxDYVpyFn2OCRQlhCsTbqsSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228791; c=relaxed/simple;
	bh=SExQjCrur+v+PyLSkU1yDERtFPFGGtrMK7eWhrWe9ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXntrSj0kYQJHlCyrqo/YZz03jR759LYs1vaEZeiVuEsW8HF76hy8AGifhhkayoUO56O1iR0AuJPBoB5fhbAi2/tXwXCVi76p/FByLEBoe7ybbEjS+rvia9I2Mkt1hiXnOFv3ejelGsYNULKDu7c+TfKnYO8a0vnb/O4pQrHO/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVgh3hlD; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVgh3hlD"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so981947a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790228788; x=1790833588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bayjai1+noq80zp+hzIM4o4hv3AifX1+PlCe73MmQMU=;
        b=BVgh3hlD+XgNggNNswToLOGHnkN5WpX/W7QMHVSPNY9n9DNpcXi8NC+S/gjGBhPfmf
         pd++7JtUwi1za4bwlW3TibNAoJzXkcQ8+buyhjwJCXTOiQD+zL/IuIWXjN5bi6KeYzTW
         xKFXiGnwoCZRok8HsSC22oIAVWOYcI4PWRWcYupgononQiYO+3lUPCDS/edWA/DVSEoK
         Uzulu9l0Z37WH9CBPUz0csJoKQY/iJH1+ROqqDJEmWqYnlWV46MmhPgaBYAOBVM1Pv/q
         O/rB4y2RQf+nDleG8m7NKTrgzIy7/P7db6bnO2brSbIjii7sUVgn1jmKjCJpvH/JKUMb
         vg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790228788; x=1790833588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bayjai1+noq80zp+hzIM4o4hv3AifX1+PlCe73MmQMU=;
        b=OnPnmlqvp8mDZ2Ur9e58+TdqGaFf5KFBUZ0yo1tGO/kmGU6TM5iK9/057t0yLtDb4x
         DLYZH5I26miFdr+SffNkC5P/j+b7g90+JP21zs1w02tEKbmAxvrY5cq6rG2Y5rOvGlqV
         X2pJtkrfZoVHxF4+rv01mIsPPrC7G18v0kawgu+qPbvUHr8scu8UeM+IPkKj9GKAI6vh
         LAZ73CF0Dl5lHZxPegqmHVo649jH3ow7vnGATF18xnFVlduMIYuoY5V8bKl+Nc8RzvKv
         Hr5vRC12+fafB84nIqem+jLaYYWM3tlkA+YzeMRpItrbZZ3bACs5Lb22Um13J+iwUndf
         yXJA==
X-Forwarded-Encrypted: i=1; AKwUvBwUHEQU7UtcgdYqrcla6Zzjr/+2Tlrcuija7OaPQRTtBThQw30pBJ9rwS8pyDJftPqq8hALb87cbUFNw8A=@vger.kernel.org
X-Gm-Message-State: AFuF++meFl7Wemdg+kBMpJbBN+v9sauWfttHrbQYraGlhBHw8x8By/Vb
	a8kEGyebYqlgORGC4+tb4Z+rQytujrf19vKj36zp+DVDlAaZl0IdfM5tmJUXLP6c
X-Gm-Gg: AYBFou23K8uZl0L7hxnvbK+NBCTjBpQV1dl6gibN4VmioKzJvOOskCQsc+c1jlVkvUF
	CgzrqUZeqwpzXLHcjGtGM4hWKsC8lWWLqcPvPgE1wMV4pver8+WpASxMxL6SJ36UFhfDbCkOOV6
	K4Zrtj5rqd+dGzoXnBgNMbKlSUrtNJG4BO5ClwUJ3cBL1zwiEI+diEZ0+7Mx7cfHfvTaQcddSZq
	e/+bW+GhUReW8UjvOXAvqHOIFlcPNaF9orOCtLXj+BtAy0Hav6f7EfZQfaknogsnztrEjWR3Nvu
	gOpTEmI4RS3RHi3dA8SrBmbCFVG6WFP9RRcGg3FLVE7nY7KEx1UrRsb8Iqy9oFcDNU12CBp02UI
	EI/YTskX/92bafJ0kliFppyi2ZzkbQXUOPW4ihqdpaZ+NtOi+itTs2d+G+wyaBX61x3855VKDWi
	s6O8HFsreUJWvNb7Ir8gk//ueiDh9MLh+SwAdRm3KL4GCDDAyiaV3FejvCJiJpeDhKMBDmrB2HP
	kbJbvWmZ4GuudDFCzU3hiZPGcSXZ0WMO/gDTipo6RnFwqI7KDLCKojjjiNDlf7mcRfbdg6bzNTu
	ml14Ai8SzA==
X-Received: by 2002:a17:90a:157:b0:3a0:9c9d:eb1d with SMTP id 98e67ed59e1d1-3a09c9df122mr467186a91.20.1790228787662;
        Wed, 23 Sep 2026 22:46:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm2786661a91.7.2026.09.23.22.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 22:46:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org
Cc: john.garry@linux.dev,
	dgilbert@interlog.com,
	jejb@linux.ibm.com,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2] scsi: sg: finish request on error in sg_read()
Date: Thu, 24 Sep 2026 05:46:25 +0000
Message-ID: <20260924054625.2282544-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <69218179-d750-4880-8be0-2ccab7d76a6d@linux.dev>
References: <69218179-d750-4880-8be0-2ccab7d76a6d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sg_read(), for the legacy sg_header interface, a completed request
(srp) is dequeued from the ready list via sg_get_rq_mark(). However, if
kzalloc() fails, or if copy_to_user() or sg_read_oxfer() fails with
-EFAULT, sg_read() returns immediately without calling
sg_finish_rem_req(srp) and sg_remove_request(sfp, srp).

Because sg_get_rq_mark() clears the request from the ready list, this
completed request is left orphaned on sfp->rq_list in an active state,
leaking its kernel buffers and pages until the file descriptor is
closed. Fix this by jumping to finish_req and calling
sg_finish_rem_req() and sg_remove_request() before returning on error.

This was tested in QEMU (7.3.0-rc3) using scsi_debug (/dev/sg0):
1. Queued a legacy struct sg_header INQUIRY command via write().
2. Waited for completion via poll().
3. Invoked read() with an unmapped userspace buffer (NULL, count = 64),
   returning -EFAULT.
4. Queried the request state via the SG_GET_REQUEST_TABLE ioctl.
Before this fix, req_tbl[0].req_state remained 2 (active/orphaned on
sfp->rq_list) after the failed read(); with this fix, req_tbl[0].req_state
is 0 (properly finished and removed).

The C reproducer (PoC) can be provided upon request.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Suggested-by: John Garry <john.garry@linux.dev>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Rename error cleanup label from `free_old_hdr:` to `finish_req:`
  since it now finishes and removes `srp` in addition to freeing `old_hdr`
  (John Garry).
- Also handle `kzalloc(SZ_SG_HEADER, GFP_KERNEL)` failure by setting
  `retval = -ENOMEM` and jumping to `finish_req`, as `srp` has already
  been dequeued by `sg_get_rq_mark()` at that point.
- Moved testing explanation into the commit message body.
- Added note that C reproducer (PoC) can be provided upon request.

 drivers/scsi/sg.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 5408f002e6c0..5d635349e06e 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -480,8 +480,10 @@ sg_read(struct file *filp, char __user *buf, size_t count, loff_t * ppos)
 
 	hp = &srp->header;
 	old_hdr = kzalloc(SZ_SG_HEADER, GFP_KERNEL);
-	if (!old_hdr)
-		return -ENOMEM;
+	if (!old_hdr) {
+		retval = -ENOMEM;
+		goto finish_req;
+	}
 
 	old_hdr->reply_len = (int) hp->timeout;
 	old_hdr->pack_len = old_hdr->reply_len; /* old, strange behaviour */
@@ -543,10 +545,10 @@ sg_read(struct file *filp, char __user *buf, size_t count, loff_t * ppos)
 		}
 	} else
 		count = (old_hdr->result == 0) ? 0 : -EIO;
-	sg_finish_rem_req(srp);
-	sg_remove_request(sfp, srp);
 	retval = count;
-free_old_hdr:
+finish_req:
+	sg_finish_rem_req(srp);
+	sg_remove_request(sfp, srp);
 	kfree(old_hdr);
 	return retval;
 }
-- 
2.53.0.797.g7842e34a66-goog
