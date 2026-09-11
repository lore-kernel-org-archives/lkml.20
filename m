Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D148EC99;
	Fri, 11 Sep 2026 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135111; cv=fail; b=uurJTf3bnbzvYOr7mP1BcaaK4fxmQp0M2UZw9Dq5WDm64iW85R6Qb4TeL5aGglbSSkuafcTgn7hNRYD7ONX/v9AurgGFPWbOpZMSz+yJuoLdypFjfoziF6uWcg5ErpsF09hUGr3IxktDlzlz/WzNEiF49PKEOl/3h8nhexhGmOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135111; c=relaxed/simple;
	bh=nlbB+iUVCHqZamYHqMTixXgcok1UtnnDj2sR+w8WgYM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4n99cBc9om4W+3dq/8oOgnHhM8DNBOaSqA74wIgCsRPZU1rWft/lfbLYW3wuzp5K+nOXhGfNJjohsmtMlegqHyOp5rHjzLRBM+Om26oiyZQHlJKZUvep1NKXEeLTOAPlhdCDmEQbSFTpfMJns4ZHeWieLydfE8Kstv+owDEUT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=PooJTW2a; arc=fail smtp.client-ip=52.101.46.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="PooJTW2a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGe/7KQdCysXQuIpNtkkPj/XvS9sXUe5GzfLK59TuKsMzAM6Z/dPZxHRUTK6QKgDZpgaaIXRgmeAudPSnurE1jp121n0GmHEPuDBISg6oamO4dZv16xAlxyuq9NxttRrahxAgfVsxfj+qt/dR6sbLxfRp0OxZKQ7fxNoH1pfsSInahnWJS8xeETseM35GoWoHYpXU7S+tBkkc2w7u1J1JIf/5YPHDzqAIInxYUb34lktT9W67eb4oCL/MDN9xnxt3mg/9bi3zREAD4263oUKAqD06/WoV1UR9EpokjJ+3uAB4MNXSnXuHvn58hwv4YWj9Yl77hW1NsOGwle4PQ8Nuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vinnEc/ZXV+IzyIt9hZokzoRMm6/J0Rzsaizt41NjDM=;
 b=p0BofuhV2WzRhYjHmW9OI79exuEdynmAh9YRp3+ebnrSIoAjURMtT2xMOtDn0SqfoGyBtEsmKhv6MwBJZJ2Zm4tiQtwmS2bkgeGPNevS+RKwJSL8V2YF4Mk0G9GtsOKoYvJwMQI7AwUdZGyvyFupDZfccCDIM4aaZ4ePsI0dv1IYXw9Ati++/SJb4FOdEFZIlbxlqDGZuQ/SMu8CnO71MxsF/BPSAd16teOd3N2IPWVZZLxzImCa/q61LRTnoWwGwjmmAdotXKbkimrjAgxpBLeRnMHb4Ya1+Ov/+aPtHbC3nJ9Y3DTE1WTdPoUxI8+mTFg9UxzwyqPlitaKoOHguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vinnEc/ZXV+IzyIt9hZokzoRMm6/J0Rzsaizt41NjDM=;
 b=PooJTW2awQNqedP06TT0Wh1XTJX+0azSdBptnyan37MZ57Wtgq2eb0hflwrg0CaqqKXMnK5hWxYynywimryUmh+zvXFEpcZ9RjCwlOtDkndqiIGBQa/XI95wcA1IqWpQ3VUYrFRsqPMGyWelI3jYx03xEWgj2owgXSiQFSejZiIbL80fFtEWQypdT6+1ZJCYisKclKcGlB4fewi3VTxbSK6s+COEnoLp/W+EcUtIIh6weDB0PTmvIE7ipJdCdBzUk/+VWvC/auyeR/6GAdo7Ogf4maLaGEDIYhK1Z7NJWsFTjlLWpuY6SzbQuPU0Fa1Xe82WECNGv2Ftyda+ae6rjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA3PR03MB7235.namprd03.prod.outlook.com (2603:10b6:806:2f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:58:26 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Fri, 11 Sep 2026
 13:58:26 +0000
From: evon.chiam@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE
Date: Fri, 11 Sep 2026 21:58:05 +0800
Message-ID: <c419ab38ed86145d554658d0f73f36400e56abfd.1789123511.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789123511.git.evon.chiam@altera.com>
References: <cover.1789123511.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA3PR03MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: e3413e7a-9242-462b-b7ec-08df100cc04b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	fKy/B6OhYeqaODfBAVK5ASgwp0s9oS/wuSJYTeS936hR4nq+SYZMfzsuUAA8tSwB4xobYshwYLvICzEXxrSZ5FLbi3PciaLat20XXhkMTeWX5PXrXL//PL/Hun1wh4vFk8RSDdnZztLTEAHuB7qNf0njMDSXP6H84BeTZiwQZF7e0UYbOHr9MDCDJ/3MwXMvNolMZ0rmJJuC+e7Zza3bOf5HSIF+DQYpNOnyvGI6J1f+bqaR2rxcy3b3OAqgIvclIEV8ndwn2HdXRg+E+bx3RC7W3TK6er4ZMTLhkUDqPdAkURqsD/twvilFqrQky4Zhu1kgbVyfgJHTbEUNhMHcgi2bQM083esvHZbo7YGHXdMGXYO1xwBRX0gzchjSeec0ATDsjad65eApZhPm/ukhgwK+OMam4wMbgJsEPuAcdOiZ4q97e0onT7I88oD5Y1a+sYKhFfdjYICC3gJ5j5ZRViSCGeUd/pkp6fjW7Zqz2LGGYricTP/fXlaVgjEIp/OlFp9RChRFS9CDgoualn55uAJzu5tZeaFcbjaqlO4CLRjWvjUPEhy5cBpEZgfsitVcAwRnT+6sZW0v5i1avqDIjyEe6Eldl6P11OAzLfY2oWaXMyXnIyY3F3yJaBDRwcEQyyNSXEMmjLJ4ELJwXUFu5sDZeSFXanp5WDcL/d1VMhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aO7Q+A5nt3ql4umxaPSN384Cq2TpaDVu0RpGGkWMrOEtswKf1LPP5L8wXpu8?=
 =?us-ascii?Q?SkDsDWGokBPxgp6omO3w9pVBM5l6D9RGY1/Z4d4MZ0PWnTA+F17qf/JoZX8b?=
 =?us-ascii?Q?uhQ3dzAR77Num0pVlfGkokyyO3/yBj01RHmALLSPWal9L4R8hJeMExF6z3vu?=
 =?us-ascii?Q?KxCk26xh20Plm1y9UkBnxB3CXPPgMfT+fOQ1eEV00vV6HL405mh5t8OwXjt8?=
 =?us-ascii?Q?liyoKe4H2kd3lHT0XAiOQ83nh5Ii+GgpTjgb6KWa+rffM/AqN+B0dqUzIIkS?=
 =?us-ascii?Q?ByX3CfkjW3JpSQ5RoQaSsWhb76oT2ev1DC1c0efjL7GwFO9eJFWypQAoAR79?=
 =?us-ascii?Q?d/JtIHWN+HrDftwP5D2Q0FJ+hv91v4ipk9ahYguR+YIEYC2iBi1oZHDZ9IhX?=
 =?us-ascii?Q?JGocyd4TDS6DhOkZld28knrXmDO1LUwL+e7V0XPP43I4HMU9m02FHFynUKm/?=
 =?us-ascii?Q?Legm507+ToaXZUtNcUHIB/7d80m10sHZv/ARDEXctYvPcaLj+qSaSnxECixQ?=
 =?us-ascii?Q?t33EPPA3WHsD8s+RFqrJthSv20V77BHqCOuux5gZ1Qpm2GoXlo6/lBUwRpRG?=
 =?us-ascii?Q?Lhv59HB4eog6rl+9wygJP93d2eAXq3/vF9NiroMi0/8UqLsPA+K8bBFiVg9Y?=
 =?us-ascii?Q?Frs9exn59zqG3U945oxJFMKugHXxUQ96aq4yrlCJfQii41bo+Bqr068YzlHE?=
 =?us-ascii?Q?0prLm/WRFkHomaRND+K69V96HikardllOl7chIbHOyUNVdDD4Q9fVoIxQGZc?=
 =?us-ascii?Q?EACTBUsS4SFrivV/cv5sNTjNgPj8niykm/6tW0x7MrnitKKFVO1KlbZ5UEm4?=
 =?us-ascii?Q?fyikXIMqhiajcRuL5l51oKx2060o8yWA5qZCe5aGnbc9cIiTTNR1wuXkoKAm?=
 =?us-ascii?Q?2OM02nCIHFw+lE/V6Xz55yLnP73NZ3sGuIsfcnG0G6TFNcbTaquEavdbbDGJ?=
 =?us-ascii?Q?r+GRlmtfUNPiCzW8femXxoUv7htV1r8BsFiaC6HyhvoQeJ7JV5KXRV+cElMX?=
 =?us-ascii?Q?D5f2MwFCf1OJ8bQbebL3Q2shtOKAZd7L7yTrnCRw6Ik0GeqKU3G+gKchsFFY?=
 =?us-ascii?Q?3HKbNfCliqENTnCEqVZnG11A5UHLLhA0TKZmZAz4G+lBBS/XgkBltfXg5KRY?=
 =?us-ascii?Q?LkoF87n1rXVHtH9qwfGSNjRv/u1UW4d0D1pOjR3d1pzlR6dgZO5vpfngzssp?=
 =?us-ascii?Q?KIho2466kMHjjRQ+ZI+61Lk1eS0WAN5+ICfP2m9nEL3Mnc3m8+XFAClFHJkN?=
 =?us-ascii?Q?UiANNWntMojmKEO+hbsPvkvwjb/5MoZrxZMm0JT0XNXcqYAtx6+YGNtploX0?=
 =?us-ascii?Q?GCTa7LBpTWZ7IEThNX7gs3sA7209/YjbacOHTmvZJcHSJvKClfULRqaE/ny9?=
 =?us-ascii?Q?y1zUil4lEMTzFqs4K8vy1En58yO+BYUIqRYbspH2i7xStRTPLWEjckGd5QDh?=
 =?us-ascii?Q?kPgOhsaZ+XqhiTdidWw/biPwSGMI3IvSpsEWq1TnB+TWQA6fAzrI2Zv85WmM?=
 =?us-ascii?Q?9OEGLZicFrwccM/1hUNfD3Z055lZWWqpHNFFf3tjm9A4NPJV8e6Sim2/vJEn?=
 =?us-ascii?Q?/BgFOE9DZzmkeSBXhXkl2gUkb/Fh6G0gy+2Zy3vea+OYJTyUrjKuaXxs7pE6?=
 =?us-ascii?Q?gySqw8Tg08wEhQnteyN4oe+21nBUiTEh9zjsu9w94W0jLsAnPLLO4pKrlId1?=
 =?us-ascii?Q?DvndpQ1RdggYPf+8V0vK3cl43qV0C6XMlYoYQUCpC+/TkiJox0MJfi2cOS+i?=
 =?us-ascii?Q?moUdy7Szpw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3413e7a-9242-462b-b7ec-08df100cc04b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:58:26.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzjdVatO1A9EQI1YcMs+/PPA4NOlfgR6OHtSWAA6zqCMZzBSIZBO93TwKOXwL1X1D4tg2lSJt7p07DiavKvhNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7235

From: "Chiam, Evon" <evon.chiam@altera.com>

All Altera SoCFPGA device trees now live in arch/arm64/boot/dts/altera/,
so the arch/arm64/boot/dts/intel/ path listed under ARM/SOCFPGA
ARCHITECTURE no longer matches any SoCFPGA file. The only files left in
that directory belong to Keembay, which are already covered by the
ARM/INTEL KEEMBAY ARCHITECTURE entry.

Drop the stale path so get_maintainer.pl stops pointing Keembay DT
changes at the SoCFPGA maintainer.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org/
Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v4:
- New patch, split out from v3: separate the MAINTAINERS change from
  the DTS move patch

v3 patch link:
https://lore.kernel.org/all/47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com/

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..98f374ae7586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3590,7 +3590,6 @@ F:	arch/arm/boot/dts/intel/socfpga/
 F:	arch/arm/configs/socfpga_defconfig
 F:	arch/arm/mach-socfpga/
 F:	arch/arm64/boot/dts/altera/
-F:	arch/arm64/boot/dts/intel/
 
 ARM/SOCFPGA CLOCK FRAMEWORK SUPPORT
 M:	Dinh Nguyen <dinguyen@kernel.org>
-- 
2.43.7

