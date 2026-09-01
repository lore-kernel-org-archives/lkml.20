Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F033396585;
	Tue,  1 Sep 2026 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244443; cv=fail; b=DUmyfNZVen81R397eNpwvYebVaTfBjxaIUZRBck136cWQyZbxeuT6KakYBF7Xi1Zwg337+xJB0yir4IU06unAKndckHhvvZ4YkVhB4DeUqfBSlgmYNhl6F7Kdmq1+6heSVqgMgq6YTqLPNDB9E4UlwOeGZEtJy3jqRmiWQ2Fl/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244443; c=relaxed/simple;
	bh=vKCOPxE2ty9MXDtGQxZGNYw45W65EvELiZLeRl9LpLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FLXlqtja/elcoLBF1vceZN+J+uAVVCRhstlTCYYRqdTV++yhD1aXnC0BvaxEywfoA72MxJWX+lAPgT2HfMhMMRglN7dyub+milQsk7I1tygPrIIS/KsenQ5KlY1xgwaF7oc0KXoYTGOarQBw/l4W8OepmBSeHjlW81KvfkE480s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nqtJB9OR; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nqtJB9OR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZmaR2tqNCHrmsyn006sC3jL47A/MENPcMFyxrr4N8EDuF+r96qGi9zmDwvZ0o6NqikJUYCQ/H7g9m2APiyRy5Whn7+05llNyxazW9RpkyCTA4ivZFtkJrlFAZxN1hKRqmKWUWcyIemMrgZG12tqgexiWxdBN68rvd/W1miq5B49Oljzpw0+JdoB0ALgS4IQ2MrrZTJABhYWADmpRY+Acn0Kyjl8/J1+VB0s2HQKSuDytYcVr+YbJbkHJzKUJU+mOjzQaewZbBmX3kiNxzKZGAQFINpIE0xVJsU+NoINuO6otSzho8bxWQJ9WTMiOWvpW0S35aQFT0MQMCVBgi+OQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA/kx+ZTBTA+PpHw3I8ZiGKY6ai5JiAlxWTzE1T6fsQ=;
 b=kGuyb4KhuTZvVIAEph0ucFJ7stmTzBYmbfdyLeFydW4yCBHjn63s1bPENNkb96lTZyurDXWn88RdyClkgXk4ACJbDhqGxUhA7fMfeqXkh24xygdxQ7PmZv34NeqO+RfQW4dI7F0DKzenj0oTxmp8xrvXvC24qZUP/O1JGt4RBfUn3VOV0hPdDQ9RobrwjCVvqKXsXk4trhWfZjP6e6s5RnISqjZO0RjN9jTjJterRtNFWohpjS7LF/BIpn2IrK+M6q7QtmL2VabU3XcDuQhFrrsZqO/nVNy8uEH5Tp0AtQzpjPtQy+AV7kMaVlSIe51Y543uKPze7WrHZ2z/qmKN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fA/kx+ZTBTA+PpHw3I8ZiGKY6ai5JiAlxWTzE1T6fsQ=;
 b=nqtJB9ORp3KKUc5l4P8f3KXGmFd0oN3+dDnQ4t368cMxsuAtOazbxJFtru9nreaUrMOWyN4nOxwNoVURVc2J6TsIo59HdQqJueLjQeeCJ/F9sQCiQ9Bm/EZ1iTOuH8D/uok9wrE+v5jSDNzwsSYDgfeRKNaOsIA53QdtBV76bYMT4l51Hnri5nxxMnxiirLccIZCXYo9a0MoxbnTj1SNJunQLwRIqJvDT6E8pBgfLoGYH11t8H3oSL70KI2W3mlMZJAxlttNLQxULJPRt8XDPlcKuMIaVfOWcc5wQ61C7vC90j2pg20cgk59MTxG54Ya/wznIK97nyMZ2XpPJE7sFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA1PR04MB11508.eurprd04.prod.outlook.com (2603:10a6:102:4e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:33:58 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:33:58 +0000
Date: Tue, 1 Sep 2026 14:31:42 +0800
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
Message-ID: <c6pnde4lh44kwx6a45wtx7rsb7liam253disb7kg6e4brtqix6@3gcv4wmab5ag>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
 <20260826-usb-fusb340-v1-v3-1-11927682504d@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-usb-fusb340-v1-v3-1-11927682504d@foss.st.com>
X-ClientProxiedBy: AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::13) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA1PR04MB11508:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfa0c5c-3c5a-4ad8-4dd5-08df07f300bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	X9uxglgZU1qsYNXYM79R2fZELHlWzx5StkX64NXNFvi3SGAhVoox75IGHHzMRtsgOYjbOCBfvKaZfQ7+z92dGiochiSnfuSwKU+UqT9IdMvL+XGA9U8IA88PigJ8sPQkcdNRejuAnvTBZCeBENxL+mGFuncBvvoTQK8bA64trkdA44CUd8xUhqdzCq4149cocNv/rZU33eN4iqng5VieOj94W5YgnSvJ+O90IH8axYKGtMpmbClMiCbYM1w0nhzT5VoDuAwyzJRM4UjVK3kwkGyO3DqjXNov6r8N6BoGTwmWIVDolJkH1h6GBkEzAe1iDnLcTSXmi1D6Vl350wYgjQzdUULiYoPvirH9uETxcCJdPNdqz1z0tpWFcpKRy7blrmz5iF47VSCu9T4TTNS4jfXyqvUjCy8ojsx4ObO5db9x68zygypeXGWYiuTHIfYHYXtiuKKslrn07p5jX+DTtGdOw68lguUr7Re7flUgFR539XydZlTeRe9PP9OplXfsMTVkKlNaNkT5yQPktD1MmJ2ab9oBkml6rqzs6R/LjOfO8AOh4FJ0u7U8SnRw1lClP5Aj9kcS5lB6YAWJzG2PAsY6ZbP89zRaSAofulGL5i2op83A/+VqozDirNuKVlDdp/5gtWQjc134hiCsAfX8IaOC+snLakyjRE0F4/O1drc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yosMF5ajTLZH0PE5G67stStU7qfqiySL/HBIlJ5E+Hj9oWFMLYsjKA40hO62?=
 =?us-ascii?Q?MEzVBgfP4fodWBAer203iBRs6SST304W3touBY5BTgUo9wBnhKBaugY2GeTQ?=
 =?us-ascii?Q?GM6dmxK9a75z6DRbVAujSTD/m4i5O1oWyaTLXAZgZHb9Dz7373qPMVCrwI7N?=
 =?us-ascii?Q?iB/BQN/isD+9n4TahDvgiYygHFp65flH33+J0o5PaXabAlZjTBP4bhbgQ/GK?=
 =?us-ascii?Q?Sibl7zBEwashHjGe/hgxFbHCWo8mi9yObivBgI3VYrbS+wb4X5mFRnOMUxs/?=
 =?us-ascii?Q?rlKyhUxuSxiJkb2DDhVfTWbpXOeDG7+xGushIo9LsFsoflUNKhhMZV9XsUMh?=
 =?us-ascii?Q?kP+MhQ5TfvTf6gdELyS9X1flNmRAHf6zkGLK4oya+YF4OZYh+yBXWuay8dy/?=
 =?us-ascii?Q?86fE98HGr3SqMzrFfA0/b+QDgzMXyi+jU4MTmamoDoqh/xFJvzppCEOZiTiP?=
 =?us-ascii?Q?NXIINgB5ArFMvgOnbHR+3YyVMSiuOHwA01iTrmt7hIkzDcrcFdk/gpx6VuP/?=
 =?us-ascii?Q?qBjSWeCTqceJnq4qVl8ujx98Zca3O8iPLJ0fQuPEaolWiGh7kR1dvVlEdQzx?=
 =?us-ascii?Q?aNrjsyZjYu127xX9aseMGOCm1RoZ3a74fUxVv/X7o366rJYRnuXQc9lruJWc?=
 =?us-ascii?Q?eozLI9FMKFWOOppYg6pfmHjOn05SL8n4kB+r/IbVLUtUwGFRGRGHHqgOqahv?=
 =?us-ascii?Q?Kn4oOgAbg6fCro+exopybFWRGGs+zk6N2zq/aDHRb+tsa74pC2zkwIsS01pF?=
 =?us-ascii?Q?jwEQxd1S64axW3qOJ+Z335BPFYqWrE5v0rlBMI5RRABZmY6y2su+wyT5sNLZ?=
 =?us-ascii?Q?JehpX8pg6WWlbMl+MidyOUo+SJIGQ4iWsg/gGKCbLzjvpXp3dYXvVJYtyCRd?=
 =?us-ascii?Q?yaDR0SWpH9y/tIGw4Zn+OLw9NjLz2kZHw/oU9HLFHd8cUZhI/4HKcwRoE1LO?=
 =?us-ascii?Q?N+Dq6eW3EMMVcVik0H15YlepIcS/GTRnR8HMiHbYzygEAxsAC1k9sAx0Hn2e?=
 =?us-ascii?Q?x6VLn6J+NAMYcFDy7zBfgLh1GTzHwWa5KTJtR6T3XA54vkEPzLyjV8TQrXBR?=
 =?us-ascii?Q?jZ+yjMGPFgizEA1j27X0gxEZxoJ36g14rcM2FXXNbE0P+seLur8owf1jipiw?=
 =?us-ascii?Q?h9OrFf3FUrNIULrti3TYMBrSReY72rs8iG6H6Sdhj9C6XeApXn+hbYqZ6YZn?=
 =?us-ascii?Q?r+BgFagQP3iC+snJfgd29jgWyv/JHfiykz8sHvTUBbA+zq4A4oM4gedWpqq1?=
 =?us-ascii?Q?LBvm8JHJ1mNxQZdE+M2gMFgLM5h8+6oszpiD+jrNfGLQCQUbQUtNwMdmlbtL?=
 =?us-ascii?Q?8rf8UBhDat8z3jmjSbxuGTKvALpnPzmExcl+SNDlrqhtcriWUYVBMGXO85g3?=
 =?us-ascii?Q?IHZeFO3mmUQuT+3ma9riUwt2cdmODkr3e0XRYtFQsNyFbZ+iiB+lI2III+V4?=
 =?us-ascii?Q?h0dRbnvj6jSks2N0QtY431aVxNp7iELY5AkGBrdOxx8gKIIb3R50ITiNfK7t?=
 =?us-ascii?Q?GwNCzKNy5oQXoVah4p8nOTwE203XM7NfnID5D+JVn6hA9HiEtaq+lNqfCOzT?=
 =?us-ascii?Q?2JR2eiWcb2SOdelKCxve0/Lw734pcPte8v85/k2LwiFOn/sXgYTxO8KH7aH3?=
 =?us-ascii?Q?cGFMSLJMYJXqPKs6K3NMH3pKKMLxHZWQGkaNG1KUbWxZt7Hagt2ShFdi4EOV?=
 =?us-ascii?Q?4xpKgHfhGk8ziYVD9eqJvW3m6pzg9vhv9hTlBgXbFgig8wdqgkV2kHSWSCxy?=
 =?us-ascii?Q?AuFlHLh6rgpdSIKmiCdTPuQYBEYRyzyLFejLw3yhmj/rfhm53ThK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfa0c5c-3c5a-4ad8-4dd5-08df07f300bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:33:58.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rf+A6CYMtWpJer6/q1p8Ju932WZUs/KXOWRZ5cDZvoHIPIXnPfGIwQwfMITzveXk9hAxZ5pAepuw8krIt6uSmnJ5UhNqP4yEbLmUwFMl6Y4sv7G0cfmuP9dPVUGp3lSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11508

Hi Fabrice,

On Wed, Aug 26, 2026 at 02:16:35PM +0200, Fabrice Gasnier wrote:
> Add a compatible for the FUSB340 GPIO-based 2:1 SuperSpeed switch
> with enable-gpios and select-gpios controls. The switch can be used
> in Type-C applications where a reversible cable requires a switch.
> 
> Suggested-by: Marek Vasut <marex@nabladev.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index 793662f6f3bf..c0e60848d8ab 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -22,6 +22,7 @@ properties:
>            - nxp,cbdtu02043
>            - onnn,fsusb42
>            - onnn,fsusb43l10x
> +          - onnn,fusb340
>            - pericom,pi3usb102
>            - ti,tmuxhs4212
>        - const: gpio-sbu-mux

To be honest, the added one is SuperSpeed Line switch. The gpio-sbu-mux.yaml
describes SBU line here. They are different. Should another compatible name
be created? Such as gpio-ss-mux or similar?

Thanks,
Xu Yang

> 
> -- 
> 2.43.0
> 
