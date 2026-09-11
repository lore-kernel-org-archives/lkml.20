Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB63346E5E;
	Fri, 11 Sep 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116814; cv=fail; b=QzKxqzc4BQUOYAmXTRWS+npq7ane/VrF806t6XVo88kSyg0OS0wQoKabNTs69OH4dlASFR8cXOyy5FPxG+6tpoMXtll/sylG3sGxi63g5sYrSvAAQbIXr5LLji4jZirDxDONuyf1EEtIBwE4dcilhWEkuHPnshm/G2pZX9yCKVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116814; c=relaxed/simple;
	bh=QKNYrYlc0/W/NwL+DCJ7Eb/EjzpSBaIAzZlcyJIQuiI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=soUdTZHSZ+GDC9pnCYpxHwG+SaBm/ZDHU1n69OMjdK1ps9Qte1FpakViNFm4oqHIGXc+48EMAD/2MTbphAqK4fc/niTLmX80HMlda7SNPdJOyrV1zdtPmApJpD48a99nW14MLYfv7QQD+EDaPRFDE5cNsLfJWolnF6DybG7tXdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TrrcH7uJ; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TrrcH7uJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRhKSAGitRCkaWavdX4QW2XF6Mmq99xXmy4vlyIATVVFQB0r68hpd33Vl39XOVhPKsDnXgd9yNZQhN4zwU3MekOYARAk4d78WYLUjT07Jzd4SIQY6h00D/WO7Ub/zvsJ7Aj6+/QEf5+9TRp53CsCztOwMmiFLRFJqbBDEpnuct2L3CyNI+++nriJUzN7mw1sl2HayQ18r/kNpzm02eOFW6DFeQQbh+FHIblgIPI/p1U6hDR2tjpvyVhiiZrMsoKiNyAv+7/6w6WxhoIjouJtAnb+fxjoo282Yf+rpL1YP0zGIlnGmwWJHFjiP5mE+fI9lvCZWU/Xt7Y7NV36vKeutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKNYrYlc0/W/NwL+DCJ7Eb/EjzpSBaIAzZlcyJIQuiI=;
 b=OVHx4CYzIqI4k805t6Gxnpjh5iA/M+VCBCiRYFs7aYLNfsdBow0qiv4I98sxR4u4C0uO5r5oiJd82SrfM5T2bRQVRLNfL511MU+cuWIlyQGIBUeEbHehZN5SHz8iBPgDDeXmkHfF7IKQ9nF21oVD6d+cDrF8GiKpQdNLIpz421vdXzXBQ0G5JwwTpoebV6oK+BFLdTtKtqbHvmorgZdyLOsmpwRmyiZEe/qRxbn4cdsSbe3P0C7doSmaAoZmRxj0TbdAgeP1SUNB/++63a+8Hc8Mw8e/RmNinYiKHAK2D50n2YooeXUPMK3Yh28hfdMHmKwRJLKcIhO5PGgMb9dkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKNYrYlc0/W/NwL+DCJ7Eb/EjzpSBaIAzZlcyJIQuiI=;
 b=TrrcH7uJRcaLCRIkR4ltVd+ewVHzpcGAnM+rm3ZfzW98va8dZKhqhu5c+V0jrf3+kiqFSKHKVpuc0QSlzDe0K0aJdWxYq/1MhOdVX+1TuYqrwcL/flNaj9QDWLDPIFFqBcqw999e6Gk473rUX04d7NdYRMsQFuXTIRXXZ20qAdQ=
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com (2603:1096:604:33c::9)
 by TY4PR01MB14105.jpnprd01.prod.outlook.com (2603:1096:405:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:53:29 +0000
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f]) by OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:53:29 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Thread-Topic: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Thread-Index: AQHc7bHEbYJcH2gIpUSGMd2mOS/OZrbE4BKAgATTOyA=
Date: Fri, 11 Sep 2026 08:53:29 +0000
Message-ID:
 <OSCPR01MB1276930A2DEB5BB5B5EE29932D3BE2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
 <hpjrkv3bpbx4rfz2v6bumntiw5k36etktnv4bvxs2dhuv5wr3x@m4estpjcreo3>
