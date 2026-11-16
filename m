Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794806371;
	b=qzGfJtxZ3ODQpGOA0EhtJXDSnFqK4ZgTiz+TRw0aydEqmRWksj+YgeRjtuYsrUpVkWYA
	 H2LcEFIG6mdIDk8tYVgzQ/+Z31UnHjAie/SLyRwdQesbo/2cS2PkVwEXRsvuKacqMEhQJ
	 BUKPNtCjolIgTW4vuaGQNqlpB0QshFYOzCpRnGWg6gq9FZdqiaQohbp1Zg+2omCZyr/Nr
	 n5WcmeAY16Kq1NjyU5+bdwE/IeV2SSXf8Ha+BmHHkLxJ0V2f8djHAap1EtO5vzVhbE2H+
	 TdmBxpvMGEULruio3sW8l+Myeu+UUxhppyny9ek5Z2O9PrNHUYAtFuWZoxU/+W7hcWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:References:User-agent:From:To:Cc:
	 Subject:In-reply-to:Date:Message-ID:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis;
	bh=/HX7fwtUhmSGzPNTbfMXGKy3WNBh5anu7s2Ngs79SxM=;
	b=OiQTlueX0OF3GrJ0rtHwvWcvX2LOkXpBnpyOANB2kO1c1N9pPuSY11ZemQzK5lMP1Vfp
	 yqZiO8wO7Q+BoNSVpYGAB4iY6SZtSO31Q7oXlTfaJFLdPqkHY6sGPLzSLIEM7/Atrwk6P
	 0IUTjQjYz/w87wmhGQbT5+Oi+sAk9733+u6hTqLhZaJtrP/4NEsrrk9XUaRor/JYJwUb3
	 D81pNEj8w6BuexIQTfglu5v/Qi7844gCTzpsOs5LVKeDyW7UB6LVoWWK4khzrFpJjcAdt
	 756KZFMRZj0zXpicD1NQrCebrO+Ib26pIlL1Tm3aV8KV8FRLCbc7e70R//9AFySIcnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=OTgYHwqB;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=F5GUh6aw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF26606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF26606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=OTgYHwqB;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=F5GUh6aw
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFNA1Fd1101140;
	Mon, 16 Nov 2026 05:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/HX7fwtUhmSGzPNTbf
	MXGKy3WNBh5anu7s2Ngs79SxM=; b=OTgYHwqBJD8DHgar27oFY5Z0+9ihviRA2+
	m4eI+ACQT5BuiimlJ//+ZccoT5+l0TQvX2wRCQB0pJcWx14f2WX2rg3jALvutIuL
	zecbhLLpp7imG1neuyTB0vke+CsAgfsqtjH0ag6Gkmb1/GUQzrqbgwaIQnvFGSOu
	kMZTfK+OWH194XfmxT3DfY5/rRHHmNpCE2YlQgXRxPFjtIFAW8cPz12R4n3shYC1
	yj2Rjd3dcjev4fBgiDCfd7QlNHutlSePs6ssqa184ZhIGX11j5TOiIBkEQBw7ntr
	5/usyV3/39g6R+pD6MUIw6w62Xi67pHPUz/scmYAc5ptXK70msFA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hxg9jsfxg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Nov 2026 05:18:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG4S1qH2411484;
	Mon, 16 Nov 2026 05:18:52 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hyrpy3tmy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 05:18:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/Y733J/kNA6WvqUxzGUPdZygDgQwrBmjZsxRhWMbBLUqWOn9Iivx3WXIqdQn+dhcTFfyZciRG1eMfYqczoR+ehzZPBntf54+blKyZ1QtTLLXNMyOwb0HHZSXbWSkwAY/IW2vZGpG7NGz3l0iMhWq9uQl6kEYSTSdWyfNvG3S6FD7KplDdnCVOsgltA7ZAOItdkHltjUMMOwps61f+N8krePnIKtbzzj9sAo7a1G1iKrSnfeA0mFyBJ2NYgpZ8dvEzA8gCqYcMiScG91yzOHnFeBG7FM/115ChY6CJIteIuHmxKT4Z3qTBjtG8sXt44kPBbzL1cUkkWe8LgsD0JpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HX7fwtUhmSGzPNTbfMXGKy3WNBh5anu7s2Ngs79SxM=;
 b=LLTTtFSQSkom0dWrHophRhcfDjF+PQqyXoFQ+jC96d5EYLjBmhG6nKzaU8PhyEI3Cu6X86/us2DxylQT6dxx5nCSD/bVie747PJXkprR4qIsj/Km4ty0LXBbDZ2Pb8C9DuVLes1O4qGEZ/aJWciiOT4fdj349dUsvoVptb0/96grr5pGoz3vw9xZu7HzW82ylns/5kx7aTvgPEXhSEXd9LciQhXlHw90MBk/2WawGNy+KMgz2kE+RAphNseMJzLe4UA8eHLj58/N6TxR+vbCIeXe+9X/xbSsmsUHIoFzjJjFNtrzDxlXPf50uJ81k6MVGnDKIgt7KiE8xNahV5X6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HX7fwtUhmSGzPNTbfMXGKy3WNBh5anu7s2Ngs79SxM=;
 b=F5GUh6awsopTYp3izYf70aL/grcRn5LtXTbk2OlBm30tsE6rgsq7mBoWfgffxnU+m/vZBnvdy4bOB7eYLXfDsBASMO9rSh/jDT6fkzrOtUnL/dZfiRvWeO8uCCr7ylTl5cLK96f+hDiYAYfDqwHh6EGw7POxSPPVmZbL64yJL9Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ5PPF5467E3597.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 05:18:49 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 05:18:49 +0000
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand
 <david@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett"
 <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Michal Hocko
 <mhocko@suse.com>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        Pedro Falcato
 <pfalcato@suse.de>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov
 <bp@alien8.de>,
        Bharata B Rao <bharata@amd.com>,
        Hrushikesh Salunke
 <hsalunke@amd.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
