Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B94AA008
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784742; cv=none; b=J98ROT3UJh1jH3KCvLcrPJhUvP36RiAdP7oqUV/407WOKxbBF24nOS5AoGu5Q+w3II6P2hCu0XMu2Lv+/3u3kesTlXxvdhtxbzLl+dIgGs7zlTgDrfepvnZVrjHOKXrqZBQpgrKWlU/iQ/q1F+V/ybki+sqlFOI8bYkuzC2lhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784742; c=relaxed/simple;
	bh=TGjI/thz3Llbn6Gpk0USkAuLJ7+eYBjqNc6GYz+39Io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFMQQG8cqJnS/+GR0VbL4bz70YfBY8H7cXxz4Hmby+NpzT5/Cfl/UQl2bUFNMx7BCdEVn25hacqtKgXpQ9q/dYRNHtk1yTy3NidONQxalZmSEQPDsnVpvF7eBF179radW5dJkn4MpnPpKP+/oHHIe9T8z2t83DT9ro4b5awlXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szzijRN+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szzijRN+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so15670765e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788784739; x=1789389539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWsl2zvLyVndoF9DoyxrqyI4rxJ1CEr3Aj0zKDJse5g=;
        b=szzijRN+jd5XbSXqn4HLIOoIBnObIDUgIGjDahe7yZAB2rs2Hnce9djyAwvOnp7YzW
         0BAGMm72h9HVwstL/MzmTfva6EJ3YJ6pW1/Mg/18hU6ieFE5BGZnUU+v3+4kx9LS9MuM
         WAwaVU7NU9zjK3KAQLueBRMNV4nk3/ZTtlxg2ASnSRRYuW9vovusm7WBcGYwTknaTG4s
         9zVbG/gbWmhIsLH713ttwKTuZtArHpefMTGmbGYYVCQt8KFlWmzNCVfhXoi2cHMBKXmR
         vg3z25cB4q0tSnszgB1bSdeqxNCvQzFrzjxYloloMsf308FECIcwxBRTRBsIJMPXJCzc
         qj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784739; x=1789389539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWsl2zvLyVndoF9DoyxrqyI4rxJ1CEr3Aj0zKDJse5g=;
        b=XfXMeSaNcM9HbspYjrAykX004l/t7ztzWKw5icJEl01rkExKYovwBoTWrFBLmJzlAV
         aqInlhq54xVkrbH5vns6gDGUuAL5dsaM6BSVhD+9PFHuH+wtUlKkqXUA07uRxT2TLE7Z
         WN/7eHPf+jvV6ETRLPp3RNBy5PqlEPItdOqTJRyHx+5aWnODIFlWMnLBfz6VdXOZMJ4r
         f9aYMkzawmReI7B+8po3OlGXKPweMSl6TZlMA9Lv/m4IPB20TCkrKTcq9e9bHRWpsnNp
         wYbUF7Hf/SFpcnmFwSdjBQBknmU+W6Nig4AxTXcBvK4QpZCsvwa57cIn0a/7iEtY281H
         90Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzCKb4dOvoH9EQrdRtKAglkcfhEJqt6mdMAK3jDQPOmvNXkZdUpJAHetzAVjrSbPWWHwOCBRftl04kdJmc=@vger.kernel.org
X-Gm-Message-State: AFuF++kUpwmCrplZsSPFEHG3KbL1esMnbCggj64gVrVN8KUKegBb9i7o
	VjZwm+lzZinENzbjEgnxawejBF/E80Zb+7ixIndm5Tiw6RrXUDBG380Kciaps6aaQ+0=
X-Gm-Gg: AYBFou2WJ3GE8HSoKOxcVZc8064z+553oi7F715yIjbtSyoLsaeoxXZa9pFRIEmnuNa
	16wtNqjkDOCjMp2DydyQjqpqUa5umLBit/6RCAct9o2UXbn9KWpdBN+7BpgKpM+wdb9w1GlrH4T
	i9eK4CQc1Bf8JZDydhCPNtN8SwyU6crzG9RLhyyaTxIqTWCfhz2TgH8PSasepfUyyhwuoOFK7ei
	DqNftxDiO7Qxh5e2uBxU5YqXs0t/Yv6KkVDd0OHA7OmQBmUy7UF81Etm0xNLn/vI+t3rzN0i8iW
	S4u8XfSLgZU1aeiKKNQrD5fhRmVgb4ym3Dgs2991eXj9P7ZGJ7qtNf+wpxsrV+1N5tC9HnYr9dv
	CFUoukpUjdMQMGxHsXiamqHl41EbF7SGvkTFA+evwwjyDv8Q68IsleyKnQMi4iBADC6Vz/K6mpf
	ZrgYT2fJkbwcSOMeTx6dGiwH4e7tM3d2nxQqNBGOscJIhw8srP6V7fyCUFA4DxR4P3d6yUnGR/l
	nFanArwq8JMLQ==
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr139638645e9.10.1788784739203;
        Mon, 07 Sep 2026 05:38:59 -0700 (PDT)
Received: from vingu-cube.localdomain ([2a01:e0a:11f4:3020:579e:ab8:acf4:1c94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm269737825e9.11.2026.09.07.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:38:58 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] sched/eevdf: Fix augmented max_slice
Date: Mon,  7 Sep 2026 14:38:55 +0200
Message-ID: <20260907123855.1297976-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to se->min_slice, init se->max_slice with se->slice before
enqueueing the entity so the augmented callback computes it correctly
at parent level.

Fixes: 6e3c0a4e1ad1 ("sched/fair: Fix lag clamp")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b..5d819918e870 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1073,6 +1073,8 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	sum_w_vruntime_add(cfs_rq, se);
 	se->min_vruntime = se->vruntime;
 	se->min_slice = se->slice;
+	se->max_slice = se->slice;
+
 	rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
 				__entity_less, &min_vruntime_cb);
 }
-- 
2.53.0

