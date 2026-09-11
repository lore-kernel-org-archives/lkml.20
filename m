Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15C217DFFA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094499; cv=none; b=J3DP9wMuRWUQ+DSTTzgnyyY0D8W6F+9ludWfw3e6p6lAQNMDn5PcYSdzNA2IG2x61IFafFeVOvNutKZIKbcdHA07qYzFjSdY4OjFK1AOeKMo1/qLYN2rF2ttqit5+svA96+mylVmBMSNjTc58iyoFUP4QCmItgkOZzQbxUeU+B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094499; c=relaxed/simple;
	bh=tcEEF+diqHyds8XAAwAWPeqbGcrownmHERP7via+1Gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAiVxj7FygsRfAwrNW8pYVHYS5m4pWerY0Sr96edofTTBIl4QO/VqAA1sPfNQndbStrxegk7lCueVfgHtyRxTBiGIqUE2lgHdncMp8c6EyqRqNUR4fgPhZ6q5TV5CfMLaen4RqDMQxpW94W91vbmxTEggEDwpxSMKEvXr2/wR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7ZPqnQo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7ZPqnQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F931F000FF;
	Fri, 11 Sep 2026 02:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789094497;
	bh=AOOTe4QwrEYE7q0yvWtPYAk+sfh9zyojaIAdtPROeCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K7ZPqnQoegrT3gDJ22avBzCrBCz8G503e3hAcbDhjjQaNEhWinp86a6Sb7F62pPMj
	 dMx9w3h34dEokv4bh9aevN082qvwfn8NxjpvvgmLh9Hjl3GHOKHVfUAQ1xx51JtYUU
	 h+PbJXceYeyyhr5vvtVBTAp1i70pZQpxmDwAIr1zcAXRnJ6G9GiF2kuO5hgOUt2Rdn
	 fHDWEKcW5JuVAvjkFDQQpn7hiECRNyK2rCOU+smwhFfCYpsCiUu9zI6YtwgW0LOe0d
	 Mm+1qgTkQVQlGu3pIYyfLf1AEoTC5ubqh8YMyjVFdyyGm+ZAbtfhKaYtyn7yOVW+QC
	 VQE5aXHcU2TNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ubifs: add KUnit test scaffolding for scan.c
Reply-To: sashiko-reviews@lists.linux.dev
To: lichen.wang <wanglichen9110@gmail.com>, linux-mtd@lists.infradead.org, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, "Richard Weinberger" <richard@nod.at>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <178909365090.247910.2202926583850439589.p1-of-2@gmail.com>
References: <178909365090.247910.11265261850560199708.p0-of-2@gmail.com>
 <178909365090.247910.2202926583850439589.p1-of-2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 02:41:36 +0000
Message-Id: <20260911024137.47F931F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing fatal assertion before list access causes out-of-bounds =
reads if memory allocation fails in KUnit test cases.
--

commit b83b8d90186f2d43276368aea89de87c7f3fd864
Author: lichen.wang <wanglichen9110@gmail.com>

ubifs: add KUnit test scaffolding for scan.c

This commit adds KUnit tests for the UBIFS scan path to validate node
parsing offline. It builds the tests into the ubifs module itself and adds
a new CONFIG_UBIFS_FS_KUNIT_TEST option to gate the build.

> diff --git a/fs/ubifs/tests/scan_kunit.c b/fs/ubifs/tests/scan_kunit.c
> new file mode 100644
> index 0000000000000..6871339cb899c
> --- /dev/null
> +++ b/fs/ubifs/tests/scan_kunit.c

[ ... ]

> +static void add_snod_pad_node_gets_invalid_key(struct kunit *test)
> +{
> +	struct ubifs_info *c =3D ubifs_test_info(test);
> +	struct ubifs_scan_leb *sleb;
> +	struct ubifs_scan_node *snod;
> +	struct ubifs_pad_node *pad;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, c);
> +	sleb =3D ubifs_test_scan_leb(test);
> +	KUNIT_ASSERT_NOT_NULL(test, sleb);
> +	pad =3D ubifs_test_make_pad_node(test, 4);
> +	KUNIT_ASSERT_NOT_NULL(test, pad);
> +
> +	KUNIT_EXPECT_EQ(test, ubifs_add_snod(c, sleb, pad, 0x40), 0);
> +	KUNIT_EXPECT_EQ(test, sleb->nodes_cnt, 1);
> +
> +	snod =3D list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
> +	KUNIT_EXPECT_EQ(test, snod->type, UBIFS_PAD_NODE);

