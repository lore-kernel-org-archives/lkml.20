Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794259498;
	b=BNzzteCc0PHuSz3oZeqZLNf3wTPBa+V3/oK7lAc7X0+iqOf5e6QYQeEC4Yd1ReqS2Bbx
	 yU1m+TZchMWut3tkZuDSe9a8rFiC2VFVsAKOW8Qcneo4nh6wFRMOFd3HIXYoIcU2fFY3I
	 brKxpZUKnhvG9aBv3oHXj1lGEUIFQOaCgPM3gHng9gvKu9vNDw+KOnRvyi+8UDEimIvDf
	 8MKprv45nYCus9s8Tys0FglDd4VZ2KtwttrwnurM83S9aBFi9UuZuzrvlc+YplFSI+H8a
	 7Ooh49/+7abe5g3jdKCxGdvPT2tLuUXbEPzCgySdytFEInC51+HWN8UFg0WDuq9Y3eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259498;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
	b=gadutH99VngCYXNTQSGGS7MJExsRGujbYSmaBXkJZRYs1WR8gPpVDwF2izl5mHjZv8+e
	 uMaAYEawLUyseQskxN9T7Pv3W8z1E2HOAR5P84BhbHX+8ljLR282ap2P5goaTNIi6C2hY
	 foY0jdRyGDDxbJRBkC3YWNo6hzLmOlpKsKNRFkn9XrFn20+suG7hYdyN53DMU5Y4wpGNe
	 cQPhyhoi9E8qoRT5Ku4TDGjydH0GbCthxumKKqq5h8j7rljL1o0TzBr0KtWEi6WAncCng
	 bAxVBlwipphtAihh9utGbQ8kS5NfuUSQbsXC3Q66oTYtfo91kDxha9PCx3w8HYOXT8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NE2fevFM;
	arc=fail smtp.remote-ip=40.107.201.9
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D4B60A3809
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D4B60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NE2fevFM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1qGBui8JDShArC8ewmsXR2/aVLCDIqiWDsD95QnDRYAHKRwRLApxd/bgVDgqc/PnxjF8IwwWa41VY05inaLVA7rmD9ZlhJyP0S97CeeEKVORAaxDvZO1shpUkB2rFEVoYul/aXIDKy++eE9wDkWzU6SLOVAOoZ9049flsKTO2qaPbdI6waAlTsEVB2a7yLd3P/EUzCQMVn5KbkN1TjbgOqIvRKojddLmlcW25Oo6bwcsCFWP1D9xBns7zCpY2tvVmPJURfSk0+FAG4N8CaZFQlB8f+EViAj/as6+QySj/Uk93B6zSnivin72snBYRdSsx95WJTRHsxjOGCM9cB2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
 b=YOjNbTB/xfai+5jP6x+Qn/zTqTmc2CJjvXrAjLPAE7hMtirFVLVGMUb8fXcWOSYEqhGRaFiq9GmowREuSp2wEaAzDmtnxzsoTajuTx755BGOQxwwAdjMjptPrdHnLlkSunIODU+f7Ht7iKPyeFQG8iJ0X4kFPvoOG1BeBB5KQMRCrvGJ0lRhUjkNg/QiPl+tT4AML/+bq8QgqI9sCcpB5XXO6J8zzN2vlviMyxWKlxNnC+eVjzEUwtPdhAG3SODXYucLSG6w+EoLDel5Vx1ageQgN28vLRuN6XyhtsD3M2ZswO8tdTKCiU/+lIpOuerLutj06cgA39Izrmj194LOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
 b=NE2fevFM1S+faop21hfBl57Q53Uei0I1IyxmD+gw+fV/6GitQMhEoTNx63LGNHSZX/529LwFDeRcnUpskj+rTQetrWuEysZiNy5ctTQeChjauBaVPx0MqalMBEF2r1V7/BpD+MwMMFFsRfoMBY9EAj5QxK/fA6W4/C/IcCE9oGjjvQGpSaE3+neuKprbulIiWxtCR+8fzZX+pVSO7OhRF8m3Nq2UBYzxMPwWCZ0if4Muu+47nvMDJNS1evflMTdbkzbVtxX2Tt/5p5kGAZB+uXA+fN1PdQMGTYiCDXhFI30N/Dfk5qEpNmReRjGaqXko5bKEERH5PzW0V31UxemUTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 21:24:51 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:51 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v3 15/15] arm_mpam: Add KUnit test for CPU-less NUMA node affinity