In-reply-to: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
Date: Sun, 15 Nov 2026 23:18:47 -0600
Message-ID: <87jymd2w20.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
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
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ5PPF5467E3597:EE_
X-MS-Office365-Filtering-Correlation-Id: 70674402-32a5-4847-67ec-08df43a11861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|5023799004|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/tscEs5kjsDJdYE//i1Z6uj1iyH35NsCyUD/svcLH+4IQJy24fI8Zbmi0O4S+H2OdWmF55J9OD0UighCqE2+6UIBtNsepP4kOw2eH5UTHDG4eI73RBDTo/v9jd4oCw9QrZMyB6AfY70Lnl4aPQ3qdLWCLjXA2cByIBjR/UJ1Z3sAUE5gI9N0pPwXzN5ZtBmcJ1VLk2YzVie8GhU+yoP55vZsOxgUB1h4K4K7VHc05N+UkjCPewfLfkRtbO9kpKb+Z6KqWZexYvCI4HTPUMAGGd8Y6MvcEfqySJ4GPv9h/G4RQFzz6xkeWv54PoCaDZ/XBdO8op2lB3y+SkRBB+kMS3exSkt3P+/Iuwqcz3sLQAiQxI7XE2K9T50tzINaUGPmwKwaZ0pDpW52AeHF5u3HNa0TYIBNyALh0Dlz9PCZtSzmTobU4K4zBaZxtyoIzTftpOYrq2hurlbraDK0UD0hdtrCxsUyPPFnkQh2qf9iREnm5DJJeJ3YxMYvw5uS/AAfDKepcRF5CMrKbeF6rDbBllLaG/Y5ytcScZXMdRme4EP3yemOwuJ3UPGzBX0GxVY8/LjLP1tlbqXt6KdGHxK2RTViii1/YEW53lcGNPzeHisCFpzQN2a7QCsVrmxke3Zt/qJVYMOtAedxAx6kzS6FSkM9e41xss3yBEpyFzYhPiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zG5JHXHtjYjfhkm1url9Te9+5y8fkCDg8Fb1XtLlQV+cKIRDr4Qgh804TUc9?=
 =?us-ascii?Q?w8989BE5N00UIy0OM7pgufvTvcvOG/omgAB73QC9IuGLkOynYUxN6a217/SL?=
 =?us-ascii?Q?76+RNtpYEj0VcTYSMBPh17fvwEGodeRvkqC0CZh03Mu2/895IjAFyXlH8bEI?=
 =?us-ascii?Q?xxyU2MSHsU7ztvVDSQ5+xUqklEPfd1Tw/Fexn4Z16+msL7tUctpL43zjH7ct?=
 =?us-ascii?Q?r/o1WrwpfWzAGg4TT1AL2Ww1Wg09XF9jnEeMZ5Dz44u+UcfthQDZDBT5DaEj?=
 =?us-ascii?Q?lSWFzko2CsqM8hNwRMZc/lRAE3tOoP90T0Q4m48/5T08TaUFYoGEJKLPVqsV?=
 =?us-ascii?Q?nG1ncKbnxtBL9K1syE4kvR6egvU96lt3AkI5YJGlIwPk5j73gzVFJjh0+Hvl?=
 =?us-ascii?Q?XDFdf+w8dR/XborZu/84eoqsoy2lNcW/dk7cHuJRezgSK1XsH2k3FPqommsc?=
 =?us-ascii?Q?Xzet+KwdKdP22nMGgPFOeI2DPWA2zBZ5pw7H+u18XYTpZYI/9/4cOlTem05a?=
 =?us-ascii?Q?y57OnbEltcifzFSPwVq7vaolgGPiCRoKTuI4gcSpYJ+xphjo0K6xRTvG9wlU?=
 =?us-ascii?Q?8fGKhXHzGKW6RU9rKlMGUW+wfmhczmkkNtKoCS2Agf33ffhjBeaWjjwcECbo?=
 =?us-ascii?Q?Yu0QuNGMLqnu6PVXA22gMSPzYbB4EorcyPCKib/C7dhMN2JuGTu9lM3VsUWG?=
 =?us-ascii?Q?PBOsH0iT/Eoux/vvdH2kaMoofaAATUTM6nbNwxDcwcUjGpDPqQUoGmA++L2M?=
 =?us-ascii?Q?ArnYaDEh4UIXs/I2aixTMbirfcNh3R6Mz8ySBsnYvmukRq0TU4FiaKmi40m2?=
 =?us-ascii?Q?ga4jieBjMfy5OUxCC7so2SiP+Hf3qp5QFDInp9byLpWZvwoiS665K2cFKdS5?=
 =?us-ascii?Q?jN1jrvckU2qwuZxemUtwhcgpI9zkSUVxNMLlGBQlGtYe5mD0+D2uLthV10zC?=
 =?us-ascii?Q?cQYYnfnbk/GZss49gkALuDfxHcRz4l0iyMvzL5TirzhTKnYmmm7ovv9RZ/99?=
 =?us-ascii?Q?8Y8jbnB8KcScO8zwOpZnpjlpa1qSsWPmGUB1a2r4V1nonJf4Z6XmCjvMm4CY?=
 =?us-ascii?Q?vpux8d3qNNOoI4IBzVLK2RDvzVx4olh+3L34ivqE/l2ps4ZSt0EfwhHyCYzB?=
 =?us-ascii?Q?p6xcmdOvv1ddnyaJHlTet8Jw6olX1O2DvKSw+Y1C/EqrBisowDJcvHUMjM9n?=
 =?us-ascii?Q?XU0dt7o9d0Ww7HhRfimZGqakq4xGGz22yWH4qbmYUKgkrfy77RzWdMby2FtB?=
 =?us-ascii?Q?YxMFmu9lTTMBnFk8vEWXYCODdSgVdOSc6nkYalPpWtEOIhAw/5Zjh0eJpmDW?=
 =?us-ascii?Q?jRvoQFr9nrs6ZWK5q/uAmUrwxN59UUgRGxgonu7qetc6xqwLVPmfrJkzAJgn?=
 =?us-ascii?Q?ohuMZfSZyWqL97C/OlCjTNg6SezxINAVqyvdTw1LcytQM1KL8asHdNFUT7D3?=
 =?us-ascii?Q?xiLjL5KtWdJKuTg5BJzPlcuy1cRpv5CUen4n0C3k3Fvvtc7ATBw2gLy5CSk0?=
 =?us-ascii?Q?7vmBkEEXePiyVWq+30Cg+7RqaewkrJDB9dT8vrI0I1Xl9SjQyIcFrrWJvDXR?=
 =?us-ascii?Q?5QP4dH6cu+C06nm00Jjz2/Ec3++mF9iW6HzpmihZc/o4mg+p0cTdLqL9gDNQ?=
 =?us-ascii?Q?k2GNVGWs5nsvOqv5Sb7yTSX+w1nLzamXiyocB1h27aAU6VEXhPZq1PTyTNOD?=
 =?us-ascii?Q?cAO9kU3IZfpvtEvlX2ABtW5I7fn7u8RrtjFk8a3Sl3/aSdVQolfRxOMFk4xZ?=
 =?us-ascii?Q?vn8Ud5BAsIwjVCGapxG9lRe0i2u+Up4=3D?=
