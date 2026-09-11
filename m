Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733F55C315;
	Fri, 11 Sep 2026 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156039; cv=fail; b=johDarYK7W8xNWAl65vLwydxfRN3v4IfOmKFz++csJY4YWHEfignKeCkPHPQRsZrv7xhUkgusGcjoIG8gBRfy6/5BjLTYBLh5YraVXIiIPdOhkj8LfbySvLTvS4vMZj2mmiTqhz3db0xZQSbEx/ZnZHwmDXPtPVRCV6jp2ogg6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156039; c=relaxed/simple;
	bh=l/FRSRu9cJFOyvfH3aO3FNV3th/jCUpFk1f7Tn4yAkw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqoiLay47SP1x1ooS3zh8/xJ4eABjeTOsZJ/6n/CgjxUxZ7dFa7vZAoCidlNI9+uvdmN2bLu8TUSJdXFSWdzbSKMS5GSiMfmjYlUN7ex4HspInCDlASY2l/qdtL85vcwxbiQ7cvbkM8f2vjMZU55Xt7gQ/AQGYa/eCT0mooHDqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=niLUjmS+; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OjJwTOTP; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="niLUjmS+";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OjJwTOTP"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BHUgwT2340259;
	Fri, 11 Sep 2026 14:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=cHZr1KXTwf4JN2W
	/BYQkUW9AfT6yXR/h7lEfuJuUr2k=; b=niLUjmS+lIIgdnHpINg5w89rCOocwah
	14qyM+9Vh0d8iyGuFDC4fQ6qchoOUNGBEpt66g12JKR+7AkUudbCePjCFH/7qtml
	nPi0+62oQf9RTkv1KyUVQsvKh9CA/e4SYVFiBQGoGUB8Og7d6ROeQySas5F+wiJY
	DPYx4DAYUe8kEzArokb7hw7mCfbXT0hpFwDHuZa2qJFmNQD3SEfm29w/GafU/06i
	xI9y4XEn4Q7W5GibUlw68DR3DFdUVD32tzwDsc49/oqzVluUY2+snfNrrPNZXAwE
	LhTmaULjBSvnOzDzruxct3MKt6vmq2gvgGAUPA+GFkgCnEIkTERRI9g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gm9gqw63f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:46:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnL0YshgEqeKbWvyud+ZqRZBJod4Z8A2KIS+pdG9GpkRo4Mdd8pj2qrpz7FGyEnWjPy04MU8mHlLdMbozNYpw84wDkl+9ZX07rr8Uu66dO2/Z+USeFDBHRTTeharv92zGwHatKDcLcwBylnCOOjKQuGG9LytWkgcm3XXZgkVfHc1+kvj7hj/x0Avf0sPSVhrD/SrWcsNDvzyMZYm9OAhwNWjBt/lSziUDTp+StDjx2MP3JI4YQcISXcHVdrLJtSxeTyH8mAdFw8CGIbnrLyp6rEYw6O548zYGRKBTvbUup3mf25J/kpEQEnQIWoddf010Z3LcccXT/ISntmYCFmIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHZr1KXTwf4JN2W/BYQkUW9AfT6yXR/h7lEfuJuUr2k=;
 b=kxmSS310ee5pDlTvZTELXgcwVzjZq0jpP+sueEg6m6c176IqO3MFbRnSXML1eZUQoLeZPwtKsPugjd8d+XtZY4l2nsIo08sdyAP2r9JXocNUgGDPcdgRM0rBdSv2Txx6UNOn+pNhPNaorvWj0jxtKU+07NVfrzSw55zr5uLbKNMpPRScujckf3HbvZ2VtWhPeoZQda0Wpr5gqIVepoKoeR4qwrdxgc95gi/Ho5OcMHy4ZCIknA/RWMN1v79J9P/LWm8giIXI3l8anbN4Gdg35gY2z/EEZwgFPz/SXX7u8KqKg627Fwq4x2enFpd85YGkSNk7Mhu3uReFCbMkT+0Dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHZr1KXTwf4JN2W/BYQkUW9AfT6yXR/h7lEfuJuUr2k=;
 b=OjJwTOTPLPjtddcaxQmsmrZtK5l9YVOt3ff8SFgD4zZRs+UXnSa/rwQrJ+8lcYuGF2/nAsTMbgaKsnyk8dMUbo3ST0DbcjHDcZgHGDASeNEhVI6i3KXY/iZlPiqcaOjP5n7SRezs4ybsP8U7UUp5y8K0n84YXAT33W4d7gxuPVE=
