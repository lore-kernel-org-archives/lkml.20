Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazolkn19013091.outbound.protection.outlook.com [52.103.20.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37053F4DDB;
	Wed, 23 Sep 2026 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185370; cv=fail; b=gHch2N5hmxck5WsPWvX4flEq5FtH5V/XcMVwlCElIUFcFhDwGdQqqpP6dSzTD6a8d3RLTOiMfJA1Sr0iDrVbrgqtFFMF9u6qUvw5UzvnnIfV4z6z73QQ/RiH2MIP9WB4epYXLEszYnVI0SHjtbA1RRPdcgkk/TCWICOvMbiG2+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185370; c=relaxed/simple;
	bh=3/AME8EthVIJ2G93mEctns6qAIW1tLlbq2W+qpHLFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o0IVclYZ2ckQO0xM78J9SM3is+9gdpXAcd1z8bbkNB0SZw398XN2rGtbOjihO9MPaAHxDWzbq8S9CCH5sGiJydghIuz+Q09m+oKr1zdfQlofjD6tW8102JmfaTXUXJD1YOuW1z5XCrpUpVCfY8hat87Iv0tWbLDbprZkPtEnIbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=JGQ4X74D; arc=fail smtp.client-ip=52.103.20.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="JGQ4X74D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsUv/hQxhbF0oshzfrupHo20am+tFcK+dcxgjJMcsTAkQt2eYzXnb2AVOkiHm71EjUha3iXYC/iPb2pmOkc2dMX5nlmc5fITEieGj1P7+6/1U2Jn9AGHSiuAUFviXhNHr9SxZ77IttGNPot/I5ayS+I37ScZfHbBQAVtsDt7d92dmrThj7+gR2ALwX34Vh1F0HE0ospdI2EqSz37Otfcdb2SmxNmrP7mwmU4IH5J+5nA57+lS9x8ZttT6HFsdtQbA67ae9zK/UDv6HxNlhHRcBhXKKhNIKUZYYVcg2hiift+evjBkm7C6/LA/q7exGXc+l+TzH1ZwdeoSQUzGWpw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcRiY9j3eUmGFcq1KvDlizJEeb390bh0YDwIVmUV8yg=;
 b=j/TAb/HBiL/oVp1xNi/rzrb2UYXp7U0PL6KC/hAfSHSR9o83ZYLxFGIYpzkz9MKfL+iTMhIhxuU1Gbg/VMbKRShxo+yKVP3/j9Y/byKgoI0XO001mWETEq661ZmAPBEPI8n4b/npXA9BZtpghxjp8dQ9EfI8DxnLZV2/gJOu/BCImypirwAdLBLwl5X6ayoyPiX1NiiNOvCtnT8A8/KeBuZuhzpdTgpDFusfm5koS2G80darmb1N4m9Xczp5esd098EZI3l/0G0XUD1ndKeiJKLUnscYEKeykacm7czCSMK7NhEEfMy9duyd2YcwNwORHozeyqvSMCYxLLqr465GQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcRiY9j3eUmGFcq1KvDlizJEeb390bh0YDwIVmUV8yg=;
 b=JGQ4X74DkhNlTv5FbcbY+IeQxyx9auTSv6TYiIwvWfhpah7rFVNvLpYzeSzK9Q9On86BswnEm/7uRAiVgdXgHV82Yljuv+1gWittzPFnJN+h3n84M4nqYxiYHT9H/XPnbMIxYpltc4uI6Syo51wiD/xg3WCTEJbUPmF1utezWZXoqKCcj6VCslhSdbobmhgv0oC5LBNBnNcYSXlfj5RA4mDWTJO+Tp5YXId33kymOx27kyTJjKF52tYuWivvGPUWeg9wuJfFjpbxx9cgYI9Mv3a8+b+9LTtotNyB3+kbuqx1eXl/Dg2UzSKCqKWgvisC29qJ/aPJbRdCnyf1y1rqhA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by IA0PPF93600F82B.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cb6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 17:42:43 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 17:42:43 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] MAINTAINERS: add entry for AW88399 HDA side codec driver
