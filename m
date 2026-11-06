Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982734;
	b=MOhOX+ceaCKDd1qqSulTNb0dyVIA+DcQXk8/ddYqHKJYHKMDFhM+CeGrLsel601drGcC
	 V9uUHGBYfD9R1oCFOWGJfOdDxzVISWjy4bOsPmiM8NOFUJazR9g2mRV1ySXh2fR9m8hKN
	 hspspdOmKSuzow6oErzCDWIYp6X8dT18seBoObjmH9fGpwxJjnjsvFzgoGSKc0Iq3LTtv
	 Txkbf/d6OqAmjqztcBfi5IlISaItIWPmRdXOUh5sCp3ae23pw3ovq9U6fpMOHlcPliO7W
	 bRhmja2AgxFY5citwMiYMdnS/Mbqty4uhFJWF9dMmgUAYoH/I2C8mPFjKbZIkDmsPMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982734;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwFqnKvDsjc0QVcgTjiBFTPnniFabKntXK8RUUi+Zms=;
	b=4jXDgAnL6X8prYFavqfJxaSsSzLLQkH/sNPWq6kwQb33gKfxuMe8arlQl6hT2XpPB3Tg
	 WSFN5ciuaHsTKv59QXEGWQhfBBjcBA1w0Ho79O3IbInZPbSZ9IVcvMcExeviweDJiYP2q
	 lb0bYtUw7+ZdsvtgT+FPVTTXh22u8f/CKagEuu4QFbB7k0iQmpd3608xyYVxdW2mqDV6y
	 vE+PmMpoiFGG2WQ97Ff4DdmlTas7RZnpwFJ1cR5CO6dS/iHvMRgiKLnfsf33XXQQHFP+z
	 Q9bzmUslJOAYJXhle7dw7paX6XFJPXKVXN7ivBGMP+jYx2xFLv0hgvoqo0I76b3tJJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=YYsv2YI5;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="q/xErc0S";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF3606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAF3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=YYsv2YI5;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=q/xErc0S
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F3qEW1282665;
	Fri, 6 Nov 2026 11:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=nwFqnKvDsjc0QVcg
	TjiBFTPnniFabKntXK8RUUi+Zms=; b=YYsv2YI5e2kVQVCaBe76aYTwxv9xvy05
	BC2xPAbQwTKLfuaKY05muufHF6k+cQpe/joaOZ0lUZfsMITO7lDS8k0/+bf3WolT
	rgIbs2aAZSJ3FZ94MMKUZOSx9fLS/SScyjixdslKoZXWxkVPWyufIA9JnKH4eDM0
	6F90Uama1E3YB0sIgNNhfUH6hKK9Wn+Y4dFlk75nNEF+xb6hvSqoHKeafsj6p4PD
	bPhVFCe40vCsYflLvtEGKaFUbks+OIOJnr7r3wkhUbzqY3msnQC2Lkd8SgV7oyiH
	Z/np+EuJe1rDSAVdh7XEHtcWsjpjzxkfob46aYOkEhkvNMoNd7/MVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=nwFqnKvDsjc0QVcgTjiBFTPnniF
	abKntXK8RUUi+Zms=; b=q/xErc0StZCUKwiYHaCKu8YpuRevowCygTnCcUOC6JQ
	eVWRF2f7YSrpVL6xb2eOZK2UbYB0TSBZJ2lzlXhxDENRi6KHW0cpQphpDq3K/zIh
	wGkkrfvkbn/LxbWbdsfw3coj6RgIkkagzPaSzy0hVjFZ1EQ9RuYS0ZwDWBqEbBbu
	tFwZ+SpFDq3JtaWUM4GQGb75Neajd9pWtwATz8JwIbkJwiqUCieDiXE+Jm55M/6h
	iIlknyKMHdkrjBwHV0C3g6cb2Pnn6LvCpSJASzQMYOxy8BGxnuzxcB9BLaepVNNA
	72Z+Kt1nzgCk8YP+lzX1a2adiAggXOxPIO+FLHJkwcQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hs3q1d8mg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 11:31:45 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8Au47Bto+ECKzqUdR96RY/Qy2NMFcxIzUONMdRMIHk3O5WbFgN5BWYYqc3KCN7by18lMarJeSJlKXEISNDHdLb0J4OXwQThlkLyX3YcKR9TSJX1tmxwwO/Ec1puY6vn50qV01Jd1ukDUgd/GJOTAXB1Vp3WHoM787EpiZ/M800wbbd5mubuDeBlAz812lkY7Oec1EwD4SKU/N2dBhc7A+QOECiuPXQKeRPGrVvTYguHWjsC6maq8E82jr4ROndyBcXJtCpyHy25+qK/zqnFoJRt1M4cYPhFMh40w//kFJPs2lV76oeiwSv72CUIT/ntpBaqKtw5ili1t5OaBLjfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwFqnKvDsjc0QVcgTjiBFTPnniFabKntXK8RUUi+Zms=;
 b=j7sXSmXUuFlU0LJzK0g6pPzmeqqoj/Z8BNOMwlTLT/cic9vbYCtprmiIYfkb9l0hbFZJLP8T+VxlE59m/FcY5XmKjBZvd3H1WRXUzhEhYsAzHZB4O+K9elTUzprwihv8if5L4qWrJG1esv1PyUBTq8cWLFNsWGvoZ+rboqEvoIjQScScFl1RQEs7Xhw33Oafa3iFoGdeDgYlBxsTxbyyCb6TFTgLLpcDYv8h7HGiSLsmIZZpeeYYxj8KEP8P0alGH+sL2E6nuUhoE6am0kH0pF6QTT6w0AAxUW+h8mbnIEOgJ6EWXWU2mm5V/iNHv4KSXI4JOaJL3lFi7JUKdj3Vlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SA3PR03MB7301.namprd03.prod.outlook.com (2603:10b6:806:2f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 16:31:38 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 16:31:37 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 06 Nov 2026 16:33:01 +0000
Subject: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43O0YrCMBAF0F+RPDuSSdLa+uR/iA9tOrWzaFKSW
 hXpv5sqLCuC7OOFO+fOXUQKTFFsFncRaOTI3qVglgthu8odCLhJWSipclkiwmloIPYMzgdwdAG
 OkcF23AO1uiiwrupckkj3faCWr097t3/leK5/yA4zODc6joMPt+f4iHPvPzsjggSbmRyztrBat
 tvKVUd/WFl/EvPQqP5S5hulEqVtY5o1GW1q9UHpXwol6m+UhvRXWdqsyNcazTs1TdMDUYZsH2s
 BAAA=
X-Change-ID: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793982782; l=11704;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=n5tixD4bf84XsSYIpWQP6iaYjR3rnbro4/adSUlOZFg=;
 b=nZcflSlucJ21um6i/L1msuuZfTbaZ6G99N12Uo+KPv+jTPMKL25gGykp9/rPhvVfe/ELWbXXf
 j/ZDzq/u55lBJ+02viv0HVP8LRt7AiVIF1mx2qXRtRf++3SqEzFavmM
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::32) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SA3PR03MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b90845c-22a9-42b1-4174-08df3c236dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261102123227099003|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|5023799004|261009220027099003|261009223327099003|261021121427099003|261009221727099003|261009221227099003|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261026121527099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	H28wwNEGORFUVMAWB/CfsxcxiK07eyR7WYCwvizT7xIXQxgumQzacFDR7Cl3h/jElAlCS213IPEz/wrhE2CHcBLvbBwf4l7W3wvs+U7uSGIKS/bE88a4kyvKkZEGMNlbskZNMzttTRZR5NmqLsKj38vOGnPdJCM/NG7014FEXAdVjzJpXwjngLi/DaJEMubf6ETWSEYaaM4UQsl8esQcUnmYmOMuoOqQ5CRfjF/kai/vCBxrWS6UNXz+w1qf2qEviQ7hQ4SyeeRBLt+bfb8ZnKkHUzdrbwRUquZKcYvP1Ho+Pv2M/GvlP/4c82dOGJXW//CVPSthDJ9kHc0XenN/q8vJZRLBR8NxIJAvBYg1Rn7IdFoXc+OQGeKqDTuGH4FD09WmBfWIRDkAk1JBadT2IjbhKawKnc1c68kk/97uRglfWZzxrKBED9YUOr3FcKe8VjwS3tmnyQ+1d1EcC2PXX5kqjA0zh5W1Rt6V/FLvO8NS1d/J0qAA3Y5C6cYdg+Nv/dHA2vJgfzEOxGUmL+uNOIt3BFpGHOlVxrbGv4Det5bUOyaW5nbNhkl/GpA1mN6d25YvWEr4469kW0flpwc4Wv7k265CcNJgzM0sMYfj9dg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261102123227099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(5023799004)(261009220027099003)(261009223327099003)(261021121427099003)(261009221727099003)(261009221227099003)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261026121527099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDV4TEN3clRXaUdUMzhPMVdWUG0zNEkyNnViMStCRE52WXEzKy9YZlN2U2Ev?=
 =?utf-8?B?K1d2c0ZNN3ptU2lBYnpRUFB6QnR1T3d3aWU0N3c4NTk0dGlPbHl5ZnJ3NzBO?=
 =?utf-8?B?dlNZOXhnemRCaThwYWZVOElSY0Qza3RKdDk4OElyTzd4Yjh2THNTVlRlQXNZ?=
 =?utf-8?B?Q0d1WmphK0psaEpmYXBaMytibnBPVXJaTGI3eUtXbzFwcFZkWXQwRzUzZ2tm?=
 =?utf-8?B?ZDNqaVJGeTdpazNKdnZjMjRSRjlWRDdSdDBHYkx4SStpbVFBRWlVWTNoS2Mv?=
 =?utf-8?B?Z09WczhkSjNtdFgxM0NlWDhRdEhFNW5DSnRsOEsrck1aem02K3laMnRoZU5M?=
 =?utf-8?B?NlM1c2lqWEVhWWI4QkViaDN0QXhZSmZ1dVpJK28yVHRIbkRPMFdVTmJKQk94?=
 =?utf-8?B?SnJiaS9mMjdrOVJkdStUdm85WXpoUGlpOW9aME1mQlVUbzQxSDhrNFpBRjZp?=
 =?utf-8?B?MzcvTmlIWXRxZGRFQjgxcUpxcStFOEtBeWJ5cTZWUWhSbmtBYkg4SkNvQVpl?=
 =?utf-8?B?RXdVSXBqb0pEaXd4SGJ0c3RSYSs0ZEZjbGlxZTFOTHdCbW1PbFVBNFNnM3Nl?=
 =?utf-8?B?L0ZNS1NVZFN4c0tRTm1TSHA3bkRaYm1qWSs5UTMxTHlob0Q0cEt4b2lkWDQ1?=
 =?utf-8?B?VFNFdXhaMjRnNWhsTytrTTBDZjBTNWJvTU1iY0RUN29YUzhxWUFUbERRSm9O?=
 =?utf-8?B?aVZ3bFZvSU9sYnVoVlhHVDFEMG5QbnhpTzdZM0FhNWRkZWNJUmxSK25YVjA5?=
 =?utf-8?B?MHo5OGpkQVgvSDF1MWZuZkRKMXI2R2NFckdSR3pRaWZzWUduNGl3RmJUZXpj?=
 =?utf-8?B?OWhzNWhTOHRQeVJTT2ZRUTlUNmlQV3lMRGlKY0xSd0NuTXFiaU9neFVlZmJy?=
 =?utf-8?B?VWtxMkhOdk92OWxEK0czOTN2dHRSS0EwSEFTQXBrcldwS1pHblFlT2kvWVU2?=
 =?utf-8?B?Wnl0RFpJYUhpRkFGTFAvUVp1cmFpMjQ2aWVXTGJHMG1PSks0WWFxMDRmWHpn?=
 =?utf-8?B?R3I2TUlmdWxsalkzSnpGYjVxYXNyUFoyMWVSNXNGcTBpb1hiZkNHUGVjKy8x?=
 =?utf-8?B?aWZtV2tKWHpOc2pxMnFjZjFCN2crNHRpSVVialVQTE9ZejdoaHAxM2N2OHdh?=
 =?utf-8?B?NHZ2NG95a0lUbmJVaEZjT1dlQ1RNY0dWSWVTWkdPdXcyekFSOFhidEo4cXRu?=
 =?utf-8?B?NmJTak9VSEJiKzlNdndYamp6aWNiVnd6Z2Yxa1hKd005UnlpenBOc3hoTlcy?=
 =?utf-8?B?VU1taFBZNWlvNU51MGNRZ2wzLzU3UzJQdGhCR1hqQkU5UFFQOGNXdlVUYXkv?=
 =?utf-8?B?ekpKRVVYUWVyV3p5STZVU0xueHdJVFFQeFp3elNJOHlvaU9mbWt5VUJIQkFi?=
 =?utf-8?B?UUVBQUo3aFNMR1hmbldwQVE1UjVvVUNWRmxwa205TlpvbXVvTXB6Mm5YZlUw?=
 =?utf-8?B?T0gyV0tTaGlPOFhac3krbmhrdkppdzVRVWZhKytLbWJ1UXhuZDJhQ0toL05S?=
 =?utf-8?B?YXNJNS9tZW0xOTM0Mys5d3Bob0ZEa0xhc1dkVHlSWGp6UlhsM1lVUW53QW10?=
 =?utf-8?B?QlpCdW9RRTlya0FOZ1E2b0hLLzZMYVJ5R0NUT3o5LytEVEREa2c1UmdvbkNM?=
 =?utf-8?B?RlViZTZwQUg5cXRpSE5xSnAxanUzdkhEa0NhVDNwZTI4cFRnbkdzS3RrN0V6?=
 =?utf-8?B?Sm8rVzBCVDZDUmFnY1hOL3NnU1hDTzlVTW5GdVgrcldFQmxVdTVudlZ5eWN5?=
 =?utf-8?B?UGRxa1EvV3lDYmp4TldmWjZrZ1FMRUZvREpCeitDRzBhaCtCRk4rY29pcnRp?=
 =?utf-8?B?OVNxN04vYXFtb0NhRjNhZUhQM3RnVnB2RlQwa2pHZkhMdmZZT2FqTG5Lak1H?=
 =?utf-8?B?d0IzNGRRLy9RRW5oNFh6SmhNZXR2cDZBOHFZb2xMeHVVcEFKdWNpZUtNaU54?=
 =?utf-8?B?ajk3MmtqRnc5SGZCaGFYVkZGMXNlOHFQQ2lHZlgxOXhTRW9ZM3BuZEtJNTF3?=
 =?utf-8?B?eHRaajlBYUNsS01MdWZPMDdNTVJCQnZZdlNkWURhN0srYWJETUNRaXVNTzh6?=
 =?utf-8?B?cWMyMzdySWpWM01rOFhBdGlMUFlka2NjamZITzgxa2o1RkMxajYzTS9lZkdH?=
 =?utf-8?B?S3lrZ3NxTmhyRHFETmtzc2VKakZsaTN0eisxL0dRb0tGc2Y4a01mR0tHOFJp?=
 =?utf-8?B?MFJDdVhFTG53VFhiaFg0WU5FQ2xzOXhrNFc2ckl1djhScDUwbWRHZ1REYVVU?=
 =?utf-8?B?dnNDN1RrMGkxVXJDb2Y1M2MyeWRvWU0zRklTUVN6Y1liaWtBN3ZoUHdrVjUr?=
 =?utf-8?B?dHNZeUszajlUb3d6MWNmWnVCbzVqd0VSTlpDZlcwZ1g5OURzZWJJdz09?=
