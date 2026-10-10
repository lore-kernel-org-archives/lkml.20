Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012016.outbound.protection.outlook.com [52.103.11.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA8453A33;
	Sat, 10 Oct 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625472; cv=fail; b=dCgqnlP0iquVNDQVr7E7RCU0yk/msvcSYfP1u8tcMtZt3FJG9K5/JUiDZyVMWcILFAuKewvRVGn5aTOuaAfQJh9+BTrye3TMuV20yOE8dYFTRAAUZeBEMUX+MMNXnflR1w4nb8ICuV7sBckd3XURRuDbUVXLjQK1XotG2eRGW6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625472; c=relaxed/simple;
	bh=naNTcpaj6mdGSNnT3KGGz/4DO1vVGcSTWYSLztnnVIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MpJJsA6pTl9RWzJ+EeujPMbiKA451bVHqJezIcOb6minjr4tbMcb9x8gyIH8Zg71xIvHEaYZgjtwss3oyXdy66FWFAHK3cQwM3Gfs2RTKltFWMNbBsMwS9PaOxr4cUmL2ctNVRdVucOMM7GQIgXpmavSQ2Whyd1YBgIwEaemC3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=MqGULQ2N; arc=fail smtp.client-ip=52.103.11.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="MqGULQ2N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/NKOpAyxu1Qe8XF+pcfAJM7k17IC7U/RX6MYJuRQuqG7FMlTBqtpT4Vm47JQGaL8kGbkB6ZTSZaXoXZNV6kD7cbom94huwMP/d5NPN+i7TE4H72MJf2IyZUWsSR+ux7b6WyUst5Bkx344zEHanLol9i625/R1TS08BiZVuOGmkwnFzHEs/MTDGOcl00jHfwUuLLeTdFhFit83xa6fAYXja3vwhSKbFNepj1w3C8eXKCRbhzst5mFaof9PircnYenZPWHu27DnoJWetw3T0HMotLMEjWdaCznddaoglaEry6sZoB3inB4r37xyUcpzGHi+omShQ1abhrXpcqC6VvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naNTcpaj6mdGSNnT3KGGz/4DO1vVGcSTWYSLztnnVIQ=;
 b=FCXsMzOQTc/ph/bJMJRbmu6dU+1Qc9DAvw19F2nMAI+Ch3VHA+8+hCGmYXtL0+IqKEDKEn56+B256DN7WV2Mlsl4FAL1V44TM5tqSEFQ0do4YZTxneO6gZAyqij2Za9bXOfhGEx8DA5QVghBVyKrkjNr0Msa7Akhb9F1nRMPfTJss4Bvw4HL8PbAdXT4/eDe8mzcCw3Lo7OoBXzDn+0PvzfGyx4WkQNf7hXp+vCEpWChOGxsHSm3cRoFayQ6Uhh3icoOss/16/vQrGx4SiwtoHPij9IAOB3vQf9Ao22smV1Gmk5tV97fKqBjVJxRIDCG0dQASU639r1zVNwvO1MxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naNTcpaj6mdGSNnT3KGGz/4DO1vVGcSTWYSLztnnVIQ=;
 b=MqGULQ2NOk2mkKIZe2mRE4Aos/gwA/z6foMx5BWWFU/N5EI+sYd0sE2jYP0mAqVjbCXBV+ucjewsV/9b7o/2ox9lDbDaSmclXtTkNk64zNra1ouxGO4+sjYRG/Ctylyx/6KnlOfDHJbQbgBuHPPkIUU1giAt9QQGn9WuHf1D/da7+of01tMnXXKrpXrNlwtvW1C5LD8Zri3RJKhBB6Q9RgBXNQdSDuU0508i9FsD+w+yM8czOCpLzoY3o5QbYetwC/NypdOdY1m6IjFYoPPB7YnMkj/gtdwo8NtfuearqEllsmcsK9k2OIQ0NLeBe5GJ4R0ss5vTXe2gB6D92uMhSw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by IA3PR19MB911919.namprd19.prod.outlook.com (2603:10b6:208:70c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Sat, 10 Oct
 2026 09:44:28 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 09:44:27 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: tiwai@suse.com
Cc: marco_giunta@outlook.it,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/scodec: imply SERIAL_MULTI_INSTANTIATE for AW88399
Date: Sat, 10 Oct 2026 11:44:18 +0200
Message-ID:
 <SN6PR19MB2303021FB731E4B20F2283B1FC912@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SN6PR19MB2303BF65050B51AE7217BB9AFCBD2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BF65050B51AE7217BB9AFCBD2@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::17) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261010094418.16844-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|IA3PR19MB911919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba3a4cc-e1ae-443b-3b94-08df26b31309
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5072599009|51005399006|23021999003|24021099003|19110799012|25010399006|8060799015|260925184616899003|3412199025|440099028|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ukmvWVe04hBpak+O6AN+K5seI0aGluGiMc30+Eh1BqfAcjrHWLiXkxCSZ3oA?=
 =?us-ascii?Q?GgfS7PbpByEMPo4nU1zxNzXJZLCHxPHLJbi47kM13Ig8lCGBalInWVweBFkN?=
 =?us-ascii?Q?vbVvn0bR9dnsSPPPSOZoIb4FT2Bh/7cC7xOIboXUAk/n9zbMsX8ziP/k3IO9?=
 =?us-ascii?Q?uDMqQDoWZnS7QRmUBhsmoDyn9lPdLPeTSCPZKO8NWLM9ARDCGurGjfhVVmCq?=
 =?us-ascii?Q?wdjrh7xvNu4WcVrd6E5qtWzpoq4QrncWm5QA5Zvs7NLz39/FPDHolxXA3TNJ?=
 =?us-ascii?Q?t2asB3Rw0fFpDe+jCESgj9+iQmAdLmIhviSScBAcAbEHndYbLgZHwdAh8mdR?=
 =?us-ascii?Q?FB3TVoSyZxe6k0oCV7O8yak+X4jk0eZRJpbbMoc9Kyb4JkABP2gAb9ptrL2X?=
 =?us-ascii?Q?Gw2eEi28oBhzGHolGxcnJDk4OPZJY4MAUZEW+JNtAH38z7bvikoMphB4HcfH?=
 =?us-ascii?Q?/eHCWoafCzIQL0XcSI84fMJ+UjQmLAjQtC+Oogxe57lt+jtTbCkE39NxyeoU?=
 =?us-ascii?Q?NbKRqR6qxRkqW8GRw0ZxmJFBCCcuL74b78R1+bmvFE20NaWK0pPm7szyvjNG?=
 =?us-ascii?Q?Hs/HhgFFVziN1t+dIL+mWpdWiDvDSVE/59bXEDUTUNvGE4ZyAiIw5RikJStB?=
 =?us-ascii?Q?Ok+8btFXp8qPABK+HP8DABooDjyh9UZMeOAuLZKh2JrVQAmy/MbsD6Cdi7Od?=
 =?us-ascii?Q?8ohHgyCdQHBRG5D4Bg5FeatpydjDnxIef5dQNxa/7NALhXduL9jLgzQFR7Ga?=
 =?us-ascii?Q?pKSRscpBCoEYs9My5c5g6ij8zhA+NQzP76T1mDZ3CoFqbVAiBhPH8UyUsWcu?=
 =?us-ascii?Q?+dACE0KSPc3T0YvGg8mb77AEtOlyakK/XZJLIccJOF30pUyeC23yYoJw22JI?=
 =?us-ascii?Q?fQePZzwPPCvuSlCJtEa+/99ULkiZtehcHPQo9lWSUGjc1l7wfaecYb5Tr1MY?=
 =?us-ascii?Q?Fysm8Ryihz0KmF2HRtr5Bw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6owGJGw1/4TpdhvzFGWIXIjX9GsXOH9hU3jfRdZOXE1jJSowsiQWa1++dHWg?=
 =?us-ascii?Q?JWL8plsRFVkzl2KyoI0HReCcQRqEC7AJZBGM/YOnfCfC4cQFHlmjNkkqtTHd?=
 =?us-ascii?Q?TuUFIYpOJcrHqhfLNME0EtuNQi+gPMGR0hoa/pCqNdLMPdEopnHfMlfSqr/J?=
 =?us-ascii?Q?mpTS+hy47+uY9sL1Mb+B7EYFXBtmifmJShAP9scbEPRh5uIMrcX+J7O7Y3aS?=
 =?us-ascii?Q?nHZUUW//Lx9+M2Nb25TEiywle+tkXBo7ikaSX20RCEO2sHCWBopeAMRHzlfs?=
 =?us-ascii?Q?Vk9yBpBTyzA+7dKZnOZKmtefXQ94YUSm82v2cIeJTnBRLtDijJHz0u6cVMyD?=
 =?us-ascii?Q?28EXIkQyK578NLPT4TygDbZ9r1osFiwpysBbTDeoS0hL9Z1p2jevvDqe3UmR?=
 =?us-ascii?Q?KRoDkiH8p57xO29dbUDJC+G+1PaxCRpRqqqz83H+tL/8zpmF/a4aW6mEsyvd?=
 =?us-ascii?Q?oSR53mWnIwCSlrsDDcBGUxkojclBFuJ8lsKxUPfcqQ3liMBUDRbg5bniWaaq?=
 =?us-ascii?Q?8jBEfmbk1KfrrTYvUCTzxGrweS6GXFAGcOmuj7IOYOdNSihLC6LeNipWRoMN?=
 =?us-ascii?Q?CXFAzPgH8uwm2ksHDPTRFFO+A3PkLSA508JUaV/92mi3IqGzoyX3KxKmjvKe?=
 =?us-ascii?Q?ArFO0/eYzrXLweKHU8RqdLKByw0jaMQ/5AJHXbAuQoKIBIzKCKCynNrcIKP0?=
 =?us-ascii?Q?KyMRh2CZTYVnhXp0ekObBJkdRxhmOjcq+uQ7p/EmZGD9YVKwNP9vq7mFI5IZ?=
 =?us-ascii?Q?THD5tiMWaP5HdvKJhGwp3aNpveIqHNxeWcHQt19xGfL1J83qPGynNL1f44b7?=
 =?us-ascii?Q?zU2l1mayhoyMW+YVa1IDDdX/8M5VZp4MiuE/SY4EX4zWKsfDVzBf3E07SYgZ?=
 =?us-ascii?Q?cRHhGhtxONaMqgOL8j/kMGawmfgcyulAlobvggZ+oTjfTqQnLY3IuekIZDlO?=
 =?us-ascii?Q?44mTJnqSg0+D2YpHJ8x0uyjwWaltQblUy9U4fQTyzsnayE6PnsGzgUMt9Jsi?=
 =?us-ascii?Q?TvHDh6XSmFupghrDYHNvLh1WoLM45k6E/ggboMEi1Fsh1/5zYo1yV3UW3Zww?=
 =?us-ascii?Q?8C2+kUl96F6sEGnq/FZ/TefhvoZeIgOdkhu5d6O7Xk4/6U+OxGx+wPTYJZjh?=
 =?us-ascii?Q?n1Wk6j41q+Kg6m3kpC5fGcBxJi3thm0tW9TnL4UgoB2nlxEm+6mgPLVzoXxo?=
 =?us-ascii?Q?SrztbXMk7xkXfmoIFFKw1mZ1BWfYajMGSvuSONFRkG/ZfG6odH1HBCzzbkvv?=
 =?us-ascii?Q?Oi6t6ZpjaCZo+Ou4eXULGHwqsjEJxDxf0Bk+1xYlID2XKmcAwgKqy9lcRlen?=
 =?us-ascii?Q?AYYKHKPdGygHic5UTDL+W9P1zbiYRrosFhP/0gIyDLl6iI/7OMdwnam6W/m5?=
 =?us-ascii?Q?oLnQNrxk3IrAz5dGKHMee5W8dVer?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba3a4cc-e1ae-443b-3b94-08df26b31309
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 09:44:27.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB911919

Hi Takashi,
friendly ping on this one-liner (I forgot to include it in the original
driver submission and it's been bothering me ever since).

Thanks,
Marco
