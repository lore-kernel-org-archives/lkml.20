Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5DC46AEF1;
	Fri, 11 Sep 2026 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117781; cv=fail; b=GrqcqCmPAsXDDLXl/IF1DNDz+GgSlplQMhgDumlcs3PDEHsT3W84Pzp4/3/D1NNn8tM1701iXIzjl8ScVKuLIPsQIIAd5r1Wl/o/96n3+EZZPTurz6cpD6SPehazYLtRLUVi8yVghTHhEvOqoBEfxun8s/iukCRpv3y3ZDoS4WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117781; c=relaxed/simple;
	bh=nV7C8cWxMZweOWVdSwg1ZJvbhUTvHcnhphENbbVeDfY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qWCpP99h6/O/hVWw66HrIRL5CFO2oh29XaXhNFy4b5d5kOcoUNhpZgaQW+Tesvc/DQ8ThWrCdg3+6C6qPBVAlE/+I83K7fqRAqwNODE7ZiLXT8g3cNPUK2rEabadJYqD5Vmd6qFDESQEe9VsaxnMp5Se7dfqj3JFZCByQuXGd9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tHzfJGoe; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tHzfJGoe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0qdjWie0m6tPA1BvzP4a+6RlGlW5Ox/gCjTA03/Z6ic4RD1KMexdrEpNqUWhwM3pS4V8uismK07/UMsS66zTyq2F5WnN+lhO+15Q7Q1Ie8BvjKFAUUnG+yyKNKbBFyVFXUEAHHbMBU8QINpqTBCmtEqMwMVqIWBdLYaaCqZrmnlYrQyBpQZ5Cw9nLSVuTUn3yYYl2XI44xYe8p6Na7yM5b95wjpFxH1/boeFGS3Etjxemqv95Uf35Ou1RiWyDf9tGQ/s2FnXJoRDa7ISGbJx2lF2rx+z9ErPvHmFCXrWiZWY7Lmmi4nBaansSWavWbh2hVec2PJUzXacUSlZTGSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHZieRsnx/aBCUy5f6suLce5a/bGBZVTLdgv+oITMDo=;
 b=IwYX8TcrvuVF6xgitvVEi9b34fGlJYCbIMV6rIOwJT+9tjh+mf5mV8wPLHRX2W4Q/rPGI7f/qaeuocZWhmmJB3fx/TJUnfHlMV4FCU0DQnVfXUVnjlgF9oOOmjg6QRwBH3f6z19iJX88bCB4Y9c4ctnNb1u8pZZUkNYvmKdULFTShqjQuyKDSsStHOtoMT0sPQoBGv9aMjHnUVTT7LiFXhyT1GwM/LNeAeyfggY2pKmUUqWZZUL4wJ7/7hHylISMVo3lHdWt8J9WfZNfbumqGta005uMnsTwufq6Yx4N4wBWB4FH5unyPazMoeFTCHrRTIqVrrjYLi6FEUnofpdyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHZieRsnx/aBCUy5f6suLce5a/bGBZVTLdgv+oITMDo=;
 b=tHzfJGoedNRZINvAd9yNTF7px7vRklEGISgV1qBqBzn1l1aQqFz52mp4HxdClsZHKVAXlzozj4jmfWFepAEP+R+2Yq+GAPP1NpT9Ii3C0IOPeoZEBftB0eaoo/B0ZWq5oIvruUYm2GXrFItczTX7yd0kqMfqEd5wwa+9X6gPQTbTFU/rvCyH1PsONNsvzWxRu1xxLc59HTh1URt7M3Z6t1Y099p98j4F7Cu9FOS8mLQpS3QDe1hCffpLpU4n/A0XXPiQmylS5aJs4EGXD5ADAcCVxfp7NjyMG06H2qU8zCxe4aB/2emutv1sERrNSdzw0B8bDSBO6tRd2t7PgliEMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7140.namprd03.prod.outlook.com (2603:10b6:a03:4f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:09:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:09:36 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v7 0/2] arm64: dts: intel: agilex5: enable USB3.1 on SoCDK
