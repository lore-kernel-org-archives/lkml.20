Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170A3D955D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531208; cv=none; b=HfvS+PlMJP8e1tXaRDKuZxzKFsaEoIKJU6JLJj1ggqyK89bTyteJ5PmG/RV1anG+ZESRZbxE095SxWPB2Ollk5+6K/YwnlkL7C3eUc9gSxWhSwHL9Dnz7o2vTmDYq+WpaUO1l1wTh1KpBY1OZajq3/kGcrNnqsOPZvDMVo+toIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531208; c=relaxed/simple;
	bh=vMueACiGC1q4rjqD2bksa/EDtJQRCWH+HapwBBqFDZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGzt+Fy5svxk0SebQiICSyaN75VqTRApwArBdIWgXgFfQeVs/zVC3VFlLyVwb9mtRxPYsycnkJ0jvIs49DJdrvbwGGmlImFisO3kMVlZHj01KSweqF5Wf545VxKhzgmlk/8Z5KujyU/ZE3mpECQxc8rUbD7NC7kObyYvQbsuyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BapTLHNE; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BapTLHNE"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9391e3b21fbso98622985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788531205; x=1789136005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dk9pnlg6SvIAGqoJPX46s5o8Gmgm9I8OPIZtQkBklA0=;
        b=BapTLHNEM45z5zVsMoHfrxispe2PdtqvxELhebwmSGTSKgZxea11s5CaKUt0Hm4bid
         vrY91tMwuy9O5U9BJYR3PUAcx0foVZ74FteVBLnO3xM6xnwC6qovvLKjf2NhO3Qe3IeI
         c0aGUf7i+sH8fe+IYbYCObSrUoT5ww8zULYMJTqJlB3y8BMDKpH0NcYmZWeOU0mnmwe+
         hRCt+qU6Knw1TxmriEF7rzbSi+k4/JAKDdfX/49hj0DX7IvjPHRrNXgRMA5FhSDpxQtW
         jGfeExJhj2k4GBmPtQ/+7wviofN9nodf6kWJE0LZFgm7n4CQ9B7D2tTCQLfTMZPHoEV2
         BVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531205; x=1789136005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dk9pnlg6SvIAGqoJPX46s5o8Gmgm9I8OPIZtQkBklA0=;
        b=kde08Q+a/Bx6ljnmlmdRwzZiBroGF2DOaGM046gHoSKQOjgAUpONIkRTwLLl7OO4YN
         rIPQqGQKuryL6hztoeoOg99sFLARPBt01fPGLP1ZiMdAcm6uJowYn9XsRJDuTyFVMiH/
         6aLvf7RM8rZ9n1XY3NwjEsO1QIVlXFVlr+6/f4xlRAL/HoVXXRMf/x6Mbhk5mEKON5Hs
         08Jxp+BoVpWcOpX8R15D0PZu/iQZVo/oSjd1Ngr/SE75kz3OsvyPsHULnhW2n7n3I/rW
         oRqWySpnBY8c8apHM0/oCUnBgQOOuStdpYa8xNVZ3+e6SJlKDB+5C1oMPl7tp+5ePNU5
         WBvw==
X-Forwarded-Encrypted: i=1; AKwUvBxeBbJQzn8Jd5rDw1AuNczPbYhZNwHTUeB613m8vFp28ZBtzVt79IFFAzBwAhn3pVnXve9pjeUQY5pcHpw=@vger.kernel.org
X-Gm-Message-State: AFuF++lA3i1Xuu1QIoZOVNe9EeaXa5Q2ABNejuNqlvrKh0YPWaDVMjlN
	DeK1ejHOed7jzTO8o2dM/k+RoPHkkMjegZS17wv8xRj/GXDV88rSo+jA
