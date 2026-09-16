Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CA3ADBA4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527150; cv=none; b=RuABjS/MX6KdkWLDJrKUAzmEIOkGOIOSVpGTwnTolFjXrP3UD3zXgJ/5U1oU4+yLMiE3G1TLPQcZBSAb/8OqB9TE8KtNotFRNaJ3O4poV+VoWi7Nahno5AjPjbiDUJGtMKbVqmDegRyS+/cIfqwdLsuy2AAL9zjIIHUeZAZnEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527150; c=relaxed/simple;
	bh=tX9M+W6f3YXesN8e9sqc2endp/ilgoluGKgnYvWZ2YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/j+CJYG+IAvJ+rDHlxiSyQCnl4+eiyP55yYPfEM7EJTz+/MkLAS7Wmv3x9ia8YeZCKptAaQ44zX4ln9PlZaw81B9NyjH9ddvNt1NzMQN7CnCFYPtog5uHC07q285mqpbsG67pwytNflaysStkwEXoTAEY2UH6u5AxmHtbrpSk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUY8FHpt; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUY8FHpt"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a33c9cso464230b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789527147; x=1790131947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4i5M/+Fcpjtf5aQ6npx1txWnbcVS6QYJviLzGTvfRwQ=;
        b=rUY8FHptKrMiwUG9/g2dcbDsRs5GN1MoJKfwS+ruKhBxsaplrnQUPoCL1VtRxbNJrk
         +axtsUUEMS+O01Oc3S1t5c2S4RoqEdV8QG++LdyCZUJtBBFUSCu1OK1TtTkvF7JxCRum
         VvJB4EeHxd0eJDKwLCBVmAsQb/H7alYhXyr4gQHjETbGTt30CLe41E6c63VzpDfolKWS
         3Eo4Oa6Uqc5tdR6uTpnImwCV5+9aVO+3ZzCIYHgNrTo4dUmgeuXKPM4hlUreThujHzhG
         Bqae+uC+FhITtVyndrG+FcixTDTi/B4YkK+VvwhKBk9oIbfyvETlSJwKDVpQjSPKCdb6
         CUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527147; x=1790131947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4i5M/+Fcpjtf5aQ6npx1txWnbcVS6QYJviLzGTvfRwQ=;
        b=oPQEbFN/c5uJXjGlfIbelyttYGjyqMAcZW3yxdCvobiddim84Q9ET9538ztwMzbOvo
         SSsKMP3uQra457JzI67n2wD8wQKCH6wfu8ZBR6qkhRxrK7jpIdrDaTYOAdOA46u2vOlV
         w8hyfKFHyI93A5N46RHNBqC/gIEY09Fy2Xln5z/swfcT+YHwcoNX0xjnlB0AKFpCDPG9
         GnvGtxouPYecJkR++cVlfKa/atS1l7wG5ZKvumur755Dx7xEnzIZXNc8UzC32gqjhZvW
         ChLc0gq9sGosjdVpMfZim+piSfH/DY2rjrnRiDwSgbtzlEEib7s2EWbXGzngUbVJbSCh
         2T9A==
X-Forwarded-Encrypted: i=1; AKwUvByRuJHV35tO/SqTW0Qjn5h7EY60xFGhfpXVhb90cmZFiyVRElyH5KkIJGZG5dok9P6C5SEoGC4yPXVfERU=@vger.kernel.org
X-Gm-Message-State: AFuF++lwAZAQOY2tbzxuT9wsw+gdUY9KTkXrmCnWcY8fyn1+xr0qoWbC
	2cnIZu9HcZH7fdrvksBJvdOSA4/Y2UQgfv+qr/i50iaIkt5mejO04/0S
X-Gm-Gg: AYBFou0U7V84HFPwSWSpciqJroOXgE1eKdMKNFCQaeF0aD7To0l+JbldCGYL251byL7
	AurSMPhWoV3cMfBn3wE3ntQyGj3+oF7HQI5w9DwDLnljmlAkkF+/tnbQ0ORpSuwA5YCOa9hXuAW
	L/deCrt+44KoQaE047fBqkoaPJ+Pa5s8zIHdiyaS/WKiNXykWr2TmiW8xJEPZpZmeYhdChrNn7I
	7BDzlGt61cq9pVpaSVWzGVP/MTnTq6KDl64o6lZTKaxplQQP70j+VKZtObvMmulQgoLgIWEEiUC
	NTskr2/50sLDYzYe2GMKMrH/kvN+eBEpFCwrDGsJ9uhamS3IIJLvY91/xlhTOlXYRx7t28SNouT
	/za4erf6SuYgfkw5N105FlxXmtEJgd3psA2vQMlMhXpd2YakYifNJiyraOSLhOjMJ+0kshMRbND
	GIyePIAQQ57tLLCKusL1VZit3rr9ZT6wH4GVlW/5Mf80LeVoikcgId8w==
X-Received: by 2002:a05:6a00:4613:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-8723b87eadfmr1399876b3a.7.1789527146998;
        Tue, 15 Sep 2026 19:52:26 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720172b126sm414532b3a.38.2026.09.15.19.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:52:26 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Potnuri Bharat Teja <bharat@chelsio.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ganesh Goudar <ganeshgr@chelsio.com>,
	Arjun Vynipadath <arjun@chelsio.com>,
	Casey Leedom <leedom@chelsio.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] cxgb4: fix FW SGE queue cleanup on remove
Date: Wed, 16 Sep 2026 10:52:15 +0800
Message-ID: <20260916025215.2780658-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_one() allocates the FW SGE queues with setup_fw_sge_queues()
before registering the network devices.

The probe failure path releases these queues with
t4_free_sge_resources(). However, the normal removal path only calls
t4_free_sge_resources() through cxgb_down() when
CXGB4_FULL_INIT_DONE is set.

If the device is successfully probed and removed before it is fully
initialized, such as when none of its network interfaces has been
opened, CXGB4_FULL_INIT_DONE remains clear and the FW SGE queues are
left allocated.

Release any remaining FW SGE queues when removing an adapter which has
not completed full initialization.

This issue was found by manual code inspection.

Fixes: 843bd7db79c8 ("cxgb4: Setup FW queues before registering netdev")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 1ced6df6eac8..146419c66348 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -7116,6 +7116,9 @@ static void remove_one(struct pci_dev *pdev)
 
 		if (adapter->flags & CXGB4_FULL_INIT_DONE)
 			cxgb_down(adapter);
+		else if (adapter->sge.fw_evtq.desc ||
+			 adapter->sge.intrq.desc)
+			t4_free_sge_resources(adapter);
 
 		if (adapter->flags & CXGB4_USING_MSIX)
 			free_msix_info(adapter);
-- 
2.43.0

