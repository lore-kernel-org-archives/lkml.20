Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE554908D4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993313; cv=none; b=VE40dTGE+XvLql8eWO2oupbjgzbOFWs88C2v3Dz6ASgnIRU7H4SbSGZqup5qzOt9jZZ5KYQPOdhO39B3VHL8cZRT1fBekIfWNpHN46VKjDW/9ZhFj5pLqasHvAyYmG2GSnh4x/KSzA2qvbu3a2RgxzAaVvYQzUiRJaF0HM6LjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993313; c=relaxed/simple;
	bh=gbasc2hDh8Eq5I9Be/BPz7ZOvPfHE8gkgMkmvhKkwME=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KtRD4OTnr1AZ++yfqZt4+8aAn5yyMw9hlLSpg0RfXjCERbUcLV/4+/QzP0RC7kPmp6+6bzUkpjONt3loF67phkdTBVZP9SUgmO1onfcX50pu5js2rfk3Kf2SYajgipNG0qkcIuUv9zRdJJxefIq2gQsZfftQSRUJx2/Q0zWMc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-81447a16061so93551a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993311; x=1790598111;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LArLA6g96djrgNV8bJlsAZJHe6OZQ9AwK1xHl3+AQng=;
        b=rdW865+76L0+WTMzo0dXqze/+l6g4FT4ZQnFvSPyMi7AcKY2fd3hExJh3laRyDvIhx
         oIxm1PkLXRLlL4tNYPFDknZBhawxF7GKegH8vjTyEVwDetbnAS5zP8aduspXTAWimFFO
         4jZYVi4fGgs+6agQO4+1CkmPXpmvzyGTPe/GxZ2JGdylcHgHVZPh1brxI/xdvivisAhf
         Z2gJoYKthWqw8Yok6mLvWO0ltCydpcD5SgB3KHTP0Mh4l0wIFER/TNhjH4jnDwAGBcw1
         d5bDmpQ2DcEYDyYwudsph7of8nzUWYDIcO0HYzSCnuAcdczllk8c1Z3TNqsGjbJhzgU+
         9Ckg==
X-Gm-Message-State: AFuF++kJreMUkrAk5iKUI1JHVaT82WpYoY+fMSjF4d9sRcA0zb0hmJs8
	ytLl9d7q/cBN3S29boPEbhmqBtr59LPVGmnyJHrfLoGwpaWt/DShrV1GBgnH43whpyKiNMNZKx1
	wR54NrGGNO5CJSfVSHI/goCkF0QNKcMcKqJk6rbTVG5gcttvePAsj6hzhqa8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f005:b0:6cd:3ffc:acfd with SMTP id
 006d021491bc7-6cd3ffcbb20mr6691476eaf.77.1789993310971; Mon, 21 Sep 2026
 05:21:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 05:21:50 -0700
In-Reply-To: <6aad94ac.87c06881.1db2b3.0023.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab1215e.3179f8cd.1e36b2.001e.GAE@google.com>
Subject: Forwarded: [PATCH] net: e1000: fix warning in iounmap on probe failure
From: syzbot <syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] net: e1000: fix warning in iounmap on probe failure
Author: nsvatoslav515@gmail.com

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 704340f1cd0d

 drivers/net/ethernet/intel/e1000/e1000_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index d7f5c6f16142..156903089fa6 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -1227,8 +1227,10 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	kfree(adapter->rx_ring);
 err_dma:
 err_sw_init:
-	iounmap(hw->ce4100_gbe_mdio_base_virt);
-	iounmap(hw->hw_addr);
+	if (hw->ce4100_gbe_mdio_base_virt)
+		iounmap(hw->ce4100_gbe_mdio_base_virt);
+	if (hw->hw_addr)
+		iounmap(hw->hw_addr);
 err_ioremap:
 	disable_dev = !test_and_set_bit(__E1000_DISABLED, &adapter->flags);
 	free_netdev(netdev);
-- 
2.47.3

