Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794800325;
	b=rJW5Hac3+BYgRQ/tXa9DKuzUkoIlsC1NkSYOXvhv84XVNlBR0WIRvwxw/vF6RziLdl0n
	 0zLa7SVtQB9TOUWOaoYBfBtmtGa0ke9qAcEv0ykGwSURYRSFch1vdZJv6JcN5ee2JtRoE
	 rT8YZ/yfL+Fj8OSSptXLNpeZMhXUrHe5mpPzRBR13sYgQbykNn2nuIN4TeEfmW5/pc0bm
	 V12+eYcGDnpZ+smcD2yYjThX5Hpele0MfLx4pSaOyKTSD7hI0ap6309iamu8DWKXXzJde
	 fd0ZNzwct57JADzV6fC2d11iz4GMQCjtmwklnCKsG8DbacrpP3GB5vtRNeQsCVht5vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800325;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=4uEmOYP1s6aAMiWicCzV0jxCSC2bEV21FP41ziF/iO4=;
	b=P+WuxScnM6v4d6n9Ndwta82mYKGayhtfRpKSiH2lu5sjgT+vSQKB+XTXqQx+ZegMoENw
	 VcChxo/13T4Hilvx7+SET71cnv0Bq0+tHrwMTJ4KlviMYzfShx3meXCp02oTrxj6ZHr81
	 aW286AvXZ4NVzWkLuL6VOID+tm/AlRYkqMOTC2cKJEMufR7MijEfw3t4bv9UZSrb735S4
	 Uk6ExFt9CJbOdS4j9Pzpr5uRSL5EZ6ZgOzW1LdYAwGyy8jspvtgSGuowIp8TrLPJa840Q
	 kLg/avtISvGFfTjFkgWHSSNR26LlafHSVML65mV+NwkH93AueM4Ve/aizsLaeWa8Tmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TwzH4fxm;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b="MArY/WuK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8C606A321;
	Mon, 16 Nov 2026 03:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D8C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TwzH4fxm;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=MArY/WuK
X-UUID: 33dad10ee16f11f18dc8c9802ae25ab1-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=4uEmOYP1s6aAMiWicCzV0jxCSC2bEV21FP41ziF/iO4=;
	b=TwzH4fxmMEJ71YzCjfCjbGS6xBsT0Ae+kdCValu0SmznoNRF8svhIIY1igSJGeU3AdOK1i//CcnHauKbE/aSjTL60xuNx1EGaGlQazY6GKYZTQT5YQDhYw/iiEItxfzqs9CcmWQQZlu2J0KstL2lTdK+NakBLSfdsNf2vgsc9iM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6f1a37a6-7b7a-4907-92e9-00a0a2bbf576,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:b0318ac,CLOUDID:f75ce730-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:4|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 33dad10ee16f11f18dc8c9802ae25ab1-20261116
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <allen.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1368988285; Mon, 16 Nov 2026 11:38:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Nov 2026 11:38:34 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Nov 2026 11:38:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkR/MPE0H/ckCk/NfbP6Ourg5e7AC3TFeifFWOOTgqbXJ2qsbWFFBceOpmanQNxcQW1qk80t6YtuZFf6ao+QxqAJkiS19xkCxO0OKNKg4gGMSIPebU+f7G2k/2RxLyXd+RrEC9vF+F6GC3eYzFuPIcS4Zc9PIYp18Rwbes3O02Fnf9ntlC7ctxvqFIeX6pGcFbJCnTpsoRJM2Y5RpfNcah40I/5M8epIyvcn2UBtyIogKWwXzMQn3tduWu4RSDChyigXeHGiJ81xHEYYRn/cjxc3GYRjFvNldnVp/RJKFGrC/PE4f1hrGTv7H2Kmdmc3xCpJSwToalckjztmu4bCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uEmOYP1s6aAMiWicCzV0jxCSC2bEV21FP41ziF/iO4=;
 b=rqCo2XqmkmMQE8nNW9+Rr6tdQ4rczDBhassmNbddwDZMMytFfTqZncpMxfWZpunCCHuowEOvHscbcwT/3DdXuV5irLrAUWzRtgT6WPdJOiBIzTx1ouebCw3qXe39qr09yaa6WFWqaBr/0cFOKgbcouqdqaJcARXCS05XKR0dQNtutqVuL6UPsLdiZiWt7RUJ7cKrQEVnV5YI/dAE1nd010+QUfEp0vFhhiE6WsalGMYH9voAzcMY2Qk87HOIJGc9oJhIg5wTeG+N1xgaO1HRBDkbpapgQ5LRvYX+eGMuokYIi94v10g/fX6FPJFdMQq1j6WDH/r4y4ujMaKtZit9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uEmOYP1s6aAMiWicCzV0jxCSC2bEV21FP41ziF/iO4=;
 b=MArY/WuKbr8uKsjF/b++nUIeitQRny0+IJjPJgX+oEZGjbDbPJq2PUFeRXtqEbJ9qQOxh6Qf7W3OUahVflLuv4+Sc5bQYvnIRVzVIHfZ9ZzC1PHItdx9BEtBGiUNrV/QSwW+jmgTRiJXSQVWMA/JdR1EwPo9UU+69RbyOjTp33Q=
