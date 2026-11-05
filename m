Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793870287;
	b=Aj4tUecrGronuXjKvdfgt238+atUQl6Wr5F5zy3NKmbiVbgw8/Votfg+BNee/9Wm0ZbH
	 QeUA4bIp2MTQVu4u+VrJhbrfBs6bCVb7Kito+rosCsjjiGe9FHt06T/ONMszVX6Wt7edZ
	 RMYsvgKbfl0Al6fGfR8V8rONdqcZ387LFzU73xWk7fxS5xV9q1AEIfS2p0YM4ZS9WiSty
	 13Wg81sYW8fGEQEHt7+w10sIr0iYOP/ww+DdrInx2BrV5OUJnGhU/y53D4afmXoJFSbAm
	 cfVxrbKKFYfQsiU3pjV0fLI0pVNWQXlBUHCDuf/oNd6HQJ+Mbxdkse8+Yukr9xnaZRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870287;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=b6lYT8H1APh9WNrwCcJMl6ao/iPwv1nmLTApfvwqcSU=;
	b=orWPFJwkKUslN48mIf3TFUJMtC8wQ2KiqeecxKq98fAwFDb6O9W3UJ6ZJ4E/ALqgMaa0
	 6Ww61GPizN5YrGU1C/cn3X0nKF5SQtwtny2j2fDIsI1l/bheWKbiFIUam620ycCqxEqo4
	 XlHwSGgEX0+HP6p6btM3Fgaj2qRkWrblAq3zfh83RrNj7eNzqVPzfaSt85u1gNCI68ZXX
	 N1ay11wJBOWBnXtwM16R0yMde4ugO9YJIGfxTuitJPIFikNNvWVgRz8Fa2QIW+TMlo8NQ
	 m6xY5kSpB/8rfvl5bghkqWA6W62lkB3G/0PDQq7ijqbMXWeffOOrMxyv7kNc8ANtI2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XZdAXl7u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.36
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B37D606A31B;
	Thu,  5 Nov 2026 09:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B37D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XZdAXl7u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP/I5UFNM/6M9iJ/+THIy/VY6P6gsR1pCdskXZ1nYFNX+Lqym8stN6HRjAjDfRTTOWgPzAZyhkQLMRRFBVe4ip4c1hsUVRTcBN29SLljFj479qj0PApqvchplc7mSTgdt0LNWuODzZOGjZNTindDjR6K6Y3cvVmeZroM5nC5kcaeqhtIKLv2FqXZUGviB8DjHCkxy6JVIwQOfdEtqgdji8TJmAz++AM6bBnpnQTH+gc0IXDxNDconHbKjRjGlHU1YEDONiivb1Cc6yzC9FdGqCBgcOmpw+LDaouLiBTDPb4ly59gK8GnPY/+PYx9SgtElmFUeZRSAXC0oTyqwqOBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6lYT8H1APh9WNrwCcJMl6ao/iPwv1nmLTApfvwqcSU=;
 b=o12Ku1tFyyjab/iefLdnWQhP7cDUBjQeUtTyUIlBhqJhGDT+Y9SREoiT2nYIMpnoCfbr7+Yn0sES8knYeYVOGBTm7bGpSl0yUlhlo0liuI1ve+bso6uHo7MNpX+i6aM1OQHcVgLcp7WoVxCgrkqmXzQt9gxtlM8LmZy6a8ysP9w6h83e0+TuSuipbF7Fud7Y4F6qqXJAliwiY8RBLjnpvEULlG1yeKnTloNajT+CHG4AMp/zmVriDutiu5gnhPxCBfpMDAmzhu4uVP22fnoc+omhG/1xOHFJuAa3pmBHGzApn6edoK4mrDSUz+pEeVUsaTNf2P4UbGV2MHY5BxGicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6lYT8H1APh9WNrwCcJMl6ao/iPwv1nmLTApfvwqcSU=;
 b=XZdAXl7uVN8o1sWS5k0TI0MXz4oXqkvUrhlbqi4+/RBxCAAGSdNA0WKSySYiBawRJpeey4YL+s49v7DGua1tm1xNTMx3Ry5uI/MBlmwTbDfC5dOzChrXDCxFnmPSc+2A4Odi+qwS4QDqXc7u0y90uZi8/zBI9c7RU3eT4LT5ktepAQKxOZpFFpS+22PRx7QOUwtQygkWfzpzaGRAQdXeEaIjKviVUfEtvWsGcQaZUO2Rltz87k3gGloHV1c5HG5Yrut4O5rLwYLAdecxlP5zywPG/eo8WLZ7s6L7hayHOFTFewl1our0mILkc2rIy1I3Ao7Jh0IKjhUnWAedUOxzJg==
