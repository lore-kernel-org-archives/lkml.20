Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF837F75D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848604; cv=none; b=KNkFgRDSvWOh1f1DpPtyP1/nLcdkGQze5xxFC+H+GFmpQ2v1F2CXV8eVWhM32+5319nvmgcmcOolFbeoaqU7VFzDOxueO/x1LaTTb240uG3N3FCeTaQfJWfcokDQtTxYhDjuPdUSkleFDQ1Gq0RsVyFeICujeko+qoNbHEqROIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848604; c=relaxed/simple;
	bh=jnetyFY4MvDjWyjq73T38LnUAuNPWU70GaiNALUUzIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j56gstIwsPHB/LlIb/hmmpVs88vSQNDxXnQ2XGU0gGZulohpIZXtWA0D8uvf4pwFZODkDXiistSjXk+72tNtw8Ohkn3Tls7DHSpXEhXAe+ULEWeAHo7csMW3u0b+zwln9ajLkMVWKLr2lg0IMQ7svmC5RvkKIiP2cZ/Xw/xooAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Df+Hm9Yj; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Df+Hm9Yj"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917c04630c2so32238006d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791848602; x=1792453402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVN5OjZKu3a1LoT1KfzJzBHe3FT/eHM/KiKbMoh3YVw=;
        b=Df+Hm9YjidZRMN8juIXsu53ctL14fs3KFIBa8KfiehuiUtcQs0tSAQ1aSeQMh8XE4i
         KrPWWKHIk3WyBd61E4FRxmbgFhWLhDafcUYC99Iw573dc9id9nGVoMNNUofXsEh6t74X
         rJLJZhDdE9VlRKDHlAxrdOpgpx5XBiRKHYXUS58OA4o6OjiZj9HygiLyJ63zDa8x17z6
         sOjsjMdMs9icW90IoCgOZU76vMwvIEnQ6y0m8EAxS+orX1P+qXulMtun9o94Ft+iiIR5
         sqLtkIU04vstUxjl7kB/+F3+xXYgoIdwPzYQPkpttceSVpUZjqIqZHxTPDE8D6d7PNVG
         nlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791848602; x=1792453402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVN5OjZKu3a1LoT1KfzJzBHe3FT/eHM/KiKbMoh3YVw=;
        b=xedXQPU7mbzOAgw6SuWWz84gOZheSp94OAss9TEKm49JVwNxmWHWZf4FSUOIiGX3e1
         DGsxxipKl/Sx8/dhEdVFedY9zM6T27PO1ltn4ME5J0ovjB2SW7f66hvEK5JQMItcXwCg
         NijA7zdwWgzDncXqG/wpCKvuI5+lixyb/6aBou7bapOGpmgVCbXKiZFtY8xa/69CgehB
         kQ285XJtAumVOArIkPIiuKBJIO2oDFLaCLyF+/D+nSIRPD1t/A7dC8hwjrmue2dSVh1Z
         ZY/jjN6akl1JY5klI5hpRQ7E4GjF2suosVA/SGfwMR/3J+bCbKzy10lZklKskNrdi/jm
         gU4Q==
X-Gm-Message-State: AFq9FYJLCjLwp1gyHLSkik4dK88TgMQOfdiEyhqavQAvIpYES7fWJZKg
	bcnM+MD7+9vhULmPEz3vaLtrfMa33/zFoIpNA7y/183tD5AH7P90MF/p
X-Gm-Gg: AYBFou3TNfumT/4PA6Jl7JQVtTK9qrFXF1TNBvStWpy9CUocJFt8O+57OAGABhXoa1Q
	e/tHwnqiIGrHVwEahaWPKVj08wlMRiFxdJ4USbfnnfORIHqwdjf3vduwcIAZNKUx4JT/GKoQdNe
	ZGX2OxKKT+QZ1U/NcFjYjpcaXbLil8p45O2cgKSRhuORmGpTc/siuEcgxw0mx0rj9ZSMeD+5z6E
	atHv7Ai0MCEATzOpxZbtCD5uNgynkIu1JaSqjw98zJ2rQ22ROloBywbadmF/6j5ZPCHl4eeTheY
	9rCzGZBo8VLu94w7q7b4qyxa8Ekgc6kGHDQWeeoSE9/k+hOzHqOq+UCIqTOJmfTc/fpN1KEFGG/
	gcEQ3rtgeUKRB1lJ+BDQDqIiasdC3YKPs4i7luPZMxlIkwinEBSUpLvx7BJ7n6NxWdqwdbD213d
	lfy0kD5ZizKlK0Ckf5YLyW3HT5cEyD8UMKMCoLFCzugqPB6pOs6eXRZmcTZusg2gxchRMNe2h6k
	v22eOExOxsZvIZKyiX1DQuQvtOw/gQqvoZOeisAh/A2ITr29nYYRlxTXdQ5c6pJi+5PWdpB47DE
	d+uDeoEjM7/CC++smZwFHUWdjEaUzth9YE4iu9f6e2jvUn16QNtTeNIwy+/Q3iHCmemk8IDgYsx
	nBiyozokLPlJkhq1AzWOykzk0dI1FWH1LDEFHeeYPyEn3+2FJ
X-Received: by 2002:a05:620a:4444:b0:93a:48a:171 with SMTP id af79cd13be357-93ebd287f47mr1776631785a.51.1791848601443;
        Mon, 12 Oct 2026 16:43:21 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-161-139-200.dynamic.bellmts.net. [142.161.139.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500809asm109030085a.16.2026.10.12.16.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:43:20 -0700 (PDT)
From: Riccardo Oliva <oliva.scorza@gmail.com>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	oliva.scorza@gmail.com
Subject: [PATCH] mfd: dln2: Fix use-after-free risk in list iterator
Date: Mon, 12 Oct 2026 18:42:30 -0500
Message-ID: <20261012234230.17966-1-oliva.scorza@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dln2_unregister_event_cb(), the iterator variable 'i' is used after
the list_for_each_entry() loop terminates to free memory.

Fix this by introducing a dedicated 'target' pointer to hold the entry,
isolating the iterator to the loop scope and removing the 'found' bool.

Assisted-by: coccinelle sparse
Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
---
 drivers/mfd/dln2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 0b1e7fd7f..7cd64aad1 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -157,25 +157,24 @@ EXPORT_SYMBOL(dln2_register_event_cb);
 void dln2_unregister_event_cb(struct platform_device *pdev, u16 id)
 {
 	struct dln2_dev *dln2 = dev_get_drvdata(pdev->dev.parent);
-	struct dln2_event_cb_entry *i;
+	struct dln2_event_cb_entry *i, *target = NULL;
 	unsigned long flags;
-	bool found = false;
 
 	spin_lock_irqsave(&dln2->event_cb_lock, flags);
 
 	list_for_each_entry(i, &dln2->event_cb_list, list) {
 		if (i->id == id) {
 			list_del_rcu(&i->list);
-			found = true;
+			target = i;
 			break;
 		}
 	}
 
 	spin_unlock_irqrestore(&dln2->event_cb_lock, flags);
 
-	if (found) {
+	if (target) {
 		synchronize_rcu();
-		kfree(i);
+		kfree(target);
 	}
 }
 EXPORT_SYMBOL(dln2_unregister_event_cb);
-- 
2.43.0

