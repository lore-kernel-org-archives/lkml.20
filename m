Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023111.outbound.protection.outlook.com [40.107.162.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5B51815C;
	Wed, 14 Oct 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984328; cv=fail; b=S+sxIsnvml8jZwArVWOHE76TWyDVmuKcdN18gxCGN1V086C3FCH4uky6TYslwg3VzCxA8+YmXQN9AuYFlUcjt7oLj08T24ssKBBsaCDgt7DWJ+D4xkwLyNhrSz5FeZCE7PZJNxVRL9lVXvXKTjZd3P09qAYpB3kyGb6nXD4lYHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984328; c=relaxed/simple;
	bh=EMh2/JtqJXdXDlA99b35W+O5No1jbhuhccl+QhnjNuw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RedXLpbUOhnG13zUqFrrs6btgQG6UWSfHR2817GaKoQrBKxbol74zwybEK7DS7ACvyaW4IcbNzbm5hc4sf7w06omPmEP8d1MvBoEpvQCEHXmJjC6uPc4dA1g9cB2Grb3TyEsoNOM/m96NhRPQwZ+BnfUWas/MpjI7zSsCGIJL5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=bMNzWnkk; arc=fail smtp.client-ip=40.107.162.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="bMNzWnkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF/o3AtJdaoDYaw8+4L2lpT+OcdtMwExBzOCI6uyNkyuOqY+cnqqzB7+bw3g2L/35sPGGiwfWs8KUA4aWikGD8LlMJxpR1/E/Ik6iGZDLQz13SmozEczAaC0iblsCtzY1A0nucnjTwRuVO/fNjDz4+cdkcIhbyGsSyTfI2xLPQjuW7KHJ8G7u8o2YRN0NeCewQ6JrM6yoiF0nJyGTvwkyKl7i69ujhftlt9VbqPYZ9F0Tq7i6DJ5TpzKislPzY9NM1RlqERO4BXdsi51Z2uy8wyl04fNY6af7vComeAJ9I3QAiRos2h1klf0F/6YoJC60COxLcGcBfy+riA4ihWpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMh2/JtqJXdXDlA99b35W+O5No1jbhuhccl+QhnjNuw=;
 b=IozA/puo31cGXO7jaR0W2UExeVBtiJuhReTPfsrypNf25TWj2IS9Ymc6kG0Yno6NNiFKL8Dpcqb64E3zRhtyX3V0NnedLG/TRs9J0Qc3VuoER44WKy/QS+b4wzKiJ0s1sV8IpA5Grdp/cV1iFIvjl2HYsJImEQXbXzAJvWJNJJSFLepRTG1Q1kJ68LbJUV22bydAIrAgiYEhKoHNrqxC28xuFg/lHew8l+ZOkARlHYV10uixjl7gJo648EqL1ZZPJFS+7hkceOf2VRGVuYD2ltMGZhBosBCdmr7+tjujbtfcPT+vPlq84uTOoq5IvrYhu9xBGymBGPns7fxOS9M2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMh2/JtqJXdXDlA99b35W+O5No1jbhuhccl+QhnjNuw=;
 b=bMNzWnkklvawWGrz685Aspg0NJMgawH/n8spSPSqYOpyeOciepGXiIPzD5nlTbZnj5pKFAwdSACapz5+BbSgvh6WxRSZ778/CMbet+X/db7Zocp0lzqoqVTQUzHC21WbvJryq8mgxWCos0DFeqTQDPo97p3aopkcrguWRh3sEs6xHoV4EvA1OyMgecEU28IPjZKlX+YjQVeQxVutPXEW3AtG+DHIqE6ZbtUao+Y/Vka83INgxclQSepAPP6aJEiwia6DEiPbueA0BcGHNlZ8Td5E4wQKkO7dZuISk/RqVS/9PvobrPY0RFb5BgaXQ8CveimnQK+GjFFKMc4PotrN0A==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by AM8PR09MB5228.eurprd09.prod.outlook.com
 (2603:10a6:20b:3db::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:25:23 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:25:23 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Thread-Topic: [PATCH 4/9] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Thread-Index: AQHdRFDNLd1amFu260GQWrktre5GJLbP8+gAgC1CZAA=
Date: Wed, 14 Oct 2026 13:25:23 +0000
Message-ID: <f32911c4-5bc7-4bae-b23a-8bf7848fc92b@htecgroup.com>
References: <20260915-mummify-overripe-ed52faf90098@spud>
In-Reply-To: <20260915-mummify-overripe-ed52faf90098@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|AM8PR09MB5228:EE_
x-ms-office365-filtering-correlation-id: a490e558-877f-4106-3ae9-08df29f699fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|38070700021|56012099006|11063799006|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 tMuJ3hy/aexvlr65kjkxL0XBLQxF37piN3jkmQt0D0ep56wijdXSNwjsDJPz24rOcD4eXG5xR6yaRaKhZuYJp4ENydeUSdGlRcV61EBuogWR4Bq2ZNghjl9aOB6rQtggKXFdb8+tnnKu3NUcQQwSNOqZjYtPzOt7hsFxecRnawI/X0GtQkOknIRxmZsNHfwoTx2w3ZeVkv/m1sP0UkmdvgRYR1uWpgG0EW6rlw9SkbshWecSo+6OuuLAxmG17Z06l083Pm0JI3m/MiTbh7qM46mIQIIqAPWkTrcxZGWonjpA2MNE3msS+i1bXgPoJ1VmhWl3fkUlFv48nxYK0uy30L42vbHz73RvU0J6Fr4o5acYXVsP6xoYkOI9LlqayS62FybFI/tmcEhyJKLdtNiISGUSVvKi/NCMcTpKNmhmRJgtbs+x8QnGTUQAVRl1RYyw51ee66w23quA769I0TRZbQHMBqIsY9QvxBHCa0XiBeHBIL2AyW2bzYzoVv3d11jJildIkC3QC66neoSiwkR1ITCBBB/kQPWLydOcMrTKneYU27VgNE63hwY2dizNW+1VJ68FENxE+7p/zACgrFZR774Kc5Oo+gNE/mTSxnCXN6JiBvYopCdBThYsE7gZemtCH50iUD73/s7ZyAOAPIKerDaE0XoEaI0p8+Stw+hLpwsvkcZNB/1Jm4+Rs11R6ggJKHnn/sYjPGv562AxXPUJGoH66SqotVlOpK13mA6YpB0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(38070700021)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZytFZ3RxZWhWdmVVS3FycjVMVWpYbG1iS1l0bEFGd2tqd2xsUUZQRzUyWFJo?=
 =?utf-8?B?TFdwMzFpd3hFL2hPNlpxNVAzSjhLajFic0NNd2p2UmNoeVdGdVlMdGxacWpv?=
 =?utf-8?B?QkRFcHR5RlhSNUdzUjB5Wk5UTHhyWmFuVGFZMkNHNTR6WWhPTFk1aWlYOWtl?=
 =?utf-8?B?TXRsTHhkZXFFR2JzbUMwc1M0VldpVTJxRUgzTU9tckJjWHVTRkRPWFAxUEhV?=
 =?utf-8?B?bXg2dUJlYWhTTFJrNUZiQWE0OUxiVVYzT2FiVTlFaHlnR01WRC9Zc2NJSGEr?=
 =?utf-8?B?SDNxSWlxTm1GWmJZckFUd2pjMnVUeUdZYnI4Szd1dHlUM3QreVlaQmlFMmlL?=
 =?utf-8?B?Y0NsWmtrc29yeks4bTlLRTNuaVlQQlpEMHNiRkZpTDlEOThMMUhKaHVlZEhK?=
 =?utf-8?B?UkpZOFRQS3cxNWhJZ3ZIYWYrNnJuUzhUOCtPS0hsSmZjZ0tseFVLbXkwOXNH?=
 =?utf-8?B?TWhKNjllYnVwbExlZkY1WEpsWEFsejRDMmtxL1RDKy9zSEN5Vnl1eXpsZGdM?=
 =?utf-8?B?eE5FbFlxZGFzWkJ4aWxFZHhvd0dzMDY3emVRS1pMS3RJbXVTK1JSQjRRcXdV?=
 =?utf-8?B?YWJ5WndXblY4UGdoeWJjUjVnV2xRUXdjdEdWekE5NVVqYmdnQ0ozUXhNMEY5?=
 =?utf-8?B?aHNzT05Kc1BZTjZYb29CdmtwazF5aE9RLzRnR0h2WFJxM0Y4YWNmM1RnbUhS?=
 =?utf-8?B?TEtyNDVCZkNJeVhHQ050cUR4MzZUT0Zhb25HdUtpTTRERlBBQlQvbE9sdm40?=
 =?utf-8?B?Y0pGTGtoVlpmM0RGdFNJcWFpRWFKWmRVRHFVZXZLSnRhT1NhQVZ4L3ptRjdo?=
 =?utf-8?B?Uzg4cWpZeEpHbExrNEdDbFFCT0tvMGxKSHl3MHJ3a3hRNm5GMzl6QnRpZzYy?=
 =?utf-8?B?bDU1Tmw5Rjl2VjdMUG9HbHdPaE16WjkzdVBCU2REa1dGbXVNWlJKbE5xT21H?=
 =?utf-8?B?RWRpRWhDWXdWMWVucFY2QWtkaXJWQVhVa21pR1F1YmR5b1o3Wk1CbHhTV2tq?=
 =?utf-8?B?dEl1bmp5TDRUd2tUSFhvSEdmWmxxdGI1ZGJqYzRJUVM4SjdOVERYanlWQmlv?=
 =?utf-8?B?Qnd2MElZUFE3UWdrdndMbndnMmxUQ1JyaERwUTh0Y2FGejNxaUJUWWhteVBY?=
 =?utf-8?B?UDkwVjB3ZWozQTJFQ25veS9XOHZsL3hYRFUvWXVYNnJ2OXlPeEpyREZtYWI3?=
 =?utf-8?B?RFRSeENwaVd4cmV2bzFoNG4xYzJ0RWlDOGhkeEs4T2E5RG1HVGt0a1I3cFgr?=
 =?utf-8?B?ZWt3cjRFWXpCYmM4WXBNSzNkTjV5SDE4WjdCRC8xOW45d3JEVWorSHU2RkpH?=
 =?utf-8?B?SzVKcFI1UkNTNFArTmNPMkJMY25VU295alRUMnlTazIvN3VxZ2JIVmFyTjB6?=
 =?utf-8?B?WjUyVXJwYmZNdU1MYUlMajF5QnJXV3Z0N0M3L09nQWpWYVQvb3lqeUpNZ2VK?=
 =?utf-8?B?di9RUDZCRXRQNjlsMWtISVJ6K0VXVlFKcGdxcWtwek5ZYjRUdEtzUEtSQnZs?=
 =?utf-8?B?eXJUQjJiTXprKzRPY2lnZFZMcXRzcThLaTdzenZ6c3BmQlFVcnZYQ0tnY0hy?=
 =?utf-8?B?cmJwQ3hJV0lMU1JsQ1JoSGd4ODFmV3ZxK296b3JCVVZOZnRock8vdzEzVnZp?=
 =?utf-8?B?YmFCVXp2YmFncHRJVmZlUEE2cmkvaG9jeCtRRVkxcC9kd3pTcExXdGhRVStD?=
 =?utf-8?B?WHE0dUw3ZGhFY0F3cjk0ZWFQUFFFT3dGVVNDRWJ1RHJBdGczSHY0QWlFV21u?=
 =?utf-8?B?ZWxqSzI1bHZMcTk2SzUxNzR1SjhHNEtUOHZvOCtyUUdvWTI3a0djdDdPKzBO?=
 =?utf-8?B?Z3pLNjZnbzZaQmdDdnlGRG9hOC8rM0xLWXpnUjd1dTI0VDRseGtFeHQ4Ty8x?=
 =?utf-8?B?azRBK1E2Ly9ZSW5PTWtSd1pFb2VYbXpFMUZkMWFTMUZtNFd2VXVpV0VKOFlN?=
 =?utf-8?B?Y1dRaVIySmtaZ3E3OVZHa2RDK1YvdzFObDN4WFdTbkIxWEU1bllpeXZvWEpW?=
 =?utf-8?B?RmY4N1duSjFIbTV2OXpySjdUeVQ1aS85QWp0eGhncVA1Um8wY1lUeUh5MDdY?=
 =?utf-8?B?TVB3TjAyTHR4RFIvS1lmQyswRnVLYzRGbGR5akpTWEVSMGUvaFFRTlh5RC9q?=
 =?utf-8?B?bURjbHdZeGRTZGxNT1ZqL1RHK2ZtSG9xV1JYblQvemg1bkdKSWVpRTQ4TXpz?=
 =?utf-8?B?YmRWbDV2OHZHbitJOHdOQ3BjM05jenZuV0JDT1hFNkRReGVDYzZBeTEvZkl1?=
 =?utf-8?B?bGJIYzdJSDU0SFZqK3Yrc0o0OW1XbDZhdFJLSkxVZGNJYVpnbGw4ZFlnWnBy?=
 =?utf-8?B?Y3NvcEoxWUd2MjhKSTE4YXhySVZnMlFpaEd3bDZVeFpTbjZjaTl3dExYcmNL?=
 =?utf-8?Q?nApwxphAAh6naK+0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <308CC24FCEAEDD4A90F2EBAA35BABD17@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a490e558-877f-4106-3ae9-08df29f699fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:25:23.1803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygM8+o3UOv9ir9KeF+PMLI2l2kPZ9mANEeByNP2l5dxP/VC24UqLXLHBfD8TeuOzuYQFtu5SqiJn0FpGHWHrmW02D0Ru9rMejIpkayvFcKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR09MB5228

SGnCoENvbm9yLA0KT24gOS8xNS8yNiAyMDoxNiwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiBN
b24sIFNlcCAxNCwgMjAyNiBhdCAwMzo1NTo1MlBNICswMjAwLCBBbGVrc2EgUGF1bm92aWMgdmlh
IEI0IFJlbGF5IHdyb3RlOg0KPj4gRnJvbTogQWxla3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92
aWNAaHRlY2dyb3VwLmNvbT4NCj4+DQo+PiBEb2N1bWVudCB0aGUgYXBsaWMgY29tcGF0aWJsZSBm
b3IgdGhlIE1JUFMgUDg3MDAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWxla3NhIFBhdW5vdmlj
IDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4NCj4+IC0tLQ0KPj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxpYy55
YW1sIHwgMSArDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9yaXNjdixhcGxpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwNCj4+IGluZGV4IDA3MTgw
NzE0NDRkMjlmYmZhMzYyODNmYzk2NjZlOGNlY2Q2Zjc3ZTcuLjliOTg2YWExYTFjNjIzMTZhMWZk
MDhmZTUzNTA3NTExMTYwMWI4MGUgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFtbA0KPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL3Jpc2N2LGFwbGljLnlhbWwNCj4+IEBAIC0yNyw2ICsyNyw3IEBAIHByb3BlcnRpZXM6DQo+
PiAgICBjb21wYXRpYmxlOg0KPj4gICAgICBpdGVtczoNCj4+ICAgICAgICAtIGVudW06DQo+PiAr
ICAgICAgICAgIC0gZ2YsbWlwcy1wODcwMC1hcGxpYw0KPiBJJ20gYWxzbyBjdXJpb3VzIGFib3V0
IHdoeSAibWlwcyIgYXBwZWFycyBoZXJlLiBJc24ndCBwODcwMC1hcGxpYw0KPiBzcGVjaWZpYyBl
bm91Z2g/DQpVc2luZyBtaXBzLXA4NzAwIGFzIHRoZSBwcm9kdWN0IG5hbWUgaXMgc29tZXRoaW5n
IHdlIGRlY2lkZWQgb24gYmVmb3JlIHNlbmRpbmcgdGhlIHNlcmllcy7CoA0KSSdtIHN1cmUgSSBj
b3VsZCBkcm9wIHRoaXMgaW4gYSBmdXR1cmUgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIGlmIHJlcXVp
cmVkLA0KYWx0aG91Z2ggSSdkIGhhdmUgdG8gYXNrIGFyb3VuZC7CoA0KDQpCZXN0IHJlZ2FyZHMs
DQpBbGVrc2E=
