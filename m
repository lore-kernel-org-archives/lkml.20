Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFF43E06A;
	Mon,  7 Sep 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769763; cv=fail; b=D30Zizk2UjciewjeukpLTPGt9vPFFt02e0LzwQTExOq3O0YzyAW9dGupVpgjr6Dd07ExYPPo+Ck41/Hk62USwYbVQoaM1nbnYJ+N+00XIAnfzJjNnv6Os+r2YK5uyfq+ZpvnnxDDJiQjTS0BHeY8QIOjkh8KNT/SEu5B2KY1bRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769763; c=relaxed/simple;
	bh=WmjM2ny8eyxfTKCApTNykvy+ZGH1GOgkaiNsbdlkUAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=faynDme4f6ZqHL5VupZ0edbLa0488FzpAz1M9JfOw0SJURvpObddXeiZ3OBtaKn5ABletLYS8iOes1IuTFM/D/qCH7xFbZcE1k6x2ICl42Sa+OiqGar8CGoVjoKQrQSa1XQ1uTF1RrreekOY8Ee16tqNTpqakJ5m67/NliI1V54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=CrDWbbFE; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="CrDWbbFE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1guEYRQWoe9bT9zbAEHMHBdA9y13CDdeDM27416zgWTxtRYqM0r8KJEfztLgGB1Ev7vHZRTPhbCqCUA8P0iNiJREDB5/27nHaleebqvopiyhreynzJU4uyYTuZ9PLzTIbjyDMSuxI0zlm+d7Eo4waVVi0GYhjemivQRVz7gvR1LEF+mFf9mWAqsh6K4V4/eHdVK6+y/RQeNZ2ysvcPVaxUQRKj3gVri/sYeZgruDnRsRK2CyXU3qwykjksTtMj7cZuyZhn9jtsT83TVVnvNfs/kvsRWrnZ5bBsyHOqtiQt4yUzhYHoA6YBmJAP9IqXJYctEU9OlkL2gmAqkDiNDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgq2Ymqk8DSj2LrnvhQEzZVIqVNbu6pnaQRuj8JdnFw=;
 b=vIlSH12eXszvhd8ehomgnHGxgJiI9Ma1T2m1LNoljwFVzOaJMOJI2XLh4Vz2/oZnFFnR4Nampu3eJOGqoHQnbfgCarBEc077xVwqQrz1NqXwUd9FkjuvCsJwjwBYevouR/bi97gBfy/Nh+q19bm52l/zPG3vfMBoalkqS2ke6EaUk5LmCByIuLrNcpnQJPHIVaGshKi2eZu+61p64reQu0vC7AlSxL4jCu3gCcyNSblKc2j0mFyA7wf5F1eUkRo4jXtGehqnI/CoUDExlvch1XkiLJQYYPTzjLSqXsp4AuJC8zT5D+0eFdma6dEF2/LXtU3scstpIlU7m1r+zUNEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgq2Ymqk8DSj2LrnvhQEzZVIqVNbu6pnaQRuj8JdnFw=;
 b=CrDWbbFE0DAjrVMAqZ781JgTlfr72PRmcU2G9lP4zRNkf8hsYiyuTDBhacyQrfQ8khK/o+sx41uXUIre9Ox/j+WZU3Hm5uqtn+r6j2Cnqq7I3cZ77QsN2Ce5P6KCX5pHRFijoc5Zb+eio13+777CwMmv8KDCZo/QWrCFZMXnTXbBbkDnuBQnAjqDhUq/AYaPgkIgdEOqcATpx4cDbIRN6F4ocY2pkCLys6o7K/bi/0Rjjt/hU0D7uiZpn7E6r26q1LIozb92JrNKCQgCGfOE9kQO56h5L8e8epf5qFAmhkA30hvHiRnMrpNnLBOKkbhvZ1C+oSzo7EtNS2IUkZV9qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:19 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:19 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 1/4] arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
