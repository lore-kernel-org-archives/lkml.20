Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=23.103.209.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794585014;
	b=pfwqBBUO9s+fbklOO/DdIZZpiU4JBcnlzfpQeC1MpS68SsadCvXO2SxzACCUkbb+OUEw
	 dhzqPMQpGPfgS+KnOtBYl2zZgBULfQTNmxjHAPl7Fbr0sGHK/3qkwc+vK2HQe3xIRYH/s
	 RdG/1pNs6sSlvPIfSL6H3C8fvgX0kW7n1Ap9quaKiovNWbua+IQTPiuSk1E9V8rFGQ+Jw
	 +2SqoWUxQb+VNHx/TJrA14gCFT2LPpf5QBfjBURNCh6maXRUpRnuR+CbEv4+BYY2CMia1
	 e6rlaujGblxKexuhG9dHx0/dzcEB1fvekelXOrscfCqZopiVu9kZJwR0TOX04caKN6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585014;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rEc1hUlIqap3ExV++CfjhodnQ1yadV5xXJdepLPJ148=;
	b=4y2HdDeikRjAbSjguKbc9mzaI+CRApVJIHF1zZ3xEvVriD+qnJclaiWd7FSokD8G9FBM
	 gr6NFB3ubGH9s3Y0gXLZCbEm8wRZltXb/dsyErSLdAXeshYqcrelhXx/mRwIYHCnd6E31
	 wye57evLjoJYfR/69KDtprCNdDVUASUhxUiRRoS3KTjF8ZWV36eMJRrJstodDnujt6jA5
	 SXpS8/rMx3hPJEBY7FfHLcAofJCwCdIPmmvGhVOctSTMJmii+9d/Uibgv5aY76kENl9yA
	 Vx5juasOIIZvU/oPtoiRzw444vH7HwdyefsZLOTTBFVPacZ1Lnk2uRFPfRg4PNuvXdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gotenna.com;
	spf=pass smtp.mailfrom=gotenna.com;
	dkim=pass header.d=gotenna.com header.i=@gotenna.com header.a=rsa-sha256 header.s=selector1 header.b=ezWB1Pgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=23.103.209.74
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0074.outbound.protection.office365.us [23.103.209.74])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A4606A33D;
	Fri, 13 Nov 2026 15:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62A4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gotenna.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gotenna.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotenna.com header.i=@gotenna.com header.a=rsa-sha256 header.s=selector1 header.b=ezWB1Pgp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=IliaAckQHXEFTAWywtASKr0wzalfemAwh0dUYVJdzUCkmsEbaM0pJFCTzN1odzfSlLeL2rfALZ9aK/NrL4CN4MPwoIS1zlzg/xXuEnIBKc0UXaTeAvZkIBBgk1Eaj5/MrotTyFCFocHpUAEpci7cUmMavEhAOPdkZ37bbdRq4T/2Zcu94RQ8cN1dVPv2FUBDhdg4/3ROjmSLAXtj2BgLyGHK1CznMfRQ62hpPFdlXwEwaXavGy7jeDboqtDC8K5iY2E3Uj64SBuVxm1tUDNQG3wAz//jJ3qvUxgk/TVzIXxAAV3gbQaJ0fJjV/gu5LiHPNAEVsDwtT0Xn05LySFSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEc1hUlIqap3ExV++CfjhodnQ1yadV5xXJdepLPJ148=;
 b=cs0nLrHQGvE3z40ZgE2+b7JdJUVU7zg1ok9PAydTFChle+SJKuz5jzxCr2Jcmg5lS5mU4pCnxEQpAgLZjQ6qh2FGYGX2/rj1Kodl1QQ/x6aQlyHGC1Szs3t+cYyQ7xYvfVyxlVucWO+0F7fbzEpSmgqI7xRa3MRIHmGSklFtht9oCyJh3hCXTbQPxfH+F5fZoPekhvP69BKBlCpoJOrfS21d2bIj2GMjEvc9BWfPXhSNXz+kicPZzuHO2za8BuPjSWe78AZdDkpLIsZUm6+aC5XgH9/6ZQJf8YQ896eeVq0wJiYEessSV1ffh2AsYWCkxQeaNTmDWmEhpcDlRTpWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gotenna.com; dmarc=pass action=none header.from=gotenna.com;
 dkim=pass header.d=gotenna.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotenna.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEc1hUlIqap3ExV++CfjhodnQ1yadV5xXJdepLPJ148=;
 b=ezWB1PgpYg4hZv460XTjB/B/Y9pF/j4ufMxseW4DIL5nKQvzfJpOwS0HHE+qRnArZT18fdslsVcLTunXgNSsvYXiRMDxst5fadSllIje6xSol/x8SaBgmBPKCVOvqcprSrwPcJut42gdrOENR7fIKJHHlzDeY0SKM2zsYcn0acwUyiZDudarADiFiEo0vSVXJdITnlarHEC4B8aIycIOTe2DuLFwUZabOZMKgSsQjHv31iSaov1tF1LXdZoaaitLot8eDQmOS/kREziPG/8aadJhWdlWIAHEnYmM2pkL4LkRzETlig0iEzMHp+AL7BFWi6XFVpjSsQg4Agtlk+BOTA==
