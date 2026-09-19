Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5783815DC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850897; cv=none; b=P7TajSOelHSpEPAd6rerLuWBVpPz9pzn+CBfwfiWGMBDnNjGw8E+hV/qsnQBT9dPdG7FPq7VjP38MuIxf9nomlyAcg6EKUWYPwvKGnz6SydZoiZLk/c1FvtYxG8dkPVONdnW2qT3SMs+YhxEYJuQyz9AMwg6Y9LY1E9uEecwX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850897; c=relaxed/simple;
	bh=Wb09/JqlWJCK0aAKjwbDIwW16IbDVzkKuvcsiDzrVaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQoax1xBiAkJt9kE1iWoo0PwE4IE7gik5yGcLUw3htMCiL7jfOUzj4GeXbGZLCfPWGxlCZWiBt9fR6VSqWE/6dBbUKLUdHekKrdqNs/1KRw1oEuOFiNyi2JAz+VVWilSpyneL5VVtSOGGRIc4HPjmEOSnIH1V08OKrgvXYMvHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsNnZKnb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsNnZKnb"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso1495284a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850896; x=1790455696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHVLNPODpQem+e5CBn4rhBgJZPtKTuV2DsJXEMmdlks=;
        b=MsNnZKnbYtalo6VLRyRHf3QUCt+035GNQIieseHs9wA0n8C5Sz33THd204rMzJB07K
         e47GgVVxch6QiVm/6m9N6dB+SN5PXB7Um0UkDc32VhjFSlpZFaeVoPXdBlUnIn9zS1ni
         /IkM/OxgD+6Fv4Z+BoL2D2xC+0E8vwtOnEp2pK1AhmlxfwU+OMllKfHSDsZ2pwTLr+3u
         OUYXMEdcyM9Z7/7wdrLrQko2uB4niWC88Fe4kbe3/kqneaoEaNdMegcI557YeACUCtnE
         O1l/wDvjuY3+UWntSEZpfQI4wHigWAsBHX4vZNKvOSpmHzNnDj53wfvoaSSxODyKS5E1
         5GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850896; x=1790455696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHVLNPODpQem+e5CBn4rhBgJZPtKTuV2DsJXEMmdlks=;
        b=BA1+UlOwiTa2pvB1H9lMKO557T+4YQM3TZLNFCe1/xIEZHnJ7N3PotcjBONQkYhRWV
         u4T/uxGMctupaNeUz8kZGoQ/C5OEqpy2xrN0hMWlRRC1jToyuKRXJGJiRxO1YBHjYNpR
         sVVQo0HrGltAcTthoJmUx6WEz1jtFGhWXWpaSOP2qzRt3F4ocoQt1Y+d5ZeN8rHli/a6
         YyMGgAeBoZgRaihEZRk/lz3lt4z9xXtfAyeZWcv+BtNfAJ2ntCia0+qSPC84uTEeRIJ6
         UwZQ3wVO+cNwUWPCmEmoIR3R5rCfa1v+YYLdbrhq7t4q8VDJibbd3icxPaI2zzlxkoU3
         vKVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlS1EJ9tx81dHt1wkD4SDHlMcc5Jw/SCwC8XR9jPLKwx8huGE5J9Xs2VFcm37NBCTjrAM2KGLeOX70w9w=@vger.kernel.org
X-Gm-Message-State: AFuF++kz+NmNWHi05tEbHf8tztaig33wmcEjBGvkn6E/QbeVYConZTnh
	5f7Fq1/sUiXZsI8bLuFewuGyS9dRN6y+DE3fJ9T8VA3zf+yPH31s67Is
X-Gm-Gg: AYBFou0kvREMRv6un0hU8usWcOENQK3Db6hSo+32q5pEGz8zHm3CmsSOsPbU4g7/S90
	wf0flAEsbXoq7kX8vVTLt7siDCvgt/0DFcVPS4zQNoNXAvdjNOi0BpPzrS1qlnAxqeXyxQUS6Bf
	05QZPNkzHQVS7rxQSytVs0QTSCfB7zc3mS7/WoW6CuW+pJ+G9/gtuFs9XoA37sWryclO+7zSTok
	IUZyRBnszDu5qo3XsZ8vsC3SC6WRwdJyOoyGDeVq/m8oH0T2TiPg2bFWYIwRAVG5KFUz1Efu8As
	Ar3NLWfkIrWT5unSyKoBpK2jwWFbcmBI8+sGDUkyjMpfwZ9yefunwAiLcmRfUffsZzf/gcw47VU
	ejOrymXPDdbuzVyVFY7lG+07rdMH7F/jSIvkhyXgnkeiIYig7zEsRZxUCwOz1FIBnZeUHxMCeTb
	0eM5enmoplbaKtByQzxT9EB7X9pf9QfeIeMgP5CrRK20W4vMsqr9xFerApmo0/RoLkV2rPrAkGl
	RbP0OMaN/RxfQKSSYG88yOxb0kUaGvCI3niMZmthZA5UGS2sErxSSL0OBctCiUyBmZePsxi0lbP
	qgA/EKdb87Qfcn0maeP9
X-Received: by 2002:a17:90b:2e0b:b0:39e:6c68:c78a with SMTP id 98e67ed59e1d1-39e6c68ca60mr4717671a91.64.1789850895619;
        Sat, 19 Sep 2026 13:48:15 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02738654csm4043944a91.3.2026.09.19.13.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:15 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Doug Gilbert <dgilbert@interlog.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: sg: clean up request on error paths in sg_read()
Date: Sat, 19 Sep 2026 20:48:14 +0000
Message-ID: <20260919204814.2815374-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sg_read(), once sg_get_rq_mark() locates a completed Sg_request and
transitions srp->done from 1 to 2, an allocation failure in kzalloc() or
a user-copy fault (-EFAULT) in copy_to_user() / sg_read_oxfer() returns
or jumps to free_old_hdr without calling sg_finish_rem_req(srp) and
sg_remove_request(sfp, srp).

Because srp->done is already 2, subsequent sg_read() calls skip the
request, permanently leaking srp->bio and keeping sfp->res_in_use = 1
(blocking SG_SET_RESERVED_SIZE with -EBUSY and wedging non-SG_FLAG_NO_DXFER
writes with -EDOM) until the file descriptor is closed.

Always call sg_finish_rem_req(srp) and sg_remove_request(sfp, srp) under
the free_old_hdr cleanup label, matching sg_new_read().

Fixes: cb59e8408381 ("[PATCH] sg.c: update")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -480,8 +480,10 @@ sg_read(struct file *filp, char __user *buf, size_t count, loff_t * ppos)
 
 	hp = &srp->header;
 	old_hdr = kzalloc(SZ_SG_HEADER, GFP_KERNEL);
-	if (!old_hdr)
-		return -ENOMEM;
+	if (!old_hdr) {
+		retval = -ENOMEM;
+		goto free_old_hdr;
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
 free_old_hdr:
+	sg_finish_rem_req(srp);
+	sg_remove_request(sfp, srp);
 	kfree(old_hdr);
 	return retval;
 }
-- 
2.43.0