Date: Mon,  9 Nov 2026 13:24:27 -0800
Message-ID: <20261109212427.1409204-16-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b3f51e-f1be-405a-b30e-08df3ea7e3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|261009223027099003|11063799006|261021121427099003|261022105027099003|261026140227099003|56012099006|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qiIi7D2hyYkVT+7xu+7DwGcblWuht8v+SsQbua7v5dVTLaYO/DosoXeJB7w536/jYpcx4dxBL8//AOsO+gkJkvsO/alCpNnBFjvA6Xma0qurhqe7x0WSPj5ietlf7jFSrXbHS8L9juMju6jL+qRS6p7MdvU9GctoX10a0c4CwIpLEgZq0/QP/RfsafnYaUm+MBaLad8Ud9WEKMix+7iKGWj75Fu1v5n1tsLQKDpDyEnMYsz6IROSdiSltA8TDiuqycoXpYUE5tPw+HIQw9+Mksqych68EJZcjbXTtwIFDTi6ZvjYbvytlM623KbWBm3Sviz7i/5C0TfMOsah3k3bsqA1bcwx8LxIjNAZ/62m8SRiZZ7SrHxvAZZzjCz5/yFt8WX9zj4j2cvTK2H5mwcCRNdDm8FfAkjFuP7emh43r2e7PgxJddZ4nzOqlTtiTHr9d6FuhDmauywXjpUaCNgtDvkoubFdBy83GKnAvPadOH8qnA6+NTuGROnOf61md3iDoXRD8wevpum462nSnIVt2Iy21CMBqF5OIgMfcMAeQVlYVW5XQNg8DNROf5GSwH8qQzzAreloiHf36/C9ZSjZLVsZU8wfBH5ErltEPNA2mPisngVum2OdpXfs9hQ/DJnlH8YDN7X6FrkKHzBJ/pBP3Y8eCE/oij0egLOko+E6etN5LnedTzeS9a61XvAMdRhXexgeQVLH4AS2DGaPQGvR+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(261009223027099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(56012099006)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ehGhnp1Nqk1aDGzAdK5NrniUy7/c9Xz9weRE7se96xEbZkyzkO0YuGZYuHWQ?=
 =?us-ascii?Q?UzwhRz0sA96sj6YWH3p18w5XfU7LFxem5P0KYr9NNBqLDaU80UooQzmmwFAo?=
 =?us-ascii?Q?TLIE4IvtsvwZzIuWly1qTqy+rUDGZU+7xywScG5RZaLCo1hbkMFmgeZ5jAtD?=
 =?us-ascii?Q?GuTxjPGsz5JMr1swL0+K4evBDuKKBFNKDlf32/14cBW0dKt+W5B7sWs/6lH2?=
 =?us-ascii?Q?CUElClv/QJC9RPoUkMG3dB6HrS6EQgdvSTB/WtfgdX+copJpNFBdwrrnrmic?=
 =?us-ascii?Q?QTa/yJSSniObtBa8hIqbuB0Dcl1U86jGfwQ8wnuOp9lBRwC1GzV1WUCByYif?=
 =?us-ascii?Q?lBJmKUNuSbaYvuYbodyytTfMjRhbTdks9TfqnBzrkvIVmC9UVqUoC8o1/v+Z?=
 =?us-ascii?Q?PLuOznacL8HY1o9AQbMIddKzXXZ80vb4bbRg/n77kZaCeFYBZkCRlqZNuHiZ?=
 =?us-ascii?Q?nJ4Zg2ouxZgIoCa2eSJ0iGKUXwHRNvc9DX0YTthoDY62hHqbH1Qk4oT6+79c?=
 =?us-ascii?Q?io0CKob49WhccZlHY3qEbWJt8clGsr8Rg3zGkVnLW+XLgFoSDP0WBOWuQoLg?=
 =?us-ascii?Q?4Dt0wVyElCr/mxgw9ynnVWynlcYaO6VLgZ+PrKjYyuE5ynSnxrzPIaNFTmD0?=
 =?us-ascii?Q?/E3hiFIOhTvJYqZD+IbNfGEx0pS4mQeErtEqanV6F/8zDdO7VEHqYdR4jijO?=
 =?us-ascii?Q?wbeBVd2thYBECs4jgRSccxyeY1HVse7iKvui/c9gOoL+xZNj2ynNqRfOf+Zl?=
 =?us-ascii?Q?t67JQmPU8pzWol1dCoQ4z9e/Tw4dg1KuEGcrukahqiiQ30PnWImdaN3pZHOa?=
 =?us-ascii?Q?DB5ML8Y5gdn7umgUwjHhheeIHjJh1dWpu9jFO4LCW2SkfFsmieZr2hnyariJ?=
 =?us-ascii?Q?I9JCcneeMvTHPgZIVW/HOUNUqs/QWzo7NXLV0QzfITxPLSYHa5Kj6mNfIUZv?=
 =?us-ascii?Q?OG9EJjBzI13esJ0n0EvBxZ8h25sZ6HUZuQPCpAcCfn6lL0iTUnhzJdhRsd/V?=
 =?us-ascii?Q?nuzkKknHynMfmZdqv7I93hWDrRQP8P9rAvaLLMLQipKtmIXlxktrxkklyXUA?=
 =?us-ascii?Q?MOXdigZgmue7ktD+ijMstQjNqXs+iLSo08+NvdEQmlfBlgEiOk3JpZS6l4XX?=
 =?us-ascii?Q?LwbJv42SRHqYtlCJn+afE3dvEg9hEY/kt73guCggxkqi/YbCZuzFjH0TYDVV?=
 =?us-ascii?Q?NWQ+zZZIUYLH5j5YXqcKECwEWVuQMp7poQV6Nd2FQ3eic2ywlYoPp7plSIAR?=
 =?us-ascii?Q?SjIlWBDyA+2BrwDOO0SmRUc6xXAWepZkgD9o4zXa1o+1g0s+qUeIRtU6ZZdk?=
 =?us-ascii?Q?I2B5mcYdrXk60wLeltS9XlR1rtDjevtsBmZ2DobpVuY1wLrye7Nq4l2RhwQc?=
 =?us-ascii?Q?RvgsGNQVR2aazZTN0SMQUOSgmVTsOfx5RCkBFM8efcp0vXsJYk0DDCc5hSV8?=
 =?us-ascii?Q?7VGsibu7D9X6y3ZpCyNb85aNXL2joQ7yV84HFHpCOCXNJTAgNy2NLS2wrBH3?=
 =?us-ascii?Q?7AGm5YlVMQLRhbjbaQZheR/FWHTjFmcyWecSFLd1tz37GCUCAzCibNiHwzvt?=
 =?us-ascii?Q?C7bpWjUcLSZU9TouWjDk+Hqc7Z3gpAFsRFhTiGV99DPL2WkS+E6ppnR1GCu9?=
 =?us-ascii?Q?zwW/Ro/Y2zSwogRdsg67dBxOCmlRUdiJvBuya+0hlLKlUAP5Ec7KhJezVzKr?=
 =?us-ascii?Q?wff0jtB1+4+ikL6TjQev7NgKbf0W4rz6iLWNXIfHBUhZN49XcRPlVRk7iKIx?=
 =?us-ascii?Q?cZOePr+j0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b3f51e-f1be-405a-b30e-08df3ea7e3b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:51.2645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGYRBZzfowfGLJLUHMGmq5eCEjxi7nPCdz6afv9s4TeRxzNbG6ycL5xczteuhL3ClCnzD+kOgOu+uF9Ih6RHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800