X-Exchange-RoutingPolicyChecked:
	GqmdGrQn2IsjNIKXAZEiV6PWoNHSQAlirf2uqnk7exIKFNb5x2EfYn/0kcRCZTKEhzI3EbMpvPDM1/GrU8uyr+wA7CY+5zkMQBHq0t1eXjKh2brTGJ8gS3SGyLZTogoBiG2DUv0E0Ru0Kpwb70rw/Lc+cWprwYLfuCeSR69XdkOZDQs0sKHHNTeN678+566mC5Ts4uvus0nGLa5IEjCkEIBy/Cjo0Kek5u/1uY4efmNaODxhXDzGfgPHzU8SVnu75WYm5OK6OchZRVRp0R6RI68K6czNeqP4s0dINeYBgibwrhHH0Xm9s6tsN9wv5JxBqt3eRVodSazfp+gJ84yRhg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b90845c-22a9-42b1-4174-08df3c236dcb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:31:37.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQbR9croAoqHSguk/jhuwB58d5oKzxAxZiB2FZwlmb63gWgR/uOJT/Z7LLTi0PlDX4favPTqK71R3SJZPxm04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7301
X-Proofpoint-ORIG-GUID: 9_dEYOqqWkjf6se-oygGRp2am5Z9TEsI
X-Authority-Analysis: v=2.4 cv=EqNHPicA c=1 sm=1 tr=0 ts=6aee00f1 cx=c_pps
 a=0Za+SRInewOPUeHoNPGlYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=DUnRZS7UAAAA:8 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=jJUWSVYjIC95gSWSojYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cDzw7mrAGmWHSR5u0tpu:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 9_dEYOqqWkjf6se-oygGRp2am5Z9TEsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2NSBTYWx0ZWRfXwuZelnOjTJ8P
 0oA3jIUVDXtWesdR71KPg9+Pw3RiYZPIUAYMwtvOH2NZBaxWCHFzsmxGqD7gSyeFNOJYm4nCKVl
 nUFjfeV+BXq/oE7wKdlDucvo8oepqP/iW9Qg9cmxGj5ifStZLIs6GX3g+wuJPTxgMKA8O2YPyON
 Cw+1LTcyAgEGxp9B3am8j2+QA2/97nyUlZzm9AR2tOYfflBccjPXbXdiqts1ebCnLJD35o3fFad
 Dx5ovHbNV/qg0yskqHu23oDbuexT+l3XFP8Q4I4PRIRaSxEiFPdZBoC51APbhyGa++E6w11AMPh
 smdRsMUa3lu+7YWrknh2En1KKFjL8smIHnz41tiNoyA1UtntVun2Dtw4H4AxYVkZR1yKmuLoJnx
 bKCna9kvpmhPzLZLZ5aWbiTxdX/VLDSgDaU8ly+ooporgmZGNs41zt9KQTWPvzK2mCBM2ySNvgx
 aSfZRu+/4vA4v+aoJsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2NSBTYWx0ZWRfX1grGajTQuggM
 t6bHC3HnbM++HQlFV7bHuyF6bez81oDnIk81ffern9I8M3cxhse50HiiPNvG6hYCGmIRfFieeZA
 CoZx5NpsUDd8N4rjFj7ESZs0w5PVMUQj+VccE5FDMDbEeM2Dgm7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060065

Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
The part is fully described by SFDP, so only the flash ID and small
post_bfpt and post_sfdp fixups are needed.

