Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048461;
	b=E2BYcHeBQacialiBDK+xrgK5xbOVr5HIYl0siUi0Kgtx+vzZgjxxnr6BAhxfjI9qSoDz
	 ICPc6Ezap9Adlw2qjc7tVeBGwP10dW0Swnip7m3Cbvm1kf8zhp7jnhCiCW9KY77PHRZR9
	 tiQulDwsxX1b89aWPn8IwbmTo4IGdn46ZLHYPidHBXAqmOpZ+kgq8+5D/Ql/Yg/HQf7W1
	 /ShGeEAv70rVp2t0mOfb8uf9K/I/gi3WEquzljue1zsVmmpPyEuCwCe5sxbaJ/epAaGh+
	 0YM9/t11CVMcM3/D3P29/I+d2vhib5rmEVUG3u1H8BWYMIXRPzvwTeGZY0edM/DGtRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rW6VoKT52yP08kYUcZyVOPG+H41QN9/GqRijZgl3S1g=;
	b=c5bvYuBywKgJsWiaAYsVUnjXbqP2m8fiY3gwitiR/gFWqIoi0pHudLRAMs3AsoWzllCz
	 Gd9J8c5bUryvKVvWVzRP+BH4jlJ6EN8iYnYnwES+Dvysh4wTRGuOAL60wi027kiuTb01s
	 GLVCOv+ZK4MdncoAtNXpyn53SQ7+q53y60nlUOmQ3Cy7+tY/nxjA4c4qVtBOp9tt6EaA4
	 LWnBpD8bBG9PR4cGAG/Kk6K/0ty0tS1XyGRuU3YBhO3hSxgtU0CC4sQvdtIYwG7bVH6H+
	 btWY+Jtj+yqjiwQF6i2WJvd2yWjh3dENs8o7ki/zokKSpzMV0HWzOlgvfk6ibM+g5eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fcSTe+/q";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9C606D80C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A9C606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fcSTe+/q
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so17484695e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048460; x=1794653260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW6VoKT52yP08kYUcZyVOPG+H41QN9/GqRijZgl3S1g=;
        b=fcSTe+/qtfweQdCUA56HDS2ncQq0PlxOZREAztU9rO5E5Lvspxw8RtA063mujF0yPY
         8PTkH/iW1nLmFQbFZC5JzS2IInAuT1A3pp19JbsNzNekKScf1Lepnm9P9ZcNVw0pHNmA
         B2We6JOQsPZObdhzUYl57if8AVA5gtJLouq4raq/qZc15h5W0dYYgPyKB6o/8B5kDt5N
         e9zsDh8xA9OzPtkrxXlr8EY1EqlKzU2eX/6PXqbLaAya4333aiMbgzxgRYqKaZzX1ssm
         IlE7RBq4RBrQrVs0Ywcie0WuZ4wCmGZwz5luhjllXKVFHupuSgIwer+fG4KykYZ87Onv
         vRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048460; x=1794653260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW6VoKT52yP08kYUcZyVOPG+H41QN9/GqRijZgl3S1g=;
        b=soe6C0e+usQ4SinVI0LoFmEeYJL1Jxem+eGCFJYdub/tLJudSPJeq82B62POPqkyqt
         Z/s77nIM0j9uvyEUf63Fih1tYkXMrBUzWGWwFcqVIVx4ZxbLCIdKvAMWcF9D66kKTQl/
         0TlpBbCME/JGoDjGG9GGq3uET9OjdxDPqThgv3cHOL4nwr2E0Vd4eioA/1Tb8LfMLEcp
         bp+D1oYc+0xh6Xyv+5kxOFvb5F3mvwUXeHP4nXE0S1w7Efy/prH1vaGK1fclsfznaX/S
         Ytbcn3108JLohBBxP0ktQPVgG4WNOrtscLLq3y2Q8Adj5/3bMAnOvjKkapfBHUpdvFaQ
         G3kA==
X-Forwarded-Encrypted: i=1; AKwUvBx2QDD+VHLbxK2yuFw+pLzvAXPphH7cowdyxa00tNG65dTP2SXvd++u/WgGo2JMUOEuUpwO+hVe2SuEvAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ksx+hO7J8oCIZTi1zxCXfbW1x8VVs3byKcnj70slRZui50DXJ
	jjM8H81I7Xw9vbEezkkoLNJYLXQbfl1bpRcAW0wAKLtawzuin78a0H+O
X-Gm-Gg: AYBFou098u2Ek24q0OLM9G36hr7AkNm+dyn9dh4l15eDfKhdevVxpMlEOEF88BpIsm2
	2G8P3Kj59jqbeOOsE19271tK1LEZc5a/eToLxXU1I0/dPKyc9bMzGKBZ5IanIOWr5frB02NCdgh
	QkmRIW051COuogjH48SnP7GTFasI1KYYCW0b8xARb4krxQUxKuyAiRdF7WdEPuUT9+QMlyzarKV
	Q8fd77iEiOUrylJI8v1fzOucP1MyOENTtSvfLBHS5q5yqh4VTxqt8ImcvKwWY6btnyk2CspTSmJ
	IizO0bZfHFHB4zx2ZojWQNOwh7VI4Fp9J51+oVQq4lV/WEooLQbE493LhtYloMncJRVIJNHCR8A
	z1014JMeN45WoHMSl+exdvm5cJyipYzWAceNz5USgGXWi1njWShiut5xBs6TOG6Z7/LgynTDjPR
	1a2nj5ildyffiDQYfYeba6sv9WUGtijrHKwG+10v0Ra/pa0Xgjq+G54j2StA+CDnDFCbMle/OLm
	UHewX7AwvkjxN0mmulASBAp5lwS1LT6Xnp01JDQeps3RJa/TVE3yAZsANLd+HaNwI/mikn2lkkm
	qE+O4Y4UqIHCJeaaOqZdA/8FAXXCyIXymNmjNsCJcZPjk+8CCr/ABwA1KGvCTCuZYypmH06MGjl
	TkWo6YNDK7rsLUC0kasyEshOzkg4sy3BAE3Fz4gwyVEcg129ChX/zABQ+alp2pgy8f15uyApDnP
	V1GBZB5ZC8Dhdg3Mn1fY1kuqzwwart7t9t2F+U
X-Received: by 2002:a05:600c:3104:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4b6df7d4119mr94096405e9.20.1794048459465;
        Sat, 07 Nov 2026 02:47:39 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:39 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: uvcvideo: synchronize imported DMA-BUFs for CPU access
Date: Sat,  7 Nov 2026 11:47:02 +0100
Message-Id: <20261107104703.44111-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107104703.44111-1-kmehltretter@gmail.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
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

uvcvideo writes USB payloads into imported DMA-BUFs with the CPU without
cache synchronization, leaving physical RAM stale for non-coherent DMA
importers.

Set uses_cpu_access to bracket the driver's CPU access.

Fixes: ccc4c539c05f ("[media] v4l: uvc: add support for DMABUF importing")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..1f92ee96e071 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -247,6 +247,7 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
 	queue->queue.drv_priv = queue;
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.mem_ops = &vb2_vmalloc_memops;
+	queue->queue.uses_cpu_access = true;
 	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
 		| V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
 	queue->queue.lock = &queue->mutex;
-- 
2.39.5 (Apple Git-154)

