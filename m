Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012070.outbound.protection.outlook.com [40.107.75.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47392277818;
	Tue, 15 Sep 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458359; cv=fail; b=OL0Qk0wYMHPP8l9wpaJQxwIHO7HehWhNm6nQ8tx7zBzpuBuCHlO2SVoNZ2O4IP3SEifho+SonlfmBi7YzDG8/UcT7vjRgsC5bHKGbwppn3ULsZ+3ekyNfMqtNCvdzcV8NnJHyFT76AGLgoSz5k8ovffgpwsf30S/18Bv5TXrDdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458359; c=relaxed/simple;
	bh=j4KafscJX60RspTXs+qgiuC1gjKmnrgLe+NqSAIkXwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RJHc9O0j4odqs9wP+T4FCFl489qwPoCItNjFc+B4endyX+2MA117DFDl9MOsF+CZ73IVeWilHgSub87nU6dmlZ+B5LxdryChLTgjJ2kZqSje1E/9ZUZ70b2AorGAERfhKjDh8Q8GtPc7n/PcnJCw8eSTwrLqoiH0MoDvqs/bCPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fQeRvKpr; arc=fail smtp.client-ip=40.107.75.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fQeRvKpr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StyJMoFUXHtT9ZtzK0YUF5oT+b65nH1ltlwzzsyfem9Gv2KghgUJSd8F011nHYMkq9Pi6dm/XMLb9yhoDER0BUjWTTgBE7oWSdq0lPpae9aByqrjXRe5ITLXCW+jtrPnZRlLH2ks8ONki0X0Ri7lVwgzLvsiZSBgekzgnXtsIBnZwT+FPpAgs8pClIRqRY0PcsarS5CUXeM4oH1NCEuHwTnFP2gZd3sYA2LrdPBi1Z5ytpjhDs3hA/2K6NKSZY0t3WlJVW5OH63SxAZSVe3TFQRvdzXtFfl3TaMnWhPCqBehYeUZHrtqtJ3kd2WwMRVxXxrM9M0DA8eMwMAwGyJp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4KafscJX60RspTXs+qgiuC1gjKmnrgLe+NqSAIkXwo=;
 b=H6vBI6gTNTXvHLjiIfVubaPxwpvcPdthRwuBAJAdO4eXyT/0Lkp7AI5WKyBZzLbFk9bDJH4ErGmQJuW5FWxteWXLwJzvEiOrffkFPhPSmKORt+VfOrlExhQSzPeg/G6LglMhFMpHTwUKl6zNs1I39VRjsQBKRfhZNWdNUlPMzf2DcK4Y8cFwbsyZ8CrFYtEffl20ROvaMWJ9bd1jvmZKWNNHCZGaoOgamYPdjzJ8U4llipXv3esnLbNDPByeYyfOhHrOm0HnBQ691BtiZRIp2oE6X0ZoPOkBLjsPbPeLNYeO4FnTdGxSNp2Ti1CnfSVgHQP1MHl97CEQOY3AUp/fJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4KafscJX60RspTXs+qgiuC1gjKmnrgLe+NqSAIkXwo=;
 b=fQeRvKpr6ANznyF0vK7qkQiVRvu2VXthUZGpieKKN187diW+yCS0FE8JxDmoPegmL6GCqwgtrfzE3f1fQxO0hGFTeeWEE5XtIKp53scoG4/TRtfyAJHturqLDCmOgGr752b5e9tzwqQp3n4DxumNP+n4nCPNux86Or9WbMe3M2/wakSJGIXS/IlNbFc7R+nkFlpy4ykRPVKifJnodBd/ixdCGWC2fHb9ec8hCvXGHcjXm+q4FxTTVcf2KfPNHYycvpjESc9eE81vuQ9XyLKAie6uWgFp8VLgH5DP34e1/ucJ1F7Bsbj/VL9Ax75nvcM+6p/uF0yDX03heysN9RaPaQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SE3PR06MB7960.apcprd06.prod.outlook.com (2603:1096:101:2ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 07:45:51 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 07:45:51 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
	<selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5kOiBjaGVjayB2ZGV2IGxp?=
 =?utf-8?Q?veness_before_removing_endpoints_on_unregister?=
Thread-Topic: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Thread-Index:
 AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADb5AIAABlEAgAAQIwCAASzQUA==
Date: Tue, 15 Sep 2026 07:45:50 +0000
Message-ID:
 <TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
	<TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914154656.56824fbd.michal.pecio@gmail.com>
In-Reply-To: <20260914154656.56824fbd.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SE3PR06MB7960:EE_
x-ms-office365-filtering-correlation-id: c04724af-e3c5-4c6d-c4d7-08df12fd5ce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|42112799006|6133799003|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 g78Ty1QLOozIWDoGvdRwN6rM15u5fU47X5KFEaCl0yAsRFDbUI8xbZB/phDCPO++QKiI8gYkJyDPDGwFbe4WNlA7k++8qdBfkSZOABwzc+gT/t3HZAZ9hFiKXShtjZLkCP+hWDA7H7Gj2CsF83+eVdDNOqyBLG0rn6YK14Fv2+GQ0ytYUc2yQCOVQL0+ac47YegDVx44kxXYlF5tRaVmnsTcdUAVImUXfH8ZM0F4sbW6L04Q3OytBUHhExJrWOfzHh5N7sYu/ObndX57sNbWRKLNLuCHpsW+R5HCQb0Svbdho5E8VcnOleJdXKESQCDFGYz8s5xrtQpAh4nzbWqrG6fQ097KWY5h8Xm7lU8V2J2TLXhGaiuJZjCPAZDt8+P5khNmkzDP98N3bRa8DONeDqlZnoKFNESvtTap0W17iTMoZlp7To2/iwO1gX9siXBYzRv3E8ZVuM7OuAWD1KicXONMluurODYBTGQuaiQPln+l8dauTlLVXWO6Vq24CE4CsJ/ts5WKhU7zlf/NBt/Q9RXuuNx6fyYRMkpbav7Qz8NP4BPmjOrEQVO6fZvltSWWY9rLmdK4S4hjAHoUBDg+x5f9V+zF0oY9UbRCR6+cEXGunHcSU1+ac2ECuj0kzjtQR6Ur8TmfyR5+A/v46EPUt/DK4sLjAAX8fmi9YMBrokI8zFfVRkJRkL5MB2G7YUnYG81WT2Tl88F1CCasyunhupWX4XMzuopVWtCZg6WdmgU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(42112799006)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVV6d0hBZWQvOER5czFHeGYxTmxuUDd2dXYzc2JxT0dkcFoxZHVuREsxdW5V?=
 =?utf-8?B?VVNIUEF4MlFxQmYzMk9ITVBoS1pHUm5Yb0YvZE5iNkZCRVdhS0hmVHlnekoy?=
 =?utf-8?B?Z3FHZ1NaUXlIWkxFSGYwSjhUeUN1MGhzSzYrK2xnNFErZXhTU3NRYUNaMDQ5?=
 =?utf-8?B?TS9NRlM1emgyTjVYakZEMHNpazZ4TE1QdThRQVVSaU9HczZJTTB5YW9HREJn?=
 =?utf-8?B?V0ErMXNkQUJXUktJa2J4N2cvaHEvcndRY1ExWGR2QzZBbUd0Z0wwSzZUOVU3?=
 =?utf-8?B?dzJBOXhacVlLdjFVbkN0aTZlb01KYlJkOStKT3hvVWtibzBGMlRhd1Y3ZnBV?=
 =?utf-8?B?alU3UkM0UWxjMURTN21xWWFodFRVM0x2eGJGMnRkaHU5bUl5VlM5Z1lldy90?=
 =?utf-8?B?OVRIR0VRR01XQXpjVU5PNWdkMzlBenc1QkZyVEpuVjAxalkzaFMwOFNOeDRN?=
 =?utf-8?B?aUl1TW9jV01qRXhOMUtiajhIUnNzOHhTUXQ4NkkzV1p0YVFDSUxENG9QRCsw?=
 =?utf-8?B?UDZCMUV2Z2J3cUpFUjBpNldpU3NBelM4Y0VjblJTaUZwNFowNUROeHV1c2l5?=
 =?utf-8?B?WW5KbWxXdTV5UkRoZEwyU0k3RDFoeHZTSXpIYmdQK1Y3Z2lsLzg2TEkvSkl3?=
 =?utf-8?B?RHRxU3VCL2pndEpmbGhqNTJJSjVwV1A0VVBxM3o3bitRdUo4cXR0SUE4dHBF?=
 =?utf-8?B?QUc1Z09POHJiN3JrZXN6U284cG14WklPeUs2Vlh4Tm1OSGFFTDRDQ1U1RGpx?=
 =?utf-8?B?aHI0NkJTNkZsS255bE13dlYvNWgzY0wxU3ZLWTFxOFNlemRXQ1dBVUdvSm5t?=
 =?utf-8?B?NHNKekZiQUoxcktOL0ppanNXV0dHZi9qamQ3UER3b3lEVWJxSDhIZEgwVG5l?=
 =?utf-8?B?aGtqOGxCSG9MTmN6UzhzNzh0ai94NkU0MEVBV29Ec2UvN3htbE9EZkFnQzhh?=
 =?utf-8?B?ci9IOGhEL0phcUVZSFI3cVdiZHFBc3U4Nk1VbDJVK1VWZ1pVZHlNb1Y5MFgr?=
 =?utf-8?B?QkNoSFdoWXpBc2xtZmthcnBqWEVxVktzYmtHNDF3TlUrMEx4RlQvdjVhU1hH?=
 =?utf-8?B?K0ZIeENNdmhNeW9Va1ZIM2RIaWdKZVZCR0pxNnlLeEEwd1hHdnBicWgxbXRX?=
 =?utf-8?B?cjYxL05ZbCs3TlQzR3BSaE5BMVVTNXNlMDlhTjQ1Z2xVUGNTdFpwbmJxdjBK?=
 =?utf-8?B?bGRqQ0p4bWRRZVdDdW14TmhrY3QwK3NCWDMrdFk2bmVyQ083NFhPVEZ2dFM0?=
 =?utf-8?B?Zis1K2llbjBaOVZXcy9iNmJFVS9ZbG5IelJJYVlmazdtelBpSHE2dXBucEk4?=
 =?utf-8?B?T0J3OVR2ZStZWkZXd2pIdHZnT0xrcjhXSkd3M0tLRXVkRmZPWDZWV3d0U3BM?=
 =?utf-8?B?QVBUVVBjMkZiUDZXa3BzcVZsNDRTSjYwSGlmdUI1bG1UV0lPUjduT2lhSHM3?=
 =?utf-8?B?YVFCUzEwRUwxL0NwWCtlSDR3R2xhWG85YXJrbVRia1NZZHlXbC85TjNpSVhj?=
 =?utf-8?B?VHp3NFdvYlI1M3BQa1dhVVFmR1ZKc0hsSUVTQXg2cUw0ZTRzNXdlQ2pNU2dm?=
 =?utf-8?B?Sit1V2g0OWFNNWs2c29BUHR5Q2xncEQ4Z3d0bzdjODR5aFJVKzk3djdUd1Ax?=
 =?utf-8?B?WCs0cW1UYk5RVWUwSFZKdkFnVE9jbTBvc0hYR01UcTJHclZjejdram1UQnps?=
 =?utf-8?B?aktVTE5oeGhkZ21iYWM0elcxU3N1Ly9UalIySjNGOU5rNGpFemtFcEFVcXJG?=
 =?utf-8?B?WUdjUkRmWXZJcXBPMXZUT24zSEg4c0M5RmNRdy9OZnYwMytDaVFRUjVaYmQ5?=
 =?utf-8?B?enZwM2xvOU9CMC9qcGQ3UzBSb2N6ZitBeS9EODNOL1pDUGtXTVFPMytabUZ5?=
 =?utf-8?B?UG9kek05eGdyV0E0Mjk2UWNMTEluN052alhwMWhnaUJKNjJERFo3aFdUbkox?=
 =?utf-8?B?YUF5WFc4SVJXZVB2RnltSUV6ZzhsRForUHRaN0NaRWw2Q1NSRjNpb1EwTHRV?=
 =?utf-8?B?U3ZTeGZwY2MrVnBGK1Z4QTR4WjlESTg1ZStOOFBtdkVzazVJanpONFZFSXlI?=
 =?utf-8?B?RmsvRmt1c0lpWCtsaU8vL0xGV3BVOGhNTDNpcFZYMVNRRDlQd0RQRnBORlhG?=
 =?utf-8?B?dEtrby9oZmlaSXVnL1g5NmZkdTdMR1ZmZEtBQUFEQU1IWk9XU3ZML0ExWTNp?=
 =?utf-8?B?VkxsQXpXRDhhdGVNbzYyUHlQYVB1WWpJMVVnVU12dDVQUmVzbmszVnBqUVRO?=
 =?utf-8?B?TGNOZzhjbDRzdXVmTEdUMGMza3QraTlKVGlWZDd3SGFETURQNW1oNHgxb3N6?=
 =?utf-8?Q?Ud+Yez8jSnfl7gI6ZX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04724af-e3c5-4c6d-c4d7-08df12fd5ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 07:45:50.4278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYHJ6m+HjAu/NlSg90wXJGtCDgWQwZTckSYuZW2OEzAAtpq35HNGgUgl6fNOfmL6LDBF++kwSwT8LG112pn3VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB7960

SGkgTWljaGFsLA0KDQo+ID4gPiA+IEJ1dCB4aGNpX2Rpc2NvdmVyX29yX3Jlc2V0X2RldmljZSgp
IGlzIGNhbGxlZDogYmVmb3JlDQo+ID4gPiA+IGh1Yl9wb3J0X2luaXQoKSBjYWxscyBwcm9ibGVt
YXRpYyBodWJfZW5hYmxlX2RldmljZSgpIC8NCj4gPiA+ID4gaHViX2FkZHJlc3NfZGV2aWNlKCkg
ZnVuY3Rpb25zLCBpdCBjYWxscyBodWJfcG9ydF9yZXNldCgpLA0KPiA+ID4gPiB3aGljaCBjYWxs
cyBoY2QtPmRyaXZlci0+cmVzZXRfZGV2aWNlKCkuDQo+ID4gPg0KPiA+ID4gVG8gbWUgaXQgbG9v
a3MgbGlrZSBib3RoIGRydi0+cHJlX3Jlc2V0IGFuZA0KPiA+ID4geGhjaV9kaXNjb3Zlcl9vcl9y
ZXNldF9kZXZpY2UoKSBhcmUgY2FsbGVkIGluIHRoaXMgcGF0aC4NCj4gDQo+IFllcywgeW91IGFy
ZSByaWdodC4gSSBtaXN0YWtlbmx5IGxvb2tlZCBhdCB0aGUgIndhcm0gcmVzZXQsIHBvcnQgb25s
eSINCj4gY2FzZSBidXQgdGhlcmUgc2VlbXMgdG8gYmUgbm8gcG9zc2liaWxpdHkgb2YgZmFsbGlu
ZyBpbnRvIHRoaXMgcGF0aC4NCj4gDQo+IEJUVywgU3VwZXJTcGVlZCBhdWRpbyBkZXZpY2VzIGRv
IGV4aXN0LiBCYXNpY2FsbHksIGFueSBhdWRpbyBmdW5jdGlvbg0KPiBpbiBhIGxhcmdlciBkZXZp
Y2Ugd2hpY2ggbmVlZHMgdGhlIGJhbmR3aWR0aC4gU2ltaWxhciB0aGluZyB3aXRoIEhJRC4NCj4g
DQo+ID4gWW91ciBjb2RlIHRyYWNpbmcgaXMgY29ycmVjdC4gZHJ2LT5wcmVfcmVzZXQoKSBJUyBj
YWxsZWQgYXQNCj4gPiBodWIuYzo2NDEyIGJlZm9yZSB1c2JfcmVzZXRfYW5kX3ZlcmlmeV9kZXZp
Y2UoKSwgYW5kDQo+ID4geGhjaV9kaXNjb3Zlcl9vcl9yZXNldF9kZXZpY2UoKSBJUyBjYWxsZWQg
dmlhIGh1Yl9wb3J0X3Jlc2V0KCkg4oaSDQo+ID4gaGNkLT5kcml2ZXItPnJlc2V0X2RldmljZSgp
IGluc2lkZSBodWJfcG9ydF9pbml0KCkuDQo+ID4NCj4gPiBIb3dldmVyLCB0aGlzIHBhdGggaXMg
bm90IHRoZSBhY3R1YWwgY3Jhc2ggcGF0aC4gSSBhcG9sb2dpemUg4oCUDQo+ID4gbXkgZWFybGll
ciBjYWxsIGNoYWluIHJlZmVyZW5jaW5nIHVzYl9yZXNldF9kZXZpY2UoKSB3YXMgYW4NCj4gPiBh
c3N1bXB0aW9uLCBub3QgZnJvbSB0aGUgYWN0dWFsIGNyYXNoIGR1bXAuDQo+IA0KPiBOb3RlIHRo
YXQgeGhjaV9zZXR1cF9kZXZpY2UoKSBpcyBpbnZvbHZlZCwgd2hpY2ggaXMgY2FsbGVkIGZyb20N
Cj4gaHViX2VuYWJsZV9kZXZpY2UoKSBhbmQgaHViX3NldF9hZGRyZXNzKCksIGFuZCB0aGVzZSBh
cmUgY2FsbGVkDQo+IGZyb20gaHViX3BvcnRfaW5pdCgpLCB3aGljaCBpcyB1c2VkIGJ5IGh1Yl9w
b3J0X2Nvbm5lY3QoKSBhbmQNCj4gdXNiX3Jlc2V0X2FuZF92ZXJpZnlfZGV2aWNlKCkuIFNvIHNv
bWV0aGluZyBoYXBwZW5zIHRoZXJlLg0KPiANCj4gSXMgdGhpcyByZXByb2R1Y2libGU/IFRoZW4g
YWRkIHRvIHhoY2lfZnJlZV92aXJ0X2RldmljZSgpOg0KPiANCj4gCWlmIChkZXYtPnNpZGViYW5k
KQ0KPiAJCWR1bXBfc3RhY2soKQ0KPiANCj4gYW5kIHdlIHdpbGwga25vdyBob3cgaXQgaGFwcGVu
cy4NCg0KVW5mb3J0dW5hdGVseSwgbm8uIFRoZSByZXByb2R1Y3Rpb24gcmF0ZSBpcyB2ZXJ5IGxv
dywgYW5kIHdlIGhhdmUNCm5vdCB5ZXQgZm91bmQgYSBzdGFibGUgd2F5IHRvIHJlcHJvZHVjZSBp
dCDigJQgaXQgcmVxdWlyZXMgdGhlDQpkZXZpY2UgdG8gYmUgaW4gYSBzcGVjaWZpYyBzdGF0ZSB3
aGVyZSB0aGUgcG9ydCBpcyBkaXNhYmxlZCBhZnRlcg0KYXV0b3N1c3BlbmQgcmVzdW1lLCB3aGlj
aCBoYXBwZW5zIHJhcmVseSBpbiB0aGUgZmllbGQuDQoNClJlZ2FyZHMsDQpMaWFucWluDQoNCg==
