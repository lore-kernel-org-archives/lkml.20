Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383528;
	b=laQmQMCAaDARshnlsNBmPtQu3e89jUQp6XNd4lh6TudRf/b9USUSGTjq9oiRvqm0RLDJ
	 kElLeUyLmDigroyilMS6iuRpOLZsmlZ5EORhnc1rsT6V8VXeb+h5AlLrOgoRVtt/AvUEv
	 MEUxCoTXXem21lf7x+g5xG071AbdfO/vTXraWdiInDiOmBbWTTbOhfLChBl5ChTtrXjCa
	 bQ8LgN+wQhZfeuon+o+BqdJwyIOqpHhd1LxtiG6V4PefBtcBDgbL/n/9I2aS8mDvNrBIY
	 QfdiAEISJc8eEwvU3l+Ns7E0dcB0u7jLZ8xHp/2izHusxtNpiq/7Lw4kFeWgtJEKnmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uZIN4D7jbH1Urh+LOeQa3/6TVd5EZ4/PM32bHYfTJqU=;
	b=ssvaSkX3vaGJsey8QDExFSTwcqyf4rV0YAPQOEMw+tJFxjQH1e5rYpT+4TOP56RvWvy5
	 7yrkH58nUwvUt1nKJhBvskRJBZIPWUiTuCpikgq2wzjMKramDukTq71u0y+yoeiOqk+le
	 pBD24v9iQKY5fXytQFOEuIUrfDMlxgo8mJZR+7p4q6Lmb3a2yOKJCsLbKha2FKBfWZCiw
	 znImYeUvnm3o50pHDYIisCrtBWakh3n2aJ2SqVciE1qW16bXcKDmMm3wH+/gvUpmLZfVG
	 wSm4Ft5ePMsKybTdUrBiZdsoN4AopKaydTsdYlsQ70Q90pVsLe1nbyHbB1XhAqUWemw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mozVRJlM;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237C606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9237C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mozVRJlM
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3acec6677so4519112c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383528; x=1794988328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZIN4D7jbH1Urh+LOeQa3/6TVd5EZ4/PM32bHYfTJqU=;
        b=mozVRJlM7OGbOsRObxBDXtbtLpVd8WFZ2Nbx/PZPECiiYobK4Jq74y7FkD10otMWLf
         fkic3pPMkYhDiOjfooRgOmv4xOmC79EJuziJtQzaPS4JrvOREtk+DoCLT3rjPebXMx3W
         MEZf2qmv7Aynt9nAqI+NVPCFLzwxPcLhTxT/CIiiIisLDMrlx+SJ2hTMRMkRwxWuzmBX
         Jpzb6Ps4id/RbCnDBzCDc14wXolo3dJwcc6ucPReOy5UshTS+hxq78v/Q8nEEvFeNY9O
         jLR0W3HzDgvkPLnBz05ffXeRhnQvZPfdWlMugRUg07DR0GPY679oQsti0XbAiDkozUj3
         rUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383528; x=1794988328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZIN4D7jbH1Urh+LOeQa3/6TVd5EZ4/PM32bHYfTJqU=;
        b=pOF6YJ1uVPDSqb2s+R01K4mhDp0Lce5607Rkb+xUkyuIqddyOgLCn38Z0SXtNj6nd4
         sOMBKBM9mcwAaG9k1j6QTtSDjYCI1Rv6dyRdCGL6kjZm1hqbZxtH2/wX0zva8NDQzOYq
         POZtdN2PNxhihJFHDnFv+QgMgg9GUjDRK79wac6M3GbIh8eUWuNQ4LomOixHfQEmxhyY
         GXF4q3tgyyZKsaAgW3i9GR+XICHQmkaaSwxTlqzObt16Gq3LKVkjxoGjVAk/1+WPrGfe
         fYRSTgrHG7TYQACfJdE8pN5yRNxnbb/AGzDYqq+m2LFkhSar0SVuyImbfgsMVRYGuOe3
         3iig==