In-Reply-To: <hpjrkv3bpbx4rfz2v6bumntiw5k36etktnv4bvxs2dhuv5wr3x@m4estpjcreo3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB12769:EE_|TY4PR01MB14105:EE_
x-ms-office365-filtering-correlation-id: dffb268c-9298-4660-2701-08df0fe2269f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|56012099006|11063799006|6133799003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 R8XgIfW9egkc8THTU1Yhp26ARzNm0uvQ8y7IM3T8uydGUwWsqJe707HKEnHoA+R548jlbnRz1kgxktHeUtQNUUg+wipForIGyjvYBVo9tZ/QcPTtEfxtyr1F32Rrw6hqO0fwhda14MuzF1GGcXQOwfDdaQFy/QkQ7y5KS4C3NhJceZEF9ZxdUy5hZejQWPfn1UjmsXhFRwCxYPVye1on6MyWQqUqf5d7JSvLN0qjFCPwXQyu8WK83pMkj7G9lsIBJ9k6nUccXJ9yVJAEQPJCV8p0ZQ1lqIYqcWBLB0fojrZWjf3Sq0nnSQZMwFU2pASeHnQdtFI7nFAWM7PjDTIdFEZgflxuyKfcf4YsvqENRZ1kZryFOV3iQ0z5cO2hU/9QDbLm79q/vSzjCCh21bBgvXt2pSkugbCG2nIyffAbRiubcqChX9P+V+O7q0NdFWdwzBhfzi9eeBs0FglduzK8kTUWF0rR6y/VorI509GOmvUK/hD/egnr4Hkihk+Ncsh1dCexq4b9tPleWJExMlNdnBrQzZmQ09sVcWmCWOHRc4Xbn01PT+YXH820ymLCbAe35XI9feVS+vBh0rW0wUhhOM+Zz6M0VB0NtNVJlT0Tplhxf1HIeBODVC4uoSjTG3G9nZWh+jWzoYaaJvjcNIb6Ka0s3hunoFlid0Pz2EMehZFC96Rn5QTWi6Susc+Zq7+PSCLf07ouiXTKCmohQRJChVC9WSKehVntiyoDGP01JpE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB12769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(56012099006)(11063799006)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tksvb0I3aHhBUzhIUE9xcG5sTjNWUEw4Y0hRK2xvdmNxU1BvMVRqN1lZYUhq?=
 =?utf-8?B?bGoyNHpkZGNWVlBrMzNlZmN5VkZLZ2RuRm5PZEFDOWRFLzlLTDJ6ek1BK2VJ?=
 =?utf-8?B?UVQ2d3JoMU1BOXVEYjZDbVI0NmxyNG5tay9XY2tRa2tISURicFNqMFQxS1RR?=
 =?utf-8?B?eWQ2OTNpT2ZmMGJ5aWJFQWpUdVVxYjRTc2tMOTJJYlBlTjJtLzBSd1dhRU94?=
 =?utf-8?B?WFBnZ0Q0NHZWYzY5QjBXYjZ1MVhtM2lvRkkyLzJzWXc1dGJYY3pvRVJ6a1VX?=
 =?utf-8?B?Y1NQM3QrS05MOTBDUWcrUlp0cmdaQ0Z3dW93SWJqelEyK3U0Z3FmcThlNnBo?=
 =?utf-8?B?Vks1UmJheHVlcm5VN0NVdEpnRFdhSUdrS3ZLQjlrQ25qMUgrMkRXNnhTcEE3?=
 =?utf-8?B?TGo4ZEFLWkZxeWlkZElqZEhQcVNGOGlTcXU4Vmt4MDMxcDVMZXVnams4dTQ1?=
 =?utf-8?B?UEY2YXlxY01uT0pQU09oTnBTQzVoYlBuNXd4MUM0NHZhNlNqRmVZaTBLbUpE?=
 =?utf-8?B?b2dDMGpDU1h6UWsva2J1WWsvaVdqNXo4eFV6dTNCMmdLUjJSaktSc3Q1U3Zq?=
 =?utf-8?B?a3huM08xaGdRUmVXRzR1NEQ5dmNCNGJpelRYRW9xMkFGRlBSY3FJTzVhL0JM?=
 =?utf-8?B?UUZjbjRMcDdNU05FWjVid3NnNWt3RTNJMk1xMm5mRDlYc0hFUE5sdVZPSzJV?=
 =?utf-8?B?MEJsMTZqWWF3QnAxRlJMTXZyUFYvdURWS055RWFreURybU5GdWlGMHFhRndh?=
 =?utf-8?B?bEVKTlRlTGpoaFhsUWpTcFNPR3pyZHFJNk0zWGZqR0pKUHJuMmV6VlFrSEti?=
 =?utf-8?B?S0hRUzlMY3V3MStQQjl4TTE5WXZkS251TEdMNHFVRDFvanY0ZHV5QldFNWo3?=
 =?utf-8?B?TjFweVZXcERsWFozSEVIQnQ5NDNMa2tOQThuRU1QU3NsakZKSmVvZDhRak1D?=
 =?utf-8?B?RFMvbGJjbVJzZ1kwcU4yTDZiWnF0d2V6dk85U2h2bFpnVzN4L3JoM0gxNWhM?=
 =?utf-8?B?Z3pzQnU4ZXlWQlhRVENGUm8zN2tBcU4rMDlVbkZGaW1vM0JPM0Vpdk5SeUZn?=
 =?utf-8?B?WjdYVExWcW1DbGpEeXhOQm4wb01FL3AzTkQxWi8vc0hDc3gxQXdiK3JQdldV?=
 =?utf-8?B?djh5QWNzbk9LNXpLcmhWWW82a2xHQXJGWHlLN1h6a2J0LzJiUjJCVnpGOHlv?=
 =?utf-8?B?RzNOMC9xNnQzbXlQZ2Mrb0I5Z3BiVCtBa3JMaEJiZDVseGZmWWE5TGovcXlC?=
 =?utf-8?B?Q0k1d0d4enpZZnh4M3ZNOWNXT1ZIUzJIcmg0MGRHOW85aTh3QWYxbWs5YmFG?=
 =?utf-8?B?VzZQUVpwR0pCazJKUkZsUTJhOW1YMmNEQk5NbjBZVHFJYllQeUZNUWVKUE93?=
 =?utf-8?B?YU9MclZ4QjZNZ2FpajFqQmw2NzFqRlZQYjR0VVZnVVlSQUtNbE9YTHp6YXNJ?=
 =?utf-8?B?ano2a0F0eDRPZzhzdzJxRjFiR1c0QTFBeCtTNlpscVZ4ODNmdnhCK3NCNkds?=
 =?utf-8?B?U2FvbUJpODRaSnFuK2VQOXJRTEVTb3E5RVNUaHMxZVZMOEllTHR4QzJ4OEhZ?=
 =?utf-8?B?YjVCNm0reTMrZDFJTWJGeUtMRnc0QUF5NmlFaVFlRHNtRUVQL1drQXNqQ0VL?=
 =?utf-8?B?b3FmN0ZSQzZXT3Q2clluTkRVSTY5UVhBdEY4ckJERDNaZnZpZU5zTkRLUXlL?=
 =?utf-8?B?ZVllREVoVlpWSllITUQwWGhkY3FBWWJhOHhZN2daZ2lqN09uK3NUYUY1YWNX?=
 =?utf-8?B?TDRicmxIajhFZVUwdFgwR1oxcnk4VjZob3l3RzlTZDFWRVRXSDgyNDFCZm1L?=
 =?utf-8?B?aW1BbDVabktmR2RiL0QxTC9LYmxRV3F4ZkZDZ1MvUjBzc2k3UTVkQ3JTSkNX?=
 =?utf-8?B?ZXdOV0FMNnY2K0V3RWliYTRBM0ZqQlFGT1NVaGtNWDlpZ1kzV0ZZOWpsY040?=
 =?utf-8?B?dUl1Ukh1ekI1V21zY2N5YjFTVEJPYmd6ZEdUdC92bW1zN0lOaTF6QVFEUkVH?=
 =?utf-8?B?akVRZXVaaVpCOXVyd1NURTRFZ3k3RVVjdDgvUU4yK0VKNzhxOTErcmdBTkpz?=
 =?utf-8?B?NlZXQ2ROVVU1LzAySmpXcGFraWtYM2xRZWpRemZXVVBndFdzZ1ZHVTJPM0Jy?=
 =?utf-8?B?T3lON1FtNXZ3M21ZMlErT1ZTT2NENnZiK3NsVDRJRERZOWw4SzZVWktxK1B4?=
 =?utf-8?B?Z2RleTBUYWJaQlhqUmhtZXlHdlFxQWoycS8vYldYeXhROTJoNHlpUERjQlMr?=
 =?utf-8?B?b3JkaXZER2hzYjFleGlXT094dWl0dzhUVWJpU245Q0Rjb3E4LysremxoSVlP?=
 =?utf-8?B?TmVJTzIyYlh0MlEwV1JhdnNEcmZGRk9qa1owUWMxM0RsZEI3di85UjBSNW1h?=
 =?utf-8?Q?SLjg0ijjCp4JIUag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB12769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffb268c-9298-4660-2701-08df0fe2269f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 08:53:29.4811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeZI2a64dEGqpaObR8TSZ6LOJIGXsO/dYma4xbGx9lMxeN8tsUttEAWLXhy/RaA9s1nIzCJJeas2pBLWcvTEG14QC31sWzCF5hI1GVNX9/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14105

