Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638484;
	b=0zbHI+n95qd+G+37mFF4ZCJuyJYpeUM0ozmgwloiJrKieoCsMZM4RYZUc+tR0J+q/7zT
	 8+QS3VW90tPLXVPaAPiSWzEbE/RXfYTmfPz4MPbeg7PArI+WJqezZR71P4/a6NrhuoAB1
	 tZ0N15Z+IcdW3RdpFodtiyfGJsbqauTsPrv41lvaqUlAX4J/k7PRx0HmfnvwqroKKMOXD
	 KQIidmaOsUWVfS4rgTcZ/bl5pzD3ufIuNlamYcIMuQ+DfmSSbZXS597hytLJsIU7djIJN
	 /bJC1fphOvpGSEeWmFthzbzj3uCVRcjolWI8V7kn9d39cVCIOf0TwW9iDjdloPpDl7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638484;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o3AVB0ETkxpZ0HvtZ+8EoQbSH8m8RIduh4Tc2fWtLHw=;
	b=2KaD0VNdhA774ytxKqgIE2LcD9h/oWFLcQOgbbKTXD3eR/PRNcwgL7SlLvPOzKh8xn9Y
	 7YnWdzkUhLszv15ZW/JROJ19r0m8GK5NC5FvoI2awoGTMPcmCD0kzt0PsST4Z7BJA44Yo
	 U6ZSQstePx02zAIvuj4V0ybV5i23x1S9ClURYeIu14qxEasBJ2NfI4faYUz4MtsysfBt7
	 N0/IUYOyaTLzwNJLf9Bj+z1LPq3M9jZKROfNaoXTG37MSEqGVnDGzoJ7GjCSRA6ZlLDXg
	 /dMgoIf0GppvPKfe/WiYXlkqR883oQRkKbdUoMe4USiHk3u134aZ5IIy5a+YEgqW4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GeZjq+us;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD1460913F1;
	Mon,  2 Nov 2026 16:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD1460913F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GeZjq+us
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C798516F3;
	Mon,  2 Nov 2026 08:54:39 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2C353F59E;
	Mon,  2 Nov 2026 08:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638482; bh=vU8cAQb+W+3Jz4MqGi0aLi6f8A4ixtLOHyc/TKPt4lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GeZjq+us5BurZjRNIT43c+NM3rS/JX04fMY8YozO0IdnAEjZENp8O85dkUWlG43UG
	 8129T8eHv2pbUJRWKUpVl6MX3HyKdiiaowbmhagkwP19HFh2G1Qt9Cxb6NSXh/3j3S
	 39FjGXkosqQ4MHo0As+JkH7VriuoPQBROtmFXonQ=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 RESEND 4/6] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Mon,  2 Nov 2026 17:54:18 +0100
Message-ID: <20261102165421.3651202-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
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

The Arm LFA spec places control over the actual activation process in
the hands of the non-secure host OS. An platform initiated interrupt or
notification signals the availability of an updateable firmware image,
but does not necessarily need to trigger it automatically.

Add a sysfs control file that guards such automatic activation. If an
administrator wants to allow automatic platform initiated updates, they
can activate that by echoing a "1" into the auto_activate file in the
respective sysfs directory. Any incoming notification would then result
in the activation triggered.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 41 +++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 4b4daf79611bb..65f28ffc9d108 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -148,6 +148,7 @@ enum component_attr_names {
 	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
 	LFA_ATTR_ACTIVATE,
 	LFA_ATTR_CANCEL,
+	LFA_ATTR_AUTO_ACTIVATE,
 	LFA_ATTR_NR_IMAGES
 };
 
@@ -162,6 +163,7 @@ struct fw_component {
 	bool cpu_rendezvous;
 	bool cpu_rendezvous_forced;
 	bool use_cpu_rendezvous;
+	bool auto_activate;
 	struct kobj_attribute comp_attrs[LFA_ATTR_NR_IMAGES];
 };
 
@@ -306,6 +308,7 @@ static int update_fw_components_node(char *fw_uuid, int seq_id,
 
 	comp->kobj.kset = lfa_kset;
 	comp->cpu_rendezvous_forced = true;
+	comp->auto_activate = false;
 	set_component_flags(comp, seq_id, comp_flags, reg_current_ver,
 			    reg_pending_ver);
 	if (kobject_init_and_add(&comp->kobj, &component_ktype, NULL,
@@ -718,6 +721,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
+static ssize_t auto_activate_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &comp->auto_activate);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t auto_activate_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	return sysfs_emit(buf, "%d\n", comp->auto_activate);
+}
+
 static struct kobj_attribute comp_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
 	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
@@ -727,7 +752,8 @@ static struct kobj_attribute comp_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
 	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
 	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
-	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
+	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
 };
 
 static void init_component_default_attrs(void)
@@ -759,11 +785,11 @@ static void clean_fw_components_tree(void)
 
 /*
  * Iterate over all FW components and trigger activation of all activatible and
- * pending components.
- * Since we would need to re-enumerate the list of all components after a
- * successful activation, and this could trigger infinite loops if a firmware
- * component still appears as pending, we create an array of update candidates
- * first, then activate each one of them.
+ * pending components, but only if automatic activation for that component is
+ * allowed. Since we would need to re-enumerate the list of all components
+ * after a successful activation, and this could trigger infinite loops if a
+ * firmware component still appears as pending, we create an array of update
+ * candidates first, then activate each one of them.
  */
 static void activate_pending_components(void)
 {
@@ -791,7 +817,8 @@ static void activate_pending_components(void)
 			continue; /* Invalid FW component */
 
 		_update_fw_component_pending(comp);
-		if (comp->activation_capable && comp->activation_pending) {
+		if (comp->activation_capable && comp->activation_pending &&
+		    comp->auto_activate) {
 			kobject_get(&comp->kobj);
 			all_comps[nr_comps++] = comp;
 		}
-- 
2.43.0

