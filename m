Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96D78F4A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774515; cv=none; b=Stnrj3wCr3aRRbFsnKgYiIhkzXvDmRNyKGK4r1aNYeiaC9ZLiRq0eiDJLr/EVd+FDW2pAvw6k0JKAAEN003SuqP2tWfZ6U+XI5Gla9B3+ZyHS7HpOwmcCjmxtd0ClaplGhRY7OW4AknfIwB8gN7dUVJ01uTe8pME1JleY0Te2Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774515; c=relaxed/simple;
	bh=Znhy9yn5b81v+QAcdiMnxOmRxxBxG6BRBXmGN4tWj6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f+px7bfVO1TCRZaeEzGYYHKgWVu4FuDZzndtZLyKbVuENIpALWFwyk2oMn1N/rnJWpp/2zMf1EgubpBD6mjasTXfTvCdbmVLRQkYvb2ztSvjvnuz0RSw7MinLguuZwOCaX3uJQjVLHS4mq7RjURHNjAm86FA1hEWg+xNKyeJAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ALSwTc8E; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ALSwTc8E"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e9c5960so3342286f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788774512; x=1789379312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rozep1Nd9gPmq9At2RT1kz9pDynd1CZ982/t935zvDA=;
        b=ALSwTc8E9uU6l3XDxrKufs4RX6f932myz+3sF5FE9VTdd3u9aBtMyNG55yM0zbXSEN
         7mtuDyYywyaLvH9XsrHF8bV4M/M9awMxqY/ZdT3BF0jYxKjSzwTr4W/QHzeFmEzTJRKK
         wi/gE+7kiC/V79oCk875HqdSt7EqPnCzJ3X8fG4sahOqacgeOoFCjPOfI0N4QR1Jh38P
         fmam7XDGdCgL2XHLN53u/FBFACGxTE7GGV/0KDAS1b1mHPrKrtHVsBO1g8+J4VUXYvab
         KOlIVtYq/q0hDgQGsnfxSbsmi3kkvZn0X11bjGS/sjmx/DVsbJL8+jdQLkjf/PtFNPf2
         NnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774512; x=1789379312;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rozep1Nd9gPmq9At2RT1kz9pDynd1CZ982/t935zvDA=;
        b=q+38q2kHBd3VQtdK8sa74BEBvLkGPt7fKJAfcJB+UxAv643PU4JXKGwyWsozRw6b2n
         fabgLXq06gm+wohskom44SRM86K+CZibJ/BfsXy0dhEEk53XUKTvnkczkga9OVn1J1bW
         Q0Af7l99keznbtDKGstuDVwXeeIb+RYu/S/Gu2AYh3pDdsflvQtjuQWUhbkr+U+dZ0Sx
         cOvZvFVgaMCY0H8YTBFDmg9AQkgOWhDxZZKrHxeARCh0/QtwqhxmYCYSxRdePJY9VTAq
         fuWKK8sYZTrSPFdd1VKQZTlj3CNxYSpdJUoooTzfK1NiyAhQxDQPSoEwfjCz4RR1MiNk
         B5RA==
X-Gm-Message-State: AFuF++lMY5Y0x6dU6cPO92HlJAviACbGWv8Lb0uOlL6EyGv4YfAfsWj8
	8CEyOa4wTWMhlE2YEd+engR40fKTXGFsVUheFpvlrApIVMR4Z86LFfn/GcbglGjxTw2rvE2N8Zy
	3dSlXxww=
X-Gm-Gg: AYBFou2a3vrHKodGMdCn6ox4pi3aPoj4XRPiNb7fZ/MIgs+zucxmoQyr8vByOMSWSZT
	5fCed6rBCt1IAf124Og33S0x+tmZpH+yxa68UZGjGlwOrR5uwftLS8mSwZsZV6B7iZTdwG4xGJs
	Tj7aja1nmyOk+S0EGTK/DtQnrdZZtfXgD+u/NEEaTfYKSe9Z3Bt9x6kIv/Oyotd2+JRvP/1lc9P
	EOu2qerfWIvyiY5REcjUAa/BW2PumSqMIBgxyrdSdeU8lT+S+rJs8TQG+wLZqwc6Ua9vlGvx4U7
	S+CfPZAnSjnQJOdTeVIKeqX657/UxDBzgAbxAlf8l9/rByYfovh9gRSiM0aA4JZAPMlS+AuJ7mo
	t49wtAmlSqLYCXi93y3TGLAXnrwVf6n5Lg6LXDEz9xAZDLQhA1jA23Mxx+VKHnRxJBO6HCJ1wl9
	2f614US98eIqKHFJac7zhDlHYHjMn0bFAbC+JXgVLmV5+JoNsPs/VAuV0qMc3AXwG0gsHhPtPzF
	xxL1IFfbGyiUgqYh/QBAA==
X-Received: by 2002:a05:6000:41db:b0:485:82f9:44b4 with SMTP id ffacd0b85a97d-4858709c044mr25136906f8f.7.1788774512475;
        Mon, 07 Sep 2026 02:48:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm25976318f8f.28.2026.09.07.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:48:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] Octeontx2-af: Add WQ_PERCPU to alloc_workqueue users
Date: Mon,  7 Sep 2026 11:48:22 +0200
Message-ID: <20260907094822.121457-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

This is also enforced by:

    commit 21c05ca88a548 ("workqueue: Add warnings and ensure one among WQ_PERCPU or WQ_UNBOUND is present")

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
index 937b085582b5..b8f81e068f53 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
@@ -3371,7 +3371,7 @@ static int rvu_flr_init(struct rvu *rvu)
 	}
 
 	rvu->flr_wq = alloc_workqueue("rvu_afpf_flr",
-				      WQ_HIGHPRI | WQ_MEM_RECLAIM, 0);
+				      WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!rvu->flr_wq)
 		return -ENOMEM;
 
-- 
2.55.0

