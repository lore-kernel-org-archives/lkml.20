Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD9348C50
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828522; cv=none; b=QKMKs1S3qy/hk1mHOhNucgH3W7gf7uB9HH40gaiGeKsVzZ2g4jTYTICnjVpFdsbdodUUZz15q5VA3oVviRBPyFU6BtgDY9F61IiUefMJZ6Mr2YoMpXHzLyrW0v92Xd+IeA5UdST6CpmLxyiMd4UGaUx4jgncik2fisraTYMPTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828522; c=relaxed/simple;
	bh=I1yNnIyYJOV6x42YlgsCMoMbWJoK++y+ZHVnN5/YUlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MCZ2p+B81jpsSNdy4UFMT5JqArUwVTWhDtVGzfsnl8ZGT2jvW210zN3PdG8meO6rgHQmq1pn11sk7OJIn+axXvb+rHLuvL+dtOIYzPIyaJC3Dxbl7/1tADWV3KryNVNLswQwaXoaxaArnfTCI2Nyo69Dc8WJgDYADC9S+P2CClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3CEYN6I; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3CEYN6I"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so11272005e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789828519; x=1790433319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+lGrS0kQ9PVbSZnky1euP8NyMgJQsbPpvy32Itkc/o=;
        b=h3CEYN6IOF3wmzueuo4shIl5ZrouipYNN+Syp0jfQqAKvX0l0miPyf6uOFX1HLvdnX
         lQXInuX55+7Q+H54mbwhJdukuugS7ZC8F+pWXq/fjkGFa0yVbmNmGPf0qF5m1p13q8zF
         5kkXn7qyStKXdMBlPsElie7XDkyBjk+px0aJRXSGdY0SxWAEgV6hj+uZhTbkK8L59T3j
         3CBmNoLsPIBX95n6zx7yn2H8xledHf0SxzcjbGJVgN26e0aslI3vep9GFRPFq85whGBV
         gswb6m3JT3cOKPJ+aBUbLVED+a7lkXoBCCv495qLZPsIDDQcVIFdrS4EQ8IAvpNnA+SB
         9akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828519; x=1790433319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+lGrS0kQ9PVbSZnky1euP8NyMgJQsbPpvy32Itkc/o=;
        b=xAJJpMLNB+hJpRxwtvfT1sJjN5mbSunWyt5JoRewPIIS+QHst+OsKpMj7xxqvGln/c
         BFzy/hSlYng1Dc7Py4ZInfrh43HJA/ZUounekuYVWaay4cRXS0CPXYcnslHIMLjle7hh
         KnAQ8tl9x9moec0lye5CoW27t2nBPGl4aOvdejtGRevRvyp+QNOVu7imFgg2JmgRxWJX
         f3nMWGp3e0U6a2b8TSpPr/EvlpUOHhO9v3jrgtCnlpbbA1a/FGaUyLykGt9e5GyVp7la
         uIXvEis0HWMY4dnLAtRanXdJr5HxgTcBDcXniHgp9EP5zt7D7cw3Dg3uqNxOZAHF8dK2
         chvw==
X-Forwarded-Encrypted: i=1; AKwUvBzOB00jys3ra7eggQA4P5NVsrNdTiNNoP5At4UkPonISQDc+PsXW3lezB8wmDklmq7rPcOhmlobaRVlvcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nFbor2l1y4E3gutbgopVEFyNIJ+YYijfRcOxhVygg43BeeFS+/
	2jF+I5b6XQt6o8lIp+XLi/kUYkGwLRB4e7DWgdC+0oDTgdAsBYN1Vlk2
