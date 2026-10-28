Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172451;
	b=v/9S/t8GSitXbjkYf4D9uruIQf5OKy5RxPYFMxl3wOIIVH2mj1asHNTkqeNpN6BqugXf
	 1Zp7odV2qk79AWbZEPe/HP0UY07pR3pLUiIkKQflXZ/Rnv67h8wVszqssq2aQvO5Ct7SL
	 YX48+5IxxJoIU9K4I5hi9bxNX2PmZy9hIjadXcfZW7uQCrrh2/2U44qdf1P5OaXqqQ0cU
	 keaF/JwQrTepIEmDa44rIL66RuGpR8k5TRLaMI7qSqPEyAUPLFt6VjeuNOZbkjCHBs5Yl
	 J9jxygemS8E/rXbnLklgCi3F/lQvfcogmBwBwYFKtzqyQhAtIS23ZthdfFEB3dX+qFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+F1i+V9tSX+9YZunHCuTfVrejTHofyibW7KyovteA8=;
	b=AogivdECBJYKe08FlyxnZDXzSGUj1PD1cTerB3DUVE/ZxZXtJZTPKxLvSVjrj2z1L7xe
	 401eFUVlX6T+UeSHAvkQ5USzN5xorR5MpX0F9/Iqj/s3sBPLeQ+BtaxAyfQuNptSnkWTn
	 gIHGOE8HmDoxuaYP1wNrtG/immoh86uqOAHtX5JyegoSm/ZNQcTRz2JqeaR9fSVsbl67+
	 31HPcbTqqFkDu5PP0jK3D/++H06G2qI9IexaCy/sfQ6NgcB+d3ob9s3Q0VxYBQ/O1BNhp
	 ZJRv38PQLdrmdSQdGThhshcbZNpo2kSK48l9qi84QSFvYaPUXym3uH0pmVaK1nZ0Ofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8DItM0y;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A89606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8DItM0y
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10630355e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172449; x=1793777249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+F1i+V9tSX+9YZunHCuTfVrejTHofyibW7KyovteA8=;
        b=J8DItM0y2qJx2snW7H202c1YCSEx5X+ubw0T9fz4FhNmif7sscH9Ljbu7BBtiHo1bL
         q5u6GQTAMkzEoZnee4IjwxF0NjAF30IXgAwIgwqpmQPiYvoMk2QM8FDx/Ls0BUiuU1br
         zUnxa7OdNIHQS6yJoS1vO7T4A+CWZ950kmV72+MH7b6rcj3FTcf4DPNQiGyV9bUeas1U
         UxGXq5jGe/flbGNMMUTrd3BX6/3eZrutJWykAYGc+JCfy7u8mHLiUcG36Qt73j+8sGXP
         IBCyOmBP4Cg8hjD0T4/fbW6sBKpuqha1Es3lURB/ug+6u/pxBSTu09QJ1DkhE3ddQ7Qt
         M9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172449; x=1793777249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+F1i+V9tSX+9YZunHCuTfVrejTHofyibW7KyovteA8=;
        b=B4un32Yw8rJy1+UX1cITFEm2fytOTCpViDSPlGLpxayvs6IPHBD1z5RGK9RQZ+ckaH
         QAuHEfgK+GwkIfR7M1J3eQfm2cZM2SIbnqNrc8Ec4IndEDti2I5qJW0DesEF3wXzIwmX
         8jxVIokicZxBJvs50jNnG8cmtNxBZE92GSKYrzxjy3VtYcU5PdVE3rzSb1U507NHDTM1
         ay/MUqPNzJV5zUzvN8AK+j4UT3qYM55eg/4KjY37pWGKIeBiwI6Qm6xkVRz4VSWe+22W
         HifLl3/XinfBecwEyNSN9r8gnmmy/TCKViohXIOsvqBsUhNE6TT2HMieX5vR2rGHN93Q
         lfVA==
