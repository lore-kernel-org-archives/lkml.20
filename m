Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4C94AC15D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197003; cv=fail; b=cvtkbPBlKuIKhLGbZ5fMKreDQAl9HHrn4iu+NDuTstRmMUt0CDNvcVYfqnruQvyLgK5Vecw2md5Iqm3Cf9juq7TdIKPpp5yQldjGR04mipDleGcXqCp5csumM+fbMQkrv7l3cR6Se0IXZKmgMtjfbJbmDhJvoHKjc9kSUU4ups8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197003; c=relaxed/simple;
	bh=4j3Fkc5Oq0dsfZdAiKbPz/cu0nG0oAEcs3tlRBqUmCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j5njc2SsW3PVpYgTsiP+1Ycp287sJYoFjEnJeEbCt0Kw8rnzIB07SLMx176m5ecn1prEQcodXtIvlEdoGVEzWEDKJpdobzmAw9f78FT1umEM/2XszshsnKpBFbgwKa4aN6WTg/ayL43nCYZ1ot5goBw0JSVTmmolZ8Xft25KLEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qQdNU+j3; arc=fail smtp.client-ip=40.107.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qQdNU+j3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkjuPBZH1ckYbP11MmjD+gS1e7YLCnPys8zFze5S/wR+q+EceDZ31bSjbt7RDOFXdUJ0F4BkRCFLH4n+xHa8ps+vIDvVrWpfASHquNw3KJjEsE7k9neI2vwhThi0+KD0aBnxJkJeVhcFiOoFP/JDfYPj335BmTm+2Tt9ZnNydw8P1Gcyw5NqOVOGj0VfTqydOl0rYix+sJiMK/0zznAd57YCChBKXp+69EGxy90UTWrILBwqVqQe9g+9lpTmKLDAj/EHqZyWPUvCcoLHPUVExAKPpa0f430YePdyIMAMLlS0S5bAnYKUzk90kXopojrHlKIhA07f1RWxu+RP8O51JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
 b=MTItfyZFTtZ09qTPPBib24xBpq5Oaifm4HjOvCiNsNuKnZZHH/AFAFvILOBvi0KDeSpAxHUfAu3KBXhslYCt3Bru17N94+cioUExpLRtsj94OVeE1/bQqKNaTVA51NMPtLnc/2ExNMOLC97Of5PQBYPW8sxcR1HphwRBpP/JipKfx2Cr6BQNWtjuUNi5taiHVtgQGq2LM/5ITsIhHJ8ZcwkVdpapKxT+RwhHBM6quQzu7DSecE/nDGMlYngurjP+6freE97CE4DO2MPzsA3URX+rXghwKAYNpbGqp/R/ITJuldNphvywvGUFPXB2CzTYUQGAVvCO889DV5SiqhRCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B8mLJKAa78eticVDQeqdgbhsOyYRLPHh3wbiZWj8Qw=;
 b=qQdNU+j3TzRee4a9pzKxMIXIMMchg+nqPsGMSvA5yTda651kb7/7OJ1Zp1bQ/hUH9rVTOrfTEAVvvwyAncEejo0pvsbFz7KqwriI0p73Bx15jzTZXKa1MhG7G3ZeU9dGPwR9945Vq0WmjIA7hxSG2J8dE/CX0gKDE75tIXP6vS4cJTY/jiM7SLQ5/V9afoGktp1YRMEHUY8TAuRjZ2C1Z8O0zi7+V3jGVZEI2NXSniDkhNPSjweF7EaK8bjIheebF4+DbJvXuHqCkjI0X2mzYV2lcxVSs9QTOQLh7KyzoRo21lV++NR0oaigRjYahd9eV925JixuGzxfdDSBkC+SSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:13 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:13 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
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
Subject: [PATCH RFC v2 18/19] arm_mpam: Add KUnit test for CPU-less NUMA node affinity
Date: Mon, 31 Aug 2026 10:22:44 -0700
Message-ID: <20260831172245.42253-19-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 694bfa6c-b4a9-4056-9dfd-08df0784898c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	nr9Oc2pIZcAlxxgX6TOvTwchWTCf7t+r3vCIZekqPkq3oXdXmBKf/k4PhVGiQMdULBPEHESqQp/K61EScY/B5S5Fei+QwC74v8N2B8+pizH9UBuQKI+23Va9ootz3X12/MQ2wNw+aJKVIKO4i848/4QQdEX0pjN/tqUUCLZysOvND/1dAkrncYXQVDA9FgOXhTzxnq/lHBJZcSD7HAEMg8n0IvSAz5ifCnFF1RaEViKJ/gx535D7s1PPYwGoXGnBRSZonEV/rp0WYhQK6t/iY6KvueUwEjPuCFVmV3/1wqiSGtD69HTizND1/i3zsFs0AOYT/0dr0VkYWHrNKx5D/W6MJBhp7tWqZE5teEUZi7OTbXDg9fld7if9LtfsABlYu8B9BoDmreyW0yueAg6RNxyd5BE7I0MxulBdU3Jmf11XDRrrOpYNuqVOyJ8fYLTE8qtKTtbJvl8GHxO04n8U0Y8hsAbR+HoR85ATw5OMCgoZorEJRuBwpKpySakPeENzn8BCibiDoy1snqwGB7a+Fygce4AWECGcXAgTOd3By6oRX88KYtzyAvetmvN1nMtZAM7+3/q46h4Gj7vblLOIPv2DVWPAxJy7/v93QGL09YgiHzmgQE3/ejSqi/UsmKkhBjCC9JCp4U/txP5YXn1V1jDs/sFiNeQ80vC1Gz9slP5bEFrxgRIZvrC8hVZBb5t3VxiyYiDtD8fQ2HwoQW2dDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bj1oOljZHseLcDnIVFdE10VPPUeBQw4SIfQbNXmd+5Iee/6EXvEMxtSf7RGa?=
 =?us-ascii?Q?YI5Dxlz4MFhxZzlw95h6OEDGIFfLZjDmdTUkBZzHhE9+JCXahcmcYleeUFU8?=
 =?us-ascii?Q?Jd4dR4Coydd3P6zrqW8T9MW8DRLwk7YX1oQ/I6hngQrZT35zQr0Y/j2j+kl4?=
 =?us-ascii?Q?oeZqnAXBhuNjByNhCi0DupKEmGf9gx4JWqWc5HsBy5Aqv1zddoqijd2T/Gup?=
 =?us-ascii?Q?NIwky8J2VRyrDnfABRjU4Ckckm1mbSVQT46kMftqsFuzVaVf2zJlMVvpr2+B?=
 =?us-ascii?Q?qWWi7ouLALOGSMU//HprM+FJrLnomgZP96a0wjp8ewQzrG7E3RK0nH8qeec8?=
 =?us-ascii?Q?HruEZ4WluWFv/a08CDKwtJx9yu0uSp3A4mI8EcbWKcLW8HnYHwcVPGCIS/Bs?=
 =?us-ascii?Q?Wida/nCATO9cohN/089bs2jTtoj+WHZk6/0uea/hwgC2fAosoMNhYMZhFaKt?=
 =?us-ascii?Q?U4r3py/O9uA1SdmHwF+RqAil4DLd3jXR9twuNFfMrkNOx0mBYf27qDNkOVqD?=
 =?us-ascii?Q?aGuhMRq/VjZaNqyKtsp3VUiEB7zGP6ilWW30Sz7nRFWgHrm1N/YnsZTjCvZE?=
 =?us-ascii?Q?ElYrYaQlh9CZs/bPUqVu86UDGuCvusz0SFUNnNZaXPan5YaiubKMsEsFX5JP?=
 =?us-ascii?Q?WVsMa/jvMpwcdRrO6C/FzoU2wk6mjdLk44n/IUmAb2bfGfqsoerZYO7dO16J?=
 =?us-ascii?Q?j3py4mLLYxmd4Hpq1cy6YZeLIyNZXhiIsbNnpmnUmCMEuZUZHfBnb2XTnduK?=
 =?us-ascii?Q?yiIftYK25zqfQISddUdKUhVQTYXsElxPHcmvrrpyfPqvkrWsCxYiQtVI0uHi?=
 =?us-ascii?Q?aLOrM3Apw4If1kuGZOoQnpiNrMF0IU/P8bp8aVV9xwe+AT4QDZQsKVwqoLle?=
 =?us-ascii?Q?EVk0UJB9Ec4yVYqvMSW7+pLhQQb9MjGXOLStv7KDRJtkvgLgZcRlGfuT34JL?=
 =?us-ascii?Q?cRqOoOxtt7F2oszEu+Gs2meLw3im4PRtqdXnAzfrsopd1qV6VjxcUxw8JkMf?=
 =?us-ascii?Q?wo+bhCf2RsKdVUT0+ohvHsZJ2gEMQiON14zj2IGp3qqMpTL3aLZHwdYVXIyZ?=
 =?us-ascii?Q?JzruJGoai7a79EewL87kH7MVp+e7prBsIIZNwho6G6ELPbdIjtarHxRrWv2f?=
 =?us-ascii?Q?sDpm7QEHnx34jszAiwperTJ0GoNS/wxDpkJfmhrUmb/TSszcfW1YvhD6vGQG?=
 =?us-ascii?Q?AxEtut9+DU2rvpLpDbJNDHMFf0Y9GG6BSoG+hm25n+3lVNzcvJ7F9z8oPDZi?=
 =?us-ascii?Q?vk29viBXdsNbBUCeAZoavlYT2fLJrKicvx/vogWF2+OnVT0Ly2mTIJUmDDeE?=
 =?us-ascii?Q?/U8kERsjpH89SLSzDMTgdKJnPkCiJgjITxtLymQQkySaqaORvzGSPVgFtydv?=
 =?us-ascii?Q?PLQzZdAp3ZdxLwHA9jgj46wgD8th8Ap3YPEkuaYFiO9844t3ux5Li4GvUN6P?=
 =?us-ascii?Q?IqpAVksWDU1TPfbK91AhoSFKAVsXglI/rfLil9IleenolS6uotMtuHzlh7lL?=
 =?us-ascii?Q?CW9Tq/osEcjA99kODj79dqt5hk+zIFt7T0SoRBB74DqyIeqdgK9/Hmx7k//D?=
 =?us-ascii?Q?koZqNxLb+V2rAGo0iK4K3yXMahjVbIYBJW/EyV3lUe7zzAXxAfh/rBfYQdwm?=
 =?us-ascii?Q?NR6cX+llQNH2W7yuOJr74Fc02FJHsGbdj+5jXeJu8oa8mdM+fV1OaAXBkT7g?=
 =?us-ascii?Q?yNMH87HGL/oGJnLH/0pN+DkQlv1f1kWr+JaQBceDRum3MVgCU2pGdGM+FGdH?=
 =?us-ascii?Q?WczVLgWvAQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694bfa6c-b4a9-4056-9dfd-08df0784898c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:13.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4HYQyNvFjMWw6TiVB2NBmIITtMk/dOury1lfamGpSdHK5AJk5vumFf3EkNpSRyvDgXaEFA5IRjG9whedhMkFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

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

