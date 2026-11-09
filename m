Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259602;
	b=InYnEJlf5RkJDDmlALxMIb8aGuc2yftfdGN2RjJ5U8jMe3ugEnmlCkw1g4F91hQr2zsq
	 IRUiZO4h/jhhkWlN4Dy4phG6qRpiSP08wU39DLjHsCcPsSOPqFVEztq2qFygQMlrmOV1T
	 O18EEbAJPWlDeuRfe81CfunO6zgbDyLhaaKtRCh3x9lkT8EiSuev6MAhBYuvwBoS8/got
	 frp6+SWq3h/pB68j2VQDKj798YttYPZozj6Bm27ofsORK4J52ngWBV2pwoF3XkHOIynr+
	 IU0iO0+4FeZTJezEWefQ0WyomQRpIJd87u9jdunoFI4nwYiBLBqHxF20TfZNh02VKhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259602;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=pao4KZceXXhiyS1kHwFDIIGXvo0ighZ64tQ2uApWnCM=;
	b=b8eV8axDCrvWaJvwMRPlxkjn5gqf5qjEEYJbl2jXd3Gy5w7tB66ZluoKO40zg3cq9qFb
	 5JbIcDgMtZaeU6sk5CYaXaibvAREOZhjtawQPUgPYz3t5JyDDz2sNpjuieUIag45/EQNS
	 v1lQuRTi3hYVPh0dJkk1p7kj3E1KsXApc5AhGxa8VvomEfGS6IyaFvcw0ei/nM8EpXF1/
	 tAsrHQx+r1+dwjSvICAw7W2S5HYUC2pNrdiz/UAYcXjaAkW83GAEXtc0euqE9Wpdl5k5z
	 ODVimbA5L2vra1Jp0Zkufvxe2wbf2OFdnVzSrv8SL0eVP33o4Xdybfxw2agk6NAfIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b3XQ+T9j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sxco4KqJ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B67606A33B;
	Mon,  9 Nov 2026 21:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B67606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b3XQ+T9j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sxco4KqJ
Date: Mon, 09 Nov 2026 21:26:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794259600;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pao4KZceXXhiyS1kHwFDIIGXvo0ighZ64tQ2uApWnCM=;
	b=b3XQ+T9jDtd75ck/qKmk9FcW4Kq5qoY0lG/HaJmS/AnDBwxBKuS+C+6B0v4qcsIdRaS8XM
	jqHIRbd7MCGa4113s8qfZnto202OKKVnprG1QJYDqIhltlEllJnbRiY8PezM1HNfrViILr
	gIUF43a0U3+eU8QezmW/z7rBLrYhJubMEHIqhkKOXeTmrLHsYJsfb/p2iXJ3Y9NADfN3Lz
	hZ8BVgC/zNOEDDumD8CF/zQIaXbKQK8wHnfMXick1ERb6LBS2raf21YAlICZg767End02h
	zDX3OOAIZgRf/qoGsyQOGN7Eb3bCQq/HquOyds1nkFAIjYZ0oKJKu+lg0CTkhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794259600;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pao4KZceXXhiyS1kHwFDIIGXvo0ighZ64tQ2uApWnCM=;
	b=Sxco4KqJopOKGqbKElADRGHTAl39J8CgbCQYFG7i8xjMWyxQ8p2na5bVe5Te9GgREWON4K
	F2tQ+gsB7d9NFaBQ==
From: "tip-bot2 for Reinette Chatre" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Remove unused non-linear bandwidth
 delay mapping
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Chen Yu <yu.c.chen@intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Tony Luck <tony.luck@intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C1ea0fed164eaa321a4eb151b14704134024dde88=2E1793834?=
 =?utf-8?q?224=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
