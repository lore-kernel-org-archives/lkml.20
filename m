Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300749;
	b=zEky/WZdlNJuLzc5b/WNM3ZcpESxr4j2/zNRECkBIfFGCmWA76AvCUH2/zWoRSUIiQvQ
	 tUj5cuoXmOiBoeE50ZLtvqFIsFMaaNIICaToBWl+cX3FmYejU+8ck9DT74dOfwFMNwa8Q
	 RWza/fGm48Hni2aQs7U5ERzftQJ6mepkvetv28j9cXml25RDyYG/fveLBVEAxeM+mKD+L
	 dilacxHqAq25Hx0L0qefWracgcCTO023+SA8ahQksUPFuwNSuXv/o7NXesXfyWnrp+M0W
	 EFUGvbRjzTikRMkxvH7DOLiveDuMSgiZCkgajhBaCoBafOyeuWfAhuuleJ2h80mw3Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xfIJPZ8iDuwMd4fEVUhcFpuLjx5VOiQMHuJ+5IFm8uE=;
	b=VyAxlucNlc8bE7XhMgdP+/Qd0FcyEloLSP9lsXaUgGy0w8Zg4COMdM1rK4Ul7dHchSi+
	 6vl5ahJriKU2nuuFhs6vd3Wc90ZkKjbDCbdOK93PS8/AXvPMMbCklVbHEiJkxZNhah+Y5
	 Cghv6OLHsgyOzLC+0ruyUrFfjzrQEeBXcmze2byVl/Toqv7WWJAhPs8iIAcA2aMq8uZ/i
	 BmlxQp8w2jIAIYmdKybjMKWGOHud/2lkbp9REAwsxd4ks8Zp8hbUVkMlbflJp1uPaQZIJ
	 3wyOLAP08RSfg5PsKTN3ZgrDUsZqkPlqmQw28EQ7lu6dcHcJghp7ASXrfai6whmcPmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRpZCQP3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB2606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FFB2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRpZCQP3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so2577779eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300748; x=1794905548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfIJPZ8iDuwMd4fEVUhcFpuLjx5VOiQMHuJ+5IFm8uE=;
        b=vRpZCQP3JJAWn31Xlx4mnDyRwzONdMx5G1bNd+rkPVUyTY+7NIC4a2uUW3CmTW4uM0
         0Rg5T4YwHY9mWhvaj9TdrRU8C/BLWvTrSIbGsrkitVBcSpD5pe4gbXhLY9gawGjryu8h
         UkiIDyxRuM58fMrjHBU2VtjFCkVXaEKWwjVy3b/GiVw84TfEqUfuz0VvvEmLc0Cr/rwa
         NmYLM9a5QHdJ0rb8ReYzSDkqWrxfCojvkYT0LSAPyYIaOHw35qd0LCQUWRzG579rSXM4
         WgGAHTubycHVdSY/iG3Rlnz6nce8yn86MNJywXGn4Vy5+aaiA7xBC1CMdJYBSff9q6N9
         e8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300748; x=1794905548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfIJPZ8iDuwMd4fEVUhcFpuLjx5VOiQMHuJ+5IFm8uE=;
        b=13PCXyKSHXKCn4UtoHNkN+wfeB+eirGKemg9p/J49TNX7LLldy9HcbFwqdNq/lt3sP
         KYWw2FUVo+Qww9qz63OoD5AoBMpI8vPyCaw/vPeLuitw0tfcBo0PWvYk5OdkJ7CFt9r6
         kCHsVqQ3WUBodYswYZHc1785qpwX4su9DHfqnTjc2X6JeIN8hEfAaeOqSIB5RhR5w8fN
         eD/EAdiPBEisQ+IrodHE+YAUnONhEQxBRK3/x+NiGA5TuMvZeDCukk4xGMlbLhzFsAcV
         ewJsY93jpN9+38ke6E+w6YR5Y2LqY6hJRZCO4LeX9/l3XwcH/ivjzCmNdmW0LyP4N+TD
         sz5Q==
