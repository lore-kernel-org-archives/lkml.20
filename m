Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792692465;
	b=AfOBiKA0Ildtf+kuNX63wtpg5yZHWSplXRE8jTNxPQmsqzjAEYXkCRRhqokBmy7MO83I
	 88yTA5He6hIBRCYOTyBwWtGq/LXmB6Btj6zppk7cVXOdkcmf6gqQSEpEDnH5kEJ4je4Z9
	 uRqqwkOw9NMgUxQHUmt8ge84lNiO+tnjcV4pdglKYT0d2g2wJXUagRi3F7VfURuHyiAad
	 +NHeLtDhJUDkgRZNkbXpYnHJ/A7z8Ih8YXOPRPuLRDZzjEL8BEgi8TXIGwWdvPJSXOMpC
	 6/LE77FKeWuiqERFUqJOHEkJBaIFpIFaqZDIiVv71FV/MFku4LRE7XO5fk2JmM79x4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692465;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1uhVWx6ySEQCXFmJyPVIlHN+pjbIlzP4ihlj/F0+5FE=;
	b=OGb+z5y73FYJjUOHE4KKgz1kz9yFm+7OhGzd0PGhZKSVOE9in+XBSN5LF8hdZo8uNz+G
	 yx6NTN1nBdB90MLBPudPh7eh5Sl6lQKkGoKe28HXYehSZn3HusFBLy7qzS+86zyw7OT3y
	 b/Q/cmp2j75BqOOGopjZ4kKa+5SKmpV8YzZCrhrWBl2TlIQuXO5LY32ecSrpms8gwbwu9
	 Av64396jszMK28xA6OwvRwbUJl2l2xpoY+tqTUpjiUgmg+ALC5JcCB2eCV28zNXwfQTNI
	 SIQiWdC3JqlDft6LVRCwBznt1U4Dgq8WvK683owwIuujXVeLYHqZu2/jJZ9mieYxDqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="gMYp82k/";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=NIqXLrlx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB452606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB452606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=gMYp82k/;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=NIqXLrlx
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHxQPn3392738;
	Thu, 22 Oct 2026 14:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=1uhVWx6ySEQCXFmJ
	yPVIlHN+pjbIlzP4ihlj/F0+5FE=; b=gMYp82k/QVRWf1wIbwaFL4oD6UFtX8JD
	ETAO6jcALm3N4Y8yThjQk/DQkmKG9XcidFBjS3xm/yZJu+reJLbhgCeOf/Vjt7JF
	gJ6PS2/MwpO/sj58XtDVTKzSRRJPr16l9VcZ2FVestgWjBWkodNROSN98I/ZoJb+
	XchYHcK26xM5muOdMWeAcJpHbh3ZtV61ovnlZmp67rMfUYYZdDkCMlHGz62ZIGGf
	FCsqn+HUi35UqXwplH5vuSbcIo5LDKcCFq0Mzfi7TCjsROBIN1mvDzS7SaQmkhvQ
	0MXVjtAO2ELH28DcSEHecpBqZnxAE3OvyccjyvcjXPOlS8WrfP4Gkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=1uhVWx6ySEQCXFmJyPVIlHN+pjb
	IlzP4ihlj/F0+5FE=; b=NIqXLrlxkuZEr7vER+ZbUFX9PglXeMbQ7W53vSicNMl
	xwVQ6U4lLcMpw5jNLLRJ9loyLuFX3oUPdTWy4T9D7Id4ESTV7bdsr6li7UBtAbIZ
	rCfom/ipZVMqHHgn7mAJqT3jyxcpq5lQxUMIfO9wjByW9xrLD7+l84BNBaYvooi6
	x2Z1NM5dQaF8q3nw7lcIXHgnY+z2WMAms5MpSQt++XexBcyX1GUqBbtxKehLEFWa
	pB8QfKPYYxIfRqZl59QOawqWFjwfV2wzbyhCjepT/tm0wisD5TVa72QwGBDPW+nT
	4q7NbfLfGEQWsqNyDwMb3uWgrQs6cLyVr8AXDzF2KRQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hf9aycsk6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:07:31 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1PvJjJD2nValgkrnQehPrhBhNXudGea98Bwk1cPjhNxPV7KwCz/7JmZloaZzCRZAdKaZMnwIc/9xWDjN3YZMIm3TGUsCSy6D8mKwSprdIw00bjGw6vO44BY2rQdaMcoZ8dq5FkW9gfMoTDDwJxPAHusNi9UdOgMG096oBRPrpkD99kUqELVlSTRU8zEY5OmIKChOkvHiM+9OcrK/YYKXYicWrzdUSTR8rQBz4GBI6I4XhOBAtBQE/m1E7BDndhI+eyqVgQMQs2iD4CxFoQUzc3fxRjbng+amu9sS8XUKhRO4vNtN2acsErVySFKawepM0I0LdEA9a/Uk/D9xxpGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uhVWx6ySEQCXFmJyPVIlHN+pjbIlzP4ihlj/F0+5FE=;
 b=azekO1b789PYTSveSNGPylyzPp/x664SZ4Kt4l76L70jH6jYYM67CCC4HlETsrZQSAhgqgXT4HGWor4iE5WIJ3nrAG/RxRs00XcZOvTQHTqUnXykbHeAh4xN2NWGsfX6fGba2mi7MHeP0y8G30iGTR64wrGbSz8LUJ1JQ3DUhu1YxBsFXPaIkh8Aqf57mgPj4LbPS/lVtN0OxSLlge8s4jrM3Crz2KY7gc+/rmpfFiANe517ADwHOgYeTYW7/K9X4yJWYohD7rfACwlf2xwp6E150rOtA0HzOAAG+cMCvJyymzT3jU2wnWrEERZqdx46f5UhQyXcD92mFi5UhvgZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SA5PR03MB8452.namprd03.prod.outlook.com (2603:10b6:806:474::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 18:06:53 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.017; Thu, 22 Oct 2026
 18:06:52 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Date: Thu, 22 Oct 2026 20:06:42 +0200
Subject: [PATCH] reset: fix racy acquisition of exclusive reset controls
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261022-reset-acquire-race-v1-1-adab083d7274@analog.com>
X-B4-Tracking: v=1; b=H4sIALFQ2moC/yXMQQ6CQAxG4auQrm3CNASCVyEuhuFX6wKxBUJCu
 LujLL/Fezs5TOF0LXYyrOr6HjPCpaD0jOMDrEM2SSl1KEXY4Jg5ps+iBraYwM2ABtK3VRuEcjg
 Z7rr9p93ttC/9C2n+neg4vkRewsd2AAAA
X-Change-ID: 20261022-reset-acquire-race-7de7e2b94912
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CPAP307CA0008.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::16) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SA5PR03MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 09abf9b8-5137-46f5-f62c-08df30674037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261022075727099003|56012099006|11063799006|5023799004|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PCFphfjjyCeVqIR3HgJEuPZMfBPXPQZu1tMxmrnPOA0hoWPeXztTY4yERRJx56Eg2Sn0ZP14mfVWN4Fpx9txKwdzvm37jhF8zi/R0zMCxW3SvUlQurWEqQoHspKaIzEzbPA0T+v8VsV5YttYFiqj77XvMoZ+GlvPz5K5zGVWMBCmNCPBsUSgCE1W8YUzacsvKX0Ss4X86OV/YJhoPK+3mboi2/F315aNVt0bEFAvOLBVr6a4Vc6Uvp60Ld7UP8YT8Rj3nyLbb+Hp9+jy3BA5gZXO6LG2iC+w7bbtBq19hI78ISUnolC1Qcq9Qmfpl5fiAXT3/ehbdAsGxFmgtmgEFtoXN9PWpJ9CxXLCPHDunbHltU4u91/TF0u2XwHAlKdKCuuRZDa3t/FGxbqI6CYkkCEgpUuglJnsdk19jGWcsqKUaXVMXe4gCnkX2RxO+QrSTCWwzX5iSZ9MZCZtvFrEfaVuI2UhDX6KtUO7ozDWNsUmALmKwLcZcuENdG/Cd/n5yeGdetJxicayvwIxPwkWT0sT+zq1dKB0BwFbEae8E6quiR288/TogP2FPUpMyh+wYembuMXOaRUrouDt2ZuUnsFVCJ86ZN+t2vAM6/VQoiTdbTIk7aczxErcdpy7nnTK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022075727099003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZseWVjZWhOSERHVnlNc1VGZEx2TUJ0YVpodmVwTlNyK1BtcCtjendhV0sw?=
 =?utf-8?B?dHFnbGRLYXN6My8rNGtxdWZUcTNxZm9zNXc5eDhFcWd2RXlmWWlWWW0vOGwy?=
 =?utf-8?B?RjNJeE9hNWtNMzhMWFJqRUlRZVFud3grYXN1LzQwckJxaE5GUnJoN25paGNk?=
 =?utf-8?B?N0ExTGhHcXdyaysxb0ZsTGFFNURmLzNHMkJXakliL0V0bU9yMXY0dlpmMUlW?=
 =?utf-8?B?aFZodllLVUtyWlowVmZONWZGNmVVbTgyWHBEaFZYUGltYmR6ZGdqZDVCZi9m?=
 =?utf-8?B?VVFrc3dBTUpKb2hRNkxqMVdWYUQxYlRibmgxLy83MlViT0FQS3RXWTVwUitF?=
 =?utf-8?B?N0VMNmUwZzgvVEJSQ1VnbUJwam5JNTMyM0d1WE83MGE4NWZHN25hOW1FTkNV?=
 =?utf-8?B?dTJQcmFiYjVZRzA3Y1NVYVI3a3J2TzkwY0VDSStKM2UrZGdwLy9IV2VSNVFy?=
 =?utf-8?B?Nkc5N21TMjFLc3lxM2d3UUhBbTQ5d0g5RGxSZjZMUmtEWkI0VVMyUE9IaUQ0?=
 =?utf-8?B?RVRFbzFBVlpwL3JVQTBrVXBhQjdVc2c3RUcwbVYxL1FhTGt2blcwUzA0VkVh?=
 =?utf-8?B?SkxMeXYyZjRCUm9WdVljTjhMbHhTemFBUlNIWUNELzRVV2lrTmk4MXduOWRw?=
 =?utf-8?B?aEl5RTR1WHFzY21iSzJlTFFOT1JpQk5OOHlWcXd3Qk5rWDFPaGVxdDB3UzBh?=
 =?utf-8?B?T05XK1NXeEZLNE5EY0h5dVhnTm91THExNUt4bmptWmwrdlRTZm8zMmJIbjNn?=
 =?utf-8?B?R2VQWGhxR2o3Q3E5MTd6cGh5Rmh4Y2hwejQzM2JOdXhKTHVZVUtIVC9jek9p?=
 =?utf-8?B?a1RLblZpSmJQUHQ4ZkJja3J4b1dabXdkRkdCT0Y3c2JXMnpZdDEvZWo1anFE?=
 =?utf-8?B?cWRuQ2lBci9XeVNYcWZ2WkIvb04zcFhiVDV1YmFMZUdHSFc4MEtZZEdMMjgw?=
 =?utf-8?B?VFJNNEZsbitsK1duQmdZN3dnZ2lUSTJSUGlwNHdJcTlJTnUrdE5xdFRiK0tt?=
 =?utf-8?B?LzhQK3ZsVnc5R0ZmZmhBd0NXWWwxRlRJMWwrdHNreHNHT3BKTjBCRjUwdmpO?=
 =?utf-8?B?U0NTTVlDS3dJeFFGcmRBdkkxUmRTMHZMUkZoSE1xTjI1SHBvaHZaNUFjVVNl?=
 =?utf-8?B?VFpBVTREclVwaks2Wm5JSmpPSDU5a1pVZGJ3bmFYV1NlOHNhR0krZnprWS9C?=
 =?utf-8?B?YXI4YTFqK253bGhUMjR5SnFUbEk5YWtISFB1SWhCMi9SdE84Wm1UUFlXK0N6?=
 =?utf-8?B?UUY1cys2S1p2a2haQjVjbVY1VTA4WkQ1bEUyWVc4bXdGaTczUUVYcGl4TGpi?=
 =?utf-8?B?N3V1UTdCL2FGbUpwUTlhWVRCRk4vcVBETUsrZUNBRGljcllWSFQzdFhuRktH?=
 =?utf-8?B?eGIvUnF4UHdsbnJ2MEVmYkhHWmFvQnQycEdEQUREL2dCVEN3NnAxanZuQzJ5?=
 =?utf-8?B?WVZHaWFrR3pOZlhhZzhQOXJkVlZwT2w3WXllcCswbTRaai9lRFB6WnNRS0F3?=
 =?utf-8?B?dTdGWE9DR1dhQ29jOXhPQ1dVWDlFQjNiVllwQkFsN0taaEI0VDZlUEJYb3RK?=
 =?utf-8?B?SzJpUzJodFZIVyswY1lHQU0yaGoyKytYT0N0QkdWblU4cUFRenpCMjRML1pt?=
 =?utf-8?B?MVNCWXBVT2Y4Vi8zN25VNUMxa1YyOVpqdXZ5cGRMeHRSd1JiNkhIUHlzQWVD?=
 =?utf-8?B?cjljcnN4V0M1RHROUW15OEZrYUpncnZLbFA5cmxqd0Z5dmVSdm1tT2dCSXlD?=
 =?utf-8?B?UkdMNkhxRHJ2d0daa3czTGpNVlJJbURocWQvRTdNMWhmOW8vK3c0MGM1VnVk?=
 =?utf-8?B?WEZseHMrMTJUOWo1QkNibmFKRElLaFhYQnlHTHlhV0R3ajhMUERuWE1UM05I?=
 =?utf-8?B?d0J1TzdScnhMc3pISTJuZXFHNXd5ZUxsYXFSbUpjT2dicjd1Z0wwQ2pzOXp1?=
 =?utf-8?B?MUh3Mm1SSEJHbnNkZ3BxQjNENjJUSHVpNUlxVWdHdXhhTDFLSW5rVC82U3ln?=
 =?utf-8?B?U2NLWUNxWnRlWFFwL29USnlPWTMyTHZQSG5EWE5udmRkNVBSRXBLbGIrRWRB?=
 =?utf-8?B?L3BtSnh0YkZZSkxaWWdIRjIyKzFXdnFvdXVVMm94ZDZtQU9CMkNqd3E5dVF1?=
 =?utf-8?B?K2piSStKc2tOMktidUgvQVlzYzV1MitYNGxSbS9JR2xvdkVoWkVGQUQ3QTJS?=
 =?utf-8?B?RFdQYTcyaEFyUHdiUU0xVWlGang2UStYdkYrME1VRk94S2tWMkVDcFhMTS9r?=
 =?utf-8?B?Q1BRYWlwYmF4RnNNUjJEL2ZnN3ZHeWpXSzNGSzY3QUswZGpuaTNSSXppZDAy?=
 =?utf-8?B?TG5qYkRzSndvWkFkaW56Y0lQSGdYWHd0cGY3ZC96bEJQOVRaM3pydz09?=
