Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907961;
	b=GE85ecZhhK3BEKW9hlOoQpbryWS4uebkeDEJZdJk4zE9S51tC1cnIib7Q8CLgUa0phMQ
	 2nmePxvkURAjqexc8eLOTEit7VTCy4tNuF6auRu5tWmGImfqT37uR7cAaeZmnqdi1T09D
	 nrBvga1ix69lmtPxe9DZ2abUbugfMfTSOO1LLNeJBSstMYPzEg/58Y3PP6M+s6stCedp5
	 9e5/rRCk0g26oi/omY+TPu3y9j9Po7ep1ero4Z4fWgAkZnoqp/OKDQeeB0f+QYe141pTD
	 qxd02zTM0P2yR+X015H/7ve3iHCRvlnYO2zImPxkPOFtGV9AMjiZUvVNPoLbjv5E6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907961;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Z5C4RujqYa7rNsHZWdwamxL4wXW4pZCK+kg2c9d4mPM=;
	b=pD1fxtQKwa1lkDWGMrst7G/FNcwzI2suuqkZ+bpab5RZUnUSvVlrDUgLeyjKpoeOLyBe
	 +oFlMnc5ej/+CKdBD1LMQhYqAo6j0gxSeB1dUkuzlmImC9zK7BR3FDIPdOVBjDsE7q+sQ
	 X7+NQuackblR2U3aSvPBor/L6P6wX8md/e08Tg1TJrXj5dw8bFPu4XyNanc5cSL8O6KoR
	 pZhHDoCvM8OKSgcdhIj7fxg9nSf24pj5Nl8sZeTxOcFE/hOWXHrYHENrcV4NiF6PKkkh8
	 +hFHszMG1uigqEfNNcQEHfQn9VBOGINp23SyMBMDNl1XAO+ch+Qa5ikd6vRipD3Jamg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=znQ1nDnI;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63241606A8AD;
	Tue, 17 Nov 2026 09:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63241606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=znQ1nDnI
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Z5C4RujqYa7rNsHZWdwamxL4wXW4pZCK+kg2c9d4mPM=;
	b=znQ1nDnIdWf9SGMir8UIlbfd1jTstZak29Z+HUh5ZxqFySQz6O3w3Y7VekesEJPsZMNdlghDe
	m1KpNMMAyhtae1KajqunOWgzPIUE0wWxVYiqiLrWJsGOR6MIv3edgRAo4y282N0y/YW9cIDyZ67
	yfhV+AfzdiC5S+12IgP7kAg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jTKJM1X4Nz1K9Xr;
	Tue, 17 Nov 2026 17:32:19 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D4A24055B;
	Tue, 17 Nov 2026 17:32:32 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 17:32:31 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>
CC: <graf@amazon.com>, <leitao@debian.org>, <corbet@lwn.net>,
	<rdunlap@infradead.org>, <linux-mm@kvack.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH 2/2] docs: kho: describe the in/blobs debugfs file
Date: Tue, 17 Nov 2026 17:29:51 +0800
Message-ID: <20261117092951.4017931-3-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117092951.4017931-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo200009.china.huawei.com (7.202.195.26)

The incoming sub-blob raw nodes under kho/in/sub_fdts no longer exist:
the sub-blob pages are owned by their consumers and may already be freed
by the time the debugfs view is created, so exposing them was unsafe.
Document the in/blobs metadata file that replaces them.

Signed-off-by: Long Wei <longwei27@huawei.com>
---
 Documentation/admin-guide/mm/kho.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..602c8ce90e9a 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -118,6 +118,6 @@ stabilized.
     device tree. This file may disappear when all consumers of
     it finished to interpret their metadata.

-``/sys/kernel/debug/kho/in/sub_fdts/``
-    Similar to ``kho/out/sub_fdts/``, but contains sub blobs
-    of KHO producers passed from the old kernel.
+``/sys/kernel/debug/kho/in/blobs``
+    Metadata for the sub-blobs referenced by the incoming FDT. Each line
+    contains the name, physical address and size of a sub-blob.
--
2.43.0
