Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9504F0559
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166417; cv=none; b=UJ5R+0gXGUBx13+2ngt6xnPsrfpA6n6e+DjZF2rj/O4BoWe9fDsK39lWsbQgluoxlvJbsO1hCx1Z/YevPPvajdkZbWZuLt+6/qo5uaOHUucptkXk57cD3yyM1dC9trT/nO8CBw93lJByx6iDHc946WG+mPCUalH+NDVky3PIjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166417; c=relaxed/simple;
	bh=7X6QDsxwKQwA10RxnaK/pXmyfnjU8+nioMirWnsl26U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0B7bQCINlyCGUsP1iZ8njJhdJpSJ582kGOcseP7U5X95CHwHrC6ts5WJdnpH9vLDa4+8EtUDsZu9ft889A0oDW+WnZYEVnOG0l2ZmrTHRxILsaWYVLKds1X8MTcH/aqRbA1czQFFj6ksrpm+Lv8bvVaRlWToECFxjETu6wIiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXFmNqI6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXFmNqI6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso109543a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166415; x=1792771215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvmLPz06rJRqpskfFH0YX2GLcYLTXoI2OSEKQqiSxh4=;
        b=GXFmNqI66EQ7EqY51yrifeQ81qnUTdmast/jXAhJ/xbSVJznO9ZR3QW8l9DYsm+gyV
         Mt1RmH6EUjfVo0ThzXxdW7Sd4LYIPc/CzW2dUdQFY9S5x/wMIiKwFVXF+LI3IXT4f/66
         qZLm4TM1BnDdSQTFgOT8REXX+ylDB8GLcvUrKVTA7MpV9KWiikqjOAe6akd8ptNCadup
         oY5cptCecDoe05IPtebmkar22T5kRJJH6hRL6Y9UrboaPe45ShaadJ2BNkJZH//nVH0+
         taQHADYESaM+RkpMVl/kmIdLxqqcEcjR4NjqR+ZGomsrzLvzJBtqiP8W+5dUpbqOWmPT
         l8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166415; x=1792771215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvmLPz06rJRqpskfFH0YX2GLcYLTXoI2OSEKQqiSxh4=;
        b=znCf2vEmIiZezH6S7EBqvMyQXJmh1lMIomYVvX6JXqwC4FMrGmYEZ1uXsTv8OzvJ7s
         8pS014jiuk9S4yf5fbaTIjd5JWCu8sNCbv37Wi4QGwmtunjL1weRoq9xKuuoAJ5tD8J1
         OwtyEN6SkIU84FbYXfPUKIKyLMleWHJjTHbuzC2hujn5v2KWZZDCqGPjzu6k+frQ2OCg
         NaR+WxyrFdvXjNCvTrDFnLlgBfH2Kixe5V18m+p9wHFP2sXP1RQ3zQbmmoDgMohsylY8
         oQruqwvVK303+0rcxxkjTUUAWGYR/QB8/fiUzGvyIJVl9ucOkI+hZ081OOEeRmi+NUdj
         HmpQ==
X-Forwarded-Encrypted: i=1; AKwUvBytaCwobpy1R3ArW5sXBYErG34c60SS2Ydt5o3PnIt8WNk7KI1KWwr7BsYJxQjsxU8DeC130jFM5GdRLis=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXbzat2qj6fxGt9Yb07NEAQt59zv2sM9CXAOt1/pJkziNjhRTf
	9CycQWC6nEkyBQardsMk8BVXtVRFhSpf8+owBvhdxNRq4BxG/0bTIzSF9k2cT/2grW0=
X-Gm-Gg: AYBFou1cnWnKjmLQ/sv7xxdUe1oXJfAcqEMc9GvP0CVdA/7+J0gBUKYkCxxjgs34Sk7
	OV/LqmMORg81Ms0L3TPGXgGTZA6e47eCq62NjwbXx4vXy3Phvq392IE422gDm5NEoy38r2E/P5Z
	HIb1NT1gHw69NtuEGI2fJXWu5wpXBX9PvxEplhKuuc3EqmzbA7LPaWk3V5eJqJ506WFJHuB2Bn8
	dv6ic4B3Y62BNIzUQhKafEC7dKlsYwYOUcv7rG8bXXiVtbC5YKfCeNxLkz44ScQRDIbpD3LdBtv
	zw3W0u2xW2YIkYeUaMYjV/wOnAGgbSX/77t10J3ISorM6Bd8bODbBM75MZYh3ngxJy3DIFCVPLm
	aFn1jaKvcrTfaEa4TgyI4DbomcT2H3RhXz6IHXH0a3qtjeb4CjhbS/ONZIBMRbS9KwKaiZ7GMsH
	/n/9gG0JMCqQcnNA/0BqakS4NUb1rbo0hB9JmGAEDsXRvZB+XJG6l7Q04V+TnaTzVYCNv9ZYVAH
	YaPGAvVo5kEk94oITsuOFi4lkasi5DNAEs8rv+AhbppyXqoO7o=
X-Received: by 2002:a05:6a20:3d07:b0:3e0:d38e:1ed9 with SMTP id adf61e73a8af0-3e16be86c35mr22403928637.48.1792166415388;
        Fri, 16 Oct 2026 09:00:15 -0700 (PDT)
Received: from casta ([2401:d800:20b:1196:6a2:5930:14e3:f74b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89febdc2209sm814796b3a.33.2026.10.16.09.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:00:13 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: paul.ely@broadcom.com
Cc: nareshgottumukkala83@gmail.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Subject: [PATCH v2] nvmet-fc: skip port entry rebinding if already bound to a target port
Date: Fri, 16 Oct 2026 22:59:47 +0700
Message-ID: <20261016155947.11018-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvmet_fc_portentry_rebind_tgt(), nvmet_fc_tgtlock serializes access to
nvmet_fc_portentry_list, but does not prevent multiple concurrent or
duplicate target port registrations from attempting to rebind to an
already-assigned port entry.

When pe->tgtport is non-NULL, WARN_ON() is triggered and pe->tgtport is
overwritten, leading to kernel warnings and leaking the reference count
acquired by nvmet_fc_tgtport_get().

Fix this by checking if pe->tgtport is already set before acquiring a
reference count and rebinding. If it is bound, skip the entry to prevent
clobbering existing bindings.

Reported-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=be62d4b375542ecebd17
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>

---
v1 -> v2:
- Move pe->tgtport check before nvmet_fc_tgtport_get() to avoid refcount leak.
---
 drivers/nvme/target/fc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..9b7fd8f5bd47 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1324,7 +1324,9 @@ nvmet_fc_portentry_rebind_tgt(struct nvmet_fc_tgtport *tgtport)
 			if (!nvmet_fc_tgtport_get(tgtport))
 				continue;
 
-			WARN_ON(pe->tgtport);
+			if (pe->tgtport)
+				continue;
+
 			tgtport->pe = pe;
 			pe->tgtport = tgtport;
 			break;
-- 
2.55.0