X-Exchange-RoutingPolicyChecked:
	CrZd5hlD0nen7mGcVybIC5tBIOAI3SSM/AmyMYsZoqSkayTL0+zqPx7u701fTDGPaZsJW61kTdJcJfKnkex5A1CFWwDVIwqZ5W1GqLJmrEV3/Oa9LtJv3zh420oK3lOUasdSxKJ1HEVbeIT2ATDrdZXT+8GnLPCQFeYaqgxaoGtrrl80YSUjiiGEdKdYTpomSFmFuPqIfeQdo3ipprS0tjntHgaCKZ1xN4/oxYwv9nTDyiXfffbjveqt5z9Fnb9P6cE0IpqPdFH0TXzE6u2BKBNjSyTrPGNeeooj6kXD1TA9bRCUEDR3nZoLSM1/hngqMxPD4aLCdy2XY0IwkVUg3Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wePn9e4iNwMTVP3sYZPecCfPgYeiFfeRtEHHkVbAIJ3xo+1CqSSPosnpIh49x2ZBnZOR81MfYEBBHAUcXDVAWD9Q+kxbx4Ctb24xYcg/buZUrap6Bbg6y5f9XqHxJUL7ZlmNkr9y96V3W5+JRAjYOdT1M92j7+6x0WtjQoZkSjFIlces7Ur8evFlBAwkQtcBVc/2cTl+NxLm8RR++T2tLhjf8fzY23UEZS7o2GR2oV0MbCrokfKl7UB9TMEPMIKi8Eunntoog06GHWi3+ECuvWQmy4XquLLJpuvZC+lNy8VkMxk+vpsbzfxu+nqL8eh7XEgIsLvsZsFHuFMCQzn5uRzEp4oygGe5K2J25ArMiOcF7ktinSzj1+2IjqWQ/3fg7kmnsBmz3oSw09JlHIwLp+kAAJDWSoxGFjjclWqxwii/zMhAitfyEy/XtkwbXaNHhCmLemkg6Zr4en6YdO0LP10jyEvyYiWEwzrAKqCVcR0faDzX02LNlTfwAD+rSP5LjVj3H4F1aEwKxU0GZRM4vuHOk64s87ey2Vi8Ka6j4k72lhCprSkkNmjD1PXoTPGdSF3Jvb8BlppYA8GmXOjqF7veXA1Tc/GZgnc2z09dPKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70674402-32a5-4847-67ec-08df43a11861
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 05:18:49.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDDZ3GxiNRsbkv0TEAXB/fcTho9AvncgUTi+QJj5GHak1HzUbIWSVRbfovHy0oXtuCmBiKM/Io1BFn2QhZhEXKW3P9kYxFPmEoBS1X4/aJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5467E3597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611160020
X-Proofpoint-ORIG-GUID: W8PZ_tpiZLRghHb8HidQA56BKWzEQAZP
X-Proofpoint-GUID: W8PZ_tpiZLRghHb8HidQA56BKWzEQAZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMCBTYWx0ZWRfXyV8+odbY1eK4
 dPgLVkIHsMutZAscyOZQm2C9sQj6QCAMjpWcCSVIOxzmSJmI9IfX1nFG65kMX9T1Y+cWoDdkHbA
 vHHet98NnBWQ+KspZSux/w9zIXVoV5m5gUswGK+sUwTXJtXOc6NM8bD/zYGxNtWeI72/kSjd1LJ
 OL05to0a+hyy4T70lFnokQ/9nHJpw98j1HlYJ7HGjGBHx0o6dAI/gF6ZwTU84+M4Uud4ZycV47I
 EI4hB/lAd8fSGWDlK4+e0f6HZoyH9lzKF79+kvuoTByX2JQkj3WSpBepJlorB4lLyJvIHRLKHTP
 Z/qD/ksq8AEdDQeYUlbLnuqx3h/5AHSC6nsk9Hx+3wwGh1ChZFme4sUkesnZmbAZNUAs2jIc60I
 MyxkwN8Cy7ZYfqgd533ZbpW7hBHukWCawQMR/JGjhYj1JDz5XQT9Kg9DRFYqdbaP9zYWNzQRezO
 +DqU5W4ZoayN/siHgKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMCBTYWx0ZWRfXyMKjsOJCZb5p
 WOL/l8t2N1FPimZtT2QtdsGwov89RK2Qr6aWB7HnW+d8MhJljPM2kwMtvj6pgriQ0W1Qajejopw
 zfRcI9P3c0jSwtaeRoIzK7qah53vYfvJOoL2YLsahvMzcAAQKUrt
