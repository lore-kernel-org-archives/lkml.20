Received: from out198-29.us.a.mail.aliyun.com (out198-29.us.a.mail.aliyun.com [47.90.198.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7448F84B;
	Fri,  9 Oct 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536834; cv=none; b=r4o5v1PSK9rk+QsBVttPFfisCdw13SwTO3jD27/vngU1j/coz84NMyYwqLmLd2V+5QFWilnEEpmbG6lz/H01tFR/+i6wlwMAVL4he7CRdh43cvaw0eusAdP9KtLRogRAewRzUDnAxOrLESYgLZ7yMIrDIISKOmDmCSKQ1MKijWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536834; c=relaxed/simple;
	bh=HR7oYhW91ZwnoYD8zmXknGJwkQKZmCDelZbGRX2zOck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWOwgqKUnQYgYt4PQACopuMfpbNzMOsiS/3xI4A0B2yXxOAsdPHE4vGW5gckX0LWeG/+mjZPz9IuXIMFhuhhXmFf6MmAaEaVPQoUaedhD03HaHfvE04Ni70LsjnF/mUBexv2t/PzUgVnXbpqtCWeTClyvAo0ggpqfdIDFHDblmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2099036|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0220033-0.181048-0.796949;FP=3290717549377439377|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037031241;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKwDe_1791536489;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKwDe_1791536489 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:30 +0800
From: Lin Wang <wanglin@open-hieco.net>
To: Borislav Petkov <bp@alien8.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Pu Wen <puwen@hygon.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/7] RAS/AMD/ATL: Match AMD CPUs only
Date: Fri,  9 Oct 2026 17:01:08 +0800
Message-ID: <20261009090111.151878-5-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009090111.151878-1-wanglin@open-hieco.net>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
relies on the AMD northbridge cache for its node count and F4 devices.
The cache uses fixed PCI slots that do not represent the Hygon topology.

The cache is therefore discarded before ATL can register its decoder,
so excluding Hygon from these feature matches does not disable a
working address translation path.

Qualify both feature matches with the AMD vendor. Hygon address
translation will use the Hygon node interfaces in a separate series.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 drivers/ras/amd/atl/core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index d77dacdd4f56..fe84fc52c657 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -176,18 +176,17 @@ static void check_for_legacy_df_access(void)
 }
 
 /*
- * This library provides functionality for AMD-based systems with a Data Fabric.
+ * This library provides functionality for AMD systems with a Data Fabric.
  * The set of systems with a Data Fabric is equivalent to the set of Zen-based systems
  * and the set of systems with the Scalable MCA feature at this time. However, these
  * are technically independent things.
  *
  * It's possible to match on the PCI IDs of the Data Fabric devices, but this will be
- * an ever expanding list. Instead, match on the SMCA and Zen features to cover all
- * relevant systems.
+ * an ever expanding list. Instead, match AMD CPUs with the SMCA and Zen features.
  */
 static const struct x86_cpu_id amd_atl_cpuids[] = {
-	X86_MATCH_FEATURE(X86_FEATURE_SMCA, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
+	X86_MATCH_VENDOR_FEATURE(AMD, X86_FEATURE_SMCA, NULL),
+	X86_MATCH_VENDOR_FEATURE(AMD, X86_FEATURE_ZEN, NULL),
 	{ }
 };
 
-- 
2.43.0