X-Forwarded-Encrypted: i=1; AKwUvBzOQ16hWwPBevOjQ3OYL0mz6Gxtb5RaBL6Cxz2a7YeQOnzlVCu4Jz1oxZOUdOmRLM1h2buSbodnXGt4zTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw+c7bwKvMeqi7RJON3kKD0bR55O9lGksqts6yLa2a7dc74IVY
	N2ziX3IuvymdlMwT0X9xkJwESo0lE3yx44OtUWfpQgu8FGbltTxUlyuj1Bd9G4r5
X-Gm-Gg: AYBFou1873bAO0DTRIas4gW5ZkeQGZu/bWkTfFDS+NY+uaYyvVJdTOg/CTdmIgcbdCl
	RkHtHdnyjv/S9Uqap5Co8neI4C/MQKpv5fRto7r+O4E13XP5duI/EwHKS8npwF6Od9znpUja+2u
	wTWgp5Yef8c2Cxf+6ekjbtSY4k6Wk8ZfpG1D6Qi2yYNmtgEzbDUgiQinWosXcZCclvkv3Go4Kfo
	meea1sWJnXjvWI1RkqEQpsJUMnybnkwpGSqZ4gYnpDafovDdhW4+MG/jywebrfxU2K8ut9iXYwv
	tF6Tu9CtuiB0uTCfq/ivK/oWW1hPLEQEqxtp0wNDoXfqfq84FQLMDRvcC6Y6sURI/XXk/fEmIqS
	fLCVXQoJPb53CJn0rJIWP0fjYMX8HMstNFTfIBc33SMGUa2BFgJ/3NJCrkSV/QxaLFewRGdn/tB
	a+nSElqWFTKDFC9/e52hcLLpztBG9l5odVGiq7wK3WWIBA0rrEuuo1f5oILvWxWnV+IhKevgFiM
	PyqCV10d0jbHbXPjJOZT2a+7XVcSI1bF4ioinakjASElXrZexrfCo4K5QTI8JGrxNpPj3rGgZTO
	GCxwYK/RHJ3hdU838ZuK5HUP2Ur1tzNVL/I=
X-Received: by 2002:a05:600c:4f84:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4a992fea9bcmr19065985e9.0.1793172448967;
        Wed, 28 Oct 2026 00:27:28 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:80cd:d127:b224:9e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm25667725e9.1.2026.10.28.00.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:27:28 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yaxing Guo <guoyaxing@bosc.ac.cn>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] uio: uio_pci_generic_sva: reject multiple opens
Date: Wed, 28 Oct 2026 09:27:26 +0200
Message-ID: <20261028072725.623111-2-thnkslprpt@gmail.com>
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

uio_pci_sva_open() stores an SVA binding handle in device-wide state.
A second open from another address space overwrites that handle. Closing
the two descriptors then unbinds the second handle twice and leaves the
first binding active.

Reject another open while a binding is active and clear the handle on
release. UIO core already serializes the callbacks under info_lock.

Fixes: 3397c3cd859a ("uio: Add SVA support for PCI devices via uio_pci_generic_sva.c")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/uio/uio_pci_generic_sva.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/uio/uio_pci_generic_sva.c b/drivers/uio/uio_pci_generic_sva.c
index d05ef77f7e322..fedf54e82f270 100644
--- a/drivers/uio/uio_pci_generic_sva.c
+++ b/drivers/uio/uio_pci_generic_sva.c
@@ -32,6 +32,9 @@ static int uio_pci_sva_open(struct uio_info *info, struct inode *inode)
 	if (!udev || !udev->pdev)
 		return -ENODEV;
 
+	if (udev->sva_handle)
+		return -EBUSY;
+
 	domain = iommu_get_domain_for_dev(&udev->pdev->dev);
 	if (domain)
 		iommu_detach_device(domain, &udev->pdev->dev);
@@ -55,6 +58,7 @@ static int uio_pci_sva_release(struct uio_info *info, struct inode *inode)
 		return -ENODEV;
 
 	iommu_sva_unbind_device(udev->sva_handle);
+	udev->sva_handle = NULL;
 
 	return 0;
 }

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

