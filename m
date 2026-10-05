Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9774DA9B6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229291; cv=none; b=KnF/FdZWFfDkwUXHASTsB3gX0hvt7ZF37oisgINqs9MTigFnpQ67CAJ2/Vbll3UlzM4a0fbxaeAbKvbmQ8/NvAbmQeBQQIKQqFC364Njfp/q3kkMc+OFUUDszEVSnkhZJQdVj7gTnUhCzVJm5XQYnAz+u8Ngmzfv0WddJspMtBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229291; c=relaxed/simple;
	bh=+bTXWDMaQZNDFcLiKDdbOjDGn95EDSIv0eXDY3F1Hp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBhcBmATqdprFdvCezuF2P4yhBvVrc7dxxkzHfuzp7fcVMtbBYQPlrh6KWAEznBN0N2sx4iHWLq95Zegete3Lu4P3+0O1f9ZgZE55r5Om2JMnRdNik1tEbQqmJhRCs5nGn3BaWNK7KtsrNzGozcvzaAPTF6bLnFZpGAjxuPgIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl6rIVeR; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl6rIVeR"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso3527230eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791229289; x=1791834089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uv7afzpq7+dnopZxaVqr0Kj31R9b5sq4pmvrJx8z7b8=;
        b=fl6rIVeR9vUkxIHGTLLADTYZDqO4xnuBdvbkFaegUFE+PGtDXDPyZoQUBEQdRJUTsp
         +FyFM4G7T+Me0EDpJbqXcOFArsw3cjGuDL5Nisf+RHuQvVrYRfjIZERquj9HpLUA8NKG
         PDEyj5Az8+1KXhKwfSG6DrSlxQQtwyJPXYyhrXzxZm6OlGrr3KOygimop6Vb0nStoneR
         5tcdzq7uw0uqENbxa3Hqi/XtPQ/S1wfw+BULKP8nUbL4j8IJ6/IMaEOM0zyu93ndf3ll
         DJ5B7hOmM1+RG63K4wjmWP1o22UUcuUqkyY420gfKDlzZXx+erH4/ycc38bZBvIbOdBl
         ArUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791229289; x=1791834089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uv7afzpq7+dnopZxaVqr0Kj31R9b5sq4pmvrJx8z7b8=;
        b=H5R1gGQVHsjdq1dtqTCnpA4XgsYV8RNv4HwQOIwHPWKZN0zgqV+rwruCMOQAcu3pmu
         jr8wNW8Y8/IRDRle3RSQFXfnKv/f6Gczz3NF3mrh5XG3WtBXK33cSVT9DJHbnP5th2/c
         tu1SoavwBxHcn0h+ARfL/tzJE7mcHFCE5IHMBkjZ5aN1UvaPLojyOe6EPIqALMNF2U8n
         U9qLxGsXmtCfkKgJdXIn79o3eNFSOvLebxYcvbhyqKq6aN7okXl5ovmJLQLh08AnhMqV
         C1FXwOFsYE5/kZr1AS0y0/Ybp+8M0beywip4c2Q4ueoCs4HcPEoc2Js1FONrWxZ4lIsP
         plhQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2fUjWCQ4IUwmCKJUX45xUMasSWh4kOqijBVmudRQkjGsJmxjXdakp1b0uo4wch88o1niepvNHg9HdewA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJNKBGpRKKno0t8VGw3bgOtEfQXHdYK9s8Vwp+/WhIoyDy1TsH
	iob6BwW7WUGEPWQ/MvzHhGvx7ZS/iQgqQnLnacvRzfus2HszR/V8Lkdt
