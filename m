Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883466;
	b=kE1P/YwTb19jjiFJjkClhsXNONCRvzqhEypEvWXOVH1fMbR0rcXJC5S8jdeEP3wTb8Nl
	 TqodJkyXzs9FQq9Lb/VXMfpH5vp28wM1BkN+rHOWjTCCOazKyb2UvRtY944oe0cd6x753
	 xNCLFU3pGArSNeYxiXvl/MeCV/ipSpt3syyBwO+fN6vmQ5+r3Gi9qtEr2SjSBWBXPobqe
	 bOULtCSGuCdDzSN+QRsKpdG5vrUmVel0RMjHR3XAZoTuFSImzTZu6VBB17P0aNcct0p3D
	 Td/P5QW2sNFoBKtQa31DC68TpW8wVgGJm29esuMt+c91HvbQtt5p4ATI4aPeRSufrkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883466;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F8VcheN8dF/4Em2IX9H/G7uKDvAt7qEZ+YFEQE6Qy2s=;
	b=Rf//dkpf65b7FXWxDIMoWJ9oYIs7u75Up8ZqzC//vMOP7IpqcXB2FVVrfP2XBoiT3H/U
	 NBHYqKZ9BzqPqI62C6/Apc/K7avy4VL84qc0N3mkogHzV+y07UX5Rz1lnYPVRdL7+lC77
	 Sp6sNtSA5eNmIj2GhAU4TMi1S+64IQSUkPcgb6kJLn4Dhf1cLN+RHAChl38mBkhiPqEDV
	 E0/r0ly9yG1gm6HYqB9DGK9MApjVx2zn88UxGbYyHsLmUgQ7emGfHKyI/4xYzjLevEzuk
	 IZ2fZafW5KR4uaCCUVF9Aio/66aL3mw4oLmXU1TvUHA8hQ9iCMJxlT02ynnRp/qIDLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=lxFpWJaO;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="yDBYByQ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7065606A326;
	Thu,  5 Nov 2026 12:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7065606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=lxFpWJaO;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=yDBYByQ/
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59uS1k4155342;
	Thu, 5 Nov 2026 07:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=F8VcheN8dF/4Em2IX9H/G7uKDvAt7qEZ+YFEQE6Qy2s=; b=lxFpWJa
	Oy419itjX1c1mOm0z5g69QP+TLFVlLgESYIZ93TRe+9W8nueF4qYhZB8EvFYTuPi
	3rICNrJDt8fBdjz0aDcGBPYpl1D0XZtMNOBoiYhUMjXuQ6tNeX2dQaVoElcvZYXE
	nRq3eJodCinP5bYf9ubxEPTayrs/DQaMGpkv9FoZvw8KZX6OIEzrrc7RHUpZ1JIr
	bWU8zyPBgXHznpgHCQEIVKG614DtEeMxaK2Jq1okAO3e2BWcOv9BytTmMB7G+G2q
	lhxT93yghpLwmr9/aJsSSXbcdGkz23JgQF6JM9VJr0zqE65RhRYan6jlx1CHodfQ
	GKTh19QGF9Ea7lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=F8Vch
	eN8dF/4Em2IX9H/G7uKDvAt7qEZ+YFEQE6Qy2s=; b=yDBYByQ/w5y0u653E5e/r
	ql0/Kvm1go/GOKFZO/0H+/u6EItOD7SRbHASdpxt2pTRxHijCS0ZodqiqkY5QwWQ
	vgTcaEFZrEDG1gAmfSnsKjOIC2aLOkXXFUhq4c0xYIDPLZJClhBabyzOkivV3hcs
	8yYsoBiETAjkX1IBlyRGPxosLnol2hC8tVFegRA1zKOT2S6m8MsDMY7bK3qYDShG
	FBTGurHGd9CnxoC5vGpkVYhAciSsruL0eizvbCfwK9WaxrcNZXsx4soRDbN1YWD4
	3u8u2WbeWwhdDPj9l+8HxDvA+m4kPSebALip7otY7fdFD2CR+p0RhVNaRekxYZWa
	g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hr3umqjbk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 07:57:21 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkhwBc9ig7l+CWuewD3htqsAo8/i/tO1wxaQewf2sBcYHGjCyv2fqLJ6LIX4VuEEObpgA5dQHWaX1j6bCl4V87hZjSZDmu74kbpgpa7lqr6XbZUMYde4toJSvfYwdOSg8pGL/NyAeR0ecl823OvDlQoxJ8Kt9c2tbaulEJ1VlUR/mo2tnT6ov30iAC+npJmFALc99jObMt1YLvDbpblW292YZdDtlhabfo3BVK0CsPEaidCczFZuAO4kTnyO1RWsUXbbSW4zBGPpGDDXSrhQysMi1bOCfd8E6TiPrTXR/xLdJ4kwGJL9Pn97HaIy+qPJ2d/hJ3EnincDrrvL2cTG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8VcheN8dF/4Em2IX9H/G7uKDvAt7qEZ+YFEQE6Qy2s=;
 b=ETzw7x4p69/hVFNHO/kTcl22/DsMGfGt3Wqtm5MfE1MDJ4JiO+V1wujWb/nKdBA4qiTL5TExbYjfvGlvko5D+b8Eu6OSC5Pwc+XnNEYGdOnQ51CmozhF4bU2sT9+E5kvgbMu8DgD0BySjviLFmrsAl78+ZsEad2gBqAmwp2IJ5gpisDe7WDGaYs5ofneyBFArma6CzZFaN8pvTr03j063xJ8trrw8U5mVD9AKL3mGIkjTDKQh2mu0wJzUExRd46cGz/StljwsB3xFX2xRQGmspDgMxdsYRoKz1m1VkEQDFdlc9UB6RzbnjY0E4ELOGXX1894+vQ5nlL7fFbPBAURXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by BLAPR03MB5379.namprd03.prod.outlook.com (2603:10b6:208:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 12:57:19 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:57:19 +0000
Date: Thu, 5 Nov 2026 13:57:15 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Message-ID: <aux9I60mqmfwkDqM@analog.com>
References: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
 <20261105-add-external-mux-enable-gpio-v5-1-96c5b62c86ea@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105-add-external-mux-enable-gpio-v5-1-96c5b62c86ea@vaisala.com>
X-ClientProxiedBy: CPAP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::9)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|BLAPR03MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: ca79db49-1b4f-49c3-99de-08df3b3c531a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|18002099003|22082099003|4143699003|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|56012099006|261021121427099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	PCUzTh9q2Ct74NkTf3pdwNuYUbW+1ziNLMQ+FTOZURk9Dc7/7jN1Y/YgQFfTKFhry+DMAE8DRH4+amMdTGWYNL+B95IivXdApF21CRimxrFX13kt9cqtoCywpEjBQWcHgKanMh4GqBdyClfvveGzIJL8ccNAvnOSf5O/D9kJTjfh8e+ELEP2mt+USF9VEub3ew4NVZ6NafJpUXjCVJiRp1vw3wK6JW82wHg6nqv+vEJyJ092KJIvi1jKDxkJaTCR9tbuZ/ry2WT5r/oIBwkAiRZeqQMabq4ZfCLsnUOI4jfBV30HZZDULAsRNsFDz8dvm6hFJTinKe5LE22xp9i8tDgNKxozKX5jWYd94Qlud72AIDAl/xzBVWqwOK09VhDf6TMMCTk4K1tSmUzgr1sxCxqa48YKH1AE39S8T0XT8o1WNU81GlhwMJJ1jfTcinMjIwgRqAWnS/HnWepzycTpqXCKc1sDSuJK+auo+l9P3cIeE/AVhYzE/Ldo3Vv8uD9PiklVdWs+PfgH/evAn8yp+MaTkmhcgTs9cv4XS8B5iC7K4Y/WNEe/r0OGU3aLDrXYdivuFUt91+ZCRYjpSXSXsyrR5fFUJjGAAJTf8Rl4NKGgLWj0vk3bLG3urMDV6FRD9dijj9MlIztN8HhTlgjORDOx6vk0sVpk2/e0a1Dma9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3FjQnpxVjR1T2FkTURHek95V21EMzRpVHQxZ2kxamFoUW5Ld2lTSTZ2VkND?=
 =?utf-8?B?Vm0zbHFRNDRWcldjblRBTFBsVis1ZTVRQUszeUVzZG5abyswV0toUnBMN2dD?=
 =?utf-8?B?dEsxYWJVTDk4akFkZFpuMDVLSk9HNHMyejl0Q1RTNkpUV0VDbGxXZm1ZS3JK?=
 =?utf-8?B?VjdHeTNXaStVb0FjTjdDRGlRYlA2QndpU2lPQ0pNUitzSWczV0JxcFdUUVVn?=
 =?utf-8?B?Yk9xSHJCc2o5Q0JMSGtma04rVzRIeG1SWThRaFB6MVI3NHkybHlHTGxSdUZV?=
 =?utf-8?B?R3FuYlVEV21vTmNTQWcvaGdMR1pxbW5MN1JIVzJRMC9Ub090UkUzUmEwK1lF?=
 =?utf-8?B?RG1KWndFUXM1cHVJVzRjNUlhT0U2T1ZiTDBhdzNEVXlqc0hqdVZSVEVwdmd5?=
 =?utf-8?B?YTh1L2doTGhlRHVJRTM5K3ZOYWhKSmZoODNVQkZUVStxc2JkaVlRQU8yYU5G?=
 =?utf-8?B?UG1lQlNmSU1mcEJwRWp3aGFsdUk5Y3RiN2lPcEkxVFJlbHlqamNQRkRCd21I?=
 =?utf-8?B?V2x3NUp5MVBWdzJBMFhKekIxTHpHczdZR1FoMysvN2dOcFhWOG1TTk9oUWZp?=
 =?utf-8?B?c2kyQmFybVZ5dnVQWWsya3pJdlBqVWpmVEVXZEhPcnB5aHdraW9NbkhCaHJ4?=
 =?utf-8?B?RXlrdFJtWXFCR1B2R043Q3dDR0wxMi9KUzJvcEhiRENIbVVIMDBua0tiL0Ni?=
 =?utf-8?B?K3B4SGUzSjl5TmsvMzQ3T0dFZHlFZHJqb2F2dWVaV0VrcURsSFZkRmdVZzh1?=
 =?utf-8?B?cFp0eHh5eThNK2JHenFXL28vZ0dlY1NERjhKb3FhVWU2RlJMaSsyL1FXa3ZS?=
 =?utf-8?B?ci9FdDN5ZFJxRXEvQUVGMDJXMEZ6b1dRQWdPZnp4UFNEMlJ3UFNpbXA3UVVY?=
 =?utf-8?B?SXJNbVozQzBSWU5JQ21jdFJjWVMrdjBZNm5BRUsxeExWM0xUNzdaVlNFb2ZJ?=
 =?utf-8?B?Sms5RFF5d09VNGxYdmlyL25xQ1BycTA5SEJVM21MeDFuakZLcXN5LzJJMmVz?=
 =?utf-8?B?ZGFjM3htd3hlQUhJbXdXaFpYZmFCamRDdSsyMGtVQUNyMXJJdmg3cHJiU3Jq?=
 =?utf-8?B?cmo5T0xkT3c2Z0xZeGdjcy9la3o0NDRQd2YzY1FkWEZMNHNsMUppWFloQWx0?=
 =?utf-8?B?TlZ6dEdjbE13elhwOTdpV0NrNGx4MGpzVHI4U24wL1YvU2RKYWV2WjFrdUt4?=
 =?utf-8?B?WWdNdkZvWmJIWlZDRG41RXB5bDRIenA4TXFTdm1SZzZwS3JFakpKYThRTXQ5?=
 =?utf-8?B?Nm9TSUNNbzhtbTVuVEJNK01WazVaS2o4L2pFYU5qRlVRV0Fwb1dNbkhyaFNi?=
 =?utf-8?B?cTJZN0pDTXFRSUVWd0l6bFIyQkp1WlpLSGFid1lUWTFQODk2dE9vTzBvd29I?=
 =?utf-8?B?U0hqbURYTzNhTGMxTy9GaGpiZzdqTHJCQzlhczVabjBHb0RYNzZZNlVhdTNw?=
 =?utf-8?B?c1Z5RGpSWXZUakZxczBtV0RPSDJMZW54UFFCR0NQWkFad2ZWUzdUTFlFZXpD?=
 =?utf-8?B?Y1NJeGdzMElXVDY5QXpEekVWSVVFeGhDRUhOTUZzaGR5aE91TU9EcndaUWhZ?=
 =?utf-8?B?MWdjTlEvVFN1V2lpUDlwUFNYQUc2ZlNZVlNEK1JpcGpEek9Nd1VibmRTUTUy?=
 =?utf-8?B?d2xLZEsreVE2MFYyaXJ3TkdISEhndEVhdVJCdDhxc3pvbjlNeWk5TGMrNU9v?=
 =?utf-8?B?WHZ4SmtpMkhxZlpaNkk5aXJkZzkxS2FEbm9rb3R6dENoWlRreGwxNEFLK0hF?=
 =?utf-8?B?NXpZbHV0NWdyd05xemZER2JDOExMcEtzY0M5dnBpT0hkdkdJeU8waW8wanpq?=
 =?utf-8?B?WDYrOWJQQ2I2NG1tanAvNmVEc1NiRXY1TmxKQWRHV1hMUTR2bDE3eUx4V1pJ?=
 =?utf-8?B?K0V1YUh2Rm51MGp0cHI4T3dQVUR1SitMNnp2Tzhta29mK2pBaXNQQ1B0SlJK?=
 =?utf-8?B?YkdvTXJzbllFRTNiMThUTHZudk1sdm02eUFaYWR3RXVjdkcyeW8vM2dieHN6?=
 =?utf-8?B?bG9EdmsxbVJncW1oWEZHcmQxWExsdzcrUnA3R3dEbkRLWm1HUHMwTVZzOGlR?=
 =?utf-8?B?VFhJckpqT2tjTityWUl6em9DMmladWRaZ1hOaU9iT244cWtqdjNnNzlHdmVD?=
 =?utf-8?B?d2llVEUra25LcW10OTdUWlB0c2U4UDJCSHRhc0xXTW11dUw4T1dVLzZlS3dH?=
 =?utf-8?B?aC9HelpSTjIyTm9kaDZCWm5nZjROSnJCaENVVDBNeWg4dyt5ZWRCU0QyLzI3?=
 =?utf-8?B?RWl0eE5Ba2M4UHRvblhBa2NqeFVYRlBmczNFZjRXSlhxdUlZOTJPVUs5MkhT?=
 =?utf-8?B?ZXliN21zWEM3NG41c3lOM1RTcGNTcmx4dHBkZ0NJa1Jod1lHQ0o5QT09?=
