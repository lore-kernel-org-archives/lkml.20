Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014776;
	b=gHj9/21CwCZSuY9CxuYrS0rgI3qYx1HqSD0E/GMm/2o3j79jJ95iD72Ucn8kksu/+QKz
	 S3CrEPEXdWXke6fOaYX3bqpDBlZychPOeVKVsaYJnpN5OP0wOhUc34Zcpb3rgP4UcHJ2f
	 8plLRdQx7bA1SLSuO4LYw0FHLkxdhwVh8lOv+fj3OildI9KcNcV/vc50cMmaJy4BMZNho
	 KZITIbxepdpo6sIAJVVRGAJwTXU0G5Z+17cAQDWxdYWuxtsdFdFtDcwziZDMG8aU1Ztj2
	 +lGrzCLNK9OvnGiZ+fBA9+bZONLgP619XKbljgOCxLOlv3FIutvh4DgOzoaVUqKd0cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014776;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ego/JqzwH5e5gOOB7tpYkW7PdBO8A6rRL5OD02abo2o=;
	b=iDU08fxwBYpX01ukZpnJzqga8d95ZHgXJvsy7S6gh6tnwd1xbwlM04aDlgRdwpGkUkrf
	 +cWw8GKpS3L61FzUyp3nqrciAErAWUt8IH0xQxyBLbUrSpDkDoWX4aeMvToxfWyaBY0JR
	 cWJmQNWbkmr2fYjCmsMXMtf2LYn4U4TQsieHs2h3lnU/XBtmGH2VwVH9QIzlxQjYhfZlZ
	 dNahf1SwsaMIlLHFhsZvWALzjJ7OM5dKAkVdl3XKrzSv7vpShlB/a0vqb8Mqtq1L7GEg7
	 BeLqPgFE3LkF5ZZkHVJbQcFhSNZ1ELSEUF18oCWpfCNl+VIWmvViCRNH+VEZoqrXCQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lBvEDFeI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.34
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F67606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lBvEDFeI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hz5pwpu6hCLZcVqZrMQybc2D/4eJan+iXJ1RTKiUijTLVLuAUezCBBUhcXeuJpKasp8OHlJh3eERAcThbnz4hlkHzWTFw7SB+D1W0c4NU/zO+ADvTDWsKONhMN1V6Chy3Fm5B+RS1l4TpCZNgMqzONWA/EpAmocpc/m88xGBLebjWdyfV8fS/gQ2bRsfP28FdrBNMCskN4C/EUraP5kvPVkEeYeTtWFIlNginUv0Q4WyoNtaqek+Tp/DpL44OMnxi2bbQs/T6m1NJYUnQNSpX3GlRqFC0dYTFnDVQQRmPQPMdl3lse3xAjpSZ0cgfdX94zXpoCmVW0x2K1fawNTyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ego/JqzwH5e5gOOB7tpYkW7PdBO8A6rRL5OD02abo2o=;
 b=LcuLdQH0xK/Y6YzKi4d/QBId2u1fWUWUi7k5qlxyWKpTD+c9o6UTxhY/JyD1MCWTFY6Ov69fXKuCzrAxzonrhlY0IQjdyPR9o8jfNEIKcHF44L7d8RNsLqUdTKsOFBrk/435bJ8zZdNIjcanG5EAOsdSSJDFt6HePr7AP9zGb2F7U9y3bfFAcROqNddhXSIELcCBOwc/cEFltxrtNjHFq3ROvUt9cHw3U9zWEjYvgkvReQwrLtGDaWoVqF88DjAdxQiiPytTZC/HDwtrvp/fE8DBGZrLYw0wM9NLPawIcVarRlx9Ewy7GgPue9iDcE+ojRzwwpybG+KLjx0nh5iGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ego/JqzwH5e5gOOB7tpYkW7PdBO8A6rRL5OD02abo2o=;
 b=lBvEDFeIPNZnk6vlWern/wTkCztrZnnQXtSjh5XwOQEBkn6EsvSd3ObaaaGK2zU0i4nbgFlCh4t5Fp1Tf/iNRFFPA5OZddY8k25wTgpjAxJTsyISiaoRbawtQkW4uhfH+pfsoCfoMybqOdkqhi4hZ8byhr3NOsHXgnRIXx8NPkc=
