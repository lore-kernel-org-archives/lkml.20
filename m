Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B318D3E49D6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798921; cv=none; b=K27xO4qQVkIfd9KaTEUK2WANti9onrHu3DsvmNMfd8IPOHut/UEfVE6ImXnjSZ2LobZFx/oLEt8h2phtxVvif7JG0M66Jqh0n5cHmrkykTfht2regGRHWoFsxSSzCUZtPYNoSzyOAd+0HSpY7khpUSBf+Grb0CqIOTG505gm6hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798921; c=relaxed/simple;
	bh=sLZ8j+4e09ehCDAv46JbKrWsd4lbBbirQ0NIo/TsacA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAydylOVfKMYcYZwB3dy25X9M2ffrpUGjXc3paUpZTVB7Ce1AtbG83trz54CWjIJHh+x7kM0PVpbnipfLsUVizD2S06ee8etNhLW43RIURYyuqgmmP40dVqa3Ea42HnZAo3THuZ92GBwaRla8VRItrciPToJ0n6J7UYZLp5b7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LnhHlmkW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LnhHlmkW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48870973bddso995377f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791798915; x=1792403715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QX8lSFW7S3WysnbG31BxJSIjyuhVgxUvAyesKtj3CLs=;
        b=LnhHlmkW+o0fkb9PwZonZuPyO2hQNLnTXP+JFZPMme2tecwBmwdbUsq1eSifJPIjbG
         wxtpjMZP02izprMuo6f24uM2viR1udoJ+Tos1NS7uqQsnd62D+OawFg2jBLRPn37BROe
         +1vm3BzOp9N8Ksx11So/b3xX6wFkKL3He6RV8lmZPP5q8d5O7JkSPPG+QCSyniL9HhvM
         s0r8JAHWyXdUG7rd+/B9B6791pf+6uWROtO6d5Rte4AW+iY4AXGnxTbNDzc2HSMFa1Dy
         YzMi5MpY2figisnWA5CDACsAzYSvvb5N+TaRSKcVUilsjg8LEnhLgoFlGlHiufBg6Etx
         plkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798915; x=1792403715;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX8lSFW7S3WysnbG31BxJSIjyuhVgxUvAyesKtj3CLs=;
        b=EURBA5B0tI+X3eoUhIfyQwmoWZ61Ou60+NH82Kv0h/uotpNvx0TIIJPvYnDUI4pbe/
         CY6Wx5mOiSjm/MJMAa7I+xbm2kORk2Ib6BmyC9piRpLttJg38ONV+tuPBvtQuKKaW1Pf
         Ozz4MfbPBTLijX4Ey3z+muvV4srERGIxARAwv+7kF0fta5ZfaxRR3qoPtsnKqA7DaAoR
         sp0n/uRKD2g+eWeLsYT6KQNeRH6Wt/iJI7Hy6k5SxPQvZCqg1+TAbZJ2m0HbQK0F/YGS
         F6AXJyrz4e7zP77LoYWjAsAHHHKes3qEa7iQfEQjRjGsZDb1tXd28GR5t2S+Y64krxh7
         2d2g==
X-Gm-Message-State: AFq9FYK6eME2HP0R9TjxmrWpZ1fh9nFy+DJ1n+UuN/TYAjeb3LGpVuGb
	Trmtz4KH3CsxAk4kHnYbeE/6kTYUGX9hkyQJ57k1qKJkGNd1j5BQKXSxRhsdowOCCINcmcA/02E
	ciuLc2sk=
X-Gm-Gg: AYBFou0rA+jfZMNojUkzjJnkwqINuXvgXsP2qnDKMyMIHHIiGmhWMqVVEgRlj5cAI9x
	wtw2XABv7UFNrFC6AAO3cLD7Y2QsbppjlKlOUS56HfK/KBhczSvIJv+TG8XSCLsKhW2Gb482JAT
	dDJ1GOvXxGKc/fkB5h9HAtu8elKDzIfGWX0hZtDfHjQqF/y7fu45WzZ5pHP8dV1hzGoaQeqhtlt
	QYcxELg1cNvxwoflpKZq+HYf4Ma2wz5VjBS6VhcWl8gLC6cBeNWzFzDS/99zXmLdeZVbvWxXSbI
	UUrldykVlcUFelicZUa0kL0W75Q5e3ChwR+INzU05Nu2s4QtY+xk/Th7W0DdfWo5AX1BghQ2okm
	no/fLJCm7Cqk2Bo/CrhAPnsEZJu6tkrOq1XdSuvzsvncZUKbErtq3n+XWuGNkrLI3rwQlijFKm8
	L7BUVoJ/K9ChrxW1twe0vOMW+17bZ1zz54JbH45ySvuFJWQYHCdEMZpiI2U4evyIpE1yynuLKpj
	foDzTza+ZYoc8ljydmS0Q==
X-Received: by 2002:a5d:588b:0:b0:48d:deb0:f1a7 with SMTP id ffacd0b85a97d-48ddeb0f1c5mr222734f8f.10.1791798914652;
        Mon, 12 Oct 2026 02:55:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18539103f8f.26.2026.10.12.02.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:12 -0700 (PDT)
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
	Petko Manolov <petkan@nucleusys.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next v4 5/6] net: usb: pegasus: Move long delayed work on system_dfl_long_wq
Date: Mon, 12 Oct 2026 11:54:44 +0200
Message-ID: <20261012095452.135828-6-marco.crivellari@suse.com>
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

Cc: Petko Manolov <petkan@nucleusys.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/net/usb/pegasus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index aba1a640fc26..ed3f8d555c2a 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -1118,8 +1118,9 @@ static void check_carrier(struct work_struct *work)
 	pegasus_t *pegasus = container_of(work, pegasus_t, carrier_check.work);
 	set_carrier(pegasus->net);
 	if (!(pegasus->flags & PEGASUS_UNPLUG)) {
-		queue_delayed_work(system_long_wq, &pegasus->carrier_check,
-			CARRIER_CHECK_DELAY);
+		queue_delayed_work(system_dfl_long_wq,
+				   &pegasus->carrier_check,
+				   CARRIER_CHECK_DELAY);
 	}
 }
 
@@ -1223,7 +1224,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	res = register_netdev(net);
 	if (res)
 		goto out3;
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 			   CARRIER_CHECK_DELAY);
 	dev_info(&intf->dev, "%s, %s, %pM\n", net->name,
 		 info ? info->name : "(unknown)", net->dev_addr);
@@ -1288,7 +1289,7 @@ static int pegasus_resume(struct usb_interface *intf)
 		pegasus->intr_urb->actual_length = 0;
 		intr_callback(pegasus->intr_urb);
 	}
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 				CARRIER_CHECK_DELAY);
 	return 0;
 }
-- 
2.55.0