X-Authority-Analysis: v=2.4 cv=DMoacCNb c=1 sm=1 tr=0 ts=6afa923d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=zd2uoN0lAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=295OS-4_2CfIN_C5SgcA:9 a=WmVTiCyuxqgg3mnwYu6p:22


Shivank Garg <shivankg@amd.com> writes:

> This Message Is From an External Sender
> This message came from outside your organization.
> Report Suspicious
>
> clear_contig_highpages() clears the whole range at once under
> preemptible models. Otherwise it clears PROCESS_PAGES_NON_PREEMPT_BATCH
> pages at a time, with a cond_resched() in between. The batch is 32MB if
> the architecture defines clear_pages(), and one page otherwise.
>
> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
> modes"), architectures that support lazy preemption only offer the
> full, lazy and RT preemption models, also with PREEMPT_DYNAMIC. x86 is
> one of them, and it is the only architecture that defines
> clear_pages(). So the 32MB batch is never used: whenever
> clear_contig_highpages() runs under a cooperative model, the batch is
> one page.
>
> Make that explicit. Clear the whole range when CONFIG_PREEMPTION is
> set, and one page at a time with cond_resched() in between otherwise.
> Drop PROCESS_PAGES_NON_PREEMPT_BATCH, which has no other users.
>
> PREEMPT_DYNAMIC kernels also have CONFIG_PREEMPTION set, and
> cond_resched() does nothing on any of these kernels. So a build-time
> CONFIG_PREEMPTION check is enough, and preempt_model_preemptible() is
> not needed.
>
> No functional change intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Am a bit late to this.

Reviewed-by: Ankur Arora <ankur.a.arora@oracle.com>

--
ankur
