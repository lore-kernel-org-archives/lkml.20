Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432157;
	b=QaLd6hmk3u/xxqO7sgjUkPGmTuWvE0udUhKD1iQ5QOT+5KiOLNz5yf4pVnu8hwaQivyq
	 HOvQvt/7mMnQ9Jp9BIv3BxcHCQWAuAAgDKb/3ppN/rHLUdKCdRMu0HDaAA0Fgk239Cfyf
	 ySUwLbmJF6pq1k3JdHekqeV1i2ue/Jjziyp1YUVxK7qSuhABHJ6sjV8Mj7/xEIVv6ZeEU
	 YP3PxssQiU8j0MQjeUB08EdRtjbheRX/pXQlzjT/KASZa7ILDw04mFPqHkaoukMzeO6ar
	 FGLhE6qOkfj/C/lKxhAtYizLZ4LyqxNmAy8YNj/RlB/+u/7t/SvZW1xstfGYfcnV87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+5gslzg9a9JuwOK+he4tla1iX8VcD5cZjM9BmN7Nz9c=;
	b=0tkEXmXNcGo7G1XzKsw1X3Rpl/YSxJU+9R8VeTrFuGQx9K7hKEZWMzB7gM6xdWRw1eUO
	 yG3R728m6Kjrfo6F4rO+Y6Ux/s1HAxvNh75zWLJzDeFoOnqAeZ+U3E2IMVuLIVRw2LKP1
	 SioJQfmSfiM0yp5j7zLcDoDcBw24weVQdlLHDp98wQJIQ8SGtjumhoc+KKTJCssnzBbo2
	 9J6DfB6whFBiUJay71LfL81sn75vqnqaf4G28CTIUwbRNZjZ9hFz9pgnz1g1yWNYvCHLC
	 /C6SytCTAbqtfrr2gjx0lrat2X8h+rRy7McW9/BmoDEHtvOIogQbjIaETG/CM79mKeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvKOnNCy;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvKOnNCy
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso905517a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793432155; x=1794036955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5gslzg9a9JuwOK+he4tla1iX8VcD5cZjM9BmN7Nz9c=;
        b=SvKOnNCyFstvcC9D57o0R6N7UChcOOFDDSKBMGmzKSZMYaWEPLwhthA5qCBMuRT0hs
         8Q9hOT4Vxx95cknrInA1Z8kNyA2UmISo9OONbtK1JgolMNARnBRcW8KRIhfpPshYU0ms
         TXaM027a6jBuHZkG1Qga9X1F20DTFfOBBGqZayDyosLbvChxAb4SSCMVICfaK1Jf/+Q0
         SrCerN8m4BR3FpbeCuWLupxdTjru7XTAwV1yTWkVg02f2gQVcEDEHtTTLu8zaBtSNrwD
         CVDq/LM6McTGL8FuxPP18t37Wb0QqkTj5uVCiVxw4QIJRi5Ey5nGHtq+hrWDUbYFC+O1
         Wf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793432155; x=1794036955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5gslzg9a9JuwOK+he4tla1iX8VcD5cZjM9BmN7Nz9c=;
        b=aDKvf43Ysbg+1EFKean9W9cLcfYDhk3ZTpETumUMoc6qpSyIU1pjP9AqVxveU8KAki
         CNCqpd4XcQspe4KK/pTyKyulO/PJ92wPSyYm3WFerGw245fFBXQu/pupY06gT4OTcE2p
         Cr1PSXsdKf+qId301Rc5E9lzVIjqvBPWQfWaOM0ta8pIxh72OuzK0KWVKtEErvTUOHYm
         L9sSZzMwSZh2fHgiMwD69lf17qFTAg7IAt+aqqb3pNOZl5lV9ldnjnedh5OG/Mx/EIJs
         RsI98DYJ9ykNdQGiXEB9ZhGU52WIo2vNV7AnwjSWiQms7qDyVxApf0UsAHEdWx/g6xof
         rBMw==
X-Forwarded-Encrypted: i=1; AKwUvBxtNgr89c+9fouSJkY6hRz7/7ogB9S0qxehM34zkHnpWmP/IlT51r7JFTuqB2gtwsfGdDZwUPoZ+uwHIk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfLoVtWGZcUivpY7G++VE5knet3l6Z26y9tZK7/i6C1NvML2bP
	CmDb2az63phui3bvobwmYvenIh4LxM91z2eN+wl6g7cxU8dTkNnVfjwZ
