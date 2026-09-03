Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023132.outbound.protection.outlook.com [52.101.127.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD46443B6F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436665; cv=fail; b=cNUzl0zdSaAyJEF80e+cC8PEceozJcGakyWUxRIshDh7p7JhURYGld8LG0oRbC+g9XOoWyv7yCrjVp+4nki36Dd7JLqx0x4/J2SYPplEDFL4n2lNuW7WXqhq5D94fi535QjQhBdzKPvXkSnwmC8Eekjvn37M3Z0Sxr8CzobOPf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436665; c=relaxed/simple;
	bh=Du1RON49YmlOgksD4bB3g+/JL2sqFvAy4ybq2bPaZX0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sQB4iTWHT2DQRYWRWWtztrG4cR5983IoakeJedzNzBycfPf0lt8iE6p6DmWZhi1hoKfKxaPN9ezl2rd2F+CDsZkyHmmmdvS3ZPAnPUfrfwWt+p5g3lpruUAZDZZu1pV945zYlHK5O9E4xHghpSyJd08/HQPCEjtPGDcRADbA0ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=OSwB1nCN; arc=fail smtp.client-ip=52.101.127.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="OSwB1nCN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIY2Yl2gGCd2PDJZcPpihen1n+Q5bRm/4I58ghOLAqMMdP3j+fnQKv5gSljrQ+6EMWkyhtLxxlT/5WrGIXntziElNMvgD3KYIloCOPE/U0gIKuQk2CA6z579WZ9toZwwWHPztKKE1L8NaQU4lT35Gbm7wwjaecFSThcQirvsj9/1+c4Bdzz25eceHyX5zp2HR5HcenizqB1R005GE6FB+4dFFKuDuIrRt6wRXavWwN8DI+P3R/mbxnT1j6+MUqlCsIQsUYbq6WevVwnlrmlH7CAf8YFteoVwS6me4pr9BKqy45ybfqo0vM+xdLIA033fY2lvqWlrUPOAseiEiNkoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHRtCLNCkfzAXocZnziOsjCvdr49IzGqoMVPXOKajuU=;
 b=LUwtzqI6I17N1Bbf4oOJDyqv8JKHfzbqTtE/cNOYl5r7imu8LDYEvOHxOvN6zyRYLMCLGj5G8AAwqP7HwiI95gxfNjj4mdsyoTVPxCJ4QnOTRvuzu10dDA5NvcKCYaypWA4vVtXoO8PtGpveqHF3JLDWnabj9lPcPSMrWonT7676RNWHn7XW2QOdUlZ5YAFQLYywYjTqs3DPshAOaobGDyowpYRmuGa5Yw3e46c36QXL1MZo7N5J1CGTPKpIFuqLKEcKGlu1v5gKC6mYCFIC2kA2aHyJ6JOTab48Ri/9yz4VVeUWpcinLaypwYmhPJ5oQZwZvxy95EBsORS5oWmsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHRtCLNCkfzAXocZnziOsjCvdr49IzGqoMVPXOKajuU=;
 b=OSwB1nCNTN0aZ5+L1h1Bnr+Jo+Qab91dYG8Ln70A1mCYF1vYGLOfZcdDch8JDdDTrEBgzijj7NqRiFr5j7Jd+gdqApbJPDdHRQwVp0bFDEkMUHw0soocZRR11KNXd0Vd2/zALo4DgIGCB+SWPTscEk1oZKmlT8r/Fd3d7ryRqH4=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TYSPR04MB7036.apcprd04.prod.outlook.com
 (2603:1096:400:47b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 11:57:35 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 11:57:35 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>
CC: Jiazi Li <jiazi.li@transsion.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] sched: Convert last bits of deprecated static key usage
Thread-Topic: [PATCH v2] sched: Convert last bits of deprecated static key
 usage
Thread-Index: AQHdO5to2npikgiau0Ogb4Mq2LQMJQ==
Date: Thu, 3 Sep 2026 11:57:35 +0000
Message-ID: <20260903115728.11864-1-hongyan.xia@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|TYSPR04MB7036:EE_
x-ms-office365-filtering-correlation-id: e6de09e4-d69d-4995-c998-08df09b28b1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|921020|38070700021|6133799003|10067099003|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info:
 ACjIr03qjN/WJnfMzCmeaS0lrdlwEOWrnrar0IOFoMIjvDh1Qoh0ULFPL0AC/Zvs9zOrjcz2eFEtvRLooHBRdzjjNgHltxSjvA0CuERpP3rAxWKeFN32emK/S0c3sefO11mKpaP+C46ZYgukqlgchuZZNDBxbqwsU6XtdcmdyRxlRnw2hSSuiq5YRza1MgaUEhngNZKp4vk+f6q/HJ1VPAEOqGUXUVsXjNWzcspaRPNMCKeep048JdBM7bz2w2GjOH+EraNCU7uBUrWrqAJrPuLoy3+IozyDSFYJaZCbyZkvLKPM/d97G76iholCTpJ9OUdZ5nkDyE5h4dn56TmhircooQIrikYdi+YzOUpcFVJPeu0+USZoz6Kuese7B3TwHuBQe99DmtZCKlooYSLOiTPZ9eo01G/AxHDvejoxSXRbFljS2J1LFFfJMykkXGq8PjAEYZM+HB1IudVt1ctkLVCnHmmRBpcjodIp+B+y2T42E9naLXbaMlr6Asii6arEqCW+2/KnQZ3ugex+lvLmEKF+2mvCUDCgmo6P5EldYVsRPYCv1YaMkJ/IwfbSlZDah7IwI8tcQ1xMSQPZcQJDU5W6mwKjCiFHetuqN8hjU5Aup9/mt7f8B2QpLNs+gP6fFHYquRuWmfpri2FWq0x8hyegUh2xfZx9kifrI2YSR9EtnwrNSqh9glZrDpo0zRm9t6B0TxGKVCLKgQXN561VlnnuLhqsRZsYsLAoWfepQyWsFvGDn3Ztb1vf0M1+rMqR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L8a/bsz9HQefruxRByeASniTXVtgC/zRjaS6xqRswxDv5KjVcrruEcUGBh?=
 =?iso-8859-1?Q?g78cKcMvEh/9Gjfhz/1LqNn/u+CE16IZMgnIBGTkSN1vWZPJXEa7VmVM5K?=
 =?iso-8859-1?Q?B1sIrUAqHID1njsOIqSeo3kGfQLP8fPp3Egm1mttETFjXo+rZRXg8L/0vt?=
 =?iso-8859-1?Q?xituhldKPsJQVVN4JlIc9OxQbVtSynYVXiOgdDKlnyYW66P5mQhfy/m1Tq?=
 =?iso-8859-1?Q?jpW0C6pNsfYCfXZl89AOzTYNRa++5weCy61jQNROmfUphGB80ZXotprWkA?=
 =?iso-8859-1?Q?Acx1nrDqipzRcLcuHE4ZUfxOQs7YEmlA778rQRzbJdq4v8vRohWjgIi0b+?=
 =?iso-8859-1?Q?KM08xgJWPiTb4vZ8RxY+QjUSg0vwcOQx5IVPBvvKb936GNVKUEQsmfUu6v?=
 =?iso-8859-1?Q?vl8NWiE572xuuhRoa+w+qpM1W6I94rAdaVGuZXYe0MiNcV/pSeXfZedhjp?=
 =?iso-8859-1?Q?nVkjUsr9iZFYRbfuwcDE9eKhKfnpD6dbgMHHfLQga5Khf9zTzu6TWlyMAK?=
 =?iso-8859-1?Q?Er0o3ZM7FNArgMxSeSr2wZCsEcKODVwrF/tTVC+NZ8sttt8CpNnNaIBrdy?=
 =?iso-8859-1?Q?0fQT+kbXHOrQXEBoumLKkn0QrebID5vvUhlVCG2ZrisSZgqx/NIyhwNETG?=
 =?iso-8859-1?Q?m0GiRgpAfrTs974zVpQuJRH333LRaZsR+dZswK8kCBBZpPw5+eQPLyg3jW?=
 =?iso-8859-1?Q?M7SFcVbiygAO1fu1icMOKVZQcanxCfpuOCDijWc15jj80vr75mz3AXtZU1?=
 =?iso-8859-1?Q?Mc8NfzQvsjij+c5vmwExDa20HyVVVNUFskO+3mKA2FC4HVcGv5pfEcsyE4?=
 =?iso-8859-1?Q?CSZ4308U9zdL7hNBMzbmSwIt4uTpc8tkNY4DecxoM69C7Cl4ntSW0WJcXs?=
 =?iso-8859-1?Q?42asu/NO4UsJfWBBll951RsWC4gUPyLH5CiscXHEQo1hemw0CH3cFrYezk?=
 =?iso-8859-1?Q?HbwWcO2dBz1wxeLXJGZh37+P7KBxYvGkHJyNs4QlMPdG2CdjWqCf/9dfNW?=
 =?iso-8859-1?Q?ScaNcURkzL0zrlZZyx0Y1ipZveoWqbIJ50C+kUZHP1nKT72KjybM25BhIa?=
 =?iso-8859-1?Q?aHeNmC4EZ1iDR7uKyf+33sq73D/R6Nn6iK1ilcZI8mV0rFjcIXhojyj+LI?=
 =?iso-8859-1?Q?jKIiyiTDrTrp1d/87O4mpVNk+Ep+G9nUcsMVX6x3Gr6BAfc1pNbXIkAWkP?=
 =?iso-8859-1?Q?dZOUQAQlS3IdAzRS8Ne8wuwe3qlhMjtQQ9opshaXzNycp9fiijScybax5A?=
 =?iso-8859-1?Q?dPQd74xmRyazn7RBGw1AfB4VL/+5XiNRotj9q+sawHd4H4tIwczxfGNSl1?=
 =?iso-8859-1?Q?CLuYQAVMzMEKz6jN40klt+yElLYDkIAWMGDp8f3+Y0x76pcPIp2KfzTfAk?=
 =?iso-8859-1?Q?gvpziqYchXLVGRLgqlRjutpVjrAwKRCqb+p0bwfMAcjusajPv9w0NWuz1j?=
 =?iso-8859-1?Q?Hw2lZ9zj5py4ogPco5/xbxLSZSOzRdAmziLq2ttd1HLRV434E8POL0DDZt?=
 =?iso-8859-1?Q?Ev3alyeunpyEz7NEHbUeTKQcrHVtnY7dgJQcl0aYhfgW8kFHGkYEnDd59G?=
 =?iso-8859-1?Q?Ipv3+uyHtRpIVQCbNFb5+TYygajI1nep6zPED8x5iyIVOXfbRu+6b2c0ld?=
 =?iso-8859-1?Q?OMMb5cbHft1J1vKripCllv++VQP2VFBmXEbt48D9yridZULh+uoVio7Xff?=
 =?iso-8859-1?Q?fivnFug+mBVMsuOUfSCn+HLQmxhvEeq+F/NmjOxWLJKX9G6T2aSoZ5gVS/?=
 =?iso-8859-1?Q?X48e3hCYMC2/sAuyvkiBYlvs91DKOKVoLAtmnYvZxX8UWpsYMhSM7ZDfGV?=
 =?iso-8859-1?Q?vt6i0xhe0w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6de09e4-d69d-4995-c998-08df09b28b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 11:57:35.2039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dB9TyDzvNm2cKtMbDBDRZt7lRbgO5hWxK5uwRgb2VZhKAXBLFqzLf+7AwmW1r/OTU28vpYIhCOp2T/iGFh+pgUUUrrK4a6qxfj3XmRO4R5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7036

From: Hongyan Xia <hongyan.xia@transsion.com>=0A=
=0A=
Raw static keys have no type information and do not prevent mis-matches=0A=
(like static_key_false() on a default TRUE key). The helper names=0A=
static_key_{true/false}() are also confusing, hence the deprecation.=0A=
=0A=
We have already converted other sites in previous patches. Convert the=0A=
last sites of deprecated static key APIs. After this fix, scheduler code=0A=
has zero deprecated static key APIs now.=0A=
=0A=
sk_dynamic_* uses static_key_{enable/disable}(), which aren't really=0A=
deprecated, but take the opportunity to move to the new static_branch_*=0A=
APIs to be consistent.=0A=
=0A=
No functional change.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
Changed in v2:=0A=
- Explain why old ones are deprecated.=0A=
- Rebase and fix a big conflict in core.c.=0A=
=0A=
 kernel/sched/core.c | 8 ++++----=0A=
 kernel/sched/fair.c | 8 ++++----=0A=
 2 files changed, 8 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/kernel/sched/core.c b/kernel/sched/core.c=0A=
index 5a61650f12b7..792931f5ef13 100644=0A=
--- a/kernel/sched/core.c=0A=
+++ b/kernel/sched/core.c=0A=
@@ -7881,8 +7881,8 @@ int sched_dynamic_mode(const char *str)=0A=
 	return -EINVAL;=0A=
 }=0A=
 =0A=
