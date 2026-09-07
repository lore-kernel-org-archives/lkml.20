Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A544432F6;
	Mon,  7 Sep 2026 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769765; cv=fail; b=pYzc7T/FthsdNgZ9k0B8tX0qfq4RcxxLqUX2iHL2pQr/u1QDKRZLGoCOHD75thN4JKE9N6og3IL6UuTGfZ+EViXpdhdZvZEYczgFRdBH4S/3aG3Knfb6Y+uWQLbtn23aggZ1YKY5HeD34cSnyB1Zp706HLnLIACeWagAzgrvMso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769765; c=relaxed/simple;
	bh=8XG+oWRMJQ164B8zSo6nkO785ckqjt+45U2RBhzGspY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCDa1av7KGNL/SJpU4JmmzxHrixzqRSMmBJQQxi5LrxWsp9UIRBCikeZ6sBmDJOLPs9iejQMlNY/WRzUejb23lfbRExyljbD9xttevN9Camvx37nWJgpGeIi1zKAOTToKj3w5IPVqup2SKK2ehSvOFY5tnb7aecj/67M6zITNBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=uxiepYVR; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="uxiepYVR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejwqfy/Wyy/rKQc2R5Pdf2pl+JB2FmMVUzrObCvxhjgDEw0sheGStnmdXBocM1/dqs+Yh3dwRiculxRaOPspQoDIQtXmWWyjI7uqFhY96v/yDOKDXY3Vx2dSWEUPo4gbkapVjS+91Wu7P4d7qeTBidw/Z1yFWjjIjWNlFQaP4e60kz2Q3ZpXYHEvP8hFevCToDzn/DUnXTmrUmeONrFdEU5/2pVajS6+L+xWeiSyDSPQgqopeHvtaeuNV6Wvpw+xzzvQNEqvYHrKI5XsC4PT38SImfS5gJbSyt2U8koRv8cH7pnc15/qX7ZkSLcRrtNh+Ff23G9e3+bbtRo6SdkJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=gkU51vILoAHF8r5efXyvnRRG4dkBIH8NytJWenVvdTpcAH/e7hOSXQEw0mbUuHd2RWZYbOkeFw0Iff+sHsetaQEgnP6JDh2EF8sBchrnonRMF+S2f2ERHYi9C8/Fz+rlB5jqiWBY7GxsteOQ4c3AGMypo7D9WOwirKPfqGWL2MU8zHr2X0SSvFE5PWQOAqIuk/JNe5aXi6UtGO6rb/X3gqu7vpQ1mMWsaYbTE/Kgv9hTNeSDWU2syWW4XzjgjeOf8yi6nS1gh4tvde2Wqc3rPYOBa24seL4mq24Vq+gN/TOysB/sRb+XaMGKwhpcn6XobrygfDbdZs/N2pAj4mEc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=uxiepYVRX8FWXKXPf2toDruImHi2TQ4RZBSXgbC8A9sllqC62iKfoAVtZq8TuDC0f9XLWLjGzuX3MSZcoHYJIrQcNoaiR+r4T3UjkKfcLfRLini3IPTTyj80TT+iblGb7oimIC67KsZXjS9g068b1hiLmLNChX2oeTcP6dKav6c2QUmSfUH+JhahsORBkRjY4jBTUktCexG/lRWZ4B/P6DsFA0dzbKughTNlqRACPL/oIgB0zbjFPqPIp13tU5KGM3SPQxK6TTVsJ292EiVJOARGKrCUi26QdbJRUUf5M++wleOdZ1FFjrhj0OF0H7IZAaFpYe0Sn1INxrpEgJSG8A==
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v5 3/4] arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
Date: Mon,  7 Sep 2026 16:21:40 +0800
Message-ID: <85f2d3d2d53d7139fd8969a737390823f1f26803.1788757821.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 10df4c38-8d49-45d0-57e2-08df0cba1c7c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	1N0MiLO3NKy+TtYBxO8fh8fcm8Qkbk/+7bm44vshThdvxwoF+9DbcXTKqQ7yvujPegrOQrgu1blUNVmTZYPLMqiCfNFUDahddhSUJo+YPqQgpHUFLU9QMMrMCBYiQTIld9AX3ipru7zq4s8BGI30PvawrQN2cUY6HTMKwh/QdAOHEDoVSkSdj3zSLAXKXC7KcbHGk7KH3BeYtbIsqqmitecZDh0V+pC/Sj1yigXR4Niw5Ks8GZzV6O1mViFYK2yMSkWJxkNCbb40h+47Zs/PpHDhqI2sDbBDHV5TFzWDUbrAWbWBtFaILpoMaviEy29nbB1ZkBoYLlXjRa2cHFRI2XPBjxvIgTMqKDFmDYBPQi7t2v2kPBpA2Tls8wb93K4SE7Zus0yVgVEZqL0sP3YiDRp1DFygnkN0FubPRRkoXEqEuG4LkBCBFu0mztMqMczADfo1U5mxO/QPahWr3iHv6sNRMjc+LuTVspTH8609DvwyI4hX1/w/60PdIV64pVqcjgfmsu9JH64OTIKobf0JWuxzWyqB4l05TCN5XNteMU3QPsjNGn4IvU834jjAZCz0VP5ogwZYF9/9m0gcNv3NHSWlEnjfmeiCfeu/r739dl5/enzC2JewSKy6YmPngttbaUZU40AI/vmXlW8f6w097BwdTDro9+KHQdNhJbKhDzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6rBixOgW5fL3r+lSuXaQ5JZO4O9jStfVzOYJ4w40TN9VbSy56715twBbG4IB?=
 =?us-ascii?Q?9SfhFne2UzpxXoKJNemDq9KTNhdLURkdPzTng9zalfRPxHBYhc1Nnpqhw59l?=
 =?us-ascii?Q?eb0wxyiRphHqMirLPtnizkIIlb/jYU2Nx1uGh1mCw2P0oeq9fqxe3IErhzPH?=
 =?us-ascii?Q?jpNAyb/whVjDbMJHXHn8JAtn/J9L4Vm+GY8Y2AYG9aLUhQfE0FVHAy8lGBmE?=
 =?us-ascii?Q?yVKCsd4xRXA1kseJsjIgJxbefQwGFDnqLvxDTQIBb40yFRlUjdqS5Qg0e6Wy?=
 =?us-ascii?Q?i3uxyeleoq/ZuYPtSMKzseSLV9/lrKfsPQPhvRLvdKrHwy8qb5i3oOqVztuJ?=
 =?us-ascii?Q?Xr4GnpC2GZe/UUzJ2Gh3/LBDx78C+dKG0HjpuNhwL9fPzgUntBMMtTRWPu+L?=
 =?us-ascii?Q?GTUlpB9U8U6GqgHNFdKwiNS563kzz1IFqCmdm78wRmB/JljRI0aNV34Ao6Ss?=
 =?us-ascii?Q?kp3paL8/uT2FVcrk2XZ2/xUYjZjj1WohU0TrukzaGHbGabkllFN1UtXDD41q?=
 =?us-ascii?Q?L25iciN+qFM9m7aneyBIMIaM7hCy5d6JqdFMufzA/Oy5GRwR9/uZU9ryfbry?=
 =?us-ascii?Q?n8TL6/kc9kymLB+AdpOTkOdVGecsMgJeyNbCVcqjhRSUVcT5XDHN+pTBuO/3?=
 =?us-ascii?Q?Pc2+IXCvtG7K4o5PfTc48Qzt2CupCHaGZIXqQ6UV7aT5YMaxq1kkYe/N0zr3?=
 =?us-ascii?Q?V5vNp+yX6cTk75dhWtDXuGvyqMEuFZYxdgNL1i8Fvb1Mx72vpMDAP1p2+KBI?=
 =?us-ascii?Q?N7E11QtJMhQQUbDggevHVu3wk8kOjPykFlVDz+PjBAO6k3fH3XqdB4O8hxm8?=
 =?us-ascii?Q?QZ5sYNn6pLuKVDyBMS9yspVZGXz4sQu6/yQQ8JzL/nvQmjzrqEfibD+0sRh5?=
 =?us-ascii?Q?Bx9MClxVes5TY6zqXs5KTfpdcpS5xSAeJZKoO6eiWH0VsDl5ScpG0ciA+VJF?=
 =?us-ascii?Q?zB1QblzM8U+nIIFJa+4M4a/2gl3+AL7jT/sZC5EGjK8L+e3lPLQ7qa0nDXE/?=
 =?us-ascii?Q?F1TX6ed9BFcO+zlNeVDPwAJ0Hwm8CEzskye6FnqSZAvGk8eQsmTEcGfSHJpA?=
 =?us-ascii?Q?hWReHpVwQYCaAr5aTNYt74MZTwil8hEYaOPQt9CWO4tDGo85fCBjOQBkJ0iT?=
 =?us-ascii?Q?YAzJVfpxRNao99+M6pBmsZX+QJlVAaVRaNmgrui4PzyeyclhDMksooS7MvBD?=
 =?us-ascii?Q?H+CQqvvh2t3mzJKHpUrO608jRKIoJihl2UDuCqMxr91LwS/I3t4wKeHEI/3D?=
 =?us-ascii?Q?q57jU9KkWLWhZOsFHSUvOXXkC3TS4CYZggbaVbqMJwRmOG8jYKWW68qrICku?=
 =?us-ascii?Q?tDdezov6gWvcipZagW02idyqwRRiol7lixBUuaQ7KrbfpyyH/PYYulQ8SKXH?=
 =?us-ascii?Q?PtDbecn159OrwTyWg3fsbnd//oS3aRf+mh8n7qpSVt0+uxYSAJryzCzVUAii?=
 =?us-ascii?Q?wZY0iohvoAWS3Va5SEmZh68toB53v5CcCowmsWTICLxRYvGfXLeCn0bFRO8p?=
 =?us-ascii?Q?HaRok8LkgBr31u00zoRlBz0odEUOeWs9kiAGcNNusSNJ5Qy+NutUec0eiSH+?=
 =?us-ascii?Q?X0u4S5dCdVpHFEhHIaU6EybfqilExMU9E5mhcaS1im/R1wm3mM406W8qrHOU?=
 =?us-ascii?Q?T70W4oI2+9RRc/sr4qPwENy97Ytmch51kU8866ib0XWv9f1jMzP/+Ag8faYf?=
 =?us-ascii?Q?rsN5tD7OAV19Ez0B/IJtGTSdHUZrg4qHlKsRNvCWpcRIVs12RaZU9cXqOmFJ?=
 =?us-ascii?Q?j8nRD+eF/yoN7+LdPT5001HDN+zqtR8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10df4c38-8d49-45d0-57e2-08df0cba1c7c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:19.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ20IWVnmIaqhd0F8TcJHHZdKipCbDUfyW/xcDDdLWF7erQBSvKJ95TxvCC/UCWump8y1D1QDeRl6k5d25QRDummDs9xPZWY76sxsXv8tsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
USB0 is not connected or used on this board. Remove the USB0 node to avoid
unnecessary initialization and potential resource conflicts.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index aa9294494421..c48867cc3043 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -104,11 +104,6 @@ &uart0 {
 	status = "okay";
 };
 
-&usb0 {
-	status = "okay";
-	disable-over-current;
-};
-
 &usb31 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.49.GIT

