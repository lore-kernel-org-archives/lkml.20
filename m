Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084DF4519AB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798913; cv=none; b=aIdhW1xZ6ggmdPRa1PZfRht9BvXZeDMlK/Qh1o4UlL6wsmbgPUuK9v61N7VYZT7xO0PusBgDv4nz7MlS7WbtMG7FhN8Kih2p/AP/xeEvLoa7aPel95i1ZHj9Z/rn8Xc3pT2CVeFIL1DtYjkpSxNxHxiSvKSNeynQfc9SHiuzPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798913; c=relaxed/simple;
	bh=Amk8uD3HNfuuztl7q0RyRF92LjutyVBvE3JyMlDZ8Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH0xCtv7fid+wAL51qKP2ZkatNjSqiVauiYzXZbbdzZDjZXUDTksdXE7rSb3mD/DbdwOTkfxOWzm5N1xBRZKyXCzPosn3bJoHoDJZDyu/d/2uW3e/h4qEZjTPAUI4SWHuq7zjpsV1/c7mojtqueMJf3XDaHts35+nUrAMf98M3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kg5QErhB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kg5QErhB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c411d6615so1086284f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791798908; x=1792403708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVFVSCKYu4LMX2OyBp2Sx2+yDSioFsB6HDpmMFcR8pE=;
        b=Kg5QErhBsDRv7M7FGg+n0K+CPIswYEEbpLKbRmc9qYGEWeRI0zW8BiLTYyNN4iqwY/
         Ci0+rkdqARj6dgW7W7bHyd6yDK64GRosR8U9GCOkqwPQQIOWgzxwr6wC/tc7h3kFv/Zt
         757kWpgj3ZMEva2cnZCDDGGjrHpOmSATwRhREarnFmpcoGztgHY3+dKY8c83DE20fdA0
         y++Fc5UXIV5lPy86N4S86+693h0tT+Zgr/z7LLU1A3QbKQJwrxQotdEJWutItPfiVfpJ
         qUwMYM9KTcqoloIDSTaikoMUOXxqWxZsVvrPIpQnTt5NTJSAaYt2oTeFlIJQA1EV/NXi
         3uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798908; x=1792403708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFVSCKYu4LMX2OyBp2Sx2+yDSioFsB6HDpmMFcR8pE=;
        b=SzhhE2JDSK3U2UGv5OeztWD86LI0fSSETXx0If1293S79TdxQvllIs2hGxU0WaOP5r
         UMtgIVY70c0QyH1xhVg4TRVQbooNjc0GHmjFMdv/xJnGzPiX9YEQ1SxMYUExct40XMzU
         VP7gJd/NoNNfzA453q259aPFZEb4S6QF99KXvcutUwBJ6p6k0jgIJU1ZxtcwCis0ADUy
         2tjjTUguvWi8SzvKp3m4rJccGsW16D+h/FJ1Y2zVGSlqxIp3ws24zgYK20LQM8SVX/sI
         qifoCjmC27Vb5K3vmKZP0GlAzYC9gXG7urBi7mweY0FStQRlJeCo1Hkof78zVO63bEyJ
         kIqw==
X-Gm-Message-State: AFq9FYIEBkAI6Bl5tsg1p7Cue+AqPZ8zjA6u4RTndgHmyTrSzT4EnICD
	hbsXQ6QYkEm4iLez4sFFIIXalAyilpd6WR3VPoDAQJSjooEhRqCTrgWAFiD0+iXj428+XPU+2Fh
	cvoi8dw8=
X-Gm-Gg: AYBFou1iciYoX2mL1NaVg7Hu66btIqnRNtPUo25oyU/YA8E4nXZ6/lbsIyhd5cpkqMY
	71eww1wk2XR7mfOvF/sBS/4FEJBCuiXUqn311W+nr+OV+SCXu65F3HKr+YlCiX+eP4vNkSX8CJ1
	++t1B6tQZ+WDt3G6nx8wW8wZ2WmBbRXb+K98TGDpHrQGFzBvnrdhtWIZgLLtma6dMYbboRbV19p
	55ssfFjriqzwUZSU/+M6lrSKYR5IM1/3DIEMbSdUiTV5YWYvywdifrUYMzVjWhBkRIi0ZfxWxR2
	5fPvZP20TMU421x9Iv4025FplnRTx6YQlIFEdj48jxTnOvDYlNGz9KReTrOUigIVhZaSO2HdAWo
	j2EFj2qUUY6xlmR30sMzTT80APF+JLsvMjWiVtoxBDYnBtZtctoCuvQ+hb8NwA0Me1u0FTtVr5h
	+0YELgmN4QDazy1F8ZAIpmJoD5z9a+5KiCxKu18qxeDcHpx+DZVuNfGQ9D1V7pwiRPvqo56y+QQ
	aF6s7qR1KoIdQMf4QNBBA==
X-Received: by 2002:a05:6000:2505:b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-48dbacf6fc4mr14133924f8f.46.1791798907696;
        Mon, 12 Oct 2026 02:55:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18539103f8f.26.2026.10.12.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:06 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/6] net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
Date: Mon, 12 Oct 2026 11:54:41 +0200
Message-ID: <20261012095452.135828-3-marco.crivellari@suse.com>
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
2.55.0

