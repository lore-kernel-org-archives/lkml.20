Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDF3AC0FB;
	Wed, 23 Sep 2026 02:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131430; cv=fail; b=IAfGnwuvtIjgDlHNfymqvSpIRc2A73yIAirFJz9smdCyA29IRvxhYa857NUNx7y52wAldO0VvTmzmgSPOaA8bybCaBDWh38nB2OqHJBQ4mm5ZQ1vz3meIFrlg1v569G/jAbiJ70E6wHaJQUBq9PE1WbWnq/ftyXqye1lK/KTJjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131430; c=relaxed/simple;
	bh=fz8Jep8qJzo5+CuHne7b3z/1WtqnVWK7ImMi6IGGAHQ=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=l6czGUY5N5G0luuF73XyQ1Li7jJ54J4vJ9CQWZdRjQ4yJTEeFyEkl97k5wtfiUHgWs1vCyldqDElL/qosImTm0eW77blsf8iIlCONRnrarAP43GzSrfWtpzCt3XvpmefA5Eo5TIisUAL78X5kcTRnNFV5nhk9LyO0vwj82IggFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EdxLF8cW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DHKxPraZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EdxLF8cW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DHKxPraZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N1uuR51918134;
	Wed, 23 Sep 2026 02:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pg+pTwY4VZ0kxQZKgH
	bLRpeJba/rEO/kqtdIhCN822o=; b=EdxLF8cW3Jwc1innJ/pyRYCqZMrMA5Cump
	YvkwvMgWaf396Ip73+grZp6bxHAfdTMLu6Rkq8SMoLRb9y6rN4/97/r6gEdA/D6z
	LYd/X+bo6RCQN7fEyLqa7QTBlajPZ9DR9xiPrDQBBq2V/OzrG1DwYTUO46rZt9S2
	1G/lUpno1zfqAxCZyQKjaJ2tZsr9ku1BOapUlXR8i8689MrVn3GKLnRh7BvIfWmi
	b9SaTlLkCRfngJxQmsZxRPsdTqZ6k1pSzLs464KrBoI8vHf1OIk8z17QgZNifofi
	etobjnvCHQNGWvblbBJ4YcriyD58ZVj6bh2mkakRztzEjDWr/Y8w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk1qd1xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 02:43:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68N2ZMsa039052;
	Wed, 23 Sep 2026 02:43:38 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4guf0ynadg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 02:43:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOueu2H4xqAvXpVrs7eC7gjwl23q6rZwY4aqwOeIJRk8EKyVspVwh4mM+Jq79KOUlbGNNMOBdxM09ALPLiewWex6l01X1mANcMTWtiIfXqyvlhQ+XwzFGungY0jNznXMuEf/FcpO+BZUN9sU6uzzX9FqNrCyWtF8fT/KiQnDM5cYf+Wo2QV1KIpEysIvH1NczyMCkeO9akchuIfEwi8kfY+yzhLqH2rVgjWSpMZxI0ivzGwD0zJVOLWP5EmW74+Jt59Y7MRcskl0lAg08OOn9lvdeufO37aTRJkWariyvQ9HzVIEozwpF3glWQYd9B5JxJiXFnLVa+pviPpKIRGvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg+pTwY4VZ0kxQZKgHbLRpeJba/rEO/kqtdIhCN822o=;
 b=iUHYk6ygTdWwkkF3WD7chSx8e05qpXtgdVnOHtVblMiteScvOwxeJXxTFImNq/Xd/ErmJxppDwLUESKaqW1GbheiFPrgQ3h4ZR0ZaH1YguwC8j8/pN0w6J8xG/WJFcenPqSezC1m7ufwtXt6egqv2HW4AcEcWE8L7A2kPWeqVR9Ypt0tKdlEMw0N4gb4M/VjfwPjThGbZFkRar5FJZjik860tQNWa5y37YAJ+Z6mwvWusgIQRS7icexfagB2tolF744ZNKir/F/ixnl9JpAhkbsSehSybmjSUhkxio3BFGecEz7oAnEtRBgIqX/HM4oCgBwbGTLdpb4IVP6Dy3mwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg+pTwY4VZ0kxQZKgHbLRpeJba/rEO/kqtdIhCN822o=;
 b=DHKxPraZ/AYsdm0AtZDbC1iSFEVIOrvXH7nnWw1KvW5ATzzEUhYPk7hqVPQ4iOrAp4bDe30GVVsfD8UuEvIcvVHvubaRVlRkFStD3CNTq41leu9euFP1dR8F4xZz3kFyqZvzXWwMD1/YAk/Tqa3Dh9fnbeI1THsRB03TtXEdZbk=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS7PR10MB7225.namprd10.prod.outlook.com (2603:10b6:8:ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 02:43:35 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%3]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 02:43:35 +0000
