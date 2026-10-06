Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1A44682E;
	Tue,  6 Oct 2026 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291411; cv=fail; b=uIVMhU0CGNL6jeFaJnV1LUUOdcdHzRNijbdXV2lFsKlZIifMwCVdgeZV14SsaefozGMh4ipRL7C2KWAkESuP+1drupm/0UPvJdbcqc4fMCQlYudBYBIcVJHGy3YzBctCRoWOT6II//ys8po3pB/f9l+zYeL/l3UJN0fVtPc8YFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291411; c=relaxed/simple;
	bh=3iGdzBM6e9BojMGtrjdifyDXEQK2sqGZFvpMmNn/05E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iMSD9KxqyUBHGcI6/0Hct3L+NBzY+zxbaeK2SAxgmFo1HAe4zlbLGni19cxAN5EIlE60MgrrtyqBk/E7uk/ltqdkLawbWqGfPz0QwpEHOF+Ou6HqTPYvmKDWkVKGt0dCtW8dJ5ae0fx7r0BRmYtThFo1V9NHp2VWWbZ4Inj8d+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=uH4JzScB; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NnSvD2e5; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="uH4JzScB";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NnSvD2e5"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BSKcC2468093;
	Tue, 6 Oct 2026 08:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=DdOscm/Z5pzb1HvfZFFKx0glSnnny3yeQ+XcsF27Bt8=; b=uH4JzSc
	BVs/6ADIv4GN6j7SqvnT59u0v43SE9mw+iREwYh0oFu/n+0VAGrjJoCkLyR/zdKi
	JLzRBPfqMHZBSsSTBL0LX+wbIz8sPgLvNdXTi7R3yiKNBOYAdEzhkSxNtTSVImpK
	l/ihzVBRyb6+72a/qqJ3jvxL+Czgmgce6wnODqO2Ww0mEVB5aPX4M5PuiOl7QKRS
	f2N45xhCKEiMpC7PGXTHU1yoXZzO118PKSMlYyMbMXt8uE4++ZRdYZvKReTipXrI
	unS4bLFxpvEtCdEPkan6oCnjJPRJbwnDjHBpRFKjfjo1JOkoW54lFrsy6usM6OX/
	lrw19Fj2KaDkcug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DdOsc
	m/Z5pzb1HvfZFFKx0glSnnny3yeQ+XcsF27Bt8=; b=NnSvD2e5xRIt9GpdvNEfS
	QWf9BFGOj1vJiCLbhwR736ZAFu6S/KJpnLTeA8YeXoWWu2O0NGMBMYL4/UxQ/xq6
	av0hl5A4n89hOoPptUkXuonR48ZuDFJKD74qJKkvL3ME2xbxSPJEWJiGow5Df6rq
	afVlUQlpv/SbMuxHT2XT5XpgVQ1qAwVAwHxXrT+Ud4yEcBfmW89Lww6/D58Qbtcd
	NyazaBtNqKf89E88mo2Ju96uNZmUJt9XD3ejrNIsj7mpWmbj0rdFboqsXMi7Q1M8
	MFRBwBftyI+tbyL92LahKymh/g3AJSGPGgpH9Gq8PBABC3BBQ1v9M1LPxAOTkvLC
	A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h4y34gpep-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 08:56:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcCYdy7SXUmsVD9O1k0Bzcw7DJ02yNiryecLVgzeFbneT7Yjbdn4d78Q1I2fVTvKeVZilRK9IdqWel2ZSjWxkpQiUcuWhy2ZekWTd5OvutHBsb6LvbNEKRGoSo4PtHdGQamOS4ZSMLu9/XvtoZLWimEkt+1ug/lEIQ/qmy8EPcmq6Jfw6TMW6yL2zJIlXvjIpqaT20xKXwhVsHeZ+9pCz74shH5UZ/nm/HdyK9MDNg4cjaiFNEwErOM2o4n33BPqu1dVwFUOuQk6/NcetH0zTp896A9tfn9AZEM7ROFgJpmPQiuZKStnFIZTaCp0SXJtd4ETU0IpBzmZjti3eP8P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdOscm/Z5pzb1HvfZFFKx0glSnnny3yeQ+XcsF27Bt8=;
 b=T+Ja8mpznnTqU7rY5oEbSZHa/YVMQq31TpKKtuLWhQmyV1ygEN28ORZub+BHm1xsfJNxMEvZdHyEUVWqQ+iUZiTyK+SeiHxhQRn6NwPcKTNf3vomxqIUXxjckUiXp0RDXn1ipxnCAXJsAad/zDGBLtZgHJ+hW4Hs0nV0zxd4FUqxKHOuZXfAk9Q9/fUNoaj2Q+M6STmgt7eN8F7+r+BZMWTViyYw9LNiu+A0srW1o3XyibAdR3f+EWQP0EjAkeSV5C9bh6FuFNJ16JOjJWdgc9v4UtvaMtcntD4whzUpBjOEoJ/zCDcNGok4HLmlnKxqUu7m6EvlGnH9Qg5xdx7DCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by MW4PR03MB6667.namprd03.prod.outlook.com (2603:10b6:303:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 12:56:03 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:56:03 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Date: Tue, 06 Oct 2026 14:55:56 +0200
Subject: [PATCH 1/2] ASoC: adau1372: allow sleepy powerdown GPIOs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261006-asoc-adau1372-fixes-v1-1-599cc17fb5f6@analog.com>
References: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
In-Reply-To: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MM0P280CA0004.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::18) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|MW4PR03MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc4be8b-f5a5-4efa-5399-08df23a92d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ipg4o7/THeZH84a2iUrlVoNIzMPiPCIz1uzB0L/x0+f/3dEVGZqb0Hq0ei8YaSQ7NZz8W+bQCmZQkiQzTBhqlyHAU2QMMyDOP4xaeZaVR2T3XLq9qMO4IWU4vPs9esZ8x15NGCd20bYnUIK+gGIYrslHaLqnfs1ewb4y3yQ1RRHhW4b0y/Pf0K59gAtDUlumW7JpBXmae3odFr5ohsS0sXlpTADh4eeVVdt1ljaFSD5BvLJiFe/b17MbcV9iRhvV+aMiDP5hvQqa+nWHefM3JQ0gXP0NA63/yNKurRmGorbJfM4yg7HRHKxfj5St5rnUbskug5LKz2JuPGrnqw8G+B/Jvu1vFq2R8qxx3HqKn701w6WlNmWngbSpgnF2b7WX2Hnsv30wL4Bje/Yk2fT/tJIw5ZyYvUS/Y6GiKw5ltszL3XpKiwHgAWpiKLdBs4UCxBAYGlvWgRJTho5q2Wzr7gkRZGtmDyp7zgHTPsMYVXztimCRWRmqLpEeo24qRqab1xlGLdHCVwcis0XbXaoY89TkCUdxkL3WHXyqnQw3mmWcuQ13FDVL7ooBqF1t0ek8ymWRXrHXlmKPRErwSklg0bruL6d/z9PSKXBxM/JcVVl98VLd+hrs6+WvczN/fMY3Ie1xXXkpfxYTHm/3ZClODIq15/YFE2r+8204qWeqC2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZElDK0x4aDJqOVVUMitqb3hmZXBjdEthUERqZ0oza3BiK0NKMUhYanpJWTdH?=
 =?utf-8?B?UktEazZKS2hJZm5OSWJzR1F3YTBpbW1Qak1DVmdubkIyQzh1bEwwZkQ4cVBB?=
 =?utf-8?B?eGZIVGlhY2daZWI0MzRBbDBDZk92YVpFZlpRNHNDRklkYWFDY0RYdnZOQVdK?=
 =?utf-8?B?dFFLc1dPZStFNWtRbUdaVHdidUQxMkcya0kzRHB5dUVnRGk5NHphWjBCRlB2?=
 =?utf-8?B?Q2hwWVpxMDRuK3NXdUdweURVd1lJbFRsNVpoVWo4RERjUUg5aHc5VWtaVGVh?=
 =?utf-8?B?aXVoN1B5RithUVZraGJiVjRKVHZsU1ZLL3UyejJVZkpPTTAzcFY2MjVGL1VM?=
 =?utf-8?B?dXh3Y1cyWEFQcGhFMW12UVUyYjdGcWVrdVZaTUlFSlFUbEc3S0xCbUVqdHNw?=
 =?utf-8?B?MVNzZ0g0eXIrQU91N1pBbmhubExqT0RseFFVMGVjN3d4aStwdEllMFdBSUYr?=
 =?utf-8?B?NHlXRnJoUDV3Uk84VURsaStuQ3NzYXJhSkFtUGlXSWF1UXZkS1doOEY2VWVt?=
 =?utf-8?B?czB0WG1yOXpXWnVSbmJ4N3RJWVhmMjFIYksyOHVJNkZ6UjJvRVk3ek84WTZk?=
 =?utf-8?B?QWtCVURlVlJYMW9WeWhIUGx1MzBoL25CalBVb2VlTmFlYnREREFmQVBSZy91?=
 =?utf-8?B?R2Z0aURLNkdVTnNYNDZETG4vNXI2TGJpYk9pMGljNFllVzBHQWVYVDhsT2hn?=
 =?utf-8?B?cFJrUmRBU1dQeTR2VnlmUDVhbmxIcytrTU1sOXdBRStPTXJiN3JybDFHVmVw?=
 =?utf-8?B?N3N5RXA5WXNIcTJGU3NhOFZhMmw5dlFxVUFnUGd4RDNRTStNcy8yZGJYTDlC?=
 =?utf-8?B?aUI5a3FSQ1lxN0lkT0NBbGxMNzBEVFdxeVBFNjk2SWpHaXY5aGt0Q0l2K3Ji?=
 =?utf-8?B?eXp3TEV1NzBuT1doclQ5cGw2VnE0MWU5QWlLTnZYVEJ6bkJHK2h1TmVFWXM5?=
 =?utf-8?B?S2N1eEhGL2dzM0xzMGpRdjAzMWxWWWtNdzdaMFhSbllIR3hxZXhQKzlVdmsr?=
 =?utf-8?B?cFVPenBhYWdXTFhWUWYxY2JJRUxtN005TXczSGgvWktnZmpHNzNTWmhxWnBo?=
 =?utf-8?B?VmlzWW1BNU92cHY1SWREVXpXc0RkNmhTa3duQkZYM2tZbFk5dDdDdmE2WVd1?=
 =?utf-8?B?Vm9DNmthQW5wWW14Ty83ZExMaGZzempUTHhvUlM4SEVzYjVjS0l5UXV3NlFU?=
 =?utf-8?B?dm1lNDV1c1FTbFZoMEhqSHJQVHFjQmk4aEU5V2ZwdWFOdThIZ1Y4S1IzbFg5?=
 =?utf-8?B?YldHTDk5WmlJYnpZQ3UzdWI4TkU2YUlxN0ZBdjVkR0h0TGl0NjlLQVc4UGtj?=
 =?utf-8?B?bzdKYlJmODN0cHExQURiaWo4dDMrc1VVMDFjUEQxTWRDSWVjN1ZXazJSeklL?=
 =?utf-8?B?eFNaNGxHbWMxdUlrNkgxSWdBRGdHS0NrUkc0WEVtWldQbnlEaG1SbjBuM3lB?=
 =?utf-8?B?cUVqRkY1MlVYcyt0RGF1TzJtaDM4c0R0eE1naVhDZWt6LzdTazVROVMxb2JX?=
 =?utf-8?B?RnRPbzhTSFdRNmlySlFxQllndXRoRG8vUkhEYktIdU1KRWhTd05DUEwwRzF3?=
 =?utf-8?B?ZnpsU1U2L2lmMm95VjNmOXV6Z3hQMlJEaE5hZlYyR2xKcFZYQTVoU3hKbUNE?=
 =?utf-8?B?UTdOQ1FwU3J0ci9Uemh0d1E1NU9oWnVJSzZsbXQxK3FXZThSSGIvTEoxaEtk?=
 =?utf-8?B?SVJ1SS9kYTB3MFdlRlgwUTFMTEhXMUExZEdtS00ycllQd3VwUmEyL0RUOUNx?=
 =?utf-8?B?ZWw4YmZObllwT2E2bkRESitiMDMzeDlvSThyYU9JUXpaTlhPVW1yNU5Nby9U?=
 =?utf-8?B?TlRSa3BkK3BDbTZMcjFhTDA1dWtzcHhFektrUW4vQWgyTXpJcnBjN0t6MjRK?=
 =?utf-8?B?aTE3NWJ5aWp1R3FFRkZQVzRxSTFJWm5nWHBVTkU0bFdiMTVkb0ZDMnVnVGlr?=
 =?utf-8?B?RWhsVTM1WFZ2RXVXVEtPcXpJUFRGbVhFN1dhTk5KUmpqVkYxMnVQeE1kaGdr?=
 =?utf-8?B?TE54TGR0eFdMdWdqODhjeS92ZTc0SHVzY2xtcjEyRzh5MVBndlkzZDZhQ2Nx?=
 =?utf-8?B?Q3BaWjduc21hbjRhdmZKenQrS2s2R2w2MVRhTFY5ZkREVW5HMGFydzEvUSsw?=
 =?utf-8?B?SzZBa1NuS0g5NlZWT1JpaVAzQlExOXJYZjI4enV3ZjVVNmNRU3NLSGlEYnIv?=
 =?utf-8?B?WkxKV0ZHNloyQkg5MSszZEZ4NjR5M2lhd2ZUaE1lTmJDRjdjZVB5aXpnTzhS?=
 =?utf-8?B?WFJsS2JDV1lHR2RKVzdzRy9lYlp0ZlkyQXJCZFZFbEhlSzY5cjQ4QktiWU4z?=
 =?utf-8?B?QS9kYmVyYXM0WUdNaGJHVEpQSC90Y1JvUjZ1VUd0RUNBL244bWU4Zz09?=