X-Gm-Gg: AYBFou3UNPrXB2QlPmlwaLOB7hD2sHUBuPmrwRKRk7dKpzUr9GL6KUBnhBXHXMaMyCR
	mp6UT5D3vDZ8Njpzfo8WF+91gGF3K0XXp26vHDTHs11K0idVZCI3UZz0izDShoAhdedZmio7IgY
	vQGDDgfCWzXbS+if5AKvRJNkLZONrBYsgyiFI9NsW/maxr5gUOTjm56mITezrOz9XSndiOyR6kG
	oCE0hi8l+7MvUqYmKVcaWUUfCcC8dUtzss2AinvE25hpP9EKD68HZK3iBeIphcOHBz6UEdrMrz4
	9bMaxn6XJm/EJjNUnnHvvRlY67lJVKwvbc8htJrICSgxgwGRa4SFQcx+/7En19BBmAmsxbQdGwT
	qam9AFK/WkdCYzd50XBk4X0PdarToR/L/CaU0z67MjZqKxcubxoldiDEXcoY6lE0QUrd2sAmxRH
	zw8SR1jf/APo0puIWjahvUtLi4c9ImKi0ax3aU9YCubG7+rvHP4IRFLYnZIhe8m6/vNBbnbebio
	e6uP1Zt5ABlGbOQajgoHaBXqvQ6wlDJYP9um39wmAFn9jcHiTezAWnNt5KUuCb4rb4jrVKLZ7xU
	oklDxLtxCRbLNdX63yfIxu205utSFcryg3S//a3yy88vu7qAGBJiILJMgYMV4oxMkqTrH1PbeuP
	c
X-Received: by 2002:a05:600c:4712:b0:49d:34:420d with SMTP id 5b1f17b1804b1-49fc573621emr76907305e9.20.1789828519300;
        Sat, 19 Sep 2026 07:35:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc59286b6sm114282115e9.4.2026.09.19.07.35.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 07:35:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nick Terrell <terrelln@fb.com>,
	David Sterba <dsterba@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] lib: zstd: Correct streaming initializer documentation
Date: Sat, 19 Sep 2026 16:35:04 +0200
Message-Id: <20260919143504.69254-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260919143504.69254-1-kmehltretter@gmail.com>
References: <20260919143504.69254-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zstd_init_cstream() omits the colon after parameters and uses params
in its workspace sizing example. The example also passes compression
parameters by value instead of by address. zstd_init_dstream()
misspells workspace_size and omits its NULL return on error.

The zstd upgrade also left the behavior descriptions stale: the
compression wrapper converts zero to ZSTD_CONTENTSIZE_UNKNOWN,
regardless of the content-size flag, and the decompression wrapper
ignores max_window_size.

Match the parameter descriptions, workspace example and return
documentation to the streaming initializer wrappers.

Fixes: cf30f6a5f0c6 ("lib: zstd: Add kernel-specific API")
Fixes: e0c1b49f5b67 ("lib: zstd: Upgrade to latest upstream zstd version 1.4.10")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/zstd.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/linux/zstd.h b/include/linux/zstd.h
index 4f0e2890a5bd..ab6d4d3f815d 100644
--- a/include/linux/zstd.h
+++ b/include/linux/zstd.h
@@ -457,15 +457,12 @@ size_t zstd_cstream_workspace_bound_with_ext_seq_prod(const zstd_compression_par
 
 /**
  * zstd_init_cstream() - initialize a zstd streaming compression context
- * @parameters        The zstd parameters to use for compression.
- * @pledged_src_size: If params.fParams.contentSizeFlag == 1 then the caller
- *                    must pass the source size (zero means empty source).
- *                    Otherwise, the caller may optionally pass the source
- *                    size, or zero if unknown.
+ * @parameters:       The zstd parameters to use for compression.
+ * @pledged_src_size: The source size, or zero if unknown.
  * @workspace:        The workspace to emplace the context into. It must outlive
  *                    the returned context.
  * @workspace_size:   The size of workspace.
- *                    Use zstd_cstream_workspace_bound(params->cparams) to
+ *                    Use zstd_cstream_workspace_bound(&parameters->cParams) to
  *                    determine how large the workspace must be.
  *
  * Return:            The zstd streaming compression context or NULL on error.
@@ -552,14 +549,14 @@ size_t zstd_dstream_workspace_bound(size_t max_window_size);
 
 /**
  * zstd_init_dstream() - initialize a zstd streaming decompression context
- * @max_window_size: The maximum window size allowed for compressed frames.
+ * @max_window_size: Unused. This argument does not limit the frame window size.
  * @workspace:       The workspace to emplace the context into. It must outlive
  *                   the returned context.
- * @workspaceSize:   The size of workspace.
+ * @workspace_size:  The size of workspace.
  *                   Use zstd_dstream_workspace_bound(max_window_size) to
  *                   determine how large the workspace must be.
  *
- * Return:           The zstd streaming decompression context.
+ * Return:           The zstd streaming decompression context or NULL on error.
  */
 zstd_dstream *zstd_init_dstream(size_t max_window_size, void *workspace,
 	size_t workspace_size);
-- 
2.39.5 (Apple Git-154)

