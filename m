Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AD3D5C23
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791701810; cv=none; b=Q/MAGkxOeMTFzORVuYousPhAEKUx5Te2H8RLwoVIpuS7FWrCHwytXjRJE3G0H3fbkPxxwJGAXqOkl6TEIM0t+Xy4x8HPXFbLmU7Af2JYuYozU6JOknagtIXAsND2rI0hzWBf288v4qM4m67ie+EKNbRPnKks3yQOR4Q5CErG/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791701810; c=relaxed/simple;
	bh=SqxyUP2+5lzjd11DSWnDLemNMB+Vlmye/xIFvhxSIYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsxRdh7JZ6KavKQsyQclAABkcX+GtoEyMhrczq7IzP4lGfHK+i6dDWWWtiEyYtrSAKzf3JdFDqR0hzitBAJT1GLj/aF7oY8BKZn+cv1ti5PFxXIZlwv6cbEqBuj4TaVPAWxUrwbwKoMwRdQEKRE3QioLFH1gz4iP018ODsTyu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=A9muKvqe; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="A9muKvqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fd
	EN2A4ng7BdJrB0oH7VAJFfVqjDUzZ2rL9KJG8Y+Oo=; b=A9muKvqeuEHQK1lxrj
	J7xQwP/mW2E9RSYs29NoZqo9+X4T3Nw4Dyq5CzVkymTU0b+uro298PMBOMHjFHxa
	J4lyfdan82w6I9hQT9ux+XCSMp413sB+a50IEpqVhrM70R731gXY6lqzcmmG/3xE
	8AJB0NVSZi0EXHeLa9KgOa7pY=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3f4kdM8tqsbd3Dw--.44141S2;
	Sun, 11 Oct 2026 14:56:29 +0800 (CST)
From: Feiyu Wang <wangfeiyu_mc_code@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Feiyu Wang <wangfeiyu_mc_code@163.com>
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variable wRxSeqInitialValue
Date: Sun, 11 Oct 2026 14:56:24 +0800
Message-ID: <20261011065624.23494-1-wangfeiyu_mc_code@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3f4kdM8tqsbd3Dw--.44141S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1UWF17ArW5GrWkury7trb_yoW8Gr13pF
	WrZ343ury8JF10k3y7tw4I9r95Kas7KFyDGasavw1F9ryfA3sFqFn8JF17Ar47AF1kJa13
	KF18AwnxWw4UGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ue6wZUUUUU=
X-CM-SenderInfo: pzdqww5hl13s5pfbu0lgh6il2tof0z/xtbCxB1hoGrLMx3RzQAA3L

Rename wRxSeqInitialValue to rx_seq_initial_value to comply with
kernel coding style.

Found by checkpatch.pl strict.

Signed-off-by: Feiyu Wang <wangfeiyu_mc_code@163.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 11351aa4f4d0..ba7e53140bdd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -176,7 +176,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 	struct __queue *pfree_sta_queue;
 	struct recv_reorder_ctrl *preorder_ctrl;
 	int i = 0;
-	u16  wRxSeqInitialValue = 0xffff;
+	u16  rx_seq_initial_value = 0xffff;
 
 	pfree_sta_queue = &pstapriv->free_sta_queue;
 
@@ -214,7 +214,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 	/*  So, we initialize the tid_rxseq variable as the 0xffff. */
 
 	for (i = 0; i < 16; i++)
-		memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
+		memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &rx_seq_initial_value, 2);
 
 	timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
 
-- 
2.55.0

