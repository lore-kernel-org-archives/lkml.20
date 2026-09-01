Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D51376A19
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261019; cv=none; b=Kz3izQzhxUN0DYRBq7wblN4j8qFXYMJDFquGk97fOk7WG/RU5T3SY7Ly9iCJ3X8kTB6DDk2HCA2Q5rF//gFUMroOY01dUUdIk4AuwaFwdHuCAoM6R/NMuEJu+3VHKhO0qrQA2FEx2VDaWnqhoOa7FtmjsqsBN2qJTXCu9yRyEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261019; c=relaxed/simple;
	bh=L8Hrqvz6GFMoSEhRyzIorG1PWvffPNsLFlZwtdXw7FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ax5f1XlWDBuq1EFaZaE5POQMeWGcCPDQ6U4khjpe7kDzJz/QgLeby20c48fM9XSqV0JMH/ow9Y/4tmkTHum16UFSsCGZHgKEIxlTZZqPdTWls4HVqXGsbYNcd8SvIYTQfG/x/RHJu4nMeyi6dZUaqvMUOA+iKQLUXHZv2xCVcTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6vNaZuf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6vNaZuf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so815697a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788261018; x=1788865818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgO2ob95gg6fumjWiN+mfIqaFjC/9ud8+iboIR5TNwg=;
        b=Q6vNaZuf9iWDfxOuNNZVl/lZ9P5DuJDi8HR4nRMaGyutWmCKO+oiiEfJ+mHZT/ZAzA
         Xf+5AMiXbEIitwvjcH4ommzo4p63jCnXuySLMBsDSsIklqtV+EFAjee2oUN39neScvTe
         fNiZ1tyG+aiYTuNPbegKzvw8FX16RiTlvxd8R2Y4JyNNu7CsKIQdJD/oe6viYLIXi5Sv
         E3ohQZcdlrt22asYt95ApGLBKiGRHydTW3ibvD1+FtduNvdvu+BQ0SdKj0Wz3TM5ibBD
         +vpfTIyKU2eL3ZSfxO5WjTxC019WYetG6G8g2blOsRIObTEoX5Em4LZi7Ad2ref4YOXU
         VUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261018; x=1788865818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgO2ob95gg6fumjWiN+mfIqaFjC/9ud8+iboIR5TNwg=;
        b=QQ7yasrFU7HnILhrQIbU5H6VVKqlvS1tyFFDSqfwNcMH7KXIjAU7P3mI+NBHseQ9LP
         8WMMzntwW81Z5hQHx+ZQbu2s8v13Q7TggU1THxqCxE4ursREWuFVjRxp9VWZ3xIdXnQ5
         GBXsvHCEH6XAXwJv+YlQ0srBzedG9jtQdEx80XBVVlMA9HiRaiRJ0DycUV+b581xHEt4
         cA7+VB5jh7z9rsbwMSNkMJ+Bf8niwKQS5GaRUI2KuyD7SF0ez8KBfztn7Fo2WBYWWyCm
         LagMY/U27cSQtWbHrB076zAv4qxl9afOeF6NRkn9DJw0fMkdmpGRqUG91bPjaZjQEErL
         zq/A==
X-Gm-Message-State: AFuF++nVZ+W03kdKh/5jsaTr947NIKfcH7DuL5dGLOEcddFxv05dN7yt
	DcYNzNNLSiUpXuxwf2pUHmczUzZo53ws1MCLhihn0BUtWUtS6HRtvEA3
X-Gm-Gg: AYBFou3NSLMOeMrUwAARfgmMuVPhPi2zicOo8Z97Ai5CMdoEFM9UCPDxu+HU8sxNQx7
	04E5OPdSZOmiHOV/Hv9Eo9SX9cRAPaXF3/pFOGVPcUChOTddNxVal08x4Sv2U0TPaz4EwDfluJw
	AkXrZiBL4XOF1md7ZNnq/uKVaJobx26DuAgm2JuZl3Ts46gJZCng6ztMHdfmYUrW8w8iPuSfRBB
	NXUN3kEr+PvgIpq5pg743P4oUJ5r9ayfYidkxA6hrmOcYyKze+rjeyAci/yLIspqAS3ac9DjzC7
	GvfvA20NgECvWmGy5wiblj7OIcb+SeK63y1VeqegOkEGiSPGuic9HBOrahyTbcSOAKTfBqO6Q2a
	xtW+JgiFq60elHSh/plqnzZ3AdGVYNpbzLzrih4QcD3PDszS9T3d+/MlLQA5AfoNEohm4hcWS5d
	bPcFvbQtwa5ZFgE9euNsN4vcUVlWLAbeLxMMngZrWUvXaVxDbCRW2Ho/df
X-Received: by 2002:a17:90b:3c8a:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-396d10076e9mr49352310a91.13.1788261017551;
        Tue, 01 Sep 2026 04:10:17 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d777c329sm7452644a91.2.2026.09.01.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:10:16 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Veerasenareddy Burru <vburru@marvell.com>,
	Sathesh Edara <sedara@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next] octeon_ep: remove redundant memset in octep_setup_pfvf_mbox()
Date: Tue,  1 Sep 2026 20:09:11 +0900
Message-ID: <20260901110913.977745-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vzalloc() returns zeroed memory, so the memset after the allocation is
redundant.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c b/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c
index 0867fab61b19..e4175d5bdb3b 100644
--- a/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c
+++ b/drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c
@@ -274,7 +274,6 @@ int octep_setup_pfvf_mbox(struct octep_device *oct)
 		if (!oct->mbox[ring])
 			goto free_mbox;
 
-		memset(oct->mbox[ring], 0, sizeof(struct octep_mbox));
 		memset(&oct->vf_info[i], 0, sizeof(struct octep_pfvf_info));
 		mutex_init(&oct->mbox[ring]->lock);
 		INIT_WORK(&oct->mbox[ring]->wk.work, octep_pfvf_mbox_work);
-- 
2.43.0

