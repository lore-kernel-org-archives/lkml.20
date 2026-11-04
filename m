Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793812522;
	b=OP+fu7nq731ExBjiNGTrAXWP37PVCIdmkLAug4T8/7+tvRHX4U9q7hArTELWR6LureOz
	 U3ZW1AAFNirulmKn6C6AAphEU+9bo22WZYfGNAkR4zrLa+YQ2PKjIxYhLhZA7rD8i61z8
	 9DGe9iD7cUw5Dwq8zH4sHcMg2cM219xgYwo5Y65Xkbo/hnI3KlUHjQjX30soarsfRmr3L
	 ePXVAkxEqx1dni+XoYvsokAGgkM4K+4bv9nTR86h+pLBH82d/fPnReEREcZn3wSgmdebV
	 0KGZVaqSBWMy4nGihDqthAjabICcjhnAqOi8Of8fVgtimaPelDCs33xwXK7iYgCd6dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xrvM2R1QSdew7Tn21A79IQNDobSAjnjIhdIvhYyir2Q=;
	b=y8a6YeHaaJp7hdSLnHfn2h+zJzr+f044Nz4vmjIUNFbwLoa/ilRe/q3KohdC6b2273oR
	 /OV+FY5QN0IUfFKVfRUZqT5I5xiEyrFokt/a04IdmMDDXHKZ5VK5dlUWfb/T+TjUiOyga
	 8BWLvt8uNlu9kM34yzd2HP3Ze4jEZAO/+u4cE+/VCXqJ2dipAFk15dlVgBq/c1tS1DPjW
	 FpMncX93BDA0OcU21ZaA5bwKK2PB+slkeD7waFosslgIcgiTUpgziOWGJAszu3KMJ84Me
	 VPvK4flDwiXNXfWKtqqhvpmrOV92c2uH//2cOYE0sk9DJhu/L9RYaCKJ4jUvGLmi0hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=AclDWDAj;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JxJU9Ak0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2461606A335;
	Wed,  4 Nov 2026 17:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2461606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=AclDWDAj;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JxJU9Ak0
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FhKSD2829906;
	Wed, 4 Nov 2026 11:15:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xrvM2R1QSdew7Tn21A79IQNDobSAjnjIhdIvhYyir
	2Q=; b=AclDWDAjp1T+R60xFMfY74wQOyJ+C9yF5C+ala1iLhba6X7sZcFwHnzNe
	hqPDZnB42V0XYAXEUH2dWUs73s+HyY1H5TUh3OU2YGRac10onYHTj82UUY3wM4Sv
	5fDLwf/OQ6Lo/TsEcVuYP8L1BLhJGfnI+276jBtBk3TMaw0xMvmSLgGFNNix1kqj
	SuMxwA5T4KV4rcB0xFYH1Vz4SIUd4MNAQuW59g6/+3c8XZJXBbgFI3gKamRPo3X4
	gbjCcg6dxg9gqmSn0H20mRevmQDljrdyRgxlTJHg9CGOesSoRiPYC/f5NSBgYfGi
	vc8fZyF7aPvnNqyHT5N/0/H6TIWYg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hqu7emy1w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:15:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oH8eSpWXQJD8M6UOiqWAKmq4/tMAVkLkZutapXC2sS6LLWB+7J2rzPuxCTm3KKIjf6J8npW9pntojEgmjzkJkN/t14K1BVgnNWQZ0ZsXK4V66OBfMQmUMpIFTIGbiaYLXR9w8qRZaGX1UVDmoEjDVKlrW97EcYexTHPfXEGB/Pa+OjJaGwoM/O48ioQOeYyTT0vxjakShseCWAIxtmlcqmY6mhnzc41o6q/2hFBUXGlQDzeAVef92uqw++YlS3Yhn9g72Z6dH1IZ3dIc5sMgBvKGChxMWaR5YcqQlSKonZQz+MPh7/k14oBiDkfGG3Fk7zZQOQ7X2OzIpcsDhfdOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrvM2R1QSdew7Tn21A79IQNDobSAjnjIhdIvhYyir2Q=;
 b=Ed3UGBp/Z+DVrAnM3IizTfEKCWeOJWv60JHOqKo7jeKpGo12pBuV5fvhqPybM8UtokJcwsAz9mD/qlphcVBxdB8qtZ8T2HUnCdlvnmfgY+BUUUXq/5RwvxwmVJnK3ROFz+buNklwv3m2x19muo6xZ2TLwk+pkUadJYXxSOoZovYWwMPnPxdB4IFiNEsCxTjAUG+0cMK1Z7Tc6p3FLr+ZEU1wC3rp4qtaI1VcTifBZ2NxX0d4VKNUNWnKcKLDdtCbOwTGmGhEDIIIbmWhvMgKJv4Uq8fCDmHI7uNQr6eM6oWqquqLBhTCkiOyDF4CgK15Sj1DTVxkd+nwNY3KUloyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrvM2R1QSdew7Tn21A79IQNDobSAjnjIhdIvhYyir2Q=;
 b=JxJU9Ak0Evv3JedIGWTQEysrTu8hKo3KqHlPgYraA29+DYNd66Jox0QQ5VJQv1L7qcCuKEeVX1RHdVPuR2wPfUw1fM24a1NlPUt6msraP8RONXykRV9KkVDKkX2oq3CP4ioHO6FYfDxfIdud/M7f3mZzotl1zdsB7seMJX561NE=
