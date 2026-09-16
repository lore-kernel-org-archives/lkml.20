Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4F3C4554
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536690; cv=none; b=rrYy4qh1jJFQ4G9dWQQrC6XSTSBfbknDfzSqJyOGCcRiq76kP1AX8/ArsHU0TWDdD8Wogh2lP9B0WG6RLpx0Az/GN/oKnNkXa9ebdjCPLukU9I3oMd9+ziH5VE0hC1wr16fLfIYAN/ORQOMdpSCJwCcrJ/ZCzjVVMfmPZeR24XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536690; c=relaxed/simple;
	bh=l4i84PKR2XfXpPetEwc9C5l680POO9YxAJH41F03t0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJwLTaBSfnw9ggwKbLt3GBXIC3c3CFvbG/izfGo6pHfJ9Bez4Hss/n6HLODnvujf4zslKKrYpwCMSQjXNZWMKO4OsUuwkZSU5j/SqLecWZuSJp/8wQgimqul/tiqoR9/zMws1ZoUmpZXonkOlH+KTyrV3w4yIrRc8YV7xKqqBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMHGLY1s; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMHGLY1s"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so429062a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789536688; x=1790141488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIE08YFw4kaft37+7mxF/frk9TC2//zqhyYMu0YvGkI=;
        b=AMHGLY1sTO1OvpAgVJo8euKs4P1A957RqR6Q+rWrU7Jh8aVBmHCFm2q4zrvEvWc/5m
         dFExyh+6hvjNQyk2bLH42ckYhgFRiG0blMWelH74ujeiy2wASffZpPmTQhXb1eDI1p/Q
         YLb7YLjbuqO2TCLinrZ73VmRXqxw99FvQJ8I6P5+AFND/92B3+HofcKgNGTYSF7maESH
         s9+6QdNATx/F37qJ3baVk8CrTu3Pw6wxa9MO54MfY8G0U9jlsplq10fe3pCQXzxAJOiA
         75SLTlisoQK+cEcMHX5qcSQ8pcY3EREgxXa7FPDegQ+6kFHt76tOYmx+TzntCZJscn38
         bpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536688; x=1790141488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIE08YFw4kaft37+7mxF/frk9TC2//zqhyYMu0YvGkI=;
        b=bN+6hed2drraxDGJ2A2Tz2ZoA7ZP0b7rK3JW724WQxVz9b/2CZNvLK6/upZLVIcwrg
         /ENeBlQV7qtoE0tDB5bJ4Ypi0tO6Wyc/uNWLym3x6mK6PJvXPtQqSTvLAR0bR+y/MtJB
         ohi+jz6WxBaMD3wymHOVb+M0Mmw1l60F8YVkpZV8Aa+9SZ6mtgmeQFzqIQXKDyJz4Eof
         wVmmeTRkv4nUCSVyA3xM8vqNljrYHXXCpny11l440K2VPkxhcz7n+j7ectS7Fla5tICp
         CKKVllCZkfGXJEdL0bHva6LAwhRUk6YqQ2hL7nSnUB5gfOYCstOe3WH56yc1m166sYNA
         B55A==
X-Forwarded-Encrypted: i=1; AKwUvBz1bpWko2tu1yFl19gsnRO8ZzAkw5QFCBSlVTzOB7Gy2sQkRWuZAvQsCP+TPksrxpTtZBrUNXHzbEt35g0=@vger.kernel.org
X-Gm-Message-State: AFuF++kEWDZSF6LWWdVCoQZwyhCcR/iJiW3Bu6MTK3eY99B7GJtTx9TG
	0Gk8cyyaXVYbo+u+cYKqGkI8rgiCtNp6I8rZ+28amDDDwg2wbX0DXjpu
X-Gm-Gg: AYBFou0Mav+bg5Dj+pU2YcBIi6WdfMmTp3oJNc4+qTBN9bYJhHVOYDKXwRn+rNmRjGz
	Crvs6JC54pmdmNtnUwThlP45p3dpq+6reXG9kszy95UK+//VUyVK7/UI5Be0ClVAszkOWaLaqMy
	si+g4rOSKWeNMQogti1ULU76ikrZI1MR0LG51YW/EqmigubsZFphbnnjAgvf+TCSnRqXNaFVuqt
	4t8bK2PnW0T3kpUCi0LuZglevCnCsV7rTaeluwygcsMvs1h94nbHbH8IQnDN+XIJV7anFjem6O7
	teMiKhD5GxLMDwmJUfeyGlGBKzozWARXO1D0orsKhGFfGOaOPzjen/0S+oo4/6c/k6uL2gs5swk
	YhUEpVodaowIMFDY1pGckCWjUghly5o0WD9wp7R1uJienW7lZbXeXRcmKFqenhjVu9Ctu8MWqOB
	pcy1JrGf85+ORQFNIAeuY0uhjCjr4T8cl88Lysbc+2/sE+t8r0SawpRA==
X-Received: by 2002:a17:90b:280a:b0:39d:f60b:8121 with SMTP id 98e67ed59e1d1-39e1e4d39damr3369964a91.17.1789536688567;
        Tue, 15 Sep 2026 22:31:28 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm2504124a91.11.2026.09.15.22.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:31:28 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Brett Creeley <brett.creeley@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Shannon Nelson <sln@onemain.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] net: ionic: free VF resources on remove
Date: Wed, 16 Sep 2026 13:31:17 +0800
Message-ID: <20260916053117.2906446-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ionic_probe() allocates VF tracking data and maps a statistics buffer
for each already enabled VF with ionic_vf_alloc().

The probe failure path releases these resources with
ionic_vf_dealloc(). However, after a successful probe, ionic_remove()
tears down the LIF and device without releasing the VF resources.

This leaves the VF tracking allocation and statistics DMA mappings
behind when the PF driver is removed.

Call ionic_vf_dealloc() before deinitializing the LIF so the VF
statistics addresses can be cleared and the associated DMA mappings
and tracking data released.

This issue was found by manual code inspection.

Fixes: fbb39807e9ae ("ionic: support sr-iov operations")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
index 05f19489ec5c..666efe972de7 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
@@ -424,6 +424,7 @@ static void ionic_remove(struct pci_dev *pdev)
 		ionic_auxbus_unregister(ionic->lif);
 		ionic_lif_unregister(ionic->lif);
 		ionic_devlink_unregister(ionic);
+		ionic_vf_dealloc(ionic);
 		ionic_lif_deinit(ionic->lif);
 		ionic_lif_free(ionic->lif);
 		ionic->lif = NULL;
-- 
2.43.0

