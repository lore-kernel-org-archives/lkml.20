Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8D363C6F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314248; cv=none; b=o0TWnk85AX/IMgcXiD3wq0bYa65P66pkvFrngx5GZDMhDxIRnBu2fGleMANCeXr0sh8dvbjiGvI7kZYPuWQKaET9UYX26QwqnuMZ/gPINa7blbO+2JsR9nX+/NN3A16SN0Lvwcu0XWNi5jPFRStH/jZdWpFUCAbiCiYeu5C/0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314248; c=relaxed/simple;
	bh=OO2BGXWS3mSpTcM1EDr/idHgcRwBEfKjIKRjo8GuBro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXEQwgc3U2+AbR0OK0iEqdj+RlsFtvNoAo12MX4nRFr0mDeGqBtht8F3bIgpy1epfCb71AoNt2gWKBNVduTvQiJ9DPjikSkixTSRndcUQkTH5zRtfIkq/W+r8vPIN4Rw3F2DV6I6lIcOtgRmBkq783JaJpWRPD6zhZJvSGls32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=gLBepBaj; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="gLBepBaj"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso436007b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788314236; x=1788919036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQv53l+2Rw8gT5LYIk2AL0drTQ3KamOD30iQa8HJxtU=;
        b=gLBepBajF+Xh3kyYQ+5Bd+J6eBhFhs/ER2YOdlsgxKs5QnsToRIWEkB4n8Gx+N3vUp
         FCR2oXAHq00B5f2/wG899jbozk8aG4QZgsRQKBbtdtWD5fAlC0E0PoJyLqW+mtipIuGt
         Z6kbp0dGGNOLtuSlw56hHuIBg7MW+FfepMeNia+mR3peSD8XWjGXowQDGVKwMzhuNIiV
         EzzOIMX/rt5PeNPHZ5B8tqAVOuuJo6QOkdW4IgDQbkjx6BymSrh4UgnyUIbp1LVTPxNM
         LlNPGXHbo4nAo5g+0y7ynIvp5bS03Df70y2PqiNP52KtEUCYVpIL7oaYhPwojt9IZ00v
         yGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314236; x=1788919036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQv53l+2Rw8gT5LYIk2AL0drTQ3KamOD30iQa8HJxtU=;
        b=daa8Ktw+a3XQ7gwSxaVoB6iPYUGK92Tw6DS7yBbUg5jsqUosdQJzr4J9/nq/H3kUW+
         aqpvdBZ3UIEy6sVdvQWYdHutIKbhdokSvHbyuUSVBm4O9RQolwahceRv5DRoMHqUI+8S
         6FbyL1LRIkrsm50+vnLVdzv8BmQ7Ysf5LozsxVvoB0okl2yNCeEYVlQWPQoHUJXQQP5I
         vFz62OS05hQAaGP1PYVZaRuxH2Jxz7vIRIfe3+l+88YA3GgxXbDZZMLmvwBpZiT4cAiX
         i0N4BNNX879ljiyPP3z+OWtKuuRt29G9OozgTgi+ThWkf/Efcrdv1rICgXf2WkQYSW7V
         8zgg==
X-Forwarded-Encrypted: i=1; AKwUvBxiHJNNE4Ms9PRMVrh7TGdWyzrgGXoD/Ic6KEtue95BDU8CD2ZIwMmz3udPgRuy59xc/eitil2TjYSsLCY=@vger.kernel.org
X-Gm-Message-State: AFuF++m/51MCfvOnfc5fQ85VEPr0aoUO1/2Bye2nsz17tHGYgZS7aokS
	JIGfMwLmaRu5XxFaUd5OiqkaW2dEck7LDb8FKr5JIuUiG+UjfpnaA6W+FWo4MxhGT/U=
X-Gm-Gg: AYBFou3NDfAcfU7SLzhXwCsLBNy/7nXUDIB5ZCQxaH4CHA60J9hSe2qTRt2XPH9M8aK
	CSEyPlHPnRiQzoThzQof/1vdHd22xk7n8dcXpddH0iMr3E5dcg6MJ/grObCLXNOnHqPu5vTsmqm
	bEZtuzVJuGa+os5fcvhbPoGGZwiT0LMj8IFT35j3yRqponNxt2MLq1LmsslcGl0UHYZzcBpUCNf
	LWKY0UjLlrRt6e3BoEFvoNUIiErUy2itzEYZF+LFFPpKK1LeK3GYTtaK3ubagSif30FS4Oea0NU
	2vDuz/ZsItvqX3oS531L1sdtfVq8nwSVDYZ2xh10WBgTUrXftSL/p+h2HHl65daiC00fFfxxE4i
	jbUgIDXxiNRxt3CNqSb+rZQqLWu2xPc/q3GYT38RMopXZc/VuxXRDdgQcvSkwnXVEfaa/TCqv5T
	EjGU/OIW28IvHMVNqdBoetZ2qYfBg1P0asSAq2GVCquC/re503l3ds
X-Received: by 2002:a05:6a00:bd8a:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-85ed444a110mr3184790b3a.19.1788314235666;
        Tue, 01 Sep 2026 18:57:15 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc07157e0sm549385b3a.43.2026.09.01.18.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:57:15 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>
Cc: horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com,
	colin.winegarden@broadcom.com,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	Sashiko <sashiko-bot+sashiko@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net v5 2/6] bnxt_en: Don't free the live ring's TPA state on queue restart failure
Date: Tue,  1 Sep 2026 18:56:45 -0700
Message-ID: <20260902015652.2421609-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902015652.2421609-1-joe@dama.to>
References: <20260902015652.2421609-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bnxt_queue_mem_alloc() shallow copies the live RX ring into the clone:

  memcpy(clone, rxr, sizeof(*rxr));

the code currently clears pointers that the clone owns (such as
rx_agg_bmap), but rx_tpa and rx_tpa_idx_map are left pointing at memory
of the live ring that was cloned.

If an allocation failure happens later and the err_free_tpa_info label
is taken, the live ring's memory can be freed while still in use.

Fix this by initializing the clone's pointers to NULL to prevent live
ring state from being freed inadvertently.

Fixes: bd649c5cc958 ("bnxt_en: handle tpa_info in queue API implementation")
Reported-by: Sashiko <sashiko-bot+sashiko@kernel.org>
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 0e5c2a48f313..f44a23c8a590 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -16333,6 +16333,8 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	clone->need_head_pool = false;
 	clone->rx_page_size = qcfg->rx_page_size;
 	clone->rx_agg_bmap = NULL;
+	clone->rx_tpa = NULL;
+	clone->rx_tpa_idx_map = NULL;
 
 	rc = bnxt_alloc_rx_page_pool(bp, clone, rxr->page_pool->p.nid);
 	if (rc)
-- 
2.53.0-Meta

