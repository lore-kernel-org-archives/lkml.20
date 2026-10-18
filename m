Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721573A963A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292742; cv=none; b=qzkknWnk9h+HU84BJvPd569+EqsLwt8qxiRC8OYonXnEvI8AdYWea6xBjG6bn0o8tqoK16w8TLJAsH9R3f0nQ52+r/c392/zCJoL0CrdTA9v2E29JD6QmIInSN+a3GdyfxBpkDH+rnNXYX8kgScv1SIpjblc8BbNKXPFTkwHun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292742; c=relaxed/simple;
	bh=gQi+xtninHZxQY9xWgWcLhp4vrLzNeVDk2wCXuI3u+U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZU+MKyxC21EbxTrJmwLtSV+yoMfdVubvaGBD0sEWuTmznNB2vAa33d9hBXqXbEHFcgkLvOzjNoTT01SpaeRYZZnNEt6nY8U6nZ2HcgelM0uK8Tw+O/z3JD4UwoJuAeHvsx4mhCcIMMQpSGkAagJM6sCNc1hT1mEcIK73Ca577Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pc+p62xJ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pc+p62xJ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b83459526so14404126d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792292739; x=1792897539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgxKa05dacoY91n9KJ8d6YZbYjBrULhK9rEgGNWUKfo=;
        b=Pc+p62xJkSlV+kuOXuvnhqO8Na2Y4v/yEoqEYibEH5Bf2TctM7qdq12tsM9sMiWfAN
         RAmDAKieVcziZQQONuC5pcAIzhjKLuN31EVG4RTCHboLbwFJES0vVcOohtu8Pmx5xfdA
         MZawmFYhzDPh29jyWaqiJVm8n/IVveYFnvYWj7508ttTXztomjCBm1epC8NqxRx8IBLW
         +zs0ks8ubtcQjYQpdVUL2wx1jdmMqvTTg7yedCp9Opo1ni5qfjWaTweBXhLWLciXWqUI
         Pz4dv4lQuTagmnscW8yfqg9v8441y0iqzO8ROZYRT5jfCe3PUy4+Q4CW3ozT0CBuAcTB
         JlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292739; x=1792897539;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dgxKa05dacoY91n9KJ8d6YZbYjBrULhK9rEgGNWUKfo=;
        b=bePlE0DNY+xaXQlzxHnvks/XLMC003xAtRNm7l+gxG/E4F4Y2b0I/u7gkPJWKmT7l2
         fbZFFoONhEEXsqRwjOQzgvxVk5lBkSyZdfegNGSIhWvpuxA4cccNgkUZ9JE+zp6J/xG/
         0qXs/6mbe/6P68ZifoUHE81i5dx2bfTupov1kgEIaK+RFsyFPrIekCn6tbU1d8daokT9
         rVapASIUogPL5wF5cP4y3QcHVkEYnvtwNRjNGG0WhB8WZIDy2CFIorOy6a76UEm9Juws
         TM/g97TdigIiXcn8bAe9yFeF8YL6FtzGgPB/r/uOS1vc9g396WpHwa9JQpx4tHe49N66
         mOzA==
X-Forwarded-Encrypted: i=1; AKwUvBwW69peqbdqxqAHN0PN+XTWFn055TntnVmX1Z+t2PxDFPv9lRopJYsWDsExEglZ6zkVVv+Dxb6YaKR9GEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoXrN4h31mq8ElDTSPjBdStsp9JQY1Nqdl/En0Frupb+aOHAJ4
	HhJJkKil+Dlvvt/fZMkrQd3WpJeCJssg/sz+AWi4IyRvEiipPFzUHMk/Y/fJDLs=
X-Gm-Gg: AYBFou0FjVKKEbnIJ+JBHoSyM7elDwo7lT+roySt+rf8ewwm5hgsUjy5kmU+tP2I5Nf
	xr+WNYdiMBAtIK5250hG+xWi9+rtB38l8/+4rgbtRh2hzSkIVaOiREEUVVF7miz0xqGDmPSci2e
	rSbCGjntgmcz/mlsjiZuC4f7Z/eo3WsR9uwG7q9DDI1zJfIZc3jNE7OvfgSpPPz8I3eI4NFWJqc
	IVyfx5j94Dp7ey8rK7+CyiGZfgbAaT4rOOayPlFMWC7G0UlAW4rym2Tm6WWuuuvG8235EMbUlbQ
	vN8PxFcnwJ1lu3OssVQOoU8Ftlm3VHbBpRgZwtsB8LOR1NZcU9O5QTyod992cRqA/lUhojlz+6F
	9t30MquUVX1xguYs6noZfyegfS8E30urRR5Xg6zI0KPzamRO3hg7Cm2jiWjLHUGYYesrlKbNP8m
	ksJJIDkEveqKyXX0JbRbnwAZ04y2sGqe6TFGxPDaBmgpEdEC47rYxeAHpVZAslUNlXmdDz9TYUs
	ovqQOgImkXH70qXYEDVflk8Dlcj3b1pPSl/KG3CsDoqAdBBDtV8sh+s18yjOjpG1GXJCO6zbyN2
	XGrUggIBNakUA6qz/4dBm6aIsGE6
X-Received: by 2002:a05:6214:33c3:b0:91b:8296:3b87 with SMTP id 6a1803df08f44-91bdefbc8bfmr73201836d6.18.1792292739234;
        Sat, 17 Oct 2026 20:05:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbacfcc6sm61166556d6.23.2026.10.17.20.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:05:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: sungem: shut down the link timer before freeing device state
Date: Sat, 17 Oct 2026 23:05:36 -0400
Message-ID: <179229264512.3933686.6151403340581004321.sungem@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ethtool link-settings and nway-reset callbacks can restart
link_timer when the interface is administratively down. They test device
presence, but not whether the interface is running.
gem_begin_auto_negotiation() then arms the timer.

When such a device is removed, unregister_netdev() skips ndo_stop() for
the already-down interface. The timer is consequently still pending when
gem_remove_one() cancels reset_task and frees the device state. Its
callback can then access the freed private data and MMIO mapping. It is
also a producer of reset_task.

Shut down the link timer after unregister_netdev() and before cancelling
reset_task. This waits for a running timer callback and prevents it from
rearming, so the final work cancellation follows the last timer
producer. Keep ordinary close and suspend timer cancellation
restartable.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: fe09bb619096 ("sungem: Spring cleaning and GRO support")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index dc5638d..e8d3ac7 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -2797,6 +2797,9 @@ static void gem_remove_one(struct pci_dev *pdev)
 
 		unregister_netdev(dev);
 
+		/* Link settings can restart the timer while the interface is down. */
+		timer_shutdown_sync(&gp->link_timer);
+
 		/* Ensure reset task is truly gone */
 		cancel_work_sync(&gp->reset_task);
 