[Severity: Medium]
If ubifs_add_snod() fails to allocate a node with kmalloc(), it returns
-ENOMEM and leaves sleb->nodes empty. Since KUNIT_EXPECT_EQ() allows
execution to continue on failure, will list_first_entry() return a pointer
that aliases the list head inside the sleb structure?

Accessing snod->type could then cause an out-of-bounds read past the end
of the sleb allocation. Should this use KUNIT_ASSERT_EQ() instead to abort
the test early if the allocation fails?

> +	KUNIT_EXPECT_EQ(test, snod->key.u32[0], 0xDEADBEAF);
> +	KUNIT_EXPECT_EQ(test, snod->key.u32[1], UBIFS_INVALID_KEY);
> +
> +	free_scanned_nodes(sleb);
> +}
> +
> +static void add_snod_trun_node_gets_invalid_key(struct kunit *test)
> +{
> +	struct ubifs_info *c =3D ubifs_test_info(test);
> +	struct ubifs_scan_leb *sleb;
> +	struct ubifs_scan_node *snod;
> +	void *node;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, c);
> +	sleb =3D ubifs_test_scan_leb(test);
> +	KUNIT_ASSERT_NOT_NULL(test, sleb);
> +	node =3D make_node(test, UBIFS_TRUN_NODE, UBIFS_TRUN_NODE_SZ);
> +	KUNIT_ASSERT_NOT_NULL(test, node);
> +
> +	KUNIT_EXPECT_EQ(test, ubifs_add_snod(c, sleb, node, 0), 0);
> +
> +	snod =3D list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
> +	KUNIT_EXPECT_EQ(test, snod->type, UBIFS_TRUN_NODE);

[Severity: Medium]
Similar to the padding test above, if ubifs_add_snod() fails, does this
cause an out-of-bounds read when accessing snod->type on the empty list?

> +	KUNIT_EXPECT_EQ(test, snod->key.u32[0], 0xDEADBEAF);
> +	KUNIT_EXPECT_EQ(test, snod->key.u32[1], UBIFS_INVALID_KEY);
> +
> +	free_scanned_nodes(sleb);
> +}
> +
> +static void add_snod_appends_nodes_in_order(struct kunit *test)
> +{
> +	struct ubifs_info *c =3D ubifs_test_info(test);
> +	struct ubifs_scan_leb *sleb;
> +	struct ubifs_scan_node *first, *second;
> +	void *node1, *node2;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, c);
> +	sleb =3D ubifs_test_scan_leb(test);
> +	KUNIT_ASSERT_NOT_NULL(test, sleb);
> +	node1 =3D make_node(test, UBIFS_DATA_NODE, TEST_DATA_SZ);
> +	KUNIT_ASSERT_NOT_NULL(test, node1);
> +	node2 =3D make_node(test, UBIFS_INO_NODE, UBIFS_INO_NODE_SZ);
> +	KUNIT_ASSERT_NOT_NULL(test, node2);
> +
> +	KUNIT_EXPECT_EQ(test, ubifs_add_snod(c, sleb, node1, 0), 0);
> +	KUNIT_EXPECT_EQ(test, ubifs_add_snod(c, sleb, node2, 64), 0);
> +	KUNIT_EXPECT_EQ(test, sleb->nodes_cnt, 2);
> +
> +	first =3D list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
> +	second =3D list_next_entry(first, list);
> +	KUNIT_EXPECT_PTR_EQ(test, first->node, node1);
> +	KUNIT_EXPECT_PTR_EQ(test, second->node, node2);

[Severity: Medium]
If either call to ubifs_add_snod() fails, could fetching the node pointers
from the resulting invalid list entries result in out-of-bounds reads here
as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/178909365090.247910=
.11265261850560199708.p0-of-2@gmail.com?part=3D1
