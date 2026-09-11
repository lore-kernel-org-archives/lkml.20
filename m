Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384DD46AA7B;
	Fri, 11 Sep 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117550; cv=fail; b=Eo+jLJYyDIGn2cobE1+SGjXJ26pB3DoJdavLh2ta/CWotOQkPnZ70ajFBO2bQ4V0EciIDJLnL8k+8AkkRof9z6mDl2MSFYpWRJzUTvihb6HxoFjWDiVYJvnPf1yUGvqsG55rw0Yy97+9QutPGZ2w6QQcNctyl49PAgf2py6md9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117550; c=relaxed/simple;
	bh=LpBz/j9EWlKMWjRrBmj/GYS3gapgnx+liA0OmarRdEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dIhXcmDy8cmUs9N+HCciBnD3+o1XthnaK8wiijOhLcPuiZpq28E/P8jztpjqDkQ3yvT27n1Ct/syhV6nOG1nYKspxMTvrrzkcXX4q/N/ziatVYSDdZMmvoZllCUSM8Vf4N42402AJ+EL2fy0iNKScSj+LkmGTmvnj77iG9fhFbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=UCf+50SQ; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="UCf+50SQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JinZrwwUIgQe+bWAKGkr/8KKEMsXmvK2bENF9FaK4x6nVhNe46R1vXrtJAaI4SB/VOnJPsnSTKQmyhkHbfPS7opi+95ayz92le+9FTsfc2trKJp5scll9VngVQSmDW+VtRBn58TtNxnfcUF83Vbldpyva01Dtkq330nCoyCq1vwAuugO/GXo5xWlgRsjP3Q7aPwKtdzPFl6XPEs+vFzBFhAAfIOLeBZszCeCqHVoE3MaFsDUuQ5mI4ptxwVcpgToC1x96vGROBDjXpNQoyA/S4SQOFYU56a3IYXUITwyl4VSMvFps8bHvvUFZD2Orub2unYP0Rh+yVQY7tYuaYQrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zJqfS6mAIYF9l4WV9eQCadJTpRsEp0RCnhRwxbMFqI=;
 b=uvOYerMlBRbJAlLFARXrLlh6SCJk2SiSwericCKu1SGgWB1eax83sx7euhnqPQgLOUKC3sm5wm0HFZNdjK+cyH3fpkWXM+V9EayqkbjQJ1PlZQFcpmAMBOd6NzHmhhkMuYvbRCw6NcGlvYn3egRHoP2SUeuZTYxjvMRvJLajQX4DRIIB//2TJMz7WjTgtJycKebZMl6ju8J5IPuBldklIDTCU0tSnNvgXllp/6W4xIdrT44zstxEQ1/Bu+fsxQAXRhrImWEBd5VkNEJy91yizQaLEMIVz2SKftp14cuUjESOeTAYfHOxiqPnPJKEm3uRKdjjCJm6Csp2j+98JM+UGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zJqfS6mAIYF9l4WV9eQCadJTpRsEp0RCnhRwxbMFqI=;
 b=UCf+50SQfaoXujIQgnh5kOz76voPuVI+37mUnzxuPrZ46RWQEve8AJpedm/OqHTdiGfx/fPSwVtO3KvL1Rf3LBN8WrLeDlGjYBmSG5zSP0vYN7u1tjBKSaBUxY8vIm+DXTHtHitfn5LFzvWwIm3VFt3PAcO4ScxpMKodtioA4yJ1A9cjAvXFgaadvTgodL3QjIZckxg4TKm6xRzYhZcSDhOX/Opn/WOYEwBbNfxBu0Xf47+xThSiW8VK+7X1VKWxktquXL6ci7+0KW+IDTbTrlaa4uKi+W6M0pPlCk19xpV/kzzr18CtyGc2EI6RDEcjfv7fTelcfRn/GFaVx21wrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB6326.namprd03.prod.outlook.com (2603:10b6:a03:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 09:05:45 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:05:44 +0000
From: adrian.ho.yin.ng@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
Date: Fri, 11 Sep 2026 17:04:51 +0800
Message-ID: <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e76985e-f395-411e-6ef9-08df0fe3dcda
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|22082099003|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7uiSQq/6tjv+DK5QIm07nxF0q0vEzTCZ8oQ1mttZVcNFZVIbZ6MvGrFHH33AXUJ9gdK0MM0EHPQ4X0pBTPKrQfZlxqZH72ifmHhLNOUr7judfCNGk2ROnbVii9cYzDenColE+949hHKqXBCrUJn3GX04w1Y2OCI4ACvSDi5xy78jyCpAHt/SACUa7NM+vra7Eq5VPiDpmPwp5R4mVNgdnYz03UsojK0Gq7Qe0zTdNlvDEsqhOlOOnHUFDppsxNvOgzOviA5BlpDwuyU3MCtCW9eoN1IcD3dW87gW4A47IH8MmgRS15NQ6SPUREysqSlqsxgxA7i/CkQJVClOfPVcP6OvysOV6yRmeWUmJ+T2mV7oCsYSEX5NtUoM+IpfUnsbTQxFXVKPSIGsv765MAbFZCEcMH5Mf3cOlkDAW5Vt9lNmJo3GeubMgypu1ecu9Ltsw3AtYxSECdhtWqdMjVzFAKUBaSYAlIvKX1+joDKG7lziRA9TDloQbQaAbSJPNx0fqqmV5bdOu2oPrmABOfgQAhFrvNzEsyE0qsuT5UYicKy2O5yS+lCGDhPdk2R+bEwatY3MZGOmAjYLfsPu5IUYup/yQYtiDnNbopEmpiuujim0wYL71jj639NUrUOvqXxPqvUMkt2wIWo1bttZ2AU8BTMCm2/mEkuhLHDbY9X2Ki8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WqAka9ubFnc5IFDJYtpdE3AXteWz8j2Fmk1lXqlRmjQptFwJkT4/RLqBoT1B?=
 =?us-ascii?Q?L284WYMta4nnaRLRIv0afuF6682HVUBm0NJFhiil3JAqHMi87xks3yOv4m5y?=
 =?us-ascii?Q?8LaKD/zJ0g6fCoIFz/nqL1SOVzd5Ab+4NcPuXeM94jR23QC9zvONa2yhUsjm?=
 =?us-ascii?Q?x/pKVKfwx7bkSnXShRBN7AQuA1CMaRD/FaF9Ml0bHWqqoWIu8tyvbKWr/V6d?=
 =?us-ascii?Q?13XJGUDs6g9U/0WCet9HaeHj7Xn+v9sa1kCbRtJG2jmIUyEF3SVSBspqbVnL?=
 =?us-ascii?Q?9Rlzzeeh8ZuI0Wj4XTAZ5XwuKY0XEfhrwIi4HJnLDP9dx+M4v7w4p4E61yfR?=
 =?us-ascii?Q?0oAOK0b87YToMdQcBvEzxfqfLuD5OhOfMGv9pQYiWryLleGJcE2khzbnSWom?=
 =?us-ascii?Q?bWr1m/+6fFXuLRPCMFHKnQ/iapqDNg4n95JlCq7wIunfXaBwVh7CUPedxlTN?=
 =?us-ascii?Q?0wJ3YoQjBG+ZLV/+3gWTTfqk27PpM3Pwqfllux5zPoEK9Y0XoTKen/BzO4di?=
 =?us-ascii?Q?iheOsqbXJrree/ghO3oON1cDcfEBLHWj/ziliJVLJL2KdnpUDGat7rDbjd5C?=
 =?us-ascii?Q?e4BpV+y5op+4fx19UyxxBAcH2kP0rO1XpKH9eJ0D6LanJt5iymQ9E+FfyGeo?=
 =?us-ascii?Q?5DqyqdBN+HVbm4b56AyZ2hOHtNTBgo5ktNrI7a9YaGFY9d0Hqtx4QAk+8JhT?=
 =?us-ascii?Q?2pmBE6y9Bcd9sRwxELXIDN+U5Dk3KoADem8BTykEPUkte6eZ4rpCKDWlSii8?=
 =?us-ascii?Q?jQ5pLGUYoPCggUVo0N5YKwWb/7mEPqV2NgAi6s8Hk399s01atT3mz0nYwAei?=
 =?us-ascii?Q?DYmWWMayhPcNkyXC1de2yiyDuew3fl4RMrx/qkTcbiX36a5ICENr9RQvDT1F?=
 =?us-ascii?Q?kyZI2tHhi9gV+kk4zs3Bjf3CjGKvC9X58RUNmfnT/wHH6QZ3PUqRmpsJwtUa?=
 =?us-ascii?Q?oLxH92Jv7ui5h37IC+whcQObDcDf/FHiY2k4bKdJeHf/ej8ogWuej8Vtw1OJ?=
 =?us-ascii?Q?TTYInjzkwyPJ7CqSLEA01II+PsCrOz9DThSawq3j/l2JgMmIA4G8aUQg8tqb?=
 =?us-ascii?Q?b+GUdBbm9rVpK5YyaDZMh0xNZjeoYUxFm/9NGGUWWGzs9Pn2FCD9b6vDiajk?=
 =?us-ascii?Q?eIQ4CbGat+WSnUNAIwK326ZUkcuXU4GkQoFFSoHIFMdu96cBXxRImCNEUb73?=
 =?us-ascii?Q?JlGvXFE1qii8f4T+td7FpTIgedreX09O6SCJsM6WUL6bQtOWbmFLSwXF92jf?=
 =?us-ascii?Q?uE1LQTqliEP/oh1/wkSOJLmO8TvmXM4UWASXW2ZGQ7zsIRPppfN+/HZquQ/Z?=
 =?us-ascii?Q?DtYGzwu20543+owGIRLhp89XL63UhwMoA/AnahPP/XRcPu+WHVUAObpDr1PZ?=
 =?us-ascii?Q?Rcz/mj62KEBT9PGukFmOnB/AjAVR2/uPNyH/MDE305OOEWiGrOKhPwyNkiBj?=
 =?us-ascii?Q?sYMJUyes7sFlbNRUZUZb3Xc8UBRnxD/mfdlLkzbLJEYJAsOT2j/NOlhlkVau?=
 =?us-ascii?Q?IyyweNOXbzjVTrRSM5zcPgNgU1QAzbHPcU41B0K38Ihz8uBMgur5Jmkj/Ivi?=
 =?us-ascii?Q?OfzdDHu0Jc2ChFkozFOxakAPjK6W4g+YTpybqFurdA8EQYP2WUiFJKOY5wFC?=
 =?us-ascii?Q?K3Y+L0ygv0H6uC2cXIvCrdZNxVH44aHohDrDyrqtfs4kXvdC+f2HJaFqUl2j?=
 =?us-ascii?Q?XnueE5CsTqkj/EwAXLaqb15kKZkT2s6EIQBlc2qSG0b6AO9YOl98Fh6pleiw?=
 =?us-ascii?Q?JUHnv+Ks96vTahv+ROj1uCjTVJK3vFo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e76985e-f395-411e-6ef9-08df0fe3dcda
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:05:44.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHvRUGYm+f8pnfFGZhYUW/1QDY6QDLQ86ORDP16ltr++lMXq2VEdhpBHrgEDuVYMqZm2UoKTxGDoDLqPJ9dazK5qyj9sUQ+H4hYYCph+Cmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6326

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Agilex5 integrates a Synopsys DesignWare USB3 controller that is probed
through dwc3-generic-plat. This series adds:

1. dt-bindings for compatible "altr,agilex5-dwc3"
2. matching entry in dwc3-generic-plat

arm64 DTS enablement is posted separately.

---
changelog:
v6->v7:
* Drop arm64 DTS patches from this series (DTS must not be mixed into a
  USB-targeted series). DTS is reposted separately.

v6 patch link:
https://lore.kernel.org/all/cover.1788886615.git.adrian.ho.yin.ng@altera.com/

v5->v6:
* Make snps,dis_u2_susphy_quirk and snps,dis_u3_susphy_quirk required.

v5 patch link:
https://lore.kernel.org/all/cover.1788757821.git.adrian.ho.yin.ng@altera.com/

v4->v5:
* Binding: replace unevaluatedProperties: false with additionalProperties:
  false, and allow only the extra DWC3 properties used on this SoC via
  "foo: true".

v4 patch link:
https://lore.kernel.org/all/cover.1788503540.git.adrian.ho.yin.ng@altera.com/

v3->v4:
* Drop clk binding/driver patches; reuse AGILEX5_USB31_SUSPEND_CLK for
  both "ref" and "suspend".
* Update altr,agilex5-dwc3.yaml per review.
* Limit the series to USB binding, DTS, and dwc3-generic-plat.

v3 patch link:
https://lore.kernel.org/all/cover.1786518803.git.adrian.ho.yin.ng@altera.com/

v2->v3:
* Drop dma_addressable_bits; describe 40-bit DMA limit with dma-ranges.
* Keep Agilex5 support in dwc3-generic-plat as a compatible match only.

v2 patch link:
https://lore.kernel.org/all/cover.1765249127.git.adrianhoyin.ng@altera.com/

v1->v2:
* Flattened model + dwc3-generic-plat instead of dwc3-of-simple.
* Split USB3 add vs USB0 disable in DTS (still wrongly kept in USB
  series until v7).

v1 patch link:
https://lore.kernel.org/all/cover.1762839776.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (2):
  dt-bindings: usb: add Altera Agilex5 DWC3 controller
  usb: dwc3: add Altera Agilex5 support to generic platform driver

 .../bindings/usb/altr,agilex5-dwc3.yaml       | 112 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml


base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.49.GIT

