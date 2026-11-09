Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238725;
	b=yXWKrML7FYyQTpSqPBI0jIDenZdVhdNKdeUCttJ7Gx1ASA2h8xnbC31s3Pzt76oNa2By
	 8JiniwbzeI/NPPb5Vqkt15jOAQESD8CGI/wTwOqa/dWyeGQks17/JQibFQ+cn8AHoGJ+0
	 7vsmVO8in9zBhLJVhhgPvvTMaJVJ0szN36kTYWTCr22fYnh+VA6HCJpzJeCPdBeR+GgUV
	 7JRIQas/G45Mp2fBRG17zbX2oy0Er9WXn3cV8YVw0d9vmxueF+gtuHO7gHF/q2KAYkXzL
	 rLJawJ4xZSwLjVWIfzTvbo7eCTjMs42I68Ix7qM4GKwDbawkAHlg2VlVC/s7oGphCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ss4lrhqPmF5SUHU4F1piOVZZ27/MP9CBwo9B8OYXbxo=;
	b=lBXA++eLdaBuzcVyf0bk5qHCrFpAY4OnfFY544USLjBMw1N3Yi68v0rhTUygo7QTN9Mh
	 1vgllablfOv7MHGpcbA4dQiUTGf68IoGAoSUSLnfEUjQmEYJdAm2xdm1ZAV0vn4X1HYOP
	 35Tak0CCWFTsX6oqq5HOwLe+LwISuvWFTEM3GWrUXL6RdtlalZN36jnEigDYFYB4UnUql
	 lp01uYxaKJ8JXbn7pS77qRSPVQ4d9m1+YVA11dZsC2PhEGNk4p6CfU0D61AtqFPeLMXDl
	 FEUyX74w6/9A15cYQ/Du4yM2rsR6x3Ff7u1gjSO95+PUbiBC80Hg7gquVSgcl+6ppcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhbhqgqO;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CB606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A1CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhbhqgqO
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd4dafdce9so370098a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238724; x=1794843524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss4lrhqPmF5SUHU4F1piOVZZ27/MP9CBwo9B8OYXbxo=;
        b=dhbhqgqOP7Vq07GCl6pq4R+xXeHTbvQVruGCvp8IveIPKwZIHVS5DzI0pj1ZZF01HQ
         nz6k9wmQdp1HJT7ACl0J3z05Z2NL6uey0a1xjH5m4B6wGRG/YQgccqws1F8QQpOjjCCj
         gm6HD7K5aKHiaWTxhMn9HLkwWPzEVfg55TkekR5uYjOGfT9e6N54Lua6fBW2rEEUjFdI
         AKD102ckvoUdkMMVhM3GB1qMsYpmJubB9cGILKs4FVrJrCIjNgs1o8P/sPX09S5lnL3n
         3xfxgT2T+VTKsiYK4f00f8H8cJhXhtJA1Rkvy6DUinxNqCD8iZ2Bjiwey6DhKRF+U6HP
         2DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238724; x=1794843524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ss4lrhqPmF5SUHU4F1piOVZZ27/MP9CBwo9B8OYXbxo=;
        b=c1zhqOFue88espLyfGingPHcVl1hIhTyrTrw9Z/NZmKQcUiiDjL8dS5iHR58ogGcnn
         2fd45Vy9PdiVBJvcAYpct4LEhwbCIxWUOtVMzzswxyLC1N9lLHqYYba+LI6bzRf9lew8
         z6pMI93c9S/xrl5Mt1Mey4L83O5iV98GsHqipRlQomxh8/ayhvWZZnI4u5c6otXnjXQf
         zi/tHOwaVVWomYFzUodaAHtoLSLZP/QlBQ9UU5lxLo8SEPWRnq5e7G669GR0jFJ0dtua
         25fBEzyio+4rp/j/rihxKmuHhKcyRBOn+BpsdiBGcsjvLeIYijquN4RwTsVlcnu9aTz5
         PChg==
