Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0F331EA5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585539; cv=none; b=Mna0zBF8LCuOW/EUfwGVX917kqlymA+PLo7Wtf8SBDdhT8QnLEqB6gNpvmPuSgjkx9FUbZ5zABauMNJ7YmS6+6AV9Ypv+IooOQluvGPnAxCM6OTC6YPMBMo4AFK9BfPHDKL/4+2stFWYu+X7S5fJgJY1Euyflphp7y6KJzOBKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585539; c=relaxed/simple;
	bh=UwfSi01JrjgFFoyq4nGcZMTUyyfTi0iyb+hO2kMTbno=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HebeynNmZ3pplMCBO9FzgxLJXU5OZTbNq/m+S11+AeiSFl9t2B/lBA1b2r4ciq71QOeUsilImsmcliE/02Vb1dhhwl2/X4LrjlTUrXZ35oz/SkKje/ceG5eHf1OWgRDG6ehU1Yd8JPjUv81iSfUzLh1uNxpPQMSMuxJFb/jcOM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLZciGuH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLZciGuH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-484392e3d33so1119234f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585536; x=1789190336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YP1AYjVYNbHbr+XqRGPctt4NDejyNq5oyC8iI1I37GM=;
        b=TLZciGuHHnOYhOuEYQb2XvyDRtQVPsyCZnqdSkr76mT0hlDjZu21VR2JjZ9vitHeF2
         NMwIl10j8rGePWGZL2arj+MoXVMZqOtxanCPGnDBvl/hRnyp/vzXxyvz0BPxUqhqLuKX
         n666lIis+Syi1Q/WsaaZjZwP/waaj+gBZZ76/kup1CtDnOf+r5h+klIQj7z1Ed+L8t1X
         /llwc04FZESw9woNx47E3dkgT2UIHOd0Pw+NbWHRaxzRNZNDWRDb9SoMqyC+t0vlkLGp
         MgaqTsyAglFiDvfGP6fTTK68t4YMWkMxfNjJGWbFZWQlaG8f9UHCAOLl940bl0P8YWUX
         1Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585536; x=1789190336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YP1AYjVYNbHbr+XqRGPctt4NDejyNq5oyC8iI1I37GM=;
        b=aTA6aT3S5SYkLresZDnerbRyp/FHqv3MtlM52NW3s2My2kHL8aBBL8V2sd+WVp3DiG
         OeIO7lDKuK+KOgCPxAOSr11ULm06Iq5I8K60GDcmxQCTzyf+mDqZmmKKRUZL2F8rsab+
         KXQtVO8Zr8ot/2tkFTLXG6uC48hTz9vgkBJr9RaT1cPNn042lj1qCiOyI0ccXb5wV5df
         m9v0Zm+ON6jQWkxgmdMfoPLZVmOiw4va7yEeXSfgD1Ke6N87Uk4Nl2rNm7P6CiKXKm9Z
         RE8VBboHKeysVsWhxmFHgi+XYwLz9KuDiSoU+I8RoygzM+oMMDqMyS3J5DgRacGlQz7Y
         AIRQ==
X-Forwarded-Encrypted: i=1; AKwUvByv+UbzVF8fSyD53FkT/fkTKDOikdwgz7MZCGwBtp1wNL5ze1mbWCAZBJAXqZTa3xCfQadp8bNg0+nxAYc=@vger.kernel.org
X-Gm-Message-State: AFuF++k21x1hLztF96eL+cL3x4KfEa5zVBe7VFlQDRGioOSW6XZBtEgx
	61MmB21CUKqg9sbwBG44EW+fsaxGg0LlTv20CQRG3s3XqzdCAJVpyrlC
X-Gm-Gg: AYBFou3hmQKQA5JRprYkW8WeHRvWfree7L7uGq3T+McfM9BqtGQndhc1aH2iqLzT4Ud
	9lQzF1JlyipjlsunM/7eTlzPoaXNhCqutzacnlv2HNsrxmuMITm51F7rsEzZ6tQZ4Nf4IbUIoKZ
	nvPlPH4VjOAf9Laj/slNICqGYFB9BJo7dN8RTIgE60xQY0+nxeYHPyHDBUVIUXS/ASF3FDqbWKK
	wvUxlw7boOGK+6R7uiF8CpNj/nn2GVeAJoitWKUXLhvNMW3gJT54JMH6YoNGDjC4jjZgI1sXDmH
	Xwf13nh2bn02feI/v4ZQ7dNgoNBBwvEvRWemsSBPzBYU70AS5xEVE3GgfeRuuS1DlSMc3M2k3U1
	bqa6+yX7BRuq2KLknryG3T2CUfpvtTDcQ76wBspvbE9cJzRvEldYjMv+5fMYsxt8ZKFfOy/LeRj
	tUh6Ti42GgYSMkz/ycfNSiW/k/d4KHEMTtTLNHKBe/57rJyFethTNoED1PYE8lpipVfpYqFcZt2
	N8YrbC/8qXE7HuVu0TWGuP/kxIEUy90x2z76r17UUjBrFcg4MNZ0okAGoqd34AWS7yNPY5Rkkbc
	cvXcLhjZTiG1YYeLhIDWSjYNJgyQJeM1fx21hwa8aekWOdsyga2q8kIdUAo+aWMV420=
X-Received: by 2002:a05:6000:701:b0:485:8c17:9766 with SMTP id ffacd0b85a97d-4858c1799b3mr6894505f8f.40.1788585536473;
        Fri, 04 Sep 2026 22:18:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm9581135f8f.22.2026.09.04.22.18.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 22:18:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netfs: Fix the debug module parameter description
Date: Sat,  5 Sep 2026 07:18:51 +0200
Message-Id: <20260905051851.11516-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugging mask is registered as the "debug" parameter, but
MODULE_PARM_DESC() attaches its description to "netfs_debug", the
backing variable, so modinfo lists the description under a parameter
that does not exist.

Use the parameter name.

Fixes: b900f4b89b4d ("netfs: Split some core bits out into their own file")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 fs/netfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 927badf3989d..ec402837aab8 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -22,7 +22,7 @@ EXPORT_TRACEPOINT_SYMBOL(netfs_sreq);
 
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
-MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
+MODULE_PARM_DESC(debug, "Netfs support debugging mask");
 
 static struct kmem_cache *netfs_request_slab;
 static struct kmem_cache *netfs_subrequest_slab;
-- 
2.39.5 (Apple Git-154)

