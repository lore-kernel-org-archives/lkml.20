Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21304A8A1C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002625; cv=none; b=nGPUO41B3azEzs8LWoA4ohqCp+/O4nvqlqp3zxTYlViCicNqrsPP1qPitX95OUJgD7+ftuZDEKaCMt8V5OB9DO60zE2J5atkTwtYHzulEfm1q0uz/PP0FkOnyKeruoZbkgX2o61ni9gSnhefSbQTqppQYIlCyK3MdRpOaqybv4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002625; c=relaxed/simple;
	bh=vUAAggc+Ly3oIA4g6Q8P+Mm8HE9CgKSXyR3PfuqyBC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FU+OZx3CRPjcprL+TTlr95WnOH0ZppXk2h4LbTYeQIvtOTvht9RI4Y8kdsXcD8J24vWB3VnWG/n4357foyOVjzwEL99mO5H6CtMg0fdS9Zq5Uralo7GJOJOeEd5YuguEv94IXdTUoiRlSjgF/uik5vNxgAVXfkCQK8EkXuQDGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEjmAj74; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEjmAj74"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso2698541a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002619; x=1790607419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTm9qtAB3DCle9T5B2fg9qNOu3yAbfmq4DScnsd7fVg=;
        b=cEjmAj74kzoh87lq1ig267LWRYyhpzotArSprBmjW9Jxu2fTiblBihBVPiC3E7+/ag
         VTocXMMSxoosaPKEcxRjpPteXlQCTxW3GDSL1ND3gFHVLJUUtneBJLQ+FcPTNX2AfJ+M
         DnY5wWBqhGpPYc9c+dCbO9773SOZLLa5ax4ZRPfjQFae3oUSIqDOpetqiL2UMBi55gsO
         hfWn3D7f9fnc1z4K2Untep/Yw1U4SvGBIowFc/waEYPEnOCNqt0d3YsvFe4v238VW6OF
         HhDPX5o2WlwaOrvqhPjs4xfzw0S5BpPZv0MytlT/rZuW87nO+lQmFpres8zIL0Pw7EBO
         Uybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002619; x=1790607419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DTm9qtAB3DCle9T5B2fg9qNOu3yAbfmq4DScnsd7fVg=;
        b=q7OqidMHpbuSYdRl7dTiAWJAKiFw/1p7/3zohfPl/+5gj0GwvkSZHzmCi7VhIw8fuX
         nnEO+/fg07Sdm9rP2R8yiG8CTIFA8Ej1OHKxH1fS3pc+9Ib9u30i57yOSfjfvfihAOqm
         m6ot0Wd3s/wKUiAiLi12lc69tfmlyalrkLAe5fCvRzFw4i4FAtXwQSoKqfBjSI6CYloj
         epe8FOx6Fv7lq085YznTWNWHlsXgK6ZADhBEeZsjPmijPKcKdQ6wGLpg8kIWNzc3Y9pt
         KEw2AihIqr08S6g/rXEYvLX3sBwQ1rQygt04uxGIhlb7kQtPqF9EDB0GE66FvyMwNXjO
         Xeyg==
X-Forwarded-Encrypted: i=1; AKwUvBxURyd27uxVPNr3jyuJichN/wVPolEK11uTlScRay70utlkNFkfxYArDtJxVE8mY4nnN/tXn17kLaE4pMM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCjBtl/inM5Ah2GtLSv7xfMOh/2t1hFuUOWjMqbXu7VSZTb7ID
	97ISSkoMAGaJr64MOqXU3q1uko0LpTbCszKA6BqaywrJx8vsCVo92vk3
X-Gm-Gg: AYBFou1tU712TVfj9zNiVzAJDW5wNw4ukugiUfcIPa1keHVkxj/y3fgz4Wkk26h+QIe
	l8o5UofHoWEfvpHB8H0b0V0A0zw4XjpZihwO+MJw8KVG5YehkQQf/53JoNsC0qzSLXJ82OuUVZJ
	Kc2yzGoz+/zY4ULX8WAfRyJKAKF3oLK9dEyf1E8SQ9ectjY1NqpjIo60rpc3PjbvB8M04HzfF8B
	uD1NYgzYdJ9c/U8L164hhlBf8+7qwCzfGH3IaHLWuVk16qpxFwo4R9piCEj8j/cVlimcrHuBHqn
	e4kuopewJ1ZJCIDuTuF7wbZ4IN3fO941By13rDe4lquiYWe9tBquRQp8/GCv7ht8D5FX04tnLrS
	LH2H1Vaob/Ko0pO7GT9ZsfLsXf11BQn1UNI5KHZO33oF5AwnRqIuA3RL1iw2Argt18WkADGuAlJ
	IAoG1VaEs5LnBgSvgzXIBhCKktr42clfnEfkysdB6tZ9zO9f3knqdkYWXxgiTydbGWByd48NsRD
	zerKv5zmE+mtmfnvaIBQ2Qj+iM=
X-Received: by 2002:a17:90a:f947:b0:39e:6c69:34ce with SMTP id 98e67ed59e1d1-39e6c693606mr10046392a91.50.1790002618688;
        Mon, 21 Sep 2026 07:56:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:70bd:a3d:dfa4:3859])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a063b86538sm468175a91.9.2026.09.21.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:56:57 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Daniel Wagner <dwagner@suse.de>,
	Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
Subject: [PATCH v2] nvmet-fc: flush nvmet_wq twice on targetport unregister
Date: Mon, 21 Sep 2026 21:56:51 +0700
Message-ID: <20260921145651.17131-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
References: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_fc_delete_assoc_work() sends a Disconnect Association LS. If the
LLDD completes it asynchronously, e.g. fcloop failing it with
-ECONNREFUSED from a work item once the remote port is gone, the
completion is queued from within nvmet_fc_unregister_targetport()'s
flush_workqueue(). flush_workqueue() does not wait for work queued
while it runs, so nvmet_fc_free_pending_reqs() frees the pending lsop
before the completion runs, which then calls lsreq->done() on freed
memory:

  BUG: KASAN: slab-use-after-free in fcloop_rport_lsrqst_work+0x242/0x2e0
  Workqueue: nvmet-wq fcloop_tport_lsrqst_work
  Allocated by nvmet_fc_xmt_disconnect_assoc
  Freed by nvmet_fc_free_pending_reqs
           nvmet_fc_unregister_targetport
           fcloop_delete_target_port

Flush a second time so such completions have run before the remaining
pending requests are freed.

Reported-by: syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=77955102efac681ec73b
Fixes: bbccbf791e6f ("nvmet-fc: free pending reqs on tgtport unregister")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Changes in v2:
- Drop the fcloop change; the async -ECONNREFUSED completion mimics what
  an HBA does (Daniel). Instead flush nvmet_wq a second time in
  nvmet_fc_unregister_targetport() so the LS completion queued by
  nvmet_fc_delete_assoc_work() runs before the pending requests are freed.
- A blktest reproducing this is sent separately (nvme/071) (Hannes).
- v1: https://lore.kernel.org/all/20260920163804.67858-1-ngocthang2710.1999@gmail.com/

 drivers/nvme/target/fc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..cf9fd304a2b5 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1646,6 +1646,8 @@ nvmet_fc_unregister_targetport(struct nvmet_fc_target_port *target_port)
 	/* terminate any outstanding associations */
 	__nvmet_fc_free_assocs(tgtport);
 
+	flush_workqueue(nvmet_wq);
+	/* assoc deletion sends an LS whose completion is queued while flushing */
 	flush_workqueue(nvmet_wq);
 
 	nvmet_fc_free_pending_reqs(tgtport);
-- 
2.43.0