Memory MPAM MSCs on CPU-less NUMA nodes rely on mpam_ris_get_affinity()
falling back to cpu_possible_mask so the RIS can participate in MPAM
and resctrl control. Add a KUnit test that locates a CPU-less node when
present, exercises the MPAM_CLASS_MEMORY path, checks the reported
affinity equals cpu_possible_mask intersected with MSC accessibility,
and verifies cpu_less is set when the borrowed affinity is used.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/test_mpam_devices.c | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
index 31871f519729..7054919d4574 100644
--- a/drivers/resctrl/test_mpam_devices.c
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -382,9 +382,76 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
 	mutex_unlock(&fake_msc.part_sel_lock);
 }
 
+static u32 find_cpuless_numa_node(void)
+{
+	int node;
+	cpumask_var_t tmp;
+
+	if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
+		return UINT_MAX;
+
+	for (node = 0; node < nr_node_ids; node++) {
+		cpumask_clear(tmp);
+		get_cpumask_from_node_id(node, tmp);
+		if (cpumask_empty(tmp)) {
+			u32 ret = node;
+
+			free_cpumask_var(tmp);
+			return ret;
+		}
+	}
+
+	free_cpumask_var(tmp);
+	return UINT_MAX;
+}
+
+static void test_mpam_ris_cpuless_numa_affinity(struct kunit *test)
+{
+	cpumask_var_t affinity, expected;
+	bool cpu_less = false;
+	u32 node;
+	int err;
+
+	node = find_cpuless_numa_node();
+	if (node == UINT_MAX) {
+		kunit_skip(test, "No CPU-less NUMA node on this platform");
+		return;
+	}
+
+	if (!alloc_cpumask_var(&affinity, GFP_KERNEL) ||
+	    !alloc_cpumask_var(&expected, GFP_KERNEL)) {
+		free_cpumask_var(affinity);
+		free_cpumask_var(expected);
+		kunit_skip(test, "Failed to allocate cpumask");
+		return;
+	}
+
+	memset(&fake_msc1, 0, sizeof(fake_msc1));
+	fake_msc1.pdev = &fake_pdev;
+	cpumask_copy(&fake_msc1.accessibility, cpu_possible_mask);
+
+	fake_class.level = 3;
+	fake_class.type = MPAM_CLASS_MEMORY;
+	fake_comp1.comp_id = node;
+
+	cpumask_clear(affinity);
+	err = mpam_ris_get_affinity(&fake_msc1, affinity, MPAM_CLASS_MEMORY,
+				    &fake_class, &fake_comp1, &cpu_less);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_TRUE(test, cpu_less);
+
+	cpumask_copy(expected, cpu_possible_mask);
+	cpumask_and(expected, expected, &fake_msc1.accessibility);
+	KUNIT_EXPECT_TRUE(test, cpumask_equal(affinity, expected));
+
+	free_cpumask_var(affinity);
+	free_cpumask_var(expected);
+}
+
 static struct kunit_case mpam_devices_test_cases[] = {
 	KUNIT_CASE(test_mpam_reset_msc_bitmap),
 	KUNIT_CASE(test_mpam_enable_merge_features),
+	KUNIT_CASE(test_mpam_ris_cpuless_numa_affinity),
 	KUNIT_CASE(test__props_mismatch),
 	{}
 };
-- 
2.53.0

