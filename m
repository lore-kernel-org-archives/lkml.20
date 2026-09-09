Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AF545291;
	Wed,  9 Sep 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953349; cv=none; b=trdwdYs9PTBcX0oz0Rp+Km1Suy4cv8IBjCkfE8LVugL9xL8ArRim49BDcs2oJBbI6wcVCz09IXqByism6eKjLIU8bvIAcvOS0wD2POKFyQDbrHaUKexEDizByBtVKCV4vfDz8Kze5R40+IAp800aOcNEWT5rfq5lA7Dfx7+YSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953349; c=relaxed/simple;
	bh=0RJ9olz8qTabdi098sLCcjzUX0MDkNFF56aV2OmxVc0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FjQ5lufQdOzVWFq7s9iY2ohMFyiYBw6V6aiRvED5gX7t12C8emJeMuGjZ75HGQ8HpiUMhnAE42ZhkAxpOZOvKWvaq/GlLmb8FGIShhwSJztBgcBq/LKluYL6QtINJ3RBHMhwgxpTm/vRS5R2lIwnrYH5WYeK+r/MqeX6wgmnakk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ddR4JqP7; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ddR4JqP7"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lwRelUPd/SJpcNwFxoEWwswiA4Fcah1gJgS/KTjoYwU=;
	b=ddR4JqP7oACAUkUAiD6cog3w/71eQ3IVn2STG5uQ+frI4KI+/hq4/3Om6+nPSi/eKo4BEYZbo
	BCcVx+pg14zpH3iUtpRyE7oMP+9XEjtiOryNSluqvUc9H3kuK4i7Zmd2xsoZ/dgCiHlDEh9n7od
	UOiTCIB5ZD0aCf/QFJQ7JlY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfyw05SrVzcb4c;
	Wed,  9 Sep 2026 19:17:52 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 70773203B8;
	Wed,  9 Sep 2026 19:28:51 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 9 Sep 2026 19:28:50 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <ardb@kernel.org>,
	<mchehab+huawei@kernel.org>, <rafael.j.wysocki@intel.com>,
	<guohanjun@huawei.com>, <jic23@kernel.org>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <luoshengwei@huawei.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>,
	<liuwenliang@huawei.com>
Subject: [PATCH v4 0/3] RAS: Fix ARM processor error bounds checking
Date: Wed, 9 Sep 2026 19:28:29 +0800
Message-ID: <20260909112832.805314-1-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100015.china.huawei.com (7.202.181.14)

Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
allocated memory") and commit 05954511b73e ("RAS: Report all ARM
processor CPER information to userspace") introduced bounds checking
for malformed ARM processor error records in log_arm_hw_error().
However, three issues remain:

1. The ctx_info bounds check condition is inverted: it adds
   ctx_info->size when the context header is already past the end of
   the section instead of when it is within bounds.

2. When vsei_len < 0, the error path does not verify pei_len and
   ctx_len. Since these are derived from err_info_num and
   context_info_num, they may describe regions beyond the allocated
   record, causing trace_arm_event() to read out of bounds.

3. ctx_info->size is a u32 taken directly from the firmware-generated
   record. A value over 0x7fffffff overflows the signed int sz used
   to advance ctx_info, so the iteration can walk past the end of the
   section.

Patch 1 fixes the inverted bounds check for context info iteration.
Patch 2 sanitizes pei_len/ctx_len/ven_err_data in the vsei_len < 0
error path to prevent out-of-bounds reads in trace_arm_event().
Patch 3 checks each context entry with 64-bit arithmetic so that both
the header and the context data fit in the section, and stops the walk
at the first entry that does not fit, so a malformed size cannot
overflow sz and walk ctx_info out of the section.

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

v2:
  RAS: Fix ARM processor error bounds checking
  https://lore.kernel.org/all/20260825134323.4181892-1-liuwenliang@huawei.com/

v1:
  RAS: Fix out-of-range section_length in ARM processor error handling
  https://lore.kernel.org/all/20260820131829.1006371-1-liuwenliang@huawei.com/

Abbott Liu (3):
  RAS: Fix inverted context info bounds check in ARM processor errors
  RAS: Fix out-of-bounds read when tracing arm_event
  RAS: Fix integer overflow in ARM processor error context walk

 drivers/ras/ras.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

-- 
2.43.0