X-Forwarded-Encrypted: i=1; AL+hErEiGxzKYIt/M+LnpiO4NWeHmrL+IAgoJ+RJ8Sz3V/KqExRwQ0I2Z0H5O7K972MB2DRQPZ21jE4jO3ZkXTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ps9+nIbbUoBMIIOo61lW/+FouV5WRepDbKH0mRL4gEzoVcbQP
	Ucz9PB/6So73mdWcAXjot0MZ8YutORqvbtgY1L7xjumPAwdlEHOVLPeB
X-Gm-Gg: AYBFou1JSrB+bOoJdebQLiRC+AzdErhGEg1W7qMcbZxjyUlmICONNIDD24XAjX1kiMi
	D15JkDe3LLAmd2RnVQzxkMrXpxLocMC78XvhVFzWTpJ5GOsoeIFm6EF9TWteiveWoCXZxv9cHkK
	EYXBcYkz8/2tm59QwSNUfYRWQQQDK4nqFMS+RBHBGO9cQYBCeTT0tChJU6pTfh33mO69N8IaFSM
	1OtIzlf2qXLAXbyv7FFUPmHeLViO4yYjK5XAhkivg7gxToHJQAOIqJ2J2eYmMgQcarMQ6ybSXro
	o231qzpVmUpMQMM+l3N8UHDUiYS94sNg7IA/FNKtb8YzkRwZ5fY2ghCcjhPgYascr+2dxjnvuOk
	ohewp/kEzxaG0/AyYHRNmO/XctobiOC9tksfsaFc1ls7I3ApM4KgeOXltMCmVjn9cuPwh49RiiW
	3dFcPlP67VGCUKV5XbtmMZon0r9xxw50uy73EggR0vhefjV9V3PXC7oXhmLby4HXN/HmK9rTYNb
	eZl8qXh2ojfJiNrqnwRwqzXzXfyN30uLLBYRRs1nYTUJIv996EXvfwmrr0q95oGurS6B18kOLYO
	EuLTBMPFKIrpICvN0eMKziO27bLn1n4FAwjLwRnk+U8btpxb
X-Received: by 2002:a05:701b:2302:b0:1b3:a26b:8b97 with SMTP id a92af1059eb24-1b3c0353171mr1674179c88.41.1794383527293;
        Tue, 10 Nov 2026 23:52:07 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm11284950c88.13.2026.11.10.23.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:06 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jiri Pirko <jiri@resnulli.us>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] virtio_pci_modern: don't sleep in atomic context in admin cmd submission
Date: Wed, 11 Nov 2026 16:51:54 +0900
Message-ID: <20261111075154.3017978-1-hj351016@gmail.com>
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

virtqueue_exec_admin_cmd() calls virtqueue_add_sgs() with GFP_KERNEL while
holding admin_vq->lock, which is taken with spin_lock_irqsave(). The admin
virtqueue is created with ctx=false, so when the device has negotiated
VIRTIO_RING_F_INDIRECT_DESC it uses indirect descriptors and
virtqueue_add() allocates the indirect descriptor table with the passed
gfp. Admin commands always have more than one sg (header plus status), so
the indirect path is taken and a GFP_KERNEL allocation may sleep while
interrupts are disabled under the spinlock, triggering a "BUG: sleeping
function called from invalid context" splat with CONFIG_DEBUG_ATOMIC_SLEEP.

Use GFP_ATOMIC for the descriptor allocation that runs under the lock; the
table is small and the -ENOMEM path is already handled.

Fixes: 4c3b54af907e ("virtio_pci_modern: use completion instead of busy loop to wait on admin cmd result")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/virtio/virtio_pci_modern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 922e2df027de..ef96140118ec 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -101,7 +101,7 @@ again:
 		return -EIO;
 
 	spin_lock_irqsave(&admin_vq->lock, flags);
-	ret = virtqueue_add_sgs(vq, sgs, out_num, in_num, cmd, GFP_KERNEL);
+	ret = virtqueue_add_sgs(vq, sgs, out_num, in_num, cmd, GFP_ATOMIC);
 	if (ret < 0) {
 		if (ret == -ENOSPC) {
 			spin_unlock_irqrestore(&admin_vq->lock, flags);
-- 
2.43.0
