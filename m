Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C1471254;
	Tue,  1 Sep 2026 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249778; cv=fail; b=Meh4leeK0oGEG0wrnrRObCNgzfz9vXtk8rRB1izwUb1K3dGPR8UeYOXqOrdJaFkkoPr9bmARWCD1h0fAdEmRVyIvA2/aWUeMSrdiCLO5d9bTDHuu16j2Yx7KQ60431X8TF7mPQT2cSEBhpMoUrmnMU3u5UgflebGUxYwnLwf4B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249778; c=relaxed/simple;
	bh=C5peRDzxCzFhGIv6UPgkgKl+qSuq4Pb6oSoqbasZy+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gk5H6lFAtBfOL2hn2nilrFc+XzFvn7q+VJkDQcyWJEnOnOlmDAMyPvqBqF3uW/Qq+JE3RXS3UpA+rw1lWcWcJbYtlIvQ5ETxB349wcLTsDAEbifzUh/h46RrMxXngD9cRGZ2b3MIJGhV7SE8lwgkQW5MS/ztj1sXyvj7tA0TB8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=USaqbKSw; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="USaqbKSw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGS7SD5eGt5q0vvb6txkVP2Ma1VvbNzll0A7PBvOgZZz3w/UaWsR9NNxTT5S/A6XnpnSSsXDUntrQtaR24n2t4ubh0Sj3G90En/k+bejaV9JD5XzOSUvFcSmvdntEZ9dCHf/EyCgDiHAz2+q1HhuOG1ty+Ag3+V3PRxHyw0k1xFfQ2nCa7I58P+tukx6WVYboNJ1CxN7F82/OfnQD/I3bTBcAx+fUgH7UfMiPCRvNoXK0y154FWbkMi+Ojb+av9853ls4nkKNYry2ooYUCtTGvKnau52dQCSaZMN9h2/n5Op2NQOo3PnYhQqr4DdeIL4rzZeuxB/dUu6MG1zNyG3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXkcpHwZuyiwHzWPNkF4HSa74rmlBAPJ/1Av/5KalY8=;
 b=WcQm52uWjXbwSsBNZ8GDceX8sLAx7+t4chB86t/Oll/4KDTophtl3eQCwJ/33tO8Y7VP3tol6QHT45+xztANO2QFuipdwRGs3BZaWnXNZKWDMaVIJ2OIGtWPO3L6Ny51wyxdI0TjW6VxObZjEzXuZ9D4GNH8ziH7WWzvosLAv6J/5rMftKMWTfLOt21T9pDlKIsLbwNJXQJcEB73yEnHqqJbPqbKyDjOThzHWJym2+Eq9QyDlFkjO5BOzMtfLZs4kF7hfADoagrAh6SRBWy8gfJ6tZADgmQuQTSQg4b9WrtgZuij75AwR8sA+BxJswrgqTO7Vbe6HB9vNSsmDTRumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.87) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXkcpHwZuyiwHzWPNkF4HSa74rmlBAPJ/1Av/5KalY8=;
 b=USaqbKSw9nWLhbffssfdekSvyndOCX/94FZXS8k9q8JSPPysHRLEWoxwHpuzm+GvfpWd1edgKnidV8YslNpfry3iu3pgAbLnSQZ7L+1pwY6Fr6hS6LcPOB3OUPLeQS7Y2lMFjsO3StZ6r7es/SVnlsxrsGllCSWLSi6C+l7z4QUav8aZP7nmFp0cD5CDFq3ZioyZIJWWg3MffRs41FlvEJcAXTXqOVM0N0ui4QBrRoTrLtNn6gLYxjSm7U+wCaHN6k4bc2f15uBkeLyb8T+irRL7YSbAcLYf3DXlcT9hXqGP7FzYKxNK6FiY1Psn8icTU/DpdqSaNBng6Y+g42DnBQ==
Received: from DB8PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:10:110::34)
 by PRAPR10MB5397.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:02:52 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::99) by DB8PR04CA0024.outlook.office365.com
 (2603:10a6:10:110::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 08:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.87)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.87; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.87) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:02:52 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 10:04:49 +0200
Received: from [10.48.86.251] (10.48.86.251) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 1 Sep
 2026 10:02:50 +0200
Message-ID: <ee0fe8e9-4166-4fd2-a872-d45ca7af0612@foss.st.com>
Date: Tue, 1 Sep 2026 10:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: gpio-sbu-mux: Add compatible for
 FUSB340
