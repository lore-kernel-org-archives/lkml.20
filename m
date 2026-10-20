Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503806;
	b=WPOJf+H8PfmgBtY1lBUGK+9VvncRN9VE59eywHoCMWhD3oD88toK87/E2FhNURMPNbqS
	 tT5fkZV80kHmp3tdaWAA6BNSg2Fh27EVyAVNeyLw7oDX7uN0M1p2uu8yyBqIvkg4oKAvn
	 jGo9WRUUhCBENVcNIyUDgfrZpUpHCNcuIeh9RCe+cdsAZhEqs5sppdB98+egvbVK2Ng95
	 6HMEbteNxIzbjbdap84nmfaYqKUjOOl7U/uRUeRehECj62raKx7AFRO0r8HczzOc1Xg3j
	 KK1bLRQ6kz9dBe5tMyLAp6HpBQSg/TTxy0c5yGNwox+YkWvfXUXw9mDBPIGhn4go0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503806;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nxX+LScRdmfyYvq6DmwCG933qxEHECBRzrSslTv/bic=;
	b=aFXMvTgci9GwgpZFA4TXmLHo/GZqc/TMDvsAGoC+80u0LYC5Cx9lOLFn+pdztA5/5w8j
	 ycNfys62dUJ0l+VWsZFY8A9DjNdYTefjs2cxQuYuyw7ywNY2RJECGofjD4amD3kW5GnsR
	 YmidocDEMBnWc2BT/jaTAKqC6veXD1P9hx/H0h7ObM++9EvRpWTiB6Mn5f2Bfi6LzTTna
	 AanTzOyDsF5RJn+Ens4viei0/A2ESpZto3pKhAyjILg6KkY/SiX7RdGhr727ivN62F7jW
	 5bygeeX+b4nRQBU+O2eHfdTpPF7GwzrQFXBmfStZ9MOoNI4wssmssEHBse40REVnt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="4TC/vZvA";
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5160A3829
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A5160A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4TC/vZvA
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nxX+LScRdmfyYvq6DmwCG933qxEHECBRzrSslTv/bic=;
	b=4TC/vZvA7BowJRD0ZSzHjRB8U4ESFajoP7UIZ0etJSHmow/k8EWFEu8ydMEd/Wff1ePqHWLGJ
	dgk4/BzIoS1rWKWrQCCCPbymAfKBwim+VcH32CIh33RJdiqXGTW2p0Eywwm5lKD1CFFfYWJIpCt
	s3S9cP4ynVxEJDN0Bokdohw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBw3g2Jz12LFQ;
	Tue, 20 Oct 2026 21:43:20 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C489840579;
	Tue, 20 Oct 2026 21:43:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 15/15] arm_mpam: resctrl: Add kunit tests for narrow PARTID helpers
Date: Tue, 20 Oct 2026 21:42:39 +0800
Message-ID: <20261020134239.3921377-16-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Cover the RMID to request PARTID/PMG encoding, the request PARTID to
intPARTID modulo mapping, CLOSID membership checks across legacy, CDP,
narrowing and CDP+narrowing modes, and the (CLOSID, RMID) translation
helper.

The tests poke the partid map through mpam_partid_map_init() so they
do not depend on resctrl having been set up.

Enabled with CONFIG_MPAM_KUNIT_TEST; run with:
  kunit.py run --arch=arm64 --kunitconfig=drivers/resctrl

Assisted-by: GLM:5.3
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/.kunitconfig        |   4 +
 drivers/resctrl/test_mpam_resctrl.c | 466 ++++++++++++++++++++++++++++
 2 files changed, 470 insertions(+)
 create mode 100644 drivers/resctrl/.kunitconfig

diff --git a/drivers/resctrl/.kunitconfig b/drivers/resctrl/.kunitconfig
new file mode 100644
index 000000000000..0cc78c0f7474
--- /dev/null
+++ b/drivers/resctrl/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_ARM64_MPAM=y
+CONFIG_RESCTRL_FS=y
+CONFIG_MPAM_KUNIT_TEST=y
diff --git a/drivers/resctrl/test_mpam_resctrl.c b/drivers/resctrl/test_mpam_resctrl.c
index b93d6ad87e43..f6620ea6f873 100644
--- a/drivers/resctrl/test_mpam_resctrl.c
+++ b/drivers/resctrl/test_mpam_resctrl.c
@@ -296,6 +296,462 @@ static void test_percent_to_max_rounding(struct kunit *test)
 	KUNIT_EXPECT_LE(test, 4 * num_rounded_up, 3 * total);
 }
 