To: Niklas Cassel <cassel@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Damien Le Moal <dlemoal@kernel.org>,
        Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing
 List <linux-next@vger.kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin tree
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <aqzINeKnw7kCQzxw@ryzen>
Message-ID: <yq1zex8r8lq.fsf@ca-mkp.ca.oracle.com>
References: <aqxB2gIACLhW5I0-@sirena.org.uk> <aqzINeKnw7kCQzxw@ryzen>
Date: Tue, 22 Sep 2026 22:43:24 -0400
Content-Type: text/plain
X-ClientProxiedBy: CH0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:610:b2::30) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS7PR10MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2884e0-0402-43cb-84f2-08df191c70a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	TiOrALbcDR1usrBbMYIHH73kuwwcnCA28BGsi4b7hdqXEy/5w3VmmcZMO60wBHqIxJfnJBiwY/rzUcopFr8zfVOkABktttN/lCpdqff0uYiadLkzQ4MYc/jYDdPQSO93VAs28DyE7X+zdnSXIfEgkNEBbxFU47rPCi67+OpP9Co4807AgTWg1jw6OfLhULsQQPo84bn6mYAvJMbj9f2LPX0kkcVDpBLIxsIbrC6oGfwvu9QUZ9QpVmrEAk8HQ4vx7nln+lPlnkkKP5uXauXydZ+QbKUYn3CG3IEjnFK+cdc9BBKXhweonGfXIP2mI/84U7FxpS6wF/AqJggcs6oi0PvihehMFk3tY3aeNsT6BRuZ1sNm8aRWJRospgkENZ/hVE4u6s083Xk/gCvJucz5UYcvUgnlAaFUPesCq58cu0PNCKwT52v3QY3BqseTkiqyYYRyf/avDowTll0p8UNV3IZ6TdjcqjuLWOBUehiXwR2+CtniqELeLCOh8iCLbNoD0Ng8fX98WLerRauq1F5xZ8mWHOQAU7AwGwZi1xOtbWHFiAfvWklpiGOYxUQRa48IU5irpzUn1VjVLImZcu1GI0Mm569MMnhcSqoSChs2sYLV+jwfI4oE9UyBgFoieQp4yIEkCnIUIHGSHcjr4ukp9NbA4wMVWLWJc22UaS1NhUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ULNF8240zcuyDQVjQZpPC1djgFvh6d9bNIt5fhx3t2R18IyvZagAHYBlLvOM?=
 =?us-ascii?Q?mJmRhXKVC1jdc8oaqyF75QXFgQjmzpBznBYJjDFq0S9n5PXg2abybZax3LWS?=
 =?us-ascii?Q?7MtzCg9F+kM11Miz4klJd1BrHS5fIZnRzv34JTJADOBNzgwJKssN6FnhapRH?=
 =?us-ascii?Q?rN6Q7RwB23SQwGUmRKXlrB7R234u4FQj6Ezeuy3ZFlPDcu6DGDD93bjWYoji?=
 =?us-ascii?Q?1eGFKCYNVBtbYZOcw8TfNtsmVYRz0bY05T0SphS0aUIDCAMKlvxrRljuZyyE?=
 =?us-ascii?Q?VEIkH88v00yw342I93f1YMrh8ZfhCBZjL98eXrgUZhcJBAdDetYmRnwQ99Bv?=
 =?us-ascii?Q?bazuynmV5dXHw3JSqG7MqYGqaX/mt+jFa9AideHhyAzMMqffCG5BmBbxxSk/?=
 =?us-ascii?Q?cYGlcOmKKakDj3eLDYgn7gL42DEfnXlrz3c2bLqiUddV9Ljka54PCAb9+bvf?=
 =?us-ascii?Q?zpLxCTXon5bS/Yuv/zYf6l6jSoJ5HUI7GMfGwBuDMglk6eL3Gz0UlJ/AVwIl?=
 =?us-ascii?Q?qmFqyQ7/IcvfWKrFLTDI7K5+BXcrafP2IsBAxSWsTUYFA7z2CKNpvZmpUFq9?=
 =?us-ascii?Q?qpixXASZSFb2UGEkrCKzjHfsPttwLlvYivoTracnX+/vc6AxpgvllJs+Q8vr?=
 =?us-ascii?Q?Uu6WYNyULbc38laPRZAqMmHsPoUzwW2XPqCj54VRYpK4nruh4UsW8g1nU+jI?=
 =?us-ascii?Q?5Wg5eVWQt6gI26vKsgvhutKPegxZsMiErL11pdG08Zi3uk2K2fIbIxhG75xr?=
 =?us-ascii?Q?+/GbKLaEWQaPGdUMFeVMGGwLtcnikTK73F4MTN3av2evd57fE8xK31a90deU?=
 =?us-ascii?Q?vfvnpgqkS6gJK/5CExgzNXYPIcB0f6eAeiE1V9aj/RiqxSgmcAOlRQTnImB2?=
 =?us-ascii?Q?vmtLuGAKiyA+LfzNdGzWGVoUl44PSIrtrXrifMIOw9DnR1GATQN91mNNjTHD?=
 =?us-ascii?Q?BaAlrvTzoEivDS1PRdU5PMnrmu9k/K91DVTut/w2K3n9xpd4n1jUi1M6w0ST?=
 =?us-ascii?Q?jS9ABuJgG+jQe8J5HsGHBbD/Vwo3kFjDdADtR/0BkiD4st6vZCWfT51UEs2X?=
 =?us-ascii?Q?Y8f/KKuizKFv0in3QkpaXOC0el58o28sqndF9QKOO1BL/9xc2PZ2TAq/kiPx?=
 =?us-ascii?Q?q0zyNeqFft9muNhI++nmTq42rQGoqoHocdMup2658TnXAv7u/L0hLwwMFfvl?=
 =?us-ascii?Q?tZ+6HHDFzAWBSY/DDWUEdW27gcQ5GHRoDmJ3ImujU4v1F9+fUY85PdziA1nG?=
 =?us-ascii?Q?txmSJyULOvl6SIQT5YC6ngjjmb0IjesqPmX49UEZCjQxCx3DJDZwYh+bOEad?=
 =?us-ascii?Q?bm3DOiR0EyQOQ0N3hnyXtE3C6bHD1HOLuY028IxC6ZoxXFE8O5N3C/c9GHhB?=
 =?us-ascii?Q?2Mt35Q5ohVlDvumEsTrP3BNiXwCKsg9QW9tRYP3Y8Vo+oy0ZvgR0G22Txnp6?=
 =?us-ascii?Q?B0/o7yC2/YSRbdmxXK6XvMRWf3fW4srV3Wp9iq+9jrclUPHYCUSiBIFEJKL1?=
 =?us-ascii?Q?Kvq7BnRpmXt4WcBrrYAabxiWJD60SfuBwbS1W6B6xmGneoaAhpbd3Vs0Mpy8?=
 =?us-ascii?Q?iTyAesgGBCoz8QmhJK89W2wmZ3V77QPTgQnizN459Ub2RvlRGQkhyUXw62Kf?=
 =?us-ascii?Q?0vuVYeaB9PsxOcf9zPGQ+i1xCjhCNk0MklHS+Uo0xsq9NgYyEdEnEFc8MxEJ?=
 =?us-ascii?Q?4raals1VpGTu4vjVS/aIKhjvp5rs+IZlYvluMVj62HP0+fcUiW77x+RU0Kuz?=
 =?us-ascii?Q?BUnP895U2MKHUmoDX55ZjlWCGEC1aNE=3D?=
