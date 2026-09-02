Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A11DFF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788307619; cv=none; b=qIG9WAIYL4HdXGcawbUbKHojCcpBUxWDyLmj/INUcvjG7ppZQ6x40XByadVviLcP/gQLM3kiDLiGm20TxJ6kIAAfvYs2gbgaIg99POgFJiY+OpGx1MWpNewnFV1/EeAxxSCwRvas4uejZAM78PG9tbUApt4NHXLe4Ddj9mjiCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788307619; c=relaxed/simple;
	bh=ttS/jr5+CHJHcd1OnHHmiZr2nFanbDJdyTKhurZjoyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRFu1M0gyCG6LZ+s778zFS/e2tjbH42HpkjMMKasx+gKiau3fOsAHd/YQumoPBFGWrvObw4mewtxN8Ku2uvmtWqEQdzDh/6VXqZhKqwaQbrEc8rPpoV/wd8PhC3Xy6tmP0Cl0O//YhBradILq/gMadi/fcbtNlYSMpsxbOxwOlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhAdAr11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhAdAr11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836B21F00A3A;
	Wed,  2 Sep 2026 00:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788307618;
	bh=2m5s5tb9Ot15GIkgfbxL1DZpMVmYiBM0bNcFoGhWnZc=;
	h=From:To:Cc:Subject:Date;
	b=RhAdAr11v9qDDrJl/9vGTl/XWqQKdyMGYcvT0iF9CjWpI9FTZFtFAR0rjfI46JM5N
	 PVxJx0hmvMeoIVd5t81LWMXgOL2tMxZPj6tSCErOAkd1ohGih2j5xqSjpORshHPb1k
	 d7YOQrvh+v/bwCFy2WGoCqUTdMugO/v6OJS1TVeaRK2qgwo/3tM6Hq3UzZkOsqCbm/
	 HIzYgm6P2LPNjN+5AB5kKO1LamzrfpVGBlTy2iBXE1N4lXiGLt0WQ8zeJ6W+D+7AMC
	 hcc+QQ0EmjgxnH2QiAktMzutRU5aU9qRgUo/d9qe8XSBJsr95Jkj4/cgYhyg5rfKjR
	 jY9gCDKg8xvMA==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/coco: Replace cc_attr_flags with a bool
Date: Wed,  2 Sep 2026 02:06:33 +0200
Message-ID: <20260902000634.118808-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=blum@kernel.org; h=from:subject; bh=ttS/jr5+CHJHcd1OnHHmiZr2nFanbDJdyTKhurZjoyQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnTM7qWJ1hLsi+OcLwuk7G6uEnn0fTrObwuxXebRCYeK DfQ+pvYUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPJ12Jk+PFeWimogdtvxvp5 4kvZo12v/qlZILfz3duNytVXBT+W8jD8T75v+exT662AN5JcyX/zRXeb8daK6os0hHblJf9Zban BCAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The cc_attr_flags structure contains only the host_sev_snp bit. Replace
the structure with a bool.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/coco/core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 418ec77bbe3a..8c1842a29f44 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -22,10 +22,7 @@ SYM_PIC_ALIAS(cc_vendor);
 u64 cc_mask __ro_after_init;
 SYM_PIC_ALIAS(cc_mask);
 
-static struct cc_attr_flags {
-	__u64 host_sev_snp	: 1,
-	      __resv		: 63;
-} cc_flags;
+static bool cc_host_sev_snp;
 
 static bool noinstr intel_cc_platform_has(enum cc_attr attr)
 {
@@ -103,7 +100,7 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
 		return sev_status & MSR_AMD64_SNP_SECURE_TSC;
 
 	case CC_ATTR_HOST_SEV_SNP:
-		return cc_flags.host_sev_snp;
+		return cc_host_sev_snp;
 
 	case CC_ATTR_SNP_SECURE_AVIC:
 		return sev_status & MSR_AMD64_SNP_SECURE_AVIC;
@@ -169,7 +166,7 @@ static void amd_cc_platform_clear(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_HOST_SEV_SNP:
-		cc_flags.host_sev_snp = 0;
+		cc_host_sev_snp = false;
 		break;
 	default:
 		break;
@@ -191,7 +188,7 @@ static void amd_cc_platform_set(enum cc_attr attr)
 {
 	switch (attr) {
 	case CC_ATTR_HOST_SEV_SNP:
-		cc_flags.host_sev_snp = 1;
+		cc_host_sev_snp = true;
 		break;
 	default:
 		break;
