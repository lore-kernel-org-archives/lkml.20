Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485003;
	b=gsjLWhacpimkcoU0f1MBlztJlJUC4LShCVGdwUX3xDe+tMZiUgwiRrbpwUgqSlxn98xE
	 2ww4PIgSY4zjYTxq153d7eq3YfSDKC89Z8OnbA+sJwAvNE5fL7TQWm/i/yUWdzIaxyzuS
	 NFHp1oKni9JjGROSLDyOcagKwTh0aJeYtyjxk3qtdncIofP/BcgrQ89h8kvNmoT/L2InJ
	 vXL4Oxz3IoyufVMHoz+OEBPipOwNAksdEx3UyuRwgGeXvQLo0wGhsj3V4ua0vZ1bnoQNM
	 P2IHZnUbkaztZJt7pUDHcyhlR2rO7ldeO76lYnCXGN8l92RQTCa74cEUxTmDuv0ReLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485003;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5zeYIg+9nbeBr/uxvntI1xKT26Om7OJc4lujx4D/EoY=;
	b=iTC6xi6IRUwM/L+GyrSHKfc4ag5C/+kHlKy4QdWH86EpOy3MExUy1q1P+yFgALSHILR9
	 XJDH79Yng+D7OSCONc2809vwql9hAfgscENRKA6u+oYLD+BO50UwDNs+ptG2GjItkRIma
	 bVJKyu8OiTcxnpkZmm/vdVNX34phDSp5Av8Vf3YU4n+YePsW7MMUQf5rwCu/Q7BnMmS+C
	 ncW0fIuoIPsKiAxIGhNkia6+u6EoA7mqef0LoSpcvoZSdDVbdN3a+lDe11+sMcoZhR1mY
	 VMJC68UhJ6giSU2tLuV4XBnPs5XZ15c130SxMakJLYyNIWMVqexdG6iB+mJ9Ap/QO+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=WS9eUFEY;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Wtrc3+oD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53A606A31D;
	Tue, 20 Oct 2026 08:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C53A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=WS9eUFEY;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Wtrc3+oD
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6mqBo2341376;
	Tue, 20 Oct 2026 04:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=5zeYIg+9nbeBr/uxvntI1xKT26Om7OJc4lujx4D/EoY=; b=WS9eUFE
	YyeM83PAc3w3UAMZ70yp3jmAqk2MGc7XNRvElbUsNtoOAZC+E0mDGZDq1cViTbPJ
	qEMNMSJFnc3ck6sogZ4f3ZdYvYEDX939X0Gulv6/6Ju36LJsOhL7klDa4pkSVwoN
	BMhBjNNSpTz2yFrwN7g4uEPMWmAfwwNA2mHL/VK89wm72DtmJPJusF+CrCJcx+Df
	IPFLi/zh9HSfxLH7bMM/sAmAyDW4mcHCi3BsTWUELrZlLgbz1riY8mEwn0QZEhz2
	/BzXEokRAkDjhYoKVVTytjQHwgL0J6sLsMYcxN6eTJeCMkWQT6D+rRUfkn5BUCxq
	dRmioycv8PQKOzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5zeYI
	g+9nbeBr/uxvntI1xKT26Om7OJc4lujx4D/EoY=; b=Wtrc3+oDFNHfXofrXErQT
	6Dci3QtC+99LyCCBw9m7iLQwm8sjWj1gHqdjNP9tvb6GwpV/LJsW3oaQBF5Nzkr9
	jm08lRVtmZiylaM6swYj09Hoy93ZYaDSP/qk9VviZNbbE8Nid+ZL+aJeCbjcXVoe
	bx0qdaOCbPvczIKIqlJVEUekc9vZsemnlqjzNNFsFNvuCq30h86dB8D63rkmkw28
	zfQwWozClGfCOcekHlHzwdU9qNvHDT3w+WA6F6fhCihuTtsrYG2s50K7zIOsgt+4
	BKydiwne/61JeFSmlnthR8BRMx+hlCEnBWAKwc6w6sNDIqzjaXvLRTxYq4GqFOL7
	Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw68tfj0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 04:29:34 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UP9seZ1OC0VdEYyziYGnHMsqHaMW5eUxIhqcUiIVB9GRFEXKDEtIP8YbWF2uvYanZ0ah7RgMXfj6CI9yws2s2zqC6ucrNshhYvIAUbnu2Slhs077fKuHWGt25xoeqPYXJlhcwS0lFbX1gnSaSDQ2gAg6jezxcSgpq2Ox5PKvuXm75x2LTDCqdw98CFJVeCj2MwqhgPapQiwJTwdazdGKVVfmizgqMN5a9x7L/MEbpCOCJTk7TgtQCRr2NiEnv0Mhw5aWQiVzcOmiehbFGE8WFfnu/DcNCff1+XOOD4N7dVGy8Whi3b5K1dMbLtRX5aIRzhnkl7LBWDcDhqgZ6MTNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zeYIg+9nbeBr/uxvntI1xKT26Om7OJc4lujx4D/EoY=;
 b=SZsrm3jNVXPiXBzp6ZmwA1OPqzXKShT0vgVqO6MEfHZM2HvD0qflre7C5C1mHyIHm5+cKzbQ9+miDblshlihTNOLpU5ONASbv3KSTJM1mhyeie1E6HcdrySg2bDZjMs2RFIq57r9Imx1hQox4pzt6P/gAs5OeqErf5yXDMp0rRDeFmMziVIDPAV2jfqBInqHV3c2531T/fzjVTj0t5t1yxEKIZp6Bi7swQ6Xt2LJfsWdYFDrZUnb8iehNdrt3swFPtuZTRlUzYBaV3g2IAWYSa+634Vd/AX6V1jGwlJyYSXJUKE9fzK9rxY3QMs8HABryJu+eIGsQehT6bW28raYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS2PR03MB8369.namprd03.prod.outlook.com (2603:10b6:8:331::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 08:29:32 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:29:32 +0000
Date: Tue, 20 Oct 2026 10:29:29 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, p.zabel@pengutronix.de, corbet@lwn.net,
        skhan@linuxfoundation.org, rdunlap@infradead.org, hansg@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
Message-ID: <atcf1PFVcn5pdsVO@analog.com>
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
 <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
X-ClientProxiedBy: AM0P309CA0011.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::33) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS2PR03MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fba2e3-356b-4e71-95d9-08df2e84439b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|6133799003|10067099003|22082099003|18002099003|5023799004|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tTdTvmzUrfzJ2lX+jBOVC5pXBOyaTIlDgE2U+hnUvyrhI32LdyR2s9SXYrXLQCBPBK0NG1SbI7X/qqwfqE9PjLIz0GLkr9sr4/ivV78aWdBI68rbh3bcvWm5fST8q57d0BwOtfJ2oNjQzN8L7fLpmPNjj4xfzWW15nvRVdg8a2yCdr31pYFKuyk6Vsuffi0j7JO+RNEN9qujnAsFLKgZy6ptqQNXzWcWSSefNFaVbt5l6e1C853URkn7BBqwLlnT5yHoiCoTlgyNB8FfFOIoQUz/qUsK3ai7l7POyKmGhflrNCSx+ZcSmCNqDhLr58vYja7g+KFPkbxfao8txv3gBu/stD2PtSmCYh9s0uVKao8rkHyEd7hvHio0IWrwF41FEsRjS27JYzJBij4E2uluRXhD8FGzbyXThzhNlTAoCbvTJp9Fv90aXqTlpoF1qd0a/vU3Quug14/yQ552/+7KF4SFf7bJ2//05gXbSGOAfAUhTa+y5RAE7gsNcx1/E8P+5kCF8AknCtTeLONwhd4XoGXN9WSbIy7kTQqX+DjqMQo+dGhIgMTmrqq1+9vo25qA6y8S2EoMkChjQrinWLxxxajqxHY7gP5RZSNysBZfVhW3s51GBILs+5FlGV8RWW61
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(6133799003)(10067099003)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTFtMkhZTkczZCs0Qy9RSW82a3k2WG5hOUJheEVENjB1YVdNRUJLQUhaNWxq?=
 =?utf-8?B?aStQV1VoT01Pc3dLL3IxWFpqamIxS2ltMUxlbTFSSVI1MkJFWmFEUmoxVHpN?=
 =?utf-8?B?MHhVYlk2RjRnOER1MkRLUHpQSmJLUE4ycEgrNkZMVWhPTzQxbmFhT0w4SmZv?=
 =?utf-8?B?QU5NUzBDZzh1dVNXclpLSmRiSmNYZXVMaG5pQ05iVHZhMDFjcjE3MEN4QWpk?=
 =?utf-8?B?RmJ5ZWpjM3crblNGelBkK1UxdXgrK2RJc0dVRHUvbTU1L3U2L3p1RE82ekFI?=
 =?utf-8?B?SG5YM2xnZnpuK0IyZVZLdGZwQXBoN202bDB0d29UZm1HTXUwN01mWTlLTmNM?=
 =?utf-8?B?Y2dCMFNNNzNhVGNRbGpLSlFDMkI1M0JwNytZYUE3SFJsaDBLallrVUpCOGJn?=
 =?utf-8?B?QmJwVFlhWFJsbk5XRGR6RHhIR0h3dzR3Y3F5cVNMbmFzVWt3N092WTYySURX?=
 =?utf-8?B?dHErUUczc0ZvaVYweVdWd244TitWUklOVDR2NCs3a3o0WFovOVRMa2s2RXFK?=
 =?utf-8?B?Y2dHNEx4VGtHNTh2THpJN01hcEh6djZPZ2c4U2JxZ1BiZS9GYVJBOHRDejJV?=
 =?utf-8?B?cHIzRGJnTU1mbGY4aGpER1NoWUpBdnFuNjl4dmZpeTk0clo0OGozUFBvTGNo?=
 =?utf-8?B?d3l2Y3dKVm1JZkQyazRFLzl2ckIrUFhhTFBxRmMrZ1lyZjdIZjU2L3NvU2dE?=
 =?utf-8?B?QTdiTlhsMklPOGh2YlpmTUJOTlZIQTdsQmZ3NS8zY1ViU2M0VWRhYzhZeTY5?=
 =?utf-8?B?TWEyc0QwT0lMMVg1SmxZSEpFcWhxUEpXT0NGTEN4VU52MUZLbmQwcGdwcnRL?=
 =?utf-8?B?c0dtT1hGMzVNYTV1S0tncmtMSHlCMllSdlVYMXhpNUJUVDV2eXkxUmZvWUxR?=
 =?utf-8?B?a1NUNGZvbXRiWDE0SFdiR1dzVVJDcVhkQ052TEwzcXdkZUI3VjVWTHJqWS9P?=
 =?utf-8?B?eG83Vm9yTkpWdi9lL0tjb1dMait2NlhENlF0MmhwZ1M0YlNmbmlLTUhXWHVw?=
 =?utf-8?B?OHg5RlFhNXk4Q0d1R09ScS9jajlrNjVKQ0dVSXpqSFJiU1Zka0J3eFo0QUZ1?=
 =?utf-8?B?U1ZDZ0ZyaUNkZS9PVlhGSnh2WGpPK1liSndQcm9YNW0yWDBQODVCbXd1SEp6?=
 =?utf-8?B?WS8xR2o0aHJ2NCtwWTlCQjhLcTdtcis2RlFSVmlVQTNuRVY1WGFZL01paSt5?=
 =?utf-8?B?VWJJanIweW40T1dzY2JOZWJicDJOZThaV3IvV3Q0S2hGZFM5WWFER2xBYnRQ?=
 =?utf-8?B?VVFxQkJjT0Q2cXk4NmwxQlZSVmoxVzV4a3NQQWRFUzFtWGRoTGJNcDRNQmpi?=
 =?utf-8?B?aGNEbElCOUhSQ3pBemh5Vk8wVUFTeUY3QW1VTEVQNFd2RHJtcUNGd2owTzh0?=
 =?utf-8?B?MXNMMDNxVmJUNU1zaEVUUGUydGovNStzdVZFWWh4RnU2WGZxUUkzVFFURDU1?=
 =?utf-8?B?UTIvb3dpOFgwZW1LQVFQSmpSUnpwUmVOT0RaaG4zQjZLNDBkMjNzTkVKK3Vz?=
 =?utf-8?B?elo0OWRBOGVWajRubUswY0swM0RDdnlzL0d5dHdjVnJ2NzE0ZmdXTldEcDlY?=
 =?utf-8?B?cU1nREtFc0JlbGhPWmVRYnVTQTRlMHc5RW5wZW9oYmZaNGVJcFhwVjF2N3h0?=
 =?utf-8?B?bk9NV3ljbHRQaFdVYzdQdGtGR2xoR1NjUWRaQ2VObVEvRnFPNkJ1Q0J6Um5o?=
 =?utf-8?B?Z2NiZytvemFHMVpMK2pObk5zbjhwQTRpeTNRdmYyMUI5enlGaVkvbmxMZXZI?=
 =?utf-8?B?NTZacklNYU1vcDZ5cXUvYXNCbXVIQ0U2UXRBSmJ5ZGNsMDh5RWJyY25xTWs5?=
 =?utf-8?B?YXNja1RpazArTGllQ3MxeWFlWnNKblRhTzdOTlcyZTEwRkxuSSttZ3ZZNjFa?=
 =?utf-8?B?SW50clBGbU1DTUZ3Z1NZaXFPRmsrVlJ2d1VSQXdadURLZXZCVWFHay83a0Nt?=
 =?utf-8?B?bUtKVzZIRFlmYm5OazZSVi94bWJPRzZwTkxnMEtVTHppblBrWjhuc0FzaHU4?=
 =?utf-8?B?SHI5U0VQYUcvQVdsZkEyOHYvdlkwR0JLQjZZZnNNMDhSd0krazhBb2VrT0Uy?=
 =?utf-8?B?MVlsdkVuY1VCQnczZlgvRytUVTNleUphVWtvV3NCOGxGMFp0aHRNVGFzV00x?=
 =?utf-8?B?elF3NVpxT3FWRFRQV2w5cW1LbFd2dkY2RHhhQ3d5VExmaityZnAyakdRWk9I?=
 =?utf-8?B?OVdrbDEveitTbnltZHpEU1lDc0xERGFSNlAzWVVRTUh3ZGk5T3ZUTFdKSElK?=
 =?utf-8?B?dDNrT1UwblYrUHkrTDNMNG5KWUZHWVRCY3lub3RNVkVCNDFpb29HSVhKN3lF?=
 =?utf-8?B?RzZiODJJTXZEcjVteEtDVUZYUC9VdndLYlR0aE5QMjJib2kreldCQT09?=
