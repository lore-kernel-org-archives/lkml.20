Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D11A6814
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247661; cv=none; b=cd/HSuhkgq3MQSlxuVm9Yz6owUq2LfsPVhFVD+ttR8UzZ9ix/87fWKymH/kZg/YN8FkRoyAIMT0bBJI+2E4238B14UNbWx3fJ33sFLPKeeWTLczKkMv1bAiEfChSubHI5WvOS0/S6rQw/z+ZFA5L+4kH9H3LKwDhsQLC/UzXxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247661; c=relaxed/simple;
	bh=3cECS78zF1NVf8J4KfS51qVsII8IqAYkUs4gHRrgdcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMM/uwAXTocn/yl4U95IDVdWG0eFJ31AW2nBOsg4O+RbqNeyMYuEh09o1Lpc+pBOV3m+i+AL+EpzKhCH4L0XDfmUXFzlMYdGd6vo5P9sbDdo2etUWhxJt+PUF9bX3NJs9OauERMh74N8OmtOESmpsmhfCIOZR8aIrubSrmUyWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQEHiyCw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQEHiyCw"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so9862475ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247659; x=1790852459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mi16B44Uqe6HxoSqb3EL6zUoH29MNyPdPj0rfXYWp/M=;
        b=ZQEHiyCw3ChJQIv07ILQDEVzpTlowmh8f4wZXpm5G9HNHVmvDhGzqLtYuFeFqz1z7i
         zLeG7qkV4GTJHzbmLrGDLJrgroro667JpNIRf2AGH/NHU//X+OmkGJSljUJQXxICjMix
         oRwF/nEgU3lUDAylzDGs3ShBdZGM/zmYfeBfKMmZDstasi74NHgTCukN6gr40lNMvLbE
         IerQfKcs8PTe3P3cvtr1rPhN81hx4HY/hl/VA4IJx3cUaVnkngwRZYSP3oYU5wvUFF13
         EClOIHSW1S5i1zjeNU63BYTofl0Qqc1NJFeWz4bfPIh3b0JPRQkPyXT0qhCLd/xkGQWf
         HWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247659; x=1790852459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mi16B44Uqe6HxoSqb3EL6zUoH29MNyPdPj0rfXYWp/M=;
        b=MG48KAzmAxhEZBBWv58vVQbWVtXECLGYZQoxDHbW5aqt/pi4xHhEIumEZ+iKY4eRFB
         efWlvYnpL2amci29WJK78oKQHz8q4AZdoT9I+cUlUBa4QV5DF2XKQb/3noeTnkNqQjPk
         Vs6pvuWvqcralqfxQcQ7VrSi6zmaCje0mXXAeLsfLxDZkhmuPyLziSXcJWbJQOGnb7OR
         69vJ8SfPqZ5xAxK7M/oZtP4PuLw/glHlMUI8Cs+KuWxOcVjHb6hpN4QU0TaySeWqkfWO
         XAne9hkp+fndAs1XVtnx7SE1LZ78w1KLLYuiKjJ0P5WN5vIp0ydDvXZa0VeCcjQ864B7
         0MjA==
X-Forwarded-Encrypted: i=1; AKwUvByT3cRN9F/Ux5zRmTmM5R8HUakzWNwZdiVAAaEHZk1UYQkN+gyBpMvrE+Zj0QfRF9GAvJKPcUFomhcZwjg=@vger.kernel.org
X-Gm-Message-State: AFuF++lsXVk2F3EMMZZe9UZl/RyI0Ep1wzvUyvyKulWPQR8xHRjwcT0G
	TqIYAXX+GWm2wUbMx2BATES7aSStZ0HJ1907+ME8VeS6XG8zjqM0IF31
X-Gm-Gg: AYBFou0QUK+o/Qh8GlIitQZl5bWuAeaphwwhH5IzbXISMXS4Wuov8v8k8P8Da5hLZcd
	FKwA2lSdzP0L37k7WlXzDMU9PFz/Wk52BZl/wZGJyt8zRkObFYIDRrCGObPCMSDoZxxDFQFG8uD
	sfqyY9wDDfKz05UBWQDKQA6GukoYJI4nKXvww63WxkCpA40OjGhsy4u+1mif/Lie9TAhdv482tE
	oml/trpX2w/hCMgk/o4dy5aLFimOyJtzZ6ad7RYDtPf+xg57wfT/IxUE7hh85BGQaUaaZar8vJX
	Wv6GnI+KGrHTNBmX6gNDwZnJzF1EC/7XkS7vNKOaoiwCwTQXkRTbPJxGeSEr065bYCOEWdT5nW8
	1c97mM41s1noJf+/Cjc2gqTbou/qls6S9sqU/vvp7Ej79Ndl4glvCuR4A/o7DOyOPAR9GOLWaio
	djCkBSYqalIUgRUASEBPyvUoQH38Z9Xw+PCwn3gmtCYXWOhwHkyFiGPheFaHM=
X-Received: by 2002:a17:903:b86:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2df7da426d3mr18456005ad.3.1790247659200;
        Thu, 24 Sep 2026 04:00:59 -0700 (PDT)
Received: from lgs.. ([47.82.67.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d96sm24397225ad.2.2026.09.24.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:00:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ustc.gu@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH] soc: mpfs: use kref cleanup on probe failure
Date: Thu, 24 Sep 2026 19:00:54 +0800
Message-ID: <20260924110054.1553880-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After kref_init(), the device_get_match_data() failure path jumps to
out_free_channel. That path frees the mailbox channel and then falls
through to kfree(), bypassing mpfs_sys_controller_put() for the initial
reference.

Call mpfs_sys_controller_put() on that path and return immediately. The
existing kref release callback then performs the matching cleanup, and
the return prevents a second free through out_free. This is the minimal
change needed to keep the initialized lifetime balanced.

Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource leak on probe error")
---
 drivers/soc/microchip/mpfs-sys-controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 0400a01b2338..379e4f649faa 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -174,7 +174,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_channel:
-	mbox_free_channel(sys_controller->chan);
+	mpfs_sys_controller_put(sys_controller);
+	return ret;
 out_free:
 	kfree(sys_controller);
 	return ret;

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