X-Exchange-RoutingPolicyChecked:
	XKzCrFTnqskOU+du29Epv29C/9hhN0yXF4ydo6lCkUdk+AEtN9G1U3CgpeYHj2J2/okr8ZS6fYlXZxa28LbYRbFXo+dJEcxzjwdqb/OUhmEvMu8UyVw5IINIqDX8fiDNggnS64+CRl478TSrpNmrlA0irnmCo7wvX0W/SFi9C3MvDwSM5Z8LAWYvCl2qXsaFSpKhNu1pNcDP5AwaBp5B2DH+N7qx+SG6KVgbbQ1gOHvsgGIoe4EKPCSLuD1oz5ogupcMPk2AoMitfLM/JbPEBSBZFM3gpNRtE5/TuvxIHtLhhdQUCmiUMk337+lOITwecb3UvALIPOJGBZeOM3L/0g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca79db49-1b4f-49c3-99de-08df3b3c531a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:57:19.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0XnlZ4LxZzXmxIsjDjl7++1i5thU+oqsNzKss+SzDgyKnRwlbmFaxuzTVq+ntIcPH8eC5QlVGDw8adB/iWT69ZzojGMfdq/1kOcFO9TeV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5379
X-Proofpoint-ORIG-GUID: mmWZXKCla4qXsofi_Z9mu4RmN8kPqaYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0A+fPw2P4VeV
 so0Wog99xy9lgF99/cU3Q+wp/Vmw6Q5vNZICXmoYDEBsxrMCLgFv70/xQT/bd6JtJNWtGje+Mc5
 rg1JBjs2GJzHSD/GRKE/qd1D9VN3eMduNC3/WvnojsS8IgYR0vp7iKolQBVmNhdBxeQ/TqQTOGl
 fHmR6oiJ1UIRDZ5PivwCDNYBfIdel5IWRUaZASVDSi6jJpz29CHK5TWXy5ErbEps59j5Sv4pWUF
 T3R6W61YtG87nVdRCcFzxIF0RvRhM0cx4/BW1A5iSg36AE9uef3T+/b6fPvEAbp9FjEkZto0eGb
 6xaceJBvQwmSWt3L+RZJPXKzCq/KlfDNFymQTP7eRi+cpBYsJQW8I1NhTZ3pJM3F8pH98y4B4KR
 sc7vRihfxId4Mm5j0pmc89lJYnl5PRakIK7abqhPSl3wnXuOilgA+TBZhuo1D0qBkM/2kWGJuwm
 26LqKLfqnU0XTzT0TMw==
