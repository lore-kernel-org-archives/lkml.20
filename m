Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617044;
	b=cgJmZOVf6Umz9BT3s2oIf5g+nsCRFYCNAIusNFdyqkMGUUeeJBIg7d+Qo4XddVC4ZuXA
	 K/DA7OuEka24mWv/e1t4Ws5PL3qs8ra8YwTnEf8/lzYGepGX+/iGYVX0GVoSFfFQiDon+
	 hyHTbZMWGqM4Nc4ES/rcm6izV/QvpoTRfGgnGlfcmeXp+3PK3NmlOZDktMnKzrcSzfooB
	 cvpPUi2myzEYM7czEijQunYHiOiG2c7yW2TJpXSFHhaPLM53K02/b7QfeVCELqjkQ1zR7
	 anPoR2FCmFS4QMGV+kNdiyfsoWKB4f3BXysNcF2hYS429o6DF8pwqSnxc8gHAt5i5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9/IoYRffQKx8mihWgrVfNglvfRURCF4HcTZULBh6CJs=;
	b=hao7SabuJuUmcmuTBQM3RyxgnSvtxqWLh8srEwUFmp1zYY5/zUivLzR2ruexUf1QKYJC
	 +/fir6qZt7wfXPk/kWLnujQZsUuIPqK2w3WDzDuWkmjng3qd2PigMZq232a01z+J6x7l8
	 XoFFeH8s7RLVZ2Zom8xQIc7mTulE4xo4xwg/oPx2/iy+lotpqIySqcwUZLxr29Cq19dLY
	 dxqCoxsAWzMntwGvzoZdoKoPNaNQzsRkY6JDix66SzRWu8j23YF+UirzhFau65aqtfwNG
	 pYRogQIJ2zHQefpc/diISn90SmZ/98ISpRPM6uSguSq3UzcHy3XVuyRki8dmMKWt+Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="NW3/hBGj";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44560A2606
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C44560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NW3/hBGj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so29925845e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617042; x=1794221842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9/IoYRffQKx8mihWgrVfNglvfRURCF4HcTZULBh6CJs=;
        b=NW3/hBGjOpRBH6UfHwHADBftPUgfB3hJ8qMaAYnqijpJ+1pa76xXbgxulhvilXi6te
         5e63AhC5ErOdJX6WJiaopy8k3wbrYvDEhdcyBy46fK249BHVWSISMu4uLdVMSJ5qdycE
         U2WWGhLUZG0vhKW/kFH0jqCh2+b63K4kmrbnshxqTTIpwdCqDyUS4879K+u+UxUU2AwC
         iBm/ad/KR23foFCNChVf+69qZNo3z13AsLTsftiT2BmSydNRYKN+AJu4AsXKupsndqK7
         z2M3TDLPIu5DrfGFRpUbNU5gv1Znx4bU2yJN24QeN2Ot+CkCRevfvWq9nje2HQXwToW4
         8aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617042; x=1794221842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/IoYRffQKx8mihWgrVfNglvfRURCF4HcTZULBh6CJs=;
        b=hX6cHpnVeC17GlAQ8i52O87IMchVlwM746fw2qcOOObT38PyB29bgE7sQlNehhK5UE
         Tzhxv4/DeDUmSrzQFoSyQL9T4aIai+Cz0/CyNUQjQMq+JClazKWfFkrB8GcO9XY4HqFo
         Utdv5OLXHKtDn2CgWoELGO7mLQ47P4pDFfZ6CZf6O1+MbOTi60kKlQtxjBS5o/Phoumg
         Wqa6fFIYWFiYyBS0wibE6gG4cGOP0GtOiGmGJWo97gl6zoQ7dwoHoGlTuK/yKY2N7QxO
         zIyg4kUt3TMHRFgrx/bH6wbXoLNUig5ZvkKqWtdmOAkt8U9YnFYMqpMcH3c57tXGtfDF
         Mihg==
X-Gm-Message-State: AFq9FYLVUvpeQZIXq59saxBk7e3/aek16yS4sQt7QTEEwHIkSSe7QNRq
	qK2ZVI4hQJdFb2EFfMfEBjcaCVen9OVVYtZ8YW85uFVe+sNOvSfMQ77xyXdLwewNtGUTGGZaHhs
	H0Xs/ooE=
X-Gm-Gg: AYBFou3syyXJfnyjBoEk0z9ExfmSGP+S1yOHm7Ik7bKiYrcJ7UL3M+PSHc1V7UEJoJ8
	Pspqp7LjdiLolXLUYbYawmf5V1Jbyf7230MIMqWUIkvzjtH190UUUYS9m845ljmscGVarjFEAeN
	rPCIUfTX6F5VwK9Ytt2peUf2hmDopmyuT2wbxq5tAtqIUVAHmF8S9dYG6I+mRZShAg9s54Na545
	lEzNhUz5mo9QXiBGdig1lVdcoLycD4HaabSBozAamubwTG4Ucwv8aMQQQgA8M7nvlnq2UOIyQjx
	ilCEknCLgI7BHJffUwKu7XB+y01n3IH2/sEf85DA2uygRrkhwXO3kCA/UeXzGQu24rmwMLcTdY1
	CiNYK2wUgI2ka15k0MMdOjgGfilKwIDx5eLE/KpWJqOaNeqfT3Co3m0artrRo0X9FI0QJ+iMd6L
	72aloAPFKRhCf2JA+C8Apqck7FwrubtpFFwwT0un6EkAGH0akvceNe0/FDCaZ6vz22OeyCSNvK2
	f1sU7VMq1oHRNPznB8MTRg+NPyP+0DeGdwcgoJ5ElLW6bpZOGAhnGJPY7IEHXLekvo4anpk3gp0
	K7rlXj2fqzCyhrumtP/cA3+7pMatc1Fy+Zj/Hyv19fiHciYbtbb+
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr3653145e9.23.1793617042662;
        Mon, 02 Nov 2026 02:57:22 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:22 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH net-next v5 2/6] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:52 +0100
Message-ID: <20261102105703.111844-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102105703.111844-1-marco.crivellari@suse.com>
References: <20261102105703.111844-1-marco.crivellari@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: MD Danish Anwar <danishanwar@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
---
 drivers/net/ethernet/ti/icssg/icssg_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
index 7159baa0155c..7d6d6692d819 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
@@ -69,7 +69,7 @@ void icssg_stats_work_handler(struct work_struct *work)
 						stats_work.work);
 	emac_update_hardware_stats(emac);
 
-	queue_delayed_work(system_long_wq, &emac->stats_work,
+	queue_delayed_work(system_dfl_long_wq, &emac->stats_work,
 			   msecs_to_jiffies((STATS_TIME_LIMIT_1G_MS * 1000) / emac->speed));
 }
 EXPORT_SYMBOL_GPL(icssg_stats_work_handler);
-- 
2.56.0

