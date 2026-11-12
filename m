Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489199;
	b=0pkVtgrPw0niDGG3GwQKgxQMbqjbJvHA2Ubhn59yapf3kN5qqA8kuAMRyOSMisHZduMA
	 Hzh+i6o2va+jiIY+FfmaoV8DDgQOO84bYEHH9rHkwnMeMgyKNTW2XZUHaDeZQk7gj9wRO
	 Wepha8IcKClTzVGm8RLSPt8jwZ07Vxla/Lu2I9hGQaUW26oq769mMndHE+2IpN0pDvKyU
	 OskvWB3rmH0u17pOpmx7qLU2deZk3p8rz4z5rjgTPLEVrdQhauBQHI9dfhbrdPdELUQr/
	 pwnqiFUgb495oD+3WwMjjrp5o+UXReFdZCMoBxbjIp2pNpAm9TrbMCzy4O455MSQj8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489199;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=XILbzNG8364SQMzEVvGGmHe9jocP0yD2ZAPIhRzCmkM=;
	b=cCIT3vILJN8qjXn+bleo94nZtkB+cDpmXQwsNKATzTpZ95mnKsOEnNYKBC3MMWzODDFx
	 q+IS9qXVfVD8x12AzG8ITnI59bNQ+4kPCn0Hx/ugSvTiW4LztSsr66IgOjWI783xhvs9H
	 0Pu6SvCqWfaxqJ/2qkYMxjl4sfqQaz1NBAlBcDI4WSlXCguhIdvsaZSCaga5r8m2sEfpr
	 7UZWwZzfDfzQ5R9awSYaWCMMUO7JBPS5FAmur5wDlLktid0aAN03XoOP9VvKqsqbn3X9H
	 y9iKcdHwdOMymV0g77ZSSdk37NFzALX0OXYGfullGKyL8GF9KTVly/5mBsIn9jDHuMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=r8wHeS6a;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3934606A31C;
	Thu, 12 Nov 2026 13:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3934606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=r8wHeS6a
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XILbzNG8364SQMzEVvGGmHe9jocP0yD2ZAPIhRzCmkM=;
	b=r8wHeS6acBmnEGDFSwxfdP41EG/95w5Po9kK2Ge9tLaadBF8pBK3/UCOCHoDk1Q5hs0Vk94Xz
	XPoiPZ1MJAgEktzloodoIZcrDtuzLM1tAeyKkCk+qazNL6IELJmNrzG2cfWyF4crCa+C2q/T9vb
	1ro43tPWT8q0hsKsjjJOFMc=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRH0vjKzmV8H;
	Thu, 12 Nov 2026 21:12:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E57544048B;
	Thu, 12 Nov 2026 21:13:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 5/9] fs/resctrl: Allow mba_MBps with assignable MBM counters
Date: Thu, 12 Nov 2026 21:12:50 +0800
Message-ID: <20261112131255.4043381-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The controller needs a counter for the event selected by mba_MBps_event
in every monitoring group, so mba_MBps is refused when MBM counters are
assignable. On MPAM a group's monitor is assigned from a fixed pool
when the group is created, and users can otherwise only pick a
percentage of a maximum that firmware does not report.

Allow the controller when the architecture has a fixed assignment mode
and assigns counters when a group is created. Keep mbm_assign_on_mkdir
enabled while the controller is in use, restore its previous value
when the controller is disabled, and refuse to unassign the
controller's counter meanwhile.

Only MPAM has this mode; other systems keep the previous behavior.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst |  7 +++++--
 fs/resctrl/monitor.c                  | 25 ++++++++++++++++++++++
 fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++------
 3 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..d70aec6f7096 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -471,7 +471,8 @@ with the following files:
 	Determines if a counter will automatically be assigned to an RMID, MBM event
 	pair when its associated monitor group is created via mkdir. Enabled by default
 	on boot, also when switched from "default" mode to "mbm_event" counter assignment
-	mode. Users can disable this capability by writing to the interface.
+	mode. Users can disable this capability by writing to the interface. While the
+	MBA software controller is enabled, auto assignment cannot be disabled.
 
 	"0":
 		Auto assignment is disabled.
@@ -704,7 +705,9 @@ When monitoring is enabled all MON groups may also contain:
 	   mbm_total_bytes:0=e;1=e
 	   mbm_local_bytes:0=e;1=e
 
-	Assignments can be modified by writing to the interface.
+	Assignments can be modified by writing to the interface. While the
+	MBA software controller is enabled, the counter of the event the
+	controller uses cannot be unassigned.
 
 	Examples:
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 8f3b8c3e3010..5a67c8089615 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1210,6 +1210,12 @@ ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of, char *buf
 		goto out_unlock;
 	}
 