Received: from BN9PR03CA0533.namprd03.prod.outlook.com (2603:10b6:408:131::28)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:39:31 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::3d) by BN9PR03CA0533.outlook.office365.com
 (2603:10b6:408:131::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 26 Oct 2026 11:39:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 11:39:30 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 06:39:28 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima L K
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1] misc: amd-sbi: Fix use-after-free on driver unbind
Date: Mon, 26 Oct 2026 17:09:10 +0530
Message-ID: <20261026113910.1003008-1-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: ce572663-9cad-4f44-13a5-08df3355cc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|18002099003|3023799007|56012099006|11063799006|261021123027099003|261009223027099003|261022105027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	EBVYlHhyScWkZseaAOz7frU/51qvhvMOI1dtAJbuvDkm4s7oQFq7P8i4MmPYEz+ENPIM4tlIvOaCSy1Uf6uaqjdZoFxU6uFianuMl3RCACNT6LrWZWFgiBZu5T6ad3wpAPesLMBbvCekV3hjXkS4fO2+E/v/u5BQXr2h9u0q8HCS8zhKNjA5ewaQH7V6jnkiOpZUG2frVCd02GL2oegz86YltMjkV7X3q4d2eNTT3tVEcxf2trHUKknGyUrxaaTulX4IYWJVOrJPQKtBviVKMstoLp6kVE0ZiF0gorHMuQLUeKZaOhaQnQPlwdQ50mQLQF2eeE+gWFv9ZNa2BVl8PdfX0Glux5ATe50XY1/0thZo0VW+VpV4jPIKObhmlxaGOTHTwYwtlu10mdSA8QXKjQRszyE9PxLXCHmEnKep/9xclZhFVvT7FA5sV6om5NLg1sMsuGwtOvl4X5BfyKOHCX3DoRDsqs73VvxIR44jmYOYstiwDZJS6MdkSSMa5M7qdsJi+Z3tDNVxtpGGZSvhi61VGMr+7g0wUP4SS/1hw9H5ol1RhtEsacNkYrgVMPZ3zQOGAZGiuPqSfYh5W6+RElEtPbnoQPi5HerCyQB92R/gbyCUS6cEYKRXkORnobnlv5pUkMP/WgI9a1YIfN7acJOwhwv6NwTWET1iZ7VgBWkzdhwoxEvvGKk6AW2t4olzGfm4gbs8B9FY76KkfXTyug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h2oo7SaL9NLkwGMSuAp9j3d/fqP6olH5xCpzvEMCS1bIYZuRnE/ikx4wRXdJzCcj+HOI5bG6qTCH91eRaTHcXqr5oV5/YMBRY6+6IUsSh/8DE1FdU3vqF6inEDU/T4BPV68lN9vPNwsP0MJV6ZrkSuvJvckN4HBCufcRReBkBAs9W6cik81y1z3U0BcE9F/2yh7G049cqeV6nZNrN92QlbJ9ie1kt54hihWubLhaHcpDs4b0mYd0/Awzh0HmziVNCmJxDPOKal/TLzX+sQTSJlBKsBWBq2ctaDkzrb3m5TeKpjA5sfkzyXrjYqsis5pIqK48gEuiBXd0Xdxe7fgCGQBuZPU4GihuS7b7q8rR32JLaDcDXNimSG6c45aaylQk2zu/zjyj5XdYAflP+CWJxmtaqrNNEsYZb5cDdVx7mG1+hyjTBfq5GnHZi3cCeKes
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:39:30.5879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce572663-9cad-4f44-13a5-08df3355cc83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467

From: Prathima L K <Prathima.Lk@amd.com>

sbrmi_data was allocated with devm_kzalloc() and freed at unbind while
an open /dev/sbrmi-* fd could still reference it, leading to a
use-after-free on ioctl after removal.