X-Exchange-RoutingPolicyChecked:
	QY+17v68rShoSrBVyfi7YTpLbqaQAyrzDPGbA8AunTXr/6pgKr/1baT+bAtInwy8hEHvcBPvdb1oKkjxVrF/CCYAmp2US/LB5AC6BIuJ/Xw8uX2zkLVL5gVNumcM5w6c1WqGUO9mePIRWfWSCoHAQOUzdQ8haJLpcd0Mmsx4SQg99kwibgChsHAAKEbk6Q3wdJ20SY/A4YY6y7+a2CTQum3LiBUELzG3fUOmW3zV4NtHl2xXRyHenA/rIfgkQinrfcnI+DvRGD+6UMq6fgGEfrGNlKPXJ1mHYamEUqrO6O0FziWt0luZ5ebglRUOHqhRrnNiIWaI/+m9E+eTZUA26g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fba2e3-356b-4e71-95d9-08df2e84439b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:29:32.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPP1bWiESpzPHQVcQsGuJKmQEWCNai0KMl4Tr91ZrrTpYxaDyEi4cPLJb+w8j/l1HVtcJ69lxzZKTXFpPHSwtKIctqwF8dOb1tKKwnlTigk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8369
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX9mwT4ftn/4QK
 WharUISV/K9Yi/fWFYAZiq6zum0qH85pNklATJKY55xGXxj94lcEOZFMg0KTC9+PAm6iRIZxrTX
 Ah/q6AGdlT4jSp1SxYXrd1XUW+nICYnjOeJgJ6wgyX8idapvNQcQ
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ad7266e cx=c_pps
 a=cvmpvQQCsZncHh92cDAFKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8AirrxEcAAAA:8 a=AzWQk9cK94q4mdJfF2cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: mFXYVOp8pZAcLejA80fI_5Xq8EECdRMz
