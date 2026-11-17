Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920425;
	b=VcqD6i6MFoQ0ynXOin8+O7JpNitcJRUV2Kp6g7ovTmW8pfSpM0Z0yUePYgyiz8QrCF74
	 eWg5ZpSew4UnGTvvHuC8JSsCXQv614dm2C6fdZ06K7XzXIRxYYLgJJMkc6evCTJj75sIQ
	 xxVyFWSlJXJpYHw4UJ6nEUpIDAcYmGFs2ZdueKMeB09Z7BPBWviQhAt4ABgVrrC7Vfglg
	 B/qjut/tMMsDrTSg85if2VdlIp7TZk12Dyk2VTyJPWvBiBAL5yxWXGo81j+VQstfl0cR5
	 /lzrRam3BdHEzsjDsZoNaBpk5Cyqw+/I3qXlLMThYzq+TgMsw6zVbM7iadX/Ruxs6pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920425;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QmIN8n1XecwxbyxK1cefKfliRbJw9lqgRthQBlPGOJY=;
	b=LRC9nxd9dX5RCxkGo3tWp36QV8HuK4XHUR6XMTkfvG6hA2sOmP/qv5SC/RCJAQ2Ll6dm
	 eSYJbruGYIeCmHvo2rURO1yYMv03fURxqvrFHOnAYLami51IvaqED8Ek+jg8fy1pDsUIB
	 0JwBypBXDfwwL/affyaHVIGqMsq69JKMd9n5903lOhI66p20FetI3PdnZreHXXLbb2EKN
	 B1zmHGFgIAcwbidE4mGzIgrAheY3VSK+YFFj+49PfLknOPEM3zEqADt6nhD1kmbZIy3Vb
	 biUfVe3FyvXBh3NC6+HNNOYv2lO30DGDp/J4CDGbytfewSvvF0qgvH+GP5Odhu9udag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b="UF6/MGst";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.31
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011031.outbound.protection.outlook.com [52.103.43.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B779606A898;
	Tue, 17 Nov 2026 13:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B779606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=UF6/MGst
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPuKB2zPVUGYWFmhjbvxyN2GmVZ5wltyku3F2SEQC4aNN8LndeVZxbxp15AmFY+AIQa6y6fLiBQVNuIJ0+9LILLDE35l3iF3vuhdFGNRRz4acUpqJ6OAOZ3hD3pQi527pl1dR8CECNQSY0io2p40Dm5VxNg+HWR4u6MwjUzp1dH+BtguqTH5QMBoS++MPysE5IC3VvZDa486+Ikg8Ol8W/ab+iCQSNbHL800bRpQTtAJosRpmqMcxH1+g2Wq+Jr5m2D74jpz2M5xk/UZrScBJZVdZKg6leIYGKMjUWIaHUCMQV5QvvnWp6lnl07dGj+VzGAkZTCfoFRO5F+axmm48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmIN8n1XecwxbyxK1cefKfliRbJw9lqgRthQBlPGOJY=;
 b=q0aqwiihFUNSN9n7Oxx7ZJD8tOCoR6W35OxPUrppNsdxuM+Zd+dMbNiJgWabzhZsRiUSSQlEC01PIwdyQAhr7+JdM7ysOR0GoySw4SE2/tq2jDOjlkEsxbWuz8m+dzdwJ8zk/1j9A3nMEnhBzd3M/l0/nRysbNeRSd2Cp79P638XrP5wsmfdSL0kx100zg7wIIayvCP/7bbEz6RbPW0rU5Thu9b2Ny4KuIMWNDWTvFsnZivDPZEPe6tlSfZEGmBTrmm7z82bW6+jIp1E+QIKPIqGNnV0K2CiBCsfSXjN08xoZ4VStnBccNEW3bYZXAg6K0tRpY6nWEJg3yRRv7BqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmIN8n1XecwxbyxK1cefKfliRbJw9lqgRthQBlPGOJY=;
 b=UF6/MGstST5IHCkP+5AoQ1UHG/TIlL64xnKI+Xr9z080rwF4be3PDrGNdZqi9/8LCKYJEC3jPV0KmEyQyp60iQUrCrSBje72gT/cXPN4TC910GB2oP4ziXcCEIjOX1cgrF3NEsHXYoDV7aKOuaVJd0c15j8+LvcPHccNRLdxz5fA/bhJRTiq6No2jvib4DFjARQZY9CQEux8wmkQT+tpJdSMqu2DCG5hL+CHQiSubbVOHlUrJNfmK0egOYnoYH8jM+rq/9I/144eo0BlX/H/xVfGKrbKZblS8HciEUvmzsSg/NBMvb280IQw2RlVotL8A4DPSzE9+fmBiHBDveB9Aw==
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 (2603:1096:604:388::11) by OSCPR01MB16379.jpnprd01.prod.outlook.com
 (2603:1096:604:342::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:00:20 +0000
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b]) by OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:00:20 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sven Peter
	<sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] usb: roles: wait for callbacks on unregister