References: =?utf-8?q?=3C1ea0fed164eaa321a4eb151b14704134024dde88=2E17938342?=
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
Message-ID: <179425959868.2093942.15951621813702320919.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     9bb210ebbd44b237222a93367f2a413cce3ae126
Gitweb:        https://git.kernel.org/tip/9bb210ebbd44b237222a93367f2a413cce3=
ae126
Author:        Reinette Chatre <reinette.chatre@intel.com>
AuthorDate:    Wed, 04 Nov 2026 16:13:29 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sat, 07 Nov 2026 18:10:49 -08:00

x86,fs/resctrl: Remove unused non-linear bandwidth delay mapping

Intel MBA throttles memory bandwidth with delay values, while resctrl
exposes memory bandwidth to user space as a percentage. When delay values
are linear there is a direct mapping between the two. Support for
non-linear delay values would need a pre-calibrated table mapping
percentages to delay values.

Commit

  05b93417ce5b ("x86/intel_rdt/mba: Add primary support for Memory Bandwidth =
Allocation (MBA)")

added a placeholder for such a table to the resctrl_membw structure, but
the table was never populated and never read. rdt_get_mb_table(), which
would provide it, always fails. As a result, an Intel MBA resource with
non-linear delay values is never marked as capable of allocation, and its
control values are never written to hardware.

Remove the unused mapping table and fold the linear percentage-to-delay
conversion into the function that writes the control values to hardware.

Keep the check that delay values are linear as a defensive measure in
preparation for supporting multiple controls, which turns the memory
bandwidth control into a generic scalar control that indicates whether it
requires linear values.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Link: https://patch.msgid.link/1ea0fed164eaa321a4eb151b14704134024dde88.17938=
34224.git.reinette.chatre@intel.com
---
 arch/x86/kernel/cpu/resctrl/core.c | 23 +++++++----------------
 include/linux/resctrl.h            |  2 --
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl=
/core.c
index 55214d6..f9677e5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -323,29 +323,20 @@ static void mba_wrmsr_amd(struct msr_param *m)
 		wrmsrq(hw_res->msr_base + i, hw_dom->ctrl_val[i]);
 }
=20
-/*
- * Map the memory b/w percentage value to delay values
- * that can be written to QOS_MSRs.
- * There are currently no SKUs which support non linear delay values.
- */
-static u32 delay_bw_map(unsigned long bw, struct rdt_resource *r)
-{
-	if (r->membw.delay_linear)
-		return MAX_MBA_BW - bw;
-
-	pr_warn_once("Non Linear delay-bw map not supported but queried\n");
-	return MAX_MBA_BW;
-}
-
 static void mba_wrmsr_intel(struct msr_param *m)
 {
 	struct rdt_hw_ctrl_domain *hw_dom =3D resctrl_to_arch_ctrl_dom(m->dom);
 	struct rdt_hw_resource *hw_res =3D resctrl_to_arch_res(m->res);
 	unsigned int i;
=20
-	/*  Write the delay values for mba. */
+	if (!m->res->membw.delay_linear) {
+		pr_warn_once("Non-linear MBA delay values not supported\n");
+		return;
+	}
+
+	/* Program bandwidth percentage mapped to linear delay value. */
 	for (i =3D m->low; i < m->high; i++)
-		wrmsrq(hw_res->msr_base + i, delay_bw_map(hw_dom->ctrl_val[i], m->res));
+		wrmsrq(hw_res->msr_base + i, MAX_MBA_BW - hw_dom->ctrl_val[i]);
 }
=20
 static void cat_wrmsr(struct msr_param *m)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca..b63dc62 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -253,7 +253,6 @@ enum membw_throttle_mode {
  * @throttle_mode:	Bandwidth throttling mode when threads request
  *			different memory bandwidths
  * @mba_sc:		True if MBA software controller(mba_sc) is enabled
- * @mb_map:		Mapping of memory B/W percentage to memory B/W delay
  */
 struct resctrl_membw {
 	u32				min_bw;
@@ -263,7 +262,6 @@ struct resctrl_membw {
 	bool				arch_needs_linear;
 	enum membw_throttle_mode	throttle_mode;
 	bool				mba_sc;
-	u32				*mb_map;
 };
=20
 struct resctrl_schema;
