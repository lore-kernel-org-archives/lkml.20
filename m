Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513437;
	b=PQk6kIiskxhGggnmW8zErebOF1Bq2o6VaE0JrZpLPn4S9HKkcVuG4gjRwqQU3y1Gzbro
	 WEuQf+PCNl0O5axUm4ZeVQOc1e9NUjwCy4KuwdaZ1pdKz/z7I9toYtOSJTQ8QSXta0HAD
	 GRYrKfzrvJViHb/667c9HcU14yUW6MXKwK5CCxcn6ZDb1yMX7IiO/ykKjn2F4wxqKlQa5
	 gciwRXzfk8X1sIdgLdLrYEDf41Lykcl/qBvAe54AWHJviFaMr+xd+2Dq6g2tvAF3YwQkQ
	 ZzeKFYwF6aU03iju8Ew5tXjFrvUVvx1D6yE1BpLvFNUPzuhBIRCXFVCE9HNEAf+GwBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CzDxUF6io59AUzkKBaAU66gKnCGGQN9HKIMVkGQr1fQ=;
	b=asODGDTyAYPauLneYVagWU+5GDrYoGMOE/Jq9fxi0P4DaUfPmqIOepjN3LXV6gMRc6Ba
	 j58fBdrabRGdD2AVpbeyRr/pPOm3SSpK2yABshTsmdZoPrG7Pep35CS80oqvuWX7vLtGu
	 L3rAwr1m17buEGaUM0UlLbqn2E85ueqwIQHVvfg2xgUP0v+bXDmxHwA40AUditJMVP2cw
	 btWdbCcITNRNTe/2DoEn4VndHxMy2Cx53aQsoIIllqHuFHAh7/0Vq/vBGqBCL92/WttWt
	 BFXXHE8zkKJtvdA4FrGAlK/3PA0mdR/LqSUK2yaQzej4sSpdodVB3CKJY+R3/HSMNIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuqN8AiL;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BA606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538BA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vuqN8AiL
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-536c8f958d7so790301cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513435; x=1795118235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzDxUF6io59AUzkKBaAU66gKnCGGQN9HKIMVkGQr1fQ=;
        b=vuqN8AiLpAawFUwEbsflV39EWisNA7pPWcQPclrwWh/dzQgpYKnMgG7+Mh9504+EPp
         91Ld3TSaarfjoNBWrJvJcFIq7fhFbuHkRgG7QWlbrZ+DNsoAg11KnqygrP8xPHO5axIy
         w5BN20XTw0j3LA75J2jEtV2Q7GDCQgaQMp1hQevrWCDcbHpjLlN9umNXv+VbNsnCcnrK
         /l54kA9c145dl8URjgScHlFuVO4450jaL4ZK7q/KBtbTLDLoIUz1fGIhMJP9TBqDMCTC
         kLN+VAimubs6M5FHI4r+RNv+fFFUi750h5rJ4FyBE7CKyIWejDn4iXmM5T1/Ka80olCx
         5N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513435; x=1795118235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzDxUF6io59AUzkKBaAU66gKnCGGQN9HKIMVkGQr1fQ=;
        b=hv7l8E9A8Y1/sJ+j00zpU7jfXUA8+x7y5BPh4wk/iMMjUsyL6Y7biYMDEjplKmIq7L
         Gy45/jEzFQP1IXa16t4apq2OTUn9WZh1xF6VqRJs/JNtMLnMKIhURxGNLHPdLeJtQKC1
         +xbW9d2tEp79bv4yQ6mIhy//yRKKPlFNNIR6I/qCMQ4FP2fb5V9y8seSl+3ubL57pNft
         C0/tzYK3Z9Ga/p0Kxi1LSmzR7QHojENNCEsNItqHLBDm2Dusl/TLeU5MaRAAVS0txpRY
         fONVpcUuTr0BsWg/5DBdv/ra55SAKEMMqpQM0wDlCZkee5WXXkaPyQNcTATsoXis1M6G
         VlpQ==
