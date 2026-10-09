Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95014D795D;
	Fri,  9 Oct 2026 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560309; cv=fail; b=OL2TyAhn/5P0oLgZWESg10puM5rOZZueZ9ReOnelZyldbLOVmP7NFgBc5vJdYPRzb0qU9qr3f47ofcGkXNBc9hGcDDKqVq71jqr2ZSB/3ibxmtMlsYoZ+imOjx3Jm7QqYjOvS4wzyYoslM45W5e8sNEweqqUKMEkP+x7GDwmeXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560309; c=relaxed/simple;
	bh=yMBT2kRO0H/QKOMKSxUWTfEClOOvr/rv2t866HtGJJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F3s+yr+vO68cPUJBNIkf5gTZ7J4UgfvjIjqwBX+x4l/xNnKX7NAGUjoN2OqF+HuybQeDp0dD5Wd5d2MZel9RMsl4mWKmstFe4TriCpBBrlsrUeoAR/FJYcqWybdUyQAAovLcUeopUk+6z3/CeFguJCGzQ2viAYOWI2O2HkCCquA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=YebOGrnk; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vc/T3RvN; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="YebOGrnk";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vc/T3RvN"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DOb0e1543052;
	Fri, 9 Oct 2026 11:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=fkUMJelHwPmCBheIYy0LBInslb/neWZuOrjO0pn9Ki4=; b=YebOGrn
	kWSBbml0LbRbizO8wcWdjkQGglfdzTGCUTUjvg/FmZvZ849Ei8gF7IdSVxYOeh13
	MUto3flelN2lPgCL+ZKIglM0H8C6EOdt1XzZs1Kl6JmKvMhrKVqxIloPZn52Fv8Q
	ri374YpVRmxTQcjkb+xUG0qUCwczlDaWdGZ3/xye3zgeLB1SPPIOhe44oawz9awz
	ICEihUrw3oNgDICChtpSjPXg//L4OIq5ngUDiOqHJs/OS+rF3wn1WtlUYFTrNM5X
	RQgakPHc1QUA5MoogjoNkDAOGw7wFlekQkpDn8IrNBN+tpanABI1Cug1rV4Sn+Pr
	NFPdR7wNh5vsyFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fkUMJ
	elHwPmCBheIYy0LBInslb/neWZuOrjO0pn9Ki4=; b=vc/T3RvNxvQCQ48ZPXMSt
	0a9/VCekhO1Fe+M3tvX27IL+oxg3Pwbd8D+zgidXSPJmHhvNkKcEGPyHrI+U33A1
	ij2wozfVCvo3qNw04CPtjK12s8FBHVM1B65wUuCaHUdgW01udqnsGAvVhZrdzaoV
	xn4H4fUdVDLCPAFYzGkNdcxFLvjAEWlCIUJihIVFtkl+8uWjS6caRSVYPNRf7gS4
	LpWc2g0gCvycLwPyvERXCI4YeFrYeuqYNStS1hj7AXlqGOUPQYeiEyVMj2FTAI0v
	FWncOVLXAGtWXrt6KH/jFmTFw70GQIaqdQH42d/X3RuXjVWnAqIhdDycsJSXOEp0
	w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h70f6h0qh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:37:55 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAZyT4N036CJUejYWImD/lXdP2JVGi5MGoOhPZa11s7zjltx3b6OSgRvauggB7YPIReHkRuyeKqowZIqWXjP8HrYkayFAynkOLB1ETwCjKvPtsCiAraPSn0nU+2f9lhW2ZvQ7FwWjhUv8Kfer7gXxXme+7k3ijRxUt3LZqJHaRCIbpnVWndViZgKFke4TC+CsWG5QrXziKHCCjnyyYh7RejnvTa1eLzq6S7ErKMicMnH9Rf+daGGF7tnZSVYrzQU8kydOB/7WT8QXlRRZ87LvNumPOeze1ESYtQ+suP/lAnZ5goEotKgYOetgJzmYsgjjoMzDk97+vP/SMbxbh/epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkUMJelHwPmCBheIYy0LBInslb/neWZuOrjO0pn9Ki4=;
 b=ZxnT9WuGvxsseiuy88B1yz0PQl3e2oY9PQUXdqQyaJEU0rCYpx9z/nvjOjJfhzOsCg9KTWBMn4WRP6oSHPb+lhCubtWyWzruyh0wL2jv//z0gNVcIzIuizePpksdVpN6Ky1heVHXmDtXq7lUCBaT8FGztfWDz49vXEbS9twObIK/OYcE1Wlq0uZ23KRU2K5xo6Nh8HVrvcOaI36xstvFnN2rGpz9t8OTYjY5HzdYUpJNc2QBnQoIbyOMIOGAC4kVrJgLtowTkbJO0+aVkTiZWWmUanG2mcuQWd5P42w6c/FJqgnnw7I6KECI38d94M/+8ya0QFosSDvLJbwvdKO5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SJ0PR03MB5455.namprd03.prod.outlook.com (2603:10b6:a03:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 15:37:52 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 15:37:52 +0000
