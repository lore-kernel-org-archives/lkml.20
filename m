Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259601;
	b=1t+bbClXUTx5s1wFCHJl9wElj+BHzLdJrZZ8YPcNpdurify/rp2Iar8Vrkqgj1Vo+tnF
	 Tq0U0ujDrkJpSZgxLO6pbWpUl7ajS/jgmEFBaLeXTVkmDaUq8ZdRUebqJXESLtoJx2u/2
	 WDXdu/LUx5TBlFvqKDuoJLXrHv8quhofq7bbh8ZWq05Gsxbv8oXP58HZV1Bs8nSV1CfGA
	 NfPjW6hHOkAbYlcYcJ2GBtnJfcyynzAGlVpeHZ8mf8kHr8QI+IOzMgoJ+Zc0pHBc++BfK
	 nKsze7d2trRWF5Psj/C+LjYDikBo9u/Hf8bd+gNGei4ASN2Lh1Kn46PDuCrbTVbq4XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259601;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=wof6Nd6Uwsf/NcWZ5MDOQOCoimh+xnIFvj7w5FNkfy0=;
	b=2/+j7ie2sfKVFRRqhepSP0JPIWYEAbCin473Brcpq4h/mxiSejur1oHX5BvqLwH8q7bO
	 Xhy2uol4ncKzn2ZicCvPGS2Tqrg29YSn/cl4ZiYW6/fD8N7xpVuIumvnKc6Il1Cd7YlGC
	 5I8EtU4AK32VuD/0jDEb3Oh6pK47ptZXlmy8vKpXNAObtdegwh4c1CXx6wLOVT0dbj/HX
	 eZI/bpG2zOYRPw+C8BauKpwwxDOmclw1g009xvgXrgHVsa9AdiElXruh3MqsiU2uEK+dQ
	 me9352xkhRIIPRTHuPfmW6z2HD58+4C3nx6JL04i/QAIAWhvwiLAaHsIrvITH/pQzBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mJAta37n;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=o6tRSDa3;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710960A260E;
	Mon,  9 Nov 2026 21:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D710960A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mJAta37n;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=o6tRSDa3
Date: Mon, 09 Nov 2026 21:26:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794259598;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wof6Nd6Uwsf/NcWZ5MDOQOCoimh+xnIFvj7w5FNkfy0=;
	b=mJAta37nAo7fQ3HGkviOWZpv75rfdmC6euw5OeP0P6IShknOfIaYON7EhtJ7xFk7Ga9ceV
	gk+uEhsqTRWbBCfubYxhA6pE4Q9cOJ5nhUhWSCuGpWeDgYEZhB67FBgyJDSP5PAJtqYyoi
	ks9/fEqJWZRc1lbfZsOsHWUmxqD7YwesBTA2/Z4xRqTEAqxw3DUh/ghh0zMsVL4JENNQiU
	62Pn8MihJNS/9E9YhMGChEe/3PaCdiF0XY5a83+Ly23jex4d5oIwOlEhTWNSyBSXBNCuO1
	TOevU1r0RKKoFDFaBLhQn1Jh8H/xhvea8Q9o8O4ElEQF2Tcs9oCgHzVTKlt+zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794259598;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wof6Nd6Uwsf/NcWZ5MDOQOCoimh+xnIFvj7w5FNkfy0=;
	b=o6tRSDa3zk67QlZIasZ5bjE/LmoLxXhSIwEAQjePxxwqqe51R/dkl59HWhgyYumjsa0xxz
	KTlO8O6AlqrKdoBg==
From: "tip-bot2 for Reinette Chatre" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Remove unnecessary non-linear MBA
 configuration check
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Chen Yu <yu.c.chen@intel.com>,
 Tony Luck <tony.luck@intel.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C7e1aeee81a38a33ca889db68e4c645f935e4e6cd=2E1793834?=
 =?utf-8?q?224=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
References: =?utf-8?q?=3C7e1aeee81a38a33ca889db68e4c645f935e4e6cd=2E17938342?=
 =?utf-8?q?24=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425959714.2093942.1499104372365272723.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     28739daee35258b3c7eac08fdafc872e48453333
Gitweb:        https://git.kernel.org/tip/28739daee35258b3c7eac08fdafc872e484=
53333
Author:        Reinette Chatre <reinette.chatre@intel.com>
AuthorDate:    Wed, 04 Nov 2026 16:13:30 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 08 Nov 2026 17:52:59 -08:00

x86,fs/resctrl: Remove unnecessary non-linear MBA configuration check

Writing a bandwidth value from user space is rejected if the MBA resource
has non-linear delay values while the architecture indicates (via
resctrl_membw::arch_needs_linear) it can only configure resources with
linear delay values. Intel indicates this for MBA while AMD and MPAM do not.

This check can never fail. No Intel SKU supports non-linear delay values, and
the placeholder for such support, rdt_get_mb_table(), is only called during
enumeration and always fails.

