Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA93EB0E7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798917; cv=none; b=nCOWeCT93TK4Bh1f20lVdXtNtt2VOZQZgGjB5GaTIoloYiOOknlAtH7d82MyzgwX88rcr+mV0DsjuzQnsAgwp7VFhgKqmSdqu1yyqMzKZ7g/DyTs+Ol+SdDxQ4Qj1NKCdSopkyqNOCPQekKP+ivzKMHOy98/75ciD8lHQKTO0Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798917; c=relaxed/simple;
	bh=4YHiet3WJomPE2v26NzpBGjI/jedOlYKrNCQC8kfQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugg1lUMtdL5CK5G7fo8RFCpfyWgVMD37UxLEF4UujZ4mwmwaWw+RHaSmRkw/2xCpN+w+hG/KdbK/26+QJaozhILWtFg7GV8GbFOxjUNE0qZGh31wv2LBBhFY8WMKI4yRCPIghVFVGC+JB7u2oPYMz9aw9ckwk8a3b0MZ9GzVX2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U3jg9ID8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U3jg9ID8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1617048f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791798910; x=1792403710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wvY8pxckv87pPYHiPwsm0hl8WKWmZCkoV9NdQknppn8=;
        b=U3jg9ID8yPFqEhcnXfUQpOfjfKF+QPO3ce35bQgRWDMJsAqB4Tj04Jni+s7rzj1IZe
         jcweuNi5QL0CB99c1+pBSa9Th/JUl3+Ti89eskfS/HbFVVS98RhKTS4c6vTEjc73fHa5
         xO6ctjgqGb7Sw/ls0NNR91p5HI9QML8nGIJr/x4BpGZWf9QvTLPbVMXHorNep1MyMQRh
         54HMJ7YJBgHr6bY3WDKUyYJBdDkXCpbxgEIigaXxbvqITTDqoCI08mKnI6RS0xjmgM+r
         uStEafhl44ZF8OY1GW1maLIdtGyWnWQKZ8yMev5Kt1gt3pU70xoxWciwBOFJt0tabNZS
         lpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798910; x=1792403710;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvY8pxckv87pPYHiPwsm0hl8WKWmZCkoV9NdQknppn8=;
        b=0sKhLEe4O576D8680Z01kDjb9VeM3MinRAPjGg01REq8ZCwjZTFAc+djBaPCHwxcJ/
         eDiIG3ggKrd4XMQaXK2K+dn/pBFaFvBRLwOH8CtrUkGA2q58c4JR9AfpVVHg21fN8544
         ldERj5eJfeHK+G/kYD14WSsNCZvhHyYm2tJcSA5yB8bp4sePWeDi3jnOgNjLTcP875bY
         eYNEqDi08WoWa05Wqku6lZNmkmxuSHrP5tNqVPwxBeBeFN2+x3W5He5txBnGCpXTwhfg
         3zqSDJOcr03q5m88PftngOMuxHudtKV+snj37ES4fYxEsFq3eynsIp8H8M3Vtbtv+KIM
         F5xQ==
X-Gm-Message-State: AFq9FYKKVYfjJub1OTvPVt6bCFEruzHoV12V1vlvNdIM4IORrvREK61c
	r9jEb6O+465G1K+FyjBX3/FMqaFhy/RV3MKUSNuBwaPCoshQ2TonD8BT9z9d0BnpZMcitP+qvV6
	1xTUmtTU=
X-Gm-Gg: AYBFou0O/i/SPyg7tuEM3qEVlEOuXf4H8nDuZE3G0zcGc0zwKoyQgmC6JEUX1Hs9quK
	xFpNoqYWXvLVCFBRAyQ4ld46KoXNEmZtJJVdpU9DIDF6dKTBNbYc1tQ0X2DrqB3YvnN1j82bhjj
	ARc830i+RlMQxPQnNvaEoofJ9RNHkQisgmJJocPV3nOBx45Ng7tHJKkrBtLYk3Auprb0HpsSWFo
	L/JrOZYkQDH4Zut6L0L8L2sFNt2Hhh2V2aDtKvOkPPEgPBHQRHy+OsxC/c0OI4KDN5D7U/3+sF0
	9o/CsSdIqL9R2xNHzBh+q8MgFQ8sjvAuhpv/OM7tr1cqt4H7J+QGRGoTT5Vphu6zk8bpcXa9hq0
	Osh0m4byLb94v6FnM364vc4J81WT0YSteL+XVrIDM5KGiukIhl5yL1JT59BI9gxwqufop9/bx7i
	S/69pgyoPJKPYl+Rb3Ymb2YJEABHfpatd1ghpkAVrYL8IRqcVQ24AOg4dqQspWnc8upgie/FU3b
	ta+TEIoCdjsnhBzXsQPsw==
X-Received: by 2002:a05:6000:4550:b0:48c:4d74:d7d2 with SMTP id ffacd0b85a97d-48dba9db092mr10670448f8f.12.1791798909689;
        Mon, 12 Oct 2026 02:55:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18539103f8f.26.2026.10.12.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:08 -0700 (PDT)
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
	Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v4 3/6] net: ti: icssg-prueth: Move long delayed work on system_dfl_long_wq
Date: Mon, 12 Oct 2026 11:54:42 +0200
Message-ID: <20261012095452.135828-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012095452.135828-1-marco.crivellari@suse.com>
References: <20261012095452.135828-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 591be5c8056b..0fba22c1046e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1100,7 +1100,7 @@ static int emac_ndo_open(struct net_device *ndev)
 
 	prueth->emacs_initialized++;
 
-	queue_work(system_long_wq, &emac->stats_work.work);
+	queue_work(system_dfl_long_wq, &emac->stats_work.work);
 
 	return 0;
 
-- 
2.55.0

