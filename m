Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252017;
	b=mTtTn30XusbLdSPyRMd5CStSEPXvmUigRB3dlYsLQQ0Y4YixmN+MZI2F/zRtP9EOEslh
	 mTaP4DGceNd+HbptpIxw7oP/n1EEZ15NeP9YfQvnDURjgSZbC+9v2+GJQC4tCDTZMJruG
	 1LBbL7ER5vl93XRdWFVvcWc93QFuM3tb7MXeK8Wj23tjDRHIZNekL0raCNRXcHiBCWhDt
	 4Doms4ytQSJhZI8EY398VjeCKBf4AijFOG+BwUMjEbMeHyhM8RQMxjyaAE+lM8aW8da6W
	 WXTMjzKR82vRelq9lnJ/gh9hiZkiE67LvJyI3X3SK03i8zPF6ilR6KxcytTaCnIx1fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252017;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d2K13RWcRE06nwzeDIJTbD96p6W1W8vKVpLl7tYs9Po=;
	b=UoiGvWF8EZ5awoJQdSU2Fy8kyPxiBcPl6Mk6Q5TPfX6j5uRNUcKH7KfdGRok5KsjKn6y
	 wh3jb+nwFbq9QlvSCdfyYiNILf/fHrZUVqOc0fZs4yL/m+P/aZNrQ/ZR3eg7/kQ/j72CE
	 OTf78NBZV8TDAFs0wxDM+A+IWTor4gHUbKJYsCsWFFNT3t3ceWLQqcCHGA1rZ7uaMDTZW
	 G42W3fk1aLjZIe5coVNO/1Wdt8tqrYw6COhhT5aXCVBQBrQAizR6s6AzQUYt1OfjSVwsp
	 0SJaAkGXWI5bRtLS5ArM+Stz23HSeHrdRg4u/ZFZOVKnWBbOgBTYrrBDq9PZa067syQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.73
Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB6606A31F;
	Thu, 29 Oct 2026 05:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BB6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2076944|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0154444-0.0477482-0.936807;FP=3168551345206150866|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2ZbuG_1793252006;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2ZbuG_1793252006 cluster:ay29)
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
Subject: [PATCH v9 3/7] EDAC/amd64: Stop matching Hygon CPUs
Date: Thu, 29 Oct 2026 13:33:09 +0800
Message-ID: <20261029053313.46323-4-wanglin@open-hieco.net>
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
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 0c0d11c72925..d10043a2d35f 100644
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

