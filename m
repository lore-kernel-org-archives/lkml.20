Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315018;
	b=izZnOIWc7sc1+U8j7w3/tUWCXfoh5qEEALcI2OjNdBvmI9CF4BIe81I1mdyizkxaiVxk
	 IPx5TkJrTs0AFZuyaXyRjjFFsCOj6bWDb+syOIK0DjJGOTguDS5HGdTHMickLLXPOJXIV
	 ADcyBxQRH7kV3q0ANWOrwzc5dU/qAKGSRaqaR6yC0rV3jyQUf+MgnLKz7QrKQ/XLXvu3r
	 6XMHF3u9hchvNyEPn+ZnqQy+1ki2mvtQA47uAGFRFowYIFQCgjuvZ2BCUSNLXnB2EZLLR
	 Wa+JHV+PxqlM/WCTfCN94SLFsP/3qCIz5gAXt7Fy3nEw9OiWXzGNn8ktN7pAow1Tvkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hIqePvJF9vqtDiaaoJWj4mMGLwExY1SZs6wpgpJb2hI=;
	b=YDZuFbivHFUAiKT3I617z/nTOf7lSqb9vbfAkAFzZGNhmWpf9t/PazkyGMxXZVujfURx
	 1QnoqhTXn09LSjyL/xqBliCsWb/dgKcAC5JAibXzw+5IhnAqH+2lpCWa8ak7qc2P9nP21
	 igQDrqkhb3Qxnnvsd0gi8lblf+9aaniCJ9GLLhGRUteiKE6Vcf1jv5zrseRka0U/9HUPQ
	 lEbelsTic+Il4m0NI2QF5AJ26ugon1x1Jcs066xFBYGKqM7kyTzTJ7XL6FHstvZmOQ3iD
	 vUYLqll0KeJb3qpeZMFeQE3Uhgef4hOYtvcErUC/ZaVe4c/0w6EHar+/pDUAfw1qK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IotGoqC+;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF560A2603
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDF560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IotGoqC+
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so2998890c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315017; x=1794919817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIqePvJF9vqtDiaaoJWj4mMGLwExY1SZs6wpgpJb2hI=;
        b=IotGoqC+GmG2HPnZoenFwtMfa8+hS1ddNGLnLGzjf0QcmNQlfehryt8YZELOvNqyAU
         EIPz4rdTVIWYGt5P7G2457HW5qSQ4cEYKOjXx9BoxkllcA8luwYoXt71Zb0rJ+EMa8Of
         ZgZxSbx0a5NJOg08UEhgDJU5fsEVrYdShGgK4dSNbJSbLiLHyMvJ2PhDmyicgGcHOwCg
         /ofvq9VB3632C6AIp8UbNl2Wossa3ScvUZIsuJm8WWgIVaAqOCWv8LW5sXahzDJoxdzf
         RSMCElxmOedIRXNcObQaefNGpbPh2JrDNneTpwEPwbelqcSyorj+tBIP8jJe6nnlVLkd
         59Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315017; x=1794919817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIqePvJF9vqtDiaaoJWj4mMGLwExY1SZs6wpgpJb2hI=;
        b=wOxS/H6cDx9LyePEYrb1SKRvhDcaKoMfJf00o2S6bckixIhlws1mcY8apdnVCq99wh
         xBLXuxZDf/BrRSdec6jQxWXkAlOR3zKFcdU7KNL4xytt5uPxFq0dHNvyCYdn8PV2qiJf
         zV1s1TzlXgEE8YYkw8RGAN1ZRtybeg5pFmGLvXyM1uzszPjYiBIMDECIVe5UJ1OVl69b
         oXvXiYeSgFh3Xxz1hvy3KhveM4BkeJrxYyKY+YJVjRDeCFxvxlQ30QmCBHFrlUBMjd4E
         eHJcnECDrNGJwPtcYEtHkRZRP/oVyaUJeJWritX/3fSf9sZgi09f4c6XHe7VBXEr6Xen
         feQg==
