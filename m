Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F75448B5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182497; cv=none; b=EpHwLII+IZccMT2nlY/YnULbIMSZYDrDnxP/+q4MP2fuiwHQpYNowNgM3RHp0o4qwRkGOjDflZShwAKIE3C/MK1mz6wEPVStqtrYtlfBCsFGl3l0l9UuBgLPI0A7nRw8bNYMltnOGP2p2J/WI0ry6bbx0PWPxjMlRIFLDP/k4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182497; c=relaxed/simple;
	bh=MY6Hm4+lmXtD8gpPA0TPD5UjA14uW8GK2wk6tiuPOP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ju6uZx48ii/ndNhfnQKrrC8Y5i58KAqeH0Ay49/kKYjqXs7owwUXKMR0X6wnhqn7zX/R2qBawiWPXhPMZs8+dRdFyge3r+fsgK5Q4t0Gw3GwkaGf/kttAiweCYO9Igl6YFb6kTT9HRBa8ocGMAZbtJ6Orcgsj0rVLdWosROn9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLiZXsS4; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLiZXsS4"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadea0so72720585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790182495; x=1790787295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoMn1hm3woLIoz+/tRipkpbGXRndkvfVU8WHGny3VZ4=;
        b=aLiZXsS4D8Sb+ERFU7RwVTTRoieuFd8qEruOetP3eJ4jj9Rl5XzSPW8/MWi3s7WTt8
         nBpzsAUdFKndXzmYoVRT+YvQwu74lTkISAjoe1EdTIfWoSQ56EOCDMfYr4omqQET8cYC
         tNT7S5ORWfG1DBJBrj6/JFLEnSoBF/HRQzIbnr0Dj3aqcDbuBDuMpfftsEn3e5vWoNec
         G9tqT2alqOd9Igmy6NrcZXvUqcxM0hySJQPj492DKcX3Nz893t0hR6g9kckVPuTN5g7U
         rbNwFVBhU5CBm7TraJiq/7EvwtZPsWLYY6LGfKR8Ir/21FYncDdlkKcoAufXhdOGHXs2
         hFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182495; x=1790787295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoMn1hm3woLIoz+/tRipkpbGXRndkvfVU8WHGny3VZ4=;
        b=COtQSOZelPrNPBYRo6D6kye1FpMAAvi3wC0KK1ngN+pK2BJWwj5LawCgid9a68wcjH
         /ymimqzsYrEP80bPndmRkVow9ZPUsRHHJQKkXUs1LW3ImWmthiqlkaq6yBnbmhPnUjgM
         CkSpAZU8UXuOTUXZ5tkXGAye1KlstdDEmXXK6vdp1YWCAi+/TaT/XL/nrdRSauqQy55q
         V3gbqP3jI2sYzs8KGUKsslCCh7gADcar0RzdtgkuqlIXj10npezN3tpEP3cyG9t+Hvz2
         ZGsKRcWAsprhKAhJFMv5NzoQve+qA7oVjN8dfRKXJS+cy3HHIBmf+45qFB5WOXv6fV3D
         /sZw==
X-Forwarded-Encrypted: i=1; AKwUvBwH7+KcPft7etMEP4XeN7jiwhTiBTeKeF/PcnmG2zDKKMMRaCTsx4979wIeCqPFvKCMhqVR4UcrT1cvHgs=@vger.kernel.org
X-Gm-Message-State: AFuF++k3HlZj1nFZ5bponk+RGeyIzVLIVLWueq9YDsEwAwv0VAjS9++5
	q9SPmcfYkGb7pQwRNqevJfdptE2OT+XxbwJrxnu7tbWgdeRyAXiWFtAq
X-Gm-Gg: AYBFou2dDurfSrLGXB8eBLnUrVrIJDiiFIf0S7IynXVm4gHt3oLRJpH+70mctIbFLBr
	kB21LBjnkMRsL/LOxv3EUujlbrbk+q//EI/BYUEOLLYV/pD9gc+MnlfrX60fUJgwpAgwBuaJ58E
	MwyVOzuPNlyEsP8y80wFdVSgHLJvrCxiZTF59+3SOhagvnRxiz0/HLsM0dGtbkN/w5kVtJW2q6Q
	b4wTq2nNLGPsHIQyBvQ9RkFdAYXrzao1npomJvoAglFD3Kd7Y9gEPelDx8G7woushkAK7sUgpSi
	3Ud+8mlXMigITbXLk/H4WAVJcO5ZNR+2Fewfqh0ELepdhPkPCZk9hLw2SRqzHztiO+ZjSRj9Zsp
	NnikJjDCw9F4mO8gv3SFVt9Bc/PKatTl7TB9/QJrsgwsoowS3sEd52pgRvvBRQl+bv+XmKmhjtn
	xd0bzVfm9KRNwzoZlGOZnL08LuZQ2jkDzaS5bK9e3QyE7+ucWUEH6n/cLfOpYXB+YHquyT4oP5A
	GNaV5eGMkTKZNCpgcPmIHNfNhIDTmQj
X-Received: by 2002:a05:620a:3710:b0:93a:855b:b95 with SMTP id af79cd13be357-93c251e370dmr503428885a.52.1790182495034;
        Wed, 23 Sep 2026 09:54:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2c22f729sm137899485a.13.2026.09.23.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:54:54 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors
Date: Wed, 23 Sep 2026 12:54:40 -0400
Message-ID: <20260923165447.619477-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

its_of_probe() walks the ITS nodes with of_find_matching_node(), which
drops the reference on the previous node and returns the next one with
its reference count raised.  The loops are balanced when they run to the
end, but the three error returns (a failed its_reset_one(), a failed
its_node_init() and a failed its_probe_one()) leave with the current
node still referenced.

Drop it before returning.

Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (arm64 defconfig, W=1).

 drivers/irqchip/irq-gic-v3-its.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..6361d20bd920 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5579,8 +5579,10 @@ static int __init its_of_probe(struct device_node *node)
 			continue;
 
 		err = its_reset_one(&res);
-		if (err)
+		if (err) {
+			of_node_put(np);
 			return err;
+		}
 	}
 
 	for (np = of_find_matching_node(node, its_device_id); np;
@@ -5602,12 +5604,15 @@ static int __init its_of_probe(struct device_node *node)
 
 
 		its = its_node_init(&res, &np->fwnode, of_node_to_nid(np));
-		if (!its)
+		if (!its) {
+			of_node_put(np);
 			return -ENOMEM;
+		}
 
 		err = its_probe_one(its);
 		if (err)  {
 			its_node_destroy(its);
+			of_node_put(np);
 			return err;
 		}
 	}

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

