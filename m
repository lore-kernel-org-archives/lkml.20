Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794313044;
	b=g/iIt/2YM8855qnsY+gkSHAOO+xXvNoT5Pei31wIn1QkrGyg6gQRPYprtdGLsRNNqrbq
	 z9yjSrP7z5jIv/oS+ogFdwB8ZZXD5xX+k9wekg28TMK0Z1rwHJR3ARD2v+wvTDP+ojjrz
	 UL372RIVhqlickMPXvE/hwtIXHrU+XjtOKtlx4G0kkItpVA0+TPHIXW+kVlHc+8aA3d+p
	 zQ/fFukrzbUyuNKhjTwkwsuVZCGViHSMxbVpOWVZ/ifgrTcK/w0exwvU7DNwdftQgCHkq
	 K9/aXxG3pwXFmGOXmh5O7Q/XTpG+W/Ylhw4jVHf0DPNkRVgVW8HuE6Retw3Vzot29Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	b=RPvH7MuLzPncmkg+vIuMbbfzv9/jN5oW3EVyyYAWA27kl4u4g+2IWk7t42uAqHU1L5bP
	 GRdkioTz2cOofO1eCB+UhTnkTDgpni34zqzfmH964AgNfVX3oS9ncVvQBZme6ruQ5e4Y/
	 vPc9BoTijzX09Onny+ZYK3VNSDzsl+FlsbMIKqkDR/N8N9wdayyoZ1IgQVL8UzpM2ovt5
	 HUgSWHoC4CLqpwNeXB0svbMtSqz5R22Jemj3u7y5jSPLfjwui0+OxT+iD/MT+1o17Rigt
	 teSdsgZGVEfKE+Iy98pl+2Bc//OTal7a66+6CYyrIgff3kClnedCVrLiKEWuxhI8LUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=oJRlRrCH;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=PPouQlpG;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kpfbzNb3;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0875C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0875C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=oJRlRrCH;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=PPouQlpG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kpfbzNb3
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB87LL1621985
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:17:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=bIkL3j1SUti+mxRknWX
	sGzjEHfZ++LfAOrCAj6OvBfk=; b=oJRlRrCH7UIDdZYiw9Ra5EEZ4rlg8/jcZux
	42aefQnFOPrJkgtJpKn5f7yJ7HPx/J4Kp8pYsn96ecPsBt50ds0itMfMI688mIHn
	DAUT7+mgkhe1UXt2Ywg8jYNyj06GoiKEyd4Ri9yCm6IPfz1Yn87VpBP3MPvx5S/J
	6zNta60pl2ZW5vuQPSoFwCIRciwMPLMukVaK1tYZEZOLWXaRLgGT6QE+G5vh/8D/
	uts82beTw5Getbkf7OHphOm/uhq8CMQkh2hYSei5s5UUUlv0wmu61Qfc9Sm6L7Vx
	zRF610TyJ4KOYi0gdKQcmoTt6U6MIeJ5QlUtVZoNiVvu/kDxzGg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4huh926xmq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794313041; bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=From:To:Subject:Date:From;
	b=PPouQlpG6gT/KWGGp8V7JHePu/mE30cCd85OHfOc6LjstMSlBfux9goOLfPwAV9Av
	 BcKTkYt2y09mSugpysvKuCfEmlElHZrOJUEGwGx0rYYfJw1C7E3OOGl9vNqz/bpLVV
	 e9Crhl8uQ4v3ACeCCN2+uhmUCnwFjQVpGxY6p4KZSUCDX/16mlYc1sui1ZcDL5j6CB
	 EInpUzE7UIzBn5OHhEkbPCBaspPA6VR8iFwZDTluFIXUVblNcKmS7d62P4Oh3jXS0V
	 e9T8DnnLqE9W68RbB9d65Shm9rFb7YiAiOIasbSGaoSoj/dDKwjj//vOZUHe/uidwF
	 3xrEDcqbow55g==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1ECB140517
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:17:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 09E5EA0079
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:17:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kpfbzNb3;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00106.outbound.protection.outlook.com [40.93.1.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B467E40235
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:17:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPWvVYZHHBpNVEHhEdREV8duAQc4iSHfvqsSHU/6Musvv0PC8Nv6bPZWJKyDWHM+q366OvgKNF1UmfjKqoIf9S72VXgAqwvZ+KQ8p/4pas+7VbIgCr/RGD8DAR92EkvUH35KKT4iSfmolAK6CikNzbH/c7+HhvrdeS49br05nq3gk4hPg9mtsBvnGxKtFht2C3aCJeKze8032TSwa555uRV+aXzywE/0TQzcPHaaU9oFqES2lJMVhG0tUQOv2w2cdu0uD7GtFZmD3Jm/D+GZBPeAvk7LZBB7ZOzi4DuDG5iqwEgfjSHBPXcC3KjLVcLOhrhP0ZVLAit44+uwIifuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
 b=h7R6IVRMOJLHfytQeE2CS+yWTBdHfTjLWmrs50HaWW2X0C1mMzmpffZMoHfDQjp/Ray1Mr4MYD9rhcDoOp7be/zDLmgulyESF7gxgZhd7fHggmFXWLVp0hHyVac3qGfHB11OkMCDdra6I0qrLhJhhK9s0bVehkk66EOX2YgOB89KhT1VztvkmWHNRFwkDt7LYpD2vc+LQagonXE0M5wdIvxmZVKj4EbbGw/sCkI9c9j5pNhaPm5pGa0DJCZaKZ5YFkS48MiANtxhvoM1vANaemIApHD/7tHdnniLgXVs7ldeD5jnt85eortY6K43wZU0ttQIyZIR3xjcJpdRJHSvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
 b=kpfbzNb3bDg47SH/RAO6gp0MSx9ZkYvFJuZ/YwdJdZEN3mR2tWseh8xrhRSkQXV4VteKJkpfaIZQZiKrK8AWBLtWh/NEdm98nFiJiCf4TJ5EZhwiPUUAConBLxWwJFdCQvVrb/mCYjGmMa0Timlp8ct/M+OuNzIlNM0EUDQAmN4=
Received: from CYXPR12MB9279.namprd12.prod.outlook.com (2603:10b6:930:d5::7)
 by BL4PR12MB9508.namprd12.prod.outlook.com (2603:10b6:208:58e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 12:17:15 +0000
Received: from CYXPR12MB9279.namprd12.prod.outlook.com
 ([fe80::c083:3694:3cd1:61bc]) by CYXPR12MB9279.namprd12.prod.outlook.com
 ([fe80::c083:3694:3cd1:61bc%7]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 12:17:15 +0000
X-SNPS-Relay: synopsys.com
From: Prakriti Sharma <Prakriti.Sharma@synopsys.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: subscribe
Thread-Topic: subscribe
Thread-Index: Ad1xDWfP59e2NpXVTCSOpgNw97m2Nw==
Date: Tue, 10 Nov 2026 12:17:15 +0000
Message-ID:
 <CYXPR12MB9279ACB15D1AFE1DC9C00100B9722@CYXPR12MB9279.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYXPR12MB9279:EE_|BL4PR12MB9508:EE_
x-ms-office365-filtering-correlation-id: 181dc493-6a42-4ead-3ecc-08df3f248eac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|10067099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info:
 9qS+bnWDxuVVRHEUccL3rU/Wkesmu9I4kZbseU0/BYye3qRjqyQ6mXYmnIi5JFZbhmAjmD9hxdfJ/10Y2/M6MSVOgeRN60B6RaX9NRg+lmFgpjcin3shfZKIwOf4V5tFWUVM7f+fiE3wjrDQ4/SAVQSV7tLnBhJzwFcLsPZ0cP22KqPkLOexfRKyFl4Xzvkeb655U/IKq/1K42CF3ydlOE5j3hdbcRH/NgXp4DAXqfADMWbStaEJdgeQZjQ2J8hs8qFzBWkfZUv0abUZWcuj24v/FG16Ny6V4gBugGrBv9oEsMrQl9RnQPjqesMut7bOSG7V1Vg7Tnz5sfIePLdmtNBBC2TLgpKde3+8tWj6JcSOiqZfksNHVZzoh9ah7nmk0c3ZJz47JAby+xzOly4IpQd+E2oaSTHGMeC4Nu8aQwIwMnTi3NSFStoHhq3pbwrvEqI2CfcoElvmaUWg/urwJw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9279.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(10067099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2Bb1Qm8KbXXEG2r/3xtMI9I9vcBpnxrGo1Ey1Hh+W4BbI8E7hE/hjgDoQi7e?=
 =?us-ascii?Q?GdhI0ouYIYA+AjZ0Rkt7Ap3wceOgCvqQfWOFIuvCC8VxFynit3vqWf46oknE?=
 =?us-ascii?Q?gUpLO6VwqXPUFqStIC0WVj7ZRyGCYAMHwx7M5om3Z2A6J9PqbP2xLSYpcB3V?=
 =?us-ascii?Q?6gNBNloXQ4552bKNkmWeQcFo8vIWVv/Z9wfRxmBTUSzyqSWZY18SVfrjezVx?=
 =?us-ascii?Q?nXZMWDD/6l/KtEr0CjNgI9OF+1t1IOLtDKJ6aWhYERszYCcFw2WArePYtDEq?=
 =?us-ascii?Q?3SYxzjtHlFzhJpfGFpjG8IsHeI+TZFSTElvgxPP10WE6AkslX5Ut/muRFTSN?=
 =?us-ascii?Q?2XAsvF5KjlpfzYkdeRWadxC/XbGWWrRZXEUCCXn+CWcwyeW/t8vRUH7Fa8k0?=
 =?us-ascii?Q?EW5FnDrOg9RNwGQqoFoUC91zG8T3f8D0nE1PO+kMRoGkLGMIcr+vUnyD0AkA?=
 =?us-ascii?Q?gt4WaKit4HeNVjCeOq+6HluV32+htkd1DduTkJllPZQHb4AslFV7sjvwkLQh?=
 =?us-ascii?Q?B/GNESR9LuqE5f2jcYZq5WokvT3z89P8LuXBmdNbxjtUG4JOLlyU9NzA34bD?=
 =?us-ascii?Q?Wl4Mpel4wH/zY7ecMqnp+U/4PFWdwA4Oi/w5IA8fTcxdo/wCdraFhHzRID2w?=
 =?us-ascii?Q?XAm/46qk7yIBY9GSwPM3EfcSrGKP81tMexTzFC91CfnYyov/jBEGyXt6TaNr?=
 =?us-ascii?Q?DGrotShHXMHckklVbffFVIh5R43haMKkssa9dyK6dI6A5jpsY/wCUcFnjokH?=
 =?us-ascii?Q?nzxFP0WFPS4PMBNDzE3OyhTilKv89YHXgWlDVfhUkAI7IWQN6yMOhxwMwJjh?=
 =?us-ascii?Q?9AeSBsvAeD6q1ZYjDvOjFaD3/xDOPUl3074TRGcBBd/A5Dmhfgc1ODUjM7qB?=
 =?us-ascii?Q?OR9q3cPO4OKWWZRTlEttXet1x8bJMnTwWzCFs4iwafFAMgCe5X1QYzDhJ8MK?=
 =?us-ascii?Q?RxPvSe822pTmLBlKCMiZRj4reY/jD+RksUrA2ky8KQQevBZoGSAdgJE7LoFF?=
 =?us-ascii?Q?IJT6GLBnyIwPAX7MAKDmlWf9WHkYsg1XSrvH+Vo3Mzh83wW+vffdjBeCBim+?=
 =?us-ascii?Q?w53pQYcEj0R2wmaY2xXq5gEITR2i+jlAVkfUet991c8g4b55BIpV+V4iZHWX?=
 =?us-ascii?Q?VNkzN11H+zXVBMjIThEneo+2e6q/JpzwviZDC+IULW+bpmEzG8c6HFDn2MBE?=
 =?us-ascii?Q?YDO1YYALNNaqLUOm2+4geC0dwCEls8rc5ei19z6u5DWL640z1N6rzBO3zQ2T?=
 =?us-ascii?Q?3Qrmtty57NynA0EjB8DMp46BRnfMXm7liBQNJVPy/mn8uUdKCjtatJLSlCRl?=
 =?us-ascii?Q?4nyHP2QkoXjgqidkKD1+oWUgSPS3QlniiHTGO757xi1gT1OrkREkQaGacBk5?=
 =?us-ascii?Q?+SS7Wfnvyj/D400IC3HmjAs1a99O9e6FthiE09TAFbc/N6IJPfDI7kvGyfsd?=
 =?us-ascii?Q?TZkVTg4URybdviBnnnH4bZ3ruMukHbmmjmWJU+PNAEFxedCw3vSAIS/MFLxB?=
 =?us-ascii?Q?O6o61+vwKk+siGRXQo1IILaT53XO37HtBavNc9031gYjBeHimRF6fQzKOzAO?=
 =?us-ascii?Q?b2k6zis7BrMlgXBzUt4DhMluo9qBV7CMGILeyouMiuxpQeGwnmpNuS3Njr6S?=
 =?us-ascii?Q?lDgj6w2xbpiTYTmzMz0rELUw4VHT5ID0OKRyhcB3XFtjKmRFDp+eWRDxFZVL?=
 =?us-ascii?Q?oReTFYQkQLbLWr53MEw5wSVQxOLouN5Pbm6Rc4nQzlYfDiWci2Cb/weNJvWq?=
 =?us-ascii?Q?P83ke8k7ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	umBtK7MWB5t3vEjvn3N2452wVhG5dyyf4LKi5PpHDPRjUGn+VTRVUVcy2J5e5z3e/lT4j4B5v6HkRP7t9zHGzjruLG6x8Py67i7Ks8Na9vxRhNX1PTtPbaqEgdYkE+g9RDECmclk8bF/woPt1MBVhIGt4VCFRTm6vJqFXRZvqWNM5pLFoZAw2ZrSDLtw/DChNz5N0rJe2deMwRdsa6PYnq4svYQGt5AI2LkDFPnqfV7IuIfG/3ig++bKgfeokwjekMYciCEwCS9w0EAz/pCU2mgs/D/PebT7QgoXRNttfJaX0vs7ud0wy333Dw1Q6jW92C12tbtSP86icfOUW8uMOw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UYnCxUZsjuLAFxAkJ+jEq4ljuVKSjE6l0/oinafw5XmTDGVSPkEi+ISs9zoOY288AIjOddpmwIxEI3oQ+36ZW11j++TLuJ4TQ81wLhTFSo2R5e1O1IWP9vLV6csI9BofYVQIem9jY1zLBVLQcxgt6/eEQeeeNcL3meymiwF16val3gQEk716QSJclQ3ZT7HqoA93HE6Y7nVrYICdNzUwSVO06MKgprDjaX+bXLQBxrlYLjBbMJFlFdZAdDBxxpgBnQzoeC2cHr1OYVwDmfKiQtem4KuM2uaPCRuJLVG4s8U1bHTQIp6lhI1Hnlhz5ykEJxbHY1N/AunBqFIWLEKVi6az5l9H0T8gh2BMArMremJcGVa+27B+YXIAHajmbMiW/vrDlFuSjSzz48SRBi/Ux5SBN6xze4kxxfXDgwMm/cwwWo7kbu9Cn9ulb/SB77f3jA8LUkXlGRszN7DQMKZ73ANHyPPaYy9GmWAtpWYIxfJgmOZHer/VhTba4HYn8GQnyTvSGrgO7LsZltFVC/3M4LzTcl1e9GXKfcbtzIJrVIYdKlxSGZhCgrfoLtWAh2APZ4Qhq9HdtI8Fx0Hhdugiu2WKMWUSnVFuWd/16QEeHpMXoliYbe0D5jRoDQhtw69SMY4EVZNA9rRRPYdMYcC3dw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9279.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181dc493-6a42-4ead-3ecc-08df3f248eac
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 12:17:15.4329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ueYVnAKURUy3pXGGMKQCHzLDkPFkYzWXjFwbu18fkJKrM0JWF3qy1QwAmsvdGCcNmDILVgM1jOXpllyreg/kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9508
X-Authority-Analysis: v=2.4 cv=HMBWhYtv c=1 sm=1 tr=0 ts=6af30b51 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=JV2eVSZHMSyV4Tj97bsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0OCBTYWx0ZWRfXyiChOf3mvwQ/
 zB3YMElvyD+hyiHOUdzOTDH07F3tyJhCQbCrtxkdzioHYhfTT1GUtU45BUimDN+JgoxoAEcFPEZ
 XB2AauI2AISdn+YtkAG7hbKtyAdE++6qtYPqptZuYHbxs/J5jjqii2/t5pEHNPd0xF83pGmqx0Q
 lq6icgJ5L92xS9yEOSe/lq+1GUi3RBACKRCqRHA3+0+R0ZVqQHNt0HYVrhvxXSR5NTF+ztfz27x
 HkkRYbd4PDZwb/Oeznuu8E657z4JI7RNrz0ionlNPAo77u4sjWvi5zMoB8XOF89+ZFmCtwZCePM
 FGFJA4GpcdzBG87UYnE/ZLdPfqU9eOBqfO8P8KVnJJOVcVNGIYHAE1u4giNDgoKnKfqqkYs42An
 yivf4fSdmTBhGZJpStXH40EfQ3MUtP47KhRghymjXycUGscOQsPVknoiFFizu1bjNiiK3ZH8ftn
 21h5HqQF3A+zWh+bbbA==
X-Proofpoint-ORIG-GUID: oaIbyyu_mmMSRxsOXEjzxLgWILgn8wFs
X-Proofpoint-GUID: oaIbyyu_mmMSRxsOXEjzxLgWILgn8wFs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0OCBTYWx0ZWRfX2MSA/Wnnyuf6
 dugZ7U6qAGmzZ3HuWYLDI9wYH/5oQe5wOD9Xh+UnQPSgZ02G7jAj51pV8KBDIu2HMUl3592m1Wk
 VTSYAQKm9exxN/NgZgup//JGrsAy/t8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100048

subscribe