Thread-Topic: [PATCH v2 2/2] usb: roles: wait for callbacks on unregister
Thread-Index: AQHddpOZCyJ8F7HkFU+G5HNwHkWRCA==
Date: Tue, 17 Nov 2026 13:00:20 +0000
Message-ID: <20261117125825.27629-3-tkdkei@outlook.jp>
References: <20261117125825.27629-1-tkdkei@outlook.jp>
In-Reply-To: <20261117125825.27629-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14363:EE_|OSCPR01MB16379:EE_
x-ms-office365-filtering-correlation-id: 40c3309f-5759-46e1-9ad7-08df44aabc34
x-ms-exchange-slblob-mailprops:
 JXe7TI5Vt+wYF1Du72KGLTOOts9Bq9cVRsiXPfSMudT1ZWaCmattNZzAx7sbcPtZ+olRx75+zNfhn5P887Uh2tiTiHNLhpkD145H+9KfHdXgUfMOtol0f6cUk4cXRT/fQaYtKL9ARQ6dQulF6USwS4qE4HibJ0Arafjz0yrdshMgCriCwr4NM8VCuT6u7swvPWLnCc1c8gl0mDXPjS9b8rgOOD2cPOcAuzxtaHcOcg+FJSYy/9ZHgnGRl/jUealovee/XbapBX3T3NiYwC54rJQTp135XjLVtQUcyJ1ddibzLZgU9hzAEIUxp9WcxvXEkHONq2yvHqfsCfFRsnuaZdPrIUKjI1He57xCfe9DEn2OMj2tkPl+g2JfT4UF7rk6ExqaGMduHu4sAAKzv4EJpNquwGndrxeM0IihGCZDXi0mZg09l3fgceug87DZteTB7+fMXHDLtX4mxT8YLVzs0mp8davfc1wigAWG09hzJRGROzfZXGU7peHNefy6YFdNLaj6AVaW04XbVLyYw63RjFoevsWXDQSjbp44ygSQVKDYnq0MVtGXef0bH8w7aFexxWTXMV4iiy83/JMPQk7a5mxxe1A6X6VPvPIugUs4LmWqROPLu+CfgbfgAV5wt5NTcEqYmEVkNHrFHZxcMGfAuIep7CeTnZd5ND/Ht6mH57Zj9u2VfX6/YSNYbgq4OjD0HBtooaSfRXNTRidRr5PuecZaueFpP+WiU/8oWHcwXiw=
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|15080799012|25031999004|31061999003|24021099003|25010399006|41001999006|8062599012|51005399006|12121999013|8060799015|19110799012|440099028|3412199025|26104999009|102099032|40105399003|12091999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2tBWTJLa3lnZlZRUmhaWnI2WTEzUFNKU3U4bUNmc0V0SmxzUDV0N2tzWnhx?=
 =?utf-8?B?SXZ3Q0gzckhESVJ4enFDTloyTnV5azJNamJGWHpEOUpYN0E0NFNCY09RenlJ?=
 =?utf-8?B?Nk1Bc0p2WjZ6SnlwL3RreTVMS2JGbWVYRmM1RDNNaFlYS2xvRERuR2F0NzUz?=
 =?utf-8?B?YjNxUjZ6UHpMSlk4Z3h5T2RJTGx5bysyd2N1am56RE5vODc1Y25Cb1ByOW0w?=
 =?utf-8?B?MEFIL2dITXNZVTE1WHBNQXBkK2l3ZE9iVXZMa0JBRThMVy81ckxZRDM1YUFL?=
 =?utf-8?B?Tjl0L0xRVGFJRUlReEpOTkZTMDlTT2hBa1FRcDJhUnBFUDBpK09ScFlNS1pF?=
 =?utf-8?B?U1VLUUcwSnVsRU4wSHgyN2pOZkEzV3BGQXZkdERFYTFScjlYZnJDckp3YXZx?=
 =?utf-8?B?SmlJQ1dkY3BwTDNMTkUyaTh5V2srcWd3YlV3azM4TnhSaUxRaWFYQnl6K084?=
 =?utf-8?B?MXJqbTFxSmd6c2lvTDQ2WGR2RmVMa3BWUGlObkwvK1FVb09pemxObVBRTEl6?=
 =?utf-8?B?TEtybU1lV2xSM3FDRkptUWdhRm02cGFmZkhRTkdmNVM4M3dzcmIzcm5lMVNa?=
 =?utf-8?B?RHpyTmw3dGdMTGkzNlRua1o3Rnp1OVR3YzRReDk2MWdUNmVQd3Z4VGd3dmk2?=
 =?utf-8?B?L3ljTi9jNWh0QVkyRmJ5UjZ6ZDRKTUM5QitIS2s2azFNbGxIWWxZaXp3R2li?=
 =?utf-8?B?cU1nZjRRaHFoUmwxRVhEUUVseDVDbllhdjRSL00zc2ZCemE4MFZ6SGhBZ3RT?=
 =?utf-8?B?SExyTmhkdVFUQUFDeFhST0F0WllBTWx4Mk5CeC8vRy80aGJESkM1dFBsM3U4?=
 =?utf-8?B?a05MNTUyN1dUZmdWSDF3VWFLd1Rkbkt3UEk0UEhxS0x0NmtMbFgvWlZJVXhl?=
 =?utf-8?B?enZwVjQvOHZQRFhocXk1clU5ZmFLRCs0czA3NklyVDQwek5RSnVCUVZvZ2FV?=
 =?utf-8?B?a1JtM2w4THV6N2hBc094Ykw1SkxBdUp5U05qRi9uKzBrd0N1VmhHR2RTTGhL?=
 =?utf-8?B?K01KdXBvSkQzL0ZVS2czYmdzYmUrc2dUaUVQRmJGdkYvdWJCV1NsNkwwWjFF?=
 =?utf-8?B?dDRMdXowbGRxVFJZN2ZoYU56TXJtRTMwWEd3UnFQVG5RU0JzMlFvb1ZBWUp6?=
 =?utf-8?B?YmhwV0FRdzB2VEloVXZWQ0I3WTBIWWNIbFJhdjdsdkJZdzBKaGlDZHRBVTJI?=
 =?utf-8?B?NDc5T1NWSmhSNVVRaU1DZXNQZ2dZZ0Jmazgwdm9TbVhuaS94eFFEOHVSV05N?=
 =?utf-8?B?R0dLZjdoMTRlcXMwUUVFa1ZxQ01EaytEcVNoZ3Y4SndIVm01UENlN3AwVTZX?=
 =?utf-8?B?bmtJR3dFRDZtdXc4SkpsZTlVb1JRVi9nT2x4Rmp5SEp6ZWJBMmo1STNMSGlF?=
 =?utf-8?B?MkQ4M2hvOGUzY2N0d2UrUlpLbUVTM2p0MUFVT1Y2a1o3Sy9LL0JkSWNrZDRJ?=
 =?utf-8?B?SGNyVDIwdWVGekhPWTBXWktKSDVFdWY2d3k1Tlk3bE1iL0xkVmdNdkwwQ1Z6?=
 =?utf-8?Q?e2unzs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnRVTzV6NzFpTXBMYlFuT1dYWDVUTmlQUGs5L1NMc2lONFJqREhRU1JWV3dj?=
 =?utf-8?B?NUM2dVVoSzhyNzg5UUQxNUZsOC9NNXUrSXlnMjFnUDFweEI2U1NEOXdQTjZu?=
 =?utf-8?B?S25DcUZ3aHVUOUJQWHYyckNjTmxDNFl6eFd5aE1vVkJacXR4ekpGanFFaGJR?=
 =?utf-8?B?NkpiaUU0REs5SzZ0NGZ3SFJtOUcyN1JMMmFLb0hOMnZUWmRGcDNFcG1ueUs3?=
 =?utf-8?B?TzNsVUJZZWk2cENabWU0Y3JLQWVrNU1vZE1uU0RkczVMZGVTVGxsZUhQdDFa?=
 =?utf-8?B?YndSQWRTTTdaRUtuMVpmdUZTRTlrUmN2aUtYdFFQTWRXT1RNYWpZZEFTcXVS?=
 =?utf-8?B?dnA2OGhiRUlqTCtoTlo5WDl2WFF0ZHNIM0ZtaXhEZytaVExhTEFvN2JTNlVS?=
 =?utf-8?B?bWJVVDRlVElvR2dBcllqRGNDU0FBMUFycGlucWU0aEtJdkVBd1dJc01ETk54?=
 =?utf-8?B?VFlrbkdoZU5WSXR3RUpIcE1uWWY4MjZ5amlvZWhzR2Q3eERVbXRubUFqQUl2?=
 =?utf-8?B?UllMTUQ4NUxjZ2V0b3k3NFNIZmJ3TnJtR2lkb3ZrYitIc3ROTWU4dlJvWG9T?=
 =?utf-8?B?VjBkMjI2VnZlWm1pdEd1MUxUemNkcUJFMFBrK1hYdzg4TzIxZ3MrSFlDUDFC?=
 =?utf-8?B?SEp1Zzd3RnRIRmxpN3J6azVERE01Ukt3S2VaT1Q4cmZud0hKdkw1K0dUTzho?=
 =?utf-8?B?N0NzV3ltVFdUMUQ0RS90Sk5mZzlEVHI4TnlTU2YwTkoxWWl1ZG9BeU1JSysy?=
 =?utf-8?B?Wjl1WFR5QVVKVlVWZ1o4OGlIelI1UWFPNER4U0ZNbkttU2kvNExQdXovZmFW?=
 =?utf-8?B?cXdWdEM0K0NoYnFRb3NGVWF4YzZtQm1ta004eXd5aitpTzZZbjF2NnJnMWl3?=
 =?utf-8?B?MHFNeUtHZ2gyZXpZNDI0UXdhdkplVmlWb2V3a25wNXNtckM4eDd2eWc2djJY?=
 =?utf-8?B?M2l5emxKQ3dUTHFnZVNSSUU1cVpnMk5xTm04eGhldWlDK1JzZU5DRXA4RVJ4?=
 =?utf-8?B?VDlMSnBaVVQ2RUY4MHRPZ0VDY2d1WGdOOXVGSnNRYnlYSHM3czZDbHl6UFlD?=
 =?utf-8?B?STZ5end5MXgySDFPQVlBZGZuOWtWK1VGWTVKQ1JsN0ZMWUlUWXpsSXFJUEow?=
 =?utf-8?B?ekRGT0oyNStLN1paUjZ6eDRIMkY1OHJtZjNGUzJtcTEvSHdHSi8rNUU1SGhV?=
 =?utf-8?B?c2NNeUhyUmt4WmhtR0pTeTBlZC9nQXRPam5aN2ZaOXhqdGVwdG52Nld2Qm9v?=
 =?utf-8?B?WTlZdGphejRaL3gvMG1RV1IrMjJNbkRXdTJwOERxb3dWeWdRVy9ab3c5RERB?=
 =?utf-8?B?eGIzU21heFBLelBZUnpKU3lFV0djU3VvSTRuSWNCK2tvay9GY2ZGSHBhYlFo?=
 =?utf-8?B?TkYreXNyeWhsM3U0U0k0YzBLam1kV0JCSXYrbzhsV2QxajdqdzZSMkRxS1ps?=
 =?utf-8?B?QlAwU09DQ252eWRRSnh1czRkNFBRYUVEUG5RbVlybjV5eTJnbWRtZDJ0dlUr?=
 =?utf-8?B?UWV5ZUxQdmFIbGVFSjdFMXJIVitlZ01Ud2dCcSt0R3hOR3liYjZtZG1ZTXl5?=
 =?utf-8?B?bjVlcWcwRGlqekVid2Y1NmhaMkRWbkpNQmg1YTVkVTFUU2tyNTRHS3JHRUVB?=
 =?utf-8?B?akFGRGM0TXJsQjMwYjFmYmkzcHFCZUxjeHdCSHViZ2JmQ0IxdWlUYlNiaUkw?=
 =?utf-8?B?dFNrVlFnYUpJMGh0ZlhOY3lnSGVzc2FzbWFaZDlMQVF4T0s0MnRpcW1HTk5O?=
 =?utf-8?B?ZDZXOGJBbUl0aU1hcXNJNTRuWGpwRzNVSjBrYU5TVjFWbndKUDBCOC9pdEx1?=
 =?utf-8?Q?6cf3Y76kHB4n0bFvr5uQgblVsDFHCpit/sTOE=3D?=
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
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14363.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c3309f-5759-46e1-9ad7-08df44aabc34
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 13:00:20.1636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16379

