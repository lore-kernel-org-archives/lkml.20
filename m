Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09C485514
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394065; cv=none; b=Lw5WiLTjFWJ9Kc5mxfXdy9F+iNOFnCgJ2wLRE06wrcHs8Hr3di2dgCmefLtFlkBB3qahhuroTDG9v4PK1KiEwQt6vyPshVK8CPG3KHCaI1zOCaRm98Ieu/PwOz39mD0Wy/cNxKqh25kCJJnO320q9KRWw4ia5VXBH4GPbzQRi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394065; c=relaxed/simple;
	bh=FNU42YhptCFvQFCc+00g64enrO+LxrGZvwpZ6quqXps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F5WBErgYr0/pF4lnc89OwKuIHSo1+7yoICSJIqmVSfdwjFhPzd51F2YOeok1oWi15dpsjz97HkxWWDYRFMvl1LtId8JRbIvv/ZhxZsqKOgFOQz2AnE2+cXvim6ceIGh66zJ/ke4FbYTYp1MwghjArIPYy8Fa+nw75lHbLZT7q5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dECw3kAk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dECw3kAk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso787485f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394062; x=1792998862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvdzAe+ZkLnBBtbCTReTMkAoyI9rj6E82u0uZ+VglJ8=;
        b=dECw3kAkvUQJlAOmBSc5AnwqAGCopbwEiZBk9r5ZqORyBXU2VtjzV+wMXgZJTYEVWx
         QKYG7+sUBCPkpXecvgE4y13xSocsccvYVn8s6giajTB4xheFxeW9dW1qFZHr8yfUUr/l
         LTJJ8KCIKBfXMECRWp6ZChn3cU7G4LbjS4g3O63CKrbcyDkiL0kFMzsZKFRONw3UqvPO
         40Z1TQWkLsFdhOR+5d9Ooyw7Gwfz/w/9/l8ESN9Uf+DrmIIzlZ0u6AHL3f9uVmjieEsj
         8BkdW94XMO1lUhgF5+yesq6OBlASQYIoG2+HrLfa5aN3uhqbafoXcx9Vb1FgGXxnZfI0
         ON1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394062; x=1792998862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvdzAe+ZkLnBBtbCTReTMkAoyI9rj6E82u0uZ+VglJ8=;
        b=yE5F3RV0L9XzmBehgCphpi6mBvv5vGL0UtiuzWlHUSeYhMmy+L8aqIYQtZ2XpbpBQo
         J1knKn3d+cNp2PqBFrHi3vePhPY8Jx1nbbcIDzozfjjL7Zvi2PWxBpTYnz2BfjVmxQ1E
         S/mIa42w7TCE35u3ZBobOmh3uKCWZgA806pqOZzOlJopfoa4Z8eunZttJcgDh8UfMDNs
         YP0wxYBEoXArA+gxWP/AwiijQbTOzgbTtJno+QbcPM/QZlH+me/us4W5/NHRwomXw8Lt
         LiCnw5No6I/h8ibiEkjPe1MYwVp4FUT0Ah6t0D4VFJnCCeF5sR4A/JCTz9oAiyXNpDi/
         Idqg==
X-Forwarded-Encrypted: i=1; AKwUvBz4BhVMDsBRadJqG6zZ4QIRZ79qIniGHRn0YALQdngDL0Jaip0vzDU/bNXQwIktJlI4tLwqfgiWvN30PUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Y4bfg8k+Kz9nfoRZf+z/XMLySgfiklmeoriH2ANpXORarXd/
	ngRKUrgA0f8ZxVVf/rEtg+CW3bl+0N1mfDBIW7OoYb8Kh4fx6CUSB79Z
X-Gm-Gg: AYBFou2JcUE3f2q9iFk36Kxb2TCrixcA4h5DJ/rQNpWQsYJyvdFzCg9wBbJ6oilbpp1
	dRsrEWRe4X6TiaW0kkEBnzcBNgzuKJVPTnwXbGTdIhErj0WRg4PrEJii6rX92KZZAXoFYdawuh2
	HxiBZXfdNnuYS/cRXOngnKmdMlGx+x/OhKCqnZS7S40iMTnh/iHwFORRihKRiRfNh+DGwdG8KI+
	7ogAHmZb4jWm59UWv5SarcvCHzHqvkKAKBWrXfF2qHK5Y5nV/xEMr6K6kKIm8w71j4va4PkHSOJ
	5/ezXn7hkl8HFo6DiRJzoXlAkWhrBQpVLY5i+M1h2CxFW1JC7027v3SBceQivQ6LUJnQ6FM8Gnn
	8OD9VVfyK/sxckgCkCxyDP5hDpRVQOA93xhLSk9D7xjTKOVT1nBuXh7Ss8a4aOt4N3GYl4qfi40
	/NVF13ypguGflmFL3mAxnimVfDvfooZWN+XHVpb+f8U3T+hBz/KJoo3e4IB4xWfLoTUcftBXh8S
	Yuopo1NvG3D7OjzRo5meu/7UMVJP+dcvEKAYuZk+spS4KCcJcVyDLT/DBX+FtwI3xaEKSS+3fyX
	ZAB79rMvaUJJZUE5+Ei1vlOarVZr4rq+m26dJzoa+UiCgE1lRmOPlxNCi2nsBgNGqo2hoUAB4+s
	e
X-Received: by 2002:adf:e28f:0:b0:48d:f7f0:327d with SMTP id ffacd0b85a97d-48e07fc3ac2mr9376404f8f.29.1792394062160;
        Mon, 19 Oct 2026 00:14:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 1/4] media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
Date: Mon, 19 Oct 2026 09:14:08 +0200
Message-Id: <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIDIOC_PREPARE_BUF leaves a buffer DEQUEUED after calling buf_prepare()
and the prepare() memory operation. VIDIOC_REMOVE_BUFS accepts that state
but frees the buffer without calling the matching finish operations.

With VIDEO_ADV_DEBUG, vivid reports:

  unbalanced counters for queue 000000009fa716f8, buffer 0:
       buf_prepare: 1 buf_finish: 0
       prepare: 1 finish: 0

Finish prepared buffers before freeing them, as queue cancellation does.

Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f17573..460eaf4e82f78 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1746,6 +1746,19 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int c
 			goto unlock;
 		}
 	}
+
+	/* A buffer can be prepared without being queued. Finish it first. */
+	for (i = start; i < start + count; i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(q, i);
+
+		if (!vb->prepared)
+			continue;
+
+		__vb2_buf_mem_finish(vb);
+		call_void_vb_qop(vb, buf_finish, vb);
+		vb->prepared = 0;
+	}
+
 	__vb2_queue_free(q, start, count);
 	dprintk(q, 2, "%u buffers removed\n", count);
 
-- 
2.47.3