X-Gm-Gg: AYBFou0/YjcR3gfCwlaO3iGSeYnUz2AVPeC0kb+Z5Oc1mytEi+j6cUuIdMy0I/hkqIW
	5F1Az2pO3jjHdSj2AqwGDgUpgVjCKYW0bDJjzVvpIV/8BByUw6m9D9RZ3NB91FiuBmGu5RdJAj3
	sGh1wOhDRcJERunUOGoX3nMBWVStCNgt62kvzWrJuMxd1JsONM+yHI2eV5XEjTSwP+6IesH2sk2
	xZ+71FhIowlkJKY0zexaiRpY4ClRT1SPb+c4M2pUCy0kuqe1v2i2tV8svLn0HLPH3b/k3Ay6+jg
	aGAWVJ+o9zK5uoKz495L/Ueq7V/+QLh2feZ648DnvdRRmVxOaLrBfbcWlkqC/8oPtVQoxxc2Qch
	xKslDeG/liSO09TvuuFWU7/QYYPl6emEwMn8SOpb9TQSknX8MbXx/adUTgciqRoqWVU4HNQCIKe
	eP5cJo/4/iFYmRcLkdARP4s1PSqk5BmKKCkR0uCNmHWoIV0mzfAVwFMvIv4/sH18Zs++V+rX67p
	AIJYR2BntUDDkFZ3S8eEVUzsll0gH5Kz0E2CksNmBurvkCscv3W7PSPhPVPnEWMoztrBI3n+SAY
	c8JdJIBhpZMaXMjz5BSo+5NM29V8kXgcxK8Vx+WuOB/W93ABmeeK/qIo+z3HhNINS/jtwOla8A=
	=
X-Received: by 2002:a05:620a:811f:b0:939:6dea:374b with SMTP id af79cd13be357-939804f7c81mr480625185a.47.1788531205179;
        Fri, 04 Sep 2026 07:13:25 -0700 (PDT)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:bc26:3e94:1d7f:e1ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397faf927bsm217736285a.8.2026.09.04.07.13.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 07:13:24 -0700 (PDT)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: mst@redhat.com
Cc: jasowangio@gmail.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	astellman@stellman-greene.com
Subject: [PATCH v3] virtio-pci: return IRQ_HANDLED after non-zero ISR
Date: Fri,  4 Sep 2026 10:13:18 -0400
Message-ID: <20260904141318.30278-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vp_interrupt() reads the ISR before dispatching config-change and
vring handling. Reading the ISR also clears it, so once the read
returns non-zero the interrupt was from this device and has already
been consumed.

Currently vp_interrupt() returns the result of vp_vring_interrupt().
For a config-change interrupt with no vring work, that can return
IRQ_NONE even though the ISR was non-zero and the interrupt was
handled.

Call vp_vring_interrupt() for any queue work, but once the ISR is
non-zero return IRQ_HANDLED.

Tested with QEMU virtio-blk-pci forced to INTx using vectors=0 and
pci=nomsi. On an idle device, 200 config-change interrupts were
generated using QMP block_resize.

Before this change, irq_handler_exit reported ret=unhandled and
/proc/irq/11/spurious increased from 0 to 200 unhandled interrupts.
After this change, irq_handler_exit reported ret=handled and the
unhandled count remained at 0.

The issue was found during an LLM-assisted Quality Playbook review.

Fixes: 77cf524654a8 ("virtio_pci: split up vp_interrupt")
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
Changes from v2:
- Repost as a standalone patch in a new thread, per maintainer request.
- Add LLM-assistance disclosure.
- No code changes.

Changes from v1:
- Return IRQ_HANDLED for any non-zero ISR, as suggested by Michael.
- Add Fixes and Suggested-by tags.
- Test the change with virtio-blk forced to legacy INTx under QEMU.

Full red/green test logs and the tested v2 patch:
https://github.com/andrewstellman/quality-playbook/tree/11ba61d/evidence/virtio-pci-intx

 drivers/virtio/virtio_pci_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 10371ecbc054..b90c174450b2 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -120,7 +120,9 @@ static irqreturn_t vp_interrupt(int irq, void *opaque)
 	if (isr & VIRTIO_PCI_ISR_CONFIG)
 		vp_config_changed(irq, opaque);
 
-	return vp_vring_interrupt(irq, opaque);
+	vp_vring_interrupt(irq, opaque);
+
+	return IRQ_HANDLED;
 }
 
 static int vp_request_msix_vectors(struct virtio_device *vdev, int nvectors,
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d

-- 
2.43.0

