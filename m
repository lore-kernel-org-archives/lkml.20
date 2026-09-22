Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8841633E36A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790041573; cv=none; b=Yga/ejTM/qMp8+KT2brH0vGZtVTujuByi6BUToz8QTJTVaeqsN0JbiiGhmZXNlm2ojfVdZ+ZTlD5R4DHybSIP1vEpb7gg5t/HIbiTUvZnyjD3Z1jnCF5yOZrxzdzKiRhuhFCFtmTCQJtb7QtQv8/yqnXcgIBJ1MZJOa0F87u7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790041573; c=relaxed/simple;
	bh=y+XAD1bzLlPmvSg9e/3OC75RDcM7A3CrfnaE1zi3yj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=flUmuNvS6RM3Ss32y/udA7xKhykEJt65fbP50v5vCDGtmV+3LzI3Cds5Dro3T1Tbt0EqxZFg3Lk9ht3rSE2vMYkJS8FyaHWUxc9uZ9AQknBvd8QZxo62rshJ4Qj0fVCNeYIKIXdYsJXT1gk8rpdUTtY2SYoKI3w1hz4Va3zNPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwNHhgDL; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwNHhgDL"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd6so35118091cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790041570; x=1790646370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8xPShnnQq1RRm8SZPF19MXAMPQrqUo2Z2vKGdJI+3o=;
        b=NwNHhgDL4rP/C/q35BW5E+4t4rw7psMkxYpIWrRf7Rtw2yYmiE82xVbc7x9E69lbgL
         ccBJ6OPJkKusO0h8nCldSxZwLhojVaYSsXxJ5jf6JRHSk45SlmTy53ncHVocjs2pXq9e
         ji//CEeZUuuSUtYufvXJ4IVhufQN6gA6Z5jRHqZ6nS8atrvq1Zf/yCmeVbThH2PSobvG
         TMQS7qBTvmSJpMEZqfkudm1R5GpPeubd/iL0Gkzl6KFr/BAdbX/+YrLtfX37x7Afgf4f
         XdtRwkyY7O1UjXwHGT5CoK2lvrgXIP+17QaR27EcEuMtfiw3ql8KpKDbsCf9jy4dMoI7
         Us5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790041570; x=1790646370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8xPShnnQq1RRm8SZPF19MXAMPQrqUo2Z2vKGdJI+3o=;
        b=p2WqTA8yGwLiKyunjRECKEEvMi22yxRYQ7E2khXFaCV5r89QMlxEYpVTNwa/rcMFwd
         p5r6Vrh3txKnlCGqnakeD7DdPXaur5G6lMSgpcnDtjFr4awlr127msrdBeeoO0Q8nkvI
         9yPCWm49zbzyEaQIkS6lwDbpqgP2NbHEH9wRRodN3doVzk3HaFNTcGZoamCFk37T1p5a
         T15V212CDLFftnLP1VVfCIa4yy9/j3D8l3sP4BshgrrNJqKm0MqpyNqtR4V7mO4DJ+6e
         adg/eLqbjmOjYNZ4uZsQK/sWi89xKi8W+K1lTR0lD9hawgi+sD2AS+/CQqmI3TDVop3z
         b0Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzju1CB5gettn6kfE/tF2EaJOBTGgtkey6xPP2PaTOOEvW8YPGmgTPdvqJlxj3eGl6w22zK6kukwqVCvnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++moiPa7+9Saxw5/rMcaFEfVWo+/3VLmBhMuvVZHZFEDo/oLcnmy
	+Qn4Ht2skJwUMzcMWRzHXT+mhy8tWPhbKOgYywpkeJlk3hnQrF+2rs0=
X-Gm-Gg: AYBFou38u+3s6coNLbfdZcxQfXgK/NTsljTHgtEQr2rfH2EkXiygYgVpg3RJWf7eAFB
	l+UtA7QBEDl2ILoxyf78rv5e/J0tRN5lJBU4GWSnin5OAnxj+3/2j+sjqEBCWwgSO3uH9IKwna1
	tt6JrPwFmS8Smlog3GdSV83asrWu179/9D2P5B8GrBWhJ6eYWDyJuJwVcfjmVGaUiEv8I2ALfn7
	VAyp4SFZGO2WmEFuOdYnXpUDEaM23veQmy5jtOu/pn9bQP43TgEMS2vvSa36+vB4vwidQwYZ6a3
	3ejVEsaMWAb6HeVmKuBl477bh/l9rQhJosrTpaWJzIj0OZVUJM1m7Y549DhR7Qh6KI4MwKXaV3F
	YH2RgcVqq+1zWnEhmG67dxf8R8/gw9twiSgbkcWnXG0a3Sd8Si7lSQp7eG772t4q18HO2IUg3JT
	IwqVVQ9E7933lSxF1fCOAhwTls+nYjJc4SPLR1cFQvlnkq4UvDpAK4/ThNJP/v4SS2fOnWUpkDJ
	Q9FIdlf4LtmVVO34st1sMsP0U3tIOns2Q15ixB2mRl1JRv3JuF2k+MLdLvpUUf9PG60Kr9IHatJ
	Osp0BZFpUaZQgTXVN5aQSVDUepud
