Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF02264AB;
	Tue, 22 Sep 2026 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049485; cv=none; b=lLVncPmgqh1gO2qMoESEEESQ4hlT20H3UsUBORREcFEBFN8uBLd7teBUlE+fYS17i0P10lAdp/GIKvl689dKnNAxXcdk5L/4H3q7AP1E1X0nWk2AKCvB7hSC90ZNyB0EKY3HSUlWTUkDQ0+i+mVQIPMx69y3v/C3rY81c+EMiqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049485; c=relaxed/simple;
	bh=eTDfBRn+VfBcxdDzr3nwJupBXxmeWryP9QrvFR7Hlok=;
	h=Date:From:To:Subject:Cc:MIME-Version:Message-ID:Content-Type; b=gU3h4sH3NYk/lOA3lvKmZBYkCrqkyA/Xe17bAXoP1DXtuRiWWTupBRZMlWvJ3AEXIqqWHPhgJt09pqOih+ACQDTlJAOVI+2Dga8RLPWHYmuP2yXk2e4AJ46Uyz6hvuJVQE9r5eGj4++Qa7dJLGl11JXu2A4epYL6nMIeGavjtEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ppRC1qK8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3Ytbf0N6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ppRC1qK8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3Ytbf0N6"
Date: Tue, 22 Sep 2026 03:57:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790049481;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=WHNZleahCm23L8JFD+PQwpIfM6Tv35OkQKw9haYdgXs=;
	b=ppRC1qK8NGTo5kTx+25EG+Bg9VWVC5ebGzyFjSRVVekrgVQeEQ6ZezjTobS8JZ+Behn6xM
	//TnM3Y8RRlB53wVl3njYnlijkYK0JtmjfGBrb9B8dCe/d18INISxVtJAfUqggMXJms3k4
	+LpFLjXgiLi8z0RkjkMQ9XBruSo+b+IyRbST49aApcX4Uy4nDuGxezy9lUwhGQx2SeByu8
	ayJWIm3FjhL3r/47Op6yWUjpBDLXoaDrPiVX8CufpIDXqIE2/D5K7p9kTm+ed2GyGSq0vi
	SUluDNS4vHPLGgWzmBUqSqdFi2Dq5HWmGq69GOzZmNoB4nOVS3b8feOJOKtrLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790049481;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=WHNZleahCm23L8JFD+PQwpIfM6Tv35OkQKw9haYdgXs=;
	b=3Ytbf0N6QJrBk6dOIuyRVQwLgOMlw9h2j3ivsmk8Ai398U1CbXIpuJLLNs+U+WaJ/k7wBi
	kHYtx0P+fMdpwtCQ==
From: "tip-bot2 for Joerg Roedel" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sev] x86/sev: Report MSR_AMD64_SEV in sysfs
Cc: Joerg Roedel <joerg.roedel@amd.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179004947957.2819794.14488337049166861906.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sev branch of tip:

Commit-ID:     250ee734115bca1c1f7a38d838909aa83cce87ae
Gitweb:        https://git.kernel.org/tip/250ee734115bca1c1f7a38d838909aa83cc=
e87ae
Author:        Joerg Roedel <joerg.roedel@amd.com>
AuthorDate:    Wed, 09 Sep 2026 20:35:46 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 21 Sep 2026 20:28:44 -07:00

x86/sev: Report MSR_AMD64_SEV in sysfs

Add SEV_STATUS to the cpu/sev/ sysfs hierarchy and report it for all SEV guest
types.

  [ bp: Merge into a single patch, simplify. ]

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://lore.kernel.org/all/20260803125827.718024-1-joro@8bytes.org
---
 Documentation/ABI/testing/sysfs-devices-system-cpu | 10 +++-
 arch/x86/coco/sev/core.c                           | 30 ++++++++++---
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentati=
on/ABI/testing/sysfs-devices-system-cpu
index 82d10d5..7b0aef8 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -689,15 +689,21 @@ Description:	Umwait control
 			  Low order two bits must be zero.
=20
 What:		/sys/devices/system/cpu/sev
+		/sys/devices/system/cpu/sev/sev_status
 		/sys/devices/system/cpu/sev/vmpl
 Date:		May 2024
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:	Secure Encrypted Virtualization (SEV) information
=20
-		This directory is only present when running as an SEV-SNP guest.
+		This directory is only present when running as an SEV guest.
+
+		sev_status: Reports the value of the SEV_STATUS MSR which
+			    enumerates the enabled features of an SEV
+			    environment.
=20
 		vmpl: Reports the Virtual Machine Privilege Level (VMPL) at which
-		      the SEV-SNP guest is running.
+		      the SEV-SNP guest is running. This file is only present
+		      when running as an SEV-SNP guest.
=20
=20
 What:		/sys/devices/system/cpu/svm
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index cc292d7..eb2e853 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1431,15 +1431,22 @@ static ssize_t vmpl_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", snp_vmpl);
 }
=20
+static ssize_t sev_status_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%llx\n", sev_status);
+}
+
 static struct kobj_attribute vmpl_attr =3D __ATTR_RO(vmpl);
+static struct kobj_attribute sev_status_attr =3D __ATTR_RO(sev_status);
=20
-static struct attribute *vmpl_attrs[] =3D {
-	&vmpl_attr.attr,
+static struct attribute *sev_status_attrs[] =3D {
+	&sev_status_attr.attr,
 	NULL
 };
=20
 static struct attribute_group sev_attr_group =3D {
-	.attrs =3D vmpl_attrs,
+	.attrs =3D sev_status_attrs,
 };
=20
 static int __init sev_sysfs_init(void)
@@ -1448,7 +1455,7 @@ static int __init sev_sysfs_init(void)
 	struct device *dev_root;
 	int ret;
=20
-	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+	if (!(sev_status & MSR_AMD64_SEV_ENABLED))
 		return -ENODEV;
=20
 	dev_root =3D bus_get_dev_root(&cpu_subsys);
@@ -1463,7 +1470,20 @@ static int __init sev_sysfs_init(void)
=20
 	ret =3D sysfs_create_group(sev_kobj, &sev_attr_group);
 	if (ret)
-		kobject_put(sev_kobj);
+		goto drop_kobj;
+
+	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED) {
+		ret =3D sysfs_add_file_to_group(sev_kobj, &vmpl_attr.attr, NULL);
+		if (ret)
+			goto drop_sysfs;
+	}
+
+	return 0;
+
+drop_sysfs:
+	sysfs_remove_group(sev_kobj, &sev_attr_group);
+drop_kobj:
+	kobject_put(sev_kobj);
=20
 	return ret;
 }
