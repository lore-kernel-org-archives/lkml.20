Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6E37DE83
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368708; cv=none; b=LmdDSeH/ZE/5pV6M97nvMHsmSdLGf9hqGhlH19s6Fx+aKI2aAg2M9HYi9jNB8BQMnQU7pxl3dVOqhjIyuACXtnoS0hwXL3pnO+NDt8/Zp0mVa/q+vVl2sH0tlJy9JNaWJdmPBgneMcgBW3bIi6x8eQdh6+AE9djai05iYjQtkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368708; c=relaxed/simple;
	bh=RBAqUG1/rYQvo2+3aglV3aYZs0VtlZNFDIZJVBBBAe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/AXyRVhQ5aGUDbTSYtVeVeWWax4kse1NTKxr102GjLnJUUwpJaAV099999VuXl2H3VGdTdhNKeG1ymXxK4U1U9mL3ibGmgLrPwUU2MC80EPaUxmJXoQrwo9+J25HZJ1b+Q7i2fSvjQ0yhYt7phESBei7v0aiRCI4LX45t8v3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9FZHFK1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9FZHFK1"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1189442a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789368706; x=1789973506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EB7ws+vzvMgHerfQFUtDEGbSPttpE6gsLvIoSmUAzmY=;
        b=f9FZHFK1rhbDmilm6mt0MG+25E56R6jDQGAu1k4Dqih33sPA1z6RwzDrXqh9byVxBZ
         VUsHEacwZZuC5w1O+o8HTX/2YCcmrZdVhBxTJ1Tw8ogo5v5MZebKwEcqzO/mSo4B9WNW
         W+pP20+nxZq2i6ERt3jlFP3BmrzgtRKJlDrpMlLfqIiV8wcfXbRt8sYEGka4OIC3dOai
         gClNgC9OPrHvM6E0UJ1sSYCT/6XF83SK4NScLosfidW39HceU1EjVFJUAcIN/H7hRbpL
         aM8tMZMElDUx9+pMYyLwTXGMaDXnFeT/bWfXcL9TAX98suuLvTNA5c3OXNoQPNUDxnOR
         u4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368706; x=1789973506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EB7ws+vzvMgHerfQFUtDEGbSPttpE6gsLvIoSmUAzmY=;
        b=RMqGUfnxt7WSUe9/r0BSIMQrvzw6LSLYYJ2N2WyOFN7bo05A95sPkdg7It/eBq/3jt
         bBlu8G5kNPh5HZUX7KYtHEyo48yQv3Y7GgTqNvqsuLpSg1yf7lD3kgU9y4wXdhI3NwKy
         L6V3ywMOlVH9pGQqcNxPYbPWesEg2bnAtEy2njutHxVDQmMlAYYsG+uCLoE/SuGp0uyn
         Un6lvpbFkwzSoBRjPk3Nfjuek7CDsc/gkB9MZ5bYCooRXfzfx90xURNdy0sO/PyM8qYI
         NvMaslXdLVCZbYV8QhM4ztlOmV6hLhcbYaEfnFYq0hk+IDx36perL+fu/KPv2l1cmCQ5
         lrsA==
X-Forwarded-Encrypted: i=1; AKwUvBw2nvZcRzjK7k5I58Ko2cbPkmncc5Cuu/Vmd8AiDcKVTxFLVjvR8XTLXCZto5GozkI8IqMzHdubRSESAas=@vger.kernel.org
X-Gm-Message-State: AFuF++mzqh7toSYp+6m9te38m4AfhT5FI912tIm9jiTCBtX1/HeAU233
	Yif5mLe8Rt3AUbzgr5J/IYfEVt0Ta2Z4Q4dH3WFbOmLTXFW9hiLTegi3
