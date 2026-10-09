Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53E366DD3;
	Fri,  9 Oct 2026 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536501; cv=none; b=O+zup89M6ujujTeO+54DEcDGfwDjqNQjFYhr8JhpT3JNlnREfQPoBBahNkHKnpNgkn61D6xRmVxteITUKMeLw5WZcOaM28wJFuBtP5STIk/1u7lUJfV7cGUNHiabduq1tCsUQdWhMb+hEOGBLw87eWYvINS+O73Dq8AfF4O76fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536501; c=relaxed/simple;
	bh=sTJQttWIt5QNV913jz2FjMxnjyeQG89dqlE13rgovFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6/sVfwbBZp7pYsSMeQHpREnvV+xP09dFXg7V0L6PodoW/mOn0U8c6FnSZJYlk5xrmUxpN4sC8CYpvNShTteDYSUvd2arzfF9vWzHP3jVeZYXbaeH4NYyPArcYQ9JnduAQW7Uv5ecxLfq87Jz+KnsIgXZkNs3lGlSmwiN/p1IqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2229122|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0154444-0.0477482-0.936807;FP=3168411775932122835|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037022039;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKwCl_1791536488;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKwCl_1791536488 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:29 +0800
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
Subject: [PATCH v7 3/7] EDAC/amd64: Stop matching Hygon CPUs
Date: Fri,  9 Oct 2026 17:01:07 +0800
Message-ID: <20261009090111.151878-4-wanglin@open-hieco.net>
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

amd64_edac gets its node count and DF devices from the AMD northbridge
cache. Since commit 49b96fc0dddc ("x86/amd_nb: Simplify function 3
search"), the cache finds function 3 only at the fixed PCI slots
0x18 + N. Hygon DF devices are not at those slots, so the cache is
discarded on Hygon and amd64_edac_init() returns -ENODEV at its
amd_nb_num() check.

Remove the Hygon match and the empty Family 0x18 case. MCE decoding
in mce_amd.c is separate and unchanged. Hygon memory controller support
will use the Hygon node interfaces in a separate series.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 drivers/edac/amd64_edac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..9e35098d3dd2 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3840,9 +3840,6 @@ static int per_family_init(struct amd64_pvt *pvt)
 		}
 		break;
 
-	case 0x18:
-		break;
-
 	case 0x19:
 		switch (pvt->model) {
 		case 0x00 ... 0x0f:
@@ -4120,7 +4117,6 @@ static const struct x86_cpu_id amd64_cpuids[] = {
 	X86_MATCH_VENDOR_FAM(AMD,	0x15, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x16, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x17, NULL),
-	X86_MATCH_VENDOR_FAM(HYGON,	0x18, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x19, NULL),
 	X86_MATCH_VENDOR_FAM(AMD,	0x1A, NULL),
 	{ }
-- 
2.43.0

