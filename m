Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750712;
	b=xPoD4tk9YXfxhqyH/+9nvhHVaSGhrdw0AbtfOVU5QbdXHgpFpJsapVekIOJfHm9RmvV4
	 TRdAeild+cG3jCrtJLMJ+fvDLvvGptwvP9dyOS66VFC4pDGkr/Btp+gGIuQViYqer/sdZ
	 NPW8+qUZAK87dFqAp7uIzbbg+743eE1CBuqEezNQfvNp0L23mN6MRQ4VV562rL/fgzPlB
	 fRaALja+bIrXWQiCcoTFE0Bpe2Zcy+//IlkRlLRLRduJSAGX8UAnAA8U5lAp8/T0ApXbM
	 pJf/fKJs6jUUGGwx+Kthsh2Oz/sP6jGkqQYf/SY8ct/VU7asyA5tkuqIyGg+7JXQcaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t/XVWB9JGMXxVax5GCMXvBykzO5MzXEB215/VJtVKmY=;
	b=DL/eHPSj86X9OXvkm86rydsmxEsVH9uQao/X/pjBNqdcYr62ueeFYJ2yh1z6ZRhZ8dOT
	 oX+Ge9D/j+DAX36RJ0hcbTM7Q/i8xemFYnAMneN0qJ7NPALTWMT8Q4ZzcWN5gu1esB7cA
	 XaEdC2RuYNwfg+WtlYC1DMgYJ091jJhngjaMVOvL1N2TvCpswKwvhy2L9TdWYqEAC4r2A
	 UP/Gw7pMyifAAEwuX41asr2P3Wx9Cy3IO+9M2BbaIoTUbrG+o1IJB8JWF/I9uEistbrjz
	 PG2aTqkeIwtz//GfYKSbVrsrvpZrigPsxKaLMwUtQ/R19SKzHsPIAeyc5j2WXWSEb+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gFc6RMTz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FE6606A335
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FE6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gFc6RMTz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5197785e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750710; x=1793355510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/XVWB9JGMXxVax5GCMXvBykzO5MzXEB215/VJtVKmY=;
        b=gFc6RMTztdm+KVz8vFjbEmexZWKx16rlriokdAhBz8WYRFIzemHAKt37oEKs6oqRqx
         GOrFG8ywpGvH6CbaQ1Jqx9BMVKn+EW1bt+V85r5VTWqdC4kUhHaCcxoKJYWi/KP81e/4
         YQ6pogNm4iMAnnUz/fAI8yon/BH9WOkkzN1wqTQ+IMV5ubr6aVh/qJf3Du9Uqc6wbxRq
         HhD8dGLEd3pOujIGV3aExqmudaPtvgKemEOQCCXayDZq5z1K+ZrQHUsZzNoB/Zt3JkKh
         2HHGtnWFOi1Py+n1nKdWNmYkyIzeE8m4glOOCFScA1Kw5u5uxWIYEKB3DpSQi18VtOpc
         P5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750710; x=1793355510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/XVWB9JGMXxVax5GCMXvBykzO5MzXEB215/VJtVKmY=;
        b=Lx0UPBY2ZZOTecg2/NjiSPqzm+Nla1xjN9NI+Pgofzqdx0T++v214PJXofbwvTCLzt
         JuoConlonLz9kSsHfqeYJiAvvjvB00KRS+ZwxLKL1B932f0j9tnXYEZvtb58btUArKrh
         mQ71T8zb86/IEWp6DGokZNmiW8m5YerjVDa7p2CWHZ8YjFm322Nk3Ka27bZHvXzyIJt8
         iizipifxEFf0aRqD/md3bDXaJ9EfkOX0oKPEXMsA3EuS0p7uHCWLBVxGwok45Uz7eWKC
         FZ+p8LbylwfB6xD24fOdRlZJsF406eZ7Hzrgew0LVI0surbQk+Aeq2Sct+ABJOEN+7Vo
         wFPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6xXSSd1H4UdVJD0CSP2FoBx/zkwwoeKrYBJa6ZU/3TKjqKzkY6slEBUyDEZX15Ho8cerTrivWd3zfTvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS12HKOtHEWZuUejnhpryqM/DwkDv7U9phmpWOMf5yuFWvAfWt
	PI4JKBF2cprOcv0Yj2Yh6yYZXw1OpKy4uQAYv8GppyRJNQFuUU0bqhxG