Received: from SJ0PR05CA0086.namprd05.prod.outlook.com (2603:10b6:a03:332::31)
 by BY5PR10MB4131.namprd10.prod.outlook.com (2603:10b6:a03:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 17:15:08 +0000
Received: from MW1PEPF0001888E.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::2b) by SJ0PR05CA0086.outlook.office365.com
 (2603:10b6:a03:332::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 17:15:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001888E.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 17:15:07 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 11:14:52 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 11:14:51 -0600
Received: from DLEE213.ent.ti.com ([fe80::a556:26ae:12b3:7789]) by
 DLEE213.ent.ti.com ([fe80::a556:26ae:12b3:7789%20]) with mapi id
 15.02.2562.045; Wed, 4 Nov 2026 11:14:51 -0600
From: "Lannynd, Thorsten" <t-lannynd@ti.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "Brnich, Brandon" <b-brnich@ti.com>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>,
        "Donadkar, Rishikesh" <r-donadkar@ti.com>,
        "Thakkar,
 Devarsh" <devarsht@ti.com>, "Menon, Nishanth" <nm@ti.com>,
        "Raghavendra,
 Vignesh" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219
 sensor node
Thread-Topic: [PATCH] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219
 sensor node
Thread-Index: AQHdaw9V3prNcYZ4ykqsBV2D91Op47ceh5sA//+g+8A=
Date: Wed, 4 Nov 2026 17:14:51 +0000
Message-ID: <07628cd90ad84a599a0f8df2b666ea5c@ti.com>
References: <20261102211549.1011388-1-t-lannynd@ti.com>
 <179381101896.194410.4650216012053782559@ping.linuxembedded.co.uk>
In-Reply-To: <179381101896.194410.4650216012053782559@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888E:EE_|BY5PR10MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: 16277b99-592b-4e29-0b3a-08df3a972ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|23010399003|376014|1800799024|36860700016|82310400026|4143699003|56012099006|261009223027099003|261022075727099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5o/gaX9FjO/fHXBxf7DpKG7kryu9fqO18O/x5KS2X/T8HqgzhXsXGE5dVJkEhybov+Xscp16a2HY6e8xVp63XaDXTeXt58PP4pYPoeBOyl3tht5VeVaDh01nls5mdMDC3i7BVvLTBS+UIWsbYxso4dpMGP4ZVOvraIye8zq3gulPZFWgd/Ki5aCltPn+6xqp+ODexaYFUuHfvd12rVDptAXHD//nLIekCkJk59AC9FicLydRhLYBxXPggsgggC3Q1sSxSbnMevDKfmcExrt9E0YK52NJ/aoMyw4NweuBEDocuxTScuW4KOzWh6JUTAvImm2BU+UdNwk+UNnnEYNTDUWOwigY12NFzQGNwnkz4RpHXTEQTyIsM4t91TyfT+jWfrNLwZlBeCrzGjoJM1jWsh774QZR3IHJn4UnTneOypv+d0fCRaREFer60g9PFZsRR4pE3y4zfIkzhrxSh+cl7wmC+zvSa3mVs2UA4zlDyW0Z6ASPF8Z5+P/fFTMWnILtbFu5tzNHaRgQ3ySbI+FnLqAO1gx2kF8aWe7A+xFmPWk5p5Er8Hl296H6OeaQaFHXs0ljm1kyrNCBuPLZzGqvyuYbAntYfdfVTyEC1+1p0TPxXl9VhWAQCap7RbT7y6QBtC2fbwyM76oMu6P+oar4lyohMuFDjWwve++K3yd3jCoNP4/VVndwiINokNtcEzkANtJJsAzNgfyYbnNeqsMBeA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B2kwzFpfq+V9xYcTuWj0Rrf6KPT9/zhuAweI6ewa7AD36PTy8slOY6UQe04GHbi1CWKIiKL9CAxwi8c5Vy+S6t7L1gZZOvzMU3Gva3C2xF2PK5uEenZp7CjEGreOwjGhFqWKa7qD8PNHvGvR9b4HizgjdmdG5eeQujnwMysmfr38iPizNhWkrOpfyYXFM7vGFI6l+lhZJxs26eF6kbXOFYTB6epaO6UvkS7epzqAATuzOb1aESgtowsivmy/asyGyktX7Ty8XIVU8yaRRlufHG9SM12GdaPQmFhEyLEmvydFk2PVUL2+XK5v05nYBjbGRDUAj//JbNF33sVTEMQmZtV+zmx+oqM5twSS0czDaSffMZ3i+kLWdKjNJFD4zZusqyFGWf7OaQaKWZ89qL6oQ1y/uchPrsEFnYA99foYHh81U6k2v6Y+n6g1dS5x6Hz0
X-Exchange-RoutingPolicyChecked:
	x6xA+pw+z7iWP4jMuPSOaXLBWXYYCVV22zy7+2N1d4INkRuv0Qt+mB1jhilLPnlTZ+HGTRyXQeEGkczf2XGij3p8ar0u6znEdB9cXewUpRwg6CRFFyDAVuFGv3Y7f2OqOf3e0y5CM4/MMFcAbWaFLY3hR2Qzi+snwkJLjuAAxGeUTYBT896avpKv4xfRvhFqf+tu14OP5ZtobZ5fVNbInmUIe0yjPnuj/9kZZymdzCGW94Hl0s51vbMvFv7XLf3cCUF0c93k8UtYpm32H9ccGUJLwnzvdpd2sh896YN8hI2Gk75MT7cZikdtDHQMRUXKGqqErR2Moe4zUhG0/96l8A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:15:07.2226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16277b99-592b-4e29-0b3a-08df3a972ca8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001888E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4131
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfX+/5Oa8ZfIEfg
 QFNeBi3f66AcSdHqpwjxtv/Z+rleLHNKOBY8KkwVIpm8lv+T56vD0Xlrxf+AUx9HVt7/xif5zbb
 ycHPcdHx+rNcNyvOxan6uBHDXt5f11M=
X-Authority-Analysis: v=2.4 cv=fPusTpae c=1 sm=1 tr=0 ts=6aeb6821 cx=c_pps
 a=5ROfPwdIRWh2zNeQ7OwrBw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=Plcs4fxahJUA:10
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=RLkMY2Tp61soLUrgEnYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bt3tv8RVtrsAM0EXwzxfpJjWEWfDOPGT
X-Proofpoint-ORIG-GUID: bt3tv8RVtrsAM0EXwzxfpJjWEWfDOPGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfXzHJHKzAfdLJc
 0PC+sXT1B/EjARIAts6evpbLmXtB2eKQPuzM8/g2gu9fanhbO6Bg2ieKDDWrC5vX95uvsV5EeyN
 a18IFhJsfo5zgwC87daJ+Rd6MMb8PMS1JpzgBSWR+4tNtS9QCvQ8Bdx8IjHt7Sr0wsoUAHLzUI+
 cwXJfzKAv5F5T+7JaVNss980w6QdImgyFwBVp690vwbbD/MjsJ3PDOo4orba4hVOfQZ3uB8IZat
 v86+56s8pEQ+BsGUVd3Fa9QGd2UP+zW6SY1bxYCsDoEKjAyWu0qg++4/tnJVqvDMMP7K+nIA2YG
 ExO0b91jsegvOqltqdN9Sy2xPLb9ve3AnKG59CwF2xegqHCKVN1xsTft+fZQZW5/0h2HDJFdKfC
 NNQyp3H0xJvheDyQdTfmHGASaYeip1qz3krtzCAR/iv6plVBB7ZdDQdjtw39bJKpXOLCoUS54k0
 U1dVvUQ68rNvfS+tAgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040068

T24gV2VkLCA0IE5vdiAyMDI2LCBLaWVyYW4gQmluZ2hhbSB3cm90ZToNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG9yaWVudGF0aW9uID0gPDI+Ow0KPiANCj4gYW5kIHRoZW4g
eW91IGNhbiBkbzoNCj4gDQo+IAkJCQlvcmllbnRhdGlvbiA9DQo+IDxNRURJQV9PUklFTlRBVElP
Tl9FWFRFUk5BTD47DQoNCkdvb2QgY2F0Y2gsIHdpbGwgZml4IGluIHYyDQoNCi0tDQpUaG9yc3Rl
bg0K