Received: from SETPR03MB10393.apcprd03.prod.outlook.com
 (2603:1096:101:318::12) by JH0PR03MB7342.apcprd03.prod.outlook.com
 (2603:1096:990:a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:38:29 +0000
Received: from SETPR03MB10393.apcprd03.prod.outlook.com
 ([fe80::13b4:88e6:68f1:ce4c]) by SETPR03MB10393.apcprd03.prod.outlook.com
 ([fe80::13b4:88e6:68f1:ce4c%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 03:38:29 +0000
From: =?utf-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>
To: "pooventhiran.g@oss.qualcomm.com" <pooventhiran.g@oss.qualcomm.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jouni.malinen@oss.qualcomm.com" <jouni.malinen@oss.qualcomm.com>,
	"asathish@qti.qualcomm.com" <asathish@qti.qualcomm.com>
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
Thread-Topic: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
Thread-Index: AQIe8Mb01t6MIhE9H97NU0biyNXtRQH5+dXJtpmGA8mAA8CCAA==
Date: Mon, 16 Nov 2026 03:38:29 +0000
Message-ID: <9ab4068ed0dec1f9a13a2ba399119df04478d96a.camel@mediatek.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
	 <ea313f0127e2cfa72a3572f1893e59c6e2c22cd1.camel@mediatek.com>
	 <a509d2e4-c192-443f-a6b8-587efca47ffd@oss.qualcomm.com>
In-Reply-To: <a509d2e4-c192-443f-a6b8-587efca47ffd@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SETPR03MB10393:EE_|JH0PR03MB7342:EE_
x-ms-office365-filtering-correlation-id: cdfc0da6-c615-47e7-9e4c-08df43931469
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003;
x-microsoft-antispam-message-info: /suE+6kb+/Us8cQE+ePQoVFKIs9kazAKNVJzc+u8FKwYeAxNrMZsD7Ee4IZyYsTJ3vi1ogZPveKEuNk/MqP81+mM5L3m+ImvExLnvREwZjPwBLZvllYjz7QHLobC1pnkJKg80epK+1UyA5LrK7OVU1OPNRjDUnN4oAWYbxs+EBkE1WUKpOt/gYkam03Od/G9ufisGGjhMIFepTgWV3605pyaV1ZiXIM0a4KqJHIz8/k71yKeFgnUecv6yYJH6a6K1r72+h9xXwxNUkYGkTIXa7tYoqxMf2QTmuDW3aLQ+kcrzslHPdpXcaYAxyeM7BrBn9+lGCX5cdHRlf/HIx3f4QOYGjmCgr5IimXeF3Pvbv9Q8XMH841xABJ0ODE4Xib+jlQk2Y4U1vkFDR0aUEBQ+C9fs2np1o+OuuSnlMMmJ8NSD0+P8ZK9kzC/x2YT/LuOZBx6spPoPw6ePyS7pjK3+NJVGWmSnx7B3CUu/mPb0hJIQChrVg6raR8DwIcx57YEpALfxpl8xKd3LX2COF2UzZqX1wIgR0L/4ShfEBrMBrALsbzqv+bjnDibUX9yBfdVwurzVBioTElbrIdVhZW4JyFLvzs+lGTm6Z6QNlyL6yc9yTKc7FAGMiOeSybH8wwJ5up2ePyMVXuxgGQ55s1Feu+uGcDMHlV3hUi1NF2cIFTohOpYrP2pSyRmF08FSYF70ePlN8Im85kcV7RBMKeDGxyrk6iRKre2fj5jW6npRGw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SETPR03MB10393.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0hSV29QdW9RVVVNTFNPMDBsWEE0K2NMOVE4TWZLc2tpa1dWVmNrZUN5dVJR?=
 =?utf-8?B?b3NPSEMxY1ZZTEpSNVd5RzRJNFRFTDNyS0Z6ak5ReXh6YjFackhmekpaaW1v?=
 =?utf-8?B?NVFneHdJa3FDWGkyK1ovOEJBcmlQcUJUSWtxRWcyMTZ0SFliUjcxcWNnanFo?=
 =?utf-8?B?WXVsaUlOWGxQMzJWRzlGOEdZZU9iUnlmdHFEdnZsbThGTEFEK1Q4NTlESzhH?=
 =?utf-8?B?V2pqU1NhTk5wK3J2dFRGV2Q2RkdITENpRHV4RVh3YzVXWHEwZUlJOVA4MndC?=
 =?utf-8?B?emtGZUFQQ3hRZ2xyVUtvMlVDbDRLN2VCcDVjNU5BWWlEWEQ3V0M2LzM5Zi9L?=
 =?utf-8?B?aEdid1YyZ0FKS2pQc29JMlhZWkxPajBVK3RwSjRoWFNrUHlFMWJySVh0dFkv?=
 =?utf-8?B?OFlncStOR1QwTy81bDBTVFJ5eERCNjdJY1d5T0RkRkYyUDdVUWthYkFLRFJl?=
 =?utf-8?B?SVJ0QXpnU1U2T1N0Tk82aWpIUXllRHhTOWVnYUpkbDZYWFhGYkhoYmdwNlUw?=
 =?utf-8?B?UU9oMS9hM0VrWmk0VzE0K25SN1U0Wmo2ZlJibHNPWXFBNUhySWhNOU45cVJW?=
 =?utf-8?B?UGZBSi9GZFErMVU3Sjh4R3dsc3Z3WFRVbUVtZXF3aHJENnFlL1Z3cS8zVTdY?=
 =?utf-8?B?OXBPL2d3V09KUGpwemRkbk5KTTMyRVlkUE12UlNXQmd2cXdGaE1HS2JNZFdG?=
 =?utf-8?B?dW5pbHRTdnF1aWhHQVcwQWNoNEpLSXBFTDh0amZ5Z0JYaWJMdGNZODZZRmZO?=
 =?utf-8?B?am1FdDh4M3VLV09sdzZmWHlneFJGVjIyK21xallhZGRHTFMxSnFXL2FkMlZi?=
 =?utf-8?B?MTNwd091Nk9kZjBvUFNneks3RWQrNVNFOU56cVRjNEdxOGVweWpnbjlVelFE?=
 =?utf-8?B?bWdZSWU0cWticnVYL2lCZFh0VG40anZ5cTRxdTFHc3huMjBzd3owN0ZIYzRC?=
 =?utf-8?B?S0ZOZ0ErZk5Oa1JnakxrYXhObmJqM1Qxd0MvQkxLYVdIMm5BQ2J2N0dHQ0pa?=
 =?utf-8?B?bGQxWkNCUnAyZTlvejAwc2JKK0xmOHZDNWVaOVZhMENLeHBaVXBqSm4wQ1pz?=
 =?utf-8?B?SFdyMnV4U0thekdwMVNOamlDdm9EZXlHOHl5YmgvNDV5Yjc1MktxbW56eFpl?=
 =?utf-8?B?YWxOSGNjaCswbkYrb3JrUTZmaXpNOFgwRjE0SXJSK2t1aG9BM3F4dGYvcE9N?=
 =?utf-8?B?dTBzeVNDblJKak1PQ2tIOThETFVLM1R2eHdCdzRBNkNwakxkeXNsdlVKTFh1?=
 =?utf-8?B?WDZ4MkFRVThkdmtYSm1VVEZ6TzFpZjZ2S25kVU5SR1IyQ25BWFZRUjBYeGt2?=
 =?utf-8?B?ckc1NUdIUHFpaEs2WjhJRDhmQWhGTUw4YWFOMkY1SEs4clE1bWtCZTd5dStJ?=
 =?utf-8?B?S0tPdjZkWGFUUitPbFFJalUzZkRzVEhnTzg5a3FsK0lLWDBmeDNGNU4rWnMw?=
 =?utf-8?B?eUFsdm9rcFBWWlo4NVdEcVNWbG1ZcndNc2txdDR6TElVM3lGekc3V2NCd25u?=
 =?utf-8?B?ZU52SHd4MWNheERUMDlUQ25QQ2xXMHJHZi9DdGJWMnlyRU1NNlBTNFppdlRQ?=
 =?utf-8?B?ZUF1UmRBSnJVZVlFUFRHMUoxQUZQWVJkS3VpU3VHVTNoWUt0bHhKUFJjYXIy?=
 =?utf-8?B?MXMzSTU2NEgyQ0FNZmJPdFV5WU5Nc3RLY0luWTlaQU5MZTdyZlVoa1VwRDVt?=
 =?utf-8?B?UGFMU1ZlRSs2TlZjaWx5U2wyUXpTNmh4MUhIMHgzWFVYd0hNaHJrMHB2bXRJ?=
 =?utf-8?B?cEQweFMzMERjZVA2OXpnM2haQjM2U2pBb3RiOU9hTFRuNm5VSkd4NkVZTjMx?=
 =?utf-8?B?OEFLTnIwTjBUVVgvT09sOVhSUW5XbnJIVTNtWnVvcW1ldktVdExKSk9WR1hy?=
 =?utf-8?B?OHZQZGV3SWhCT1FpaEhhVHFhYitUQVpxQlh5YWF1UUlHTktPR1dSVFVESlBX?=
 =?utf-8?B?U0R5RW5hN25CdEdoeWE3Y2hxOFJ1T1RJK1U1R0FKbkc1NHF5MjZ2aXdrME8x?=
 =?utf-8?B?R3RORzVyZVJwU1QzNVJnUkJsbEh0MytFSTN5WG0vU1dlb21QRitKMmkzaFE2?=
 =?utf-8?B?V05YY0hZaEkwaHFlcXZOdFRoRGxCNnJNRkVhL1hqNmFJWG5hVzdUajlvYkRv?=
 =?utf-8?B?TVBOTjhQSVFzcFJ5dFlzMVdiN3BVVE9yU1VaNGNoK0k5QXVvSE03N0tMeE9Z?=
 =?utf-8?B?ZHJJZDBPZjBnL0RFN1B4MmxqKzgrVktmcHA0YXdPZzA3enVHdHh4eSsvYjVK?=
 =?utf-8?B?elJIQmd5UEdEM210THpoanhyaHRRNDdPY1VJWE5uZFhaakhSTDhtbGRSbzFV?=
 =?utf-8?B?SlBQaThRa3cwUHZDb21OMzZ6VzIvajJRWDd6Y0tKZy9UM1Q0bjRSQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A35772F38E4DF4FA61A349C43B98620@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: z6BGGkJO2mK+48rJ7Hr6PxQrUUhM11snZmgxDJZWQBw8Lq8vEqtl10vdh/dk8TIHJihBFWtNfvTRUAPEcuTH6yvppnMJlj3H34jdFQ/2q87+bquSYJ4upwiDAiwOjWuxt1kxGedaV+HGCPAt+yj9MLRWq/drFuYgXm9R5bg8jnW6VsU+xJCqYmpuhpvFaGtksDGn3UmTyscOTw5CTuwtPm625jrQuSPe3TOOpjgXnanAPjCfOMZH0rf1eVdN7F3SNUBulwWwPHd2Prk5bmDRwBaEvSonKEuFDRe53hMPCwez81IoF8TBCpMthpBRpzc4VczWtJEx/enFtNIZ3XLwXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SETPR03MB10393.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfc0da6-c615-47e7-9e4c-08df43931469
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 03:38:29.0991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiqSw3QZmRTInmstdd9t3/SaoXAfXdxYDks09zQpFFuvl3gMCTNZkkc1+BDQAEpWLqde6K0hR4uiFPjNDjVM6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7342
X-MTK: N

T24gRnJpLCAyMDI2LTExLTEzIGF0IDIzOjQ5ICswNTMwLCBQb292ZW50aGlyYW4gRyB3cm90ZToN
Cj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gT24gMTEvMTEvMjAyNiAwMjo0NCBwbSwgQWxsZW4gWWUgd3Jv
dGU6DQo+ID4gT24gRnJpLCAyMDI2LTExLTA2IGF0IDEzOjI4ICswNTMwLCBQb292ZW50aGlyYW4g
RyB3cm90ZToNCj4gPiANCj4gPiBIaSBQb292ZW50aGlyYW4sDQo+ID4gDQo+ID4gQSBxdWVzdGlv
biBvbiBob3cgdGhlIGNvbnRleHQgaXMgY29sbGVjdGVkIGhlcmUuDQo+ID4gDQo+ID4gPiBXaGls
ZSBwYWNraW5nIHRoZSByZWNlaXZlZCBtYW5hZ2VtZW50IGZyYW1lIGluDQo+ID4gPiBubDgwMjEx
X3NlbmRfbWdtdCgpIHRvDQo+ID4gPiBzZW5kIHRvIHVzZXJzcGFjZSwgbmVzdCB0aGUgU01EIGR5
bmFtaWMgY29udGV4dCBhbG9uZyB3aXRoIHRoZQ0KPiA+ID4gZnJhbWUNCj4gPiA+IG1lc3NhZ2Uu
DQo+ID4gDQo+ID4gT24gTWVkaWFUZWsgY2hpcHNldHMgKG10NzYpLCB0aGUgZHluYW1pYyBjb250
ZXh0IGlzIGtlcHQgaW4gRlcvSFcsDQo+ID4gc28NCj4gPiB0aGUgZHJpdmVyIGhhcyB0byBmZXRj
aCBpdCBmcm9tIHRoZSBmaXJtd2FyZSB3aXRoIGFuIE1DVSBjb21tYW5kLg0KPiA+IFRoaXMNCj4g
PiBtZWFucyB0aGUgZHJpdmVyIGhhcyB0byBob2xkIHRoZSBTVCByZXF1ZXN0IGZyYW1lIHVudGls
IHRoZQ0KPiA+IGZpcm13YXJlDQo+ID4gcmVwbGllcyB3aXRoIGFuIGV2ZW50LCBhbmQgb25seSB0
aGVuIHBhc3MgdGhlIGZyYW1lIHVwLiBIb2xkaW5nIFJYDQo+ID4gZnJhbWVzIGluIHRoZSBkcml2
ZXIgaXMgdGhlIHByb2JsZW1hdGljIHBhcnQ6IHRoZSBmcmFtZSBoYXMgdG8gYmUNCj4gPiBrZXB0
DQo+ID4gb3V0c2lkZSB0aGUgbm9ybWFsIFJYIHBhdGgsIGtlcHQgaW4gb3JkZXIgd2l0aCB0aGUg
ZnJhbWVzIHRoYXQNCj4gPiBmb2xsb3cNCj4gPiBpdCwgYW5kIGhhbmRsZWQgaWYgdGhlIGZpcm13
YXJlIHJlcGx5IGlzIGRlbGF5ZWQgb3IgbmV2ZXIgYXJyaXZlcy4NCj4gPiANCj4gPiAxLiBXaXRo
IHRoZSBjb250ZXh0IGF0dGFjaGVkIHRvIHRoZSBmcmFtZSwgaG93IGl0IGdldHMgY29sbGVjdGVk
DQo+ID4gZGVwZW5kcyBvbiBlYWNoIHZlbmRvciBkcml2ZXIncyBvd24gaW1wbGVtZW50YXRpb24g
KG9uIG10NzYsIHRoaXMNCj4gPiBtYXkNCj4gPiBtZWFuIGhvbGRpbmcgdGhlIGZyYW1lIGluIHRo
ZSBkcml2ZXIgYXMgZGVzY3JpYmVkIGFib3ZlKS4gSWYNCj4gPiB1c2Vyc3BhY2UNCj4gPiBpbnN0
ZWFkIHF1ZXJpZWQgaXQgdmlhIEdFVF9TTURfQ1RYIC8gU01EX0NUWF9FVkVOVCBmb3IgU1QNCj4g
PiBwcmVwYXJhdGlvbg0KPiA+IGFuZCBTVCBleGVjdXRpb24gdmlhIHRoZSBjdXJyZW50IEFQIE1M
RCwgYXMgaXQgYWxyZWFkeSBkb2VzIGZvciBTVA0KPiA+IGV4ZWN1dGlvbiB2aWEgdGhlIHRhcmdl
dCBBUCBNTEQsIHRoZSBmbG93IHdvdWxkIGJlIHRoZSBzYW1lIGZvcg0KPiA+IGV2ZXJ5DQo+ID4g
ZHJpdmVyLCByZWdhcmRsZXNzIG9mIHdoZXJlIHRoZSBjb250ZXh0IGlzIGtlcHQuIFdvdWxkIHRo
YXQgYmUNCj4gPiBhY2NlcHRhYmxlPw0KPiA+IA0KPiA+IDIuIElmIG5vdCwgY291bGQgdGhlIGZy
YW1lLWF0dGFjaGVkIGNvbnRleHQgYmUgb3B0aW9uYWwgKGUuZy4NCj4gPiBiZWhpbmQgYQ0KPiA+
IGNhcGFiaWxpdHkgZmxhZyksIHdpdGggdXNlcnNwYWNlIGZhbGxpbmcgYmFjayB0byBHRVRfU01E
X0NUWD8NCj4gPiANCj4gDQo+IEhpIEFsbGVuLiBTdXJlLCB0aGF0IG9wdGlvbiBjb3VsZCBhbHNv
IGJlIGFkZGVkIGlmIHNvbWUgZHJpdmVycw0KPiBjaG9vc2Ugbm90IHRvDQo+IHBhY2sgaW4gdGhl
IHJ4X21nbXQgZnJhbWUgaXRzZWxmLiBTaW5jZSBpdCB3aWxsIGJlIGEgZmFsbGJhY2ssIEkgY2Fu
DQo+IGNoYW5nZQ0KPiBob3N0YXBkIHRvIGRpcmVjdGx5IHF1ZXJ5IHRoZSBkcml2ZXIgZm9yIGNv
bnRleHQgdXNpbmcgR0VUX1NNRF9DVFggaWYNCj4gaXQgZG9lcw0KPiBub3QgZmluZCB0aGUgY29u
dGV4dCBhdHRhY2hlZCB0byB0aGUgcmVjZWl2ZWQgZnJhbWU/DQo+IA0KDQpIaSBQb292ZW50aGly
YW4sDQpUaGF0IHNvdW5kcyBnb29kIHRvIHB1dCB0aGUgbG9naWMgaW4gaG9zdGFwZC4NCg0KVGhh
bmtzLA0KQWxsZW4NCg0KPiA+IFRoYW5rcywNCj4gPiBBbGxlbg0KPiANCg0K