Date: Fri, 9 Oct 2026 17:37:48 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: rt5645: Simplify optional GPIO error
 handling
Message-ID: <askKQgB-0IrmA69K@analog.com>
References: <20261009112204.33199-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009112204.33199-1-phucduc.bui@gmail.com>
X-ClientProxiedBy: MM0P280CA0113.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::19) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SJ0PR03MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 077db452-d583-4bc6-4c8b-08df261b47b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zkwqkURxyUv0uQcdeRFkhFizNRfJXD33S2kwQ1sA5PPSnZ8NiMiIJ5qR5MrfdvcliEIKqlvl4WcDT4Tra/7SedBRo5HUfdssC+bvRQ/CcRmryo4y8pj8bZqGOb144zneYtuFixwfReVU8YnXxKP7w1XJtuOE89V3hjhV2Adtw3IPaspdt8qvHwvqyBMZjo9y3cD2azXKHug+xOf8W1Fkh9mqW9ykOYoczwqveuaPnxWTsIeEeCT0IJOZnjnlz+kq073Jixz7HnkaIaAxaj2Lx6FWqX8nbh9e4HW0/VuxXJO7Wlrd8VIv9EMyTZarCcNxYfK1gb8DzTeyUs6XER77qkY/Ko91LfPjigo5F2IyBlQHNJ2Ey1eYQKeAvaw48Ub0e+zQ8LXl1CgHfbFYJdmfwyEKvT2ecJ/XmeWXfGtcwYYdUFOe4fXLeb9R2t4cynKWVHtOYFhLNBx1icQuxMcLl0072qxJN33UsBvBJoEiOb1n+sxMwty5QlnDVE4L2vj4fAPskx+01OGg6ivSEHKE+E3VtAa02biQ0ydgUXJjvVI38wBlTJVwRKba5pRn6l77Du3XSwxWCoH6UtiyuVPYDrNFJh0wuTKom9YzcZHomfrYouBAHm43xUR+D0SkspL14vr25pGdWzIA7pNzqKZbAjsq5MVXGJZLHN250IgsweI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFOeDNBYjZJaDJYelBmcjF5ajNlVUlsMlRrVm5YRHpQeDJWOVlZSmttSkFQ?=
 =?utf-8?B?Uy9RUjRzZkxUNURqK3pvZVp6SDYwL0xyZjlaelVOTDIzN0l3RFpqeXUzM2hJ?=
 =?utf-8?B?RjRNUnhFM0t1OUUrRHhadFA0cUJLM2FycFBPVGUvK0lFMnM3dSsyZG94cURZ?=
 =?utf-8?B?MjFnSEpZUHB0ZVpqTmIxNHR3MHY3T2JCMjgzb2IvNEV5Z0RKU256cGFCL2hD?=
 =?utf-8?B?RkFBNzNkWG03R08zc01mMVhPZjhGOE5FN3lhcnZpSStRSFBoOUdoZktua1hj?=
 =?utf-8?B?djJaazZiTk5HRHYrMFRRQWFNaUo2Ym5UMUFVd1EyT0hMUHJqRXR0ZWNMdjZV?=
 =?utf-8?B?QUh5WmJQNVNKd3BwN3hMWnQwbTd5L2FWU01ZY1lYSWVWZUFPSThtYld4V09s?=
 =?utf-8?B?czlyRWNWU0tKYnFJcElYb1dJSjNIcmJWSHIvSmhCWS9YdEhUWmszWjdPT3Uy?=
 =?utf-8?B?clNsUVRSYnVjai9sNHRFTzZGWldMTmRuakE1TTVGcEdvY2h5OXpuRzkzbFZY?=
 =?utf-8?B?U3ZCZ1FrL241cTdwcEdMTlNPOVppWldrdWFmVENZWVlKSmc1NjdJeVVid243?=
 =?utf-8?B?WUZIdkZSV2J6SnFpb1pVM091U3NQTGdVTU4vRGFUbTFqT0RGZUwrV0pFd2ZE?=
 =?utf-8?B?eCs1bVZjejI1cEdlOWNVQlF3MUhUK3FTZmhKbGR3WkgzTjhhTHNQalFubnRU?=
 =?utf-8?B?OVdBR3ZaSHViaFRjSWhCSnUwWU1zNDl0dndnWFJrNzdBbXd3K0pTTUc2SS8r?=
 =?utf-8?B?allyMER2Mnlmd2tXdkZjamZBdnRKVXU4NXRVUFlNN3IzbmRKTEN6WW1MSS9D?=
 =?utf-8?B?M0E0aW9sSUJHZGV0V09TM1BzWE8ybWhmU3FTUE10c1RabGdFT0xFeU1rMTA1?=
 =?utf-8?B?bjRCNnVKTk9DMlk4dmMrdDVEZjc2eVdwbTRFS3JkaVdmaDRQOWd3OEF3dzU1?=
 =?utf-8?B?dVVyT1RrRlMyQ1oveERFbUVkMy82T0R1cUdJM2s2YkFsbm11a0JtcVk4NXoz?=
 =?utf-8?B?amNSSEJCTXJzNjVhUGo1QW1rSWNNT2xENmhGdGppMGwxd3NSN0Fvc0hJUVBz?=
 =?utf-8?B?Wk9vMnE5Q3hCQm0xY1F6N2UwK3BWSjd3UjFZSG1CT0pCbGRJZ3RqN2VJUzQ5?=
 =?utf-8?B?RHlUR09NZ1dNT0RkZU4rekxwSWNyYjNkUWhaQzN3QVV6NDFMUUUzOTMrdk1z?=
 =?utf-8?B?eSthT052clA2aWV1dXhSanNIUXI1NlVwTlhRcTNDQ2JLVHJHN0MzbUx0OEdr?=
 =?utf-8?B?T2RMRHB5bmpsSnNLOHBvREFPMU1FcW9hWGRwSW9aOXBQQ1QyaGl4amt0aHRm?=
 =?utf-8?B?UStqbE40Z1ZRNjJJblozM1JKT0gwUEZLMUVBSWJpdmJLYlhlbEVzTFFHcmV0?=
 =?utf-8?B?Y0pBbzAyNm0yNHkzV1h5SjNsMWVIS3NNaTlWb0xQT2RRUFFqVm9DaElzRlJ4?=
 =?utf-8?B?UGwyZ1ZRbHpzYlN4eEVRTGhrbzdBUWdVcmtXMnRRZVZ2OHFncHBkYUZTckZS?=
 =?utf-8?B?bXBxVURrelptckwzZmJ3NEN6d2FoVU1QWS9YNHRpK3UrOWpnOTF3Y1AyNU9n?=
 =?utf-8?B?RnRyaTJqTXJ4NWZNWFhETkVIREhvYkNsTEFseEsybzNsUjBEUUtHR1kxRERE?=
 =?utf-8?B?cGJYTVhrMit0U2NhZm1BM1hqZTBRVGhMRW1wazk5MVhNSjk2cTcxNWJNYW9Y?=
 =?utf-8?B?ajVPQTRNQWYyQ2x2OGdvMFZ5OWdCRVM1ZitCNVFLZXR2SlFLSGNmVVJPUHVH?=
 =?utf-8?B?NDZqRkh6dlJLOG1tTHVteG1EaTdkTGREUlQrWmZHK0VkWGNUdVhZeVJDcCtj?=
 =?utf-8?B?MVlWS1hiTzY0RzlHY2FaYUFVd21ucFB4YmZYZjRLQnZKUjVxZnB3Z1B1bmtx?=
 =?utf-8?B?RUJVaitQVDhvcnVidFhkaWQ1K1pqU1Ntcnh5UUZXak9RLzZId0ZmMmRDUmdj?=
 =?utf-8?B?K0RZQlE5MnZmdzROQTNKMmk0eWwwWEg3UjZxTEJSZFJ0eXB0QkY2dzFXOWVF?=
 =?utf-8?B?a1lBalJzbUo4cktCMlJFbjdHRVZtT0ZTRHlabzFrcDZsNk9VdmRtYXFyOHRO?=
 =?utf-8?B?cjdaTFZBTktpVmRvYjhNWnVmY1dieXZRSENreUVXQkdabTZXdXBjMEI4dTRN?=
 =?utf-8?B?ZFpmR2xvM1NWV3k3TGJwMUNPNFJRRE51ZmNwUHl2bC9BRFNkSW5Scjk1UzA5?=
 =?utf-8?B?U053eHhBK3JwZWkvRDR2ZFlSZ2YwMXFuR3hTT1U1Z0QzMm1kd1dBYUxrYTRH?=
 =?utf-8?B?MWNsOVFuMDliV1dXbGIwWjRtVTZoYTVnSm9SSXc0Z2paVWpuMHR2RVJRQklQ?=
 =?utf-8?B?V0tqbVBtRDdEYUxDZmlESDhNSDlLL2FxbjBIb2o5bmQvK0txcU8yUT09?=