+	if (!value && is_mba_sc(NULL)) {
+		rdt_last_cmd_puts("mbm_assign_on_mkdir is required by the software controller\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	r->mon.mbm_assign_on_mkdir = value;
 
 out_unlock:
@@ -1776,6 +1782,19 @@ static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r, char *n
 	return NULL;
 }
 
+/*
+ * Return the event the MBA software controller uses as its input for @rdtgrp.
+ * A monitor group has no event of its own: its bandwidth is summed into the
+ * parent control group, which is the group with the mba_MBps_event setting.
+ */
+static enum resctrl_event_id rdtgrp_mba_mbps_event(struct rdtgroup *rdtgrp)
+{
+	if (rdtgrp->type == RDTMON_GROUP)
+		return rdtgrp->mon.parent->mba_mbps_event;
+
+	return rdtgrp->mba_mbps_event;
+}
+
 static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *d,
 					struct rdtgroup *rdtgrp, struct mon_evt *mevt)
 {
@@ -1789,6 +1808,12 @@ static int rdtgroup_modify_assign_state(char *assign, struct rdt_l3_mon_domain *
 		ret = rdtgroup_assign_cntr_event(d, rdtgrp, mevt);
 		break;
 	case '_':
+		if (is_mba_sc(NULL) &&
+		    mevt->evtid == rdtgrp_mba_mbps_event(rdtgrp)) {
+			rdt_last_cmd_puts("Counter is in use by the software controller\n");
+			ret = -EBUSY;
+			break;
+		}
 		rdtgroup_unassign_cntr_event(d, rdtgrp, mevt);
 		break;
 	default:
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b32831871f70..518d89b0c67d 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2610,10 +2610,9 @@ static void mba_sc_domain_destroy(struct rdt_resource *r,
  * The MBA software controller is supported only if MBM is supported and MBA is
  * in linear scale, and the MBM monitor scope is the same as MBA control scope.
  *
- * The software controller cannot be supported when the MBM counters are
- * assignable.  There is no guarantee that MBM counters are assigned to the
- * event backing the software controller in all monitoring domains of all
- * monitoring groups.
+ * The controller needs a counter for its event in every monitoring group.
+ * With assignable counters that requires a fixed assignment mode, with
+ * counters assigned automatically while the controller is in use.
  */
 static bool supports_mba_mbps(void)
 {
@@ -2623,9 +2622,13 @@ static bool supports_mba_mbps(void)
 	return (resctrl_is_mbm_enabled() &&
 		r->alloc_capable && is_mba_linear() &&
 		r->ctrl_scope == rmbm->mon_scope &&
-		!rmbm->mon.mbm_cntr_assignable);
+		(!rmbm->mon.mbm_cntr_assignable ||
+		 rmbm->mon.mbm_cntr_assign_fixed));
 }
 
+/* mbm_assign_on_mkdir before the software controller forced it on. */
+static bool mba_sc_saved_assign_on_mkdir;
+
 /*
  * Enable or disable the MBA software controller
  * which helps user specify bandwidth in MBps.
@@ -2633,6 +2636,7 @@ static bool supports_mba_mbps(void)
 static int set_mba_sc(bool mba_sc)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	struct rdt_resource *rmbm = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 num_closid = resctrl_arch_get_num_closid(r);
 	struct rdt_ctrl_domain *d;
 	unsigned long fflags;
@@ -2643,6 +2647,20 @@ static int set_mba_sc(bool mba_sc)
 
 	r->membw.mba_sc = mba_sc;
 
+	/*
+	 * The controller needs its event counted in every monitoring group:
+	 * force automatic assignment on, and restore the user's setting when
+	 * the controller is disabled.
+	 */
+	if (rmbm->mon.mbm_cntr_assignable) {
+		if (mba_sc) {
+			mba_sc_saved_assign_on_mkdir = rmbm->mon.mbm_assign_on_mkdir;
+			rmbm->mon.mbm_assign_on_mkdir = true;
+		} else {
+			rmbm->mon.mbm_assign_on_mkdir = mba_sc_saved_assign_on_mkdir;
+		}
+	}
+
 	rdtgroup_default.mba_mbps_event = mba_mbps_default_event;
 
 	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
@@ -3352,7 +3370,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		msg = "mba_MBps requires MBM (mbm_event mode not supported) and linear scale MBA at L3 scope";
+		msg = "mba_MBps requires MBM and linear scale MBA at L3 scope";
 		if (!supports_mba_mbps())
 			return invalfc(fc, msg);
 		ctx->enable_mba_mbps = true;
-- 
2.34.1