X-Exchange-RoutingPolicyChecked:
	WKT/zN03b40fXGklu6x5Xe++FtWu74TYwioIDQ78N9iDBMTT0HaMUEPJGEq6RnSuaaVB6aK+9xkKZYS+tV98AerZGZKBHbsXlj6UZ8q+wMMaaGz9Luf7K2dRaFdRu3DZg5CMhlnZLbb6zKDFmfIS2hHvxd7cuAhiKVRjlasREvT/M/GsBodKw4UunK1GXup8UGgrEI2vMkqMgVn/I0fxbgggNygsURbqFtzEPvhJuwgSe3cE+YBjYdbYggdYFejWW78yveeYvOVCfM96jiIJKrVEsui5A/JEUC/kieRlvsuHBFT/tSVQVMG5zVvHx+SC+0XhT21e3M4Q1O0IwsEFoA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09abf9b8-5137-46f5-f62c-08df30674037
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 18:06:52.8434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyitO+C+DAzOXbGPLuLbyiBovTWlQXKtRdhOZIcESEeWUbtvueRgLJJl5nwMcvWd/Btccd9YVXf6m+Ad6sbGwZw/wQAg51wtQwRKIWRaJIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8452
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MiBTYWx0ZWRfX2jeEcFPIxFE+
 eXZLMljjvIdHlDtK7Tc20GNu9LQ9uwwBcLYbM2EUm1gBzwEozyQeY3TfXeLZPNLPmxc6bMZzcG2
 XJh6N0WcXL9dzJMfySFN2bTrNeifwGbO4Ooa6Q31vOW7TO2WbHGX