SGkgTWFuaXZhbm5hbiwNCg0KPiANCj4gT24gV2VkLCBNYXkgMjcsIDIwMjYgYXQgMDg6MjA6NTJB
TSArMDAwMCwgT3ZpZGl1IFBhbmFpdCB3cm90ZToNCj4gPiBPbiB0aGUgUmVuZXNhcyBSWi9WMkgg
cGxhdGZvcm0sIGlmIHRoZSB4aGNpIGRyaXZlciBpcyB1bmJvdW5kIGFuZCB0aGUNCj4gPiBzeXN0
ZW0gaXMgc3VzcGVuZGVkIGFmdGVyd2FyZHMsIGEgUE0gdW5kZXJmbG93IGVycm9yIHdpbGwgb2Nj
dXI6DQo+ID4NCj4gPiAgIyBlY2hvIDE1ODUwMDAwLnVzYiA+IC9zeXMvYnVzL3BsYXRmb3JtL2Ry
aXZlcnMveGhjaS1yZW5lc2FzLWhjZC91bmJpbmQNCj4gPiAgIyBzeXN0ZW1jdGwgc3VzcGVuZA0K
PiA+ICAxNTg3MDAwMC51c2ItcGh5OiBQTTogZHBtX3J1bl9jYWxsYmFjaygpOiBnZW5wZF9yZXN1
bWVfbm9pcnEgcmV0dXJucyAtDQo+IDEzDQo+ID4gIDE1ODcwMDAwLnVzYi1waHk6IFBNOiBmYWls
ZWQgdG8gcmVzdW1lIG5vaXJxOiBlcnJvciAtMTMNCj4gPiAgMTU4NzAwMDAudXNiLXBoeTogUnVu
dGltZSBQTSB1c2FnZSBjb3VudCB1bmRlcmZsb3chDQo+ID4NCj4gPiBXaGVuIHRoZSB4aGNpIGRy
aXZlciBpcyB1bmJvdW5kLCB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudCBvZiB0aGUgUEhZDQo+
ID4gZHJvcHMgdG8gMC4gU2luY2UgdGhlIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrcyBhcmUgaW4g
dGhlIG5vaXJxIHBoYXNlLA0KPiA+IHRoZSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgb24g
cmVzdW1lIGVycm9ycyBvdXQgd2l0aCAtRUFDQ0VTIGFuZA0KPiA+IHRoZSB1c2FnZSBjb3VudCBz
dGF5cyBhdCAwLiBUaGUgc3Vic2VxdWVudCBwdXQgaW4gZGV2aWNlX2NvbXBsZXRlKCkNCj4gPiB0
aGVuIHVuZGVyZmxvd3MgdGhlIGNvdW50ZXIuDQo+ID4NCj4gPiBUbyBmaXggdGhpcywgbW92ZSB0
aGUgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzIG91dCBvZiB0aGUgbm9pcnEgcGhhc2UgYnkNCj4g
PiBzd2l0Y2hpbmcgZnJvbSBOT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTIHRvIFNZU1RFTV9TTEVF
UF9QTV9PUFMuDQo+ID4NCj4gDQo+IFdoaWxlIHRoaXMgcGF0Y2ggZml4ZXMgdGhlIHJ1bnRpbWUg
UE0gdW5kZXJmbG93LCBpdCBkb2VzIG5vdCBuZWNlc3NhcmlseQ0KPiBmaXggdGhlDQo+IHVuZGVy
bHlpbmcgaXNzdWUuIFRoZSBpc3N1ZSBoZXJlIGlzIHRoYXQgdGhlIFBIWSB3YXMgYWxyZWFkeSBz
dXNwZW5kZWQgZHVlDQo+IHRvDQo+IHhoY2kgZHJpdmVyIHVuYm91bmQgYW5kIHRoZSBwbV9ydW50
aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgaW4NCj4gcnpnM2VfcGh5X3VzYjNfcmVzdW1lKCkgdW5uZWNl
c3NhcmlseSB0cmllcyB0byB3YWtlcyB1cCB0aGUgUEhZLg0KPiANCj4gSSB0aGluayB3aGF0IHlv
dSBuZWVkIGlzIHBtX3J1bnRpbWVfZm9yY2Vfe3N1c3BlbmQvcmVzdW1lfSB0bw0KPiBjb25kaXRp
b25hbGx5DQo+IHJlc3VtZSB0aGUgUEhZIGluIGl0cyByemczZV9waHlfdXNiM19yZXN1bWUoKSBj
YWxsYmFjay4NCj4gDQoNCkkgYWdyZWUsIHRoZSBQSFkgc2hvdWxkIG5vdCBiZSByZXN1bWVkIGlm
IHRoZXJlIGlzIG5vIGNvbnN1bWVyLiAgICAgICAgICAgICAgICAgICAgICAgICAgICANCg0KSG93
ZXZlciwgdGhlIHN1c3BlbmQgY2FsbGJhY2sgYXNzZXJ0cyB0aGUgUEhZIHJlc2V0LCBzbyBpdHMg
c3RhdGUgaXMNCmFsd2F5cyBsb3N0IGFjcm9zcyBzeXN0ZW0gc3VzcGVuZC4gUmVzdW1pbmcgdGhl
IFBIWSB3aXRoDQpwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZSgpIGluIHJ6ZzNlX3BoeV91c2IzX3Jl
c3VtZSgpIG1pZ2h0IGxlYXZlIGl0DQp1bmluaXRpYWxpemVkIGlmIGl0IHdhcyBydW50aW1lIHN1
c3BlbmRlZCwgYW5kIHJlbGllcyBvbiB0aGUgY29uc3VtZXINCmFsd2F5cyBjYWxsaW5nIHBoeV9p
bml0KCkgYWdhaW4gYmVmb3JlIHVzaW5nIGl0LiBJIGFtIG5vdCBzdXJlIHRoYXQgaXMNCmFsd2F5
cyB0aGUgY2FzZS4NCg0KVGhlIGNsZWFuZXN0IHNvbHV0aW9uIEkgc2VlIGlzIHRvIG1vdmUgdGhl
IHJlc2V0IGFzc2VydC9kZWFzc2VydCBhbmQNCnRoZSBQSFkgaW5pdGlhbGl6YXRpb24gdG8gcnVu
dGltZSBQTSBjYWxsYmFja3MsIGFuZCBpbXBsZW1lbnQgdGhlDQpzeXN0ZW0gc2xlZXAgYXM6DQoN
Ck5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1fcnVudGltZV9mb3JjZV9zdXNwZW5kLCBwbV9y
dW50aW1lX2ZvcmNlX3Jlc3VtZSkNCg0KVGhpcyBzaG91bGQgZW5zdXJlIHRoZSBQSFkgaXMgcmVp
bml0aWFsaXplZCB3aGVuZXZlciBpdCBpcyB1c2VkIGFuZA0KdGhhdCBpdCBzdGF5cyBzdXNwZW5k
ZWQgd2hlbiBpdCBpcyBub3QgdXNlZC4NCg0KUGxlYXNlIGxldCBtZSBrbm93IHdoYXQgeW91IHRo
aW5rLg0KDQpUaGFua3MhDQpPdmlkaXUNCg0KPiAtIE1hbmkNCj4gDQo+IC0tDQo+IOCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40NCg==