X-Gm-Gg: AYBFou1fUWcZ/sQMrV9TFtoHZUVPEu9yQSzkTMzIDOpsOv4u/DnCEwHsemmoL0sBFu1
	+VEb4aOC4ILYC8PMxERZm9Nm7imeseIFu9AJ30niWgV7zkFo8BcjCkGh8SVVunJ72EWJBHgQnh1
	AWxSHNfw3hrvGthKwcg1stLU0fSjzSBc09UFFy/VEk3mTh0zEdec+eJjpFcVvAyL4gTJjQM1D4u
	qpJNa+1H9PfbAxU18tn47ed16pAvQS7COLnYNhwBQD5LvFeTLEGdeGo718pg7JcWO/EOhkT7Whi
	6aoYLteDC1PVeZHLfITHLzYIY7GsyZh9EOyc47j5wjYHJY48cKVL4OO6oighvoJ6AAgQtCV6VjO
	6uzWsdLGL7jRMzGaDnSNIr+kCOWAmZRMfY6yxJvimQCSL0oXNraKZWGTPQKZUHe2etYLo/wHvJn
	eQRIcbeYLFpxQPpkOQcuBqoLVb7Dx/abHR5TgDxCGgZEdA/KadMnEoTdxijpziQyBSjCEATOTUb
	0OhBUSnQLf1GJX1WiUrA8+6biYdoerkQRlGEpR51UsM7xKuc72XLMbEYhz4zaqaXAUbPAQxYUqD
	hGdlUkcBw+n7f8lTd9KxLR9CTf/8pK4t8XV6y/330Nvly1Jl
X-Received: by 2002:a05:693c:65c4:b0:350:2a5c:56c with SMTP id 5a478bee46e88-3502a5c09d7mr14871911eec.20.1791229289353;
        Mon, 05 Oct 2026 12:41:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b3b5aesm848241eec.29.2026.10.05.12.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:41:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	imagination@lists.freedesktop.org (open list:IMGTEC POWERVR DRM DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/imagination: simplify pvr_fw_trace_seq_data
Date: Mon,  5 Oct 2026 12:41:27 -0700
Message-ID: <20261005194127.151181-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trace buffer copy always has ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS
entries, so embed it in struct pvr_fw_trace_seq_data as a fixed-size
array instead of allocating it separately. This removes one allocation
and its error handling, and lets FORTIFY_SOURCE and UBSAN_BOUNDS see the
real size of the buffer.

At about 48KB, the struct needs an order-4 page allocation, which can
fail under memory fragmentation. Allocate it with kvzalloc_obj() so it
falls back to vmalloc in that case, and free it with kvfree().

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use kvzalloc_obj()
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 25 ++++++----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 6fe478f64f02..27bbc62114b1 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -240,9 +240,6 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 }
 
 struct pvr_fw_trace_seq_data {
-	/** @buffer: Pointer to copy of trace data. */
-	u32 *buffer;
-
 	/** @start_offset: Starting offset in trace data, as reported by FW. */
 	u32 start_offset;
 
@@ -251,6 +248,9 @@ struct pvr_fw_trace_seq_data {
 
 	/** @assert_buf: Trace assert buffer, as reported by FW. */
 	struct rogue_fwif_file_info_buf assert_buf;
+
+	/** @buffer: Copy of trace data. */
+	u32 buffer[ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS];
 };
 
 static u32 find_sfid(u32 id)
@@ -454,17 +454,10 @@ static int fw_trace_open(struct inode *inode, struct file *file)
 	struct pvr_fw_trace_seq_data *trace_seq_data;
 	int err;
 
-	trace_seq_data = kzalloc_obj(*trace_seq_data);
+	trace_seq_data = kvzalloc_obj(*trace_seq_data);
 	if (!trace_seq_data)
 		return -ENOMEM;
 
-	trace_seq_data->buffer = kcalloc(ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS,
-					 sizeof(*trace_seq_data->buffer), GFP_KERNEL);
-	if (!trace_seq_data->buffer) {
-		err = -ENOMEM;
-		goto err_free_data;
-	}
-
 	/*
 	 * Take a local copy of the trace buffer, as firmware may still be
 	 * writing to it. This will exist as long as this file is open.
@@ -477,17 +470,14 @@ static int fw_trace_open(struct inode *inode, struct file *file)
 
 	err = seq_open(file, &pvr_fw_trace_seq_ops);
 	if (err)
-		goto err_free_buffer;
+		goto err_free_data;
 
 	((struct seq_file *)file->private_data)->private = trace_seq_data;
 
 	return 0;
 
-err_free_buffer:
-	kfree(trace_seq_data->buffer);
-
 err_free_data:
-	kfree(trace_seq_data);
+	kvfree(trace_seq_data);
 
 	return err;
 }
@@ -498,8 +488,7 @@ static int fw_trace_release(struct inode *inode, struct file *file)
 		((struct seq_file *)file->private_data)->private;
 
 	seq_release(inode, file);
-	kfree(trace_seq_data->buffer);
-	kfree(trace_seq_data);
+	kvfree(trace_seq_data);
 
 	return 0;
 }
-- 
2.56.0