X-Gm-Gg: AYBFou2pofxt18IMMVRD01X13iPovpiuyZRQ070VBnfiQGHuVU6UgkB377SxE57UE2i
	chn7CSFZPWd05txhDDO1nNmnWhfKjx8bDvLRtByPpoyBr6gLOsPsA+b1qvItX4roQfOioIUsuM6
	7Z5UrrJOuZmfKsttJJ7poATvJ0977Yq6jgTE064QPbdyJnQyl1BBzwtoIFJlrAQP0SzcvnPx1Kq
	jxLFyxFBL8NQ5HTJCOQdEJHkypiWZbmblDLzmxhQZj/NfO7JBhtjFiZa/iJtFhVj+3zporE1qxD
	oe7Zq1RRjCNxEbJWFdFFa5WSQzhoEXC++E9P+TXq0/KUs4YtaWQ632gXXBTUzzHCKW6nvNYIe7w
	sfmwyqwIrda6sRuTtrCVAPRv1wRO0cmUTMOUgXM9/RBpWV8tEQdu7EzaOGxImmeXFtT3IKFH1oV
	Q/O8cMOaNcgAk+PyE+1Isi7IXk6WeYw942BImHz5wyeWKUJo7xy/Qg0PS+8mEOoLWPY7XNpYeqT
	WYCihNQRaAv+H5RTxnHw45qZ5RdXxjs4EvBxh3zFI9JHEbKLeGaqzehX5S/IFmYEqjksjlUqzoA
	/xQ08cHhmYOwo3qnWl3kABTo9d+P
X-Received: by 2002:a17:90b:3f84:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ae897a5c4amr3793495a91.41.1793432155390;
        Sat, 31 Oct 2026 00:35:55 -0700 (PDT)
Received: from localhost ([121.128.153.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm6942497a91.9.2026.10.31.00.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:35:55 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] tracing: Keep copying markers when one instance is stopped
Date: Sat, 31 Oct 2026 16:35:45 +0900
Message-ID: <20261031073549.2991066-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When several instances enable copy_trace_marker, stopping one instance
can prevent the remaining buffers from receiving markers.

Continue copying text and raw markers even if one copy fails, and
return the last error after trying all buffers.

Fixes: 7b382efd5e8a ("tracing: Allow the top level trace_marker to write into another instances")
Cc: stable@vger.kernel.org
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
The current code stops at the first error without trying the remaining
buffers. This patch tries all buffers even if a write fails, and returns
the last error.

Returning either the first or last error cannot report all failures.
I chose the last error to keep the code simple. Per-buffer error
reporting is outside the scope of this patch.

Please let me know if you prefer a different error return policy.

Tested on x86_64 QEMU:
- Setup: Enable copy_trace_marker in multiple instances and set
  tracing_on=0 in one instance before a live buffer in the copy order.
- Before: No markers in live buffers after the stopped instance;
  write() returns an error.
- After: Markers in all live buffers; write() returns an error.
- Existing text/raw marker and instance selftests: 6 PASS.

 kernel/trace/trace.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e8c4efa8107b..bddcb35835be 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6316,6 +6316,7 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 {
 	struct trace_array *tr = filp->private_data;
 	ssize_t written = -ENODEV;
+	ssize_t error = 0;
 	unsigned long ip;
 	char *buf;
 
@@ -6346,14 +6347,13 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
 			written = write_marker_to_buffer(tr, buf, cnt, ip);
-			if (written < 0)
-				break;
+			error = written < 0 ? written : error;
 		}
 	} else {
 		written = write_marker_to_buffer(tr, buf, cnt, ip);
 	}
 
-	return written;
+	return error ? error : written;
 }
 
 static ssize_t write_raw_marker_to_buffer(struct trace_array *tr,
@@ -6397,6 +6397,7 @@ tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
 {
 	struct trace_array *tr = filp->private_data;
 	ssize_t written = -ENODEV;
+	ssize_t error = 0;
 	char *buf;
 
 	if (unlikely(tracing_disabled))
@@ -6425,14 +6426,13 @@ tracing_mark_raw_write(struct file *filp, const char __user *ubuf,
 		guard(rcu)();
 		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
 			written = write_raw_marker_to_buffer(tr, buf, cnt);
-			if (written < 0)
-				break;
+			error = written < 0 ? written : error;
 		}
 	} else {
 		written = write_raw_marker_to_buffer(tr, buf, cnt);
 	}
 
-	return written;
+	return error ? error : written;
 }
 
 static int tracing_mark_open(struct inode *inode, struct file *filp)

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

