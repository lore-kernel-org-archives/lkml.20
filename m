Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3612148FF92;
	Mon, 12 Oct 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810723; cv=none; b=X5jKVQ4+dnr0j2oTfObxlbXYYICP+l1oFHCrha+RDsfe9v080F712woU6Cg/zaiGQ3gJohkffhXI4M21dL2SyP8I0P7CPWWw58jvi3Jkql27NWlwSHDqHmisyxOvq0alHoDn+nDq7GE7Us3ZrWqaBAgWbZ+TRuva89H85fWI9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810723; c=relaxed/simple;
	bh=Nkx+fuyyHbMXI9LDGyl2hrkQ1GnC5CkIj2IiCqvgBTY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gN+k4k9U+qKCp5/3CEVs6D7uH/9cgplq3NLX0FElsBWJOXks0/E9gygD0WsPs005V1XtVb95gCMlrHbEyBMpovvvqoKBi5NELyNhvW0A7xZdO176vlcVfaelLbMAYxMfhVJyalYuweczbUbyZHy/BxeSYodwwcJYJ2X9YmnTzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=amTz9pBm; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="amTz9pBm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vCl96fkIx2Mng4xm9S4ZU1G29me8F7avnYo+HCV8dlU=;
	b=amTz9pBm+3/W0aYtWEk1foQLzzUel4Grd4VhiYcFIx5D+zi4f9Jaexo/PSHykV8tsQYvHzLPV
	s8SFCp8dODlLmqiqWmeR6ymRpdRaTtnzetcGmUNCEkFY8NE6QUSaXej83gbGJYJ9Tc/EpL4Yv3b
	0nscQ1wkbZ8WYwaWvAUmUic=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j3HcQ0MwYzcZxr;
	Mon, 12 Oct 2026 20:59:50 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 59B1920333;
	Mon, 12 Oct 2026 21:11:49 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 12 Oct 2026 21:11:48 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <guohanjun@huawei.com>,
	<rafael.j.wysocki@intel.com>, <jic23@kernel.org>,
	<mchehab+huawei@kernel.org>, <ardb@kernel.org>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<jason@os.amperecomputing.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <liuwenliang@huawei.com>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
Subject: [PATCH v6 0/2] RAS: Fix ARM processor error bounds checking
Date: Mon, 12 Oct 2026 21:11:38 +0800
Message-ID: <20261012131140.1526599-1-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100015.china.huawei.com (7.202.181.14)

Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
allocated memory") and commit 05954511b73e ("RAS: Report all ARM
processor CPER information to userspace") introduced bounds checking
for malformed ARM processor error records in log_arm_hw_error().
However, two issues remain:

1. The ctx_info bounds check condition is inverted: it adds
   ctx_info->size when the context header is already past the end of
   the section instead of when it is within bounds.

2. When vsei_len < 0, the error path does not verify pei_len and
   ctx_len. Since these are derived from err_info_num and
   context_info_num, they may describe regions beyond the allocated
   record, causing trace_arm_event() to read out of bounds.

Patch 1 fixes the inverted bounds check for context info iteration.
Patch 2 sanitizes pei_len/ctx_len/ven_err_data in the vsei_len < 0
error path to prevent out-of-bounds reads in trace_arm_event().

The ctx_info->size overflow (a size over 0x7fffffff making the signed
sz negative, as reported by Hanjun Guo) is deliberately left
unaddressed in this series: a size overflow implies a corrupted
firmware record, and then section_length may be corrupted as well.
For example, a real section length of 1024 could be reported as
16000, and the context walk can go out of bounds even without any
size overflow. Guarding ctx_info->size alone therefore does not add
meaningful protection.

Changes in v6:
  - Drop patch 3 ("RAS: Fix integer overflow in ARM processor error
    context walk"): an overflowing ctx_info->size implies a corrupted
    firmware record, in which case section_length may be corrupted as
    well, and the context walk can go out of bounds even without a
    size overflow, so guarding ctx_info->size alone does not add
    meaningful protection.
  - Add a note to the patch 1 commit message with the same
    reasoning, as cover letters are not preserved in git history.
  - No code changes in this version.

Changes in v5:
  - Collect Reviewed-by tags from Hanjun Guo for patches 1 and 2.
  - Added comments to patch 3.
  - No code changes in this version.

Changes in v4:
  - Remove the empty line between the Fixes: and Signed-off-by: tags
    in patches 1 and 2, per Hanjun Guo's comments.
  - Add braces around the else branch that assigns ven_err_data in
    patch 2, as suggested by Hanjun Guo.
  - Add new patch 3 to check each context entry with 64-bit
    arithmetic and stop the walk at the first entry that does not fit
    in the section, so a ctx_info->size over 0x7fffffff cannot
    overflow the signed int sz and walk ctx_info past the section,
    addressing Hanjun Guo's overflow comment.

Changes in v3:
  - There was no change, and the email was sent by mistake.

Changes in v2:
  - Split the original single patch into two separate patches, one
    for each distinct fix, to ease review and backporting.

v5:
  RAS: Fix ARM processor error bounds checking
  https://lore.kernel.org/all/20260921080337.3000957-1-liuwenliang@huawei.com/

v4:
  RAS: Fix ARM processor error bounds checking
  https://lore.kernel.org/all/20260909112832.805314-1-liuwenliang@huawei.com/

v2:
  RAS: Fix ARM processor error bounds checking
  https://lore.kernel.org/all/20260825134323.4181892-1-liuwenliang@huawei.com/

v1:
  RAS: Fix out-of-range section_length in ARM processor error handling
  https://lore.kernel.org/all/20260820131829.1006371-1-liuwenliang@huawei.com/

Abbott Liu (2):
  RAS: Fix inverted context info bounds check in ARM processor errors
  RAS: Fix out-of-bounds read when tracing arm_event

 drivers/ras/ras.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.43.0