Received: from BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6)
 by PH7PR10MB7056.namprd10.prod.outlook.com (2603:10b6:510:275::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 19:46:48 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::a) by BN9PR03CA0361.outlook.office365.com
 (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 19:46:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:46:48 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:46:33 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:46:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:46:33 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJkXBx1690447;
	Fri, 11 Sep 2026 14:46:33 -0500
Date: Fri, 11 Sep 2026 14:46:33 -0500
From: Kendall Willis <k-willis@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <s-kochidanadu@ti.com>,
        <a-kaur@ti.com>, <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
Message-ID: <20260911194633.3s2y7yrmldlnn3om@uda0506412>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
 <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
 <20260904145913.a437wnuif4arwb7j@uda0506412>
 <20260911035535.eexmc5g3rdwyahl7@speed>
 <20260911143205.pecdvyzsiokdvpy2@uda0506412>
 <20260911191924.lpu73cwup33fynii@guidable>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911191924.lpu73cwup33fynii@guidable>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|PH7PR10MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 38663d5b-bce2-4725-72cc-08df103d6aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|30052699003|10067099003|22082099003|18002099003|56012099006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6pByuUlXKqi2rOqUsITwcAcyLPjf9pBEpP4FpgPeMlIDnzk0jUbp+fg5NKt092/Ie9TPGeriCj3bUQgffyvVxjTPNXyIlxHrU/okc9SQBmFkeWpn5GyZvgbeIAh+EtrW7F/NYNumBQ2tnD3kMPlFhqNuYk2fgpdWw5bB1OHChBRf6os5dG5vGyxfKqPC7qLOy5s6WYWzbDHA4G9ouYuAROS6UUqYH9Nq/N0AXmExDekHuPGW5W3B8RqAjJp1OFSyUYaqs5/lmjpl0L+KchBkub3+XeO4I9SDgjx/4pvvZRUCoAVw529hd3+FKY/23nFhEJbaO9qCyoZSP/GEot5xZjWOLvnm4PATJe6F0+eAUlrSt5sRYJbehqZmvnkzJWsRNvyV1UQUb9alJgqXbIDgaZ5qAzckbrCdnsyBAAnynSwF52QJlyJRX9nkzVp+jEKLcI7y50dQY9JP1YIS17fHVDtldZxid7GjdVbJRH0zfkaN2EEjbTQ1UgH2iYi8ft5NsCBDHR7qUUsxMrXnQlpaWI3Jh+ZUrNhokxzkGoEh3HxbDr0ICL6YJbMChcTOGMYmFCUYe/rRfkRm13JpX0m7qFm3M2N4xwFgY/3zjeh43InEM5RGRaCIpTKePtTdhNAHX54THIGxFXfcj9yckaiCEtjdYzE7GnVemMx/rbti+pFZyADE5LMGAG2YH6bjd0vjIeEUMJ9DDg5u/30YjVJyfg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(30052699003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pAngCEfJljlJIv3rhYSsr7Ai/nwATg+KA2a58CDvGdzq47F+nMw9Oox+u62IEftlrw0xdcHfstvPKTt2ZRObfnqDIoB+HB31YT2cp9sqFzmjYw4rPxVayILJnstgZ2R2HsXOrrBbiYBUHiu6krtceBPLlCWdjaVJdVdGDRERWSsSVXomduU8cFt3NMDIxIIYVPGxrYpfzLS7H9TrfpvJCdyDlbAeaVy84nM2BbnshI4/g082BccnbORzLjKcSNe1k5DgYYI2bwQQhdLxucROsMnWYlhZfyzVUrhIOtxqxeCns0a3q2vucKg5cWfRuWoVCyrbWhakagnBUTJinR6pJwVcC5sX6MfUL1SkEETBxFrC/3fP/OGRPx1/DxBCFoOVXxNRYr/GD9fImA1SRgKcDnaRlrT5248fMJX5+jFs13ZHiubLTT5yxEUJjdV7/PT
X-Exchange-RoutingPolicyChecked:
	I+1/5fqhJBOJjGMkl89zxpKRaZiUYEq1O0cMsyLjA8ndvsDkTLQivqOQDRhSMVjoGmyp63m2/RC9XdTI7ruyEdHUM9x2gJl39mOXzTWg9KOyR3tPXeSJT2br3hZCw3A02KtcHN9NN/MawILX6IG8HRDhzGH/zn17Ii0HtxFdiWnFlXwZvBhDCwmmy1HXGphtA+Q7JJMEycJ50ikoEaLV8J4ZFeXgKfF/7VOcdd3EfnensZqzVg3kYMwZwRCXMFz2JXgAmUNG1dEIfYBJl5FOi6jKwrU0Rom9900uyRojPKzr5/OvyqdV2iFkGO3jpAvZ94/nEzieJGq0BY8OIM+ftQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:46:48.1704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38663d5b-bce2-4725-72cc-08df103d6aec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7056
X-Proofpoint-GUID: OhQpkpMy_HneGLups8XCisPOaOMHmGON
X-Proofpoint-ORIG-GUID: OhQpkpMy_HneGLups8XCisPOaOMHmGON
X-Authority-Analysis: v=2.4 cv=XaUcX455 c=1 sm=1 tr=0 ts=6aa45aab cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=GsWMjKdAKuovavs96KcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3OCBTYWx0ZWRfX7z+TGNJFGXzI
 c3Qohvxc6754c+JQHaikemFimxfK0PG1zd4pA140wOCpn9TNNRwnVOZqJSPmXvvfZJfBY+Jv8Ie
 Ox2iTHcN0wJaAUxa2QwTTf/ypxR7dPckZOlUAHmMG0CZAcIPu3T8IxwlUPL3EUSwkNLUsvcjsoA
 KjQc16v8w4kELqeQ/zDqnMVU34d4hztpgLy4cHiQxFZL7dU4ilK8t2uk3P6pM70xZhXvud5dkmG
 2Oj0rR2wZdl9KQGeNIlAP0opvXfyTLEFSv/EP32a/A5NNaeoMHILw8UMlJAqT5r9P/OBY4k3ZY5
 8ys8hCI3W4MIjB3G8jY0LK1cZ/D9efQdgmLj9EUNxPLn5Hk2KbwjGqXlPYo90QgEj0Xlx6dmVpR
 8+li8YsV0/CQLh5NWQDmseMJ2ozJAMvZVvtnqqZA6Wg7Mn2YyVdoNOqZ2rMyHdEMCrcJCb73Whc
 fMJqTOA3P7YTnDYxrqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3OCBTYWx0ZWRfX1fKQKMqzFXUO
 uyofipPzRk8AE37eHouu9+GOOv08FFlPCl340YHzfqNNoFdJRRmaxE8kBixWMQYq1416D7BIIVE
 cSNEk5Vuk3V2BwRFa2LrXsU9M5E0zvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110278

On 14:19-20260911, Nishanth Menon wrote:
> On 09:32-20260911, Kendall Willis wrote:
> > Hi Nishanth,
> > On 22:55-20260910, Nishanth Menon wrote:
> > > On 09:59-20260904, Kendall Willis wrote:
> > > [...]
> > > 
> > > > Yes, that is essentially what the following patch is doing. But for CAN
> > > > devices, there is a chance that not all pinctrl_state_wakeup have
> > > > out-of-band wakeup functionality which is why the compatible is needed.
> > > > https://lore.kernel.org/all/20260902-temp-v4-2-3896f7d16ce8@ti.com/
> > > >
> > > 
> > > After looking at this driver side thread, Lets look at the DT series
> > > once the driver series has hit master. I am going to skip this series
> > > for this window.
> > > 
> > > Additionally, for future reference, will be good to state explicitly
> > > this kind of driver series dependency in patch diffstat or
> > > cover-letter[1] for example ti,am62-m_can does'nt exist on
> > > next-20260909 or master.
> > > 
> > > [1] https://lore.kernel.org/linux-arm-kernel/20260902-smth-v2-0-b3678ca44c7b@ti.com/
> > 
> > The dependency is listed in the cover letter, but is there a certain
> > way I should list it in the future so it is more clear?
> 
> Yes, lore link to the dependency patch.
> 

Got it, thanks!

Best,
Kendall
