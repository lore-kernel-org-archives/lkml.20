Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A42938552C;
	Tue,  1 Sep 2026 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257441; cv=fail; b=OrNllt3Z65T6W8XK267Fs9OtpDjKZ8aHZxFU+3pS/ZDsogks0vUO+1d35EQ8gwdrzaix3sIjBcTEyRLlKkDISY3xCCzHIFAlIz7WT22t99uQ77CP5nGPHTrLtqJnDJkDm30R4SdTg9gomW9s1QSME077E5DN6Mc+399htKj58lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257441; c=relaxed/simple;
	bh=n+eFkOuagZg+XsClMn7Q2DF+pn6C2x+nzebWYKh8Nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vb+2+o5Jx9Z2Q8RGWR9FKPoz0cBnkWwbS3pfCkiNNn8wLKJFZLWq11Dym/kbQ/L7xdvtlwKjgkwcF4OChBzxO8hN4EcOr+Inc6IW0tf3hhu7X+oVe+zz2kfZA+n2iaT/epyMye8yutHkA9nk3rIUP0fmyTN89MXAGmz4YCWCLIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=diFhFm2B; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="diFhFm2B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3eAUkhXZg0ZDiL2LaWM/52eT3PEhE1R/PIXN+lRQHdCNgG+zdHct7p+V5mNvr6u7tjHHsLN6iwR9zEltEmFW+Bj1PNgrsTaWyNvC5S8E487XjLrNpr6+ixglzhetGlze+bgsKN/rdhB69I0Beu/Tsu4yBgI4seItqzZRjEVTLUiE8MISVEqZj0Cgzn9Xt3Bw+ggp1TWgIZJ4sG5EucyWy0lcGaZuv5DWRtw6La9af853v2ea+OW82qzC/14eu55ha/w2d/EzFDEZXsG4W0aw70d+h283qe4yea3ibU3qGxYLi17DNBG/PzlTVnzAtd9bC2h8FB90Gf79NWsN0pBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaLYft+hZe8DvccqpSsIB763kd79Vhmte55s+UNtV78=;
 b=OwEU3g7eiGCdnVsa0xRIORiUWCYwdKdTC1KlDnuY4vhVM8EtAnfVfPDyt+MRK77Ul7axjS/QsFpulZCPYXSJXGSwUSw+9pQclga445xCa5VvqelnZL0+rUckP9ZdPXxlixBYuKGIQP1/QPTeoZorNQvsGW3jLfo1TY7lKFDDMmaagZpqC9XsF7axa8ZNGMI6lkUo+/xj/lK0k9Aow4sybZVnrT/sWu41E9kxmclrVZclYsgUCHY5LpFJXTZ9HqDtg/Ip9gk6lGxtzaAH/hNEzfGce+0vx4chMdmWH18keySc5yqASb1+AhLxZYub2q8JJc9mGzur3b/ZgMDJ4CQOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaLYft+hZe8DvccqpSsIB763kd79Vhmte55s+UNtV78=;
 b=diFhFm2BhymQ5cZFim+/sIWkjeysUJnNAIqJX/nQFqfEeb6b7Mku4wpzXVHCz30qxrEskRhG3hzIwu4cfvVlDf+sifIKSDoH7dE4U1J3YvBVeyQGnfm2XVytAkGB+vW1AbtfShTtcDDvn+O0hex4imKJTanop9vYFrVfUQvCdrStAF18upqPki0io0uh+QGeLM+2VoYpNpCshNKt0XGeaz/VNgWfeq2wGaZenmSTY5ZEyd+vH/HMy3LZQVJL0ZBg93Ei49eIQ63vCuwPVOADeqOFuM794wCb2zMuTqoTsQl6w8nFn01Xcri684QTvcKYQSseMzj4rl09n1AadblhDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM0PR04MB7060.eurprd04.prod.outlook.com (2603:10a6:208:196::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 10:10:35 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 10:10:35 +0000
Date: Tue, 1 Sep 2026 18:08:20 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Marek Vasut <marex@nabladev.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: gpio-sbu-mux: Add compatible
 for FUSB340
Message-ID: <bolq4dmyzqrqumn7jwi67nllcaip3dvbnunxr3hq5hx63ox6f2@agywvachiwzn>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
 <20260826-usb-fusb340-v1-v3-1-11927682504d@foss.st.com>
 <c6pnde4lh44kwx6a45wtx7rsb7liam253disb7kg6e4brtqix6@3gcv4wmab5ag>
 <ee0fe8e9-4166-4fd2-a872-d45ca7af0612@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee0fe8e9-4166-4fd2-a872-d45ca7af0612@foss.st.com>
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM0PR04MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: d500aa73-3a86-4f97-17e7-08df081143ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|27256017;
X-Microsoft-Antispam-Message-Info:
	/3Jag+inC92JA4+GsmIxm4ALpJlRETZZ5/WCOpm/Vtbsrr1ZgcyTq4a2uOVGNHfFFdgMQMT4N+TbsTsV4KUtH1n2QC89rkqQBgcMeFB/VEHVuv50313jVl1Tr38hJv1plCmdHyBkyAnIWKcTRN3+OC3Id8uQduXXRn7tP2Ubvr48yZAjLH7oypTFu5U4moGxadbDb6aHHy70AQK21BpwPfpDEz0T2ZptxV/JEDr+74WaLnDKjlk+7f6WQRilqVQFx6iPdN/b4zDajmr4vdHkZ5cYcBP0eBGXkUKh0z4H80hoW82S4rOFn2u49keRu8X28bs+IhDZRDIVjUXw4CRW/3qQYLwACZsuj9pkLzonjZaKgEKCvyyDvO3JD0NjmFvKJJw1Tj0N3jPnDlw+1giEPCJz0MtmD1dfqAEzY1iOtCO7CtFvc60XTunWB6KcDUHKlZsLy3cFn7iP9ARUZLYmE0RZbBOYQv5FpIycNaddHfAamRhKhxAM7HtpYUslLtt2HrMA/NnhKU/RRU1EmH4B2Hy/lfif7PWd/okOxSbacKJEVW0j+oejuDdEXGPkGbzMjABtLi2vKHZ5ghhUlWe9wmR3IOvHoZFpzey/Mmk3JoYVH4xgfIxVcwF25UGK6z7mV5Odbh4SYHTqfqQHwrAlmsJDXtgNGFYkiZTNZc4oURWjUAX/MBgxOIsLYrqSx1c7BIiR4uXYBPxixp5DKAeMpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5yTnQ/sNfqWS+sxZig9rUOfIpij9vHYf64nps/zhcZR+Jmu/6aIx7Ie5o+EY?=
 =?us-ascii?Q?JKOOahoTSFEZ65G0OihCR1tPtVwmgVGEUoZt5pAV3VIGTL7c2CzjaMzWAYbc?=
 =?us-ascii?Q?tWamX23kDpzEvZSlze32MDwp7dxMG3IJegxLknd6qrAJ/fJOPTP6XHdU/hkT?=
 =?us-ascii?Q?/+O2Z+/AKM6RDIwt6NV4IgJgEPTK5mw/7HjF1zIV/ry1Zgoerj/l8clQrRFZ?=
 =?us-ascii?Q?Y4FB1Hhr1YVO/jwSXOALYzFbf1jj3XFyNurxXjvK5v8yp1JIdYhsBUrt5B/E?=
 =?us-ascii?Q?Nhne+8+HFP1rNqiNcOBGZkZJvdsNxU9KPYVbJKSNydnZiTr25pUIfno7Q7RB?=
 =?us-ascii?Q?2pIs6zi/bTwDxnajz3/4A/tQQYcOAR2Jgqkmf5LRMrnsvlm8H3NUR8DOQYiB?=
 =?us-ascii?Q?/Nr61nyoG5gp6n9XUykYNBwj0WiRels2CHzHhydWgnKthbgN5NzGWKQ+W+eZ?=
 =?us-ascii?Q?7oVhuZZRiFt5iSSAKDgpvkLxoZHZ1iCWgmDuILe+EtcO2wzONfIf3utw0Nk/?=
 =?us-ascii?Q?ENDIIqaQRHSdOECBjlY3/FCBnw/swcWXmrRbrI2/iGh33lspI0fIrtu1w3Pl?=
 =?us-ascii?Q?M3Aon2MHbQuff5WmvkUOGb1RwtNVklvwJkRywAfljcew0kSo5tjUYhBWlO8r?=
 =?us-ascii?Q?f3Kx7DwNoC1/YBOs9XtbFjBSOd5K0eyycI5j0p9q/uO3cVTinq1qG8+aIzq8?=
 =?us-ascii?Q?kO3wK0B3E81g9OPCyVyWNNQdHXctHMeLxHSADRNTYEn86dDAMmTjSWMkVs1e?=
 =?us-ascii?Q?UHrH8HmEClNh4XbL2ATEeNhnw2y07Ff0NdwGBhHMQ5BrAPI0MfM9miRmEHH5?=
 =?us-ascii?Q?8Ke156AAYXKu6wB5Q5eDuVytILtjN9azREKivX4vi5+jGHndit6FYoEWFK4u?=
 =?us-ascii?Q?HW+KnurBnzbMj2Tm6Zn6UHL03zeEE30s6nfVGIk6eJJfQ4zKHhlbvRsaFZ4P?=
 =?us-ascii?Q?yLtDkNdda/MvhH/VmsZkveRZnrlDvNpWsBj47k40Tp9QjHNZEo6POwbiXX1b?=
 =?us-ascii?Q?3d1TtWTdPRAutqLT4x+3tdRgUwBeHF3Jh+5Bc4VsXaL55r1cB9waBjOiPwca?=
 =?us-ascii?Q?tRraPkWA9Yak5MChRPWHcPz/9lvKPKBDW6weut/ZhqOVXTmHpCG6Xh4OhUw8?=
 =?us-ascii?Q?e2jrFcN7aKpH4Xg0LW78nVNBmRjNW6YEr0lfiUqCbkTpMx0bE1/HgLsTfUxh?=
 =?us-ascii?Q?67drrDsgAfFcjvgQ1rJVshpGqxqJ+eSmCM1SKqnw/5S5AWxz1xX17pXICZ3M?=
 =?us-ascii?Q?B6dGyvMraUSBet9eKamACOwGRG6BjyuBNxtIe5x0snF7C4ETS+EzrbWyeXsz?=
 =?us-ascii?Q?ozLxsapUSefDapjTmvl/IhtHXfhrMfPh0aRA7WG/hOwdEn3tM0I8SdjWArJl?=
 =?us-ascii?Q?7GkL/+cBLxAkrAt/kV+s6PRPmdiy7/XsmFh2b/pn09jhZL4Y9Rl7qICYg0xR?=
 =?us-ascii?Q?FJjYr4NBjopSInjUvyHJzOib8VU2UoJBsuJtBIkvwt25WO0knnsj4HQwrf46?=
 =?us-ascii?Q?GQokO+sba7EY7gztKaClQarNLn56flnZvRFRwXP6VnzglfkH4NTkAq1tuVFk?=
 =?us-ascii?Q?quu7dbpWSxpaZpqtS9kxMSXUFaEKrPcf/oMmaN1XwzA2PhNo2ha9WH58B9pt?=
 =?us-ascii?Q?2JQ4HXTj4mWKNnSun0pdPQJ/yGlcWr3Vqh8RkqYwQEaQ2u55UsqLXFBwxqGN?=
 =?us-ascii?Q?gIFn1zWKCVb3LjYBmAZJPbVZtS6T799PgGoxiSVZU+ruf8JH4sTWZ2Yz2uwd?=
 =?us-ascii?Q?J2p+RRegU+ApylBWDCG2vNpbT77uSzqxTcAtS+/BXgSQE7pHoOjD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d500aa73-3a86-4f97-17e7-08df081143ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 10:10:35.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcbNYpiMqH4GzlrZ5BXUWDQOjiurUdFmD1rNBSE8+hw4qpuDr34zhXKvLX92HjKRFtecbJv11+JCwM6NcDVq7kmnFQjEaz8TnnytAp2Wf/x9UI5e1YU4UVP1tsGlLmzt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7060

Hi Fabrice,

On Tue, Sep 01, 2026 at 10:02:50AM +0200, Fabrice Gasnier wrote:
> On 9/1/26 08:31, Xu Yang wrote:
> > Hi Fabrice,
> > 
> > On Wed, Aug 26, 2026 at 02:16:35PM +0200, Fabrice Gasnier wrote:
> >> Add a compatible for the FUSB340 GPIO-based 2:1 SuperSpeed switch
> >> with enable-gpios and select-gpios controls. The switch can be used
> >> in Type-C applications where a reversible cable requires a switch.
> >>
> >> Suggested-by: Marek Vasut <marex@nabladev.com>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >> ---
> >>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> >> index 793662f6f3bf..c0e60848d8ab 100644
> >> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> >> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> >> @@ -22,6 +22,7 @@ properties:
> >>            - nxp,cbdtu02043
> >>            - onnn,fsusb42
> >>            - onnn,fsusb43l10x
> >> +          - onnn,fusb340
> >>            - pericom,pi3usb102
> >>            - ti,tmuxhs4212
> >>        - const: gpio-sbu-mux
> > 
> > To be honest, the added one is SuperSpeed Line switch. The gpio-sbu-mux.yaml
> > describes SBU line here. They are different. Should another compatible name
> > be created? Such as gpio-ss-mux or similar?
> 
> Hi Xu,
> 
> It is very similar to other parts supported here already (see tmuxhs4212
> datasheet). I don't understand why another compatible would be created ?
> And other properties in the bindings indicate the purpose, e.g.
> mode-switch, orientation-switch.

I suspect tmuxhs4212 intentionally misused "gpio-sbu-mux" as SuperSpeed switch.
Commit 06f49cc255b3 said it's used for SBU lines switching, but actually their
DTBs use it for SuperSpeed lines switching. It's not correct and would confuse
users.

Thanks,
Xu Yang

> 
> BR,
> Fabrice
> 
> > 
> > Thanks,
> > Xu Yang
> > 
> >>
> >> -- 
> >> 2.43.0
> >>
> 
