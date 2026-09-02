Received: from mta1.migadu.com (out-133.mta1.migadu.com [95.215.58.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869492571A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788317311; cv=none; b=WrsALqxvArn/e6zDcImsKNYBrIc6a0iAJjLIPPPIwTDGnNNC+eyAn9lMiWoAjAuiPgHNv4ui8JAZH39vCfy71H7IcpgJdVMtn7uSMwzco0h7hckoZd5fba3b+XpX1DzXfa8qf1kmfqRT/0kO+Uy8oGDSSo6cKLRk+nE0CZYB12E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788317311; c=relaxed/simple;
	bh=h5/u0hMLL6AyXpBPdX0qhGLluLu/ufBc1joz2ezCes4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvl7y1rg2wD4AegVog6UCaIgIfF1xOyzYNfqWdGpL9reFEDa/rt0wk1DjgPwY1Cb47IcuYDiK0KDElUJMrANfF+wIC4jhnaphdci000Dx1wsF6sPdtUALfzo+SEBoteCiheCE72/SXLVkFBg/Qdig6g40qnfeKrL8/chsNzs0X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BviTLvmG; arc=none smtp.client-ip=95.215.58.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BviTLvmG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h5/u0hMLL6AyXpBPdX0qhGLluLu/ufBc1joz2ezCes4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788317307; v=1; x=1788922107;
 b=BviTLvmGHOoGmQmSrabRTWRcng5BCtcQrWjcPW6QyC6Y6eLOGelPBu/vT5mP/237akEp3l8G
 U4EuQm+bKaEz4wpvdqFGDcuGwx+aog3ajWdZ+4DcsNhMyc7OmeYngEpM5UP8D/K6QLxjuKbhvHm
 auSN63LiWbD/6E/+jv/Oi6cM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fb65ce072225f38a;
	Wed, 02 Sep 2026 02:48:27 +0000
X-Mizu-Trace-ID: fb65ce072225f38a
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	michalblk@google.com,
	liwanwu@kylinos.cn,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH v3 0/2] sched_ext: document and enforce vtime ordering constraints
Date: Wed,  2 Sep 2026 10:48:10 +0800
Message-ID: <20260902024812.794879-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

Patch 1 documents the rolling-cursor requirement for vtime ordering in
scx_bpf_dsq_insert_vtime(). Patch 2 fixes scx_flatcg's comparator to
use the cyclic comparison, which is correct there because
cgrp_cap_budget() upholds that requirement.

Changes since v2:
- 1/2: "less than 2^63 apart" (not "within"), folded into the paragraph
  above
- 2/2: use time_before() instead of open-coded comparison, drop the
  comment, fix the wrap direction and timing, state both lag and lead
  bounds, Fixes corrected to upstream a4103eacc2ab (Tejun)

Changes since v1:
- drop 1/2 (kernel priq comparator change): the cyclic ordering is
  the documented contract; a plain comparison causes unbounded
  starvation at the natural wrap (Andrea, Tejun)
- new 1/2: document the rolling-cursor requirement instead
- 2/2 (flatcg) unchanged


Tao Cui (2):
  sched_ext: document the rolling-cursor requirement for dsq_vtime
  sched_ext/scx_flatcg: make cgv_node_less() wraparound-safe

 kernel/sched/ext/ext.c           | 4 +++-
 tools/sched_ext/scx_flatcg.bpf.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

