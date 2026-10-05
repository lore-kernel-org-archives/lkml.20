Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AA231B10B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204737; cv=fail; b=gqqxRhVZFDJ/D7idQVcgekmF+YlXmcP2KYdyoDvveP/IY6v/zuHQJiDWA70x8b2ibrxXLQJzc/WcQKDOUI/PLawFOHpSEigWDVNiOU9lgGFQovTjWzBLMsBBMPtr0ix+JUlon1pIzJ3o17g/aA5hTW3AyvgqHOpFfggQpNGzUl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204737; c=relaxed/simple;
	bh=x3lZlAJxMgvsk1V5qLSa18bTxaX3s6YETKpAMcCbHSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dgyVqLSssVyL7N9KM9B9WQUVjYIlxLEluezJeH2ptkoKcoVDve0fsUaMNGVBYVgok8S8Ow8L7dhyzZtLq8ZBUo0AihMJXPPPQiNXLhZLz1QvzFdIEIBuuJ/w+EZP9t0CucA6A36SXFBWkAAddlKjaUhNuZDgmr7rn4VhO3Qzdro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=o+HYDcvT; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="o+HYDcvT"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CH9E32257678;
	Mon, 5 Oct 2026 05:50:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YWAO/XTQXiX8Z8pmNp0xpCemEQnMSWoJdc3wD7FxK80=; b=
	o+HYDcvTxJ+pdeQEy+H6O8GZON61QigL2WkNl51NaYs1zb3Z6RTKnh3KM1Hnahma
	mcPXzcybF22DkrqS4F4VfCKL8dIFpAbzndOeKW8kdk0IwQHSrvok2pZWr/pcwUK0
	u9f+S5VPMJgwqXcr351+VYcIVL0Oe7BT0J7Sue8hWS61a+5fGaIfKThQ/AhatrkT
	d7BH0SYLFHPvdcLMJcE/YeKjNgvlRfPFV40EdgEPDqHvNaAL6p68vuJ3tmlfhYnW
	ADQ5idKGgqHYYGTpwP3nRbs75tuRrhsQA+Vroxn+yFeaQw50215NdsyHtzL6TOdf
	5r8Q9T+APR6BsxPU07O/cw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021113.outbound.protection.outlook.com [40.93.194.113])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h2w01256b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 05:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7HV+InhZUCvEHhfz+8gFp50gM19c1rsJA1605YOvxwFr0Xg9oRW1uMFB9zfm0D6PSf+DomCqFZ9SJzjjB+nOWTeAZkkdYem93atSQQAv51bacvjeoKaIVLyHVVQCW/L6AuwUek2W/U8aToY8Mr+5g1KbvNqMDLJhZRnqYVQ0sPmiTdsDZS/tsmY6MyQVWNbophtVHg1PA4D0RGkhA6F4EtMTk/rjDBYlnY+ujOFRqhUp91t4YtJefwlDmV3BE24QyuCTnipiO5ZkwplEhWDQvliToNkGFm4LPImwVO1ALaWdZGTQvBT4Msk3WEcZSCia73QCoCsjhf5yV/JR0jBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWAO/XTQXiX8Z8pmNp0xpCemEQnMSWoJdc3wD7FxK80=;
 b=xggChznW2hJ8uYs5NKYNdVO1EQAaNu4VVD4A7h9LgJ7t8ntxGcQvQrKLrhK4FxP7wzojnNiQmCdzvqNryPYek9TlgLAVqXWr4qJPh3qIsfBBDGKJGIwwEGMZAz335B6a1PyUaBbc0ib3qP2pYbxUT2XZALSMgYcOYmkOXPNTxEKy6iTjKld79bbsblC2VTgnpmOLRFyX2jrCkQcRQmL6+yB+iylGfqIVxLbMvlcP+7Bk7z9z6BeqMuvpITyVB17IHAsSLo/al2nQBy56BGtPfCunO3jq+Ud3A/uSYpke1DFKeD+IB1gcAeX5ZMie8AWwBDJ8Ifb9TlfOiDPFkyPXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 12:50:32 +0000
