Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE255581F3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080146; cv=none; b=P6ORCvWzwX8O4seHecnbCo4hgo3S+qlXqrDHHAuLGI2rY0ghgl71OolaIPqcsqJnQec1+GgNZF2sVwf6Wn3UmSJPKPU0W6bpEZ7aZYtsbOkoRmzjTSiaXwDE4j5MQEup/xBrhFaCj/lIkxdt9tQ3dXQ0YuqEsIOZCNE4tIn029U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080146; c=relaxed/simple;
	bh=NNMjjW8qdgXOU4AYb1jZwZ8a47UPSAZ6V0Z4UX65iYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/RdaNbcMP+P/5QD0kl2Fcj1imrMwSyPyTBaYz2/5WVat7ylN43gwOFJSVEZ8semhu682gXEpxZa8uTQSSXxruzdVlJr0iBG+cXoo+aI8i4VRdWwBvjXnbv4P8mHyUosHkeO1ElD0TPdbnAYUSZx//qvKFjZJ1l9n7aMTDl91Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.home.8bytes.org (p200300f6af404a00bcc634c34b045ea0.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:bcc6:34c3:4b04:5ea0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0ED8A1C7802;
	Thu, 15 Oct 2026 18:02:07 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Joerg Roedel <joerg.roedel@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] MAINTAINER: Make Vasant Hegde AMD IOMMU maintainer
Date: Thu, 15 Oct 2026 18:01:19 +0200
Message-ID: <20261015160119.1005966-1-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Vasant reviews and tests most of the AMD IOMMU patches and is critical
for maintaining the driver. Make him an official maintainer.

Cc: Vasant Hegde <vasant.hegde@amd.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..64052e51c3cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1181,8 +1181,8 @@ F:	drivers/platform/x86/amd/hfi/
 
 AMD IOMMU (AMD-VI)
 M:	Joerg Roedel (AMD) <joro@8bytes.org>
+M:	Vasant Hegde <vasant.hegde@amd.com>
 R:	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
-R:	Vasant Hegde <vasant.hegde@amd.com>
 L:	iommu@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
-- 
2.53.0

