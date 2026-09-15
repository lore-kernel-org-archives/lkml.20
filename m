Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1CC3B813D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452590; cv=none; b=l8I8Fw6u/8PmPyt7QUefk0ATog2bgSVoCDTVWM6LwuPciMGxvk4KzCWZRpxDiueLQgDjI2BIv/Joh4E0uv031Ngr8sRBQnh9UUf/cgKV0+dJsLAgHpi+j0aMZDMtVlNMfeqo/ShrPjT/kPNTGhTyDOUpxnB4b5On+xGGGPhUXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452590; c=relaxed/simple;
	bh=dzCsYrwJVntmhJhcj+23XX0Hi5SaOYEE5WA2shbDc8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUCSKS+dgezsK20zmF778PZN+SwZCQBDqhfKDYnbtjOllViihESpSQmSqs92d5eBRQPpCrXM6LzuFX+YTc3OfpB9IAsPiuk87l7v0ytPs5YWQHIrc7kgWM1rD0apM1LNb9QBPBTsogiAv0g1m4biRevyQTFE4+35B78ueSHnTl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPhZOAZv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPhZOAZv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so28682045e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789452587; x=1790057387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHs3rghcFG8c8Adwq/+j11WtqFeOvFLLNzQbYygfDg0=;
        b=LPhZOAZv0TFBrXyAC4g6De/y+6QKZAXWc4J4jxIGqLRcIopeVmqJjYu+o6brVPPiB3
         jAbODR0X0gS85F5y85zPFJgxeCvZJJqqs+0XFUqDMnxaMoPmYfvLjXXRz+L4+9lBLCaU
         7XvGV6fDmQtm4eknUi+mX0JshRZvrKxCu3CfbF4CkhVpEUSjQyw4FCzrkY9/rU6mOiIf
         BhhtLo3ny/tvO3rQAN/yRdkaDOQbdYgZG21VXvRHuMOB4344et8KrgS2KIXf/BLJUEyF
         LR+xjBK7Ovka0rhw6QBO2FS5+u8Q2TCs5QijnlEf3gbscPn08nXQrKyevGjJOM3/wVHY
         k0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452587; x=1790057387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHs3rghcFG8c8Adwq/+j11WtqFeOvFLLNzQbYygfDg0=;
        b=IkVzYx+fkl5vor8Z1VJnbQAmY2VQSoYGFtWhsrTieV3uXy/WpRAWoLkIvrD4rla4EI
         kgh2STKyPA5abmu+rlcuTbTfgJhdiGDK7CgxmXD0CTWPBH3ZpPkT1lWLTcVeUCb7gCBY
         aQaGfNLS9CoL18RguHQ2q4YsxV1gG8r7gkdKH4IemB1G+YjJ9WkteJAPwhfYrH74+qH9
         nhXsNk33/4+WD0ZHuotdNUm1/Zk7bMqnI28TEc1KrsmaUwNQ73Hl8MfK1fkw34XCPrI/
         BHtXEFRMHAA2aMg6Xqd4DrHR/YBPaflVlwkKICnyV8s1K3Ae2xX8qgZLmzQbE+LRjyrJ
         CQpw==
X-Forwarded-Encrypted: i=1; AKwUvBz9qPlxaIgduWdMUSo6d9HWOHwZqVlNd2ZufazH3z0L7u5uiY17Bt+6lhx0FfkJ2VXPaA18nE12SFmF+zE=@vger.kernel.org
X-Gm-Message-State: AFuF++m7UqNMFXPA2EvX9lC9gq0vyOY1B2llRo+l9DFhdqMH2sd2WcpC
	KdUiT6GlCosxZgfPFPlhl96r8t3hbAoy+rcbrKvYmBpIttziD2o7BD6Ly6WeRg==
