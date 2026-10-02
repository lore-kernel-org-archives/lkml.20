Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A85329E44
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905613; cv=none; b=TxURa7Y3SgTT7+KhlWOYS8ipJoUeuwHhTyJAIdryftmpgEWjFOmj6yH21GAMT0EX7cu9fmQak1u06KfBFZ+E6E29X9P8FSBa0i/DNC8yEGHt8pFBjWBlZhcEI9AXCzYNyUdA23PbPrLEMpkdp9lOQ/mRooNhFeS15BuBOgTEN0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905613; c=relaxed/simple;
	bh=xxpB2jwe5azO3re9zH4Z/YdtheseiTTn/JGEg2+tn8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZjXRQimwF3dAgDFTCl12b/Wd0AudFHTbBhP/x787UyEq6LOLiteP0ZaRLu4gS3HbvM1RjS2PqvkC6v1dLkBnffddhgDXQJC+C7EJ6qzMFATrhbiG5ph/60vxWGhArehEDgp07XCJrL8NUq3Eope5jwslsNbf8DJRQKN50Pm+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAFpI9Lk; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAFpI9Lk"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e494adf48dso4288425ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790905611; x=1791510411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2wsEFa9thSjTMNoA10sKZHk9S1xMHrcC+a2nLtA3sY=;
        b=sAFpI9LkCkpPli6Dbgbvdsvrp1xYMz7rHRtv2XJzA06wfcWMBgwxOcxA/kigWFp+TE
         dv+unKktwNemkAKhB5ZfuvPfdEw2dlG69To5vOQ3whSGbSImC5tTN8KrXvbnxjIqbPE9
         ZVkgsa/grsvIVNcY6DV5GU2GdVzckhRDRf6ToiPEiuFk/hbmkKT0vKLhtNCTexvMeX7F
         OqRbg6vdltSZ7hbpMRsK4nPfMReegQvIKDa2lE8atdrsj/+vvbFWeJx2LPtMEnMnqUAG
         EK4TabgMkbO3LvwjooOidOi1vlasXs5NQfFbDkmxRC/Efpn2Xnjb4+zHOuyxR/4WqYS4
         6OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790905611; x=1791510411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2wsEFa9thSjTMNoA10sKZHk9S1xMHrcC+a2nLtA3sY=;
        b=wlwEGicdBViGp+vqR/Uh3/MghDpzMvmY2NVkY38KRrACvs+U7XQEUWKGO0qaHVlYrl
         qpzj+RgtqcFu9opYnDkxsbNx8wWUPs7u1eZLlOtTkfKAcFj7dtHJcRDuRWGkglv64vaz
         AEjRQ/y0mA3PgFwfPlIH7QkxmebfPFh3TeeyfsmGA+M3LdoMM0t62aj81zaBINPCe4JK
         o9XNH/qQu6/gM49RUx5rLS7OdBOS5JQx6Yr69VNrpNGB8Im+5/N7ASXr2KpHuczpc8qS
         5IFr8cHJieC8W6NGoF6e17copH1Qfz6yTqUtsFpK2V6rx/0EV9Y3pxhAsc7VTQvzEcHh
         pbLA==
X-Forwarded-Encrypted: i=1; AKwUvByoeJWa++P/Yj1bPDoviNc9P0l9kQblm8NxaNsshoImrTZdxBSte+K644w6ZwRLqsfoIBtPm16sdM+yL44=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2d0tBgeT0XwXAlTjKrx+2WdSJu993le2uyqZ0jytuMFB4XLN8
	QYjNSKHV4Nte9WH0SjCVZfrlf4TJhnlJRKiC2bxTwuetO7jzj67weBsD
X-Gm-Gg: AYBFou2HsUOM1sE4KAJFED3ZWcGX63i+dyzWgUBAT3E2G9hjsIoANsfr4zmtVwdnMAq
	NohpsZANyJWLQ04DG1CvhEHaoj4Zom7uOkg1/CK/jPlkFn5kyeCJbqMmizNEVsrag40ZizxDzpN
	3gSPsaSQ6JNWnLkBaO2GwjU/9FwjgWNuVJyA0SxrZ4oWvznuhmmT8xTCJMy7xhsu2XpSWixEtuz
	BWirRxk5HbgnFE33DLZX5GGGylozWu8vjjUHjHk6AZUop4aK5OVPWOA+1rmPO6A314ETPF+N6HQ
	KQpoITSEct/RDyeR4jH6Xa37xWjSopO3i5scLkE212MDKODP1zg1eiRxES+3Pd+04cjdyrIFp5Z
	Pfj2HZnIwaqiSdLKdLzjxCgz/m25oZ6PkyHV0bzW6qbrk2U61RxAxN8Yuh9EFGvizMyJoUfeoMA
	h7xOeyAnBJmPDmlubyNbPVGNoYWTrdUebGAhcMDOqS6oBFUB2AJNwWkejdCF2ofDH//pN0IB8+M
	rLI4d1dSpDUSwWDBE4Y
X-Received: by 2002:a17:902:d4c5:b0:2df:90d4:1188 with SMTP id d9443c01a7336-2e499f095e2mr11857445ad.7.1790905610260;
        Thu, 01 Oct 2026 18:46:50 -0700 (PDT)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ceaedsm2675645ad.49.2026.10.01.18.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:46:49 -0700 (PDT)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	johannes@sipsolutions.net,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v6 0/4] net: wwan: t7xx: fix DPMAIF data path vs system PM suspend