X-Exchange-RoutingPolicyChecked:
	5033N3A35FlvRbEVz/MfsqTjrIYEd6uliBw0luGWtM4KvlA/Cx2bLTgWz6/LCuEIonMwnXwK4cCIF1BpwOuyk/gZ9RsNNvMg24+zOLXLbT8/fAk58M6Wlxkg/Yuk+MOO18CHVe5JKY23/39gXTWQWNvpiYD9UA9VNBjofsmZCb/4Xo7bihgJ6ywvFJwk+sWFE7BasFmzZJBLLOF2aOt1ROEfIXQoBzCLGSFbsPC5bpCMBrPVShpPKiJObrPPUzCFpsqi1R1+RtNOqTMDOKoc2QYVPqn5LLSPI4l9dzGiMHh7dM8NzmryEAJRXaoVUAkOrO7N4vSX6Pm/6rGjLDrG0w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc4be8b-f5a5-4efa-5399-08df23a92d67
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:56:03.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h47zTSbvcEc2JXB6i2wKFZSLXAH30JLJM+RSQvJDaCZyQAtJ7lNP3Nm0hhVIeVqo/PGAS+xi5q09QQ2tn1SuQ9D30CqXkqpV/fiozUOdg1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6667
X-Proofpoint-ORIG-GUID: DD8eJQWklNx0rrBfT-xQ4rA_gRPsHTsc
X-Proofpoint-GUID: DD8eJQWklNx0rrBfT-xQ4rA_gRPsHTsc
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ac4efe9 cx=c_pps
 a=hqbemJ87bpGpMWfnijcotQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=gAnH3GRIAAAA:8 a=cwL70XwcgPQPVm21dRQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfX5U2reOigjYBU
 5T15DkzzzmuLD8lwPPlbrfe3qs/eNoW4PjpjGqBERn9KfVkVh8O6UaMcgnaFdX6I86x9JIgkkHG
 kzfaOj8yviFN3/r9kxdobHTU9MeXqjZ3DqT5SmRIaKWVdvCBIIbZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfXyEJPVAf8531N
 2zQfooxR2Vjq7PGQ+ZuMkBRtMutYTeGUrKqkKVTw1cXfJ/1qtVzSG16Ik+9CfJi+ICccmDKVsXE
 6s7PdjS6+jU6ZbXguBrVUgwoXWxOOrcSgJR7gCEmn2BHRT7xDNeqooFPq8GRAKbvskWrplfKVzV
 DnYUAi8TKEpmRUVEBk+vy77laQjsh35e3CH9Aab+x2MX2OpWkg9gJHog4JXclmajqb3rJ+nbjK6
 4vI7tiCR+twzqhNFYaZc6KPgXawLuVCDGQbkCXwFY4he2Po5/xk/NCmfJ1spKbspHcjWZlWbkgi
 6XFsJTuGNo9RcDwY0GaiRDIOnJGhY0IYMDoI5QPfZFgAQ2AYDKEelDUohMch95iPH0VqA6Knaw2
 lARp6hAjjCskuBbzHJrAK4BTq4C42VvYZKRQgZv/U72aVJ5PUZ2vWEjiLvIgg7bU0NPZafHcp17
 JCRU4sq48RtfwdBdedQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060051

