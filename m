Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259599;
	b=YqZ64j921AG1zx0TA04COejB/4u5ztYLv8Ty2UMMAKbIBMkhbAfypYb3h3hpEOBvSMtq
	 cVr6f0z8SCddV4Ni5C7hnxpyNfHAaIJaMkRo9vagU5cpKdVr24Zz+cQEGwjdJ09S+HqBB
	 2qruKil7yzffmzYWB9lCW1v2X0q9Q6ClGRfYBjIrNd9X7yhRdVrJ60Nd4zOMGe0aJhzjC
	 x9oAEEZtyOcGGetoIf1gvyJe4r89bsisA+YQu9tgp9Kg8CIVUA0Y6Fv49tG8UIBnhCVNU
	 O/TTYV98SSREr0Wnb6j1rMZ7xyIFoNvWW0l+eLogKXBBvK+xSdMMCg7S50df2BVgY+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259599;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=k6OJx0LqmLbU9uFPTY2aCbQqurnAp0Esi5kPPLQnVXc=;
	b=T5paMWgvzbWDFBsLrMjsktSpwa7Lu2IHC6pN/jcE572ltygQmP7Jl0jEYAEM75VHAEiT
	 oDpVgpF99flSKKEzDTzOgs34CBywQgWqVHaojCzWIixesYtjcaKIiJ7Obf9oBHmAZ9l3d
	 zDhKwAwW1KyJuXHS/YYegpKYgVzFOsrmkZ9z1MJrDd8YYxgZSdnCgT32yGzN4rDrG5Iqq
	 rCPMkzKgdibIlf+y3uaS4u/vgTETUO1XnB3CuTDMjutXb54/vSur76xPIjBg8pIuu3rFd
	 I235eiwb9WdzrOIQfdMClZyFm5gJyp0FgZ4gfJDeKtLLBKhTAnjjFaN0in01AFF+deg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="BqOYQ0/g";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2pzf4pl+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44E3606A33A;
	Mon,  9 Nov 2026 21:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44E3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BqOYQ0/g;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2pzf4pl+
Date: Mon, 09 Nov 2026 21:26:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794259597;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6OJx0LqmLbU9uFPTY2aCbQqurnAp0Esi5kPPLQnVXc=;
	b=BqOYQ0/gkDPd8/ZtTiXIEyHIUtDLNNDCjUMbQeXBztKu8NYgjDRmuHrA1bbXEWAmVd3WUP
	WSeP+3SM3OxPVddteohoKCb6TMHxxozGfnaQ88JnPqCvhK8HUD/Jjc4BNE2kVflFNJvtWJ
	OxBlKCgVeNwY+XY6As4NY70xE+7x37H4phGaPrU8Ms4tpeV/59G8MDWWG8TfCZiAFjgKHS
	izyGj4PvJPVRSO1FKb4GW5HiF9ePb1lAFIOl/6PseiTjRJTC5hzSpVt6Nv6+8gBwXx/AkC
	VDIyTdLvXqiJiiWK1AihzcvdSug1RbLAtxCD236/kCiWd0oE7rh84YLCOZUK8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794259597;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6OJx0LqmLbU9uFPTY2aCbQqurnAp0Esi5kPPLQnVXc=;
	b=2pzf4pl+j1LC9bhP2/h4qZTWrHsRFxf/c91L8FP5821HHgrX9YpVsALv3F2910kJsuo5GK
	g18BMsGQyiqYyIDQ==
From: "tip-bot2 for Reinette Chatre" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Move MSR_IA32_L{2,3}_QOS_CFG scope
 property to x86 resource
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Chen Yu <yu.c.chen@intel.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C5ea880efa78017b4ea64c47cec94f1f28d6c70a0=2E1793834?=
 =?utf-8?q?224=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
References: =?utf-8?q?=3C5ea880efa78017b4ea64c47cec94f1f28d6c70a0=2E17938342?=
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
Message-ID: <179425959547.2093942.10357953980521753266.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     97576125b83d9d23861c68ce28b84ad6aaa6c622
Gitweb:        https://git.kernel.org/tip/97576125b83d9d23861c68ce28b84ad6aaa=
6c622
Author:        Reinette Chatre <reinette.chatre@intel.com>
AuthorDate:    Wed, 04 Nov 2026 16:13:31 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 08 Nov 2026 18:17:31 -08:00

x86,fs/resctrl: Move MSR_IA32_L{2,3}_QOS_CFG scope property to x86 resource

MSR_IA32_L{2,3}_QOS_CFG enable code and data prioritization on x86. On
Intel the registers have the scope of the associated cache while on AMD
they have CPU scope. The scope is recorded as a property of the cache
resource's control, of which each cache resource currently supports only
one.

The scope of MSR_IA32_L{2,3}_QOS_CFG is only relevant to x86. Even so, the
property is found among the resctrl filesystem's cache properties while only
x86 code sets and reads it. Keeping the property with the cache control
properties would also duplicate it across all controls of a resource when
resources support multiple controls.

