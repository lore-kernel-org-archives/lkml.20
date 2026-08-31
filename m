Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD213C13EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161769; cv=fail; b=CSPNHkbUjiP8t9mlatjja5g1j4oittn1T8kn0WdUNpQWYNKD9uj0UhaZvyAh0meiQHGmlUj2Ep3/Cls6TkqnFqWbEEiPfwwWyQ6vfaigyX5cIr9hYymNAbkJpYpdbyFCut4oMX89N9kLOqAn9RCXrikA7zhPibmDrEdYIEkKnJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161769; c=relaxed/simple;
	bh=lOpPjLH8EXhj52ug0Q6nda9NX4IObM9ZseAB+tiYd7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s/y4rl2eVu3VpD+R8266jnI7tS6fM4/WZV4yoLkh+2smzgpK20WDDOFQUSUBmpXkvhS3smc1wNwZARG2WFuTQTkd4khmGUM+5Ld2GA+xqpYv2XMwNsQxhVEPe2NGPtXTjfN0/Wxdbbr6+vSy8HSLNkzU36SIyACTXost64bA/4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=bWsrLJDW; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=ukCDhRE5; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="bWsrLJDW";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="ukCDhRE5"
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V5A2sF4067927;
	Mon, 31 Aug 2026 09:35:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=1D9czW+oO+c5fRmRVSgZK1Vb
	qEMLSxO+jWJuSuQRAOg=; b=bWsrLJDWsUxTAdAbut03oNWiM/mGjVBzFMkRu4Gf
	WGOZF6sw5r7TUDlEhlLaPUw+N1ewVWDKFJhfDjVFSbVgqtWxpuW28H9jLixLeyUF
	WbOF7BgLu36BF7kjCATg+fM4YWedCjP1ZsHbXF0MXeJSDrvAOZQycuMxZIfRGt2n
	mfMSStzJJlxFVIg7TYg0GYWnbjdQ8UsukhvmB7CVlfkLFkxXqGoEtE1ooJZEF7FP
	SzWLOgwQk2JKy9XgBHmVW5aUGGeOFO8LQrkguOCUrJrP9zNnW4B0CAg/d8pnJh+v
	5MRto3BTvv31u5tEJAlvdnymJ6bYZ2/P7bn4FpHmlJYRiw==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022088.outbound.protection.outlook.com [52.101.66.88])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4gbks9j26x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:35:45 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye5LUoprmra4ptU4dyY/lCvb3xAarHTt9z2LrFxM4Kq7nvvtt/4lVr7ZkkFlKRFoRr91gKBwoCXd/zNuegb+AKeoxKhD0cLDnKZVhf265zpaaSAtP0J2hmY5xX0SMqifU6+Q2GGJOggvzdVvf09fTeomqZJKYp99vbVl402ATM7yR5STm01j233Bk3mSVjBZrts8Ok9TR7LwXwybeIiMGFYwY2fYqxD0DPVFNRRmrD7fdulWd4ZrgPEX2maveWe8GkXm1wLu5GiJo/59B4lAByu+YJJ8swuWWD5GWOox92sWecJsrnm1o4wTEqgoCNkh6gdHP2HNANLB4LosDgjpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D9czW+oO+c5fRmRVSgZK1VbqEMLSxO+jWJuSuQRAOg=;
 b=n7KwIxp3bGaxnmGixGNKOxYaVppXTmqkr0+ISVyPXJlpDrZaQyk+VKuixGjKD0KzS0CpCQNkbKEqPNHi9maiZKVH0kDef0nWhUGmQAG0AMsLUDhhLhuHq84rHV2Pi7LwFA6VFGV+PjCaZcbufQ4GDzDMuEswuRQ20uN4uPV00NJtjJd7Q83Gq1daQexnDBxcHnIEVe1vrJxlXUd0QeazJpMKdsU42hRGxuBqfQeVMN2m/UdIlgQCJuzqWK1eBJlBH2ML/o/HSZ/J4vdZ2typuIRYxXKCI2f19lRKKIDMSlHLQVP5uPfVdV4oaiH9yqsCcM9/PxYle+59Nmhzq2k7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D9czW+oO+c5fRmRVSgZK1VbqEMLSxO+jWJuSuQRAOg=;
 b=ukCDhRE5fOnHfbv5Ve2IVsYDICbag4OC4LeSfQNhk7gBUm1v+y7NJAuAgB/K31WhJhWQ8DatBYpnv+xoS4Rfo8EQ3JgyOf3mpRoeEEmjOdUSlthtxFQBClmSM27NMhiaA5RkwrVSSPl7MOQmxGNkMtxgR9A+eXKiTvB+ribD2kw=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0539.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 07:35:42 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 07:35:41 +0000