X-Forwarded-Encrypted: i=1; AL+hErEAlK09T1hiAKdSLIE0Fi/mnPLuwAPKknkvOOiX26fuHfASclkWwAg5BatPuSvaVhYiEnmDvxnthRQeBhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KGXQonzD2Tow2ruUcgGvFtXLrMTFwMl2hc4Ledrf4yuPjTGCB
	cEjwlym1ZgUkunAqpHG2RkFxGKWaAs/mqqQZEc7eQmLuF/Aybt8RZisr
X-Gm-Gg: AYBFou34eiBwCWRHxEDstUbTiKdr0J2FJeEIlJPqrAPLrG8l/OXK0sn1/pGRcUowgPH
	4y/WcTrL0oy6lvRV1AG6kQI9uzlpN1RmlfNESyakCtrnBbipZeRsByJPRINwA4o9UxCCR6Z9pvq
	utgUbrer9lxwfkjjLS+rWp36vCTzRRqgp6P2ur9tltSlOKziKkXQ0iVbI4gk/OFOmwJ9r25/qYK
	HPdfwqszvyvnnccmdzgcFBNQTwAPWmWK8abOzu6Zg6fzwhJ/fLN9Vudqea/oo9oTL6DVb5qB6oW
	hNZRjakHdPe8wBaCCOoQbKDVtT+akneR+sBzCwel9bKQVs7FioMo6Y3CAxpoIwKgiqqGryQbLjK
	zyzfFxVt4gsO1X54ksfYbdQRYDUXS4ji2p0MTktr54KyrhJ2Se8KzsJnpr9ueF3vJDJEL/ncEAA
	GiY3+QY7sMHz7qcONbWZZPRGkHVHlPoj4VK5EBwEFv7e1swzCxFEi7I1YVGxzSRvxmW+BXux87Q
	S03HvuujqKdjlUUuiV+78AGOgzGIatTmwIWfa8m/NomLWreqAa1yAcC9ARCbK1gl+ruOemEriAk
	we8v226NmJm5c+woFC/Srg984J2JZDziE3847Yfjx+nDVBcV3MTTWAro6jv2bvJaamMAO0Gi05A
	0TvWR8O+lwdCFBo7np/buUST3fUx4vnpBLm0R70fdKW9hWJU=
X-Received: by 2002:a05:7300:f48f:b0:351:2958:1740 with SMTP id 5a478bee46e88-3751fc35f80mr2396611eec.37.1794300747995;
        Tue, 10 Nov 2026 00:52:27 -0800 (PST)
Received: from AHUANG12-3ZHH9X.lenovo.com (static-ip-10-78-56-61.rev.dyxnet.com. [61.56.78.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm5590830eec.27.2026.11.10.00.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:52:27 -0800 (PST)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 1/1] mm/damon/core: simplify minimum watermark wait time calculation
Date: Tue, 10 Nov 2026 16:51:32 +0800
Message-Id: <20261110085132.1023-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum watermark wait time calculation uses an additional boolean
variable, init_wait_time, to determine whether min_wait_time has been
initialized.

Simplify the logic by using list_is_first() to identify the first
scheme and initialize min_wait_time accordingly. Subsequent schemes
update min_wait_time only when their waiting intervals are shorter.

This removes the unnecessary boolean variable while preserving the
existing behavior, including the case where no schemes are configured.

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 mm/damon/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index d36823f4d092..93ec684a113c 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3985,14 +3985,12 @@ static int kdamond_wait_activation(struct damon_ctx *ctx)
 
 	while (!kdamond_need_stop(ctx)) {
 		unsigned long min_wait_time = 0;
-		bool init_wait_time = false;
 
 		damon_for_each_scheme(s, ctx) {
 			wait_time = damos_wmark_wait_us(s);
-			if (!init_wait_time || wait_time < min_wait_time) {
-				init_wait_time = true;
+			if (list_is_first(&s->list, &ctx->schemes) ||
+			    wait_time < min_wait_time)
 				min_wait_time = wait_time;
-			}
 		}
 		if (!min_wait_time)
 			return 0;
-- 
2.43.0