Received: from SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced]) by SJ2PR11MB7546.namprd11.prod.outlook.com
 ([fe80::ca9b:dcf:8881:bced%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 12:50:32 +0000
From: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
To: juri.lelli@redhat.com
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        arighi@nvidia.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
        dhaufe@simplextrading.com, create0818@163.com, frn1furkan10@gmail.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Date: Mon,  5 Oct 2026 15:49:37 +0300
Message-ID: <20261005125013.324327-1-ionut.nechita@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
References: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0423.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::13) To SJ2PR11MB7546.namprd11.prod.outlook.com
 (2603:10b6:a03:4cc::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7546:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: cc597150-8fd3-48f4-b610-08df22df3dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IAfyZOlgTckn3s4h6VREOVWYH8/vGkpvb4laxQnbHJ2v1SvlsOiRPtgE23Ec+vp+4/kqrLjiTfS3B8RgUOuZflJFdqnCHxazj+UDK7FyPKIh4dYbHpc4wsNygyrO7n3DYMgu6CAdg95JX2JzS52AlnOXB8u9nsCj8/9YWLnUFAQ5JWCrgTGExceO91OgUCUf/vEor7OLE6xs96LNpQ3fzdMfp1CQJLZrUaOBG4+ZuHLSIGXZg06q8bdfYUOyocJ/QOjRbCGf+nIDO+xTBLDOjn/DI2SvF2scumN/TZerHdV0QMo20sXi9c4dkU01loRD5a/AurRB7ScykaU5nRlEm/2nuMTVFMfALfGgcIwdYmgIjE8gA3b+iT9G34EoDMWGbzSeNpdzG9O+f4TrgBq+zrzVy57evTKmzUQmsiR7Po0a7dtGJoadp7rq1/0RDIdkkqa4kJnjU7DjwClsenwDRNROf1Vib8OpZtkD7gTELNaY2Y+Q6C8SKN+ft5UdSuwl2G73TWFsdJyMBJ8N00uTJAKPBwh+BeWOvqvj0TQWkK8da1sLuhztk2n5VjdYM+ejK3YQsCsEuhuI0gNidVLVdU8wPslEem0Vi15ZL5mK8Slxcb3xxukRsAt69Qao3TmWAh1Hj2A0elwSUgEwVkToz9wgEKsgNymcevUQWfnBpqXfkEh7Qf7iU5++4PJG6WHjt42gsAHx9N9LnYXXVjNEpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7546.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BRNRC1J2zaceJjzVJKu5it36JhBbFiAk4CgypZSGSH7iZkuSGCfC5vAzaS/C?=
 =?us-ascii?Q?a9kzpPd0+CbqWrlVNDPIOk6XcgYXrtmbgM+hVrFpajIixAS6rrXmnqVS27BM?=
 =?us-ascii?Q?hnT0s+f5oxKN+IZwCnZchTKdHg600gmw8UvtLUmQB0VqXJjQ+FIpS8kBPf5E?=
 =?us-ascii?Q?4iPbhw/5UXAV/zL2gZpSmd+h/xOavpEKvLkEx35Or9oggvUv5jK0OILkVDfN?=
 =?us-ascii?Q?LlFk8p4+jXl7w6VJ9nUE4qFz+cN7rh6xJddJqMBpHZ0nqnbOD/ME5pGgip/J?=
 =?us-ascii?Q?my82WJa09YWXG1fuYisDTg9AUQTRNgrORyOpDyDz2cKM8POWopYhBX64u61e?=
 =?us-ascii?Q?sbOXZVC4TKUtWmqh5jsCzESk7JF2grZt9ziaisUMrpieOMJHpqpJWj0t7XEg?=
 =?us-ascii?Q?n/Sm76+1Npi4dQGxQxbet6wQtC1llL1TrI0rpuLIRKoq+/NGv2QBOV5XNV/3?=
 =?us-ascii?Q?qam0TpqUjyZJS88P3SNwBMPD532olR7vB8W7jj26FEDyOtC+F8o4nv35osWE?=
 =?us-ascii?Q?LHyM2p/m0YQaGa5JKr7ifGiTEKhxYSfTc3mK6zKRYBd8BryQS9DnRTtPk2kP?=
 =?us-ascii?Q?Ez7Q874w879NAQLyhLDb14GWGD8UTILnOcpcJCfUM8ReQBrzXI7bQ87hOS6m?=
 =?us-ascii?Q?jqrhZNJeau6ziBIrVtK+/fAH3CFbLFUH4WeWYMr4vurzF5+dJ17EGjChAcNO?=
 =?us-ascii?Q?ClYdBnAz7BdaRW13/fjo800Hz5iz3sobeCTuc12WNQi6OIg6nyGZOFjJvQf+?=
 =?us-ascii?Q?cy3ghG7dPoK3tYp+LdsOsS+7nMjmfous4kIMjGLebxUe+dRArM05QXqf5yD/?=
 =?us-ascii?Q?v3hoFfEBAbdG6RCww0qwbieRv5e447Axdppz0TZwejAMmkQMMphu0CM5HmJH?=
 =?us-ascii?Q?axySsJtesMCR4J6QkrzfaaAU1ijekvYcc6jD8O0GeunnzvZtVC24a9CpzAgB?=
 =?us-ascii?Q?2aDa4TpsD+IBhEJsZ+PM46uaWWbnkaXZmYWI+Z3NW+F9qVAiAQqbJ9vddilV?=
 =?us-ascii?Q?SiC/cvusM4+wwSO/VzKwN8Y6Z1eHqguAmvF2R2lmhHl8M5E0VwwVCfoTC8wv?=
 =?us-ascii?Q?Ni+i08IjyvQ+r6j+qrbacd16PF10RLRUBqkHdbG079lxAMFvdy4cG5rGKO7y?=
 =?us-ascii?Q?CJv20o9aEdHi+fR+DJm6CxdhQ/F/Nfo+zJh0zUT+GI3+g6cbI8+xJE+KOM64?=
 =?us-ascii?Q?oxTTEINoatNFRfwLs6SlzjKcG7eKorhTW4fdx9sYKQDWGKmeJE+s7gWN3M11?=
 =?us-ascii?Q?07OkpcABaVrMN+to+wetHpvvuuYc6SWjsjYzKrRvZxCGv0NbXrZcTZtbu8Yt?=
 =?us-ascii?Q?GFcNg4C3aW5kp2uc/NIqy5Avr+fuZ27sapnZ/68K1lMO2FLMjXuPGi9IcTTT?=
 =?us-ascii?Q?8BgRGsHaNzefZm1UUV83D1wtBgpOWst+7g4fLwbeRpPzwRVjaQCfH5MjuO3N?=
 =?us-ascii?Q?sdOJcTUWAIaCoZBsRSOxw4sw+h0WjroaBePZ8S3SDGzIwtVb/RXp0NhcTx7G?=
 =?us-ascii?Q?Y0/IjigADGuyxoz1BXBK9qrPO4JcD/vK8+l2RoobaJLYlJIG+ELjjjK8f6uM?=
 =?us-ascii?Q?Xo4mIxd1JEbhX16v0VDyf34YZPOQIsfVCWdWVQdqKaydIl/zt21Bql2TSjxk?=
 =?us-ascii?Q?Kw3kfttRZ8ZYu/xrdegbpRa/HgOuWBQxu/Vck3O8029fLFijNZfmO6J9Set0?=
 =?us-ascii?Q?vWNM9uwoWU6OgOST9/LjQb67ULG3eB8DCDlgrNgbRujl0mYF+MFhY5EwqzN+?=
 =?us-ascii?Q?FpNrWBKo0wUxMCNTMXYy0xKwAJNeqvs=3D?=
X-Exchange-RoutingPolicyChecked:
	Gtpenj6SGPFN3OJA98xYmsmZMQf5Z/D44j68wGNfFeojjra2xen/yJBydGrXvG30XJj+BepCNM6KH25+z9ocy6A9FIyEptVJmYCk8NWjyVQ+0BMQeDMgr3urSTjJ/jtebBi4vsKJs2ZwY2fl6m/zNpvEKSi3fgD+ABDFZaoznGZzySlZTdpq+3Kv1D89vBe1S4yV5b9JDkkRUyCGqdjOChD7Tu4aVvD5E5iuw91fnoG0EOzBkRJ+PCqUFXkFTEgOCcITAElR2R1RPp0cdM5BehL33DDzWRG+CsOH7ZoEd6kLs+CA1uyVc+tiGgwZsrdxz0Sc4hzISsvRhSV05JGDZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc597150-8fd3-48f4-b610-08df22df3dbe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7546.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:50:32.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Maycu3nVXSZ9WfRtjAqRNcatxVAngXHekCT9yyZGf0srVwhMKPtOaJf9epLI/j3DZJfo1yTAoohWd04YC/XAghIi95jrSXPGJqUZT8hgp2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX81fyzar4UJQK
 3Kf76gVyEVqGzNga4omf0nLhXu5rqjiIpMSbOGnTQyRhAHdr1/GQju80LpzH0Zsg2jHKuP9UgUL
 UbnsHaStlAE0GTjlEIRGq/nSDnwL4HAFa6ebxFdB+MjxgJZa0Ms7
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac39d1c cx=c_pps
 a=+jjOclGHkOGhuepu6R0Llw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=X_z1PM53mAG21iaj9jsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX51qgYuoN67Wo
 PSHaDykegovrt1JRSlwzotEkE1Tft/T7lfbvBH2lG+MM4UiRkMnL7jQpV2tMsKNBX93uPdtl33h
 Vlp3phmyqqPmjjOPMa9tGtdRrVmLISHnVy4hy+szL/lkTMVsIitJnhSL7L88ZuoHdgQC+QO/7sl
 mzesrjYyHZOPelCaYwvyMziJJlMaDyJchZm1UMtfYp3iZ8yaJwiB7xZNn1wfTAd5Tul202iDxcz
 tDzQZytzPXt/MyXj5yvAjMhjAdVhDeLJofddmYyAe36KlUKEyXVVEFv75Iasf207MhppK26mjd3
 djh0t9utYFoLyxk7/ogg84Yzkhbm90Bj5CKQ3atTeuL1a+DEoQpf0+UULY9IemPpSlYEshVTNDV
 DpDOANlGe4kSc0Su/t5g8zcJTbv4x5Mv3iAhl+CyVLFnr6EN6ng5KTVruJgZr+1ojC430bf5CJ/
 tKhgowE7S516Pp7KY9Q==
X-Proofpoint-ORIG-GUID: h4XgqeFe1i8IXMR2Ksej7gMCPaOcHZZh
X-Proofpoint-GUID: h4XgqeFe1i8IXMR2Ksej7gMCPaOcHZZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050049

Hi Juri,

Following up on the dl_servers_stop_all() hazard I mentioned earlier: you
said you had not been able to reproduce it, so here is a reliable
reproducer and the splats, in case it is useful before a v3 lands.

The setup is the one from my earlier mail (PREEMPT_RT, isolated nohz_full
CPU 2, fair_server defaults 50ms/1s), plus a churn of short-lived tasks on
the isolated core: a SCHED_FIFO hog and CFS tasks coexist, so the
fair_server is armed, while perf and a fork()/exit() loop keep coming and
going on that same CPU. That drives dl_server_start()/dl_server_stop()
through the "active contending" / "active non contending" running_bw
bandwidth-accounting state machine (with an inactive_timer in between) at
wakeup/dequeue rate.

When a stop finds the inactive_timer still armed, it subtracts running_bw
that the matching start never added back. running_bw underflows and trips
both WARNs:

  - deadline.c:239  WARN_ON_ONCE(dl_rq->running_bw > old) in __sub_running_bw()
  - deadline.c:425  WARN_ON(dl_se->dl_non_contending)      in task_non_contending()

It fires from both the schedule path (pick_task_dl -> task_non_contending)
and the hrtimer path (hrtimer_interrupt -> inactive_task_timer). 15 splats
over ~4 minutes on this node; three representative ones (both WARN sites,
both paths) are below.

The change that triggers it, for reference, is an earlier version of my
own variant that stopped the server from the tick-stop paths (the version
I run now does not stop it there and is clean):

	+static inline void sched_tick_stop_fair_server(struct rq *rq)
	+{
	+	if (!rq->rt.rt_nr_running || !rq->cfs.h_nr_queued)
	+		dl_server_stop(&rq->fair_server);
	+}
	...
	 	if (rq->rt.rr_nr_running) {
	-		if (rq->rt.rr_nr_running == 1)
	+		if (rq->rt.rr_nr_running == 1) {
	+			sched_tick_stop_fair_server(rq);
	 			return true;
	...
	 	fifo_nr_running = rq->rt.rt_nr_running - rq->rt.rr_nr_running;
	-	if (fifo_nr_running)
	+	if (fifo_nr_running) {
	+		sched_tick_stop_fair_server(rq);
	 		return true;

sched_can_stop_tick() runs on every add_nr_running()/sub_nr_running(), so
this stops a server that a wakeup a few microseconds later arms again.
This is structurally the same as the dl_servers_stop_all() call on the
RT-only path in your v2: a stop driven at enqueue/dequeue rate. To be
clear, I have not reproduced it with your v2 as posted, and it did not
fire in the measurement runs from my earlier mail - but it is the same
interleaving, so it seems worth confining the stop to the path that
actually stops the tick (as Peter also noted on the v2) rather than
running it on every sched_can_stop_tick() evaluation.

Representative splats (15 fired over ~4 minutes on the isolated core,
trimmed to three: both WARN sites and both the schedule and the hrtimer
path). Kernel 6.18.15-rt, PREEMPT_RT, isolated nohz_full CPU 2, Dell
PowerEdge R750. Short-lived tasks (perf, a fork/exit loop) churning on the
isolated core while a SCHED_FIFO hog and CFS tasks coexist, i.e. the
fair_server is armed and dl_server_start()/dl_server_stop() are being
cycled at wakeup/dequeue rate.

[ 3079.520930] WARNING: CPU: 2 PID: 410093 at kernel/sched/deadline.c:239 task_non_contending+0x242/0x390
[ 3079.521037] Call Trace:
[ 3079.521039]  <TASK>
[ 3079.521042]  pick_task_dl+0x50/0xb0
[ 3079.521046]  __schedule+0x99a/0xfb0
[ 3079.521053]  preempt_schedule_irq+0x2b/0x50
[ 3079.521055]  asm_sysvec_irq_work+0x16/0x20
...
[ 3079.521081]  </TASK>
[ 3079.521081] ---[ end trace 0000000000000000 ]---

[ 3087.363420] WARNING: CPU: 2 PID: 411091 at kernel/sched/deadline.c:425 task_non_contending+0x297/0x390
[ 3087.363525] Call Trace:
[ 3087.363526]  <TASK>
[ 3087.363530]  pick_task_dl+0x50/0xb0
[ 3087.363533]  __schedule+0x99a/0xfb0
[ 3087.363538]  schedule+0x23/0xd0
[ 3087.363541]  do_wait+0x58/0x110
[ 3087.363544]  kernel_wait4+0x9c/0x140
[ 3087.363548]  __do_sys_wait4+0x36/0xb0
[ 3087.363571]  do_syscall_64+0x7b/0xe30
[ 3087.363600]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 3087.363614]  </TASK>
[ 3087.363615] ---[ end trace 0000000000000000 ]---

[ 3087.363885] WARNING: CPU: 2 PID: 411092 at kernel/sched/deadline.c:239 inactive_task_timer+0x370/0x480
[ 3087.363948] Call Trace:
[ 3087.363949]  <TASK>
[ 3087.363951]  ? __pfx_inactive_task_timer+0x10/0x10
[ 3087.363953]  __hrtimer_run_queues+0x145/0x280
[ 3087.363957]  hrtimer_interrupt+0xf6/0x210
[ 3087.363960]  __sysvec_apic_timer_interrupt+0x51/0xf0
[ 3087.363965]  sysvec_apic_timer_interrupt+0x34/0x90
[ 3087.363970]  asm_sysvec_apic_timer_interrupt+0x16/0x20
[ 3087.363980]  </TASK>
[ 3087.363981] ---[ end trace 0000000000000000 ]---

Thanks,
Ionut
