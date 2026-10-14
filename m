Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F348641C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967008; cv=none; b=gLvKkqysH75//gYtUZ1e3sSxRkfxEEmstXGjuvpos+NpDZ0knw6VksAbd0yn/jr6qK+P98EhKpYi1evorv3brXbE3o2+L/fklOA8Uclvda1Vi0h3eejyYH46LgGjHb6gs8FAmlxOE/EOqg3dR5dGf8axHpBDpgrPb1vlIKMAfyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967008; c=relaxed/simple;
	bh=zog7u0aPQQT4VZrnFKOaEsuqpvMywYk1MS7E+z7YXMA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cYXYQ70d0kPadkAxQE9OmvtzOcOhTTFOsHnqV96DQrPrj8WFd8HADn2i633iE0uP1xdEUzEuAPDOFNKPWBSNWbOD3g3HFVMr7/iPcwI7RyjXvkQIIQpl8E+gxEwD3FhbGhYPUQQMNYgnWntB/7y9IMcZURiWTf30olcsaMLQtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=VWLkezKi; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="VWLkezKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791967006; x=1823503006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Gkm3Q2naDZPXmlIzPMB6nguoVAGsY1KqAj/3pPOsxg=;
  b=VWLkezKiejc81eXtkXZoNRc6eOxO8TTz6rP6TN2Cllj4w7ON4NqP8XU9
   Qbwh6R+tGC9xgqQjnvBAqLi1TuYARvBETlGGMfK1WlCjl2mvLtX1qGR2Q
   FKBbonkJ9sy8QR7ahv4agMJIcmSAsYyOVsfJuqJ6bFDd8zem8Bhq9O0h5
   dAUKFxq2toijNQtxUXO0tXWJIVrqYnziKL8y0jKsmP28E1VUXiHlHLuQT
   YcaIbZHrHYgeDZ0DD3KzHVg3BEh1Gu7O/D8QVKn6JeW4+DPHK4wnX+s1n
   cP9+8s/+Aq/i+nQrt9LY64ZsfoGR8BhDomTpBanJ0FFQDnHrG5S4rQC8K
   g==;
X-CSE-ConnectionGUID: Siepi9KCTnO3AK11KUkCuQ==
X-CSE-MsgGUID: DfZhmrNvT/+GcYMbvFAxsA==
X-IronPort-AV: E=Sophos;i="6.27,157,1787011200"; 
   d="scan'208";a="30989337"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 08:36:42 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:11308]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.195:2525] with esmtp (Farcaster)
 id 628c53f3-ab6c-4941-96c0-69c86c1b3ebd; Wed, 14 Oct 2026 08:36:42 +0000 (UTC)
X-Farcaster-Flow-ID: 628c53f3-ab6c-4941-96c0-69c86c1b3ebd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 14 Oct 2026 08:36:42 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Wed, 14 Oct 2026 08:36:39 +0000
From: Alexander Graf <graf@amazon.com>
To: Tony Luck <tony.luck@intel.com>, Reinette Chatre
	<reinette.chatre@intel.com>
CC: Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu
 Moger <babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo Molnar"
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<nh-open-source@amazon.com>, <lshahed@amazon.de>, <jaspwise@amazon.co.uk>
Subject: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Date: Wed, 14 Oct 2026 08:36:37 +0000
Message-ID: <20261014083637.65430-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When L3 CAT gets enabled with rdt=l3cat on Skylake-X stepping 3,
consecutive kexec boots hang for me during secondary socket bringup.
Cold boots on the same machine work.

We already disable L3 CAT by default on Skylake-X and Cascade Lake and
enable it only when the rdt=l3cat option is passed on the kernel command
line. I want to enable l3cat on Cascade Lake, but preserve a single kernel
command line across both Skylake and Cascade Lake systems.

To enable this, guard l3cat on Skylake-X steppings below 4 behind a force
option. That way, safe (but potentially imprecise) options continue to be
guarded by the normal rdt command line, but combinations that impact
system stability also require force in addition. With this, I can have a
single, safe kernel command line across both environments.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 ++++
 arch/x86/kernel/cpu/resctrl/core.c            | 31 ++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..54f8a9ea665a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6458,6 +6458,12 @@ Kernel parameters
 			perf telemetry monitoring associated with guid 0x12345
 			is enabled use:
 				rdt=!energy,perf:0x12345
+			On Skylake-X stepping < 4, rdt=l3cat is ignored
+			unless the bare token "force" is also given, e.g.:
+				rdt=force,l3cat
+			because L3 CAT there can hang a later kexec boot.
+			The token may appear anywhere in any rdt= parameter.
+			"!force" is ignored.
 
 	reboot=		[KNL]
 			Format (x86 or x86_64):
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..c4eb157b8b72 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -833,6 +833,8 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
+static bool rdt_force_raw __initdata;
+
 static int __init set_rdt_options(char *str)
 {
 	struct rdt_options *o;
@@ -842,6 +844,10 @@ static int __init set_rdt_options(char *str)
 	if (*str == '=')
 		str++;
 	while ((tok = strsep(&str, ",")) != NULL) {
+		if (!strcmp(tok, "force")) {
+			rdt_force_raw = true;
+			continue;
+		}
 		force_off = *tok == '!';
 		if (force_off)
 			tok++;
@@ -989,6 +995,26 @@ static __init bool get_rdt_mon_resources(void)
 	return !rdt_get_l3_mon_config(r);
 }
 
+/*
+ * Disable a feature that plain rdt= enable requests must not re-enable.
+ * Only rdt=force lets an explicit enable request override this.
+ */
+static __init void rdt_force_off_hard(int idx)
+{
+	struct rdt_options *o = &rdt_options[idx];
+
+	o->force_off = true;
+	if (!o->force_on)
+		return;
+
+	if (rdt_force_raw) {
+		pr_info("rdt=force: keeping %s enabled on this CPU\n", o->name);
+	} else {
+		pr_info("Ignoring rdt=%s: unsafe on this CPU, see rdt=force\n", o->name);
+		o->force_on = false;
+	}
+}
+
 static __init void __check_quirks_intel(void)
 {
 	switch (boot_cpu_data.x86_vfm) {
@@ -998,7 +1024,10 @@ static __init void __check_quirks_intel(void)
 		break;
 	case INTEL_SKYLAKE_X:
 		if (boot_cpu_data.x86_stepping <= 4)
-			set_rdt_options("!cmt,!mbmtotal,!mbmlocal,!l3cat");
+			set_rdt_options("!cmt,!mbmtotal,!mbmlocal");
+		/* L3 CAT on these steppings can hang a later kexec boot. */
+		if (boot_cpu_data.x86_stepping < 4)
+			rdt_force_off_hard(RDT_FLAG_L3_CAT);
 		else
 			set_rdt_options("!l3cat");
 		fallthrough;

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.47.1

