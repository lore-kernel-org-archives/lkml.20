Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252019;
	b=eIpY3YFCoFommk93bnKoY2++k5/nt2Llh2mdYcfDLMOdik9aZ+nccCfahMCGeGjsq32A
	 V4y88tiMLliV2R5WPlKRX4QeZTP9D6NDsQeqmpzerED+wgjGtln/puyZGr4eFHM8XBCpo
	 uFpEe51epSWfPYAEFxLIs5oe416azs4UIK6p4gTyfvGZjALzSl8TW8gIzLm+uNFmtVAZC
	 PGMieeDxpWdvbI1CSWygOJSwE1Ux+A+XhbyeuVq4teQVRBxjcST+YbMFQa8U8I1EvdqL4
	 SXqsGNxHx8RjTMTgS1/8UdiOoNGc/OWz10QB/jFyv1IxZI9PtEoO5P4JBcB1+IoxnuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252019;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5bscZzYbNdNozNQz2i6rpQrEehAPtJuDNBdUBH2QEig=;
	b=igVMExTju/KXfAfrHgbVvxCzqHxk0z1vzd1SZ10RThsXgtLU5bv9UaMkbwoE5+O0Rk2q
	 eBjqyM9aOgJI/XDT+LmZmV2kbdsNsRZ0uPELq1YBhzsBhMhpGVTU9RIkgHEksYzgLJayS
	 EclObE319K4trpwHqycp/z2mU4Q/dd0Jct1pYKQbd+M/Gx9SlLgiroiNQloRV3gnPDMa7
	 OUVlL3paEulH7Qdy4I6A3GAOIuhqTYJ9NYfo+3DGqZUS27Tetc6C97lfzUN9BtkueyXiJ
	 rTvGQztSlyrDAqphlTVTdt8BZ/D9iAN1AKvc6oceK15dmpMC/+rxUe5MrcBGvY2D+Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.98
Received: from out28-98.mail.aliyun.com (out28-98.mail.aliyun.com [115.124.28.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08BC606A329;
	Thu, 29 Oct 2026 05:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08BC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1971605|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0220033-0.181048-0.796949;FP=3290717545082472085|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2Zbv._1793252007;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2Zbv._1793252007 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 13:33:27 +0800
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
Subject: [PATCH v9 4/7] RAS/AMD/ATL: Match AMD CPUs only
Date: Thu, 29 Oct 2026 13:33:10 +0800
Message-ID: <20261029053313.46323-5-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029053313.46323-1-wanglin@open-hieco.net>
References: <20261029053313.46323-1-wanglin@open-hieco.net>
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

ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
relies on the AMD northbridge cache for its node count and F4 devices.
The cache uses fixed PCI slots that do not represent the Hygon topology.

The cache is therefore discarded before ATL can register its decoder,
so excluding Hygon from these feature matches does not disable a
working address translation path.

Qualify both feature matches with the AMD vendor. Hygon address
translation will use the Hygon node interfaces in a separate series.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
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