X-Proofpoint-GUID: mFXYVOp8pZAcLejA80fI_5Xq8EECdRMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX78qG1gTs2qbw
 i4QcOshKQnZ5C87XaG5NZMIb/zTKrGbjJc70arpAtWr0ClfL+2fkv/c+HcTpvlOdcrVh16ns12j
 80oFxkjC7GG2NktkTaX4h8XvPEKd4//h+57JbCWZ/V1ffEoWtLaYf0jkYpwXk567RkSrIuuNWs2
 cGEZTjgyPPedJM9fjxeomg0Rab17IT+hY0Zo4+ed9uxt+/D6PwJxo7bGtFmBGKPzLUWJ752asZh
 xxdOkuXsEvJcq7F7WU0hXciSsSv21yhb/Xbv4UVb6vSQ4lI7Kfp6lsF2Ztt6jqVzBRNpSSTlv/F
 3nkxIoeima4Y+5HzEzVJwxoa2DTjpJpUAXEOk3YIjT8BgOxox75SHZEYsinSsAkF6yYqpRTcN3S
 MVKlZbS+iCVyGKaXBkEBvYak3874B21KYWwB/MczwPDZQicw10kr45Lvr+bHLz0rvmU0FQXgUxP
 SfHwQbh52c0cQLV9Hsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On Tue, Oct 20, 2026 at 03:17:40PM +0800, Shengjiu Wang wrote:
> Hi Philipp
> 
> On Mon, Oct 19, 2026 at 1:52 PM <shengjiu.wang@oss.nxp.com> wrote:
> >
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > reset_control_deassert() and reset_control_reset() guarantee that the
> > reset line is deasserted / a reset pulse has been issued once they return.
> > For a shared reset only the first caller runs the hardware op; others just
> > bump the refcount and return early, so a concurrent caller can return
> > before the first caller's (possibly sleeping) op has finished.
> >
> > Serialize the shared refcount update and the hardware op under the
> > existing per-control rstc->lock, taken before the SRCU section to match
> > reset_control_acquire()'s mutex->srcu order. The lock is taken only on the
> > shared path and only for may-sleep callers (reset_control_reset() and
> > reset_control_deassert()); the exclusive path stays lockless. Callers in
> > atomic context must use the new lockless reset_control_reset_atomic() and
> > reset_control_deassert_atomic() variants, which skip the mutex and so
> > carry no completion guarantee.
> >
> > The op is now called with rstc->lock held on the shared path, so it must
> > not re-enter reset_control_reset()/deassert()/acquire() on the same
> > control; a lockdep_assert_not_held() at each lock site catches that.
> >
> > reset_control_assert() is unchanged: a shared assert makes no guarantee
> > about the line state, so there is nothing to serialize.
> >
> > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > Assisted-by: Anthropic:claude-opus-4-8
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > Changes in v2:
> > - Serialize only the shared may-sleep path under rstc->lock (taken before
> >   SRCU to match reset_control_acquire()'s order); exclusive path stays
> >   lockless, and reset_control_assert() is left unchanged.
> > - Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
> >   for atomic callers; gate the mutex on can_sleep so no shared consumer is
> >   regressed and so it works on all configs.
> > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> >   controller op re-entering the API on the same control.
> > - Declare the new variants and stubs in reset.h, and document the sleeping
> >   vs atomic variants in the kerneldoc and reset.rst.
> >
> >  Documentation/driver-api/reset.rst |  10 ++
> >  drivers/reset/core.c               | 204 ++++++++++++++++++++++-------
> >  include/linux/reset.h              |  12 ++
> >  3 files changed, 177 insertions(+), 49 deletions(-)
> >
> > diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
> > index 932699c57d1e..0fbc1ba92dd8 100644
> > --- a/Documentation/driver-api/reset.rst
> > +++ b/Documentation/driver-api/reset.rst
> > @@ -185,13 +185,23 @@ Given the reset control, consumers can call reset_control_assert() and
> >  reset_control_deassert(), trigger a reset pulse using reset_control_reset(), or
> >  query the reset line status using reset_control_status().
> >
> > +For shared reset controls, reset_control_reset() and reset_control_deassert()
> > +may sleep and must be called from process context. Consumers that need to
> > +operate a reset line from atomic context can use reset_control_reset_atomic()
> > +or reset_control_deassert_atomic(); these never sleep, but do not serialize
> > +concurrent shared callers and so do not provide the completion guarantee of
> > +their sleeping counterparts. The underlying reset controller's ops must not
> > +sleep when the atomic variants are used.
> 
> On second thought, this change lets reset_control_deassert() sleep, so
> any driver
> that currently calls it from atomic context would now block. The new
> _atomic() variants
> let those callers opt out, but I can't tell how many drivers would
> need updating, and any
> one we miss is a silent risk.
> 
> Do you have another idea to fix the concurrent deassert() problem on
> shared resets
> without this risk?  Or should we go back to the original proposal?
> https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/T/#m66615477929b38f788d6d22a2c0bb9ca62173e89

The reset core could borrow a trick from the regmap library, where it
uses either a mutex or spinlock depending on whether the underlying
reset controller's ops can sleep or not. Check the struct
regmap_bus::fast_io member and how it's used in __regmap_init().

It would also allow the problem to be fixed for atomic users. Right now
you still have the race even if the underlying reset controller's ops
don't sleep and the _atomic() API is being used. But if you know that
the reset controller ops don't sleep, you can serialize shared reset
control operations using a spinlock.

With the above design you can leave the consumers alone and drop the
_atomic() variant of the API functions. (I'll also point out that adding
sleepy/atomic-awareness to the core would open the door for consumers to
report their requirements, e.g. that the reset control musn't sleep, and
for the core to validate this with the properties of the consumer.)

But... it requires an audit of all reset controller providers in the
tree, to see if they are atomic-safe or not, and report some kind of
.can_sleep property to the core (like regmap's .fast_io). I have a
feeling this is still more straightforward and less error-prone than
auditing all the consumers.

The other downside is that it's not a simple patch which can be
backported, which might be what you are looking for.

Any thoughts? I can also help out if the idea seems good.

Kind regards,
Alvin
