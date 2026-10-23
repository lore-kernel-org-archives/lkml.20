Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792753456;
	b=V/nB/FEEUiI4L3zm39qB5gIJNALsIB1E7yGOuCEJYzVMDGkotNcSUcoyRZ56v/6I9orl
	 Fr1Ig0KqGQhpvar81xble/zr1PBH4tbQ9CBqmiYHBxe8JjKiezPQ73Vw6852mCVIq4GX1
	 tm8c4J5mRCxBVYsNav7yJaTJ8sEWYq+H/sg8ySYB5HMZoo01z2snJq3sl1DE/PghrRYDY
	 6D0N1qs4iulqWfzmFNJbaPaJ5VQIigXaPkCE8pW11Yqntt7q6d2Hca9slx14arlJ1+eNo
	 tBebpK6O59CmLY8gi358Zeyo7pztpPKM7yBCf4rT9s4yolMuSCsO1k1m0PrFaxWh2ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753456;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9vrsn39Bv8sf1TqabbN+h0rzDe4+1Jk3K3pIgwnodyo=;
	b=YNFbUBidsn7xeu//xcnHm/PD1bWIA4oJHhL0K2ro210e5CiKXFOutmfY5drfp1gYmR8e
	 jXRoNDU0pdR0QeZ+XV7JjrDmQomTNHV0MXgm8zCGdvPuEGl+/k5PAgaquwkesYF9BrlPd
	 EBNUR2NodlBl79J9JQVjELRh1FrsEorZADhm+IA4lSLm5FY8zYtckK5bx41LlWKDv+7qh
	 vhjSGlB4jMeA/m+N0o/q8+I+SIwKElFlewjQhBZRjDZak4juNtmQAr5K///aZ38mj0q0g
	 QxLlyNLYqDN217aJXit4PPmz2m5XkS0a+Lf9pt/fl2FaohG6LEKGJjGAlHqUA1IX6iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PisdGXHw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.50
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0D606A31A;
	Fri, 23 Oct 2026 11:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PisdGXHw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHsGLPSlYPY9SiR5gwHgnVc15V2PmHm/nJGtJ8dR0HvpEcPiUoKtPlZY4tgAglWbNiyqeAX7b1z6BVNkE5UNo/R3kV30s/E4auJC73zrhFMXRYREGkbfgiqnxwzxTI2jY00zCrhi/4Y11OFMbeWIIRVq+/UbB56atvJYPHquviqDfdNUfMQV8hrUE8qREVlzmx5FYvP3LCSWkaVpd916xi8QRPgTwNU3g4yzo/GLmjzD3KQba4IhOx3+sgu4coUpg9JIOlBqeLIWo5U1o4AzUGNdih3FJ9B2uzk2cnNJ86B35aVcXBx+ENhES6x2CaoGcnmjovDpl7UzzU+2l7Tg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vrsn39Bv8sf1TqabbN+h0rzDe4+1Jk3K3pIgwnodyo=;
 b=Z5sB1ufCkWnIAUNe7f9qY3v2LyhDGcCjuE6BVD5SEKex0N6hlpE/X2nMUH95o6rjV0qn9DLgDHuOyquu61OalIjtlNipG8+m3WAGK9IxEhG4LEiETdza64gZkOX3M3d8/x5/VsQMf8sSEF0/Ll+daNReY54sIDGdKvmSzVS5klPAviSdHLBGyJrCALA28LpZDZc6YnnkxrfYA7AFFE5qK8PPHWu4pIdKx52X/sBhiKl3qP6eLtxCGHpktj1d+uCalgZiYtAW1G4h6qz+VPWXlLe+pN7DFfw7LUygfB7WNAgsOybTJvJCcNULMvOq/SteAC+3kK12FmccCSzMpfKhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vrsn39Bv8sf1TqabbN+h0rzDe4+1Jk3K3pIgwnodyo=;
 b=PisdGXHw1AI94/R3RoAYoNjFjkaEhNbEgLGesvOwxKo1Fev5fDRkPhT7yw6tQIviNl2KhVAfNLYgDPXXN1BuzVGoluEkeLR579Dz9dznNVQU4cMhcSx05kBzrxqaebcqZlk95bthYzdCHhscopBrNvgT7Zlin+b2LVy7R77w8S7+oWptn2JL0o8lQj8yWlFHatrup+CoNPQrFNbJOHT4Wd8Ncun5RFeyv9J9N+p7a8ICPDUZHD7kEey5npWzT5FHoNyxVTtk4OCvlyPml5NdmM10EHjyTu2bFAtVDY04E763qZFjJ2MMtKPOaPzPGaawD59aQvjA6kqsIk7v37XQWQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 11:04:12 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:04:12 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>, "lee@kernel.org"
	<lee@kernel.org>, Frank Li <frank.li@nxp.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Topic: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Index: AQHdSn42OBbw0rAzQEGMsn5hBR3yB7cLJu9g
