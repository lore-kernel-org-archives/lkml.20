Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718750;
	b=nMrDfmCmxvxUfeRzTAh/ys93rLiN75wNRVqM+gPP1x8vU+04u9PnTdGCHDkGTXqiXVd4
	 OsojpH5mK9qXr/xp8fQWNxM2vaLjOY9ygu+SZ/6bORn7abKgKMu8+8O0dtrByperNBD1S
	 je6tX0LpzeLqyZa1wYxKKIOSabjVP/HrLSFkT+R12wDcHo2+L8yvOiVybTueuNJpcZ60/
	 2JO/MA+paOvKQiAY7KfGzqHRhSt5mJaLso7qTpmIVLIBHfmeNYP/bW8gmg40p9CVi2TwH
	 e/bHQa2TriZNls+/JHSudsX9V/lsaw5lbpELP6bI9OcoIFmfRBDG6nDlsMyg83NUWHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718750;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+TXYsbdih/GAx3kXVdPFs9ALUmj/DYlC4XlMD+Nbv0o=;
	b=yKywe0YZNhDmmHJCdfadszWYhr7JZO4JH/Kv44xViS/lMxqFAn6lfWZAQXEoDQdYlkyF
	 3Sg9x8KumzxRKcJTTtpBbPt2s1Qp4ESqYGfuXI+PltIToaygKX9dXWWSbWqDLaYp/p6Fv
	 sUpbOOjQ0Fz2A96QGi45+/eQCtqGDNMc9vaq/AKeg8x1cwMyJWH7ifNvZgo+8nbazGCos
	 ezEXfchFsIZDPGP2IWQoacCtmzpTwf7EW8OFy1pGIiEBO40l8VrNpld8ltUpSyRSlZDNs
	 5DzSG+rPGQcqrvTMFJ1mnL22QU7rGYUe07vpmwbHl7EQwTOihyyjLS/f7Q04OQjY1/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=OJsN++1f;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Z25+uBev;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C82606B25E;
	Tue,  3 Nov 2026 15:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C82606B25E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=OJsN++1f;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Z25+uBev
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E6VZB2595214;
	Tue, 3 Nov 2026 10:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=+TXYsbdih/GAx3kXVdPFs9ALUmj/DYlC4XlMD+Nbv0o=; b=OJsN++1
	fgSAMD6I8qfSC2GRBdyncHDBpg9GX8hjPa+OPXLpwsVSf8ieXHVfF8dRGoICblK3
	jCtHU1XRvWGBv20mnt+W7eCl2jNBsK35MxVKlHKYrNC3SdmFa0NxEkcTuVfnyp2p
	D/iJklQLIt7BwZ3EyDMq2y+swqPQqAehN3t6i8zkbCBTwLtsTk73t1TDeOxoIYM3
	taMLO450oEwEst/SAt+Uya5YvqZ1zwniUQHqe/57+gp/S3VlZbIO+kY85Ip7OPxU
	xUJ+mk7Ip2KNfqn9UURWg+tlGi5dGMJHhhDpk6c5FW56/G5wryq5WgHr3uMsjG7u
	S9/iiSQwF9F6PPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+TXYs
	bdih/GAx3kXVdPFs9ALUmj/DYlC4XlMD+Nbv0o=; b=Z25+uBevRLzN75jfkIpjX
	jgnWPM3bABWw6MDRZYfBXw2MB6a4H6EcG9Ci4x+4z7lfzy3Ri4hG3sn8gH4XOn8y
	mbeDzV3jPb7CwqnH5Xo1HAY+xm1VxkgiVxWA2WNVqxX80nPHXhsxbVOWvRVymxVu
	tqK0kDD+edMvfJS6trtQRUAVIqgk50EWZoH0OfPOReZInruIK5DxjeSFqeq82mbL
	1oW4jXteenrvvdqGGpuxKSwWzrw/Cx7gO/lKYyHxc/4+QAUA2aD0HbWHcSN0ut1y
	H8buz4jC0s0jzvp7dHZN1Uoq7CbuHo1PzbzhQZRazUTRV6Zm/GCrLrNxvl4YNO71
	A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hq0vuda1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 10:12:12 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdeXbhmvoPmyajZZhX35YWE4jDw5yCcDzZFU4OfqcA6ckK1lXnWwJoBmIwI5jvMAVOKJI0j/NGIAF1XEdEv/y5HEEZQNaYLjjznIp1f13upIjxY3+ckTQcBKjdLu0ypA+fOih1+EkAMehKbbYGaimo5EODKFtbddv74ntz2i9dyZLMcnDy2Md6TiBmFkE2pg8DzH69FmgTHgZHqG0Fje71APEZSEeGxwQbgizkymaMoE4JXyEJkzuQE1R9zHbKpb6IlYCCItmoZtb+MCLx64WNdEiKXQ/yH8IFy0Peb2AbT6RSXSV0Wx5WA6JZ3Nj+QbXvkh8D5ltTJ6YTeyoW1Tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TXYsbdih/GAx3kXVdPFs9ALUmj/DYlC4XlMD+Nbv0o=;
 b=Jjez312PDr73lG+7urP90dF9GMERaoI00tY+n6UVKaTkF2/tz5EqZFXlIuDe3L3Rsa5w4RkT2QOqeVPKb3k2o+iKlsZwHG00RN8Bq3PJ+UISJTOR3HPm5Bd3QI4Y5YC1XNrIu0wRItmqQIjGowkBb1+iX+/aVVLpUm+76a4Y09HgZxrIT6pMqByduvbwdyQPDzGXFtVQI6i4KmbIa0rYSys5sTEHlJjKFGTWPH5MRkAVdD1flTS3hwTrFMxUKj++9bbAVfI4clrh0/u4zOeNZMNHAd0g3XBvz8jfQY3gcyQk3CISWHESIoXmnZICM4eL5rX3XTD8bohxIyram7TIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by PH0PR03MB998622.namprd03.prod.outlook.com (2603:10b6:510:11c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:12:08 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:12:08 +0000
Date: Tue, 3 Nov 2026 16:12:05 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
        Peter Rosin <peda@lysator.liu.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mux: rzv2h-vbenctl: Add suspend and resume support
Message-ID: <aun5r6ZwsjDnu3_5@analog.com>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
 <26da5ba32948a30dd70475ad2ece3c84dcab4eed.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26da5ba32948a30dd70475ad2ece3c84dcab4eed.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: CPBP307CA0012.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::7)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|PH0PR03MB998622:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a642a1-7a12-4496-1e19-08df39bcd3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|4143699003|11063799006|260925021311599003|56012099006|260925022911599003|260925021911599003|22082099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4B/6R3M1u2RpvXgMfDxDkCTyUkg5Sy+SjQkr7AxeZKXK0e5DDrn1g3Igc0Ixbj+0Hk/4AXAmmgs3gBL1S1q99riIQFKNpzg4Z9PKIdUr8SD2kyIDljgMRBKLnYZ5nWx1NYdLTVtSJFnm5OV/xzgAFmtSoy37E5Qw5lQTfWAIZSMd+uhekhuhHMGrKQzN7h9B344TCuMxEARCufGu4cz0tfEoDIoWYVce6xxDPC4kmOihrfYTD81W9YDQHkKN0oe3YKwM00EOJwwq6d2hQapC1pfwZ2RZPO1e9YDOP3mmHOjWltp98JTJE7KnPlZdCv2GqNncnv8NSadhmZWVbK+sDHxLVj1vSKC6OSVCf6GRq/5onXTAj7Yyboe0Ip01I5u8itCiXXpsdBG83ebjFKfHDXXGUNfi7u9QCtlgbwgqN7Jc7JXQr3fALhBcJHMmzR0gk3kFsCEEEMycksqiM1N4/51KsSMT+YOeR5CVZFx8ffygZH30l5O6VsUqiPVpN8/WpK6X7WFS3oC1ss8/aEfj1hZUK504+a1yAnwXDizNmQZUW4W1sBTLU0Nl55jRx+s3GZlg7rDKdPwMGRkCQPKRB+kM3ukZ0eqYo3fKvcRxb8ZkDztxsICx75kWvxwExxouHvd2GdQ+Q4BYFn25zdsmuizArumnaCynlz2viKHXWoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(4143699003)(11063799006)(260925021311599003)(56012099006)(260925022911599003)(260925021911599003)(22082099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qnk1NytXOEc3djkwdGdhWk8xbWpkUXlaSG52K0Qya0xpYWxJdno2TVBqOFZW?=
 =?utf-8?B?RHVmbWZYais2d2h0c0R1ejFLaHNleHhPUUc1MXpNWm8rOW9ZZzd6elBtNTJx?=
 =?utf-8?B?Zmdzb2xPaUZHTzJXL1U1djRoNGNGZXJBdXpKaUFyYkx6anUvOXNMNE12YmRK?=
 =?utf-8?B?VFZ0ekU0aHhZbDRTNmlTVkxycXZGTjlYM3NWQzE2UVJIQ3dyU0syWnp1WTJs?=
 =?utf-8?B?UFpqaXg4aXZXdnh6cGVDdERQUUR2RXZCT2g1MHg0QmdjU05OalVqUXo2cTVC?=
 =?utf-8?B?dDVJenRCQzhKd25JK0pTQVQ3ei9kTG1hbTdrbDludzhIZVRJUzBhZVZYT2lh?=
 =?utf-8?B?eWtSYlo4SXVQdVZzTTdEallBNUwrRXJjWFpGaXZIaDJ5OW5Xb3l2eFk4UjNu?=
 =?utf-8?B?eVllaFBxVUFoZWhXVlplM2w1dzB6OGZtRWNuUGxsQW1ONFIxY2F4VUNhajlD?=
 =?utf-8?B?bnptemMra3ZZdXlUVjY3RE9rMkREdWxNemZ3Unl0WUI5aWgrZS9WaitZQ1VN?=
 =?utf-8?B?L2hGYkVLUGtZSEdjaXBSMk1CdzZCRDl3M2wwaTY0SUhQZ21sRjVzSFdUT3pN?=
 =?utf-8?B?YzlMQ2ZKbXU3WDk5YzJkNkh2RVdDUHd0ZXlUMkFqWEwwZG82ZUo1aXZoN0d5?=
 =?utf-8?B?NHRSeGQwZFNVdXZHeFhUNVp3WGRBSUkvTjJhUVhPaGlkdmx2MzNiUmhSVlVY?=
 =?utf-8?B?Zy9uWTNoTGJtR0VVTFlUOTBYMkNIUlNqRHZ3cTAvZGFDWXJTaE1UaXBuWk1r?=
 =?utf-8?B?aDc2MUFpTktsYnZrQm1OT29SOWdaVVdMQURna2toUE1mcm1EOE96TTdFTkti?=
 =?utf-8?B?RzNsWDFnV3dGay81Rmc1bVl1cTRQZEc4eVFKU3Uzc3BQZUt6bnZoSkpRYjh3?=
 =?utf-8?B?MVRkNXM0USt6YkN0dWpaTWhmZmtwQnVkemp1NGFHT2RGVmM3VldVTEpRS1Fl?=
 =?utf-8?B?OVlWVnQ1VkU0S1lMVkQzak1tb1k4T1NtYlVrd1lGZWpLSDZmSWkrOEl5Q3dZ?=
 =?utf-8?B?ZlhodzdKZ25QUTNaM1VTaGlMZ1NZbE9aTjZvWmFFWGQ2RGJRUEVvVThsVmlC?=
 =?utf-8?B?b1ZkSHU3d3VjUktYZ0JzU3c5U2hka0tnSDlYUXNBbTVpS0U0c1NBQ3BHQk5x?=
 =?utf-8?B?R1NxUnNMeVJzZVdVUlBpUG9idERJSGhuejAycThlVW14U2RBLzdaTHBSeGRS?=
 =?utf-8?B?WmE0SUV3REtIUERBdXlvVWpmVTJVNElheXlMRlNiM3dreGJwZnlRNFBNWE50?=
 =?utf-8?B?SVNrWWZyOG9XdVh3Ty9vREw3NkdtMXg3V3ZqVklPdHo2T3VLWWJaTkJIanhC?=
 =?utf-8?B?c0VsK1p2UzM0d2hQR0JkK0dSampLTEgzWnJlWFgzWXI1R01VV0dPdmR5YVJQ?=
 =?utf-8?B?VjhqRmhpK3B3Qi9oV1NFeXFURkhYSWRXemlSc1JYMnJCdnRBWndaMExhTTA5?=
 =?utf-8?B?UnlucVdDT25nNW4wZkgwMitab0FDdFRXSllPOWsxdDNxUXJ2eTRhcTZPQkIz?=
 =?utf-8?B?Z0lIbjBCck5RV3JKTldROGJmR1VGTkgwbHR5eXBWMFc2RmM4MjNteVZGZDZZ?=
 =?utf-8?B?U3BKc1p6am5ydVE0TU5XNkg5eGlWaFFSbldiNzFLUnZxUmdUUmN2OWM2WXpV?=
 =?utf-8?B?Um5RVUpBRUVWbEtDckFxV3FwR0NOY1pML05zc1B3aXh4Y1B0SSttT1I2THNB?=
 =?utf-8?B?eGdpdkxUZ0dwWnZUazlkcU1VdXp4eFgwWWFjcTROSUIzSXFST1hnaUdTUXFC?=
 =?utf-8?B?WXpSY1B6VnZnZkROUUt2VkdoOHJFR1lYVWRLVTRQY29XMEJrdWVnMXJPZm9T?=
 =?utf-8?B?ZXVWVkJFdTFNLzV1RjB1c281SnNndW9vVzRCSmMxTE9pOUtpUkFSWHFNbXI2?=
 =?utf-8?B?MFZleWFlT0RtZFNueTVqNTY3U1E0Y2RydFJET0plWENFNDFIVlV4U1NuRE5K?=
 =?utf-8?B?dW5VclVFdDEwQVA1Rkh1OXJ3bFJpZzdkZlR0T090TmlCYUo0KzViL1ZaRmp1?=
 =?utf-8?B?N3cvYkgyREZzVXdGWGhGZEZQWHIxbmVaYldwMnZGTFFGTVVXdnQyMy94R3Bl?=
 =?utf-8?B?cEQ2eEpjc2V2WmExUFhrL21ONlA5WXY2U0NrejRIRTg0M3hBODdBWTVsMkxV?=
 =?utf-8?B?LzFSNzlYVnh2bGpVczJXbXl6bXdyWnZESlMxRHdYNXlnNWRTQy9XWWRqcVJr?=
 =?utf-8?B?bzZVdGJ6M0svSmdHMkdlSE8ySVJEc2xQZ0h3eWlwZmwxSHY3N2dJUWg2dnov?=
 =?utf-8?B?Mm9uMjJKZzk1bmlNMm5FNFVWS2R5K2ZDZjdVZWJRaG9nOE5mU1RIZloyU1pR?=
 =?utf-8?B?dW93TVByYUVtTXZiTzlpYUlVS1NEUHJDTU9USEdkS1ZZMFZUMy9NZz09?=
X-Exchange-RoutingPolicyChecked:
	kDdFjl40jCsL+5sBpjiE++7ISMqI97n8SAglyacvOuxgOiOl6rgUcxe6OvHKXTgmHBRNS2KDOTJ/l2flq96+Wuc/zJveLOJ89UV3AoV1C9TfOk6WSLraxw0GaU9nF9l9m/AKw6QFw7nCTXNYleRIJ0mdOxl5WWDEfgnaX60lrQi5MC21iEA8Bs2JncYxGxYYn4i/ZtAbhDG16rJV676J1v2ts74uEuF3F4kyXOIibTuEDFKxbscY1S9lNWqYuxWA8bBHGHbfyl4a4lScdEjHlfkMX8SdFXe1Oeay7g8b5RUk3Jv6SKQ7QJ6Epg3IXvRpr9k/R/KH+nHDxvB2NGSu/Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a642a1-7a12-4496-1e19-08df39bcd3bf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:12:08.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATKUFMx+R5MbOUbrfCXcRL0PsTnjHdS4KZsnTmABJe6c2QfTbMuVb6wkn8eC1lQsGZfRVML0lHBGr0SAKV1HWzjNDb7FiT5i5v+5WyrrgN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB998622
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfX9dpyTNKWiUmC
 Rch/1A/k4tzNGsmilaIQpD682+++fgBN56Ffb7bCcyAwbhIKNZWl7qxE24UvHNFTF1cL6OMqWFN
 ylJpTW7qrV0binIAjKNkS899Fm6dIwcVEerMq7ZVxvzJXjn4EjtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfX1Z5fJxmFdAQ5
 Scm8jgyyRMsx744HwJpPjsZzcLAl6RzApI6sNCu+AEQeHNu7wAERA1C0A3U6TolK3aNTpJXtxVp
 L6o+9wFrblbjfROdWCqH2ghNaOj1gZWSwZaTKE1LppmQf+2iQeeFEOO38H7adNEjxQSeQj2SYV1
 11AEMqM9FncovsRmXP5bpzOALAdRsfsXw1dX8dyuOumrU918dqvMcUGby8BI9Qs4ECVek5r2uxZ
 JotlSZn3GZAzmZYqYscVdwaTUi5QlsBmZlogTc11xEcytXtF0PJQ1TdEYFTEjO/uO4dvN4/Np5L
 6T7ZqqIxFKUBpbCC1Ft9oOzW8HHHUX5IOa6Zg5lWqL50kb4/J8GtfDzF+slmHSLxA/Y4cR1GdbH
 Pu36xQeGJvTsxsrMNffgJaUVdkC6RODB/xMByHckNvYAq+q77PdSeOPVi5qARslyZT8htQI9xmZ
 4UuPtAUe52H2VYWgGSw==
X-Authority-Analysis: v=2.4 cv=ZfOIpcVA c=1 sm=1 tr=0 ts=6ae9f9cc cx=c_pps
 a=9n5CQ2h0WC+XkeHDVU/11Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=OmBuyzSU_6lVuy7ZFnMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KX6YzhiwK_nOU19CsRBHgmYgwkTQ-R0k
X-Proofpoint-GUID: KX6YzhiwK_nOU19CsRBHgmYgwkTQ-R0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030060

On Thu, Oct 08, 2026 at 09:44:47AM +0200, Tommaso Merciai wrote:
> On deep sleep the USB2PHY block loses power and the VBUS_SEL bit is
> cleared. The mux state is read during suspend and stored in the private
> memory of the mux_chip. Then the state is restored during resume.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/mux/rzv2h-vbenctl.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/mux/rzv2h-vbenctl.c b/drivers/mux/rzv2h-vbenctl.c
> index 2699458045f3..d088ac3cab2a 100644
> --- a/drivers/mux/rzv2h-vbenctl.c
> +++ b/drivers/mux/rzv2h-vbenctl.c
> @@ -15,6 +15,7 @@
>  
>  struct mux_rzv2h_vbenctl_priv {
>  	struct regmap_field *field;
> +	unsigned int hardware_state;
>  };
>  
>  static int mux_rzv2h_vbenctl_set(struct mux_control *mux, int state)
> @@ -60,9 +61,29 @@ static int mux_rzv2h_vbenctl_probe(struct auxiliary_device *adev,
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
>  
> +	auxiliary_set_drvdata(adev, priv);
> +
>  	return 0;
>  }
>  
> +static int mux_rzv2h_vbenctl_suspend(struct device *dev)
> +{
> +	struct mux_rzv2h_vbenctl_priv *priv = dev_get_drvdata(dev);
> +
> +	return regmap_field_read(priv->field, &priv->hardware_state);
> +}
> +
> +static int mux_rzv2h_vbenctl_resume(struct device *dev)
> +{
> +	struct mux_rzv2h_vbenctl_priv *priv = dev_get_drvdata(dev);
> +
> +	return regmap_field_write(priv->field, priv->hardware_state);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mux_rzv2h_vbenctl_pm_ops,
> +				mux_rzv2h_vbenctl_suspend,
> +				mux_rzv2h_vbenctl_resume);
> +
>  static const struct auxiliary_device_id mux_rzv2h_vbenctl_ids[] = {
>  	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
>  	{ /* sentinel */ }
> @@ -73,6 +94,9 @@ static struct auxiliary_driver mux_rzv2h_vbenctl_driver = {
>  	.name		= "vbenctl",
>  	.probe		= mux_rzv2h_vbenctl_probe,
>  	.id_table	= mux_rzv2h_vbenctl_ids,
> +	.driver		= {
> +		.pm	= pm_sleep_ptr(&mux_rzv2h_vbenctl_pm_ops),
> +	},
>  };
>  module_auxiliary_driver(mux_rzv2h_vbenctl_driver);
>  
> -- 
> 2.54.0
> 