+/*
+ * Test cases for CDP and PARTID narrowing compatibility
+ */
+
+struct cdp_narrowing_test_case {
+	bool cdp_enabled;
+	bool narrowing_enabled;
+	u32 closid;
+	u32 rmid;
+	u8 pmg_max;
+	u32 expected_partid_d;
+	u32 expected_partid_i;
+	u8 expected_pmg_d;
+	u8 expected_pmg_i;
+	const char *desc;
+};
+
+static const struct cdp_narrowing_test_case cdp_narrowing_cases[] = {
+	{
+		.cdp_enabled = false,
+		.narrowing_enabled = false,
+		.closid = 5,
+		.rmid = 3,
+		.pmg_max = 127,
+		.expected_partid_d = 5,
+		.expected_partid_i = 5,
+		.expected_pmg_d = 3,
+		.expected_pmg_i = 3,
+		.desc = "CDP=0, narrow=0: basic mapping"
+	},
+	{
+		.cdp_enabled = false,
+		.narrowing_enabled = true,
+		.closid = 5,
+		.rmid = 258,
+		.pmg_max = 127,
+		.expected_partid_d = 2,
+		.expected_partid_i = 2,
+		.expected_pmg_d = 2,
+		.expected_pmg_i = 2,
+		.desc = "CDP=0, narrow=1: extract reqPARTID from rmid"
+	},
+	{
+		.cdp_enabled = true,
+		.narrowing_enabled = false,
+		.closid = 5,
+		.rmid = 3,
+		.pmg_max = 127,
+		.expected_partid_d = 10,
+		.expected_partid_i = 11,
+		.expected_pmg_d = 3,
+		.expected_pmg_i = 3,
+		.desc = "CDP=1, narrow=0: CDP DATA/CODE split"
+	},
+	{
+		.cdp_enabled = true,
+		.narrowing_enabled = true,
+		.closid = 5,
+		.rmid = 258,
+		.pmg_max = 127,
+		.expected_partid_d = 4,
+		.expected_partid_i = 5,
+		.expected_pmg_d = 2,
+		.expected_pmg_i = 2,
+		.desc = "CDP=1, narrow=1: both features combined"
+	},
+	{
+		.cdp_enabled = false,
+		.narrowing_enabled = false,
+		.closid = 65535,
+		.rmid = 0,
+		.pmg_max = 127,
+		.expected_partid_d = 65535,
+		.expected_partid_i = 65535,
+		.expected_pmg_d = 0,
+		.expected_pmg_i = 0,
+		.desc = "Boundary: max closid"
+	},
+	{
+		.cdp_enabled = false,
+		.narrowing_enabled = false,
+		.closid = 0,
+		.rmid = 127,
+		.pmg_max = 127,
+		.expected_partid_d = 0,
+		.expected_partid_i = 0,
+		.expected_pmg_d = 127,
+		.expected_pmg_i = 127,
+		.desc = "Boundary: max pmg"
+	},
+	{
+		.cdp_enabled = false,
+		.narrowing_enabled = true,
+		.closid = 0,
+		.rmid = 639,
+		.pmg_max = 159,
+		.expected_partid_d = 3,
+		.expected_partid_i = 3,
+		.expected_pmg_d = 159,
+		.expected_pmg_i = 159,
+		.desc = "Narrowing with pmg_max=159"
+	},
+	{
+		.cdp_enabled = true,
+		.narrowing_enabled = true,
+		.closid = 10,
+		.rmid = 1280,
+		.pmg_max = 127,
+		.expected_partid_d = 20,
+		.expected_partid_i = 21,
+		.expected_pmg_d = 0,
+		.expected_pmg_i = 0,
+		.desc = "CDP + narrowing with reqPARTID=10"
+	},
+};
+
+static void cdp_narrowing_test_desc(const struct cdp_narrowing_test_case *param,
+				    char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", param->desc);
+}
+
+KUNIT_ARRAY_PARAM(cdp_narrowing, cdp_narrowing_cases, cdp_narrowing_test_desc);
+
+static void test_cdp_narrowing_mapping(struct kunit *test)
+{
+	const struct cdp_narrowing_test_case *param = test->param_value;
+	bool saved_cdp, saved_narrowing;
+	u32 partid_d, partid_i;
+	u8 saved_pmg_max;
+	u8 pmg_d, pmg_i;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_cdp = cdp_enabled;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	mpam_pmg_max = param->pmg_max;
+	cdp_enabled = param->cdp_enabled;
+	resctrl_using_extra_partids = param->narrowing_enabled;
+
+	resctrl_closid_rmid_to_partid_pmg(param->closid, param->rmid,
+					  &partid_d, &partid_i,
+					  &pmg_d, &pmg_i);
+
+	KUNIT_EXPECT_EQ(test, partid_d, param->expected_partid_d);
+	KUNIT_EXPECT_EQ(test, partid_i, param->expected_partid_i);
+	KUNIT_EXPECT_EQ(test, pmg_d, param->expected_pmg_d);
+	KUNIT_EXPECT_EQ(test, pmg_i, param->expected_pmg_i);
+
+	mpam_pmg_max = saved_pmg_max;
+	cdp_enabled = saved_cdp;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+static void test_cdp_narrowing_consistency(struct kunit *test)
+{
+	u32 partid_d1, partid_i1, partid_d2, partid_i2;
+	u8 pmg_d1, pmg_i1, pmg_d2, pmg_i2;
+	bool saved_cdp, saved_narrowing;
+	u8 saved_pmg_max;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_cdp = cdp_enabled;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	mpam_pmg_max = 127;
+
+	cdp_enabled = true;
+	resctrl_using_extra_partids = false;
+	resctrl_closid_rmid_to_partid_pmg(10, 5, &partid_d1, &partid_i1,
+					  &pmg_d1, &pmg_i1);
+
+	cdp_enabled = true;
+	resctrl_using_extra_partids = false;
+	resctrl_closid_rmid_to_partid_pmg(10, 7, &partid_d2, &partid_i2,
+					  &pmg_d2, &pmg_i2);
+
+	KUNIT_EXPECT_EQ(test, partid_d1, partid_d2);
+	KUNIT_EXPECT_EQ(test, partid_i1, partid_i2);
+	KUNIT_EXPECT_EQ(test, partid_i1, partid_d1 + 1);
+
+	mpam_pmg_max = saved_pmg_max;
+	cdp_enabled = saved_cdp;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+static void test_narrowing_rmid_encode_decode(struct kunit *test)
+{
+	bool saved_narrowing;
+	u8 pmg, decoded_pmg;
+	u8 saved_pmg_max;
+	u16 partid;
+	u32 rmid;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	mpam_pmg_max = 127;
+	resctrl_using_extra_partids = true;
+
+	for (partid = 0; partid < 100; partid++) {
+		for (pmg = 0; pmg <= mpam_pmg_max; pmg += 10) {
+			rmid = partid * (mpam_pmg_max + 1) + pmg;
+
+			KUNIT_EXPECT_EQ(test, resctrl_rmid_to_partid(rmid), partid);
+			decoded_pmg = resctrl_rmid_to_pmg(rmid);
+			KUNIT_EXPECT_EQ(test, decoded_pmg, pmg);
+		}
+	}
+
+	mpam_pmg_max = saved_pmg_max;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+static void test_narrowing_rmid_idx_encode(struct kunit *test)
+{
+	u32 closid, rmid, idx;
+	bool saved_narrowing;
+	u8 saved_pmg_max;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	mpam_pmg_max = 127;
+
+	resctrl_using_extra_partids = false;
+	for (closid = 0; closid < 10; closid++) {
+		for (rmid = 0; rmid < 10; rmid++) {
+			idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+			KUNIT_EXPECT_EQ(test, idx, closid * 128 + rmid);
+		}
+	}
+
+	resctrl_using_extra_partids = true;
+	for (closid = 0; closid < 10; closid++) {
+		for (rmid = 0; rmid < 1000; rmid += 100) {
+			idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+			KUNIT_EXPECT_EQ(test, idx, rmid);
+		}
+	}
+
+	mpam_pmg_max = saved_pmg_max;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+static void test_narrowing_rmid_idx_decode(struct kunit *test)
+{
+	u32 decoded_closid, decoded_rmid;
+	u32 idx, closid, rmid;
+	bool saved_narrowing;
+	u8 saved_pmg_max;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	mpam_pmg_max = 127;
+
+	resctrl_using_extra_partids = false;
+	for (closid = 0; closid < 10; closid++) {
+		for (rmid = 0; rmid < 10; rmid++) {
+			idx = closid * 128 + rmid;
+			resctrl_arch_rmid_idx_decode(idx, &decoded_closid, &decoded_rmid);
+			KUNIT_EXPECT_EQ(test, decoded_closid, closid);
+			KUNIT_EXPECT_EQ(test, decoded_rmid, rmid);
+		}
+	}
+
+	resctrl_using_extra_partids = true;
+	mpam_partid_map_init(64, 32);
+	for (idx = 0; idx < 5000; idx += 500) {
+		u16 partid = resctrl_rmid_to_partid(idx);
+		u16 intpartid = mpam_partid_to_intpartid(partid);
+
+		resctrl_arch_rmid_idx_decode(idx, &decoded_closid, &decoded_rmid);
+		KUNIT_EXPECT_EQ(test, decoded_closid, intpartid);
+		KUNIT_EXPECT_EQ(test, decoded_rmid, idx);
+	}
+	mpam_partid_map_init(0, 0);
+
+	mpam_pmg_max = saved_pmg_max;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+struct partid_mapping_case {
+	u16 partid;
+	u16 num_partid;
+	u16 num_closid;
+	u16 expected_intpartid;
+	const char *desc;
+};
+
+static const struct partid_mapping_case partid_mapping_cases[] = {
+	{ 0, 128, 32, 0, "First PARTID maps to first intPARTID" },
+	{ 31, 128, 32, 31, "Last intPARTID maps 1:1" },
+	{ 32, 128, 32, 0, "First extra PARTID wraps to intPARTID 0" },
+	{ 33, 128, 32, 1, "Second extra PARTID wraps to intPARTID 1" },
+	{ 63, 128, 32, 31, "PARTID 63 wraps to intPARTID 31" },
+	{ 64, 128, 32, 0, "PARTID 64 wraps to intPARTID 0" },
+	{ 127, 128, 32, 31, "Max PARTID wraps to intPARTID 31" },
+	{ 15, 64, 16, 15, "Small config: PARTID 15 → intPARTID 15" },
+	{ 16, 64, 16, 0, "Small config: PARTID 16 wraps to 0" },
+	{ 63, 64, 16, 15, "Small config: max PARTID wraps to 15" },
+};
+
+static void partid_mapping_desc(const struct partid_mapping_case *param,
+				char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", param->desc);
+}
+
+KUNIT_ARRAY_PARAM(partid_mapping, partid_mapping_cases, partid_mapping_desc);
+
+static void test_narrowing_partid_mapping(struct kunit *test)
+{
+	const struct partid_mapping_case *param = test->param_value;
+	u16 result;
+
+	mpam_partid_map_init(param->num_partid, param->num_closid);
+
+	result = mpam_partid_to_intpartid(param->partid);
+	KUNIT_EXPECT_EQ(test, result, param->expected_intpartid);
+
+	mpam_partid_map_init(0, 0);
+}
+
+struct partid_in_closid_case {
+	u16 partid;
+	u32 closid;
+	bool cdp_enabled;
+	bool narrowing_enabled;
+	u16 num_closid;
+	bool expected;
+	const char *desc;
+};
+
+static const struct partid_in_closid_case partid_in_closid_cases[] = {
+	{ 10, 10, false, false, 32, true, "Legacy: exact match" },
+	{ 10, 11, false, false, 32, false, "Legacy: no match" },
+	{ 20, 10, true, false, 32, true, "CDP: even PARTID for closid 10" },
+	{ 21, 10, true, false, 32, true, "CDP: odd PARTID for closid 10" },
+	{ 22, 10, true, false, 32, false, "CDP: PARTID 22 not in closid 10" },
+	{ 10, 10, false, true, 32, true, "Narrowing: PARTID 10 -> intPARTID 10" },
+	{ 42, 10, false, true, 32, true, "Narrowing: PARTID 42 wraps to intPARTID 10" },
+	{ 74, 10, false, true, 32, true, "Narrowing: PARTID 74 wraps to intPARTID 10" },
+	{ 43, 10, false, true, 32, false, "Narrowing: PARTID 43 -> intPARTID 11" },
+	{ 20, 10, true, true, 32, true, "CDP+narrow: even PARTID 20 -> intPARTID 10" },
+	{ 21, 10, true, true, 32, true, "CDP+narrow: odd PARTID 21 -> intPARTID 10" },
+	{ 84, 10, true, true, 32, true, "CDP+narrow: PARTID 84 wraps to intPARTID 10" },
+	{ 86, 10, true, true, 32, false, "CDP+narrow: PARTID 86 -> intPARTID 11" },
+};
+
+static void partid_in_closid_desc(const struct partid_in_closid_case *param,
+				  char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", param->desc);
+}
+
+KUNIT_ARRAY_PARAM(partid_in_closid, partid_in_closid_cases,
+		  partid_in_closid_desc);
+
+static void test_narrowing_partid_in_closid(struct kunit *test)
+{
+	const struct partid_in_closid_case *param = test->param_value;
+	bool saved_cdp, saved_narrowing;
+	bool result;
+
+	saved_cdp = cdp_enabled;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	cdp_enabled = param->cdp_enabled;
+	resctrl_using_extra_partids = param->narrowing_enabled;
+	mpam_partid_map_init(128, param->num_closid);
+
+	result = resctrl_partid_in_closid(param->partid, param->closid);
+	KUNIT_EXPECT_EQ(test, result, param->expected);
+
+	mpam_partid_map_init(0, 0);
+	cdp_enabled = saved_cdp;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+static void test_narrowing_boundary_conditions(struct kunit *test)
+{
+	bool saved_narrowing;
+	u8 saved_pmg_max;
+	u32 rmid, idx;
+	u16 partid;
+	u8 pmg;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	resctrl_using_extra_partids = true;
+
+	mpam_pmg_max = 255;
+	rmid = 255 * 256 + 255;
+	partid = resctrl_rmid_to_partid(rmid);
+	pmg = resctrl_rmid_to_pmg(rmid);
+	KUNIT_EXPECT_EQ(test, partid, 255);
+	KUNIT_EXPECT_EQ(test, pmg, 255);
+
+	mpam_pmg_max = 127;
+	rmid = 100 * 128 + 127;
+	partid = resctrl_rmid_to_partid(rmid);
+	pmg = resctrl_rmid_to_pmg(rmid);
+	KUNIT_EXPECT_EQ(test, partid, 100);
+	KUNIT_EXPECT_EQ(test, pmg, 127);
+
+	mpam_pmg_max = 0;
+	rmid = 50;
+	partid = resctrl_rmid_to_partid(rmid);
+	pmg = resctrl_rmid_to_pmg(rmid);
+	KUNIT_EXPECT_EQ(test, partid, 50);
+	KUNIT_EXPECT_EQ(test, pmg, 0);
+
+	mpam_pmg_max = 15;
+	idx = resctrl_arch_rmid_idx_encode(0, 1000);
+	KUNIT_EXPECT_EQ(test, idx, 1000);
+
+	mpam_pmg_max = saved_pmg_max;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
+static void test_narrowing_full_range_mapping(struct kunit *test)
+{
+	u16 partid, intpartid;
+	bool saved_narrowing;
+	u8 saved_pmg_max;
+	int count = 0;
+	u32 rmid;
+
+	saved_pmg_max = mpam_pmg_max;
+	saved_narrowing = resctrl_using_extra_partids;
+
+	mpam_pmg_max = 31;
+	resctrl_using_extra_partids = true;
+	mpam_partid_map_init(64, 16);
+
+	for (rmid = 0; rmid < 2048; rmid += 32) {
+		partid = resctrl_rmid_to_partid(rmid);
+		intpartid = mpam_partid_to_intpartid(partid);
+
+		KUNIT_EXPECT_LT(test, partid, 64);
+		KUNIT_EXPECT_LT(test, intpartid, 16);
+		KUNIT_EXPECT_EQ(test, intpartid, partid % 16);
+
+		count++;
+	}
+
+	KUNIT_EXPECT_GT(test, count, 0);
+
+	mpam_partid_map_init(0, 0);
+	mpam_pmg_max = saved_pmg_max;
+	resctrl_using_extra_partids = saved_narrowing;
+}
+
 static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE(test_get_mba_granularity),
 	KUNIT_CASE_PARAM(test_mbw_max_to_percent, test_percent_value_gen_params),
@@ -304,6 +760,16 @@ static struct kunit_case mpam_resctrl_test_cases[] = {
 	KUNIT_CASE(test_percent_to_max_rounding),
 	KUNIT_CASE_PARAM(test_percent_max_roundtrip_stability,
 			 test_all_bwa_wd_gen_params),
+	KUNIT_CASE_PARAM(test_cdp_narrowing_mapping, cdp_narrowing_gen_params),
+	KUNIT_CASE(test_cdp_narrowing_consistency),
+	KUNIT_CASE(test_narrowing_rmid_encode_decode),
+	KUNIT_CASE(test_narrowing_rmid_idx_encode),
+	KUNIT_CASE(test_narrowing_rmid_idx_decode),
+	KUNIT_CASE_PARAM(test_narrowing_partid_mapping, partid_mapping_gen_params),
+	KUNIT_CASE_PARAM(test_narrowing_partid_in_closid,
+			 partid_in_closid_gen_params),
+	KUNIT_CASE(test_narrowing_boundary_conditions),
+	KUNIT_CASE(test_narrowing_full_range_mapping),
 	{}
 };
 
-- 
2.34.1