X-Authority-Analysis: v=2.4 cv=E+NYNqdl c=1 sm=1 tr=0 ts=6ada50e3 cx=c_pps
 a=hcnkadelB84e5vzkSSmvUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=r_q63ed8IK0Te7G2AZEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MiBTYWx0ZWRfX2iNExZmlkns6
 7v9N57aCXWnszyvKytZxojey/nFdCFBdy6q8RVYdXYN0JJZoR01Oec13NdAIorL+uX3qbFUFcpp
 J0Z5WkPULSjUqZZo8ZH4YT/YuDbWBnV9pa3iH8qNHmbvEr3QYr7653oLYksuEvW5E/i8/YLsJHH
 bNHtKyQ2CEmdcMzNq9qFQgbo84O8jUiKCDTmrE2NXqgQf7hfr9tBUF5EeZNMZk+qr2BGI4r7XiV
 61GP9PH/HpE8V5Q4zdIs925DCehrHmGb0XHSob7MlA8YbybaNUmSN1ypd1D+/w/no4XAeKylUUw
 1fIo+vKzjrMJP0m/SNI7JE3T5qBmCT+Gfi4aU61jx5QmBJKzF5spUh88hhq93Pr24TM3SaVHaYj
 qoeT8ZJp55owqdlRExE9zkAd4ea5Oxt5RAYIduTqb/E37iTTuxsgHuY7IUb1lxN60WjBVMvW17U
 TBMmPusSvULDy6VkVPQ==