WRITE STATUS REGISTER (01h) takes a single data byte and only affects
status register bits 7:2, so the default 16-bit Write Status assumption
does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
path is taken; write_sr1 is already set to 01h by the BFPT parsing.

The flash also has no Status Register 2. Configuration registers are read
with B5h/85h and written with B1h/81h, and the 35h Read Configuration
Register command does not exist, so clear read_sr2 as well.

Software write protection is done through the block protect bits in the
status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit at
bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to get
the generic locking support.

The flash also supports 8D-8D-8D, but this could not be tested. Since the
SFDP has no SCCR map, the core would select 8D-8D-8D on a capable
controller but never switch the flash into it. Hence, drop the 8D-8D-8D
capabilities in a post_sfdp fixup for now.

Note that given that the Flag Status Register (FSR) handling is the same
as in some micron devices, we're adding the issi chip directly on the
micron-st driver.

Link: https://www.issi.com/WW/pdf/25LX-WX01GB.pdf
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.

The Flag Status Register (FSR) handling is the same as in some Micron
devices, so the part is added to the micron-st driver. It is described by
SFDP, so on top of the flash ID only two small fixups are needed:

 - post_bfpt: the flash has no Status Register 2 and WRITE STATUS REGISTER
   takes a single data byte, so clear read_sr2 and write_sr1_and_sr2.

 - post_sfdp: 8D-8D-8D is advertised but could not be tested, so drop it
   for now.