Refcount sbrmi_data with a kref: take a reference in open(), drop it in
release(), and free the structure only when the last fd closes. Mark the
device 'detached' under lock when the misc device is deregistered so all
ioctl/xfer paths return -ENODEV. Move misc deregistration to a devm
action and drop the now-unneeded i2c/i3c ".remove" callbacks.

Fixes: 35ac2034db72bbbc73609aab5f05ff6e0d38fdd0 ("misc: amd-sbi: Add support for AMD_SBI IOCTL")

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima L K <Prathima.Lk@amd.com>
---
 drivers/misc/amd-sbi/rmi-core.c | 54 +++++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h |  6 ++++
 drivers/misc/amd-sbi/rmi-i2c.c  | 54 +++++++++++++++++++--------------
 3 files changed, 91 insertions(+), 23 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 95c9109101b5..e77f114c16c6 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include "rmi-core.h"
 
 /* Mask for Status Register bit[1] */
@@ -193,6 +194,10 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 	u16 thread;
 
 	mutex_lock(&data->lock);
+	if (data->detached) {
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
 	/* cache the rev value to identify if protocol is supported or not */
 	if (!data->rev) {
 		ret = sbrmi_get_rev(data);
@@ -307,6 +312,10 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
 	u16 thread;
 
 	mutex_lock(&data->lock);
+	if (data->detached) {
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
 	/* cache the rev value to identify if protocol is supported or not */
 	if (!data->rev) {
 		ret = sbrmi_get_rev(data);
@@ -384,6 +393,10 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	u8 byte;
 
 	mutex_lock(&data->lock);
+	if (data->detached) {
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
 
 	msg->fw_ret_code = 0;
 
@@ -475,6 +488,10 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
 		return -EFAULT;
 
 	mutex_lock(&data->lock);
+	if (data->detached) {
+		mutex_unlock(&data->lock);
+		return -ENODEV;
+	}
 	if (msg.rflag) {
 		ret = regmap_read(data->regmap, msg.reg_addr, &data_read);
 		if (!ret)
@@ -548,6 +565,41 @@ static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __us
 	return ret;
 }
 
+void sbrmi_data_release(struct kref *kref)
+{
+	struct sbrmi_data *data = container_of(kref, struct sbrmi_data, kref);
+
+	mutex_destroy(&data->lock);
+	kfree(data);
+}
+
+static int sbrmi_open(struct inode *inode, struct file *fp)
+{
+	struct sbrmi_data *data;
+
+	data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
+
+	mutex_lock(&data->lock);
+	if (data->detached) {
+		mutex_unlock(&data->lock);
+		return -ENODEV;
+	}
+	mutex_unlock(&data->lock);
+
+	kref_get(&data->kref);
+
+	return 0;
+}
+
+static int sbrmi_release(struct inode *inode, struct file *fp)
+{
+	struct sbrmi_data *data;
+
+	data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
+	kref_put(&data->kref, sbrmi_data_release);
+	return 0;
+}
+
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
@@ -570,6 +622,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 
 static const struct file_operations sbrmi_fops = {
 	.owner		= THIS_MODULE,
+	.open		= sbrmi_open,
+	.release	= sbrmi_release,
 	.unlocked_ioctl	= sbrmi_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 };
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 975ae858e9fd..ae084beb6c03 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -9,6 +9,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
+#include <linux/kref.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <uapi/misc/amd-apml.h>
@@ -56,9 +57,13 @@ struct sbrmi_data {
 	struct regmap *regmap;
 	/* Mutex locking */
 	struct mutex lock;
+	/* Reference count; keeps @sbrmi_data alive while misc fds are open */
+	struct kref kref;
 	u32 pwr_limit_max;
 	u8 dev_static_addr;
 	u8 rev;
+	/* Set on driver unbind; open/ioctl return -ENODEV afterward */
+	bool detached;
 };
 
 int rmi_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg *msg);
@@ -71,4 +76,5 @@ static inline int create_hwmon_sensor_device(struct device *dev, struct sbrmi_da
 }
 #endif
 int create_misc_rmi_device(struct sbrmi_data *data, struct device *dev);
+void sbrmi_data_release(struct kref *kref);
 #endif /*_SBRMI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 463a9a757464..456f17806107 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -16,6 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include "rmi-core.h"
 
 #define REV_TWO_BYTE_ADDR	0x21
@@ -54,17 +55,40 @@ static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 	return ret;
 }
 
+static void sbrmi_misc_unregister(void *arg)
+{
+	struct sbrmi_data *data = arg;
+
+	misc_deregister(&data->sbrmi_misc_dev);
+
+	mutex_lock(&data->lock);
+	data->detached = true;
+	mutex_unlock(&data->lock);
+}
+
+static void sbrmi_driver_unref(void *arg)
+{
+	struct sbrmi_data *data = arg;
+
+	kref_put(&data->kref, sbrmi_data_release);
+}
+
 static int sbrmi_common_probe(struct device *dev, struct regmap *regmap, uint8_t address)
 {
 	struct sbrmi_data *data;
 	int ret;
 
-	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
 	data->regmap = regmap;
 	mutex_init(&data->lock);
+	kref_init(&data->kref);
+
+	ret = devm_add_action_or_reset(dev, sbrmi_driver_unref, data);
+	if (ret)
+		return ret;
 
 	/* Enable alert for SB-RMI sequence */
 	ret = sbrmi_enable_alert(data);
@@ -83,7 +107,12 @@ static int sbrmi_common_probe(struct device *dev, struct regmap *regmap, uint8_t
 	ret = create_hwmon_sensor_device(dev, data);
 	if (ret < 0)
 		return ret;
-	return create_misc_rmi_device(data, dev);
+
+	ret = create_misc_rmi_device(data, dev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, sbrmi_misc_unregister, data);
 }
 
 static struct regmap_config sbrmi_regmap_config = {
@@ -128,18 +157,6 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 	return sbrmi_common_probe(dev, regmap, client->addr);
 }
 
-static void sbrmi_i2c_remove(struct i2c_client *client)
-{
-	struct sbrmi_data *data = dev_get_drvdata(&client->dev);
-
-	misc_deregister(&data->sbrmi_misc_dev);
-	/* Assign fops and parent of misc dev to NULL */
-	data->sbrmi_misc_dev.fops = NULL;
-	data->sbrmi_misc_dev.parent = NULL;
-	dev_info(&client->dev, "Removed sbrmi-i2c driver\n");
-	return;
-}
-
 static const struct i2c_device_id sbrmi_id[] = {
 	{ .name = "sbrmi-i2c" },
 	{ }
@@ -160,7 +177,6 @@ static struct i2c_driver sbrmi_driver = {
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
 	.probe = sbrmi_i2c_probe,
-	.remove = sbrmi_i2c_remove,
 	.id_table = sbrmi_id,
 };
 
@@ -212,13 +228,6 @@ static int sbrmi_i3c_probe(struct i3c_device *i3cdev)
 	return sbrmi_common_probe(dev, regmap, i3cdev->desc->info.dyn_addr);
 }
 
-static void sbrmi_i3c_remove(struct i3c_device *i3cdev)
-{
-	struct sbrmi_data *data = dev_get_drvdata(&i3cdev->dev);
-
-	misc_deregister(&data->sbrmi_misc_dev);
-}
-
 static const struct i3c_device_id sbrmi_i3c_id[] = {
 	/* PID for AMD SBRMI device */
 	I3C_DEVICE_EXTRA_INFO(0x112, 0x0, 0x2, NULL),
@@ -235,7 +244,6 @@ static struct i3c_driver sbrmi_i3c_driver = {
 		.name = "sbrmi-i3c",
 	},
 	.probe = sbrmi_i3c_probe,
-	.remove = sbrmi_i3c_remove,
 	.id_table = sbrmi_i3c_id,
 };
 
-- 
2.34.1