X-Proofpoint-ORIG-GUID: WjvFvqLz9KufCT9CoKjoC1zNKrkF-vsR
X-Proofpoint-GUID: WjvFvqLz9KufCT9CoKjoC1zNKrkF-vsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220072

A given reset line may only be acquired by up to one exclusive reset
control at a time. If two tasks with their own exclusive controls race
to acquire a currently released line, only one may succeed.

Since the blamed commit, which introduced more granular locking, this
guarantee has been lost. The mutex rstc->lock was introduced to
serialize the internals of reset_control_acquire(), but since this lock
is local to a given reset control, it achieves no synchronization
between distinct reset controls, even though they may refer to the same
underlying reset line.

As it happens, there is already sufficient synchronization in this
function through the rcdev->lock mutex, which protects the controller's
reset control list. Under this lock, the acquisition logic correctly
validates that the line is not acquired by another control. But the
control is marked as acquired only after the lock is freed, wherein
another task may race to the same point and mark itself acquired too.

This is easy to fix: just mark acquisition while the rcdev->lock mutex
is still held. And since the rstc->lock is only used here, and achieves
nothing, it can be disposed of.

Tested under QEMU (-M ast2600-evb -smp 2) with some driver hacks to
provoke the race. With this fix, the race is no longer reproducible.