Changes in v4:
- Drop the untested 8D-8D-8D capabilities in a post_sfdp fixup. The SFDP
  has no SCCR map, so the flash would never be switched into 8D-8D-8D.
- Add a Link: tag to the datasheet.
- Fix a typo in the commit message.
- Link to v3: https://patch.msgid.link/20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com
---
This flash is populated on the sc846 board and was tested at 125MHz
using the cadence xspi (cdns,xspi-nor) SPI controller.

(Note that in fact the controller also needs some patches and a new sc846
compatible to integrate)

cat /sys/bus/spi/devices/spi6.0/spi-nor/jedec_id
9d5b1b

cat /sys/bus/spi/devices/spi6.0/spi-nor/manufacturer
issi

xxd -p /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
53464450090103ff00070114300000ff84000102a00000ff05000105b000
00ff0a000108d00000ffffffffffffffffffe5208affffffff3f00000000
00000000eeffffffffff00ffffff00000c2011d80f5200ff4462990087ce
04e22801273d7a757a75ffbdd55c000070ff8170f8a12fcb278b00008401
0082080000000088ffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffff430effff21dc5cffffffffffffffffff000b801e
b181b58500f0ff9f500a000028d55a8cffffffffffffffffffffffff0000
060100000000000081050000e70000000601000000000000810600e70000

