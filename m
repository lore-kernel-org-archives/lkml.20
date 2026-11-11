Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437070;
	b=XXdDVj+L8364agiL6S0wXtMbfruAqFV/GVL+ppHjyFynRLAa1xoLzTU2FfhG0Y4t2FZa
	 IIxtD+0m+z3qdE6lrhUE5DGN5VVHPT3Iv9g5eGLH3BdXI1EpmLA/2R9eyFWZEE/ZCLD2S
	 s/qza4oH/Eumb1mkoNKq8Jl6RsofmAvqI1Ndni1xGJot9GvlNzleSFq9wJ6BbaR7qrxcl
	 +t64WIcv8YyjVbvk6Lt0TiBqGPT+EAK6RfGVGm4dXFu/MAP3WcJwM6scSn4KR9HSltsbj
	 oOV3bvL6ZopdIsN2JkRigFexTa5NhihdZ1uQlzpb3Y/kgNQe1eF2pE+mq7+eHE7k1fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437070;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=aL95O/KrFGfX5P7Wmpp+ymDSMP4S0hQeUmkP45f5y3w=;
	b=BYsde42L5ltSFm3d9HmUAx0DIPKv6eCwFb/EGfTaeIrqUq6G/9N5w2Di10DFFeTohPXL
	 UlCJPaqwt/MeXve3WkTUAT0E9nkuv6ycks3r+OVk39MmUL2rPaiBAVGYOPeFOax0jyfDI
	 fXr2gj9PjrGNQDmEGL3rMlbz/Cr9yM+MN3afhFOzhkWNIQvHxSaOHHCkKS+B8woS2MI2a
	 a1WQvatXBrVA8RUO0qPNAm0B/YJLQ21BhEz7LaSAgP/BpTMZisKFUPfN7wZXPGQBxlVKo
	 npNpEnQ3i7SN4P+9ri8YKM14eIi6sXrmMLyQ343cpejt8cMyijq3V9rUuVyJqkvHR1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=BI5epHKo;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66D606B76C;
	Wed, 11 Nov 2026 22:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF66D606B76C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=BI5epHKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794437069; x=1825973069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aL95O/KrFGfX5P7Wmpp+ymDSMP4S0hQeUmkP45f5y3w=;
  b=BI5epHKofPuE2UCRuF/kU3Ni0vk93Sgy9JxqgW6mdvZLan6+LiUEhYVN
   aKIqF5mzPI2Fq46zl+ipE8WYHNvETvHVPeuybV6BFNZj06dvjKeiYL7IH
   SuZ9ZbDzaihJKxNafZAJe/0/bE5xsOitRMEUUzagD7ZJpm66e3UxaLCr5
   BiD9mkwxFKxva2P4HQNJz6zVbsfkd1XROA9xpnvxD6Efj1MR98Ma/fpVt
   orSgiAFWvmuK+3KxMvSjypeasi9HzJFpQ2i/vhddutEPGdE7adSdIbqrl
   NGaCU++mRDpzrZ+t/lYT6a370xep0HW+5Ry2/TQkHSPYwu3D2JyFaJyg7
   g==;
X-CSE-ConnectionGUID: YGKc73C4Rsa109b4DM6ECw==
X-CSE-MsgGUID: DIRDwauPQv2mGrNVS5kO+Q==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33532245"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 22:44:29 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:11088]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id ba4d0162-2166-489c-a567-38c3c8580d0f; Wed, 11 Nov 2026 22:44:29 +0000 (UTC)
X-Farcaster-Flow-ID: ba4d0162-2166-489c-a567-38c3c8580d0f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 22:44:28 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 22:44:26 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, <linux-doc@vger.kernel.org>, <iommu@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	<nh-open-source@amazon.com>, <linux-mm@kvack.org>, Jonathan Corbet
	<corbet@lwn.net>
Subject: [PATCH 13/40] nitro_enclaves: Log a reached device limit at info level
Date: Wed, 11 Nov 2026 22:41:58 +0000
Message-ID: <90154e80552bea7b9c92aad1c44af3ace60588a2.1794393490.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300002.git.graf@amazon.com>
References: <cover.1794300002.git.graf@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When a parent asks for more enclave slots than the device has room for,
or for more enclaves than its quota allows, the device answers -ENOSPC
or NE_ERR_TOO_MANY_ENCLAVES and the driver logs an error for each
refused command, although user space gets the code back. Log the two at
info level.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_pci_dev.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index 2d44cae4ac0cf..f258e04ee9e47 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -261,8 +261,18 @@ int ne_do_request(struct pci_dev *pdev, enum ne_pci_dev_cmd_type cmd_type,
 	if (cmd_reply->rc < 0) {
 		rc = cmd_reply->rc;
 
-		dev_err_ratelimited(&pdev->dev, "Error in cmd process logic, cmd type=%u [rc=%d]\n",
-				    cmd_type, rc);
+		if (rc == -ENOSPC) {
+			dev_info_ratelimited(&pdev->dev,
+					     "No room for cmd type=%u [rc=%d]\n",
+					     cmd_type, rc);
+		} else if (rc == -NE_ERR_TOO_MANY_ENCLAVES) {
+			dev_info_ratelimited(&pdev->dev,
+					     "Enclave quota reached for cmd type=%u [rc=%d]\n",
+					     cmd_type, rc);
+		} else {
+			dev_err_ratelimited(&pdev->dev, "Error in cmd process logic, cmd type=%u [rc=%d]\n",
+					    cmd_type, rc);
+		}
 
 		goto unlock_mutex;
 	}
-- 
2.47.1

