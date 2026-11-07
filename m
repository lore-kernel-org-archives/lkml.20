Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048464;
	b=3qNbP8byTiUI716cETfYzm0zgTVIqBXQ/Hlv0akUYBAFvdDmRAw6AGTsW3XHdQl/bGhr
	 h2gmUqxoo25Xh8iOspLlzN0ayhUEQajKvy8q7Xxj0LuFUs1tXItA7mtPvVlRathXfsiWY
	 K3o6hdmfjHfgfjHIIJc7CtKvjakC89msR1+rFYh2rkA/y2Bibu08lm10tA2IPfQp50eFy
	 5X6dJzhLzPnbCS8jH3NzG1HvrFf8ZQgIqMueR2hAHLZ00kMlJu4+AJ5tZ4o+mKr52F/Uw
	 ufMf+FRnrDrbv9MvWP7mA0J2+ShMFxRuLm/gVZWsmu6fDoG+Zpfv/njYq/Df2x1wg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lE3xmFujzdL9mAxvq99OHiv8yHFQXZ5P/LTujcPa22k=;
	b=hguZCK9MI1cm3hGRMg5hyLAV0K7YqQlpeSgmcTzRKdRot8M3M6uhP1931OW63nL/4Kdu
	 nWg8lBORBXkJxN1vyslH559330S0Z9kM14dqMFQ6OrEdFrPnGQMLbl8kGnFit9A0LEh+p
	 NSQWvq5Cn37sCnjWcORjKEmVhIRiPTlCutbh2e83Yp1HAvjci4Puzmzid0RmfB9lKzIhv
	 9wX+sXdIXuKngjIGYKywqPg1emHqLVweLUnNRMKOvz/xd+IN0+pKDArI6cb9e6EaAVQU6
	 iSQ/N7yAhN6Cty9s7R2XX5HztXYImVW9mYpI+SVhp+ig9aVHr59jT9CUCrGbS0qhytA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7Wlg3DU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EA0606D825
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EA0606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7Wlg3DU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so13015305e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048462; x=1794653262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE3xmFujzdL9mAxvq99OHiv8yHFQXZ5P/LTujcPa22k=;
        b=X7Wlg3DUIcRHTVrYGzxJ2BEaIfyXqmm3nJPYTC+NuLtMcYPhGC0ng+vGEYGOBhMRiA
         snJtFNDG/G5soobH+RFH5AwHv9/y1znuzh1F6vvdyV3gGK4jyVEdZnX7ArfWiEBhVKHA
         D8UjlPO7XiNX86BFtfrdOSlHuMm6J5jWEP3Is8AdtTIEgMdZq/MiDXETWyxKI007X7LL
         9Abus2RajP/Hw2HUfdo8gsNLTWJ0ZObARhvH4TJEShkgN5K2JdZAzPOqXBD+hB5g1c9l
         RPm1ZRn99JiW4UAb9afvDAu847ki3SWcfP/UvsBgwoqQM+gEklTZy+6Oxw8KgL9cl98c
         HYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048462; x=1794653262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE3xmFujzdL9mAxvq99OHiv8yHFQXZ5P/LTujcPa22k=;
        b=2vWI47sgqp45fDiEj/dgbCXRHLIKVRfhC1FNvbl32PYZIFf9jvgW8LO9fPYUGxBXvd
         LN83Y7rn/HY5IzIbJv4EMqKVmOSCyW85jAGkykN1r1Onwi3snROXfz+fPm+manfVZt8i
         mC/g0BsHQdgyXKZYW/bXAP88LFNHz3c0fXy96c4/GsOsR0rA6U0xTPSW42TQtMDnYPGo
         sSQ3hMfAs4TENil+Xuz2q9oq5UyCtbqSyWHgU9mFFUr9n2SORjH95GVVNiqbXPPzuTUx
         s+AfQmMDUyaVMAA0Qoo9L/mu+Oul3VDjkUNZYzKu/7FvE8S/ay3kIIoIuUfvWFF8ngnJ
         UHtg==