dXNiX3JvbGVfc3dpdGNoX3NldF9yb2xlKCkgYW5kIHVzYl9yb2xlX3N3aXRjaF9nZXRfcm9sZSgp
IGNoZWNrIHRoZQpyZWdpc3RlcmVkIGZsYWcgYmVmb3JlIHRha2luZyB0aGUgc3dpdGNoIGxvY2su
IElmIGEgcHJvdmlkZXIgaXMKdW5yZWdpc3RlcmVkIGR1cmluZyBhIHJvbGUgcmVxdWVzdCwgdW5y
ZWdpc3RlciBjYW4gcmV0dXJuIHdoaWxlIGl0cwpjYWxsYmFjayBpcyBzdGlsbCBydW5uaW5nLiBU
aGUgcHJvdmlkZXIgbWF5IHRoZW4gZnJlZSBtZW1vcnkgdXNlZCBieQp0aGUgY2FsbGJhY2ssIGNh
dXNpbmcgYSB1c2UtYWZ0ZXItZnJlZS4gQSBjYWxsZXIgdGhhdCBwYXNzZWQgdGhlIGNoZWNrCmNh
biBhbHNvIGVudGVyIGEgY2FsbGJhY2sgYWZ0ZXIgdW5yZWdpc3RlciByZXR1cm5zLgoKTW92ZSB0
aGUgcmVnaXN0ZXJlZCBjaGVja3MgdW5kZXIgdGhlIHN3aXRjaCBsb2NrIGFuZCBjbGVhciB0aGUg
ZmxhZyB3aGlsZQpob2xkaW5nIHRoZSBzYW1lIGxvY2sgb24gdW5yZWdpc3Rlci4gVGhpcyB3YWl0
cyBmb3IgYWN0aXZlIGNhbGxiYWNrcyBhbmQKcmVqZWN0cyBjYWxsZXJzIHRoYXQgYWNxdWlyZSB0
aGUgbG9jayBhZnRlciB0aGUgZmxhZyBpcyBjbGVhcmVkLiBUaGUKcHJlY2VkaW5nIEFwcGxlIERX
QzMgY2hhbmdlIGF2b2lkcyBhIGxvY2sgaW52ZXJzaW9uIGluIGl0cyByZW1vdmUgcGF0aC4KCkZp
eGVzOiBmZGUwYWE2YzE3NWEgKCJ1c2I6IGNvbW1vbjogU21hbGwgY2xhc3MgZm9yIFVTQiByb2xl
IHN3aXRjaGVzIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogS2Vp
c3VrZSBUc3VrdWRhIDx0a2RrZWlAb3V0bG9vay5qcD4KLS0tCiBkcml2ZXJzL3VzYi9yb2xlcy9j
bGFzcy5jIHwgMTggKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9yb2xlcy9j
bGFzcy5jIGIvZHJpdmVycy91c2Ivcm9sZXMvY2xhc3MuYwotLS0gYS9kcml2ZXJzL3VzYi9yb2xl
cy9jbGFzcy5jCisrKyBiL2RyaXZlcnMvdXNiL3JvbGVzL2NsYXNzLmMKQEAgLTc5LDEwICs3OSwx
MSBAQAogCWlmIChJU19FUlJfT1JfTlVMTChzdykpCiAJCXJldHVybiAwOwogCi0JaWYgKCFzdy0+
cmVnaXN0ZXJlZCkKLQkJcmV0dXJuIC1FT1BOT1RTVVBQOwotCiAJbXV0ZXhfbG9jaygmc3ctPmxv
Y2spOworCWlmICghc3ctPnJlZ2lzdGVyZWQpIHsKKwkJcmV0ID0gLUVPUE5PVFNVUFA7CisJCWdv
dG8gdW5sb2NrOworCX0KIAogCXJldCA9IHN3LT5zZXQoc3csIHJvbGUpOwogCWlmICghcmV0KSB7
CkBAIC05MCw2ICs5MSw3IEBACiAJCWtvYmplY3RfdWV2ZW50KCZzdy0+ZGV2LmtvYmosIEtPQkpf
Q0hBTkdFKTsKIAl9CiAKK3VubG9jazoKIAltdXRleF91bmxvY2soJnN3LT5sb2NrKTsKIAogCXJl
dHVybiByZXQ7CkBAIC0xMDcsMTYgKzEwOSwyMSBAQAogewogCWVudW0gdXNiX3JvbGUgcm9sZTsK
IAotCWlmIChJU19FUlJfT1JfTlVMTChzdykgfHwgIXN3LT5yZWdpc3RlcmVkKQorCWlmIChJU19F
UlJfT1JfTlVMTChzdykpCiAJCXJldHVybiBVU0JfUk9MRV9OT05FOwogCiAJbXV0ZXhfbG9jaygm
c3ctPmxvY2spOworCWlmICghc3ctPnJlZ2lzdGVyZWQpIHsKKwkJcm9sZSA9IFVTQl9ST0xFX05P
TkU7CisJCWdvdG8gdW5sb2NrOworCX0KIAogCWlmIChzdy0+Z2V0KQogCQlyb2xlID0gc3ctPmdl
dChzdyk7CiAJZWxzZQogCQlyb2xlID0gc3ctPnJvbGU7CiAKK3VubG9jazoKIAltdXRleF91bmxv
Y2soJnN3LT5sb2NrKTsKIAogCXJldHVybiByb2xlOwpAQCAtNDIzLDcgKzQzMCwxMCBAQAogewog
CWlmIChJU19FUlJfT1JfTlVMTChzdykpCiAJCXJldHVybjsKKwkvKiBXYWl0IGZvciBpbi1mbGln
aHQgc2V0L2dldCBjYWxsYmFja3MgYmVmb3JlIHVucmVnaXN0ZXJpbmcuICovCisJbXV0ZXhfbG9j
aygmc3ctPmxvY2spOwogCXN3LT5yZWdpc3RlcmVkID0gZmFsc2U7CisJbXV0ZXhfdW5sb2NrKCZz
dy0+bG9jayk7CiAJaWYgKGRldl9md25vZGUoJnN3LT5kZXYpKQogCQljb21wb25lbnRfZGVsKCZz
dy0+ZGV2LCAmY29ubmVjdG9yX29wcyk7CiAJZGV2aWNlX3VucmVnaXN0ZXIoJnN3LT5kZXYpOwo=