X-Gm-Gg: AYBFou3qJ6OiMiMhnfwWEsediDkMoESwo+PE6aONLPLDDsjb/YpganxLpQvtJaWZrRI
	jgE49Yl3wvZ204AxPvE4cyP8UyHgGXmmogptCBbPQvd44igBHHgOR1HapWD+zpQ8dj3ii21z+L/
	+Iz7/m4+ThQm2KZM/zaDUh1ngGTEkN8xZPHhuz12uyI47CMtQzVXgi1xbJSskmctFy3DIEi/XgW
	QbcOzSD4GEDJPI3Y+9zikWggWRwBnA9k95LFwSB2t8wh9bfdqIvRNLX/LDlICrtFZsWLT5hfB1l
	rD1GvYbY72hXkaGr0UXoT+7jSkRBOvAAD7T0tttBF2he7fhUVP3xhICBZB4cZ8ZZMgw8IeAxk3o
	mzTFuQwl4cYm15eZJneYUigY7QwEDta49PDe0RVT5O+bTUUoxRj29uwrOHRrxmj60d07tRMjEqv
	92piThxmCCwUdbDtKi0APTlLo2ArsoI2C8aw4dOWjysUvIZwLkA3hmL8bro79HKCcsLWblc9lvT
	FbusWYo6q9zREuuIk7Z5cJWby393cqqT/wQswzO3JC9XAHiTrjKvKttHFIkHUGGcCdmlrO/g4ao
	cdbXhFE3hdvEpDIcukFeLr4yfSB3u82iG1P/N1YliMdtyxEs7g622hNvDr6PDW5ohyH0ru4PnGl
	hUnAK7XrbtPrGxeXz
X-Received: by 2002:a05:600c:3146:b0:49e:6ca5:8198 with SMTP id 5b1f17b1804b1-49e7a668f45mr66829135e9.14.1789452587021;
        Mon, 14 Sep 2026 23:09:47 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-afd5-c801-cc65-9ba1-765b-bff6.310.pool.telefonica.de. [2a02:3100:afd5:c801:cc65:9ba1:765b:bff6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27c88fsm44282905e9.2.2026.09.14.23.09.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 23:09:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mm/damon/core: score an unmeasured PSI goal as not achieved for the temporal tuner
Date: Tue, 15 Sep 2026 08:09:36 +0200
Message-Id: <20260915060937.3423-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915060937.3423-1-kmehltretter@gmail.com>
References: <20260915060937.3423-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A newly created or committed PSI quota goal has no previous sample.
Commit a68878f83ae6 ("mm/damon/core: handle uninitialized
damos_quota_goal->last_psi_total") scores the first tuning round as
achieved to preserve the consist tuner's quota, since the feedback
loop returns its input unchanged at that score.

The temporal tuner sets the quota to zero for an achieved goal. This
skips the first charge window and the window after each goal commit.
Committing the PSI goal before every tuning round keeps the scheme
idle indefinitely.

Score an unmeasured PSI goal as not achieved for the temporal tuner,
so a new scheme can run in its first window. Keep the consist tuner's
behaviour unchanged.

Fixes: a68878f83ae6 ("mm/damon/core: handle uninitialized damos_quota_goal->last_psi_total")
Cc: <stable@vger.kernel.org> # 7.1.x
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/damon/core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 06cf2ab7e97d..e6d87fd3992e 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3161,12 +3161,18 @@ static void damos_set_quota_goal_current_value(struct damon_ctx *c,
 		break;
 	case DAMOS_QUOTA_SOME_MEM_PSI_US:
 		now_psi_total = damos_get_some_mem_psi_total();
-		/* uninitialized last_psi_total; make no effect this round */
-		if (goal->last_psi_total == U64_MAX)
-			goal->current_value = goal->target_value;
-		else
+		if (goal->last_psi_total == U64_MAX) {
+			/* uninitialized last_psi_total; make no effect this round */
+			if (s->quota.goal_tuner ==
+					DAMOS_QUOTA_GOAL_TUNER_TEMPORAL)
+				/* an achieved score would zero the temporal quota */
+				goal->current_value = 0;
+			else
+				goal->current_value = goal->target_value;
+		} else {
 			goal->current_value = now_psi_total -
 				goal->last_psi_total;
+		}
 		goal->last_psi_total = now_psi_total;
 		break;
 	case DAMOS_QUOTA_NODE_MEM_USED_BP:
-- 
2.53.0

