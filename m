Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8013932D8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262993; cv=none; b=X94u2v8R/Rw+mTsELFLIhAS2/hMJItncudhWQPo5qB44x1WFQ05cDVQ9lNXz2VO4fVHJ9ZR0BRKgH0UIWb+Ue91jDHB+Q6qWip2bC0Nchb7ST9P0/fBAoVUDbSm3zSvaq80XVDTIRGpZRkU5LnGpMHMgZ6kgdNl/Y3t9wZrCWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262993; c=relaxed/simple;
	bh=5eoyvslfnxqxbwYqlTvHf7eoQNhUiNS/SbnR4fzmIcs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EtjTIXbM9gk7wdMIJ8dR9Pj+3RbYD55eIwlnADyLnZxuWUUEXgNhJhACWuY/4CFKkXV6Z8S+9ppnzXCZo1ki/noO54akXioDLtH98U7xvxCek6SXqz8jqKxjy6e8MlgVQBdhrok2ZvXJtETV0kMuoW3huQ0wvkTrI7o1byVGdd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=m8pSK39w; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="m8pSK39w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1788262991; x=1819798991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fEcWww8t1s5P/U7RQSCmQlEbJOMJt5okCIB/O0lK1Mc=;
  b=m8pSK39wCZZr1aMmzq+gJchV0/fHHkkKUq3qasVLkAgFCLYm7uI2fZwW
   n7eQ25MOE+HontF6+HH9dLW1sgfDpgLTocf6D7xn0IQy6FGELys2RwuYd
   boa+JzI9KDm0KYzX0R256sz98p2btv7RBfY9Dd3eIjt5gauyNHXiNUCgt
   HbK1yVKxz8qU4X4QdSiJ6Pl2RqxxBiRi5OgWHykQab+0Mydp2hUxxE2rE
   BHEv8W639gtHiuCTQGHGDXfEViKkN2DNPelEaHUDeU+wZR+vgISKqQzGg
   lKKb2Ymx/FHXe+OFTdzJfnD6BXVQggHsJyywCBYv4mTdgbGLWD0uTEcqB
   g==;
X-CSE-ConnectionGUID: KFeihC6gSNySdkDPYTAV8w==
X-CSE-MsgGUID: gHFKzzt7TOuErInC8jWP0w==
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="27501923"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 11:43:09 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:23036]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.7:2525] with esmtp (Farcaster)
 id c7725a87-f6b0-4a9a-a5d9-1061a9768ced; Tue, 1 Sep 2026 11:43:09 +0000 (UTC)
X-Farcaster-Flow-ID: c7725a87-f6b0-4a9a-a5d9-1061a9768ced
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Tue, 1 Sep 2026 11:43:08 +0000
Received: from dev-dsk-fparola-1b-85ea2014.eu-west-1.amazon.com
 (10.13.236.104) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Tue, 1 Sep 2026
 11:43:06 +0000
From: Federico Parola <fparola@amazon.de>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Dan Williams <djbw@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <nh-open-source@amazon.com>
Subject: [PATCH] x86/header: Use __DECLARE_FLEX_ARRAY() for struct setup_data flex array
Date: Tue, 1 Sep 2026 11:42:39 +0000
Message-ID: <20260901114246.71579-1-fparola@amazon.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D037UWB003.ant.amazon.com (10.13.138.115) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

After the `data` member of struct setup_data was switched to a flex
array by commit 94dfc73e7cf4 ("treewide: uapi: Replace zero-length
arrays with flexible-array members"), the struct can no longer be used
as a header in a larger struct in C++, with errors like:
 flexible array member ‘setup_data::data’ not at end of ‘struct ...’
This breaks compilation of our userspace code which imports the header
in a C++ project.

Similar to commit 2619da73bb2f ("KVM: x86: Use __DECLARE_FLEX_ARRAY()
for UAPI structures with VLAs"), declare the member with
__DECLARE_FLEX_ARRAY(), which uses [0] for C++ compilation.

Fixes: 94dfc73e7cf4 ("treewide: uapi: Replace zero-length arrays with flexible-array members")
Signed-off-by: Federico Parola <fparola@amazon.de>
---
 arch/x86/include/uapi/asm/setup_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
index 2671c4e1b3a0b..afe1e3a2a6564 100644
--- a/arch/x86/include/uapi/asm/setup_data.h
+++ b/arch/x86/include/uapi/asm/setup_data.h
@@ -28,7 +28,7 @@ struct setup_data {
 	__u64 next;
 	__u32 type;
 	__u32 len;
-	__u8 data[];
+	__DECLARE_FLEX_ARRAY(__u8, data);
 };
 
 /* extensible setup indirect data node */
-- 
2.47.3