Date: Wed, 23 Sep 2026 19:42:32 +0200
Message-ID:
 <SN6PR19MB23036B2EBA9AD55D12961FA0FC822@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008C2.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::43c) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260923174232.18757-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|IA0PPF93600F82B:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b19cf9-07f9-4f84-b059-08df199a11fb
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR58x9xairHPIE7kkF9Ssv23x7qO0g2CtGpgaZ8RztOi0/uUY5sWoIhG0LiNC1ZLnfh/uBf78lEzib85FI5f5NasL52ddukpcT1a1CUvwsagamb7VmuvPi/eay1+M0MqgKpjObhHZ2HM4jdDhTl2EkvY9sh63DdgYTFcfqf0FbZTqgq/6gOJdTBFqNp9W7HlkZf6PpURzDYNoL8bs7Jr0b86gETKB5tujf3GpEvxOtEgFQGyLgPB/TVZTMuSmqgiZqlyYvFXeSzvfqxGBf2qMf5DUgT+lkfZwqdxTmxc1mjzU2uULtJKH5u8xdlZZJPhYxqdEizFykWnt/QL9qGfPD2YweS0fmb2tx1g9BfPfU2kBn1moinWDiHGKMTMD8+j96R+CXTfqVuDLzpQI6Wc9I4mpK0IztWF21lKCoPv5XfGSJpdo0ZnuVMWRkdGVu0KE05yvW9Ocw1fdMET/emi8VCF5dB1Plz2fn4gOqD1Oglb+I/rHQZMdAzuE4GNhINvL0WUFHMXY3DzjwVg8R7Fw4EJWrLy1ioY1Gc1b2Op2pqLXzebBkB8FojP5inA0UeX0vPjYzmFvf2vAIP2mmkM/ajwzwoolzjrEHXX1X08WUyzosnmuQ8OZCoyYwblTpZ8ki7pLOQxzhbC3AqXzRTRyKJLi8PLB+EQo8M1WF8so4Ly6quWZiArY3OuhU9Vz4n7D5efhTX9Lphv2YFDx2kOLr/76/uv+NKO+sHTF4zi+lmSo=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|15080799012|25010399006|23021999003|51005399006|5072599009|8060799015|19110799012|24021099003|55001999006|3412199025|440099028|2607281247196008|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8qYAlHev/ykjIni691R2g2/G4RbS5Ml+Hhcdwpl+hoCtFUJ93NaxXCML4YoE?=
 =?us-ascii?Q?WcyXLVqE5swBeJkkRwf4w2VwnOK7ECqPtO9H8rZs7tKIzhPDchDlludC2AQw?=
 =?us-ascii?Q?6aRhQ0HRmFnSSBVTUtlsTxf1qeym0hMFT1AhBSOxzZ1ab9ep91snPqYbqMFG?=
 =?us-ascii?Q?LLZveDj0dj9n9QYzTk+ZZNx17aiPJaRBr/+8fBLVE4NUA+sV6UYTt4zzpEio?=
 =?us-ascii?Q?zZYGZ1HeEd/epJMgLCtAk10tCrikKD6fpurE8DA6yGzcTRnHdMAZG+GTr1J7?=
 =?us-ascii?Q?NRf3aCVBU9eaX3rE19GnHZs8qGu12EOt5VK7lNxWus8DjlADCxNIxw2Km7pa?=
 =?us-ascii?Q?1O6Km2vdZEJGwuB+sGmyCuNGtGOD8E2JD6bwFubdmC/QYahaycimPDG4Cy4m?=
 =?us-ascii?Q?q82EinIEmwqDfq4hyr9k0eE0je/q1EJrlH3RoOmGF9v5g0MEwdufLg1frAc4?=
 =?us-ascii?Q?y5oS6VoiIVHmtB/le12hG4ug1rNIE9BlOCieoeleV8nr5gpC6V3I594HU0aT?=
 =?us-ascii?Q?qFR9kWX/ef/lH0W6lZU80HsRXc2814lqvAntZF+JePG1v68UB40LuZTnmLdt?=
 =?us-ascii?Q?xe2wQmXsvyMHWS5+aADfGZLulESbGwteMgNpfUr3zPM8K7fV70aVIXiN/xDS?=
 =?us-ascii?Q?WVSHxRmFgSZqA5KB1uzVPRNftuNkybf7Tpn1YO37xYKlMOhWzfDHvcAfwuRq?=
 =?us-ascii?Q?TgCgRY+ka0MximaUzRGVkd2NqjoLap3bZk1SkKYeeTpP1cAJzqCQQsVO1dFE?=
 =?us-ascii?Q?mlV9/aog/DPcem4VYSetWfMLzYZ+IAqUpPqps0A7MElOgoKzYOZlQG1+NxCD?=
 =?us-ascii?Q?XkduoVBHESkpBYM1xITPynsMIvTGdx8C8stp0dPnEsffOFuLwnukv93bY1tk?=
 =?us-ascii?Q?06glo4kUlJVekwd63Pk9v9D1Gaxn6vewB/KVeGvcXsAth3WiP8VIukFo/SAh?=
 =?us-ascii?Q?iyrfFbPXrH9n2VyL6PgbIN8AflkN1PnsL+iGidrzOk1YN7WZ6f0hsrRHULly?=
 =?us-ascii?Q?dsFRWedLRm2VsXYfWmyUoa1EOQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R3M3SKW9FyILjnwwvQN2CQkPLXdfkMjYfsThu+PfFmUNlB6Tyw106358K3f+?=
 =?us-ascii?Q?46BuA/SHqyWeUscxbT0vu33YWtsyuIPLSohV6zRFQ7X7GIeE0Nm7v43qj0N1?=
 =?us-ascii?Q?D8yqZ5BlHRKCXNtJR65zZKDgUQOLut5uL5lmTGswehA0z+evju+ggGujP8dE?=
 =?us-ascii?Q?cOAtBsOsML42XiCQTpTjlYbT9uAyW66oJWj6YhPOIhOa51W4EbeOcQ2pSX+P?=
 =?us-ascii?Q?3nkZlJPBWlGn1rLFbSMNyZagZHEBZz4zCSfZp27b8g9zOim5/t3OfsR2OxqZ?=
 =?us-ascii?Q?eDWwe960kXe6qU8KqPgdkRhmMBBnHa+rLzt1T8Nu9/BpfrqjTyRkrnCWRkvl?=
 =?us-ascii?Q?o0ECLp7OxQK76EWEFM/XwGQn8wlS++yaJ34DZkiBfLtg7S/UQQ2nnx7zb3lR?=
 =?us-ascii?Q?t8cs66ZSBwsjW6naUXRlgFhCMabKP8NO8vXWHlCL0w8pT3wmRiuR7I8Ij5I4?=
 =?us-ascii?Q?MOkTC+1TJnicYny/UbuVndTQuactfpWSN/uSnEdd61JuJVd0MoTqNKKKYI3c?=
 =?us-ascii?Q?XBEKYt7ngwvof3Y6UygPUpzdUNnzPfi7mc0cCd/MYiUiffe1oQRRTlWmEWly?=
 =?us-ascii?Q?/CJr5tfo6geUBx4EmEYBwWHiKwKaTpt4jyc5oA7gLicsrDDJZ3DX2KE00zGX?=
 =?us-ascii?Q?w6K4A6og87qO5uPXHzYnP74z/ey7e0V3bL0bG1RUTh96Iija3F8QSEt0jdsv?=
 =?us-ascii?Q?65nfRJNM1vVOP8xY/WUVsSfVTq4pcmSdmqfrRHGk8rBDblusZOa1qf+MjXuX?=
 =?us-ascii?Q?851Up4YWRLa3aK2G0gCQ48vB3mYIBFW7FU1gJzg6ojE9eIGN5mpQ74TQsGzh?=
 =?us-ascii?Q?aPKFvaclT1XKmDCzvGU5dVfqJ2df88y5UQK7e3dZ3pbe3NXCzWkxGyc59cuy?=
 =?us-ascii?Q?K6HWayjHrR5M/8XdEs/Iqd2KLiErTFbJF7M5sQW1OlbjGa1NUjnXzSmwMODR?=
 =?us-ascii?Q?76m4WWRPPY7FB8OYOMfTM6T4SIzhFkAbvB6Zj7N2mOZVTHXDIrCJp3AsabRh?=
 =?us-ascii?Q?eiBQWa/FU8c/QqykmqgIW4pP+AAxxGJuT/WYWN7tZdm05b8nxkiaM3Ul1fwG?=
 =?us-ascii?Q?MjzpiZ9DnPdWIdMdyP1n38ycGUeWvogUZEgP7V7C4tbRTzH68nv7lNafxcP8?=
 =?us-ascii?Q?Ll7Ffh/74XVsh6ONzZSsRCAEGGW4edHKYm9TU5huMfmeuvBoqV7BNy7Xnzr3?=
 =?us-ascii?Q?BnDdOoloEtJI0hw24yQbquHWrUHnmVClsEMjq7eUeIru3C9Xw9F5/DMXi8tn?=
 =?us-ascii?Q?oC/NrU+8fOdv5Q2jCPzpvEFB4GMaUrpFMdhLRETrkxfufLEMlcx2gykM5S1r?=
 =?us-ascii?Q?VKnV0U6bHgP/MXHqEi4cOPUZfu7L4wBaR0U1azAPyP/X5NBLfp7/RglW7gXi?=
 =?us-ascii?Q?rXO2FeicoDp+vn0f9Ula0VtNQo8U?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b19cf9-07f9-4f84-b059-08df199a11fb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:42:43.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF93600F82B

Add a MAINTAINERS entry for the AW88399 HDA side codec driver,
covering the I2C bus driver and core driver files under
sound/hda/codecs/side-codecs/.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Adding a dedicated entry so people don't have to Cc: me manually.
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..2b53bef7fd65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4419,6 +4419,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/pci/hws/
 
+AWINIC AW88399 HDA SIDE CODEC DRIVER
+M:	Marco Giunta <marco_giunta@outlook.it>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	sound/hda/codecs/side-codecs/aw88399*
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained

base-commit: 71bbe4c12f6c2ab82a4f1eaa9fffbc8679a0b97a
-- 
2.55.0

