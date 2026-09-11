Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90911414DCA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122049; cv=none; b=f7u1hTs32+vN7gXDZQ/KPAnJGRptj6ERBCJhLhvd4fZFilqBtbv2wgodGmHDk6HoDtaTdeIy898PEYw+hMglSbi7u+BM5uMG9ODFHRiMC3hOq9lXI1u6bJSyFGW+lAQ3umBa5B7sQ9yMJXZ5Pyt6xgdEkDCgXXr6ihruPD/0Kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122049; c=relaxed/simple;
	bh=EG6tyVJ75MMj4II9M2H2bcZhXfbp8Yf2mQpmeHHfXBk=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZwGtg0fOGwvtdcUAWhCZSmqvPsaHRK+oWalm8f5aUXXF3m5zACS1qlIGnKjxFIfjw/ZGINEeqfSlETGJKsiroCl/XWPxqlxudd22HQ9XlKfWXexcIZWjt7QaMXF992np5KFlfrxj71RAeN6ZENalZQIQs6Xtv74SsVtrHtlrU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZOXQNwXq; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ZOXQNwXq"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+0iHLvtrGLsCy82LCpRsi7SAVSIB7DotMCsSNro0p2Q=;
	b=ZOXQNwXqyLzJeO2VnqkvL+XYHyaZ7J9kaWWA4ArS72mDEkjv564620Zl/KX6lb5ycR67UMmP5
	zNoYqAnXggicSRs20I2mFKyErbbKynet+rNmvWT3+cei01H9AgHaNRH6keR66esNJfCkRPoR6ur
	9dZuLF6V7cwCWVUZChYk5Ws=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hh9JM1t5XzKm6V;
	Fri, 11 Sep 2026 18:09:39 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 8178E4048B;
	Fri, 11 Sep 2026 18:20:38 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 18:20:37 +0800
Subject: Re: [PATCH v2 0/2] ubifs: add KUnit tests for scan and key helpers
To: lichen.wang <wanglichen9110@gmail.com>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>
References: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <64e12e82-d53b-f47b-696c-4c1f1e1bcfd2@huawei.com>
Date: Fri, 11 Sep 2026 18:20:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/9/11 11:09, lichen.wang Ð´µÀ:
> This series adds KUnit tests for fs/ubifs/scan.c and for the helpers in
> fs/ubifs/key.h, so that the node parsing code can be validated offline
> without an MTD device, a UBI volume or a development board.
> 
> Changes in v2:
>   - Use KUNIT_ASSERT_EQ() instead of KUNIT_EXPECT_EQ() for the
>     ubifs_add_snod() return value checks.  On -ENOMEM the function leaves
>     sleb->nodes empty, and list_first_entry()/list_next_entry() on an empty
>     list yield a pointer before the sleb allocation, so continuing after a
>     failed add would read out of bounds.  This affects expect_snod_keyed(),
>     add_snod_pad_node_gets_invalid_key(), add_snod_trun_node_gets_invalid_key()
>     and add_snod_appends_nodes_in_order().
>   - Assert on sleb->nodes_cnt in add_snod_appends_nodes_in_order() as well,
>     because the following list_next_entry() is only safe when both nodes were
>     really linked.
>   - Value checks that cannot be followed by a crash keep using KUNIT_EXPECT_*()
>     so that a single run still reports every mismatch.
>   - Link to v1: https://lore.kernel.org/all/178909365090.247910.11265261850560199708.p0-of-2@gmail.com/
> 
> Baseline:
> 
>    commit df2908090cda368b01ff43709f51890076c56157 ("Linux 7.3-rc2")
>    git describe --always of that commit: v7.3-rc2
>    (the describe string is that of the base commit itself; the patch
>    commits sit on top of it, so a describe run at their tip reports
>    v7.3-rc2-2-g3bcc6fa04 instead)
> 
> Motivation:
> 
> UBIFS has no test coverage for its on-flash parsing code: checking a
> change to scan.c or key.h currently means bringing up a real NAND
> device, a UBI volume and a board. KUnit makes the same checks run in a
> plain QEMU boot within seconds, and it is the established in-tree
> framework for this kind of unit testing, so the tests are reusable by
> anyone touching this code.