X-Gm-Gg: AYBFou391qnj6JhzyWV458UX94FrnLLHvSjpbnSKyoyPo20WaqhWbyX8C5jlcwDHHzD
	1qV4yu/MSDbvMM+pgHY9EilAdLaMDiuA9l8k3fwt9vjfHjuF0W19LuitUL3uRiKMPJpMp/U/Kvw
	ugC87rfsknMN3jDYpsefkyfANT3R9ZY+/NncQV1sXLF+mUjOYv+NcyH3jZFpwVtQaLQwa5KRmFo
	ex8+4F5hjjn8aw/sTsu6HbWHpekAQD9qRmhe82dHPU02naV/N+xuj5S0Z9d1u+7Yz+OpTc2PUut
	RJUoCaGEy8jfWY3iK0LqdZ/zfBSNlEto2Z7zDcFlxy3JhxHoxJpNH06JaW108bliHJliLGXYoyG
	5SYwnqWpNOjnUIwfs+1Qxal0JvfPYaVtfkYZNhB3Ktz/3g6N3DygAK8/ffIPEBYt6mIM3I4uGRT
	WiuH5X99/VpieShGmVOk0OVwfwGGZ7j/YhbrVKQHSFziEv2nT0KGFdX0YeNYzgRxRBPjswvDSyH
	A1scdCkQUX342lROW8ZV0hys3mlMnYw
X-Received: by 2002:a17:90b:3850:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39debf93d7emr2935563a91.7.1789368705991;
        Sun, 13 Sep 2026 23:51:45 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db996bde4sm13262288a91.7.2026.09.13.23.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:51:45 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vlad Buslov <vladbu@mellanox.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net] net/sched: reject IDR error pointers when deleting actions
Date: Mon, 14 Sep 2026 14:51:23 +0800
Message-ID: <20260914065123.4109709-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcf_action_delete() drops the reference held by its lookup before calling
tcf_idr_delete_index() with the saved action index.  An unlocked
classifier can remove that action and reserve the same IDR slot with
ERR_PTR(-EBUSY) in between.

tcf_idr_delete_index() only checks the lookup result for NULL.  It
therefore treats the reservation as a tc_action and dereferences
tcfa_bindcnt.  A hardware execution breakpoint was used to schedule the
interleaving without changing the kernel source.  KASAN reported this
decoded trace:

  BUG: KASAN: null-ptr-deref in tca_action_gd+0x5b9/0x1010
  Read of size 4 at addr 0000000000000010 by task poc/150
  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002
  RIP: tca_action_gd+0x5c0/0x1010:
    arch_atomic_read at arch/x86/include/asm/atomic.h:23
    raw_atomic_read at include/linux/atomic/atomic-arch-fallback.h:457
    atomic_read at include/linux/atomic/atomic-instrumented.h:33
    tcf_idr_delete_index at net/sched/act_api.c:766
    tcf_action_delete at net/sched/act_api.c:1859
    tcf_del_notify at net/sched/act_api.c:2014
    tca_action_gd at net/sched/act_api.c:2064
  R13: 0000000000000010 R15: fffffffffffffff0
  Kernel panic - not syncing: Fatal exception

R15 contains ERR_PTR(-EBUSY), and adding the tcfa_bindcnt offset produces
the address in R13.  With the guard applied, the same reproducer returned
-ENOENT without a KASAN report or panic.  Treat error pointers as absent
and return -ENOENT.

Fixes: 0190c1d452a9 ("net: sched: atomically check-allocate action")
Cc: stable@vger.kernel.org
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/sched/act_api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/act_api.c b/net/sched/act_api.c
index 19501dc99..eabe612b7 100644
--- a/net/sched/act_api.c
+++ b/net/sched/act_api.c
@@ -758,7 +758,7 @@ static int tcf_idr_delete_index(struct tcf_idrinfo *idrinfo, u32 index)
 
 	mutex_lock(&idrinfo->lock);
 	p = idr_find(&idrinfo->action_idr, index);
-	if (!p) {
+	if (IS_ERR_OR_NULL(p)) {
 		mutex_unlock(&idrinfo->lock);
 		return -ENOENT;
 	}

base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
-- 
2.55.0