Fixes: 8c91302a29bc ("reset: protect struct reset_control with its own mutex")
Link: https://lore.kernel.org/lkml/atnZWUA9bc1btCix@analog.com/
Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
Philipp, this will probably conflict with Shengjiu's fix for the shared
reset race. If you want, I'll gladly resend after that fix has been
applied. Just putting out for you to check now.
---
 drivers/reset/core.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..70115233e951 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -51,7 +51,6 @@ static DEFINE_IDA(reset_gpio_ida);
  * @triggered_count: Number of times this reset line has been reset. Currently
  *                   only used for shared resets, which means that the value
  *                   will be either 0 or 1.
- * @lock: serializes the internals of reset_control_acquire()
  */
 struct reset_control {
 	struct reset_controller_dev __rcu *rcdev;
@@ -64,7 +63,6 @@ struct reset_control {
 	bool array;
 	atomic_t deassert_count;
 	atomic_t triggered_count;
-	struct mutex lock;
 };
 
 /**
@@ -726,8 +724,6 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_acquire(rstc_to_array(rstc));
 
-	guard(mutex)(&rstc->lock);
-
 	if (rstc->acquired)
 		return 0;
 
@@ -744,9 +740,9 @@ int reset_control_acquire(struct reset_control *rstc)
 					return -EBUSY;
 			}
 		}
-	}
 
-	rstc->acquired = true;
+		rstc->acquired = true;
+	}
 
 	return 0;
 }
@@ -878,7 +874,6 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	list_add(&rstc->list, &rcdev->reset_control_head);
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
-	mutex_init(&rstc->lock);
 	rstc->acquired = acquired;
 	rstc->shared = shared;
 	get_device(rcdev->dev);
@@ -899,8 +894,6 @@ static void __reset_control_release(struct kref *kref)
 		lockdep_assert_held(&rcdev->lock);
 		reset_controller_remove(rcdev, rstc);
 	}
-
-	mutex_destroy(&rstc->lock);
 }
 
 static void reset_control_put_internal(struct reset_control *rstc)

---
base-commit: 71827776667f4e4677a4fa806bcfb24d4b8dd9d7
change-id: 20261022-reset-acquire-race-7de7e2b94912

Best regards,
--  
Alvin Šipraga <alvin.sipraga@analog.com>

