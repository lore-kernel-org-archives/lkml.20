Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226CC4AA020
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004175; cv=none; b=SM0n1aQ1pTpKqJcXkuy8LcfVGaxNq7PxMpjRi/wAVvrImZCo2R/SKBlCBXY+zUWwZkoHMD1vWap/UZ+UiSaymtgnhy7JAsDFXjZO7PXtqga8HqFGg2CZ3k1XTlzmEaXCCFkSffwZuWmbvtoEvoUUYzcjDbn/4pRLUaema6WeOwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004175; c=relaxed/simple;
	bh=YuamKqf3wWIm6d/wjsmPfZXrsEI4VwApWaNoKhz2ZC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caGl/tx6Kus6PkHdNFyXN0cODln4f1iTpDloqem7ILluHkFOW7AMZTQPjiD4SYz1P3hmCBfpMXxNqImj3i1qUOWckGQUYB5E2JBGhRx2l121uRTa09yqZH7pbgeoaNPjzP2TdnwtRkUc+p365KLOAKVWsuYCXFYukBbc76j0tt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lAe+xyeL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lAe+xyeL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so16322605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004172; x=1790608972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jq1r9pNI9TYrvOgY1YTb97iUOHNuCe4gvl0wKr4+QyU=;
        b=lAe+xyeLo/UAN2PQJAHyNiCkBWP3ZTefOuYLE4/zbBhfAuZDxRmOAyforUXafJRNOI
         FmqtwzFfn648YrmLIwKkO8I3T5HQlzWOVeQsPFL3tXhUURjRGskuHSoMJ3AdowGVGwjg
         gyFV7Rsp0MCH5dX0fvH3IZ7LlFLn4XQgSfjl1ggKniv7YTT86F8BEQEm0G+g+bTSX51I
         dB+DbQb67+1/bKd9XQGeovxPqZck3UHjfZsDLDT7yte7Bcv0t2yWnNs1K8uKzNSpGAhG
         H62e2FZfrk/2GBkNJnljwp/y1d7/nj64pUYS7Jlp4/I5Ahh5yY+KrwQjF9rZfU0CNJxc
         DO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004172; x=1790608972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jq1r9pNI9TYrvOgY1YTb97iUOHNuCe4gvl0wKr4+QyU=;
        b=qGxYRGC+H6IFB4TWwCe/VZNLWTcdNhCrk5nxKM+GmjC2dQrcmSiQnNxInAoNCzoBj+
         b45zG2x6PjGz/gnaaVQZwJ+GK0kfIhBOTrCmL7iUFW16CoKbssvxFP0aLvXwVUp68AOT
         BAXZLlXP+3JjnWCUOehf2EeMJqnv+POtTu1VHLdnbt4gXH2gLeH3J+TNDrnOOTGzbp9q
         B4YG67D//DXn0cF+AiEIOabZItNjBzS3nkH44CJ5F/nNN1sEAQ1I7k9c7OFCAFN+NzFK
         NEJwSmQrB70JslD/lSZIw+SOCFSSzkgNlPBv3wdfcH1AT/r9v1QvhfNlcOGicYHaJGFK
         Gr/A==
X-Forwarded-Encrypted: i=1; AKwUvBzmsUXftHx0Kr72x6AjOGGdmiFFxY80CZLY1Sonfmv80pzTxC847tv6518w2VEN7ZM6INjFFOLmuhfOT6c=@vger.kernel.org
X-Gm-Message-State: AFuF++loEKl80iWkk3GhiUwtJ0CCrKfozcjScnrxHnau+s0ioVwpfOSI
	6NHasIN/ohCZoteD4NZ5swPHdZjUbkYnAgzhheu4bUU/gJ3oqvFAfIlpAj1C4WdHp4g=
X-Gm-Gg: AYBFou2He1HktaVvv8DMrA+wlOJug9jsx2A2Jct5xa9FRImwVE5z/Ju7djVN/xq54BT
	XFmKFlXn7z7wMQNB9Gc9Itzl5F/YHYFzLqmcR89wdEWfSS572YY5saTZCKj9mm3Cd6bVkAf4/Dc
	ROPW0eM0lyfZLNWU3+tT2W22skPyMBgw/RQp2Vq5NjjBO0B6kEblThNjJxKNOFJ12IYPbl0LPNd
	dpHzMyUc1o3TzU3FNsc5MDIXIRcCgAdai3m7DkbHE4Tk5Tidtn81CTdR3SPtsfk5JKzH/BRwIWH
	ArYKekXUqYH4xtt10rk4J8+BxYFRR5xQt1uaF/Tc+t2sdiyZebPIlKNCarNu404l1w3NqJY2clI
	DKl73RxxaoHx9QsFRatSru3tBVNgjn1FcfAEG/W6CgEnxaQY8qoIsTTbWUGDxtSnJZmCCGFAxww
	zNhfYyvZqKogWPFDi1YN5hW/vK6OyNaJnTCbDyDjvijelvYPlzEGZtGtbJIq258c/TRb44uu5zZ
	tUsf2aogBgclyk=
X-Received: by 2002:a05:600c:81c8:b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fc573dae5mr142907945e9.28.1790004172141;
        Mon, 21 Sep 2026 08:22:52 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:51 -0700 (PDT)
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
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 3/8] sched/eevdf: Handle more short slice waking cases
Date: Mon, 21 Sep 2026 17:22:33 +0200
Message-ID: <20260921152238.3804392-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle better the cases with several short slice tasks waking up
simultaneously.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 92382db1d297..e6eb9a4c03be 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9853,8 +9853,14 @@ static inline bool set_preempt_buddy(struct cfs_rq *cfs_rq, struct sched_entity
 
 static inline bool set_short_buddy(struct cfs_rq *cfs_rq, struct sched_entity *pse)
 {
-	if (cfs_rq->next && cfs_rq->next->slice < pse->slice)
-		return false;
+	if (cfs_rq->next) {
+		if (cfs_rq->next->slice < pse->slice)
+			return false;
+
+		if (cfs_rq->next->slice == pse->slice &&
+		    entity_before(cfs_rq->next, pse))
+			return false;
+	}
 
 	set_next_buddy(cfs_rq, pse);
 	return true;
-- 
2.53.0