Received: from PH8PR02CA0027.namprd02.prod.outlook.com (2603:10b6:510:2da::18)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 09:18:01 +0000
Received: from PH7PEPF00000008.namprd04.prod.outlook.com
 (2603:10b6:510:2da:cafe::a5) by PH8PR02CA0027.outlook.office365.com
 (2603:10b6:510:2da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 09:18:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH7PEPF00000008.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 09:18:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 01:17:45 -0800
Received: from [10.191.53.38] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 01:17:41 -0800
Message-ID: <8b794465-2032-46e3-a090-07d64e0b4146@nvidia.com>
Date: Thu, 5 Nov 2026 10:17:39 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 0/6] Arm Live Firmware Activation (LFA) support
To: Andre Przywara <andre.przywara@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Sudeep
 Holla" <sudeep.holla@kernel.org>
CC: Salman Nabi <salman.nabi@arm.com>, Vedashree Vidwans
	<vvidwans@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	<vsethi@nvidia.com>, Varun Wadekar <vwadekar@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000008:EE_|SA3PR12MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: f96827d6-df82-477d-3ecd-08df3b1db06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|261102123227099003|13003099007|261009223027099003|261028144727099003|261022105027099003|11063799006|56012099006|261026121527099003|261026140227099003|261021121427099003|260925021311599003|261022115727099003|260925021911599003|261022075727099003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	OXZeQvm71sqAZacYQ/e5WnxWESr5zfqdjS0OaXcNjaPGE6j43PgIHlq0u9iPJ5iMkSnXaMCiZbpgYaanoZNbv3rndP1Beq8s69T+fTd9xun6IvIguXM4+38qE9WkTf9KQQOySQ7lwZstd7YlBrw3hDuTiMqlkyh69TvbVtLamwenxSBW3rpD4CQErs3i8StveI8iApVILKN10VsGUFOtPKuCjQCr6BjYdt53DL+4djOxbXpRr6+DqsKYJlkrndYRlh7wNhdI3ZVJtBRz62qj4hjdZlevXpD/RUw/B4z9IEU+XDnuXxdf99wt0mX2B0IyVnJFh+IRDNMVqynmYgahetO7VJ4xJfc8EEuzT8NziiVpwlawT72TXB6EmCph5v80ibH/WGsJLJxXZkiSi85F0FOsPL/iDumN5qnuRih4UIeKNh62gQqngVHs4xMP5aZBMAQUQfxIzS/73SjJQkOsyi01a7u4iMRlD0JVNRxBQpB01H32xEt0pQBG8sW4BL9h5UtGIZnKWruJW6lP3hkRgiLeT+cbjcumhaUAXH/xcPxnw7u+XlLgfHLlK3R/SV4vP21Olpg/WSSPhBhSOGm027S3N7Y9CfH45uXhrYYv+ROsolsM54/kNiTb4obK7OVN0WhFCYm5asAPIjDZAYezyNoNQLg8/MN6KrMHxOsZouaIVyaZ5Qxw7uSH04upiq7+6JrSKhE3t8PRmDflZg8Mig==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(13003099007)(261009223027099003)(261028144727099003)(261022105027099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261021121427099003)(260925021311599003)(261022115727099003)(260925021911599003)(261022075727099003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8nSyLyd8NHqhwsCtVTeFHTGfIZNeVXMv+n6KcnR/Bd+v69na9e9Z/owL6i7+Ps7j//7XJHxu/6pMf/Nvjv+1LkIWoz3bYGTI+EIUv3BnDPxPAjH57bdwBDH0x3kp7BRwKPxBX1Iu37to+MgwdYVYFwosO5t0+tKQ3AGdXczhwxnzVDZXN2Hn48+dYpc+0HimozU04+k3PLbLD7NGP/c7G1cQ7fKjZuYEOXiFSH6iTJLWHtCPx7DAm299iKmInMQ1CROEsQwT7HLS/gg1JNaGyBrCSNR9lyUQBY9vO/DBzPPuqRFN6eDD6JhcFNh4wmgyg63N0CHQkcnEfQUXdbhkrUhBeg7aW1tc6PeDfarWPOI00MNs7xbQB6Xrrzo4kPC3qytaVIKg2WwjsvFzez2KED3FONsuS0LeGDnXOVvA9AWukwomBmRXRQKCVMW6I6yn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 09:18:00.9067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f96827d6-df82-477d-3ecd-08df3b1db06a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000008.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922


On 02.11.26 17:54, Andre Przywara wrote:
> Hi all,
>
> -------------------------
> a resend of the v5 series posted two weeks ago, where our mailserver
> swallowed one email. Just used the opportunity to rebase on v7.4-rc1,
> so dropping the two extra patches I prepended to the post back then
> (already merged). No changes to the patches themselves compared to the
> other v5 post.
> -------------------------
>
> v5 is a decent overhaul of the series for the "Live Firmware Activation"
> kernel support, based on feedback from Mark and Sudeep. Two patches have
> been squashed into the main feature patch, the name attribute has been
> removed, and documentation (hopefully) improved. Other than that quite
> some smaller changes, renames and reworks, hopefully for the better.
>
> For a high level overview of LFA see the rest of this commit message and
> the commit message of the main feature patch (2/6). Some simplified
> overview of the spec is in the top comment in patch 2/6. Also the sysfs
> ABI documentation in the last patch contains some more information.
>
> Based on v7.4-rc1. Changelog below.
> ====================================
>
> This series implements the kernel side support of the Arm Live
> Firmware Activation (LFA) specification [2]. LFA enables the activation
> of updated firmware components without requiring a system reboot,
> reducing downtime and allowing quicker deployment of critical bug fixes
> in environments such as data centers and hyperscale systems.
> It requires explicit firmware support, both via an agent running in EL3
> (for instance in TF-A, already merged), but also in the firmware
> component to be activated. TF-RMM recently merged support for this.
>
> Unlike the usual firmware update process (which may use tools like
> fwupd), LFA focuses solely on the activation of an already updated
> firmware component, called "pending activation" in LFA lingo. This works
> by signalling the LFA agent (part of the EL3 runtime firmware) via an
> SMC call, which then does the heavy lifting of the live update, in
> cooperation with the to-be-updated firmware component.
>
> Key features of the driver:
> * Detects LFA support in system firmware (EL3).
> * Lists all firmware components that support live activation, identified
>    by their UUID.
> * Exposes component attributes (e.g., activation capability, and
>    activation pending) via sysfs under /sys/firmware/lfa/<UUID>/.
> * Provides interfaces to:
>    - Trigger activation of an updated firmware component.
>    - Cancel an ongoing activation if required.
> A more detailed list of features can be found in patch 2/6.
> Based on v7.4-rc1.
>
> This work is conceptually similar to Intel’s Platform Firmware Runtime
> Update and telemetry (PFRUT) [3] and TDX module updates [4], but
> targets Arm platforms. The driver has been used to successfully activate
> a Realm Management Monitor (RMM) firmware image in a controlled test
> environment. RMM is analogous to Intel’s TDX module.
>
> There is effort on similar work from the OCP [5]. Future work may
> include integration with utilities like fwupd to automatically select
> the appropriate driver, based on platform architecture, for Live/Runtime
> firmware updates.
>
> Please have a look, test and comment!

Hi Andre,

Tested on our hardware with my 3/6 probe fix applied. Automatic 
activation via the ACPI notification worked.

Our internal AI reviewer flagged a number of issues, which Sashiko will 
probably flag as well. Sashiko has shown this series as
"In Review" since Nov 2, while series posted around it were reviewed. Do 
you know whether it is still working on it, or does the series
need a resend to get reviewed?

https://sashiko.dev/#/patchset/20261102165421.3651202-1-andre.przywara%40arm.com 



Regards,

Nirmoy

>
> Best regards,
> Salman and Andre
>
> Changes in v5:
> - merge the timeout and the lock patch into original feature patch
> - drop "name" attribute altogether
> - rename firmware "image" to "component" everywhere
> - add explanation of LFA concepts in top comment
> - use switch/case for error strings and error mapping
> - define error codes with negative numbers
> - rename SMCCC register variable to from "reg" to "regs"
> - don't open code bit masking
> - use only one SMCCC register set where possible
> - rewrite retry:/goto into do/while() loop
> - make example IRQ to be edge triggered
> - update activation_pending in pending_version_show()
> - check SMCCC version to be v1.2 or higher
> - check all SMCCC functions are implemented
> - remove blank lines before return statements
> - use UUID instead of GUID everywhere
> - improve comments
> - filter for ACPI notification 0x80 only
> - update ABI doc to use "component", not "image"
> - add activation_pending attribute
> - fix IRQ/ACPI registration error handling
> - add comments documenting lock requirements
> - print LFA error number when printing error strings
> - explicitly free IRQ in remove() routine
> - reorder functions to avoid early empty prototype
> - adjust SMCCC function ID names to match spec
> - copy list of activatable images to avoid infinite loop
> - update pending status when showing pending_version
> - cast error returns to s64
> - replace "N/A" error return with empty string
>
> Changes in v4:
> - streamline threaded IRQ handler (drop empty hard IRQ part)
> - add lfa_to_linux_error() conversion function
> - use Linux errno codes in more functions
> - drop bogus LFA error numbers for -EAGAIN and -EBUSY
> - clarify interrupt purpose and edge trigger requirement in binding
> - honour signal related return from msleep_interruptible()
> - call clean_fw_images_tree() first in driver teardown
> - streamline ACPI and DT registration
> - cache rendezvous status to avoid race during activation
> - only trigger activation when writing 1/Y/true to sysfs file
> - adapt to new version of Aneesh's SMCCC bus patches ([1])
>
> Changes in v3:
> - change node name in DT binding example
> - move SMCCC function identifiers into generic SMCCC header
> - rework to use the new SMCCC bus instead of a using a faux device
> - add missing workqueue cleanup in probe() routine
> - squash former patch v2 3/8 into base patch
> - use get_image_name() more consistently
> - also consider -LFA_BUSY return in activate call
>
> Changes in v2:
> - restrict build to arm64 (the LFA spec only supports AArch64)
> - rename and extend central data structure to fw_image
> - use separate GPR register sets for some SMC calls
> - provide wrapper for error messages to prevent out-of-bound access
> - return GUID in the "name" sysfs file when image is unknown
> - fix wrong attribute in pending version number show function
> - add missing include files and order them properly
> - fix memory leaks in error cleanup paths
> - handle lifetime using embedded kobjects and a kset
> - drop global lfa_lock, use kset list lock and kobject refcount instead
> - add DT binding documentation
> - add timeout and watchdog re-arming (contributed by Veda)
> - relax timeout period and do not block while waiting
> - register ACPI notification (contributed by Veda) and DT interrupt
> - refactor ACPI notification code to allow sharing with DT code
> - use faux device instead of platform driver
> - add auto_activate file to control automatic activation
> - introduce rwsem mutex to prevent using stale sequence ID
> - use labels and goto instead of infinite loop when retrying activation
> - initialise workqueue only once (thanks to Nirmoy)
> - various cleanups on reported messages and code formatting
> - rebase on top of v7.0-rc1
>
> Changes in v1:
> - Updated SMCCC version 1.1 to 1.2 per the LFA specification requirement.
> - Changed "image_props" array to a linked list to support the dynamic
>    removal and addition of firmware images.
> - Added code to refresh firmware images following a successful activation.
> - Added a work_queue to handle the removal of firmware image attribute
>    from it's respective kobject "_store" handle.
> - Refactored prime and activate into separate functions.
> - Kernel config for LFA now defaults to "y" i.e. included by default.
> - Added individual kernel attribute files removal when removing the
>    respective kobjects using kobject_put().
> - mutex_lock added to activate_fw_image() and prime_fw_image() calls.
> - Renamed create_fw_inventory to update_fw_image_node.
> - Renamed create_fw_images_tree to update_fw_images_tree.
> - Added two more attributes due to specs update from bet0 to bet1:
>    current_version: For retrieval of the current firmware's version info.
>    pending_version: For retrieval of the pending firmware's version info.
> - Minor changes such as, improved firmware image names, and code comments.
> - do...while loops refactored to for(;;) loops.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20260914060511.277948-1-aneesh.kumar@kernel.org/
> [2] https://developer.arm.com/documentation/den0147/latest/
> [3] https://lore.kernel.org/all/cover.1631025237.git.yu.c.chen@intel.com/
> [4] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
> [5] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-7-9-29-2025-pdf
>
> Andre Przywara (4):
>    dt-bindings: arm: Add Live Firmware Activation
>    firmware: smccc: lfa: Add auto_activate sysfs file
>    firmware: smccc: lfa: Register DT interrupt
>    firmware: smccc: lfa: add sysfs ABI documentation
>
> Salman Nabi (1):
>    firmware: smccc: Add support for Live Firmware Activation (LFA)
>
> Vedashree Vidwans (1):
>    firmware: smccc: lfa: Register ACPI notification
>
>   Documentation/ABI/testing/sysfs-firmware-lfa  |  106 ++
>   .../devicetree/bindings/arm/arm,lfa.yaml      |   50 +
>   drivers/firmware/smccc/Kconfig                |   10 +
>   drivers/firmware/smccc/Makefile               |    1 +
>   drivers/firmware/smccc/lfa_fw.c               | 1057 +++++++++++++++++
>   drivers/firmware/smccc/smccc.c                |    5 +
>   include/linux/arm-smccc.h                     |   15 +
>   7 files changed, 1244 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
>   create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>