Date: Mon, 31 Aug 2026 09:35:38 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH RFC 0/2] irqchip/ls-scfg-msi: add multi-MSI support
Message-ID: <apUuyrFxd_ds3J_H@FUE-ALEWI-WINX>
References: <20260716-irqchip-ls-scfg-msi-add-multi-msi-support-v1-0-9795356d0ebc@westermo.com>
 <aocmn8mkac5O3OMq@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aocmn8mkac5O3OMq@lizhi-Precision-Tower-5810>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVYP280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::10) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0539:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b3dc9b-a06f-4f9e-f0eb-08df073275d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bAOImpGYTT8dewMGe68rdPilgjs2HhUdC4Mo/pRuKpyGtaHteFtmCI4X8j34bPMpYacuCA9vJTAumJZhBkettUoRXob5VrgCBU0YaoemvYX4AjQEF7FFgR4vyvaRBwmF+IxOWIw/79+QAi/0lTWVFeRMwp7mxijLKdDMaHpj3/D9RUkzDt+0CJu0LYC1eWWDJwpTxkNgtI8hTHtwlhAQQn5Dkwrr8YIpQmNZUpF2DNYMwbvlOMD48sRxok4+ZUtr3mZ5tf7bf0kFQbZauC6Yjl54xXwVZcfXONqGNnF0UpLroKvYWDBx9d0C7pEnyqqsx4oXhCTIfakW0YJmdW01s0POH0pcILQOPPGVsL1zTDdZbyq5ad8w5eWHyBRAwwDsLEliF3Vp7t3mYjqRxeqOc3IvtLCj9yk4u4mkswUeeporMw/nzjR7OdgI1/1ybPVB/+H03kLKW0WdwcYQQm4bcSMQOt21LYu779127V+NrUJGKsNj61qVNr5P+TPnfejWT9CbWlQccuAl9IfbRm4Jr4rhi5A4+tqO/M+6PONnOYpCo6q4QJR1Lth8AOfZLmAvU3bAJWzj0lkfB/rGIz810jhvifC8nLB83tzYtR4btN5pv4Fy3xfitKCPHVpGpgB5qsfOuVvll0UCipZUEDq871ecu4fCN15UlQlaDPJkErw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WiHiDtjDA0qIwia+FTe2XmnMnvSJOdBOSPxJ4tf+fMG9JhDcBMi/X1dNqX0Q?=
 =?us-ascii?Q?uDGl4S+/hKAVd3VhoZwEOpuDBxTWkH57VIGllhh0Nc29zCpyhqSnZcxt2eLr?=
 =?us-ascii?Q?eCB45O3BLbvHrSPe06369/vjDCu9rqhRUgC0gZPvsaYxZ7+gRoGxVsSOpSF9?=
 =?us-ascii?Q?lscJ3/fpHkACate8pY7x67pBaCz4iWSu57Ago5cfeuGBV44K7mzOKwPUgghu?=
 =?us-ascii?Q?8P+ZT5/dgBkL7c7XErZ6WMPQUq+6LgaOpGOHIsD6mhSxhf1WlVnh85gYUCaW?=
 =?us-ascii?Q?B+ZjRdihDdmiYOAMqtZFNe7vtrKHLTAO1sH1FjDiY7GdHfi3A/FN4y0savtc?=
 =?us-ascii?Q?c0qJ4g7aPwI1JgNBot2Avt4ak3dSvaL6PEE+gBoXhPituz0DDayF0JH7thy7?=
 =?us-ascii?Q?rcx9s6Wb1Fy4RmMDHsoG8K9MvYpqm8BglvkPDd2PXdJVUpHsR/pNXha1RxzO?=
 =?us-ascii?Q?zD21IenYec+VMvrg0edXU/PLKGtSS/KTjCgF3FHX3E+X+LrObtedzWI31G8+?=
 =?us-ascii?Q?mhATTllQUFtt1zOWmhpApdPpVVqH9JsGFmkt2D564mDmxCbfv0UEOcKQQCD/?=
 =?us-ascii?Q?hfcO1HRe2aXGUWNA7nyNjosBoPnut6U0eAgUoklg7T6sVL53ukHNJejPGR3x?=
 =?us-ascii?Q?AHUx7Ta/srbCMikEn+kVZ1otaO0lgVRqqcmGNaLDPhzaTBA5Md66A9wmGTSl?=
 =?us-ascii?Q?aOeZUDu5ZHoopcgqlyOugn4NWq0G66OgGW2SMbVxMWtFPDsjn1dXAcEnIIJP?=
 =?us-ascii?Q?UOG8jpla/LasXLckAT6klHq5lZ35/JAYY3Aky3URguP8VkpHC5uZ90pYutbf?=
 =?us-ascii?Q?TvTe+ppUOE+WSMV+518CZaK2UjbQ8yUrQzcloDFpAdCs48OrXDoOg82zsQQ3?=
 =?us-ascii?Q?Jvsa5w5OIPFgRB+dUTams83uXd4kp5OVUUBg2+UxNKwPnwL+ImKLURQnKfpg?=
 =?us-ascii?Q?N4ntSmrsCXep89QyfxhWfCsfSM4a1PciVJ5X8R9F8tFLmh2lXo0zCWv9WKwc?=
 =?us-ascii?Q?+X7A5n8V+S8LhYfae2MKdfSUh1cHO5eKyGLAeV2b1ialExguT7rhbEYHS4O5?=
 =?us-ascii?Q?pdTiSOGK1AGZ+uXHxDVqgbT4CvcsvB5Qjj8hVlAYdy9CggUBhRPutNjDcapq?=
 =?us-ascii?Q?TBRCF4asnniLfS2nm6+Ql4BqFVfeggByIgj61IW0viuCm29hRVMpQ6bSPvm3?=
 =?us-ascii?Q?ahyZpY82ONozbrlCxmrIE5utgP0uBC/ctPNI+qKBBcXLRaDJWeo2/og598ku?=
 =?us-ascii?Q?taRZMFopijfls/VHSic+EDlPMiBEOsB+I6HYeYDJXJk7RdFYKWAShkLF5Ew1?=
 =?us-ascii?Q?hmJi+NUVdVa5IuTZmnthiyRBULBm7+q0KjyZEnVBwbQxt6hCjw2ifRQZmdnd?=
 =?us-ascii?Q?h1jKEXjm+F4ul4wYOZ8FaUl1yD4hBvGzfgj0pVfvpgOQxKIlb9sr6mvTpSby?=
 =?us-ascii?Q?WGhXSzWf73fh3ldx3lQTlD/PlewWUjEJqeGZhTtKEEuIScSNjh5ehGAGoik2?=
 =?us-ascii?Q?kMrVq7622XdyGj6wT6vzjG3N4DeYzfGB7l08SYrmlwMW3ybvLvIcDfrfESYL?=
 =?us-ascii?Q?mZekhKTUBqPXH4D/vJrBMWAYWzUSwwswVhir9ZcfZoK37DELZ6um/+gxPXn3?=
 =?us-ascii?Q?NpK1Zt4IhX31cg8eSodWB1P2xQB/2hYPcDhU/L/eLwCzlp89v+wCRX+L8li5?=
 =?us-ascii?Q?eRLQg8lMWPYfUGwEXhDPXr1CjdmioqEThymardvhjYsEixH9UfOaTgva7R3P?=
 =?us-ascii?Q?P7gDUchjDQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	mr/4svOUoVinlowvjZS9xxXd2fNR4WNX/wvUlE+f3hftEWz0gpjyLqbmL5Ab1ex0stlN8n8FpqCRxbSF0ptEMxjHVaeHEFuq930lnStT3bDWV0wbcz0L61Fz4e4uTVL8aag9YHg0LnLCBeegsmt1RFwimNNXz8BTJ5ey9Ytqol1BAtpDXDZXsgIeuXNX1qqPqRdcfK0N85oCGrgFqb3+KlwGAuVSuOVJIndXD1uwi4jmnPdnhMf0mcaEb8Pm0hQW+IP+y94fOeFL7eWHXVW8huE423c4eycBnY6Sn5EiMndo22NfxBZcrTpac1iLlM5ePb5wmHX1Pj9TlHQ+2x2ACA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sm0b1wgN8NOD+FMuk/eZ7SJ0/7i20l9AlhQfjoCmajAmETrL6JlwkA7vzW2o3xpLS9VTOdHQZRBrItMsEejfLS6PctKCYB9u3+GsXeFXQBrh5fvY+lw6g/ud+0hlHeR3uSQuihelcip31HnPpDkcD8szEjpOaAMjJqVdFydYQBsxtcZ3hC0aB9mcAJuaps21rc1wVACUA8p0ZNAGbOs5q0y/ALTWfdxD0qC8JuJ7dncgXhpg13LpKFeGwzAcSP+y7RZtjNfmNlZre4wHTSOE9fFImQXd6ihg48HEJlIUzB3J6M10xUucVDpV8GM//m/7w+Wh6aqxKvWxxu466oamYa7mVRuusLN8Hn656dQNRXj9usgQS6tEaTTf5Df1WR9dlKICO4H0o5vp3dMVUg4TlrEGLtNBhzgAlPfJgW26B4l9HICE276c6UI9nGnHFtJkNFrD3gTO3NnlN7Pl/25lwNPf/TrO7XrzsE9lzJB2SS+TlnBMi3uboUl8Mcjyz4ysrbOYP3+1eCkyZ6yEH7U0LL/7jZKvmbUw4Yt/umZXVEuz58ludjFPKjbNbYLEY+i7x2XVub4NAx9ckx5Va1d+aSjGtKSW0eRv91UfKeWFSPaNksXHomJSEq2B2+oHkKNQ
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b3dc9b-a06f-4f9e-f0eb-08df073275d5
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 07:35:41.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ms4MAvnGQoyKSTiDaty2OjZw0AxqJS3L/ajHzy03nnC1d6VbZqI3RtUWIoMAyygTwC+Sv2k6is+jVStqi6JbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0539
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3P192MB0539.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: AbzQAP8qdZnZ6Cc2ZVC17KW73fhk_AL1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NCBTYWx0ZWRfXx5tIGFwgidGy
 2MYnMhrLv/mdSMcKOj+K1pJYqfKm7uANoYq/5IUSdekgY35TaHnyRd9/N1arWDK1tkYljP1glj1
 QIQYxolgM1Z6u1eaNRgdEjata/Vsrc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NCBTYWx0ZWRfX27NpT0+v4YH9
 ZFbZQfS1Nl+1RL40dH+L3ZKIXBJMiCzyZMV7TQjqhei6CXP8WTKlohKfYcBBtX7wx7Qj56cTB7X
 jpoVzvZX3sqJlcxWjiI0x8IX0u1l8z6tl5gFRftuElQXsv8xLBd3Tz7D3FL5QMuGATJJ+2SxdG6
 5kI1H3Cio6DuG6LVHpXatfEA4NTLNu0lh2jLjOGoS7BYTFKV7N5NZkc1YLppQ/H35niLMlrGFGP
 /DuFhnMgkgMeGJCTbi8tuF+8O2kl5ahKabNWVhWuAUIxwZE/4SttU3hNCYArRaYRc9T1N6QgpxJ
 cwzBIfAKahNLQcXm5aEyb31EXAL4UJKswJXXHCXxfMqFWlHxF7OQzFHwlJKvVxkL9LrGrr0j3Q2
 ughpC71ULGqqKxO5c1NUBDYUPVXdGV9cSC1ed3Bawr1K+w2szLiuVCq4KPuq0pTC8DP9LfwFn6O
 wtd8OZ3HDi0lekAsNBw==