Received: from SA1P110MB0976.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:170::10)
 by BN0P110MB1370.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.16; Fri, 13 Nov
 2026 15:50:05 +0000
Received: from SA1P110MB0976.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4e82:7de2:f390:82d8]) by SA1P110MB0976.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4e82:7de2:f390:82d8%5]) with mapi id 15.21.0569.015; Fri, 13 Nov 2026
 15:50:05 +0000
From: "Brian Ellis (US)" <brianellis@gotenna.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: ulpi: warn when a PHY with no DT node cannot be read
Thread-Topic: [PATCH] usb: ulpi: warn when a PHY with no DT node cannot be
 read
Thread-Index: AQHdcHdceYwjOP3np0qJhDaKl4bTtLco+KiAgAMykZU=
Date: Fri, 13 Nov 2026 15:50:05 +0000
Message-ID:
 <SA1P110MB0976DFE0F4B8BB25AA2447D2C47FA@SA1P110MB0976.NAMP110.PROD.OUTLOOK.COM>
References:
 <20261109-ulpi-warn-unidentified-phy-v1-1-64537f455dd8@gotenna.com>
 <avSCDSv15j7KBrDa@black.igk.intel.com>
In-Reply-To: <avSCDSv15j7KBrDa@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gotenna.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB0976:EE_|BN0P110MB1370:EE_
x-ms-office365-filtering-correlation-id: f7e0515c-84c0-491c-83f4-08df419dc95d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|10070799003|366016|23010399003|22082099003|18002099003|6133799003|55112099003|38070700021|56012099006|5023799004|261026140227099003|4143699003|10067099003|261028144727099003|261021123027099003|261102123227099003|261009223027099003|261022105027099003|261026121527099003|261021121427099003|261022075727099003;
x-microsoft-antispam-message-info:
 N4AVVPv6NpFP0FfZGg348pU0kp1SM0cNqsEgbY7s0Klg14zqd1oJuAAe/KnBZ+Ink9xLSTmuYOT94lIsOrnKBhpKWxEDHeUxQ2v3G7GdcKt5evERVmSjEkMZf1wuT8aQvZNi3np7aZ2zbbljNF72w4geqTKX3R1mu835Xgan/wRALnzd+bjxpdZqY0vBBpPuPzNwZrR9uBMbjeyZhu82I8w297/3z8cU1D+MxJbrd77uJMAjiU+nDvnuZ3We4mDEAczH3ZcbUV400r+ebg4jtldri1sFR8hlsiw5pEx3oBhdnHRPm/gmTXqfRsak8vP6kFqBbTcS9FNlpYre7VTvjfrVCtTM9fr3yQxvDkJ19R0zLv+eoerPE0CHbQOCdZvhDm5lkxPJfrXRyeJpvA+rDYGpCwexesQaWoK8KCMTivv6NqwSHnowJTaOBTq0u72DmbH4CYlOvCQU37TT1hdjoyndX7sK1q8s8y+OLBBoNWyZ33mA/EO9bQfnkUXKBiUO+CkmFgP2FmxWOrnPweAjtljqUaBzleHaypJqAy2oL1ONAVVUxhf2h0qfA8Uoq4LJd1hbbO643tb2Dl4N6uEoU3BchFbLe0h7l8s+HLQlET4fc/lSjzayTzq66n0c2xClB/ISRy22bJd33YCp4EsoyhXvLeCzz5NttSoU3iw+ftMkohCbwUaFOVKGWSJY2+cD3hS3s5edsT9WATxgTaaEV1qBXWUhL8izyCdXfLvXV9I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB0976.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(10070799003)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(55112099003)(38070700021)(56012099006)(5023799004)(261026140227099003)(4143699003)(10067099003)(261028144727099003)(261021123027099003)(261102123227099003)(261009223027099003)(261022105027099003)(261026121527099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2Y9fcw8F+SclfOpmCHZOrVKFVBzKNW/5xKF+/55nhQqsxU/sW1hcmvbLvE?=
 =?iso-8859-1?Q?a6fTnxQfaT3gLUZJkVyGMFDJrRnKUSgIDE37GwofEeHD4tWcvfhz1OPEwk?=
 =?iso-8859-1?Q?LjdLx05NgOcInfHJGxp22552Xbo14ejersD4C307PwOpRBjSzRjEjQ9Sx3?=
 =?iso-8859-1?Q?7wF4LhrFwLWkxv1BQJcvCV/0oijj1N+x54ZX6rD767hZDmXCJ4ardFKd0z?=
 =?iso-8859-1?Q?29AdAYhMxdtXEt8LhGljYjpAbjC2H3CWChHkcWNTV6KdyVNkEau0bOaUU3?=
 =?iso-8859-1?Q?UMNA1egVbYruSoH6PxpCSlwSvFu+f/8pOKq0TjVMQ3VFTD4CZySJho/jPF?=
 =?iso-8859-1?Q?lJBEGadZ6Wp5XSZzLufiYjmj70oIO2KYq/l1EpTZpjsgnfQOo2GctTkSHa?=
 =?iso-8859-1?Q?sB32mN5qjj9JWSkDb/U2f8lQqnO1TsHxPOrTAdP0jJh3vfHuXrzBuGoLaY?=
 =?iso-8859-1?Q?TGpBC/owAEJO2pmdJPVd4p6u45nZrGdWQelgr51HBaMnNExG3pD/XCJNs/?=
 =?iso-8859-1?Q?5glFL37bF+xsCmvpv2cfzOFtPIyDsCwDxUoFv3MsT3ilnLr6sXevP06fdO?=
 =?iso-8859-1?Q?669mwvnUoDmpnuSI5rOfBdXzRuB5rPtWVfGH+LeyP1HAbStQsiMyhr2M4f?=
 =?iso-8859-1?Q?qxmli0l9vqpGXXVSWgE1I4kaimLOyiTeRdehnzp26yCGSjYkXag6isEqQF?=
 =?iso-8859-1?Q?HoivDsZQQVpd8P9C4jNkS3SwhimdK5gnNAcByK/irYMlEUTfwfcBja/Fue?=
 =?iso-8859-1?Q?2TRwMYL/nbmEZnPwk0NvZbX3Sq5be/pMu4VXK34u1xnT5JIqgTJaVZ17NI?=
 =?iso-8859-1?Q?s1idCDfviWwXbf+Uu+PrEFOlcGpE5oDxx1CUGEASc6mK763KO3hYWFD+X8?=
 =?iso-8859-1?Q?v5bZOFfA65N49OIyU316BYk0yet4pedEcMvlK+FKw8+Lt37Sjd0QLzjYJD?=
 =?iso-8859-1?Q?ynFaxmk4PKZyLxitFqyBgsvUIxak7BjiGmrlMwDhQ9mnCmJRwBXwzSQbye?=
 =?iso-8859-1?Q?o1vjMD8mMBaxiHE4h1eiE4rZs+kGt6nIrGzClJZJTTY04tQQL+vuWGn82r?=
 =?iso-8859-1?Q?aQZVohbjJQVMgHsuz+FDlbOpzaTrI6UCYNynoqICvFOgvmwYoGg5vhrjFK?=
 =?iso-8859-1?Q?utUbRneKHjR/xDxy5VGq5dtsWiYbecTK2yd1dX7hu4URlOwuDYCkElXfth?=
 =?iso-8859-1?Q?/P3sN+z9nAtqcj//HSdX8LLUP6aRcE+swqnSEt5BwNZd2kxGLf2MjKN/Xc?=
 =?iso-8859-1?Q?Y47dnOImPU90k1blKUmAke7t/DDXrJr1qSvsSpoEUJGq053N6RA7qscvXt?=
 =?iso-8859-1?Q?OGl0THDU7/u5w/5N+WZguRwYzIb2GxYFDrcWR7MrrUUNHFy9eTFXWNo0HO?=
 =?iso-8859-1?Q?ukxjIjsIQWFaMuIJw9c8qe60Xiv6w461sboQ2j09PH/a0L/SxNY2ydsgTu?=
 =?iso-8859-1?Q?Ff34X17Dpuqa0+FT+eYFonYwbwntpzqwRZIyZC73SI/i8VWQr4XZIABDb1?=
 =?iso-8859-1?Q?Ygk2gvW5i2Pcm/9zrs2Ju1cT3cSIOg+NP1lxKBb44eUGCk47G1i/UnXBUc?=
 =?iso-8859-1?Q?qwiQXNDwQJ2PI7XS3ToYQ2o9bxfLKk1HbV7+vrJ0Wp9RXJSKW0yIaKW6r1?=
 =?iso-8859-1?Q?+1KZ1jjOtr0VKXV2WVU2rDoUEDxX9iRD2b2rDOsPXJESfGJlL3XJbb4jxq?=
 =?iso-8859-1?Q?us1CQfm3PBVsInyQ29OWOszgYEAOTWUfkI8cYbJU9jTCMRHDbXL+EmdiPi?=
 =?iso-8859-1?Q?/K2exUhYuF1w8LFGkUDZAom7I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: gotenna.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB0976.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e0515c-84c0-491c-83f4-08df419dc95d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 15:50:05.3795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9997302-4e5a-473e-a9f5-f3ed9cd16249
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1370

Hello Heikki,

Thanks for looking at this.  Nothing in software powers it on: our
board feeds the USB3340's VBAT from the connector's VBUS, so the PHY
only comes up when a cable is plugged in.  Booted without one, there is
no ULPI clock and the scratch write times out.  That was a bad design
choice, and the next board spin fixes it.

So the root problem is our board, not ulpi, and I agree a warning is
the wrong answer.  A dev_dbg version would only help boards wired like
ours, so I won't send one.  Greg, please don't apply this patch; I
withdraw it.

An LLM assistant (Claude) helped draft this reply.

Thanks,
Brian

________________________________________
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Sent: Wednesday, November 11, 2026 7:56 AM
To: Brian Ellis (US) <brianellis@gotenna.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.=
org <linux-usb@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel=
@vger.kernel.org>
Subject: Re: [PATCH] usb: ulpi: warn when a PHY with no DT node cannot be r=
ead

[You don't often get email from heikki.krogerus@linux.intel.com. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On Mon, Nov 09, 2026 at 11:22:57AM -0700, Brian Ellis via B4 Relay wrote:
> From: Brian Ellis <brianellis@gotenna.com>
>
> ulpi_read_id() checks that the PHY's registers can be reached by writing
> ULPI_SCRATCH and reading it back.  If the write fails or the value does
> not come back, it falls back to OF matching and returns success, with
> nothing logged and ulpi->id left at 0000:0000.
>
> Commit ef6a7bcfb01c ("usb: ulpi: Support device discovery via DT") added
> that fallback for PHYs described in DT, which may not be powered yet when
> the ID is read.  For a PHY with no DT node it does nothing:
> of_request_module() returns -ENODEV for a NULL node, and ulpi_match() can
> only match a zero vendor ID through OF.  The PHY is never identified and
> nothing says why, so code that keys off ulpi->id, such as dwc3's USB3340
> detection, silently does not apply.
>
> Commit 8a7b31d545d3 ("usb: ulpi: defer ulpi_register on ulpi_read_id
> timeout") made the failed write an error for this reason.  It was
> reverted by commit b659b613cea2 ("Revert "usb: ulpi: defer
> ulpi_register on ulpi_read_id timeout"") because QEMU's Zynq machines,
> where this write times out, then could not boot from USB.  So keep the
> behaviour and only report it.
>
> We hit this on a ZynqMP board whose USB3340 takes its PLL supply from
> VBUS, so its ULPI clock only runs with a cable attached.  Booted without
> one, the scratch write times out, the PHY reads as 0000:0000, and dwc3
> never enables the USB3340 transceiver delay, all without a message.
>
> Warn when register access fails and there is no DT node to fall back on.
> PHYs described in DT, and PHYs whose registers work but report no vendor
> ID, stay silent as before.
>
> Signed-off-by: Brian Ellis <brianellis@gotenna.com>
> ---
> How this was tested: the failure was observed on our board, on AMD's
> 6.6-based vendor kernel, where an earlier version of this patch warned on
> every fallback and printed
>
>   dwc3 fe200000.usb: ULPI id read failed or unavailable (0000:0000); rely=
ing on OF match
>
> on a boot without a cable.  That version would also have warned for
> DT-described PHYs and for PHYs with no vendor ID, which is why it was
> narrowed to this one.  This version has not been run on hardware.  On
> usb-next it is compile-tested only (x86_64 allmodconfig, W=3D1, no
> warnings).
>
> On QEMU's Zynq machines, where the scratch write times out (see
> b659b613cea2), this prints one line at boot.  That is accurate there too:
> the PHY is not identified.
>
> Tool use: an LLM coding assistant (Claude) helped investigate this, wrote
> the code change, and drafted this changelog and these notes.  The
> observation above was made on our hardware.

Instead of adding this kind noise back, I would prefer to see a patch
that fixes the root problem. Do you know how is the PHY powered on on
this system?

The message is probable only useful for debugging. Maybe it should be
dev_dbg instead of dev_warn.

Thanks,

--
heikki
________________________________
The information contained in this e-mail and any attachments from Forterra =
may contain confidential and/or proprietary information, and is intended on=
ly for the named recipient to whom it was originally addressed. If you are =
not the intended recipient, any disclosure, distribution, or copying of thi=
s e-mail or its attachments is strictly prohibited. If you have received th=
is e-mail in error, please notify the sender immediately by return e-mail a=
nd permanently delete the e-mail and any attachments.