Date: Fri, 11 Sep 2026 17:09:23 +0800
Message-ID: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 733be954-8ae3-4e63-0fa7-08df0fe46711
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|55112099003|18002099003|13003099007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	3DZf6+dgHfB+4U556OKQNuSv/QlnXMPLTLZWMHYBIcQj0dDJBkilRkx60bUHB0m6m9RCrOpv5aik+QZfC4SolVtMQnz0OZvuN6Yvj7/4S//Jfdm7C/ESOo3QKkiTNPobJOaTvN+6md2rc/BikyWR4s3zeV6ABPetapPh2MOeQG+hww6Xay5avFsjKHAhrVxm1oYc4QoO/XHhkueJ0b2zOHbr6pY2jf624PHzJan3nwR+W54E7WZ2QNsd/7p0e2rg5ml9dh4flAMmp1THJFHv4elg8LOeXKtM2p8Ccvfv24bSRR8Wc7XrlcLEg4COSJNmHllMOzW/q0zwsuLC1q6Q5GBeCh4JcqfTHHjhH1DyD5YHjwr4THNtyjJHECspD0mtyFVfGUHJhFi+NwsxORA2pWMmeE4H7La/P/CJ2R6ZZd5N4c9qlo7yp+0I9GgDc8pvJ9O+Gqn4rH+ViBgNIdxxmZarmOzoM+7mQULjp6ol0MppOpvS9I8k/W2j+gn1vy+h+b6wh34yRhMSgTYCtpE1Dpxq1T9i4ltrMsfwwyCjyldgquGN9WO/9FQwID0mIQch3BmdHka6TyO5eJ3ZMjI1QMivcHEk/zQeoTlLGUBDFBvnJBZY+f/xgCg//OPin/Rr/mW8PxkywpFnSNye52bBGdrWww0O2s7+dC9MKl0Njr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(55112099003)(18002099003)(13003099007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cZb6qy1+ogcETZ3OSlrpyyToBtojjQCO9tqiJOkgA9QqBn2CPvbOEN+ojjyP?=
 =?us-ascii?Q?RcI9Ncsq//vmWuwqbyBwQcely70ditiZsxJOmX6iAKXlo68W6xyiowtonmbA?=
 =?us-ascii?Q?PlaC6SmAmawXbzguZjYvlyGV9BvE0jLSDfAW1AyFcd3UkLCRAOB1ntea2N2L?=
 =?us-ascii?Q?HligQUY880UjCyQpyK2MXHOuXK+R0Kjj+UEvo/eRx7elQKMFtJd6Ux9ksjGQ?=
 =?us-ascii?Q?PPZbYvOY4Bqp3JZj6S0C9q/tSPbjzSCUqauLIpMZVoXyUsGgUkx4cIYbPkvh?=
 =?us-ascii?Q?oRORsB/EFE37snOJMIrNeQwPmjXShG5Mmg8GGNgjJNi7/dbLuo0x38CVPGnc?=
 =?us-ascii?Q?QgRlLekPoayWtkKjP9Y1K6K0NS6QDXkjP+cU6jhkwxnd7g4CTNfBiqFgFLZC?=
 =?us-ascii?Q?BhkePa+zQYSsJnZQgFKt3VSINOLn+EpiquiROSM0knZ+W8Qzq4+FNCjspy08?=
 =?us-ascii?Q?CwUAI8ih69JI/1Q/1wKo3HflIt6ZfkMC9zOcU6T4AWRRRx2Yo5gtnWBMJesB?=
 =?us-ascii?Q?wbrN1ScNEOMR3/AgennyYi0iuyAAir49Ee6pBp8c6z0Cik9/dhhKHS42hVkT?=
 =?us-ascii?Q?zucJK8K7L09mHBjhWKWE2Mr75nDffIfnM5lG3Odx43nlVvJ8xl/1Gmpv2Rae?=
 =?us-ascii?Q?B4Va3L4UVaACZ1/DYdo5HiHCPUJp92JmLEZqxjbxGfASvN04hQAkunfD4tU1?=
 =?us-ascii?Q?9cEkv9B/AqSo4YU1UgqRGWV3QrbxOn7bq8ZlmlYAIK5GbBKfOZj3amzSCm61?=
 =?us-ascii?Q?HJkmhp8VRwjldrSBr6jS2BJAdijFCyc841WAY53u7sTQDZJIVPN2F7du4GA8?=
 =?us-ascii?Q?Pg+5YYVReekQIV2ednHvLl8fuVJfMRSRM93H/gmCZYpqCRBvmw9nmWuXKM0L?=
 =?us-ascii?Q?0xI5IQhO0P0Xt1iDslO0WigQt8tMdqKGNsG9XN2ZENzpdDn0xRxPQbH+8Zll?=
 =?us-ascii?Q?WgWJpLg9B5aRXq6mkbX5zhS+iNMcYcMwKxmryk97Yul2tQFoHJcIsR9nV7Ep?=
 =?us-ascii?Q?pozFlkxrPdk+zXSr7I1IG2yMkNKIvW5IPpaCAeDUkQOW7lYIH8PVpFLSie8e?=
 =?us-ascii?Q?EOSHeWOEu3Rg6TmdoleQQXJ6IX5to3OFvd9EtuhiTIm8uTBOS3SY99ajKV+S?=
 =?us-ascii?Q?dqW51BHWlRcJk5NhKdUrlL6pQwNk2nRAqctutiwITjgu6XOvwrrKw7852hXM?=
 =?us-ascii?Q?y1FpJ1n2wo7D2ObYIB7w9GbSVDyM6ssfGlFohGpKfQwk6PAZhjLMBs1tqVoR?=
 =?us-ascii?Q?/7B3nOyWLn4ZamxhBM5PgwGwlSrkxyvXp8fdtsUvUZRDgndI0H0hXenEe/a6?=
 =?us-ascii?Q?J8ndTyaNUI8OpLzW0YAuIjzUDD6yH3vPrBD98mVKPwAMrcdLZoVyWm9pfpxd?=
 =?us-ascii?Q?brP+jlBNzUkZ7CkRE9TfgQf238BVnWEjkjmfs7vveQlSNvB+CEVOEYcW+3VR?=
 =?us-ascii?Q?F5AmWYacX/dzWDCG5ZaFOUaH6V47+IwiajhwkAXcX7yGHYohQA9DeZlwiALH?=
 =?us-ascii?Q?YXY226jlJO6SvMV7KqMMdTcqyRYORRdG9ED2qGlKMLkNIeOa8BHaBcs7MlZp?=
 =?us-ascii?Q?3bW5yzL41jPav2Pbf+SkFAyOvwYcKqpnfWNl43ifRZtlUTy39dfvapaYaCs+?=
 =?us-ascii?Q?Vd/q+6P/hSSFpN+kZy2OUmCK/0eePUOklrFRvxqo0J0hsrnair1g6cBHEBmG?=
 =?us-ascii?Q?qr716iCbnrZXMrnHgDYO0Y9tF9U5esqwm4QGJt8XtBwYLZJb94kiNs+27oPF?=
 =?us-ascii?Q?r3CAufOoiZqFEorEk+MuAvBzZmTthgE=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733be954-8ae3-4e63-0fa7-08df0fe46711
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:09:36.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCpa0HlLGdUvl8f7M3M8gufd1+SZmok7Nkiy6Q0auKSja9SQmy5W9VJW1MBFrpOYc4e9w9BilvuGX3OHW+9cHhA/ntSf4wrRIZvLH5kX2NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7140

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add the Agilex5 USB3.1 DWC3 controller node and enable it in host mode on
the SoCDK board. Place the controller under a simple-bus with a 40-bit
dma-ranges window so the DMA/IOMMU stack respects the interconnect address
width when SMMU is enabled.

The SoCDK daughter card only exposes the USB3.1 interface, so the unused
USB0 (DWC2) board enablement is removed in a follow-up patch.

This DTS series is posted separately from the USB bindings/driver series
("[PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support"). Depends on
compatible "altr,agilex5-dwc3" from that series:
https://lore.kernel.org/all/cover.1789114385.git.adrian.ho.yin.ng@altera.com/

---
changelog:
v6->v7:
* Split out of the USB series into a standalone DTS posting.

USB v7 series:
https://lore.kernel.org/all/cover.1789114385.git.adrian.ho.yin.ng@altera.com/

Previous combined series (v6):
https://lore.kernel.org/all/cover.1788886615.git.adrian.ho.yin.ng@altera.com/
---

Adrian Ng Ho Yin (2):
  arm64: dts: intel: agilex5: add USB3.1 controller node
  arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 35 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  4 +--
 2 files changed, 37 insertions(+), 2 deletions(-)


base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.49.GIT

