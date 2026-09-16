Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991538839E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524588; cv=none; b=j/LX0cXEnDqBvGy2tnVmn3LmMi52vtFnIAgcmy3GvkJr96Wn1c7ZNssyc4Sxz7G/tUf8tw4ym9tGbP2X+RfHQwj/VJRLg6bZk6vGgf/Cg7ttWbl6KwdbXxfhVjfyUkmPgLgBMeXmJZLg62LEBsAKGLcOGQs7/6NgODnuYDjolms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524588; c=relaxed/simple;
	bh=YG4COEKulNp769D/BH1fCYynnVil3u1ZWIifJ+zRmkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EF/EdivB3aK6GPQHI4lz85QughC+Bob75ZVSe8/X4z85JAf/AXrKrssOWb0o/QqbFO7Xfiw7Auk+jlIovSk8tb9D1bvUP6Q+t+ckzpMmk1gEbn07SgM8mvFU3bgk2hFCHrjP+3ysjZBKktDGgODNW6xNYeQbpIv1T+EL3KEk470=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcPv8o/x; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcPv8o/x"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso268907b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789524580; x=1790129380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wm31bZPNQbk147CGwUHP23ZCay3Kn8INjT2oDuzYLtc=;
        b=FcPv8o/xNEeDJ15f/ck+7wOxyuQ2vkXb07FBv5bMzvikGrllRPat9zjKwyIOLs+PI8
         eDahLH9sOQfC0PRkZ/FshyIVzJA9coonZkbh80KwlFcAWMoy04H//EiyOFIvoHgTBarc
         llqXpc46GUK9EuP8zXQuwe9K1HAdGa59XW1BibI0XAGjs11vgCIuW3Ws4w73m7MVjO+S
         bLy9kJY6uM6ZaClAuaI7+Vc+AGFVb1hhS2uV6VOEHAYcasKHlLuqSLV3cvh4IqEyGCxx
         KOv+sSDHpFdYFZHU8ZqCu8YFqcF3BfPPDBDtX4oqxW8zpgDVaWB/sH7YRjfFXRswjBpB
         IwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789524580; x=1790129380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wm31bZPNQbk147CGwUHP23ZCay3Kn8INjT2oDuzYLtc=;
        b=tcSYdVXSKB3+OGA0l/7RLJ7EZZj6iAwguI9kXn8WN5H7Wff95/nJ8AGN/TnZilyYPw
         n2OUOYb5q8xq1ROOLjc1XR9rcQjrICi0G8X7YW6v+zC/o3y1I8LCqLq07OeHYVn38PES
         2Sq2kA+jexXxwWPS07pYrQ8N8fmoueU2PWDkOJiKxt1UzVybP25la0RER46OL/uaCjk+
         2Rwp0Y5Q7/AszqyVIYalqou4hOy1sF4+IrP8i8CF3dnxnpzB934O6j7NRSAfiyT+A5dG
         DhFBrF8werurEwzk6SdPoH89xN2TIyNo6UHPIv7s21jBrwjV8XQCwLGnHaCTFvs6cQ9l
         ToZA==
X-Forwarded-Encrypted: i=1; AKwUvByQ6ysZrnEPnOu/YtqAYWs5xcIVpj58VowJ+RVVEzbZzeF25XgrxXY37fhG+18xiD1mYaLF+npAEMwJTv8=@vger.kernel.org
X-Gm-Message-State: AFuF++nGVouRKXchKH2kKYsdu7XWE3oCIWkMprf1uXAJ53u7RMMuyMMI
	WYD6QnN7UBO4ZGm0We4lGbNqVDYMrbcxLmVi7fYB/LK3DvuT51Vih1NxrJmKs/RO
X-Gm-Gg: AYBFou0quzRXkF8FDUmjsw2VzWHZ3AnwearENo4JIl4AM+7Eiva++8zXEUOvpmJh0RE
	1SSrIcZ8wQxuIdmEyPdCpVamB3TM4D8j/ncm2TCqoPb7oTEU5BfTWQHy8+W5vj3r4+t5SH/bWLo
	RrBRI6Z4XLVmFUVCX9lRN3OTuV2C17tqgleUud0KLMM8iXF2+1QQWfE1cHKv13PmrSN/VtSEG7a
	3b4xlMGz3hetB9VZUYcQCCxKRJbTd29y/RZXQKlpeCmJDk5b5De40XCXj3w/MnlBDXgrZuJ+mkp
	iACdbpscyYVKnJRByFGZAWioOjBpQRohg4T1LFkb5KFafQf3Rg5tYMHJ7zj9c8uG0rMvj3aV3h8
	b2VitLEIE1J9Azpw5s8PzuX2KT0cZ6uDzVi73cT5Zj/vL7c1397ausYSqlm8+kR3wPJe+tMWGsl
	ODjVVz3K9Kgpgf2jc2gvwcfXmgEHn/ytsyIfGlxNwZa3++exQbOa3eFA==
X-Received: by 2002:a17:90b:1845:b0:39d:f259:3363 with SMTP id 98e67ed59e1d1-39e1e491d27mr2086478a91.12.1789524580108;
        Tue, 15 Sep 2026 19:09:40 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm1508988a91.11.2026.09.15.19.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:09:39 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	John Crispin <john@phrozen.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] net: lantiq: fix netdev leak on remove
Date: Wed, 16 Sep 2026 10:09:30 +0800
Message-ID: <20260916020930.2606675-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ltq_etop_probe() allocates the network device with alloc_etherdev_mq(),
but the remove path does not call the matching free_netdev() after
unregistering the device.

The probe failure path releases the allocated network device with
free_netdev(). However, after a successful probe, ltq_etop_remove()
only unregisters the network device and leaves the allocation alive.

Call free_netdev() after unregister_netdev() to release the network
device during driver removal.

This issue was found by manual code inspection.

Fixes: 504d4721ee8e ("MIPS: Lantiq: Add ethernet driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/lantiq_etop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/lantiq_etop.c b/drivers/net/ethernet/lantiq_etop.c
index 83ce3bfefa5c..ecf2f3cbf4d9 100644
--- a/drivers/net/ethernet/lantiq_etop.c
+++ b/drivers/net/ethernet/lantiq_etop.c
@@ -711,6 +711,7 @@ static void ltq_etop_remove(struct platform_device *pdev)
 		ltq_etop_hw_exit(dev);
 		ltq_etop_mdio_cleanup(dev);
 		unregister_netdev(dev);
+		free_netdev(dev);
 	}
 }
 
-- 
2.43.0

