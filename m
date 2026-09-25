Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB7232D0EE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340807; cv=none; b=ct3FgajHMEsmreLIVaC6foBucY1jqbKeWFZdqHW+3eQZXRipbvq5K7+eW0kGbtHQJ3yoSQtwJAoh+OvTzN9GgCN6AwaAhEz5mLpsx7m3CZaU0rFgS3rwuwosVsMwE0ixPGC4GcLP46GCW6Xi8Kxrk3XwUZ+7uuaxw1mWSl21qAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340807; c=relaxed/simple;
	bh=/7nhtfx0jmc9Eeafdo764s7X0PrVnvbgpM99LJYn/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQAJFPmCuN5PW8w7AdzIOjGtPPUiUtZEI0SeTAPAOMZjGGipltnXrOd6leqjSvcf9+0TBvkp3CPISN2WkHj51K4oA3KQJ5w7SrMkCAVmxwCLtpLp1XVY5b5lb/rDZg9uxwWzSQZMuLtkB8TzC0cMvaOJIbOk7RViRTs2Lda4miQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pmjv/4FR; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pmjv/4FR"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so279790f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340804; x=1790945604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HaRnV5HNxYS3xKGjNmztf83AWXiwarq2vGsbWimUVzc=;
        b=Pmjv/4FRknTyju4rLIG20qv+ITrfxeZY3lUv2lr07BuLdFLbx0ZW/fjnNO+bQwiadW
         mHC7iyx/ef4BWkjb+uLt53tMTQatIftfrswSHKg5PyjnmUIK84GOFlb5QcPsvaFUwxhS
         7FxxkN7+95+zl4h4JzCykaD4EKez+X562FodfF1C9slNy3awGvswhmDreZ2U/hEBE7F/
         9fLrvqNBGvwGSFSOPrgz+K/1tCwtVwmgAlePmxUeyz49i/iuL396kFBBNKYAwCGy1wGf
         2JajZHgpS9aILIU8Xu/s7CQslAjPVHz3749kDZzBRLZlcLTUMiIsI1FiVYvixtgIPTUy
         Nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340804; x=1790945604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaRnV5HNxYS3xKGjNmztf83AWXiwarq2vGsbWimUVzc=;
        b=Yz2jzV1eKQ4IT/JLy27SCVEQOE7IMff8Aa83dJ0GpJGVwgQZJDqInHu0fJunE9lpxZ
         BmrvwEOEJtYmqvtUy8zuKeZZvEqsSLT/xdj56HkRKz6Qtw9QnJPLJm6ykwq3HLaj0Rpo
         N44P+PAmigch4aSOa0NCYFMcbqmNwTF62aHgr0PszEnbHQmW8BZqEsIJzJIBjkmRnsm/
         dryN26/YzqbZvHgda1At77SKMogORY8oY2bVDLp6VWLSO0tpr+ZlpnIWJYKnHd6692bw
         qObhj6xUsLCJX7KVUT3d4cYv9dQqTVfwsoLwQJtwsnFD8o+vdq881pstFPAm7pWeC6G/
         b5YA==
X-Forwarded-Encrypted: i=1; AKwUvBwSY6fJNgdQU3nSodw9AJnmRlW9L32luBla8o9k7EDSz1A+tifkdb/GR7Kixsxlkmr4zQGY5X3q8AYk370=@vger.kernel.org
X-Gm-Message-State: AFuF++nkXSDL/pWuDaooPghtOH8IclCHozzCqbbcSxpAiPRO5ut3aArN
	7c6BFewj6iNA7JigWtDtIfYkdTCEXChyxa4zfJ4uOECHN3qxqQXWEbfU
X-Gm-Gg: AYBFou2BREe5+91LJlUAxr+HPaOL9+HlW9GsH259XWeYiXcXXtKrIc+CtFzSiXgk13t
	/tE0FUxCL+P23/WcmQGuD/9f/BY07PSurjDKERqduQeQW0gsFgjDY51OfB0dzLYsKeOwE2zNQS7
	FIi4j4wtct5MMR1c1wT2AT7fMX4aOnkSTwzs/I4Q2oka0HxkwqjOjNhwdmfOm2uvIX7HRNxr1M4
	PbQBqBG0c2DLeanM8kSsDMOenrDJKtWGSsHjUFgQIMsFyEI3ayxFwkYou4/ICKHOxVD5rxQ3ACM
	oUC2/NbsmWD67RAWT8peR42xElaLRsX++DwLMJ37BOkTfsZgMslC/dkDefAIaIwrcBZUKW2XraR
	qQD6/Gvg/NPpcufTomwCsf2TfanK50F/Jn5cesXVDNA1kbSGYBbUTjhIMVlOe6w4Y6hFeGO9rY+
	ujp3ZYFHJUqgugL5LoKOPcJ8P0owr8sZcDB5qZ3espix/kLj1QbPBqPYSRHLUAy9QAMEbJmJBRB
	WkUGeKlew==
X-Received: by 2002:a05:6000:2083:b0:487:463:92d3 with SMTP id ffacd0b85a97d-4887171a473mr9808865f8f.20.1790340803845;
        Fri, 25 Sep 2026 05:53:23 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm7170296f8f.18.2026.09.25.05.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:53:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: don't report link training success after a reinit
Date: Fri, 25 Sep 2026 14:53:14 +0200
Message-ID: <20260925125314.16563-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When every training attempt fails, the retry loop in
msm_dp_ctrl_on_link() ends on a successful
msm_dp_ctrl_reinitialize_mainlink(), leaving rc at 0. The caller then
enables the stream on an untrained link and the display stays dark.

The retry counter only reaches zero in that case, so treat it as a
training failure.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2434,6 +2434,9 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return rc;
 
+	if (!link_train_max_retries)
+		rc = -ETIMEDOUT;
+
 	if (rc == 0) {  /* link train successfully */
 		/*
 		 * do not stop train pattern here

base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.55.0