gpiod_set_value() emits a WARN when the GPIO provider indicates that it
can sleep, as is typical for I2C controlled GPIO expanders. Since the
powerdown GPIO is only manipulated in process context, use the _cansleep
variant instead. This lets the driver use sleepy GPIOs to power off the
chip.

Fixes: 6cd4c6459e47 ("ASoC: Add ADAU1372 audio CODEC support")
Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 sound/soc/codecs/adau1372.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index cc174ec3a1f8..b84495371b0b 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -798,7 +798,7 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 		if (ret)
 			return ret;
 		if (adau1372->pd_gpio)
-			gpiod_set_value(adau1372->pd_gpio, 0);
+			gpiod_set_value_cansleep(adau1372->pd_gpio, 0);
 
 		if (adau1372->switch_mode)
 			adau1372->switch_mode(adau1372->dev);
@@ -818,8 +818,7 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 							   ADAU1372_CLK_CTRL_PLL_EN,
 							   0);
 				regcache_cache_only(adau1372->regmap, true);
-				if (adau1372->pd_gpio)
-					gpiod_set_value(adau1372->pd_gpio, 1);
+				gpiod_set_value_cansleep(adau1372->pd_gpio, 1);
 				clk_disable_unprepare(adau1372->mclk);
 				return ret;
 			}
@@ -836,7 +835,7 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 			 * map. No need to do any register writes to manually
 			 * turn things off.
 			 */
-			gpiod_set_value(adau1372->pd_gpio, 1);
+			gpiod_set_value_cansleep(adau1372->pd_gpio, 1);
 			regcache_mark_dirty(adau1372->regmap);
 		} else {
 			regmap_update_bits(adau1372->regmap, ADAU1372_REG_CLK_CTRL,

-- 
2.54.0

