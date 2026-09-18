Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38094FD29C;
	Fri, 18 Sep 2026 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740702; cv=none; b=UNxG7MjiRgiFET7XnBBNOsbFptNUS/C0/ZsGcqlvlBowQ8YV8bkVpU//BAp/JeUWmHkAvhLNAc/En7x/dJF6MtBxFtYkvSISVTkG7IU0sXhhKRiTcpogLQ5Zl79VdTKMjC22U1Cr/1SE8BglD3dCrdta0J6k+gTdAqPxPWnUod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740702; c=relaxed/simple;
	bh=6+DNaJ0KhfXvVkfpY/J73/5RJw4ENnx4YQhzelT1LV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3ubY5GmyiPG0WC3biKg1sJpzYYRt+E0RBjVSXMJxZmLkLeJuzGOStTfYEm1Rle81+wQCgue9hteGvIJBRwso3B3X/0pNRbbKUwAZOSuJ95VjyF5T5eZHVexuDAtx4u7eqJw2QpC+wIJ0xaPm6+FT7KMdVnJpO71oqMFedzepKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Zty74dQb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Zty74dQb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8132168F;
	Fri, 18 Sep 2026 07:11:35 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F433F86C;
	Fri, 18 Sep 2026 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740699; bh=6+DNaJ0KhfXvVkfpY/J73/5RJw4ENnx4YQhzelT1LV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zty74dQbT+PosZ6ET2SfcR33YteCFQ/iKYSCG4AGzza7UyEqBp0YvhTH8XbYYxSqD
	 w+2WQEsMiTlkphsaIZS7xK7y6lCdjT/UtOa2RHV9/t+Ega1MUUNmFqTUc3bkCzt/P5
	 b5c4NAQV0uS9E2kY9UL558fZTIxSUbvceq70wcgI=
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
Subject: [PATCH v4 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Fri, 18 Sep 2026 16:11:08 +0200
Message-ID: <20260918141112.2115555-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
 drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index bb89fffde6856..7a55b4a6785d8 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -120,6 +120,7 @@ enum image_attr_names {
 	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
 	LFA_ATTR_ACTIVATE,
 	LFA_ATTR_CANCEL,
+	LFA_ATTR_AUTO_ACTIVATE,
 	LFA_ATTR_NR_IMAGES
 };
 
@@ -135,6 +136,7 @@ struct fw_image {
 	bool cpu_rendezvous;
 	bool cpu_rendezvous_forced;
 	bool use_cpu_rendezvous;
+	bool auto_activate;
 	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
 };
 
@@ -589,6 +591,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
+static ssize_t auto_activate_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &image->auto_activate);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t auto_activate_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->auto_activate);
+}
+
 static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_NAME]			= __ATTR_RO(name),
 	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
@@ -599,7 +623,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
 	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
 	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
-	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
+	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
 };
 
 static void init_image_default_attrs(void)
@@ -670,6 +695,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
 	image->kobj.kset = lfa_kset;
 	image->image_name = image_name;
 	image->cpu_rendezvous_forced = true;
+	image->auto_activate = false;
 	set_image_flags(image, seq_id, image_flags, reg_current_ver,
 			reg_pending_ver);
 	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
@@ -739,7 +765,8 @@ static int update_fw_images_tree(void)
 
 /*
  * Go through all FW images in a loop and trigger activation
- * of all activatible and pending images.
+ * of all activatible and pending images, but only if automatic
+ * activation for that image is allowed.
  * We have to restart enumeration after every triggered activation,
  * since the firmware images might have changed during the activation.
  */
@@ -758,7 +785,8 @@ static int activate_pending_image(void)
 			continue; /* Invalid FW component */
 
 		update_fw_image_pending(image);
-		if (image->activation_capable && image->activation_pending) {
+		if (image->activation_capable && image->activation_pending &&
+		    image->auto_activate) {
 			found_pending = true;
 			break;
 		}
-- 
2.43.0