Date: Fri,  2 Oct 2026 09:46:34 +0800
Message-ID: <20261002014638.47981-1-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a race between the t7xx DPMAIF data path and system PM
suspend, plus three pre-existing bugs uncovered while fixing it.

With ASPM L1 enabled and repeated suspend/resume cycles, several DPMAIF
data-plane contexts take a runtime PM reference and then access device
registers. System suspend ignores that reference, so these contexts can
touch the hardware while the suspend callback is tearing it down. The
observable symptom is a CPU soft lockup in the TX push kthread:

  watchdog: BUG: soft lockup - CPU#N stuck for 26s! [dpmaif_tx_hw_pu]
    __pm_runtime_resume+0x5b/0x80
    t7xx_dpmaif_tx_hw_push_thread+0xc4 [mtk_t7xx]

Patch 3 is the actual fix: it quiesces the DPMAIF data-plane contexts
across system suspend (a freezable TX push kthread plus an explicit drain
of the TX-done workers and the in-flight NAPI RX poll in the suspend
callback), rather than marking the data-plane workqueues freezable, which
the v5 review showed can deadlock suspend.

Patches 1, 2 and 4 are pre-existing bugs found while developing the fix,
each with its own Fixes: tag and independent of the main race:

  1 - runtime PM usage-count underflow on the -EACCES path
  2 - use-after-free from the TX push kthread exiting on resume failure
  4 - a NAPI that is never completed on the "RX queue not started" early
      return; a later napi_synchronize() under rtnl_lock then hangs the
      network stack. Patch 4 is argued from the NAPI contract (a poll
      returning < budget must call napi_complete_done()); it is not tied
      to a specific reproducer.

Only the DPMAIF data path is touched; the CLDMA control path uses a
different mechanism and is out of scope (t7xx_hif_cldma.c is unchanged).

The data-path fix (patch 3) was tested with 500+ suspend/resume cycles
with a SIM registered and ASPM L1 enabled.

v5 -> v6:
  - Drop the "freezer as a global quiesce" direction: remove every
    WQ_FREEZABLE annotation added in v4/v5. Marking the data-plane
    workqueues freezable can deadlock the suspend, because a
    flush_work()/cancel_work_sync() issued from a context the freezer
    does not freeze (the FSM kthread, or an unbind holding device_lock)
    blocks until thaw_workqueues(). (Reported on v5 review.)
  - Instead quiesce the DPMAIF data plane explicitly in the system
    suspend callback: mask interrupts, cancel_work_sync() the TX-done
    workers, call t7xx_dpmaif_rx_stop() to drain the in-flight NAPI RX
    poll (the freezer cannot park a softirq), then cancel
    bat_release_work and stop the hardware last.
  - Keep the PM freezer only for the lone TX push kthread, and use
    kthread_freezable_should_stop() instead of try_to_freeze(), so a
    concurrent kthread_stop() is honoured while the thread is frozen.
  - Fold in the pre-existing fixes previously deferred to a separate
    series: the -EACCES runtime PM usage-count underflow (patch 1), the
    TX push kthread self-exit use-after-free (patch 2), and a NAPI that
    is never completed on the not-started RX poll early return, which
    hangs a later napi_synchronize() under rtnl_lock (patch 4). This
    revision is therefore a 4-patch series.
  - Do not touch t7xx_hif_cldma.c. Restrict the commit messages to the
    DPMAIF data path; the CLDMA control path uses a different mechanism
    and is called out as out of scope.
v4 -> v5:
  - Fix freeze deadlock in t7xx_do_tx_hw_push(): when the TX-done
    workqueue (WQ_FREEZABLE) is frozen first it stops draining the DRB
    ring; the kthread then loops indefinitely in the ring-full retry
    branch and never reaches try_to_freeze(), causing a freezer timeout
    and suspend abort. (Simon Horman)
  - Extend WQ_FREEZABLE to the BAT-release and CLDMA TX/RX workqueues.
    (Simon Horman) [reverted in v6, see above]
  - Note the -EACCES underflow and the stale kthread pointer as
    pre-existing issues to be addressed separately. [done in v6, patches 1-2]
v3 -> v4:
  - Drop the tx_pm_lock / state-snapshot approach entirely and use the PM
    freezer instead. The previous approach deadlocked through the runtime
    PM wait queue and opened ISR windows by writing dpmaif_ctrl->state in
    suspend/resume.
v2 -> v3: process fixes (Fixes tag, changelog placement).
v1 -> v2: save/restore pre-suspend state; wrap pm_runtime with a mutex.

Tim JH Chen (4):
  net: wwan: t7xx: fix runtime PM usage count underflow on -EACCES
  net: wwan: t7xx: do not exit the TX push kthread on resume failure
  net: wwan: t7xx: fix race between TX/RX data path and system PM
    suspend
  net: wwan: t7xx: complete NAPI on the not-started RX poll early return

 drivers/net/wwan/t7xx/t7xx_hif_dpmaif.c    | 24 +++++++++-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c |  9 +++-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 55 ++++++++++++++++++----
 3 files changed, 77 insertions(+), 11 deletions(-)

-- 
2.43.0

