Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E425B0B6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695982; cv=none; b=W8mAmBtcF2E+jduKQcWs3tZHFZo/2aCQbm3dxr33Be9u1n9CVbkYDevqtD5p0ExNBw7fTwB8PVdTgCkY8eiWLRc/oh3235gJ7C7tJ6RcRL9uTchmh6IQNYZEdUoqItY61sXYXJZ0xZ17WMlvcgdqJ7fVhttiw9aIyK3Hx53N2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695982; c=relaxed/simple;
	bh=jjjHMPkdak8lkkYB/pcSbYZxNq0AkW3cx++JKabbUsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsWT0plXLLnyfwb+1UBNTCEthIpPJ6ldjejnz7ND0IUjFciAat43Gyikic/3mrT1oEnwP0jnfJTAy9n2b0ONVnhujKLoJ0Zg7JsQjy4JvGsswIZuyZve95AalTaD713e6Vx8NmAtUp+pCglYGzo6rubGn1JYvlIMyzGeIBYcaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=giky4IUj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="giky4IUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789695974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTPhd0YOiSXsclxv5AA53kAUpU9ZSjRHrVegM1KWz8s=;
	b=giky4IUjpcx5+tJIQ+ix45hGJjZHs0drEJOmGnR+T/7qz+AThbUerL9VdEuSIoxf+P/8p7
	5SKvsUl7FgiCEj1t5w6t0xZ08aE1GDHqFSPfd155CgARAVDgHNFYUetv6tPKSBhUjN8aFe
	SGjRF1gBNC4skRgVmDrhINuM9WsYQLk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-XOMUUELPMGauq2xvyS_sjA-1; Thu,
 17 Sep 2026 21:46:10 -0400
X-MC-Unique: XOMUUELPMGauq2xvyS_sjA-1
X-Mimecast-MFC-AGG-ID: XOMUUELPMGauq2xvyS_sjA_1789695968
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AB401955D52;
	Fri, 18 Sep 2026 01:46:07 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C436B18002B1;
	Fri, 18 Sep 2026 01:46:01 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev
Cc: corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com,
	usama.arif@linux.dev
Subject: [PATCH v8 01/14] docs: tmpfs: remove implementation detail reference
Date: Thu, 17 Sep 2026 21:45:22 -0400
Message-ID: <0228ab0a273ead9829d372ee7c044eb8476cf2b3.1789695931.git.luizcap@redhat.com>
In-Reply-To: <cover.1789695931.git.luizcap@redhat.com>
References: <cover.1789695931.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The tmpfs.rst doc references the has_transparent_hugepage() helper, which
is an implementation detail in the kernel and not relevant for users
wishing to properly configure THP support for tmpfs. Remove it.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 Documentation/filesystems/tmpfs.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/tmpfs.rst b/Documentation/filesystems/tmpfs.rst
index d677e0428c3f..46fc986c3388 100644
--- a/Documentation/filesystems/tmpfs.rst
+++ b/Documentation/filesystems/tmpfs.rst
@@ -109,9 +109,8 @@ noswap  Disables swap. Remounts must respect the original settings.
 ======  ===========================================================
 
 tmpfs also supports Transparent Huge Pages which requires a kernel
-configured with CONFIG_TRANSPARENT_HUGEPAGE and with huge supported for
-your system (has_transparent_hugepage(), which is architecture specific).
-The mount options for this are:
+configured with CONFIG_TRANSPARENT_HUGEPAGE and with huge pages
+supported for your system. The mount options for this are:
 
 ================ ==============================================================
 huge=never       Do not allocate huge pages.  This is the default.
-- 
2.55.0