X-Forwarded-Encrypted: i=1; AL+hErGmE1aCucvO0EPPT/Ts1QvFvF+nvPXtKanC8I9toBswLvJT+EIYWbwwyU9IfndEhOjUpwoGKUfVhAB0irM=@vger.kernel.org
X-Gm-Message-State: APuU4Z80JhKr0C4rSRZ0dJ+JLM9ry5FJgHqkzYhIYHMZTmQTvPOuUvtM
	FdCP22l2ZOqMuy97Qs4czXqSS27lNvdAQ+8IftkZ7BKEQWRNqpGvg49T
X-Gm-Gg: AYBFou1voYvzrQnWmRmVCZ4xwy+NSmLdd1Lc9s6ngd7yFkCG6W1p8cPHaqBZO4GEtIf
	8SYBk9U5fzT7xcpOS/zoISm7pso26o8DJHmb44cG9MBG8W/zVTE62/OxvFcbj3dTlifkL37PCit
	TYD0R48S2k6yeAfCHrk0qgX3r+UiuEZqT/S0rkNVJicWMYdOfERVzAnhGkgGhw8tXIQezotB+ph
	Nuwb9QagLkQJ9TDsqjJFGPY3NQdPgW5eYigxqXR9+bwop98pqbOnlzd+ME18IAK9PYlpEvvGevD
	AaOrODx2Z76oKaPDXMDw37P75cbJDAPgqcPC/d4RjJ7mmSPsX3zG+lW2av6FPpyg3SAUXcUQJgW
	2Kvph9LqggAY30Km1VsM3doK1ASlwLcw35Cw7v+xDvtFLnB/I0AXC3BEbj8uWuFijooX8Kw+QjC
	CEMhmedwWucGyGN/Lp37DGkBcqPs9INm+kpw29Nsz09R8TEEUBxNGpaJofaQ3G0sVqjyJotEtQO
	7czkypEa/P2bm/GOtklvD2DttpEc8JKPT33ZsKaqW5ihL+sfvL8YtB/RXsNDPZlOLoswakLRQM/
	x9pVzED2GBN302Wj8MDWhvRp7O2WfD+CXP32o54MX81ykOH1p2CVG3u8aLzDkdLUdGZ6Dze4TOH
	rlGM=
X-Received: by 2002:a17:90b:3c09:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3b166ad25ffmr30988a91.4.1794238724301;
        Mon, 09 Nov 2026 07:38:44 -0800 (PST)
Received: from 0.0.4.7.1.0.4.2.ip6.arpa ([2401:7400:c804:b668:b272:9904:c32b:2ee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm11062029a91.0.2026.11.09.07.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:38:43 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Omar Sandoval <osandov@fb.com>,
	Hannes Reinecke <hare@suse.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/5] memstick: mspro_block: don't hand a finished request back to the host
Date: Mon,  9 Nov 2026 23:38:00 +0800
Message-ID: <20261109153832.7377-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109153510.7161-1-hjf3108@gmail.com>
References: <20261109153510.7161-1-hjf3108@gmail.com>
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

When a block request ends, mspro_block_complete_req() clears
msb->block_req, completes card->mrq_complete and returns 0.
Host drivers take a 0 return from memstick_next_req() to mean that
*mrq holds a new request, so the host issues card->current_mrq again
even though it has already finished.

At the same time, msb->block_req being NULL allows mspro_queue_rq() to
pass the check and queue another request, causing a race condition
that rewrites card->current_mrq while the host is executing it.

Return -EAGAIN instead, as the function already does when there is no
block request.

Fixes: d0be12274dad ("mspro_block: convert to blk-mq")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/memstick/core/mspro_block.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index 4a52830026c50..fe38b42431219 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -706,6 +706,8 @@ static int mspro_block_complete_req(struct memstick_dev *card, int error)
 			__blk_mq_end_request(msb->block_req,
 						errno_to_blk_status(error));
 			msb->block_req = NULL;
+			if (!error)
+				error = -EAGAIN;
 		}
 	} else {
 		if (!error)
-- 
2.56.0