X-Gm-Gg: AYBFou14DFqK6PBKJRJ9qnvBn0FdVjPKESdKFaRYYtII40kj/lCxGwS609xh11plQ02
	Itv5EDN1RQT74cWyeeJ2GWMt7cc3ZTTRgKv4n4NfjBDB7AIZAeM/Co18eqyJtrEre5tGynxVwvj
	SF6MSyc2GOSNoAQgn2Sdh3l/3pCvXNPqoaQVcEd3ZdKS7UJdCBJ8HLjkdzTyRAIaFtgf2UaUSVV
	7OntnShgzj5SbumAGOyN++YbOYZBdSchZYz4d274VM21bodngbqcTDwU+TEEpY/s3QJCZN2x6em
	6Ac5skeMRJnzXy5IgxZjrV8DWwDsYIx0H5YyG1CfdoITn3QItomdpRh5QMHGj0/7vNwbo+imLnp
	EQxbQO/EsKZS+2+tKjT+27PN+CWHTVxtcVa7pUwQdHENldxe35QgPtGbq2dd0tx8SdOm6/TS4Pl
	kEQ4IcqDawYFcSGbgfVimzRUHmlU7mtk7tbu8008bosAGJCUn83y+vlm+jfH/5edm7M0GQz6TUl
	FEG3sRoA+v1Hozpyyqu8YneOQRpML2fR4UOjsTWiIaxD5DjAnsV3VwWlQ==
X-Received: by 2002:a05:600c:8b32:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4a211ed726emr25539055e9.18.1792750709675;
        Fri, 23 Oct 2026 03:18:29 -0700 (PDT)
Received: from localhost ([205.147.201.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211ba3ab5sm59959545e9.7.2026.10.23.03.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:28 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: kbusch@kernel.org
Cc: axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>,
	syzbot+f4353e96f7004ae5a09e@syzkaller.appspotmail.com
Subject: [PATCH] nvme-pci: disable accessible controller on error paths
Date: Fri, 23 Oct 2026 12:18:25 +0200
Message-ID: <20261023101825.139040-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
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

nvme_dev_disable() skips nvme_disable_ctrl() when the controller reports
a fatal status or is not ready. PCI MMIO can still be accessible in this
state, allowing the controller to complete commands while the driver
cancels outstanding requests. This can race with blk-mq requeueing.

Separate PCI accessibility from controller health. Delete I/O queues
only for a healthy controller, but clear CC.EN whenever the PCI function
and channel remain accessible. Keep graceful shutdown and IRQ polling
limited to a healthy controller.

Reported-by: syzbot+f4353e96f7004ae5a09e@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f4353e96f7004ae5a09e
Assisted-by: LLM
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/nvme/host/pci.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f..777615b4d25 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3296,14 +3296,19 @@ static void nvme_dev_unmap(struct nvme_dev *dev)
 	pci_release_mem_regions(to_pci_dev(dev->dev));
 }
 
-static bool nvme_pci_ctrl_is_dead(struct nvme_dev *dev)
+static bool nvme_pci_ctrl_is_accessible(struct nvme_dev *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+	return pci_is_enabled(pdev) && pci_device_is_present(pdev) &&
+		pdev->error_state == pci_channel_io_normal;
+}
+
+static bool nvme_pci_ctrl_is_dead(struct nvme_dev *dev)
+{
 	u32 csts;
 
-	if (!pci_is_enabled(pdev) || !pci_device_is_present(pdev))
-		return true;
-	if (pdev->error_state != pci_channel_io_normal)
+	if (!nvme_pci_ctrl_is_accessible(dev))
 		return true;
 
 	csts = readl(dev->bar + NVME_REG_CSTS);
@@ -3331,10 +3336,16 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
 
 	nvme_quiesce_io_queues(&dev->ctrl);
 
-	if (!dead && dev->ctrl.queue_count > 0) {
+	if (!dead && dev->ctrl.queue_count > 0)
 		nvme_delete_io_queues(dev);
-		nvme_disable_ctrl(&dev->ctrl, shutdown);
-		nvme_poll_irqdisable(&dev->queues[0]);
+	if (dev->ctrl.queue_count > 0 && nvme_pci_ctrl_is_accessible(dev)) {
+		/*
+		 * Stop an accessible controller even if it reports itself dead.
+		 * Otherwise it may complete requests after they have been cancelled.
+		 */
+		nvme_disable_ctrl(&dev->ctrl, shutdown && !dead);
+		if (!dead)
+			nvme_poll_irqdisable(&dev->queues[0]);
 	}
 	nvme_suspend_io_queues(dev);
 	nvme_suspend_queue(dev, 0);
-- 
2.55.0

