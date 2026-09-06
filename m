Received: from a11-114.smtp-out.amazonses.com (a11-114.smtp-out.amazonses.com [54.240.11.114])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B61A9F90
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788664492; cv=none; b=M19Hj075wqrdFgmMcXr5Vqoo5DhKns53B8FvExd7fXyPnvWbGBJWE5W2X5xorfZvpwSI6Zwazn5vm/jDqoDvBe66fGCMaYOUfHGi24K8jY072jzHiUOuivBRvW75q4yajHr+6Wr4tjI1IMVPdSjoSC9OQkwKFArNwaaNtlEdXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788664492; c=relaxed/simple;
	bh=IDyTIaqjPwcdbzGwtw1+rh5VfNagu3gGzzLV8NV7Wh4=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=EusXB7x1NbS87dWc50z2hFK1oOg4IVw6mDfw0PPGrb39Z89H0gDH8o7SmQH5aBMfnU9ZjCEbHLx/u4IvWa7UIkAiF2auGZPKlZajpmNz550yWo84wJrb6jHPCCVXx7h3ZKN9BOectmwVMBRIU37Mav9nA495/Ham9GrOykSwxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=willyv3.com; spf=pass smtp.mailfrom=send.willyv3.com; dkim=pass (1024-bit key) header.d=willyv3.com header.i=@willyv3.com header.b=J1zNA45K; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=S/HrD7R0; arc=none smtp.client-ip=54.240.11.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=willyv3.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.willyv3.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willyv3.com header.i=@willyv3.com header.b="J1zNA45K";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="S/HrD7R0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=willyv3.com; t=1788664489;
	h=From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=IDyTIaqjPwcdbzGwtw1+rh5VfNagu3gGzzLV8NV7Wh4=;
	b=J1zNA45KuPDX2fdHSC0gGbT7lsDjesIa3uV+75YmZEMMwAzJMIl+5/LLwEE8Uj/7
	LF5jpBtBRGCvzF0w9mpWSYuCPY/eYmDUIRUobKTH57IGSYTGv87Ny5qEKqpVPCRw32z
	85lJL6zkXoxKiriuu/wMckuNFIfDrA54GmKtVtIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1788664489;
	h=From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=IDyTIaqjPwcdbzGwtw1+rh5VfNagu3gGzzLV8NV7Wh4=;
	b=S/HrD7R0dqaaBXiYjaurFJIuS52nseN0knPjgQozhktxuJGUHrIfM7M8wz66D1CY
	t2wtLgobmYXas9NV+yZE897ZlquNK8Jam535NqJGLMvDCZeJAdNXQKlUeh7Do1NqXk2
	szWUGi4h5w1j5kH/IsurwW9QOpOtERF3jLPXc3zo=
From: willy@willyv3.com
To: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] nvme-pci: use simple suspend for the Apple T2 ANS2
 controller
Message-ID: <010001a074b62726-69686506-a02a-4058-9ebc-5f8125eae0f3-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 6 Sep 2026 03:14:49 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.tVoVnBTusQKwEv3FXsafng3gwgTXiveIP8uCFN696SRuTdSqJLPWcLHhZMGYqGEWfSP3N+is2iSOKdmX/9ngsLeiTVoJkakNxJEB+yEN1ZJPtwlO53LLRiFsTHXrFviVUeKFV0/4bko6iGjXsDtchIeimK+HIEYE/SJqJKFonco=:1.us-east-1.pAEstvQcjyhQNKGKcgSlzI7SVR8ZSG5wSmKwiz/A8Dg=:AmazonSES
X-SES-Outgoing: 2026.09.06-54.240.11.114

From: Willy VanSickle <vansicklewilly@gmail.com>
Subject: [PATCH] nvme-pci:=
 use simple suspend for the Apple T2 ANS2 controller

On T2 Macs the ANS2 NVMe controller (106b:2005) is owned by the T2
coprocessor. With suspend-to-idle the driver keeps the controller in an
NVMe power state across sleep instead of shutting it down, because
pm_suspend_via_firmware() is false. The T2 does not preserve that state:
after the first resume the controller stops completing I/O, and the next
suspend hangs in ksys_sync_helper() before it can even freeze processes
(MacBookPro15,3, 7.2.2 + t2linux patches; the machine then drains its
battery while hung).

Give the ANS2 NVME_QUIRK_SIMPLE_SUSPEND so suspend =
always goes through
nvme_disable_prepare_reset() and resume brings the =
controller back with a
full reset, which is what the T2 expects.

Signed-off-by: Willy VanSickle <vansicklewilly@gmail.com>
---
Tested on a MacBookPro15,3 (ANS2 106b:2005) running 7.2.2 with the t2linux
patch set. Without the quirk the second suspend hangs in =
ksys_sync_helper();
with it suspend/resume completes and the controller =
keeps serving I/O.

 drivers/nvme/host/pci.c | 1 +
 1 file changed, 1 =
insertion(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.=
c
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -4283,6 +4283,7 @@
 		.driver_data =3D NVME_QUIRK_SINGLE_VECTOR |
 				NVME_QUIRK_128_BYTES_SQES |
 				NVME_QUIRK_SHARED_TAGS |
+				NVME_QUIRK_SIMPLE_SUSPEND |
 				NVME_QUIRK_SKIP_CID_GEN |
 				NVME_QUIRK_IDENTIFY_CNS },
 	{ PCI_DEVICE_CLASS(PCI_CLASS_STORAGE_EXPR=
ESS, 0xffffff) },