X-Proofpoint-GUID: AbzQAP8qdZnZ6Cc2ZVC17KW73fhk_AL1
X-Authority-Analysis: v=2.4 cv=UdtZ2qSN c=1 sm=1 tr=0 ts=6a952ed1 cx=c_pps
 a=dbUzIFQRYww1ZHHWNiTqxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=fkVLOcnhDmaPC4T3_2EA:9 a=CjuIK1q_8ugA:10

On Thu, Aug 20, 2026 at 12:09:03PM -0400, Frank Li wrote:
> On Thu, Jul 16, 2026 at 12:14:59PM +0200, Alexander Wilhelm wrote:
> > This series enables multi-MSI (nr_irqs > 1) allocation on the Layerscape
> > SCFG MSI controller so PCI endpoints that request contiguous MSI vector
> > blocks (for example ath12k, which asks for 16 vectors: 3 MHI + 5 CE + 8 DP)
> > no longer fall back to single-MSI operation with all interrupts multiplexed
> > onto one CPU.
> >
> > The first patch is a preparation refactor: switch the hwirq bookkeeping
> > from find_first_zero_bit() / __set_bit() to bitmap_find_free_region() /
> > bitmap_release_region(), release the region on iommu_dma_prepare_msi()
> > error, and loop irq_domain_set_info() over nr_irqs. For the current
> > single-MSI case (order 0) this is functionally equivalent; the only
> > externally visible change is -ENOMEM instead of -ENOSPC on exhaustion.
> >
> > The second patch enables MSI_FLAG_MULTI_PCI_MSI on the parent domain, drops
> > the WARN_ON(nr_irqs != 1) guard, and statically pins each MSIR's chained
> > parent IRQ to its matching CPU in no-affinity mode. That pinning is
> > required because affinity mode only releases every (1 << ibs_shift)-th
> > hwirq and cannot satisfy aligned power-of-two allocations of size > 1;
> > users of multi-MSI must therefore boot with lsmsi=no-affinity.
> 
> what's happen if not set "lsmsi=no-affinity" at boot?

If "no-affinity" is not set, the system falls back to a single MSI vector as
before.


Best regards
Alexander Wilhelm