Hi lichen,
UBIFS testing can be deployed on QEMU with a nandsim or mtdram.
Current xfstests-dev and mtd-utils/tests/fs-tests could cover scanning 
and kinds ot processes. I am thinking that the ubifs scan logic(actually 
  it depends on disk data structure) hasn't been updated for a long 
time, do we still need to maintain a kunit test to detect issues arising 
from future code changes in ubifs scan?
> 
> Approach:
> 
>   - The tests are compiled into the ubifs module itself (ubifs-y) so
>     that they can call the non-exported ubifs_scan_a_node(),
>     ubifs_check_node(), ubifs_add_snod() and ubifs_end_scan() directly.
>     No EXPORT_SYMBOL() is added to production code.
>   - kunit_helpers.h builds a minimal fake struct ubifs_info with
>     kunit_kzalloc(); only the fields read by the tested paths are
>     initialised. The node length ranges mirror init_constants_early()
>     in super.c, because a zeroed range means "fixed length" for
>     ubifs_check_node() and would make the length checks pass for the
>     wrong reason.
>   - The node constructor fills the common header and payload first and
>     computes the CRC last with the kernel crc32(), over exactly the
>     bytes that ubifs_check_node() checksums.
> 
> Testing:
> 
> The whole suite runs with a single command:
> 
>    ./tools/testing/kunit/kunit.py run --arch=x86_64 --timeout=300 'ubifs*'
> 
> kunit.py exits 0 on the final tree and reports 5 suites and 80 cases,
> all passing:
> 
>    Testing complete. Ran 80 tests: passed: 80
> 
> with zero "not ok" lines in the KTAP output.
> 
> The fake ubifs_info environment was additionally checked against the
> real stack: a nandsim smoke test booted a kernel built from the
> baseline over a complete MTD -> UBI -> UBIFS stack, attached mtd0,
> created and mounted the volume and wrote and read back a file
> successfully.
> 
> Known limitations:
> 
>   - ubifs_scan() and ubifs_start_scan() are not covered by KUnit: the
>     UBI layer is not stubbed, so they would read from a real UBI volume
>     through ubi_leb_read(). They are exercised by the nandsim smoke test
>     instead.
>   - The tests build nodes in memory, so they cannot catch bugs in the
>     on-media layout itself; they only pin down the behaviour of the
>     parsing code for the layouts that UBIFS currently writes.
> 
> Notes:
> 
> checkpatch.pl --strict reports 0 errors for both patches. Each patch
> also carries the generic "added, moved or deleted file(s), does
> MAINTAINERS need updating?" warning; that reminder is emitted for every
> patch that adds a file, and the new files live under fs/ubifs/, which
> is already covered by the "UBI FILE SYSTEM (UBIFS)" entry in
> MAINTAINERS ("F: fs/ubifs/"), so no MAINTAINERS change is needed.
> 
> The cover letter itself draws one more warning from checkpatch.pl, a
> "Prefer a maximum 75 chars per line (possible unwrapped commit
> description?)" hint for a single line of the Changes in v2 list. That
> line is left unwrapped so that the four affected test names stay on
> one line and the list stays easy to scan; it is prose in the cover
> letter, not code or a changelog entry that a tool will reformat.
> 
> Signed-off-by: lichen.wang <wanglichen9110@gmail.com>
> 
> lichen.wang (2):
>    ubifs: add KUnit test scaffolding for scan.c
>    ubifs: add KUnit tests for key helpers
> 
>   fs/ubifs/Kconfig               |  16 +
>   fs/ubifs/Makefile              |   1 +
>   fs/ubifs/tests/key_kunit.c     | 555 ++++++++++++++++++
>   fs/ubifs/tests/kunit_helpers.h | 222 ++++++++
>   fs/ubifs/tests/scan_kunit.c    | 988 +++++++++++++++++++++++++++++++++
>   5 files changed, 1782 insertions(+)
>   create mode 100644 fs/ubifs/tests/key_kunit.c
>   create mode 100644 fs/ubifs/tests/kunit_helpers.h
>   create mode 100644 fs/ubifs/tests/scan_kunit.c
> 
> --
> 2.43.0
> 
> 
> .
> 

