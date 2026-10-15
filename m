Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845683E16A5;
	Thu, 15 Oct 2026 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042163; cv=fail; b=IWUNam4mQF4iYlqvWGCnajzqNq2HpuKngWKCgkkfjAs65jw8abY4sbtB1KWzV6VOx03GOU9NylXwZN74X3r/FhDSRthiKM3Iqlj9fzljTl2s8GgHTkaRaYlQ0tgDex4zL8/RTh/cPv2lI+k95KygeCCwXWZ0V+XdIi/yK31csj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042163; c=relaxed/simple;
	bh=f7OfNqDpxj2PA/YcEbIQHcWZPxHS+ADlAHleV94bGno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NhNM0PebUHvL+c+nRnSjhSEAJI4g35ooQHU+++SHG6OeXdL9fkLWCLT8JUJd036zLesLWoyM6+1KBouO49ASRj+BizmrBFWE9HrFtq9nxZsCD+wCILELjPfU4mjKvoDdCctMsq52brovRQi+TmytkaxrtNDOh9qVxdfC/5Xd5/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=SiaZ71ao; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="SiaZ71ao"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWX/tpoeadRBzknCcXZNHQLD1yYl6d9Ds9UEnLS1hEju1LaShZFFJ6aOQtaMPAvBM8PrKlE+odwmL/4RdZ/uLQ4d8mCpB9UCbJOwo2PsBteEU3TFmbsVvWBuvS4ORF0YxTWKbfFL5XwKMZjHBnx/SYa3E5bRIBRaQBZZ64ZgU5frBA4VpNJgq0DI+gC26Gu6r+S0BFLO7QCo4zzZ9nV4ydY16Zruw+q1vhT9X0yjuwf8OcVo+RrsU9ttiHWUyc5OPqh2vuFvuMBfmY38Px6MVaBQeaTDCEBCbf73m0/FPPPrbiFvShkfyA2Q35eoI5nrI9GMDtAl4Wv90fr9gtI/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
 b=cENUr9X8iWHodwKywKsMUmDTtRBHEIKOpibp76XzRJVt8pXW36AkF+PeZeh3vD7d1EI4jSQRGVyHeRoUv+1P9SwOSRfB6a4xn98qIcXxQqQN5XDRBarnXXm1OmO7A2utWNZXolvhYjxqstbGsBzqAKEC7WeJ+yDymwhnpRgkZ4bJczJNuCnH/13GKCWntU6mQuct2i78uRT9yWzk5+7gIUmr6L+ujDGrYuO/jXB0S8rH57LnQ+tHIDGqFLNnuK6iI3hnnu6rqZFjX0QtPw2uejZh9/8/FrBetvH4nhkqesUEcnGpSMyOtm2FylXWuvyQx/ZD0N98u44CYzfDeIOwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
 b=SiaZ71aoUqcTU7kNpsonIcPIuN4hvC44OYMQ8rDVsui5kr+JgXgtRxvpfs51ZE6cHn+/aXyp98GLMWcFtAETojYD16hff9g7BSJAPJe50Uwq6R/+MtuO3aCtePk7GLp04Uh+sZ9JpxK4UJj3mnRprKZYLRmdb8U1RktR603tedDYeL2+wJN2BcQqRUUtDiEg6G6IK8CcytGNGAHdHPQtll7vR11pxglmh9kLkzB/oIpayuNLzjAOJ2wWEPXfsoop4WVjU/3ihWIjc9kF4QMXxxJRDCCzXCh+A4dOAZoZw0/bVRXKD1Ow9By/LfhZs4MT0DQDIAAlQAdjl6xDIdVgUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by BLAPR03MB5602.namprd03.prod.outlook.com (2603:10b6:208:284::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 05:29:18 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 05:29:18 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Ahsan Atta <ahsan.atta@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v7 1/3] firmware: stratix10-svc: increase args array