To: Xu Yang <xu.yang_2@oss.nxp.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, Marek Vasut
	<marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley
	<conor.dooley@microchip.com>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
 <20260826-usb-fusb340-v1-v3-1-11927682504d@foss.st.com>
 <c6pnde4lh44kwx6a45wtx7rsb7liam253disb7kg6e4brtqix6@3gcv4wmab5ag>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <c6pnde4lh44kwx6a45wtx7rsb7liam253disb7kg6e4brtqix6@3gcv4wmab5ag>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|PRAPR10MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: db5e0b3a-6dcd-4a5b-cc12-08df07ff6c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Cq/i3JpYSeCNBtiO9sf3FBDV1iBOinIXe/XN14qiJ8AONOUHqwPfdpflu3wuK89aG54SvPP/C/xg/M+ldF7e4FuY05xenoBKsn60Y+E3ihosMrUaSu0bXMsVFdC2YxyV3eT2DLI83VBTeUpnQ+Pxnaidl6B6nIPG01SOqPPsmAK3YG0S01CCsRf0uJYJzwe9F2JOKy+cXhDLOiBOBFI8iJkXi9F5qdS9LQGBvNApjqV5TeQXSpgT4kWBntVL2ot/3+/UBHWrJjUqkzuEjsZfFg0ToZC3jifRokPimFDrFSN2gUGmHNq8P+6FcCu8W/C5sJnOhKgVf+Zhpf67bJVewZK7Nrlv0jhdX+o0PiauqlvgktwgvvNLcPdbgzYSNgWpHYhnGmRa7Cr+PcccTvtMutF0ZQbRnEPdpyvE7QLicPuyU4tdH7KyUsCQscVcNKR9avDzP1AfI3veo8Vj8Vx4AnhoKe2Yqeo0mZELYVNscwysL1xGrrE+oi20Yas7E3wc+xG9vP6Vkkd7cggkJcIdUEnPWlCFlhN7Mm1pepcyUK0rRwlHKou6kAkgMBNWxKCwW+leH5sJKeWKQGO8QiB/vklyfhdeoTVxsEGXIiu7FTnfgI73p4Q7v98hauSzu+xoyrqczpgf5GAXmCf9Ft57thKwqbrIG0eYRuL3LQTzZ1cJ/4ueYuyWuGypXRyoPDs03THq0dshkYH/hjgm2BJllg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.87;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ET1olM3vPuheFHI14j1RmKV931qKsn10FrBg/p8/V7y8jNvJpyVPolHxyg3KMT2etvx5u19I/f/myf7B4iBjQEzwg7FPuWUCYqGDspKNypY6MKPukh6ptanBRBOJRiIh6uRWVykF/vfdeB5gKXWBlTY9rFHxUz09XZGIvpOU3gI4TxQ/wvFXtWzGHXu7yT/FsYephc+7C3VzIz8lP3pVpjvAVyziPdXhb+rMMqSDoKkCK/Uk7bEZ/FlzbTC2FHcTapD0QuVCdZViFPvwjF0RsX8rn5UgE7M2gpoW92F9Xn4CyV4RU1zSuzj/8G3N3qVC8Bd2z/wQOC/XB2ogOhEeNGOiMgc+pk906ZDhLDC9+th2d4Xjw1cz9kdlyVxJFvRijHI4w+PbcLCnz3h8n/2KXtjEDWGehaw8kQUbnQq7hppys9ivHb3CjJV78asb4BKN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:02:52.3105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db5e0b3a-6dcd-4a5b-cc12-08df07ff6c42
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.87];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5397

On 9/1/26 08:31, Xu Yang wrote:
> Hi Fabrice,
> 
> On Wed, Aug 26, 2026 at 02:16:35PM +0200, Fabrice Gasnier wrote:
>> Add a compatible for the FUSB340 GPIO-based 2:1 SuperSpeed switch
>> with enable-gpios and select-gpios controls. The switch can be used
>> in Type-C applications where a reversible cable requires a switch.
>>
>> Suggested-by: Marek Vasut <marex@nabladev.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
>> index 793662f6f3bf..c0e60848d8ab 100644
>> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
>> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
>> @@ -22,6 +22,7 @@ properties:
>>            - nxp,cbdtu02043
>>            - onnn,fsusb42
>>            - onnn,fsusb43l10x
>> +          - onnn,fusb340
>>            - pericom,pi3usb102
>>            - ti,tmuxhs4212
>>        - const: gpio-sbu-mux
> 
> To be honest, the added one is SuperSpeed Line switch. The gpio-sbu-mux.yaml
> describes SBU line here. They are different. Should another compatible name
> be created? Such as gpio-ss-mux or similar?

Hi Xu,

It is very similar to other parts supported here already (see tmuxhs4212
datasheet). I don't understand why another compatible would be created ?
And other properties in the bindings indicate the purpose, e.g.
mode-switch, orientation-switch.

BR,
Fabrice

> 
> Thanks,
> Xu Yang
> 
>>
>> -- 
>> 2.43.0
>>