sha256sum /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
a1fa0cab6324b45a17e6bd7fc7e581496517d558d8c7684cc85e57a5dfe5d87b  /sys/bus/spi/devices/spi6.0/spi-nor/sfdp

cat /sys/kernel/debug/spi-nor/spi6.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-8S
  opcode	0x7c
  mode cycles	1
  dummy cycles	7
 1S-8S-8S
  opcode	0xcc
  mode cycles	1
  dummy cycles	15
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	20

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-8S
  opcode	0x84
 1S-8S-8S
  opcode	0x8e
 8D-8D-8D
  opcode	0x12

cat /sys/kernel/debug/spi-nor/spi6.0/params
name		(null)
id		9d 5b 1b 10 01 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET | NO_WP

opcodes
 read		0xcc
  dummy cycles	16
 erase		0xdc
 program	0x8e
 8D extension	repeat

protocols
 read		1S-8S-8S
 write		1S-8S-8S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (128 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug info /dev/mtd4
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

flash_lock -u /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

flash_lock -l /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out

mtd_debug write /dev/mtd4 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read2
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test
03781ea58ffe95ed666f174f7804b84999f525516595c1ba0f99ee83eb8af22b  spi_test2

show_sectors
locked sectors
region (in hex)   | status   | #sectors
 ------------------+----------+---------
00000000-07ffffff |   locked | 1024

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2 * $ss))) $((2 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fbffff | unlocked | 1022
 07fc0000-07ffffff |   locked | 2

flash_lock -u /dev/mtd4 $(($size - (2 * $ss))) $((1 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 1023
 07fe0000-07ffffff |   locked | 1

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2**7 * $ss))) $((2**7 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-06ffffff | unlocked | 896
 07000000-07ffffff |   locked | 128
---
 drivers/mtd/spi-nor/micron-st.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f97f2dead8c2..12d8aacc493b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -216,9 +216,49 @@ static const struct flash_info micron_nor_parts[] = {
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		/* is25wx01g */
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
+		.sector_size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.mfr_flags = USE_FSR,
 	},
 };
 
+static int is25wx01g_post_bfpt_fixup(struct spi_nor *nor,
+				     const struct sfdp_parameter_header *bfpt_header,
+				     const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * There is no Status Register 2 and no 35h command. And WRITE STATUS
+	 * REGISTER takes a single data byte.
+	 */
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
+	nor->params->opcodes.read_sr2 = 0;
+
+	return 0;
+}
+
+static int is25wx01g_post_sfdp_fixup(struct spi_nor *nor)
+{
+	/*
+	 * The flash supports 8D-8D-8D (advertised in the Profile 1.0 table, and
+	 * entered through the volatile configuration register), but this mode
+	 * could not be tested. Drop it for now. Once tested, remove this and set
+	 * SPI_NOR_IO_MODE_EN_VOLATILE in the micron_fixups[] entry instead: the
+	 * SFDP has no SCCR map so the core cannot discover it by itself.
+	 */
+	nor->params->hwcaps.mask &= ~SNOR_HWCAPS_X_X_X_DTR;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups is25wx01g_fixups = {
+	.post_bfpt = is25wx01g_post_bfpt_fixup,
+	.post_sfdp = is25wx01g_post_sfdp_fixup,
+};
+
 static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 				      const struct sfdp_parameter_header *bfpt_header,
 				      const struct sfdp_bfpt *bfpt)
@@ -655,6 +695,7 @@ static const struct spi_nor_fixups micron_st_nor_fixups = {
 
 static const struct spi_nor_fixup micron_fixups[] = {
 	{ .fixups = &micron_st_nor_fixups },
+	{ .id = SNOR_ID(0x9d, 0x5b, 0x1b), .fixups = &is25wx01g_fixups },
 	{ .id = SNOR_ID(0x2c, 0x5b, 0x1a), .fixups = &mt35xu512aba_fixups,
 	  .fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE },
 	{ .id = SNOR_ID(0x2c, 0x5b, 0x1b), .fixups = &mt35_two_die_fixups,

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
--

Thanks!
- Nuno Sá