X-Exchange-RoutingPolicyChecked:
	AjtmVPFv73bWoj7k9JifcEd9M/EZwYXDDSs70HBd7Gkj5bXws71hFDj3Z9KWEpfpdLBrdJ9TEXUKX7teqOFc5O2azPBRJqLPx4KN3dgMn5ba9TGApKYDAgzzFW5G8flKO9a+XVpNl10bzsslC6U9azjy6E2Il1eYwQ6v4czEnec0ROsiYKxgXQJAxOSi0IIRCl7pLqeu6t+628r7+fwRgmW9/dFHTm/mqt2zEyjfK5Sm9QgDVVm/MwSZQPSp9atI6SnEcDNont0JnVF7gqPs1kjVcsBydBVqUV0yyqkBfHWiEa1FSXyPOR8TBBy+DczbWfrdg+Ipau/swP1NKL/qPA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077db452-d583-4bc6-4c8b-08df261b47b1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 15:37:52.1344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcwCtTG8iamzPVcJXDC+m1G7P1MR35pfuIHTW/+4UrR1SuHlfauDw1lFTDsnm9A/Zwj0YIiNIDulYme7ywcMAWLLr79n7oALtPFW7svVhkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5455
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2MiBTYWx0ZWRfX51COII6kkzwX
 1JMXqEsokYx0UJhgApORzWTb/TZdsPgVcKoyZKM8oDQ89T2ERyTJsqhguo/qNvuvxtKTtq8Ov1O
 Is/S4DICd5beNHKKnF4AlwUCOiHhHxULyNssAtXaj4/Y7TF1+f9D
