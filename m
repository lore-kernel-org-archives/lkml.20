Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5194A3A48CE
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512526; cv=none; b=Xq49FcVDGXkPFm/rThjYldvSMRuAj78pxJOgKXx9ZFLgQ3RoJsLkW8DbsFoyNR3bU4pGZj1zkvQyi//7nAiJ+ViuaoSURRWINige//GkR60r76QmkaMNCkFzfHMcQTDE2UtmlRqmtKncGfcbfCr8c3+OKLPofVTEnZpmcfulkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512526; c=relaxed/simple;
	bh=BAYRIhJz3nhXNsj7b4BggIqXScZgpgy1FTkL0zUjZlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RndbJp+oVWkKtcbUdpBsr0n4O9lhUF9Nzs/lafZKvbDJhyJ2Y8adkQNR5Xh9D5GlAmRhtiaZ1oNkZ2CsVdbZHZwbsWyxhlYZjPdJGTCo9uJBPjYkBOUttQXjm1UrZFwgtFOKATNoBRchRguvida0w6sMwLNi1IKBow2LQeUFBXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4UTyspO; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4UTyspO"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48436686a40so237042f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790512522; x=1791117322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRjgZWRcbUm0B6qIEczhmQwDt90oybfRSc+Y+pkwaZQ=;
        b=m4UTyspOns/up7Bc3MJRvTdUZmr9h/XKFKjXWqogkflcc2+FxNnH8pGrc5l4/hJ+aR
         PbeJt5rkPfsCsSPKMl2NYRcruXV1i3Ofa8qWN6SO69u/5HrbnFBDOQNtCVDTbJWwNw0k
         1jHc0QFxqdf1jznI/zboQ1yT3Y5ZMbx0kGGhq4CEBtfgnn1+hU6nQncoq/nbNUMw+QtV
         TwFncbXdo2pOwPNX8mXbuTAzY2wF/yd8+Gu/q8bR3Bs/oUcglqo+Ss0nsHyzs/RPXfPD
         GWy6tmE30FiAs7lRmholnoV73B2sV1YLWCRzCsZMU4gK3y6VwzBiJgGxgAwpqTSgM5WL
         ASZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512522; x=1791117322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRjgZWRcbUm0B6qIEczhmQwDt90oybfRSc+Y+pkwaZQ=;
        b=IzBaYHVgSjWxE3zl3Z88j9IhdbDm96Mw7dMLLLPYNCPa2rqpWkQUY5yzM7y+emWmzR
         fjYnOqdNSLyaGvl5s0QvIOcarUI/gDuEeawJ71whsvYPQ9xiQJJDfoTfY+osYujC855R
         SQmdPwM44yHz+wGpdRK0ZCDqLAuYTjDYmMTwzrwL4is5klglMMMjUmBX7WTdg1H21gts
         nixs4wO0q6/qjy04eApS8b4XqZznThV2YgQ2dT9wahNWZq4P6ieBCRi5HwPWIjlcoNx8
         w1e3+Z1pfmj5fgGed8WJjwZjUQ3ckI8FpiUuz5y6oVCkJcfP2EcgltkrTxLQKhRVxQkY
         Rrgg==
X-Forwarded-Encrypted: i=1; AKwUvBz24Q8Lvdz4GWZXARv/04NE1l8GYn8e/c068QOArDw1q5oUKhPA9Cj6Dhl3Rkpae0nxZe/VCae3eVp7I/M=@vger.kernel.org
X-Gm-Message-State: AFuF++lmxvCzpwttAjmcSKzDar6DeFD+fJkR7q/GNRayGx8CVYA6cPRR
	+6z9JLuXL377r18SyiCbPlzr42o2JD0Iy4wYLo/jmHbTRoCve9m+NtzH
X-Gm-Gg: AYBFou2q3otpbvQQYTMfqRLzxfPZDn0Gkeppi/KXdtyku3BBxlPT6jLiEDL65VRCpAR
	+YrrTJVngrt+DNoFttHnzkc9I1iVH15fZkquLPslLtlUiof72hexA82I1rSx2FEjVuMeelSaKEk
	J3eJJMYJLiSBZJgL2+alPb9910vSIPqD0zqFlPHqfm6vYb7bs4LifIYM+t0Y9sGh3+Ki3j6g/WF
	BZQBkddUKDT2NR/SnTqt4yOOILBwcP9haLkn5ONk//2ZzxRRTSBQ/K0sdqb5qLjH9NldYZ//hvl
	ejB18LRiuYuURy0T9SBazNZd+LHpOuCF4KKjdygBORxBJFtC/nJI3JW1GYqiyTm5WpNR1jHgOCJ
	UqMEZ4qBS+c/YvUdaBmUnzHHNUGKRFmc73S/mej2HjRWCVK9ygCPs48KqSfilW8spuzSo9N2/vb
	Yw+yTBAkuapqj7w+Ore3EfA54bVtfmNmIDox56y9v66fVm5V3rDRr4PNdyPlxUEmjMCwQlS9sbx
	3FcLqxE7scVanys0lnn
X-Received: by 2002:a05:600c:1c2a:b0:49e:7cc6:ec88 with SMTP id 5b1f17b1804b1-49fedddbad9mr165083585e9.1.1790512522002;
        Sun, 27 Sep 2026 05:35:22 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001771ce3sm58790835e9.7.2026.09.27.05.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:35:21 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Wei Yang <albinwyang@tencent.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH 2/3] sched/fair: Fix typo in requeue_delayed_entity() comment
Date: Sun, 27 Sep 2026 15:35:06 +0300
Message-ID: <20260927123507.39074-3-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927123507.39074-1-kayracizmeci@gmail.com>
References: <20260927123507.39074-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'elegibility' should be 'eligibility'

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83a6a99..ddf993a46e3d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7913,7 +7913,7 @@ requeue_delayed_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	/*
 	 * se->sched_delayed should imply: se->on_rq == 1.
 	 * Because a delayed entity is one that is still on
-	 * the runqueue competing until elegibility.
+	 * the runqueue competing until eligibility.
 	 */
 	WARN_ON_ONCE(!se->sched_delayed);
 	WARN_ON_ONCE(!se->on_rq);
-- 
2.53.0