Date: Mon,  7 Sep 2026 16:20:24 +0800
Message-ID: <20260907082203.2639395-1-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.v3.git.adrian.ho.yin.ng@altera.com>
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be61c9f-8a28-4238-cf5f-08df0cba1c3a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	x6gX2/pmR/MsPxpU8mSbpwNWl72mRcv7+SHIqCN0upgXhcymgkUUP2V7tsNG5klMytY86n0EvXaVz3qJldX4QwXwm8qCtry3T20ThurOk5S2h6CgZSjdJJ9/7l9/av8hwA4LUdnCYS4Boa/642CJdt+HyP1aNVYc+GoF5rVDPeCodukCbmWFANghh4xRkMXzfF5PPkrwam8vjBLH3+7MUlUAMhp4aG/0tfgUc6ntPYQQXj7PLxdJvn/Rt1rLS7SAhdKzXmHbVDrZ2/7HsaLnKlbYzLmaAKP20BxchCJH2MXhCB5R0fqL3vxZy0e/fsZmFVF/Dtx6+U4KYbTNPYj1HCz/r4BtQhVP5QUMvbXJGK/TfTDbbu5LmS1Hk1exUH/xrLLgBZyIWHTfzF6lls9ERuiw/lQRUZFu7u3kZyp1GUlDtT+MM4Fbn80iearIG1INAOwFnnvn/tDTRKP1V0FcjzZaJE9iK36PXqdgrsnBbD0BBCG3H32m/1KkeHukWIPYc6ie8lZ2r3K6v3nQRv31uI0MEJic+GI5STXkppbS0dja1vFiNmqE2eQ9R+k9izqV5TTmco6dbuvTWDxu7CiNvBfrBpNmDHr+Bcdef0B5WpAxGFb9EFgTqpFUmKCT4bJANuqo3CgsZNoWD8ag0GXqoDE6BnoHkWAEXB6ai6+N8YI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0LcsaMYvVY3p31oDQ7Rab9tsbNzRKTQS9rLIxu+8xeQ4gorDsSyA4htxxXmV?=
 =?us-ascii?Q?VpZr2dYlN11PZf2ZifCK9SlqbSSh+DSHXL4g+LAr3dAiRS2k7TAnD1qK1RpG?=
 =?us-ascii?Q?VCRBAqjOFSURqdkXbSEnoChJyIj9eQwbZY5WdwPuSAmfAhka6WKb4Vkyeb1e?=
 =?us-ascii?Q?0vlIuOnALvu6xPIJ75HaLv4GD9xoyUbyWO/8LK8j4nWVmIJWczQLjjrUZ6Zx?=
 =?us-ascii?Q?jftcgy2GkzkdioExZFjlqgw2I8YzsoaKciP+rwn218jB+P9Xz3zYFBhIi9zT?=
 =?us-ascii?Q?a3aKl69U0AKpJTkJ2X/jJ9M6hbQhqfVs9l15GBCDakBegZTCuKBCuyXbHzFk?=
 =?us-ascii?Q?h4S48ixmAv2bopa4FurVEF1rl69YMj4xvIR4iKMPlcyc8RMWrgFilgtn2frC?=
 =?us-ascii?Q?9j/BBi93XrMViADEEs7X8tAiRX13iTsGebAEW6QZMeC5i+s9vCCvHX0WNzMg?=
 =?us-ascii?Q?TpdPG80TF3PIqKu35LuLXeUYOgoDMuJ83by/D9YwH3NNLmS6IS1+4E0PG3rO?=
 =?us-ascii?Q?y7wqfNhXrMz0qmI1wE2gzU4wEtcHvuVOC4+POAhsjn3K21jQgbQx8w+vpfF6?=
 =?us-ascii?Q?YKPrwX0CmdURWkO3Kz0v+Z037c3DZajp0t2OEqHo1fGpg0+NPFZkIa0x5G4R?=
 =?us-ascii?Q?GEJXfke0bU4Zn9cGxBvuRyi8NMhixWOulGaJua/thGobRWBHHMQWK2O2/CXx?=
 =?us-ascii?Q?3By/UoANN7E4V1/xTwbMUGV4dihg0FxKP80IGSHyWkcaBTI+8aG2be1Ax6NJ?=
 =?us-ascii?Q?dQS0PPl7kmQBHxv1XdEqQoXJNdQiy9TBQYwMfCCnRbL0Y/GyMDAyJdMl0LPv?=
 =?us-ascii?Q?2sWF+kyIeEk5LfxPUVIRT63GrDpiqYPEptFuoeJX9Aq4SnsuhJ/X0/86W+xk?=
 =?us-ascii?Q?/5jUUjcsvnnGE0snOJxs6I9WXmWTbkNg+XCB5Y8212ZM60XouhvZKONdo8j8?=
 =?us-ascii?Q?3rm/ECfAKKuHDvKQT/35uSVRi6/s60Bp2psUKNFbijF+3GHeD//D8k9ex3Ku?=
 =?us-ascii?Q?rGk8+KuelR5RIRF4ntYBb+/lEF7JdM3QwczRg2qvFa3FTKrZ3XmDzmipVD3w?=
 =?us-ascii?Q?3+vW/rl6Z5MZ6R/FATvo6UKytjJdBdBUov6ZKdzSrleKxqSaKJTjShY3MIpJ?=
 =?us-ascii?Q?xFHXGU3RxrZult/asK2DYeF51bbacXSl/qnFc7Z9BAcI4gBdQ3wzTYF0qnTe?=
 =?us-ascii?Q?p6frEWZntGixclmke/9NOOWlgsxDayp5mW1HOvLVvBlAiHduQfTnYDfJA8qm?=
 =?us-ascii?Q?nycSiFidFrDAONcC4Agvcyc/VdtZtTYc/1mVk1qrWBVz3iX2YNXulahWv2nQ?=
 =?us-ascii?Q?40TY04gjMi/osQEAFHps8D/JYP39TeYU6PoVkoFqdylrHt9RhuKsSLimE0aA?=
 =?us-ascii?Q?RO/KeyaSzE9Osc9mSB6yUdTKLA4YalgJECv4n7aEHrbiqidajQ+UFPG/ORee?=
 =?us-ascii?Q?20ZQK1Cpwk+eC0vwuwY1UXi2a4rXSnmj8PEEcZ3akCnARaO4BtYO4p2LfH3P?=
 =?us-ascii?Q?FQ6MxsHtjdvSaqrGJg7YYwjZDna4vw5DUo+hjp0WyRoiZ3QXnOLU9dq6q7VG?=
 =?us-ascii?Q?0X1gdOvWha/cA1ypZuSU+TLduw/b+JNkXMVj8Rqzk+o3tGNsIJUW3FSRyLWQ?=
 =?us-ascii?Q?BUA4uu7Pd0PkQDHx8aqOqNNYX0Pzns5/buuioFG1aQRJBIja2Ck30xoidd71?=
 =?us-ascii?Q?FmXTboqeAsC/absEJXT4KXbFVA4fZnbTy61w1lJJT7ZsGSriUVzIT8ycDEVO?=
 =?us-ascii?Q?Er6ojkSC95Oj2687AgWrZ8UMYDV3UBQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be61c9f-8a28-4238-cf5f-08df0cba1c3a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:18.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZePp9N70di1QZmmPl/CNVqNnoQ8neSQHg2kWk949E10L9q6e4QgaxInzBrCyhj/eAafCh7qBtlXGzePW3Vnax/E3q+MUf+rKCO7tOHTIhwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

Add the fpga-mgr child node under the svc firmware node and a fpga-region
node to enable FPGA configuration and partial reconfiguration on Agilex5.

The SMMU is already enabled upstream; it remains a hard requirement for
the svc driver to allocate DMA buffers within the SDM-accessible address
range.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index f54767d1526e..2e9844ce1ed4 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -85,9 +85,20 @@ svc {
 			method = "smc";
 			memory-region = <&service_reserved>;
 			iommus = <&smmu 10>;
+
+			fpga_mgr: fpga-mgr {
+				compatible = "intel,agilex-soc-fpga-mgr";
+			};
 		};
 	};
 
+	fpga-region {
+		compatible = "fpga-region";
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		fpga-mgr = <&fpga_mgr>;
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
-- 
2.49.GIT