X-Authority-Analysis: v=2.4 cv=HZKB3SE8 c=1 sm=1 tr=0 ts=6ac90a53 cx=c_pps
 a=W8nThqPTbj8xD7CpgneC0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=JSC9QJwpQyZXmXrI5WoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: g89o4zuKdlDMdhcHMAH5XfBnjV5T8_fq
X-Proofpoint-GUID: g89o4zuKdlDMdhcHMAH5XfBnjV5T8_fq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2MiBTYWx0ZWRfX+eiMe8b/QF8K
 6cfcEViQ6E11sKNikvSZY3TLwD02qS59+JFNdVDIrI8eLW5DNRGti1FzEBofRhgSAf5msxrmv/4
 Y55fu822xnCO5HGuHNvuwnv/IeJK3Xs29I/eHuACerc448mh/uO++obF3kFvOdupKfKVFhOpuyz
 atV2o4yIY0ZmlSeXCxDwzvooFO3Y4xReWk3cj7PGhvq2IAD3X4RBPP4iYsJiNXtrY6c5MA6YNNh
 BXnkLr+4xgKbxtm4RlYLb/tAjje3KLCvNrHVnzUXYws/zzGAT+mJXJ7W3u02+tb7QIJtknGPzUu
 uXz9kwuvPSu2xaRHVcBVNhPoXIN+3lMoBIbRKzVfsoPtDhNRFVQsrQn5fV5dfZ7+VszKqq9wXQ1
 iycLvHHn/vs/45P1mr/KWG6wNXlApgzMlMnbjpOQZza9vYZoxf0D1bHT9HI3HDYw514M6tSlOGG
 IH1asvXL7X8vfZOMnnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090062

On Fri, Oct 09, 2026 at 06:22:03PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> gpiod_not_found() converts -ENOENT to NULL before
> devm_gpiod_get_optional() returns, so there is no need to handle
> -ENOENT explicitly.
> 
> Use dev_err_probe() to simplify error reporting and handle
> -EPROBE_DEFER.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/codecs/rt5645.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