X-Exchange-RoutingPolicyChecked:
	Hml37nNZvoWOToyfRLyQYS3d2gY9gptkIrQo6D81fTUqqeLSmuJFoW7rBxBcqS3PZZqHVz6k6THphezLoGBoMmmRIK15/SkieY7Ts9GTG7HKbhbD7+hMHMSoC+mw/FML5maTOyDZ6PVPuiLWzKAtxgjABY8yVfAhZNaH6uX7j1SmS7o9PNjwK9g68aJRfOM2d7MJOdrl264bDwuLpxWJ5DkKPGDI/pFOBz6Oo6VBsSjgqeUYbYCSnTt4RLnpNr/EHUC2vPwI+2+vLvTAsrSB7dsQQiqoUE9qp6N7mC1rsNNazWkcmlA4TYvuAd7Pg5GfSdy7ueD/tZ1WUceBEAtSPw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KLUq3F69VLf7e0RpYmX0T21Hg4zpnherh6uqOrSLxZc+jGi3hVQwbjmHf1lj6HBUiU/hTqrxG3y0O/ExLYrr4R49eLG2o4KWDILERq7Cmh/sGeK8VSe1DAYYACZSLXsuz9i0ynBXH3sUu+OjzANCjLcIrgbCNIMk7wXsuJksyjYo8ckgKSvfzJrsubKPYoL47mvkbAq9+zh1s7clEsuWxPT6Het65rBIJh0bUKGLLmdHOIiCIG2aSHiOqA8NztVgtd0HZ+RZQSqI9wIs061w8kceLwR2HfYi+jRTXmpSAuJuZAFLy0PrJHQstGqLx0qoRtkaEKKoqJxbkpJNPQf5uWXnsQtNf+Qkiq/5IqnweuafO6lf2Ej+Tpq8Lgk7yeEyzZFh48K4n8WhNpzWyD9u550E/tsW/pdlZaNKz88bfczMWeZzanCR9q1AkxfkkkcdPjNAIM62qNrw3X7527jpJZdr7xoBnHPuB80M3gnEXl7xOI9RQE/5zBLdUa9y5Ef/N3K1fCaC/gDq6cc+i2AZp+4HvhQXI/zzf7tdJVK3b+m59HRXR+uRtyLre+OLQnVv9ApDNsWpqLXOprh6qDWY8ZiEhElcW4l10VrZ5gXJO/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2884e0-0402-43cb-84f2-08df191c70a6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 02:43:35.1731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvQUqPt/4YXj3ca6aU/5LsopRdjQEOtc09QBd4JPCzNFYLsm5pX/0/uIQIYrSkk4Hj65yZU36xwcDidAbxqbzVq7vMZ0WNnYpk1t+qx46Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=586 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609230010
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfXyFDVRJKyAQpg
 QxK3+DXVwG8UgA4AAHNHqqSPOSb2/G26bgo1F7Zhfs6qmoRzWaUj4tvnlvhaakHp8YVe30vpUjB
 xc2Vry/r3RvETtnMCgroQCP1yS/XkItQrDphn86bPLZf7I1Ehig3