Date: Wed, 14 Oct 2026 22:29:11 -0700
Message-ID: <6452080968943b212fa2398a14c16377d3a14b04.1792034130.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1792034130.git.hang.suan.wang@altera.com>
References: <cover.1792034130.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|BLAPR03MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1a2911-43f2-4c98-1f48-08df2a7d4257
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|22082099003|55112099003|10067099003|3023799007|18002099003|921020|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	1XuhhcZ7AFthHQKFT+s7APVn5mS+DTFPegI0alQE3kfkz1XGCqKDePBjA3hAg3a9lfnrgC5N/ltUqBQimq+Q+xtrYIlBMsH7B5GcnD3MFimTlacj44/OCqF7qTeoemcgymKzRwyWBZ2le2AQI2/wWlkCvesh8ekcW5zU+N+T/06NkzhmO9UilcLkTI5MpNA2p0FStjnkbcMA7xXPzcoUlyiDDZ4k2xn1s2X7fLhvaHCVGF+BXYD0ztPSNKwrvBlnMc/R1rd+IZoOFkQviXCJf+CWGwDJNfyxwmp7eDVTzLOSnk9ptafuiwNM55n13YJNRhTErBJpbg/Y2+Cxc3h91gHHEsRf+yADQ/8opGwXjyQZOj2gj52HX9uJrDGtXyyFhvDl0RPzCxuZu49h9p6c4de1iv+M8I3nj2NfuSs63VOwSxLHSvSDop/gVZEDkZ8BeBqW8nbidhWU9uYmT+iaDsfq6ZmJsKjVI28vYVSHNzFRhQUxFk73m2BY+fx05M7lCYw04xZKjGoHZf3DX5ck/FXl+AmtvwVlrscAbYxt/0pfeV5lNHIMLLGnVxFqhA8EsSPJTfsOcnnGdHPPrshmA/FYUT6pGGfBpS6+skTsyh/ufxrg4Mg4IzMMuJHwPOGvM3GN1X/as/1qaCfc6sKbh9eKiAGIsvXw7NNEz7WLElhrgEZXx5Vd5AQ1fveIS9tmg8RWzKYvcDZ13HtRnhqx9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(22082099003)(55112099003)(10067099003)(3023799007)(18002099003)(921020)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ZMd8WsqEyThz3byGuoPMIHdmTmzC2FyB+4RK20JSNtXoBNADpKkIIm/pamX?=
 =?us-ascii?Q?gAvJ5trVcVZZ8F/VMwYQOicPD35tpub5HG+WpmNWp9ZmH8VWbsp4lZqlk7ti?=
 =?us-ascii?Q?LaMd8WxL/joP5gznk9EO/eCZa1hVCjRVxW6sWUcR9N6gyexpk/G/UcH/p4z+?=
 =?us-ascii?Q?PQZ3aucQw0+GVd1ADhIiw8XCeC9Ht7fdOfv1PSi6EVCDcUdVLOtpy4nD3i6u?=
 =?us-ascii?Q?Zgp40EczW+tJcPWCHatkAybMSccuuw9TG/uaKi6zRXpOxIk3kyfVWpPPxc16?=
 =?us-ascii?Q?xo6mFucSXcSOPjvAtAHpNeHvJETl7dNspTJ8U3Gudeg+pWwzxkV5LeZXmkCS?=
 =?us-ascii?Q?aI+13UQI7qp60xKC85Vh5n8uX4U77BvEffnCx766ltuJOXAcvAO11+6Kwwdn?=
 =?us-ascii?Q?Y4K1LwmGS96JKQEyS302ijfmb6QXUOBfT/OI1NgCJLTBtMOGA9grC9PxDpce?=
 =?us-ascii?Q?PzfIK9kUZS+/+SDp0ik5onKqxGnj2cldltIcYgwG9Uj0uXcwpX3EeDHq275Q?=
 =?us-ascii?Q?6bXg7lIVDpIi0iLomIkWlW9Jdr/9YZhwgs7YQeLylOgY33fXkupzJe2D1NKW?=
 =?us-ascii?Q?gItuAV/Ou10bohVwuCas1DWbxLaKSOwIwHG2DVGAf+yXikzwmyp8cBJlTtkM?=
 =?us-ascii?Q?MID6eD5nxtbBo9a9rOKl7Sbow09eh8aBrL+k0SQbMBCaHOsge/wodTAj9pQx?=
 =?us-ascii?Q?kwOJVUA5pR5gQZDKO2r3hu5kpgcQsxH+g+LjbPvmr2t9tmHQt+PZYuGof3M2?=
 =?us-ascii?Q?CJ4O5mKwihISCwiwG9YIlAXecsRXORTaGiwlG+6vPE70O3l3CwQS5quZkmLB?=
 =?us-ascii?Q?nVyB7m51le2rQwBaue1Be0F6ubnT0yQvEodXi2zZLF9SxL4luLNB5kEd3LDk?=
 =?us-ascii?Q?4/XnotQGQohbDca4SaK6JzwqH9N4hxLIlvDjnBU1FvUK8NuI8NgtC+DcO32+?=
 =?us-ascii?Q?8rYSyBv3ZeHS5PCZJs9x76QL9PpRkjMzYSljEGVZStdMAPhjIFssQ6LAS1na?=
 =?us-ascii?Q?+d8ppdkvocfEoh3CLu8pOAk0KP95u8DXmg30wnDRlq+PNbAH9HsIx8JiimTs?=
 =?us-ascii?Q?bYumRHz9/uCX7Deflm/3snOYyM3PRSjcSpfQ6z6nzZYp9Oa2tkXFjzFNPAFe?=
 =?us-ascii?Q?sqIOp1GaxIKxpmk90aKZbiM9GJtoiVIGNnC2AI6IQe9HGFI7uZIMy3pXuaZ5?=
 =?us-ascii?Q?Ql/Aki4QDhcjVYsmcWLdhrV81eKV2R7e6H4+UJh4g7hvFEX/yo89gAOsodSm?=
 =?us-ascii?Q?hsCNa/BTYxs3x3PPsVqHhhsqoWUxLhdA/Gdkr2PfTqW+G4bU4fQvRbhde775?=
 =?us-ascii?Q?AFJIpensgc2h515phfggcQlGJmk+i5pdlCqNzIX/oE0ZYVcBhZpBwX0E7SuF?=
 =?us-ascii?Q?6y6giLG6JTjnwaOZHUJwYlia0VCNq/0Se94okmMYJNEP+JnSIjAFxtqluZZs?=
 =?us-ascii?Q?vnbijUSKB7SyIqMtxWiD5v9/AkRKLlGz2/I8UoEouAp5t/T4bKGIrjET+5/K?=
 =?us-ascii?Q?PtUW7inKtcoVuyYqM63Sgl7pQPiWe7LStKvuwj97ef6ZfTCO5CeF4beAYEHs?=
 =?us-ascii?Q?lv6xmO/07Vieua7FvCuVEJckpjCtXxmOhFMZgQxE2lDfAdtzH9LUkOYkhHpZ?=
 =?us-ascii?Q?lNGAKpy11wqDMyKSayQFMqtVzkjoO0GVQBheIwWKJnK2xQq1mzdfnbW3qszO?=
 =?us-ascii?Q?OPl+BqJRjVtOc9eFPHyxTHgkvR/eByWSiEWJVThfAJx3ckj02PCKZvwkeB6g?=
 =?us-ascii?Q?oHT3+wWTRg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1a2911-43f2-4c98-1f48-08df2a7d4257
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 05:29:18.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpxPbakh/6ohLKlF9kVlQ9WmyyIadXt17C5hBjZ7Dga9bW0f/qskN7d6WSiLBHz7E7XHiiAAlTSo6qBRjJdchUK1XMQtHJL3MTAF0qBBMmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5602

From: Hang Suan Wang <hang.suan.wang@altera.com>

Increase args array from 3 to 6, for the SDOS encryption to call smc
call which is used for args to be passed via registers and not
physically mapped buffer.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c                    | 6 ++++--
 include/linux/firmware/intel/stratix10-svc-client.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f7928ef6b6db..8f07b945392a 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -219,7 +219,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -2088,7 +2088,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 	p_data->arg[0] = p_msg->arg[0];
 	p_data->arg[1] = p_msg->arg[1];
 	p_data->arg[2] = p_msg->arg[2];
-	p_data->size = p_msg->payload_length;
+	p_data->arg[3] = p_msg->arg[3];
+	p_data->arg[4] = p_msg->arg[4];
+	p_data->arg[5] = p_msg->arg[5];
 	p_data->chan = chan;
 	pr_debug("%s: %s: put to FIFO pa=0x%016x, cmd=%x, size=%u\n",
 		 __func__,
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index af13dacdf5ac..9bb46c3cb0f8 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -215,7 +215,7 @@ struct stratix10_svc_client_msg {
 	void *payload_output;
 	size_t payload_length_output;
 	enum stratix10_svc_command_code command;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
-- 
2.43.7

