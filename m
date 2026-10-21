Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.130.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792595610;
	b=CI9WpEo0w4cLRExQuhph5tisJk7P3vXVB4lpmxfUmMIww1Ch9f8rUGyYgdfZ7Qv3NVfx
	 KJ2Uqz9N4NLK/UVzwM9WsGOG8pvKFOkgu8Bo1OlppS3iypJXzpjQabshikAbUQ7YpzX00
	 E3AQY1ebsdQrCORufDnD7XwGo/fMWy8LhVF4/5Kfi/Q5qNjOKhxJmQBcTK1SPwkwMgy28
	 I7bnOR/BsrqkCsCXutMV31dpoZ4NDMsMKwuzqukWi0BSpGOs2oVY6+aJ4MQ+FkqGTTYuq
	 VJRZ19BCESsQukaByfEdjMVRGDuKOrrJKY4gq5Er2Gf0V+G7becM5SZkRrPbIT5cBWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595610;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=odMaY2Gms37qpDgxW6ylotNHMv8j5eQF7fLRxIXxVlw=;
	b=g1ZoDZTmukfH0W2uaX3HXXwfKVn+HIgX+X/fPSTLmH1yzKTNrATIjFOdKGujrtuQ/N5K
	 XLNu+MtRnKP5UdRi1G3YMSNLUzdKcRp7khorCwHStUoKNa9ttFg6lLPnLO1LKv0KkVfRy
	 6KEdpj2imMIccj2Omd1/ewcxy+qexZNigWHw+P/cyOpy+vBH1BKyf/dnRm+2V4w7R4jqS
	 KOUkZ+KNHsz5RCbKVEWP/G9turUWSH8aMfesod60ZbtBBUvVUvb3IQd+IyJfbODTDQjys
	 DygADKM8Jy3MyZU7XqufqJ8TkuIXx9k6ANNQXYpt/LdDcpX1b9looXHbJhj1YgsazLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="dGfWP/SA";
	arc=fail smtp.remote-ip=40.107.130.24
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD3606A31B;
	Wed, 21 Oct 2026 15:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBD3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dGfWP/SA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytqV+2F6DCU04fW7c5iDqu2+BkC3yooyNXK5m4Fo334DdJEfp1lltfqPEg+4wuANeA0kAND2dmr7U+0KeJU6R1B2L5clVJtKO5JpgcJGlIjaIfldqCypnVx2esSyGgZBDO0SgNzYH+POpoG4dunjNyzhv34Q3hmc0rbf/HyFXzHECnP8kOAm+GNEEaGQtGBHHIrJYPue2ULUqsLyhnrzxbWglludeiMPJGZ0Mv97emCJ84Jdk2Beln5hR42if6Y36PNR52zeCzyvQI3Osh6vM/BT6S4QYHR8iv+o7E1h7grfidp43HmXs3L+uh5uVxuUBXDuEjeuV4r+QE3tzupxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abjGfPqx8oEOSIfyEQCbhhui2HFs6zqba+YSmadz20s=;
 b=lSiymfKegKw/HN0kGtZgIiXW/22cSiBSEHu4ASl/7nxTK71Ngp0bg1v/OvWx8z79L+o4fHvVPQt/l82eKD4EiBJTT8QPuf7iNjvo9kWzEyjX1TP5ffiMHohf698Gplns0FSswSUDu8r9tkWKPbhYJY+wwBRFyVABrSUsQ7OSB7nLxDPEq486paABYrlna5HAi7BgO7iO+u+MR2EyijOBkjv0xyPGmIy7LIIJoyLJJQZgZ9xpIVKyh+sp1nWGc3OS/bf6Nilp5QU5VW4Klw1G8BhNOKyIoHp+lk3U50fIvb6kw6mbDmxSdBH+fIYjK3KZFbrkkbS454uqsksrsjI3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abjGfPqx8oEOSIfyEQCbhhui2HFs6zqba+YSmadz20s=;
 b=dGfWP/SAFHLSPdALiJrm0ldG0QpjF8V9axVcXB4shWp8DUEfFn/l8Ou4b6WnLdmw9FnV4XEOnxWMpiNHJGRLhOwmbCGp7hCU+aViK6QXZkQTgsVF182ygsc3VxUKqff4gGMXiiB569rRLD4T8cZOwYjTZ8/cpLqutBZG5IIrMuTxabCTlYBJkBcHawkZtF5URGapyqIm0dHVnTIRnahikVXLBeyx37IEKrCDSq1TueExpkdXp1nbfJST87+1QJQhxA6tX2prEgqhIljRs0R4qMu8UKjwEtOCtj9P33P8ZF1kfUx1IqRekJIlq/Kx99vW9H7y7CbrKQxFg7QNmeyyZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DUYPR04MB12692.eurprd04.prod.outlook.com (2603:10a6:10:65d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Wed, 21 Oct
 2026 15:13:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 15:13:26 +0000
Date: Wed, 21 Oct 2026 10:13:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Michal Simek <michal.simek@amd.com>
Cc: "Patil, Shubham Sanjay" <shubpati@amd.com>,
	Rob Herring <robh@kernel.org>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <atjWjd2sRy1P5HmR@SMW015318>
References: <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud>
 <arL_Zgi1r1IFpNIO@SMW015318>
 <20260923-overturn-acts-5abc2e4fe6ed@spud>
 <arPlFMhcL7Jxh4wP@SMW015318>
 <8547c8c6-502f-4dca-a82f-893a5568f7d6@amd.com>
 <c1c4d983-795d-4fba-84f5-7bd62246df02@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1c4d983-795d-4fba-84f5-7bd62246df02@amd.com>
X-ClientProxiedBy: PH8PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:510:23c::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DUYPR04MB12692:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d019fc-a252-419d-c414-08df2f85db1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|56012099006|11063799006|4143699003|261009223027099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gKgE6f6kNNDKHe2iOGUGArBebY8xSQyvF+p7iWDqPnwV4yryUEtDMIY3NJeY1nG29i9KXcAJu4etACUd2EieevKy2/9oJc231vPb7zPNYiFm6RCT2darhcdTxj+p7Dks3wtFMu1pQHtf8JkQE0lCsznj6kLinoXOfz52JDiEfge0KGEvAt0kj+X7gNKs294HcgQPJLUdQ0B+3gl9dnRKzqhdnUKbBL7ZFSrHGFuJw3xgTmXbrZvX28qBdinmi9lhQP+9NViAuQcq9NCCViNHg1jg9AvxkQ5jP6NBMFlDk2FqdWY9XFoOB6mzeyUv+IDz29Hy5qHRQgvir85xX1uYFaWZHlpQDlw0i4nI01CR/4ipkzCe8c6wI8aMqQGNgD4q7tw1uhdeqxCX+k8WC1YFP6wtKo4Xh0x927bZBMZ8pAFRsSJTS3Rs9Tr3PnTZER6rTDUAgmnytEjeGMcV7bW+P6uJxwz3BnAtXNtkS06qXTPaKqQ1stZr/1413sGQdI1W3Bt0vpUI5xmECsNLznFbvGWdrq1SZAB+lnamU8JX57vP9x8APaRR00058TkOSIXxhi47OlfLgZVFepTLiXwvxrI+3tpQeApp4enqjgQI3i4NKCCHqG8VX/Pv9tg27kESnrSO4vdbhrhoh6UsiWCx0Dn4YQYSA4ZWDpTow7gZ0YA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(11063799006)(4143699003)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?CujNQmPSzqk1P5SIPSbR9aZdGU7+NmX4X+jGKRPvzboijRHnp4RiLuyj6f?=
 =?iso-8859-1?Q?Mc0+0PuCA9hMCkyvVZ+U3XubeJalK4RgkfqqdadOXMANFMGybMUgddCJmk?=
 =?iso-8859-1?Q?BL1IaUi4Wq2TmExRBhab9eIFiXGrUFwWh3OUsJrca5cKEYxtDv29QnrCX6?=
 =?iso-8859-1?Q?6RbueXY/mUy8Xuv/dt8WlkAPgDY1kUrtNNiLkXdooXAbYZdqTcnH/HHIf1?=
 =?iso-8859-1?Q?2+ywZxd/nHlSRohR0PbVW0rTFdF1j5gR7DzaJJ4IOkpZxUo94l0OwuQIu2?=
 =?iso-8859-1?Q?K44+ihOGoaHJvU8Hk2KJPcn/yKfM/qneJ0F/0Quq7R+9VE40gSq0GGZ8fi?=
 =?iso-8859-1?Q?QPGd36ITsjPKeWV5YGDoU0cbA5eY8d3M2rNlU6izkLEYFgbTRdsnBgLVwr?=
 =?iso-8859-1?Q?cZiO4/tvHSLj9i/17Cx0i3RJtFuws3RX8VcijLEnmEHXbCPERTqXJqVymp?=
 =?iso-8859-1?Q?mfvu/QvKhhh7m7ryZGKynRcKzvL2RcFr46sK5H4cPXFbj8hPLIshmN8EeN?=
 =?iso-8859-1?Q?Sa7afQr/VHW0ID3RqORc/pgueMvrx8MN5ECNKJbcKBYCi9VqSc8mt9Wy5l?=
 =?iso-8859-1?Q?zPM1ouKzrW522aMLvAETPtPZq+5CPXRlkeC5Yk3cy6XNXYChRvaI+lbm3O?=
 =?iso-8859-1?Q?/uQvU/9wUhkWFgVFoXdXgneYM9JO2/AL7E1Rj2yqMnUa6G1/n5xFw8lLIC?=
 =?iso-8859-1?Q?AqdYNEesuD4MDAN/4IY9IqHXi/LnDuW9st4oag70BNwLJx56uJBpbQB5AK?=
 =?iso-8859-1?Q?cv2INbwFoJV/ITysUWY+kvpDXLtDct2/zpLQ86N2xqdgcqYFcDQljw8A0W?=
 =?iso-8859-1?Q?jfj7DHihrjancN/kEmCe58fBXmJBgyg0JaXgxBbPmYsNw6lhh8c5YHboCA?=
 =?iso-8859-1?Q?n0iEK2J/Z4IibsX7b9x/y4scrNOr0BjKlJtEwr8FRfYPyWLejIAMVKwkNL?=
 =?iso-8859-1?Q?N2iOgvzC8mjfaQWk5NHLSZpHSdAPOuGPMgrOapF765YfEEf4j1tCuzhBut?=
 =?iso-8859-1?Q?D7ucKtMAeU9nDJE/ZQtg546lUvtpuGHHj+HRfTbzIEahaKm4vR8jS99RkQ?=
 =?iso-8859-1?Q?J6rsz3SrYfNfm1+6nKYCPTvA8/IFGPnIPKI07jTKejXBk+p/E7FoUPFH8v?=
 =?iso-8859-1?Q?uD9Wp0m9oGV/SdxW00vSJIPZs3HmD2Yt1yUzU94nvORAb1UUOzwp+b1al8?=
 =?iso-8859-1?Q?tFESXp1w4XyknoI10yipECa57Z2lcMdLQto8bg6RrA6J7nqEm0utNYf1a5?=
 =?iso-8859-1?Q?Kv08/zch77UK024u12h/c8DozzhHgkNqiHAS/PfVijgsld4LQ/OQdgUEqW?=
 =?iso-8859-1?Q?KuzdE01v9zPA+6QtmJSlZPbw8xCgnD66qs+KoNCNMSxYZ+iCLUtuWuCOWd?=
 =?iso-8859-1?Q?HnoAN6FwMP1KhVRD7aNuFvL0SIjTViPP8XpGqRWGKsEvqL+1PSv0XdBsn7?=
 =?iso-8859-1?Q?pS8/68+THROJxEa1aZb3Mx9xt2zjSyWMshlLbLuJ+kBcB16RMWUmNRNU9k?=
 =?iso-8859-1?Q?6Kaq60p5rxtxsFt1wKGcQoPuFkhTVuDV6x3buObHL3Z1C3KuUwkTjw+2Pv?=
 =?iso-8859-1?Q?hCMVyOtAzZsB0hOMHoS96VUSsGCFVbUTk87CcECWN/xSXaYq4bg4J8NRZ1?=
 =?iso-8859-1?Q?Yo/uTw2fQwMMw2R5S8iBxrvilAnX32RGle4EElYH9ZqQLrHBnqWXF6+qK3?=
 =?iso-8859-1?Q?YUXnx74uS1q0V5fhK2o/j8m20A6HZh5jwtgXQ64KsOWvcjcrHSE5YhU8+a?=
 =?iso-8859-1?Q?uKeXFG1MCH/lq9BbB21ne35B6cMOTfF3KdWs0bcfm8073693oyZzzseHaB?=
 =?iso-8859-1?Q?X/YuSGEOftaLtSgomk3X/v8AtHRE43qiKjpSaACbLs8H86E/GL1H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d019fc-a252-419d-c414-08df2f85db1e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:13:26.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTzV1qXyUJlRmdDk62uJWMC2iW0hD9E9mQMsp1zyK6DnGFj6B3JyLERszjDokdKLtD83TuSEdfAsBDC7VYR6ZjErF6B1eBa4u75yJcdkUexNPoVlRFXoC3egXWZsFy9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12692

On Wed, Oct 21, 2026 at 09:06:50AM +0200, Michal Simek wrote:
> Hi Rob,
>
> On 10/7/26 08:03, Patil, Shubham Sanjay wrote:
> > Hi Rob, Just a reminder !
>
> <snip>
>
> > > > > > > No reason to keep hj because the difference between HJ and IBI is the
> > > > > > > address when address arbitration. If hardware support IBI, it should support
> > > > > > > HJ. HJ just use special address 0x2.
> > > > > >
> > > > > > For this IP, they appear to be controlled by different configuration time
> > > > > > parameters, so I don't think conflating the two is the right thing to do
> > > > > > here:
> > > > > > https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
> > > > > > Per this doc, and the original commit, hotjoin configuration is not
> > > > > > permitted when ibi is not supported but can be enabled and disabled
> > > > > > separately when it is.
> > > > >
> > > > > I am not sure why provide such flexiblity, only difference is that compare
> > > > > address 2 or other value.
> > > >
> > > > It's not unusual for FPGA IPs to provide extreme flexibility so that the
> > > > consumption of resources can be kept to a minimum, often to the point of
> > > > excessiveness. E.g. for a ethernet MAC IP each individual statistic might
> > > > have a configuration option.
> > > >
> > > > >
> > > > > This feature may be quite common for i3c, if other soft IP provider such
> > > > > flexiblity, still common property is the better than vendor specific one.
> > > >
> > > > I'm not at all in favour of speculatively adding properties for
> > > > configuration properties of FPGA IPs, particularly given the likelihood
> > > > of abuse by others. Without multiple demonstrated users, things shouldn't
> > > > be considered for being made common anyway.
> > >
> > > Rob:
> > >          What's your opinion? I predict we will met similar problem when
> > > I3C become popluar.
> > >          Do you perfer use vendor property fistly or direct add common
> > > property?
> > >          There will be back compatible problem if change vendor property to
> > > common property.
> > >
> > > Frank
>
> It looks like this thread is stuck and everybody is waiting for your opinion
> about it. Can you please take a look when you have time?

I suggest make a version, which support all enable/disable IBI/HJ. We can
discuss later. I think less possible to config two difference instance at
one SoC.

Frank

>
> Thanks,
> Michal
>