X-Received: by 2002:a05:622a:1cc5:b0:532:c925:c31e with SMTP id d75a77b69052e-532d8d34820mr37916871cf.16.1790041570399;
        Mon, 21 Sep 2026 18:46:10 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e17123casm1228641cf.3.2026.09.21.18.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:46:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Rasesh Mody <rmody@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: GR-Linux-NIC-Dev@marvell.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] bna: prevent IOC timer rearm during teardown
Date: Mon, 21 Sep 2026 21:46:05 -0400
Message-ID: <20260922014605.588040-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bna: prevent IOC timer rearm during teardown

bnad_pci_remove() and the probe disable_ioceth path call
timer_delete_sync() for ioc_timer, sem_timer and hb_timer, but not for
iocpf_timer.  bnad_iocpf_timeout() then takes bnad->bna_lock after
free_netdev() has freed the struct bnad.

Deleting iocpf_timer last does not fix this.  sem_timer and
iocpf_timer rearm each other: bnad_iocpf_sem_timeout() can arm
iocpf_timer, and bnad_iocpf_timeout() arms sem_timer from
bfa_ioc_hw_sem_get() when the semaphore is busy.
timer_delete_sync() only waits out its own callback.
bnad_ioceth_disable() can time out and leave that callback live.

Shut all four IOC timers down with timer_shutdown_sync() on both
paths, so a later mod_timer() is ignored.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1d32f7696286 ("bna: IOC failure auto recovery fix")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/brocade/bna/bnad.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index 8b75004ba7c9..55dfd4896785 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -2571,6 +2571,22 @@ bnad_ioceth_disable(struct bnad *bnad)
 	return err;
 }
 
+/*
+ * The IOC timers rearm one another, so deleting one cannot stop a
+ * sibling callback from arming it again.  Shut them down so a later
+ * mod_timer() is ignored.
+ */
+static void
+bnad_ioc_timers_shutdown(struct bnad *bnad)
+{
+	struct bfa_ioc *ioc = &bnad->bna.ioceth.ioc;
+
+	timer_shutdown_sync(&ioc->ioc_timer);
+	timer_shutdown_sync(&ioc->sem_timer);
+	timer_shutdown_sync(&ioc->hb_timer);
+	timer_shutdown_sync(&ioc->iocpf_timer);
+}
+
 static int
 bnad_ioceth_enable(struct bnad *bnad)
 {
@@ -3727,9 +3743,7 @@ bnad_pci_probe(struct pci_dev *pdev,
 	bnad_res_free(bnad, &bnad->mod_res_info[0], BNA_MOD_RES_T_MAX);
 disable_ioceth:
 	bnad_ioceth_disable(bnad);
-	timer_delete_sync(&bnad->bna.ioceth.ioc.ioc_timer);
-	timer_delete_sync(&bnad->bna.ioceth.ioc.sem_timer);
-	timer_delete_sync(&bnad->bna.ioceth.ioc.hb_timer);
+	bnad_ioc_timers_shutdown(bnad);
 	spin_lock_irqsave(&bnad->bna_lock, flags);
 	bna_uninit(bna);
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
@@ -3770,9 +3784,7 @@ bnad_pci_remove(struct pci_dev *pdev)
 
 	mutex_lock(&bnad->conf_mutex);
 	bnad_ioceth_disable(bnad);
-	timer_delete_sync(&bnad->bna.ioceth.ioc.ioc_timer);
-	timer_delete_sync(&bnad->bna.ioceth.ioc.sem_timer);
-	timer_delete_sync(&bnad->bna.ioceth.ioc.hb_timer);
+	bnad_ioc_timers_shutdown(bnad);
 	spin_lock_irqsave(&bnad->bna_lock, flags);
 	bna_uninit(bna);
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
