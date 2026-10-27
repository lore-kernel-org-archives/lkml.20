Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099964;
	b=vxCr9NqL/p8oAvHbDX/e+FYzgqdM94KwxyiZf7QgE2elWuLWTB9ayLGa5fYswrVENBIY
	 fhwYJKF4HJv1ezrZzB2/ipJCsn6Fsi3RwwFckapmVwLJ17Bi7PmTeRgNYDuI6WylRbKkv
	 YqQqCS8TUGbvR0XtFVx1+Bvfoo0F7da+XmE8CsMuX89Toiinc8oUq157Od5YOmWrCXoQV
	 snCTO3G8gBmAIO5I9VwIJam5q37WVCml3poXfZ6QhfmGCVcdkmZWjajLQsgEPt1Urj69N
	 9vkpphknm/t4Yb1p1XTrG9e7ehRACxOy1A9+xOgR2RA2sYXtQatIZoeermqu9WG2naQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yTRHCeu3BKYroz2AU7wSXWEvSolHHGJHDuQoOz2ibCI=;
	b=KwslPGjCiQU5WGILms9J0mdZE7SdTgGnhelGFAP1mgTKYWdyjcNOIeW4UBPOvMJJJzU5
	 sMLoH7oQHisFCyDITvu9bgBRBZWzVij/53dzyp11+JSPCD959EqusUeTlSj+MLm7T+ZCz
	 D+eu5FS9G5LRdHukW1gtMuFlEp7mF3TqYJwvV4OgNndncd7juLcbd8Dh0auaV+W+5WcV5
	 iSGyjNueVQQFf8cTwoGR3nf6y+Gtnr/uVFGkx/hG+HbvdTZOJ6xY95M5/NyACd76ujs9U
	 mBNKpH4iRaGub94LeYJDIZzoCdkv6SsBAvrV2SdHJVHHCqYhcgEqEKzJbDHzbspxWFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U4S7CHgZ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2992C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U4S7CHgZ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3269832a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793099963; x=1793704763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTRHCeu3BKYroz2AU7wSXWEvSolHHGJHDuQoOz2ibCI=;
        b=U4S7CHgZ6OWC/w6R060JJBgH2S6foSewfrysgfKhq17JvFS9ly0/sFOKyCSSmaE0qG
         pXuI36Fx9WDwmDDwid0JCsGOzxgUhJkk9ExbPBsLLpaHbd73sqbNENkByXL3OcC2f6/e
         RtK5EG12GHv/VLyiEAQEEM65dbjbYOI0/Utk8tIr/JMa9dwj4A0oCflIKm5dzMhrYWGr
         WGcRGj+OaZsyOwwOsZuzFnM33Z3zN17LJTYC0N7LKGfrJzxwwHuO0VVa6WupFXF5B3qJ
         c2uH5rP5t6X+zyHP/qJDHpJZxngMppC48ipyFcmvk/kTiDwNX5ahT3lRDvuPPQK83gvC
         kzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099963; x=1793704763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTRHCeu3BKYroz2AU7wSXWEvSolHHGJHDuQoOz2ibCI=;
        b=XIiK1ArYY6jAgcbt6ezZJr5IFuSrEkYSBkrnZwbxE4i1rYJOkIGGnXa79++mCVU/Qm
         xSN12zdcUT/g5vmTTe+66NyxspR5mem/EbV5StCTtkIEdnR9o9FthghjGO32eXfncGIp
         1pmhK4qSFZtm8E2tvYSx8iCmGPd/PpM91e+AvjhzybnfrMhAzjLIRmvZ3330Hq+B5eFy
         FGoWviAgVynK4gkLsBYKqwfxbDBzOoRbMYG803dAo1AFm0XHONUMJKJMOEewkKGct6lH
         +BK4mp7FTnMaHuwtkslSR2jcwRvK1ECgzamUQsHgK8pvrJ5Q9jDEHHhCc3VO8ulYx3Va
         CQkA==
X-Gm-Message-State: AFq9FYIP456n+W1MUbTk+R7k60rGV7TMHtMQByouKfV4Mt1Qp4vmxjyP
	QXt2ew+iYO7iCw8ckdsrAREmCirwxKR05ploomho/QO1yjq3Jrqeaifo
X-Gm-Gg: AYBFou1zTPRzZISgYY4B4VyLfirTN1BuftWL4qbBPnQ5E3G6657UElwNkNO08yBLr7B
	uXJqGE5geUdZbK9CIAi2aVwbHD2WEwkTcA3ROAImpLCvg6GHBglsl7lJxxDCZyrcakpr8wfe4A7
	b+fBhMrKfaFYeKaxJosM8fFRcJDdcwvh+6w3W0aGsb3KzpRK44DEraD7YnVDEhDPWq+ttOigVgF
	juXDhB6ZJKmy9aVyXl2Jhm2jGCqPD+ieI4pQQSozfxfLpzqhZi83RmCEdkv89Vyz/ym+zStOpgk
	lcE1OUI4DZR6CF8f8koxmbl7TzSg+L5JdF2hBb6RKD36ZKeh4B4+e0MGLF5jpvZH6xooauwUs65
	S5TuWVB2nchPJ+eG+2vHjBaL55kJz9kwu4VPzm/gGlmTfhuKr9MGHZdjwX4yYG8sTTdGttcpClj
	fwZThDNJOX921n9xToJSt/5ETF+hQe/JRSOZ8ZhJF6js5JDDfQjCiHh6eTRXYVa4Fzb7RcingbW
	ayN4sWm2IKWtYq/+O6TCz44CNeRdPidIVReH7EYSlR9Is/xaPyt7VcJAPLc
X-Received: by 2002:a17:90b:5744:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3adead577e9mr8214590a91.28.1793099963392;
        Tue, 27 Oct 2026 04:19:23 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406519fesm3435051a91.12.2026.10.27.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:19:22 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Free error_dev_id when destroying an MSC
Date: Tue, 27 Oct 2026 19:19:14 +0800
Message-Id: <20261027111914.850854-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

error_dev_id is allocated with alloc_percpu() when the MSC has a
per-CPU error interrupt, but is never freed. free_percpu_irq() only
releases the irqaction, not the percpu allocation. The msc structure
itself is devm managed, so the leak survives its devm_kfree().

free_percpu() accepts NULL, so MSCs without a PPI error interrupt
are unaffected.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..bff0b5da0fe6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2423,6 +2423,7 @@ static void mpam_msc_destroy(struct mpam_msc *msc)
 	list_del_rcu(&msc->all_msc_list);
 	synchronize_srcu(&mpam_srcu);
 	mpam_pcc_chan_put(msc->pcc_chan);
+	free_percpu(msc->error_dev_id);
 	platform_set_drvdata(pdev, NULL);
 
 	add_to_garbage(msc);
-- 
2.34.1