X-Forwarded-Encrypted: i=1; AKwUvByXj2dputSsLzQoDD+8UC/myU5Rli4yt5IeLtZDCjwnGcqK+APERYTPbRJXIPK8fWyNb7j4EnPDom8Jy3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HflEj7M7f9ZuPScq1GecYCuLpm4Yww5NxI/a3CacBd6WziGRL
	U8Y0GAzTKOXdi+dYebS3JbPHitqeWT8C+38FyJCl03jC+/ORsSIDu6hn
X-Gm-Gg: AYBFou2QAc0fwk0DPSeaBp6OEl2B2N9tuXPo96KCfxJ2yp8LbPlgN5zLMA7IDkSGCaU
	T2cOVO6PWuEZjEgn/rP5RtNAFBteIkdvaUNNHU0IR5UqEMOUTGlUfkinQMHCt3E9HuGpKHdpIqF
	JJN9XHhkHMN07J6iiWyRJ2S+Hl8+zL0nG57EvDA1ma+88ZwkUu77p9LxF32eqNHwbP2ldcJj5Wk
	FOyo1INdBQw0NfLBP+KEfFNBNSGIBMuzcFTEd0m/8KCL5oR54EYZ0oN9nSLXodI+1OFIixPY5LZ
	gOMn+MjNxUA7V9+CS5/ueAD2IcqGnCINKN2kmr73e4xzVH1sa6BoLgKSyCipTZ2JnVWVtpIk8hE
	1cmeP9+zthEofV0prQJrhCYs0NmEuZIaQxy0UJEB32JmGQrZ1y50q0Dz8M882ObtEdjLznhFrxH
	cBvCsJ4DmXjVjllA2QL7gSJLCIrRh4Cbt+3zToVq12rpgWNY2PCn6c2arvtUckv4auH9OO3uzTL
	f3RlyOSQ/Sr/mekrdiW5HwWaxODQPWbV23GjFIVmLzNIZxoN0657ATUaF4f2Ut/MgGzQvzp5K75
	vMxZ0KZFF0OlQavnk357ROlbi/uRg2rLD0U0t5R2UCSxMhyi/cW7a8DeC9F6oZYFeB+bZEQhD1B
	ol5omhrNfZ/5uB5AvfVGob05VA8UM5PPB0YU3LB+k2qix5l2rn5i00wJaKga46b3V9ZyFk0ZYYc
	3lOWZ7BbjGg1CUnFtDKuWgjICmysnCZ7NrZR0T
X-Received: by 2002:a05:600c:3f12:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4b6d82b2c91mr92859825e9.0.1794048462222;
        Sat, 07 Nov 2026 02:47:42 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:41 -0800 (PST)
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
Subject: [PATCH v2 3/3] media: vivid: synchronize imported DMA-BUFs for CPU access
Date: Sat,  7 Nov 2026 11:47:03 +0100
Message-Id: <20261107104703.44111-4-kmehltretter@gmail.com>
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

When configured to use vb2-vmalloc, vivid accesses imported DMA-BUFs with
the CPU without cache synchronization, leaving physical RAM stale after
capture.

Set uses_cpu_access on vb2-vmalloc queues to bracket the driver's CPU
access.

Fixes: c88a96b023d8 ("[media] vivid: add core driver code")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Set uses_cpu_access only when vivid uses vb2_vmalloc_memops
  (allocators[dev->inst] != 1) instead of unconditionally (Tomasz Figa).

 drivers/media/test-drivers/vivid/vivid-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index c042d92db175..f6c7460cdba7 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -919,8 +919,10 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
 		q->max_num_buffers = 32768;
 
-	if (allocators[dev->inst] != 1)
+	if (allocators[dev->inst] != 1) {
 		q->io_modes |= VB2_USERPTR;
+		q->uses_cpu_access = true;
+	}
 	q->drv_priv = dev;
 	q->buf_struct_size = sizeof(struct vivid_buffer);
 	q->ops = ops;
-- 
2.39.5 (Apple Git-154)