X-Forwarded-Encrypted: i=1; AL+hErH5n2lxmvmHVSG/SdxQBZJsKnYehB69ImqrgfWpMzHN1oYTDPWtDIMmoVSmOFPih0nKtdNCZCDpESp83CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9FtUmDBTgt0Pok2gWXILILozMqdz3mQ56ctGYtENubIE+Nnnn
	TfN2RJq9lUdHWeZj9Soh6UbMHz2ut6/92Fs0gjvo2m/rQuQZ/vkjcLu6
X-Gm-Gg: AYBFou21DGa45yZmtGjbo8zo9sKJ5HwlAFi7yqz9ed9lvCtf0Rx55+TPhze0VfBN77h
	yE2yuPWAIMWCqb/h5GdyKba8M3XeDzyBsV5cfbdMrqrSs7Bzm0gEeBV8SD7BZ4XbcfdqqzGTs1m
	xhkq3H9rTdbEWZJd5enVZ9OvqS+AzbzeroGG+jLwI8loImXlL5wxoCu5UZvN+w9qSnn4OooVM1i
	+1iV6MCpdZcOf+gWaPDh1Vdl0N3BXWMWuxXBUowXK6yvcLdAj9xMFkPjvK+uQA9FR1H1d9qgZJW
	4pbM3w4DL/M/yvclAe2Qbr28mXVdJtt7LLeC9S/jvu8kohS3QsONECf94cAruflxljGQIy9gW1Z
	p/zbEoNKLqiPywC2U0639O4mEmsBsJWvGNfd+Xcs/jeTF5SLsBmsz2Dlg4JllhtVDs8ZX8p8Eid
	Z9/Rve7eiSJieBWvO4cWvSc6/avWwigPti1HVFuNQzCzsWcxNsNKv6+Drxav5Nc6aB5bFsyS01O
	w+jziyKk7xaUk6J+VLJdu6aoQSVksMcuHHpOXUi7HKuvcmPzY2UhlamysC/w8Yt3YBVgUQLn8ub
	ZDL+m2vcJ1gmg6UJMVDyPh1aX+IvMXFvdLzv+Is2rxNcL7lv59H/
X-Received: by 2002:a05:622a:8586:b0:55a:e65b:d959 with SMTP id d75a77b69052e-55ae65be1eamr2000351cf.8.1794513435248;
        Thu, 12 Nov 2026 11:57:15 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad034918fsm2504851cf.4.2026.11.12.11.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:57:14 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2 0/2] iommu/hyperv: Don't free a paging domain the hypervisor did not delete
Date: Thu, 12 Nov 2026 14:56:58 -0500
Message-ID: <20261112195710.1417744-4-oss.patchbox@gmail.com>
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

The Hyper-V IOMMU driver frees a paging domain's page tables even when
HVCALL_DELETE_DEVICE_DOMAIN fails and the hypervisor still has the
domain. Patch 1 fixes this when a domain is freed, and patch 2 when the
allocation of a new domain fails after the domain has been created.

Changes since v1:
- Patch 1: WARN when HVCALL_DELETE_DEVICE_DOMAIN fails (Jason). Kept
  the Reviewed-by tags from Easwar and Jason. Rebased on current
  mainline (067c5c24cef2).
- Patch 2: new. Handle the same failure in the error path of
  hv_iommu_domain_alloc_paging() (Jacob).

Both are compile-tested only (x86_64 with HYPERV and HYPERV_PVIOMMU,
W=1). I have no Hyper-V guest with the para-virtualized IOMMU to test
them on.

v1: https://lore.kernel.org/all/20261105192738.70664-2-oss.patchbox@gmail.com/

Yuho Choi (2):
  iommu/hyperv: Don't free a paging domain the hypervisor did not delete
  iommu/hyperv: Keep a new domain's page tables if it cannot be deleted

 drivers/iommu/hyperv/hv-iommu-guest.c | 29 +++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.43.0