-# define preempt_dynamic_key_enable(f)	static_key_enable(&sk_dynamic_##f.k=
ey)=0A=
-# define preempt_dynamic_key_disable(f)	static_key_disable(&sk_dynamic_##f=
.key)=0A=
+# define preempt_dynamic_branch_enable(f)	static_branch_enable(&sk_dynamic=
_##f)=0A=
+# define preempt_dynamic_branch_disable(f)	static_branch_disable(&sk_dynam=
ic_##f)=0A=
 =0A=
 static DEFINE_MUTEX(sched_dynamic_mutex);=0A=
 =0A=
@@ -7890,13 +7890,13 @@ static void __sched_dynamic_update(int mode)=0A=
 {=0A=
 	switch (mode) {=0A=
 	case preempt_dynamic_full:=0A=
-		preempt_dynamic_key_disable(preempt_lazy);=0A=
+		preempt_dynamic_branch_disable(preempt_lazy);=0A=
 		if (mode !=3D preempt_dynamic_mode)=0A=
 			pr_info("Dynamic Preempt: full\n");=0A=
 		break;=0A=
 =0A=
 	case preempt_dynamic_lazy:=0A=
-		preempt_dynamic_key_enable(preempt_lazy);=0A=
+		preempt_dynamic_branch_enable(preempt_lazy);=0A=
 		if (mode !=3D preempt_dynamic_mode)=0A=
 			pr_info("Dynamic Preempt: lazy\n");=0A=
 		break;=0A=
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c=0A=
index b8bd308c2d5b..d8abc940ab0f 100644=0A=
--- a/kernel/sched/fair.c=0A=
+++ b/kernel/sched/fair.c=0A=
@@ -6575,21 +6575,21 @@ entity_tick(struct cfs_rq *cfs_rq, struct sched_ent=
ity *curr, int queued)=0A=
 #ifdef CONFIG_CFS_BANDWIDTH=0A=
 =0A=
 #ifdef CONFIG_JUMP_LABEL=0A=
-static struct static_key __cfs_bandwidth_used;=0A=
+static DEFINE_STATIC_KEY_FALSE(__cfs_bandwidth_used);=0A=
 =0A=
 static inline bool cfs_bandwidth_used(void)=0A=
 {=0A=
-	return static_key_false(&__cfs_bandwidth_used);=0A=
+	return static_branch_unlikely(&__cfs_bandwidth_used);=0A=
 }=0A=
 =0A=
 void cfs_bandwidth_usage_inc(void)=0A=
 {=0A=
-	static_key_slow_inc_cpuslocked(&__cfs_bandwidth_used);=0A=
+	static_branch_inc_cpuslocked(&__cfs_bandwidth_used);=0A=
 }=0A=
 =0A=
 void cfs_bandwidth_usage_dec(void)=0A=
 {=0A=
-	static_key_slow_dec_cpuslocked(&__cfs_bandwidth_used);=0A=
+	static_branch_dec_cpuslocked(&__cfs_bandwidth_used);=0A=
 }=0A=
 #else /* !CONFIG_JUMP_LABEL: */=0A=
 static bool cfs_bandwidth_used(void)=0A=
-- =0A=
2.47.3=0A=
=0A=