X-Forwarded-Encrypted: i=1; AL+hErFRfHWZ+816quOWXbtapb4PzsnQ1a6q5mN0fdhL5SQfEoGk9rllFdB2nSWt1gsWO2LyGOyuKuGYNVMtuso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uXgjOPZZmOF10m8gYgv/vf+X13sW6qKmtKbLLAS1LiumCaKQC
	pu26cTKPQELT9daegelT6x7K8exVoesqCYgs6czo3DgijLuCe4XIkaqtua1ywxhqs2I=
X-Gm-Gg: AYBFou0jbyXGSnkhmCMeIMb0/NARqCA4QpLtwgYSdLvTrbCI3zaAQzLgUkIbsiMOq4j
	myq5Oj4D5ubSeP13+1dqFBeNCYCo76yT72yIyxFGDVVyLQ6ocIAgPD0WLQ5TpLSXq59GHQeEbTm
	6SEwiTmLptl0H6gTGeCvoWUMvq2GWppVwiLEiwJVcEGb6rs/+iHGPUIvkpvjf1ft5oDaSUBl+py
	fjnPtk3bwYpHoslTVrcv4fK1Bmels92aYO2CHdkOGtMzt5EzehcnvOpGQY8nlDEBIT/dVyCEnOS
	oaeSOac5Y/CS5SyWA4DISQFHIVdkAapq0cQkeA5G/IwP0Cda32ZryY9ptEEPB1/kHnMiL7aeTlk
	BCMEn/+4mCc4FJv1A5pz3va7IEkCajvtsyuIwORrfZu3L0UZolQbwlCScFtJIWn5NiwnHPZKNJt
	GB8yDgvml0xVkhyM5/kdCBHyZq7/cB3MSy70z4gUAzSo4YfjyiVYe4Gljz162SB7dKqutsDX/Of
	qB6NuXPshtjHOirK2TzlqucHgmqKBnbj3qqZg6vyuz1+HLLV4iZYtPGWY6DmTQDh6qIbZVyJ/Bg
	/R48q5wEWKsUj1tjHvHo22DhaJNCNpipqxOI3IylfJ2XtwqeI3iSgJFq6JGu+5Vpu4UKEnA29I7
	NRAiDW/UUd4Kiu+o5VoT/3SZZCxQ3tiZ+82ZsoA==
X-Received: by 2002:a05:7022:ed02:b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1b3ba7b2b01mr1258881c88.26.1794315017171;
        Tue, 10 Nov 2026 04:50:17 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b79649sm7614830c88.21.2026.11.10.04.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:50:16 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] xen/pvcalls: destroy the per-socket workqueue on release
Date: Tue, 10 Nov 2026 21:50:02 +0900
Message-ID: <20261110125002.46683-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
References: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
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

pvcalls_new_active_socket() gives every active socket its own ordered
workqueue:

	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);

and nothing ever destroys it.  pvcalls_back_release_active() flushes
map->ioworker.register_work and frees map, but the workqueue and its
pool_workqueues stay allocated, so a frontend leaks a workqueue per socket
it connects and releases - a loop a guest can run as long as it likes.

Destroy it right after flush_work(): the IRQ is disabled and sk_data_ready
restored by then, so nothing can queue new work, and the rings are still
mapped while it drains - pvcalls_conn_back_read() reads map->ring and
map->data, which xenbus_unmap_ring_vfree() takes away a few lines later.
pvcalls_back_ioworker() does not take fedata->socket_lock, which the
backend_disconnect() caller holds here - only the socket's own
sk_receive_queue lock - so draining it from this point is safe; the
flush_work() just above already has the same requirement.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Cc: stable@vger.kernel.org
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: destroy_workqueue() moved to just after flush_work() (Stefano).  v1: https://lore.kernel.org/all/20261109122324.30134-1-yhlee@isslab.korea.ac.kr/

 drivers/xen/pvcalls-back.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index dcefa91a40cd05..d97c5eca5f3513 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -452,6 +452,7 @@ static int pvcalls_back_release_active(struct xenbus_device *dev,
 
 	atomic_set(&map->release, 1);
 	flush_work(&map->ioworker.register_work);
+	destroy_workqueue(map->ioworker.wq);
 
 	xenbus_unmap_ring_vfree(dev, map->bytes);
 	xenbus_unmap_ring_vfree(dev, (void *)map->ring);
-- 
2.43.0

