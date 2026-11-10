Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317388;
	b=IawGarvbbk89U5emlrOWabkofJCkKN36uTdxupRffFtRfR5Eat5EzgCCNMoMNaeuQuQF
	 GJVUkF26Var+mIq1+nSLuo0XmM91KJS0JJkNho+Qvwaaw6cdyNTym0jGVSSkP3H+Wo1pq
	 /Zy6SbqyKN+k4f7WtwUUDFAAgR5WqNBJiV3nbK2N+0S4RN7p3iunCN/LgCuTnAV0cWplV
	 xZjLVrfO8EfG5JPsG/J8M1A2W0CbGlvJtj6aJEJQ1rnPhzPWXS2Zr0qk85vr6IYNZxV8l
	 ZsWDqLIRQUXLENEu7o1nomCFMNW0mODxlkhJDKEQUsf/uJ9ckVp41KVS41mCyNl6Rbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317388;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BDc1IvI6OsHXdrQ8x74AtWRkft+aXE3pPjEVY606+KI=;
	b=2IBvPSUhLkWHZlRiPJDlhlF/ln6F2Qkr7ynIn/ME1wWA2JheiuY4qNbO4NhNMAyP3jVz
	 8rsITPRV5fFCrh0t9QCrTXZc64JIHbKQrU3AV0QzfJAGTmODY9d/GquahnMga2P3kLehO
	 1G33ocX5YPlXGolWoRGcD14zKz5SElJByWn6D46TMHAsRVo8jtUGZZmHX53mFkQcykeQO
	 x8ZKbrJ1C/Vm8H35vaLRmV5iE2wFCUVNJWN7jXYZFn92TDYmx9fbY539r8yTajmj2JMd2
	 Y49kqNS4XqRZ4Xf10bmc0H0ZPZMZsowPOj6gMQagJ7agMWw676OpKznoi2fNw5nencQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TuAh6bOa;
	arc=none smtp.remote-ip=91.218.175.67
Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032D606A762
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7032D606A762
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TuAh6bOa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t58bLFbopiLhye+XA8VecW5nbJtFNFWoJdVnDP5nc/A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794317385; v=1; x=1794922185;
 b=TuAh6bOaCEJ+qkh32W6hcLuO20vUvAF91Oks8v1acJWAjGdr2C4BnhO8Np4CiVaRofvfposs
 upwDnqSTXrBYcFYcPZqMuz63UQ4snMxiLv7deeLjiPHLPfWHyyouTzygsE7rpia5QQW9tq9fNHh
 MX/gp9GA19pV3zoLK1ZjpTZI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a77828bfa05a4d54;
	Tue, 10 Nov 2026 13:29:45 +0000
X-Mizu-Trace-ID: a77828bfa05a4d54
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Tue, 10 Nov 2026 08:29:34 -0500
Subject: [PATCH 2/2] scsi: target: alua: Drop the grace period wait from
 LUN detach
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-bug-target-alua-lun-gp-v1-2-127a46efdae9@linux.dev>
References: <20261110-bug-target-alua-lun-gp-v1-0-127a46efdae9@linux.dev>
In-Reply-To: <20261110-bug-target-alua-lun-gp-v1-0-127a46efdae9@linux.dev>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Mike Christie <michael.christie@oracle.com>, linux-scsi@vger.kernel.org, 
 target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

core_tpg_remove_lun() detaches a LUN from its ALUA target port group
once transport_clear_lun_ref() has drained its I/O, and
target_detach_tg_pt_gp() then waits for an RCU grace period.

Nothing that wait could protect is freed here: the group lives on until
core_alua_free_tg_pt_gp(), which waits for a grace period of its own
before freeing it, and the se_lun is freed with call_rcu(). Every LUN
removed through configfs still pays a grace period for it.

Remove the synchronize_rcu() call.

Removing 256 LUNs from an iSCSI TPG through configfs, five rounds
alternating with and without this patch, takes (median, min-max in
parentheses):

  LUNs  before (ms)       after (ms)        change
   256  5222 (5165-5244)  3551 (3436-3810)    -32%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/target/target_core_alua.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
index 35d36cd36db6c..4e22f988bb83f 100644
--- a/drivers/target/target_core_alua.c
+++ b/drivers/target/target_core_alua.c
@@ -1858,7 +1858,6 @@ void target_detach_tg_pt_gp(struct se_lun *lun)
 		rcu_assign_pointer(lun->lun_tg_pt_gp, NULL);
 	}
 	spin_unlock(&lun->lun_tg_pt_gp_lock);
-	synchronize_rcu();
 }
 
 static void target_swap_tg_pt_gp(struct se_lun *lun,

-- 
2.43.0