A non-linear Intel MBA resource is thus never marked as capable of allocation,
and resctrl never exposes it to user space or attempts to configure it. Every
Intel MBA resource capable of allocation has linear delay values, and AMD and
MPAM never indicate a need for them.

Fail enumeration of a non-linear Intel MBA resource directly to make clear
that it is not supported, and remove the check together with the
resctrl_membw::arch_needs_linear property it relies on.

  [ bp: Massage commit message. ]

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Acked-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/7e1aeee81a38a33ca889db68e4c645f935e4e6cd.17938=
34224.git.reinette.chatre@intel.com
---
 arch/x86/kernel/cpu/resctrl/core.c | 42 ++++++-----------------------
 fs/resctrl/ctrlmondata.c           |  8 +------
 include/linux/resctrl.h            |  2 +-
 3 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl=
/core.c
index f9677e5..f96f7cf 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -181,27 +181,6 @@ static inline void cache_alloc_hsw_probe(void)
 	rdt_alloc_capable =3D true;
 }
=20
-/*
- * rdt_get_mb_table() - get a mapping of bandwidth(b/w) percentage values
- * exposed to user interface and the h/w understandable delay values.
- *
- * The non-linear delay values have the granularity of power of two
- * and also the h/w does not guarantee a curve for configured delay
- * values vs. actual b/w enforced.
- * Hence we need a mapping that is pre calibrated so the user can
- * express the memory b/w as a percentage value.
- */
-static inline bool rdt_get_mb_table(struct rdt_resource *r)
-{
-	/*
-	 * There are no Intel SKUs as of now to support non-linear delay.
-	 */
-	pr_info("MBA b/w map not implemented for cpu:%d, model:%d",
-		boot_cpu_data.x86, boot_cpu_data.x86_model);
-
-	return false;
-}
-
 static __init bool __get_mem_config_intel(struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res =3D resctrl_to_arch_res(r);
@@ -212,18 +191,18 @@ static __init bool __get_mem_config_intel(struct rdt_re=
source *r)
 	cpuid_count(0x00000010, 3, &eax.full, &ebx, &ecx, &edx.full);
 	hw_res->num_closid =3D edx.split.cos_max + 1;
 	max_delay =3D eax.split.max_delay + 1;
-	r->membw.max_bw =3D MAX_MBA_BW;
-	r->membw.arch_needs_linear =3D true;
-	if (ecx & MBA_IS_LINEAR) {
-		r->membw.delay_linear =3D true;
-		r->membw.min_bw =3D MAX_MBA_BW - max_delay;
-		r->membw.bw_gran =3D MAX_MBA_BW - max_delay;
-	} else {
-		if (!rdt_get_mb_table(r))
-			return false;
-		r->membw.arch_needs_linear =3D false;
+
+	if (!(ecx & MBA_IS_LINEAR)) {
+		pr_info("Non-linear MBA delay values not supported for family:%d, model:%d=
\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		return false;
 	}
=20
+	r->membw.delay_linear =3D true;
+	r->membw.max_bw =3D MAX_MBA_BW;
+	r->membw.min_bw =3D MAX_MBA_BW - max_delay;
+	r->membw.bw_gran =3D MAX_MBA_BW - max_delay;
+
 	if (boot_cpu_has(X86_FEATURE_PER_THREAD_MBA))
 		r->membw.throttle_mode =3D THREAD_THROTTLE_PER_THREAD;
 	else
@@ -255,7 +234,6 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_re=
source *r)
=20
 	/* AMD does not use delay */
 	r->membw.delay_linear =3D false;
-	r->membw.arch_needs_linear =3D false;
=20
 	/*
 	 * AMD does not use memory delay throttle model to control
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index cafebdf..4562072 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -45,14 +45,6 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_r=
esource *r)
 	int ret;
 	u32 bw;
=20
-	/*
-	 * Only linear delay values is supported for current Intel SKUs.
-	 */
-	if (!r->membw.delay_linear && r->membw.arch_needs_linear) {
-		rdt_last_cmd_puts("No support for non-linear MB domains\n");
-		return false;
-	}
-
 	ret =3D kstrtou32(buf, 10, &bw);
 	if (ret) {
 		rdt_last_cmd_printf("Invalid MB value %s\n", buf);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index b63dc62..66dc981 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -249,7 +249,6 @@ enum membw_throttle_mode {
  * @max_bw:		Maximum memory bandwidth value, used as the reset value
  * @bw_gran:		Granularity at which the memory bandwidth is allocated
  * @delay_linear:	True if memory B/W delay is in linear scale
- * @arch_needs_linear:	True if we can't configure non-linear resources
  * @throttle_mode:	Bandwidth throttling mode when threads request
  *			different memory bandwidths
  * @mba_sc:		True if MBA software controller(mba_sc) is enabled
@@ -259,7 +258,6 @@ struct resctrl_membw {
 	u32				max_bw;
 	u32				bw_gran;
 	u32				delay_linear;
-	bool				arch_needs_linear;
 	enum membw_throttle_mode	throttle_mode;
 	bool				mba_sc;
 };
