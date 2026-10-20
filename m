Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492980;
	b=0sJpvMuoMDRtVg4kn7vDnMxKeE/4B0bAltD2trYeGdw01xrpxNYHWkm+eJZaNoq3G8i/
	 IYrEBbj4BTmiaItNa4pahWQLlRiMpeb4GE7eerEvnolf+w2aUoPdMSaf8GTVOaF5Yh8IP
	 YqlNwrcI5p3Nzd+/aBrwvUrmnSxHUXBJi9P5ldx2S+L8X1TVDdIN7SVAOkHLfNv+asO0Z
	 4OCh8G/k0OKcAKqtJbb4S2Jry826pV0Krp5jK/0rucIwrn6Q7yl6/Jus1p/EEFOKQmPvi
	 XQZ3MuI6jo8fpdS0UFND7BdkAs7iOAXB54g5WTGeDDGTc60eyRoEODEKBn6OzuUD43w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492980;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=nhQMcisqF5o1gnO6naa+W00GyBaFML/fu8/C6rDhHsw=;
	b=C6DMghK6PyYYOe9MnCEDeFufgHn2lg4gbkhUyqdsFbhRveZPPt6gxZlzv8H6waXCCEIQ
	 CCfZYwV8WNhbk4DeHSB2bxJGFdru+eJR4OOiHdlGod/0zgU/iU5hQLzYY8QWI8+qjWCb0
	 ebNWPuW619nTtiM1uCRoDdXjJixlPNqDI2On2T+iDxzLR0iRU2iCzcJfeV09Tb+EP21WL
	 HMs71bv1ITpQa0xgC1JOLIjjYYr3DHdB1V06ydEciVPKpR3TE1qZ+ef26S8XWUqcsPdhj
	 37WgMWxTgN6vdTM1RreuUrUBEWLq1lB7cTvNjsxWDaolAKWCttUbgaxLGVSKiSekSeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	dkim=pass header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=TuwCNtVV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023128.outbound.protection.outlook.com [40.107.44.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D8606A31B;
	Tue, 20 Oct 2026 10:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E44D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=TuwCNtVV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVOSncro1+bg7ssnR+o/HySyaDLIOLlA9onFXmWE5Ueb+kLXVTlRGlCkbZr6THpdzPp+VbOZLaqIHIN9C6xAtzAd5fHUvC5AavNv/lp48JUyco2hYRcuZXKxdBUXUi1I4VCsRm038p4BdeO18emmTvpKD+fzqzqC1nx8Kxm8X6eTI5ylG4glK/aydHf88MyYtY9narv1HeEhU7lg+BgN7akZvHNPZLodO31c2+lfRBRidSUsIEMaIv+e242jJVLXaT63sSkRqashpBNKiinHQXQZTQSD9mDjAgluBFA53fYrV/DI4VJ6de7PovNBZat8TfhDc4qcBe/O7X7U6zQRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhQMcisqF5o1gnO6naa+W00GyBaFML/fu8/C6rDhHsw=;
 b=bwFFN0bPm40LRBA8/NflZTLr6RlVnf7dHAqEXxPoF7enzO2STnb6iiPgrkbnF+t1B6zE1XOpaUKEOppGCePjxJGbfD587K/hTfaKzZg/uDJkmGUp2DdHVqPehmp6v8aXEpZQ+gmIbR9xuMDMnDEH/NdiUY/ya7Icp+91mmBTQ+62Filp3etOXD8UEhyQ/z/y7Z98ItUz5jOMkJTZIxoSi1ZrFnPMUAfLQSwxSfoKKrbHI2sK+7x2fa8SPsucCACpjXgdsDTJJj9L9XL4UIwP6fyg0sTrMaKgPPdiYlykI/8JQKIrfaiBVBYeAbTwlGvoLbmDDKu1SA2PjSyyoeKfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhQMcisqF5o1gnO6naa+W00GyBaFML/fu8/C6rDhHsw=;
 b=TuwCNtVVCdMsqCmbnWb++n7cQ4JDlR97AQ3xlksJHDVhQOpkgqVqpSmi+jeGe7/YhH5De7gKvjSqPJ+DUZZpmiusRl4mib19J6bftyWXVQzt6fvih85hyRmh0O/dTpMH0XEecIT9YIOutkkGjf0X2nZiiWrSY3EhXWEtKWueGnJZDNAbI3WztTKBZ15jRf9rldhDJRxeh80JqVLpBEzoi8GgHaGKsLYSD6AkmVSrkIxggjoTGluDfUYpVBvwRV+Gj4eGo0Rhkj//aVDx4dttULkIoqc+6jEnNHD1h/F7PMXii1wkZ0VUH5EFIr6WQj0rmgIDqj75wxBDFLV+mhDUTg==
Received: from OSQPR06MB7250.apcprd06.prod.outlook.com (2603:1096:604:2a1::14)
 by SEZPR06MB5880.apcprd06.prod.outlook.com (2603:1096:101:e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 10:42:56 +0000
Received: from OSQPR06MB7250.apcprd06.prod.outlook.com
 ([fe80::6187:792f:4b8b:a243]) by OSQPR06MB7250.apcprd06.prod.outlook.com
 ([fe80::6187:792f:4b8b:a243%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 10:42:56 +0000
From: Joe Wang <joe_wang@aspeedtech.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] usb: ehci: Quiesce ASPEED EHCI before halting it on
 shutdown
Thread-Topic: [PATCH] usb: ehci: Quiesce ASPEED EHCI before halting it on
 shutdown
Thread-Index: AQHdXUv6lY/W8IuC00y5UIm9ibmlPbcARKoAgAR09PA=
Date: Tue, 20 Oct 2026 10:42:55 +0000
Message-ID:
 <OSQPR06MB725090D70BB07F70A2B521E789672@OSQPR06MB7250.apcprd06.prod.outlook.com>
References:
 <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>
 <7dfc5ef1-a466-4d78-af65-147bee8fe698@rowland.harvard.edu>
In-Reply-To: <7dfc5ef1-a466-4d78-af65-147bee8fe698@rowland.harvard.edu>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7250:EE_|SEZPR06MB5880:EE_
x-ms-office365-filtering-correlation-id: 2bc704d9-8340-4d9d-14fd-08df2e96e6a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 DQjpZOSK8wJ4THRC7lG3JH9zaajQjFsX3XDYTXZcPXyWHfYwEjmQQ74P79+9VQNbZoXZNlQrHOpIR+0mu7mlIPv21JL4tjXOswfbsquPpNdtuMtir0g/Wl5HLbiAew9jeYMeCtvpMreGipVkomgfegbxRTyWQ0RwQpZriQTdckK23IRMertmnJN5I5ekGCc5bizsyfZVVgeTKosd6pAYn2eUpUh/JhuKjf1HzC+cadI+RH3KIvbDqZVYF14s6gl894goUf6opXC5I4kVA9MPVvPtAo/toPtSR78drMbeYZgLO3KSyj1xDRArIjYovBGv9JIENbjaPRwlLi9yjnFe4UpyYf2r+d+jXuB/aQCT2Kbk/k2/+ZG225uDoQQYZ0mteFYsmVYOPH25HHKg+eDKnVFiE8JmCXkKQq3RmyPdOkvXs9DHvit5Q2BiwJLMmXGI0Lf/QAvz+E4hjOco94KZZFR6wB/i+uApiXL8aJ+Pvz3BtzZo7tjCJCV2Oxot+xkF79XlYGCrh5aQ4xs2O8wsR/HWeZlecwyoNNRKxVpCRs4oxgxqQ8yk2pUlNkMXE1f5P3kjLuPS+vUEoptgWUsWpZnwJ/WBV0tBeZa/+ZnjDGJjirUH3Rjxbz+nO4e9DR3Bjcn1SB3K3j/04Xwlcs8gWTG/3/rVkyAxB0RjvHcIcW5z0waICSOBGTjWQgkCmfiW1BgaNpJf0YxdtpUpoKO5uqefwfMLduVVRJeOS5ABod8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7250.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KeTToyj0VPryaXihWVXJ/0fQSlDm7wWqrVqisU4v4djz1/QT/4hfzfhJOfkx?=
 =?us-ascii?Q?d+R/Qt6VLMRRbFB+gebPieUGs5m9PNAZgEYrh6HKHuPdiMYEwnXszhOLl5oT?=
 =?us-ascii?Q?8EAMH/y2QvzD58QXjcG5myCPEAFxxF4ma5j/JBbruLFw/Vr2A/wiPAKPukoK?=
 =?us-ascii?Q?Ej3/o4tYcU3py6Y17B+fQ0SGoiJ1ViCIyCs+XREBaJk8BYmzrCAIk1Ep4cwH?=
 =?us-ascii?Q?MxwmsGQDfJeGVp24e70aPlb8mqjvRJLK2qjqC50+s0Ic7GuBsWu7z3SIl9xA?=
 =?us-ascii?Q?d+Va/C67VB3huVy6WzDYtjng+a0etLbc8P+DfxPrDkcDMoQK0tp8/FTEFzv8?=
 =?us-ascii?Q?kgb22UUe2lzsmyQHZ52/V5oa8DC9R2naN0SHu7IHoDZcT2JFaV37zDS+3y8Q?=
 =?us-ascii?Q?t05/M96f0z6KG/u5dDmHvuu89YG2jX1g9eK1zniyt8WQmbMUx/b5y1MbvxZH?=
 =?us-ascii?Q?tMfSQZWKRJMXTaOUvfaWoXXfbvEV5pfhYc4VU5FB2+xDV945K9ioiFVRRV41?=
 =?us-ascii?Q?BO0BN18NQ+FcpiWJ7OgczrCsfpdyJSJsRqGnUuvN+qd6WTrEsd9L0GXZ5pCE?=
 =?us-ascii?Q?9vNbjYAhD8Mo/Eu/PHKfpLKErADwIK33Wblgk0mIousARs7LlccHfh/45Nyi?=
 =?us-ascii?Q?Mv8XVw4tQEHq9/EcsyC9twq2y9H9UvameyUhUc/12wbG10hkuR7eNRDLolv3?=
 =?us-ascii?Q?pO7azXqVqfNip0hKJ8z2ztCBsQTVgw8DMKW6A0g1Ly1vqmxKsdeBQ8vGaJcY?=
 =?us-ascii?Q?H1qSaKyEKEFUpbAsG1xo3hbPwSVo16SENfdsC8+K5Udg8QTa9KkKfxtuHura?=
 =?us-ascii?Q?OQ1IhRf7JdEcFr4KbaI2r4aIwWMLTXf19W0v+fnIKcglkIcylw90TnNVQ1Az?=
 =?us-ascii?Q?l7YtnqjUte3WmeNipyB+fgJztpt/pwIkA7HDINh030y5zIm50w7vTCdF5QPu?=
 =?us-ascii?Q?cdV9vka0KKnyabpsAcJ99+5J/l2k5/06x6OrD6T9ljLsh9BX8hhHhDhoWtE3?=
 =?us-ascii?Q?FiaT1SHNHm2YKJhTpaw8iV76KG8x/i+4+DY4ISek9jxYml0J5qF/2tbrI4+f?=
 =?us-ascii?Q?zTB9ASzu9Z+SLhsctyojDB4yCaqjH+XzqXPYE16+J9S51WpSLr5NxPC3aICq?=
 =?us-ascii?Q?4LNDDDG5RiHa/rzauWBqnLzFlOxbD3ZDQphhShKZq6+3pfjFK48/Smug6wOw?=
 =?us-ascii?Q?ntLAEc9VZPSJxJx/clbw/YAVQob/MK0LfnRIf7nLr3n2tQfZDN5lDKArkEub?=
 =?us-ascii?Q?Tv59rSmZPClzmdCW+lCVvKuUmznF9VX35p7sHVEtq7TfFM6mS6RlePOxb465?=
 =?us-ascii?Q?4hcMoxTr3inRShC6QWoEviBDXqKMiHwYoaFJGj5iHcdtT8DXd0aYicIL3kUP?=
 =?us-ascii?Q?d1uw+Xs2b7AdT02+w+eXj5C0+dN7aVcJB2xHWzHY08kyimlwm24WQ+NcLKUC?=
 =?us-ascii?Q?8gWEb5fbtFG6kzpgYewSKpZw9xslz8QSv8pLhTngfKZIiE8hvCJk8gsVDuj4?=
 =?us-ascii?Q?jbTIfaDg/sXlQCrnAhZc9LGZjNJl/H/HVHdpM8YtFSqF/90QO1O7Ty7mCv9r?=
 =?us-ascii?Q?Rz9/A73ES9m4i+94mTxMH67QHrIoSzjuW04PB53uSKoYcjGraxE2ruo86Nuh?=
 =?us-ascii?Q?ly0AKy0JhAJLOVzdbJUIWxIt44UNwuOknyBPo/EKX/zJxDf2b3+/HxpJXwlV?=
 =?us-ascii?Q?f76TAzBCR/IddqY0WqVYo1VaKZsaqeLEdAeYwXnhVSTILt/XjK2lyU2qjldC?=
 =?us-ascii?Q?nYWf9YE0tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7250.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc704d9-8340-4d9d-14fd-08df2e96e6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 10:42:55.9157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1EBJpb7f2V6CJPEgfFoBsRP1IBEUiIBmAMhi2WtQ7Kxg7CejO4MfJXrcb1zZMiVnN27Q+2/fo5pyFBpLK76og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5880

Hi Alan,

Thanks for the review.
>=20
> Under what circumstances does ehci_shutdown() run without ehci_stop()
> being called first?  Is controller death the only possibility?=20

No, it's the normal case: ehci_shutdown() runs from the .shutdown
callback during reboot, poweroff and kexec, where the HCD is not
removed, so ehci_stop() is never called and the controller is usually
still running with devices attached. The issue was seen on a host
using LinuxBoot (NERF) firmware, which boots the final OS with kexec.

Controller death is mentioned in the changelog only because relaxing
the check in ehci_quiesce() also affects that path.

> If the controller is dead, will quiescing work?

It won't help, but it's harmless. The death path has already cleared
CMD_RUN, CMD_ASE and CMD_PSE, so ehci_quiesce() writes those bits back
as zero and the handshakes either succeed at once or time out after
16 uframes. ehci_shutdown() already touches the registers through
ehci_halt() in that case anyway.

> Is there any real reason not to do this on all types of EHCI controller, =
not
> just ASPEED?

No EHCI technical reason that I know of. I limited it to ASPEED because
that's what the report and my testing cover. Since ehci_stop()
already quiesces unconditionally, doing it for all controllers should
be safe.

> Don't you want to check whether the controller has already been quiesced?

The quiesce has to come after rh_state is set to EHCI_RH_STOPPING;
otherwise a URB submission or hrtimer event could re-enable the
schedules through ehci_poll_ASS()/ehci_poll_PSS() before the halt.
That's why v1 relaxes the check in ehci_quiesce(). The side effect is
that a controller that was already suspended or halted gets quiesced
again, which is harmless but unnecessary.

I see two ways to avoid the extra ehci_quiesce() :

(a) Keep the relaxed check, and in ehci_shutdown() record under
   ehci->lock whether rh_state was EHCI_RH_RUNNING before setting
   EHCI_RH_STOPPING, quiescing only in that case. This is the
   smaller change.

(b) Same as (a), but leave ehci_quiesce() unchanged and have
   ehci_shutdown() call a separate helper for the schedule
   quiescing part. Other callers of ehci_quiesce() are then not
   affected at all.

Either can be combined with dropping the `is_aspeed` check. Which would
you prefer?

Thanks,
Joe