Date: Fri, 23 Oct 2026 11:04:12 +0000
Message-ID:
 <AS4PR04MB9362E4F3E5E69CE45BE436E9FB642@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-5-lakshay.piplani@nxp.com>
In-Reply-To: <20260922103551.2754613-5-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-10-23T11:02:14.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB7605:EE_
x-ms-office365-filtering-correlation-id: 1f805a0b-f300-4a53-82c4-08df30f55eda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|6133799003|18002099003|10067099003|22082099003|921020|38070700021|11063799006|56012099006|4143699003|261021121427099003|261022105027099003|261022075727099003|261009223027099003;
x-microsoft-antispam-message-info:
 JOnyCJbfVS/OCyRVkPd/orMFbh78UojJebQ+GIdELB21QtgjcsTbDxkHy905cBj6izzgifqW+HYdx9Ska5Gj4TxHgYWzwq6GnA9uoK/6kjQDpLRJL0L4At6MD6Q1cnhA/3D7AYiZ4rjMC27V6VT8K4JvHbodxTO0qBf6HFnOs3Z+XyAv1VZkqceYdxTg0+PhsCHaRtPB/e717exmU1DksnUgFiP0mVKR8ishnlkddPBbVj2HZHXEI1gTdp5olASiJYVhwb5k+K1ltbPjmiUkONtMR5gBYOyoqy6Z9zFElEwhS5HSRfkpixngfoZw/sR8PtcYCvEWvazMyu2iUKQJ80MrrQqjkzV4ViLlab5DkC4+pwbLtovU1D9UkXA7P9pbsccSDuvCuQghh1mKcXgmePewYnmc5e2vUIKLjbLZI/1MLsg3ZwS7kzIyvLKWiVi5uZ1BwTHxn/t1vVlEdyo6q7brJumgHiBjgIKpskseAcFk8NjiiQp1T2e5nKAopUC9oRfp2zlVSwOYFIlOvLypY4yGapYgr3yTgdiz33UE33pv0JuqMNaClnA+moOipzEePsMjrU2wsSU0VUL34Bq8xsxIKb7cepgHPTumcw/3AeZ/BxcSQTxOUt5qEn2VBY3sdFO6D4pisfH2k0AMyU22Pv81YfYby4YTeWDVvx10WSdcwmk6VJdtmT4iajhivMRFw4+efAPICRm2Vbkfa3Ocql1+raWNwhzwGxDjA9BvICva1EKKVZRpc4Dvis7wCypt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(921020)(38070700021)(11063799006)(56012099006)(4143699003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkZpS0o0YmxEMEdLaHhLSGNEUWR4V0JhU25pS2NjUE1oSG8zYzAzZTUzaUFP?=
 =?utf-8?B?SG5VdFVPZjFvaEIzdGxQRlNvUkpvT3g2QlhFQkowemFaeE9IT2VzWlI2ZkZC?=
 =?utf-8?B?STlsbXFsMFpwMVRFeUI5NEhFb0tvU3BwOHhWSzV0dFZVNUx3YVl2bnBFK0tq?=
 =?utf-8?B?NnJWdjdNWG9zU0RZMTBjNFE2K3JiNkhqaG5RSHBaMTFXbE56eGQvM3JYR2Jw?=
 =?utf-8?B?cDd6MzZiTFNWU2pvKzYzRWV4eDU2aGI0cTN2L0tLVWo1NWZML1BNMGs4Tk9Q?=
 =?utf-8?B?TVpMYitqWVFOYy83Nm9udTVSS0FRSG5qdjFIYzZaNFpNcWxNd0dwQTNyKzhx?=
 =?utf-8?B?U2U2MlhTckhKRzNYMndXT2diQjlTaHBNRlVVZ2llbTRJRk9tNFl5eG5xckdI?=
 =?utf-8?B?Sjd1R3ByMnpod1pUUmVpY1lTTWU2ajRTLzZybEYzV0dPN3BCbXlUL3NHT1dP?=
 =?utf-8?B?cHNTK0tUSit1T2RVd3VsNFB4QmZvT1V6K3MxQUVsQVRoa0RQOGZOWXkzZVpw?=
 =?utf-8?B?emFkSlFFYS95OGZsOE54WWYwRDMxNksvczFqYXp0Y1QzY0ltY1VldFZZN2lI?=
 =?utf-8?B?YlNkdWVGVzFyYTFrQWFWd0M1bXhNb1ZDYTJKOTRLZzdmbGVBdFhoZ1YzeVZI?=
 =?utf-8?B?OFhkY21UcDdFbGlmUDhUcWdkZGZwc0xOZitsVmxjWEp0b2l3cmpEdDJNS2lu?=
 =?utf-8?B?R2NuWXM3Q0t0N2JsNFQ4cGlCYzBGZDFtZjlXdUgyQWNvK0VKSTZVUTA3NkhB?=
 =?utf-8?B?c0VHak5jUmdDZlIxN0Rxa2pYRUcycitDdWVVdDhkNnRkTnNZVWNCOWZWemRI?=
 =?utf-8?B?S3E3OCtQQjN1YktOOVhLZ3NHMzBSbk00eDZVTDNHUEZZMzE4cVNlb0pGdFVW?=
 =?utf-8?B?czV6dmZveG50ZTFyOExnOHhRRXoyV09heTJXSTU0YVRuek52Mmk4SWtIN0dG?=
 =?utf-8?B?RThPZ2xiaGJTU1plSFkwTTFSSkZwK2xBZW1GV0pMam9QSk9nMHB2Yjd3cjNn?=
 =?utf-8?B?bFd6ZHZzN0xKTDBodkMvZFJaOGplaUVzWUx1Q3hEcXpPK3pkMGZUVjQrSHFY?=
 =?utf-8?B?OFM0VEEwakc1Vkh4dGY2emovcWhzYWZWU1hhV1NwYlJzTmFDY0g4OWRlRW5P?=
 =?utf-8?B?VzF2WVgvN0h6SnhaY3BudmU1cGxrLys1dE5FY3BybXF5MFlDc092QXg3bjJQ?=
 =?utf-8?B?eWxKRzlucW5YbzZSSTlrQVAwcHVXZlArcnNzeUNBQjFYYkFCWlU5N0VFbW5z?=
 =?utf-8?B?RGJDWVlybm5rZUtTZ2FWQkFaY2d4UVRMNy9qaGs2MmdhYnk1ZkRHcmxZTVJY?=
 =?utf-8?B?YjdCL1FEeWRhTVlPckE1QWZLMWlWdlVoWGZEaCtXYnN3d2FCUm9CRE9oSFJB?=
 =?utf-8?B?L0JldDV1VGxGZ1JsKy93N3BXT0FqVERLcVNzMk5rQ0JuSzdIa3BlZGZ5MXd3?=
 =?utf-8?B?aCtwRXBVREUra3h5Y05sZWxvN3I5cHpoVFF1ZzZyOU5GVjRDYnpPazcyMG1V?=
 =?utf-8?B?MU51ZFUzVWZaZ1p5Y3Vyb3dDdE5xSmMxSmxrTHZrQzNZeHpnVFFuOHZaRWNG?=
 =?utf-8?B?dmFHM0FQL05TbVlCWTJtRm5IazRBc0xudEFNVDJLNStXNElSdE5sd0FiN01W?=
 =?utf-8?B?akk2SWV2aWtpdEcvODFVdnh3ZVB3RzdnQXZhNUQ4dENZNWY4bkFXUlArZEkr?=
 =?utf-8?B?MklZQWlyVkxxUUFocGc3eFJyU0J4QUpKRGtjT2RtNnRzRVd6VjlsTEgzOHRt?=
 =?utf-8?B?MDR2Nk10RUV1a0xMVGo2TThrMWQvWkFTNXJBM1VqYnBBbmtIVTd3Ynl3SXYr?=
 =?utf-8?B?WHVpbXp2V2NiVFpIRjFRczJLWTNBeEU5QTVVZ2tlMVMzRm41Skg4NWY1QkRl?=
 =?utf-8?B?T3RVUW5HNVk0V3NxanQ2VUFBODljaWp1N3pZV1lDNVJrdm1tK0FuL2xxZDMz?=
 =?utf-8?B?dDVucW5sTEQzS3RSTnlPdEMrZjZDSjZTNkFRd3FGcDhFczhPLy9VcW14SzVZ?=
 =?utf-8?B?ME9mS2ZQcm1pZkcvMDM2TG1lZTN5UjRkTmpjYi9PTmdTK0I5QnNuVHFNOFY1?=
 =?utf-8?B?ZUpacDJOczVaT1RZU0NKaEtQTjh2UEkzak1xck9WOWNEOFBGODR5M2s2blo2?=
 =?utf-8?B?K3VHKzlHMkFkWDl5VWRKRFhYa0Nra25NS0pkN2NPbmJMK3FTc2dmSWQ5cVpL?=
 =?utf-8?B?dk5wTkxtc3E4YkZsU2lBNnN2UkE4ZVpzUEkzejB5N3h2K1ZJRExidk1qWHJ5?=
 =?utf-8?B?Tlc0bVdqeFRETTdYWERmYU1IKzBndWUvMUVFTTdIOXJEUDhwMnlKMTJkMzVU?=
 =?utf-8?B?NGErUnZUbUZpcHNsMDI3cUVZdEp5U3lMMS9pd05CY0l3aW8wb0VRZz09?=
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f805a0b-f300-4a53-82c4-08df30f55eda
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 11:04:12.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1chdkd+DiMNAfK/CUj7ZaCeh1oGVLdUcO5Gqvh8W2awv9E7wuzN0lo3PD+q9khoFg1Z0ZaA3sxEdurUOfwrWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605

DQpOWFAgQ29uZmlkZW50aWFsDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciAyMiwgMjAyNiA0OjA2IFBNDQo+IFRvOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gYWxleGFuZHJlLmJl
bGxvbmlAYm9vdGxpbi5jb207IGtyemsrZHRAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOw0K
PiBjb25vcitkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgYnJvb25p
ZUBrZXJuZWwub3JnOw0KPiBtZmRAbGlzdHMubGludXguZGV2OyBsZWVAa2VybmVsLm9yZzsgRnJh
bmsgTGkgPGZyYW5rLmxpQG54cC5jb20+Ow0KPiBsZ2lyZHdvb2RAZ21haWwuY29tDQo+IENjOiBW
aWthc2ggQmFuc2FsIDx2aWthc2guYmFuc2FsQG54cC5jb20+OyBQcml5YW5rYSBKYWluDQo+IDxw
cml5YW5rYS5qYWluQG54cC5jb20+OyBBbWFuIEt1bWFyIFBhbmRleQ0KPiA8YW1hbi5rdW1hcnBh
bmRleUBueHAuY29tPjsgTGFrc2hheSBQaXBsYW5pDQo+IDxsYWtzaGF5LnBpcGxhbmlAbnhwLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIHYyMCA0LzhdIG1mZDogcDNoMng0eDogQWRkIGRyaXZlciBm
b3IgTlhQIFAzSDJ4NHggaTNjIGh1Yg0KPiBhbmQgb24tZGllIHJlZ3VsYXRvcg0KPg0KPiBGcm9t
OiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPg0KPg0KPiBBZGQg
Y29yZSBNRkQgc3VwcG9ydCBmb3IgdGhlIE5YUCBQM0gyeDR4DQo+IChQM0gyNDQwL1AzSDI0NDEv
UDNIMjg0MC9QM0gyODQxKSBmYW1pbHkgb2YgbXVsdGlwb3J0IEkzQyBodWIgZGV2aWNlcy4NCj4g
VGhlc2UgZGV2aWNlcyBjb25uZWN0IHRvIGEgaG9zdCB2aWEgSTNDL0kyQy9TTUJ1cyBhbmQgZXhw
b3NlIG11bHRpcGxlDQo+IGRvd25zdHJlYW0gdGFyZ2V0IHBvcnRzLg0KPg0KPiBBbGwgdmFyaWFu
dHMgc2hhcmUgdGhlIHNhbWUgcmVnaXN0ZXIgaW50ZXJmYWNlLiBSZWFkIHRoZSBpbXBsZW1lbnRl
ZCB0YXJnZXQtDQo+IHBvcnQgY291bnQgZnJvbSBERVZfQ0FQQUIsIHNvIG5vIHBlci1jb21wYXRp
YmxlIGRyaXZlciBkYXRhIGlzIHJlcXVpcmVkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbWFuIEt1
bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBW
aWthc2ggQmFuc2FsIDx2aWthc2guYmFuc2FsQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IExh
a3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IFJldmlld2VkLWJ5OiBG
cmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjIwOg0K
PiAgLSBObyBjaGFuZ2UNCj4NCj4gQ2hhbmdlcyBpbiB2MTk6DQo+ICAtIFJldGFpbiBvbmx5IG54
cCxwM2gyODQwIGluIHRoZSBPRiBtYXRjaCB0YWJsZSBiZWNhdXNlIHRoZSBvdGhlcg0KPiAgICB2
YXJpYW50cyB1c2UgaXQgYXMgdGhlaXIgZmFsbGJhY2sgY29tcGF0aWJsZQ0KPg0KPiBDaGFuZ2Vz
IGluIHYxODoNCj4gIC0gUmViYXNlZCBvbnRvIHY3LjMtcmMxOyBubyBpbnRlbmRlZCBkcml2ZXIg
YmVoYXZpb3VyIGNoYW5nZXMNCj4NCj4gQ2hhbmdlcyBpbiB2MTc6DQo+ICAtIE5vIGNoYW5nZQ0K
Pg0KPiBDaGFuZ2VzIGluIHYxNjoNCj4gIC0gVXNlIGEgbmFtZWQgaW5pdGlhbGl6ZXIgZm9yIHN0
cnVjdCBpMmNfZGV2aWNlX2lkDQo+ICAgKHsgLm5hbWUgPSAibnhwLWkzYy1odWIiIH0pDQo+ICAt
IEtlZXAgdGhlIHNoYXJlZCBoZWFkZXIgaW4gaW5jbHVkZS9saW51eC9tZmQvIChzdHJ1Y3QgcDNo
Mng0eCBpcyBzaGFyZWQgYnkNCj4gICAgdGhlIG1mZCBwYXJlbnQgYW5kIGl0cyByZWd1bGF0b3Iv
aTNjLWh1YiBjaGlsZHJlbikuIFRoZSBpM2NfaHViX3ByaXYNCj4gICAgYmFjay1wb2ludGVyIGlz
IHJldGFpbmVkIGZvciBJQkkgcm91dGluZywgd2l0aCBkb2N1bWVudGVkIHB1Ymxpc2gvY2xlYXIN
Cj4gICAgb3JkZXJpbmcNCj4NCj4gQ2hhbmdlcyBpbiB2MTU6DQo+ICAtIFJlYWQgdGhlIGRldmlj
ZSBjYXBhYmlsaXR5IHJlZ2lzdGVyIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBkZXZpY2UgaGFz
DQo+ICAgIGZvdXIgb3IgZWlnaHQgdGFyZ2V0IHBvcnRzDQo+ICAtIFN0b3JlIHRoZSBkZXRlY3Rl
ZCB0YXJnZXQtcG9ydCBjb3VudCBpbiB0aGUgc2hhcmVkIE1GRCBkYXRhDQo+ICAtIEFkZCBPRiBt
YXRjaCBlbnRyaWVzIGZvciBhbGwgUDNIMjQ0MCwgUDNIMjQ0MSwgUDNIMjg0MCBhbmQgUDNIMjg0
MQ0KPiAgICB2YXJpYW50cw0KPiAgLSBBZGQgYSBzaGFyZWQgaHViLWNvbnRleHQgcG9pbnRlciBm
b3IgdXNlIGJ5IHRoZSBJQkkgaGFuZGxlciB3aXRob3V0DQo+ICAgIG92ZXJ3cml0aW5nIHRoZSBN
RkQgcGFyZW50J3MgZHJpdmVyIGRhdGENCj4NCj4gQ2hhbmdlcyBpbiB2MTQ6DQo+ICAtIENsZWFu
IHVwIE1GRCBkcml2ZXIgY29tbWVudHMsIGZvcm1hdHRpbmcsIHZhcmlhYmxlIG5hbWVzIGFuZCBh
dXRob3INCj4gICAgaW5mb3JtYXRpb24NCj4gIC0gRGVmaW5lIGFuZCBkb2N1bWVudCB0aGUgSTND
IGh1YiBEQ1IgdmFsdWUgaW4gaGV4YWRlY2ltYWwgZm9ybQ0KPiAgLSBVc2UgZGlyZWN0IHJlZ21h
cCBiaXQtd2lkdGggdmFsdWVzIGluc3RlYWQgb2YgbG9jYWwgbWFjcm9zDQo+ICAtIEFkZCBhIHNo
YXJlZCBwcm90ZWN0ZWRfcmVnX2xvY2sgZm9yIHByb3RlY3RlZCByZWdpc3RlciBhY2Nlc3NlcyBh
Y3Jvc3MNCj4gICAgUDNIMlg0WCBjaGlsZCBkcml2ZXJzDQo+DQo+IENoYW5nZXMgaW4gdjEzOg0K
PiAgLSBVc2UgaTNjX2RldmljZSBoZWxwZXJzIChpM2NkZXZfdG9fZGV2KCkpIGluc3RlYWQgb2Yg
ZGlyZWN0IHN0cnVjdCBhY2Nlc3MNCj4gICAgdG8gbWFpbnRhaW4gQVBJIGFic3RyYWN0aW9uDQo+
ICAtIEF2b2lkIGluY2x1ZGluZyBpbnRlcm5hbCBJM0MgaGVhZGVycyBhbmQgdXNlIHB1YmxpYyBk
ZXZpY2UgaGVhZGVycyBpbnN0ZWFkDQo+ICAtIEVuc3VyZSBwcm9wZXIgZGV2aWNlIG1hdGNoaW5n
IGJ5IHJlbHlpbmcgb24gbWFudWZhY3R1cmVyIElEIGNoZWNrcyBpbg0KPiBwcm9iZQ0KPg0KPiBD
aGFuZ2VzIGluIHYxMjoNCj4gIC0gTm8gY2hhbmdlLCBhZGRlZCBSZXZpZXdlZC1CeSB0YWcNCj4N
Cj4gQ2hhbmdlcyBpbiB2MTE6DQo+ICAtIFVzZSBNRkRfQ0VMTF9OQU1FKCkgZm9yIGNoaWxkIGRl
dmljZSByZWdpc3RyYXRpb24NCj4gIC0gUmVuYW1lIGxvY2FsIHZhcmlhYmxlcyBmb3IgY29uc2lz
dGVuY3kNCj4gIC0gUmVuYW1lIGRyaXZlciBuYW1lcyB0byBmb2xsb3cgc3Vic3lzdGVtIGNvbnZl
bnRpb25zOg0KPiAgICAtIFVzZSAnLScgaW5zdGVhZCBvZiAnXycgaW4gZHJpdmVyIG5hbWVzDQo+
ICAgIC0gRHJvcCB0aGUgIl9kcnYiIHN1ZmZpeCBmcm9tIGRyaXZlciBuYW1lcw0KPg0KPiBDaGFu
Z2VzIGluIHYxMDoNCj4gIC0gRHJvcCByZWR1bmRhbnQgaXNfcDNoMng0eF9pbl9pM2MgZmxhZw0K
Pg0KPiBDaGFuZ2VzIGluIHY5Og0KPiAgLSBSZW5hbWVkIG1hY3JvcyB0byBmb2xsb3cgY29uc2lz
dGVudCB1cHBlcmNhc2UgbmFtaW5nIGNvbnZlbnRpb25zDQo+ICAtIE1hZGUgUkVHTUFQIHNlbGVj
dHMgaW4gdGhlIFAzSDJYNFggTUZEIEtjb25maWcgY29uZGl0aW9uYWwsDQo+ICAgIHRvIGF2b2lk
IEkzQy9JMkMgZGVwZW5kZW5jeSBpc3N1ZXMNCj4NCj4gQ2hhbmdlcyBpbiB2ODoNCj4gIC0gTm8g
Y2hhbmdlDQo+DQo+IENoYW5nZXMgaW4gdjc6DQo+ICAtIFVzZSBuZXcgY29uZmlnIEkzQ19PUl9J
MkMNCj4NCj4gQ2hhbmdlcyBpbiB2NjoNCj4gIC0gTm8gY2hhbmdlDQo+DQo+IENoYW5nZXMgaW4g
djU6DQo+ICAtIENvcnJlY3RlZCB0aGUgb3JkZXJpbmcgaW4gdGhlIE1ha2VmaWxlIGFuZCBLY29u
ZmlnIGZvciBNRkRfUDNIMlg0WA0KPiAgLSBVcGRhdGVkIGRldl9lcnJfcHJvYmUoKSBmb3IgcmVn
bWFwX2luaXQgZmFpbHVyZS4NCj4gIC0gVXBkYXRlZCBtb2R1bGUgZGVzY3JpcHRpb24NCj4NCj4g
Q2hhbmdlcyBpbiB2NDoNCj4gIC0gU3BsaXQgdGhlIGRyaXZlciBpbnRvIHRocmVlIHNlcGFyYXRl
IHBhdGNoZXMobWZkLCByZWd1bGF0b3IgYW5kIEkzQyBodWIpDQo+ICAtIEFkZGVkIHN1cHBvcnQg
Zm9yIE5YUCBQM0gyeDR4IE1GRCBmdW5jdGlvbmFsaXR5DQo+IC0tLQ0KPiAtLS0NCj4gIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICB8ICAgMiArDQo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAg
ICAgICAgfCAgMTMgKysrDQo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgfCAgIDEgKw0K
PiAgZHJpdmVycy9tZmQvcDNoMjg0MC5jICAgICAgIHwgMTY0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9pM2MvZGV2aWNlLmggIHwgICAyICsN
Cj4gIGluY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaCB8ICA0MSArKysrKysrKysNCj4gIDYgZmls
ZXMgY2hhbmdlZCwgMjIzIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21mZC9wM2gyODQwLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBpbmNsdWRlL2xpbnV4L21m
ZC9wM2gyODQwLmgNCj4NCg0KSGkgTGVlLA0KDQpBbGV4YW5kcmUgaGFzIGFscmVhZHkgYXBwbGll
ZCBwYXRjaGVzIDEvOCwgMi84LCAzLzggYW5kIDYvOCBmcm9tIHRoZSB2MjAgc2VyaWVzLg0KDQpQ
YXRjaGVzIDQvOCwgNS84LCA3LzggYW5kIDgvOCByZW1haW4gb3V0c3RhbmRpbmcsIHdpdGggcGF0
Y2ggNC84IHByb3ZpZGluZyB0aGUgTUZEIGNvcmUgcmVxdWlyZWQgYnkgdGhlIHJlbWFpbmluZyBw
YXRjaGVzLg0KDQpEbyB5b3UgcGxhbiB0byBwaWNrIHBhdGNoIDQvOCB0aHJvdWdoIHRoZSBNRkQg
dHJlZSwgb3Igd291bGQgeW91IHByZWZlciBpdCB0byBnbyB0aHJvdWdoIHRoZSBJM0MgdHJlZSB3
aXRoIHlvdXIgUmV2aWV3ZWQtYnk/DQoNClRoYW5rcw0KTGFrc2hheQ0K