Make the scope of MSR_IA32_L{2,3}_QOS_CFG a property of the x86 hardware
resource and name it for the registers it describes now that it no longer
needs to be generic.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Link: https://patch.msgid.link/5ea880efa78017b4ea64c47cec94f1f28d6c70a0.17938=
34224.git.reinette.chatre@intel.com
---
 arch/x86/kernel/cpu/resctrl/core.c     | 7 ++++---
 arch/x86/kernel/cpu/resctrl/internal.h | 4 ++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 4 +++-
 include/linux/resctrl.h                | 3 ---
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl=
/core.c
index f96f7cf..e647c3a 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -444,6 +444,7 @@ static int get_domain_id_from_scope(int cpu, enum resctrl=
_scope scope)
=20
 static void domain_add_cpu_ctrl(int cpu, struct rdt_resource *r)
 {
+	struct rdt_hw_resource *hw_res =3D resctrl_to_arch_res(r);
 	int id =3D get_domain_id_from_scope(cpu, r->ctrl_scope);
 	struct rdt_hw_ctrl_domain *hw_dom;
 	struct list_head *add_pos =3D NULL;
@@ -466,7 +467,7 @@ static void domain_add_cpu_ctrl(int cpu, struct rdt_resou=
rce *r)
 		d =3D container_of(hdr, struct rdt_ctrl_domain, hdr);
=20
 		cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
-		if (r->cache.arch_has_per_cpu_cfg)
+		if (hw_res->qos_cfg_has_cpu_scope)
 			rdt_domain_reconfigure_cdp(r);
 		return;
 	}
@@ -1001,7 +1002,7 @@ static __init void rdt_init_res_defs_intel(void)
=20
 		if (r->rid =3D=3D RDT_RESOURCE_L3 ||
 		    r->rid =3D=3D RDT_RESOURCE_L2) {
-			r->cache.arch_has_per_cpu_cfg =3D false;
+			hw_res->qos_cfg_has_cpu_scope =3D false;
 			r->cache.min_cbm_bits =3D 1;
 		} else if (r->rid =3D=3D RDT_RESOURCE_MBA) {
 			hw_res->msr_base =3D MSR_IA32_MBA_THRTL_BASE;
@@ -1020,8 +1021,8 @@ static __init void rdt_init_res_defs_amd(void)
=20
 		if (r->rid =3D=3D RDT_RESOURCE_L3 ||
 		    r->rid =3D=3D RDT_RESOURCE_L2) {
+			hw_res->qos_cfg_has_cpu_scope =3D true;
 			r->cache.arch_has_sparse_bitmasks =3D true;
-			r->cache.arch_has_per_cpu_cfg =3D true;
 			r->cache.min_cbm_bits =3D 0;
 		} else if (r->rid =3D=3D RDT_RESOURCE_MBA) {
 			hw_res->msr_base =3D MSR_IA32_MBA_BW_BASE;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/res=
ctrl/internal.h
index e3cfa0c..670ce92 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -125,6 +125,9 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale =3D occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @qos_cfg_has_cpu_scope:	Only for the L2 and L3 resources: true if
+ *				MSR_IA32_L{2,3}_QOS_CFG has CPU scope, false if
+ *				the scope matches the associated cache.
  * @mbm_cntr_assign_enabled:	ABMC feature is enabled
  * @sdciae_enabled:	SDCIAE feature (backing "io_alloc") is enabled.
  *
@@ -140,6 +143,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			qos_cfg_has_cpu_scope;
 	bool			mbm_cntr_assign_enabled;
 	bool			sdciae_enabled;
 };
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/res=
ctrl/rdtgroup.c
index 5ffa39f..6e4eecc 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -131,6 +131,7 @@ static void l2_qos_cfg_update(void *arg)
=20
 static int set_cache_qos_cfg(int level, bool enable)
 {
+	struct rdt_hw_resource *hw_res;
 	void (*update)(void *arg);
 	struct rdt_ctrl_domain *d;
 	struct rdt_resource *r_l;
@@ -151,8 +152,9 @@ static int set_cache_qos_cfg(int level, bool enable)
 		return -ENOMEM;
=20
 	r_l =3D &rdt_resources_all[level].r_resctrl;
+	hw_res =3D resctrl_to_arch_res(r_l);
 	list_for_each_entry_rcu(d, &r_l->ctrl_domains, hdr.list, lockdep_is_cpus_he=
ld()) {
-		if (r_l->cache.arch_has_per_cpu_cfg)
+		if (hw_res->qos_cfg_has_cpu_scope)
 			/* Pick all the CPUs in the domain instance */
 			for_each_cpu(cpu, &d->hdr.cpu_mask)
 				cpumask_set_cpu(cpu, cpu_mask);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 66dc981..b6b4519 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -215,8 +215,6 @@ struct rdt_l3_mon_domain {
  * @shareable_bits:	Bitmask of shareable resource with other
  *			executing entities
  * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
- * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
- *				level has CPU scope.
  * @io_alloc_capable:	True if portion of the cache can be configured
  *			for I/O traffic.
  */
@@ -225,7 +223,6 @@ struct resctrl_cache {
 	unsigned int	min_cbm_bits;
 	unsigned int	shareable_bits;
 	bool		arch_has_sparse_bitmasks;
-	bool		arch_has_per_cpu_cfg;
 	bool		io_alloc_capable;
 };
=20