X-Proofpoint-ORIG-GUID: 5buxJI5VLHVLkMI_l5HvdXEry3Wvu2BF
X-Proofpoint-GUID: 5buxJI5VLHVLkMI_l5HvdXEry3Wvu2BF
X-Authority-Analysis: v=2.4 cv=LIzz05W9 c=1 sm=1 tr=0 ts=6ab33cdb b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=kz4-KFSQ7HH0njDw:21 a=xqWC_Br6kY4A:10
 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=XIho0JcK0GkUpdpiaoUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX/V2ydiRXiiO/
 sZZfFiw5C0L3AUhPWmjDLcyNeMjgj1JoDZSFJ1CBkmTIzOaNf6YJtRoYCnR2EK1FRMCPAPr/jrH
 p0ocdvkhiTsaezVgXvdw2C9UYFd5WLLYcIpLNGekeuAKvd630Sf4eXcj4cQzGJwvIJSW/p0jHYd
 qMNJWQ3dul31awZj/Tzc6SnBnvKjWBKjG3hG9xQ/KR04dCO8/0JF/DjYslal5dSIBeknFzlBvHj
 MRX1PbTSuLRyMkoD/lHZ4w+Srm1qsU18mLwz1v4SF6AgrmEIamCD9WnwjBTLYOh5GxFbaIZvGg9
 ZlK/G4lDVrM15Xlcbmw8eSRX1fz5gQrLbqRkB70WD7L/xE1PEAM9SfF27JqfXUjzKHk+UoxTLHr
 JxdD3vqpHQWsWdwFW6HkhKp+4be2uVWETFB9esngyYyzJlqdD4d4EyCrdozCwObPdhJm3mZUD9Q
 zbH4Zeq5zuZQ6xhrMcu7XUx4M3kBuuCN+5Xaw0AQ=


Niklas,

> -Merge in -rc2 to scsi-staging

Now done.

-- 
Martin K. Petersen