X-Proofpoint-GUID: mmWZXKCla4qXsofi_Z9mu4RmN8kPqaYX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXwyeCg4qJG7wd
 ngL2cuveenK61UzsJj7EEFK2QZPpPb7xavwmtTkDILMXTPc+m2kY/LRGghzvZvCsATwB4qGpz+B
 LY3X+vwdu4XP1Nt3Ek8jU19+MjrSHrK8spzjLkMn8TdaBa8kdCtr
X-Authority-Analysis: v=2.4 cv=J4E/fwnS c=1 sm=1 tr=0 ts=6aec7d31 cx=c_pps
 a=ugQZG2M6WJJQC2vHgpB33g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=eWRtdWc1AAAA:8 a=XYAwZIGsAAAA:8 a=gAnH3GRIAAAA:8 a=4A_0fsVqj4tGHol96_0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=fQEa9puXOWAy-YWvlEz7:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051

On Thu, Nov 05, 2026 at 10:11:04AM +0000, Tapio Reijonen wrote:
> Analog multiplexers have an enable input besides the address inputs. On a
> 74HC4051 it is the E input: with E high, all eight switches are in the
> high-impedance off state, independent of S0 to S2. A 74HC4067 works the
> same way with four address inputs.
> 
> Two things need that input. The mux-controller binding describes an idle
> state of disconnect, which a gpio-mux cannot reach today because the
> address inputs always select a channel. And the address inputs are plain
> gpios that may live on different gpio controllers, so they are not
> updated in one go and the mux passes through the intermediate addresses
> on every channel change unless it is disabled meanwhile.
> 
> Add enable-gpios to describe the enable input, and require it for an idle
> state of disconnect.
> 
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  .../devicetree/bindings/mux/gpio-mux.yaml          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
> index ef7e33ec85d479ce57c5fe4a780f81a08a6ab6ba..2dd94704fd7bde238af4e84af87c2ad8e955eb14 100644
> --- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
> +++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
> @@ -29,6 +29,14 @@ properties:
>      description:
>        Regulator to power on the multiplexer.
>  
> +  enable-gpios:
> +    maxItems: 1
> +    description:
> +      Enable input of the multiplexer, which disconnects all channels when
> +      deasserted, independent of mux-gpios. Deasserted while the mux-gpios
> +      are updated and for an idle state of disconnect, which cannot be
> +      reached with the mux-gpios alone and thus requires this gpio.
> +
>    '#mux-control-cells':
>      enum: [ 0, 1 ]
>  
> @@ -47,11 +55,23 @@ anyOf:
>    - required:
>        - "#mux-state-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        idle-state:
> +          const: -2
> +      required:
> +        - idle-state
> +    then:
> +      required:
> +        - enable-gpios
> +
>  additionalProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/mux/mux.h>
>  
>      mux: mux-controller {
>          compatible = "gpio-mux";
> @@ -59,6 +79,8 @@ examples:
>  
>          mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
>                <&pioA 1 GPIO_ACTIVE_HIGH>;
> +        enable-gpios = <&pioA 2 GPIO_ACTIVE_LOW>;
> +        idle-state = <MUX_IDLE_DISCONNECT>;
>      };
>  
>      adc-mux {
> 
> -- 
> 2.47.3
> 
