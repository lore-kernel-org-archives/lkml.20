Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687494;
	b=q/sMf3KkVud965NLXTNICJCxoJWdDuVPvQgsHvq5OR6yX4d8H3m3Y+RnCCYY3YOmpQLe
	 U+AZgJMMoFmFgwNUeioYHZu3IHWqTuNXL7POmuFHf0G2pmNVmMjKET/h+3pJ4D0xbe4H+
	 rpmJ3ecwEigaVndGX4QQLo/QKcfIFnqpXioJVD17mc5xrk5VaKfFsny6j3RE1+MrXN4Lo
	 r4uF/Ro3F9qomgJLXV7Dm2odeEx4WNFlRROlYFF1EVyNVK9koOACajx8EYjVwqNLLtvi5
	 gYAq1MCP4AOyJnZMrn8I9iNwHAkPN8EnctEOETMVESyzvm+mU1uQNQpUHmne0+XyEPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=8VgjHKA9D0wxTxAwTxM36J8aZ5zKUy8zacU7AGbzWa4=;
	b=wVC9RfFd+s8H0IgPklT1WtFVhgJObG2pwa2OAkB0AjDeVxU/hvBMF5UcOSB60KsdhuQ+
	 fFtzys+7zGe+CGFLrbfEI9COgYCPix55tI36oxpMLOwy6wDmZbYOn4ltjAPLn3qoInHWR
	 EXlZ/+CENKacfpexlQKLOm+w1U2BFRnENnlrNAykn8Ykpw3aYBOptyGvkgY3DhSEIyS/2
	 ncAXzqUDKfUj8kQDeSe2DUrNN5KIyG3i4TQJIJ7fLLHVv81nzzh1VW/1RiQgNBhssFizi
	 kGHTv1xo3p4El+5kyj33g7aALodF4b8O9UFctiIPFj32LeJ44aAVaFR0+HLW2+iFV5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWGUC7IB;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B691606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B691606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWGUC7IB
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so1998068c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793687493; x=1794292293; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8VgjHKA9D0wxTxAwTxM36J8aZ5zKUy8zacU7AGbzWa4=;
        b=vWGUC7IBi0doaunuvDoDPIwrMnt2kkEBNzqP6fKqAuSSVeBOuK73vpnhx1SA5IMZ6V
         /3+ePTd2p71e2RHPpp8QeJA2Y5j/7AR6GSfaBDw+Mhy0iS1l4/IyEU9o6SVFAx/TP1B1
         I5QFMxqSuKcM630W7yob2YzvxTOWzKXMQ5R12nG7Lz7HAdFyuAyL5SRzc9NVGB4028Ru
         avpsT98IC2O4fRBglHfvM1fNN8Urol82WxyFdx1NyjjWxH2v4rVF3FQizUiMx4ksDepb
         1AjyJHbThUCVQmsNTgJxWzlODPdMEjOEkfwyUNEqzUejpy2yFukay9uceOIbDwDoumw9
         vMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687493; x=1794292293;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8VgjHKA9D0wxTxAwTxM36J8aZ5zKUy8zacU7AGbzWa4=;
        b=frndeUXF2Qshjen75W/pqQkI8MhHkNu/KE56qx5h86VEd/r57FF4o70Mr7oOZPPGKm
         lYHIYronx9mJLHlzoEnExC2uavH9eObkbgwzZSQyNlMkfxiX4JRCNiydohB2ZeJUEyMi
         4gfVHTKmwInxQRsBPYMmxjS+KJna/GRNKo2QUxnihs9GFyk3vy5BlA8wVBBUYDfKmHm4
         cv9SXIBjC2FoHGc0A+GffThAdJpg4AVOc3bfb/okdCkCTcrLBUx8M7k0B2S9pKobS3J5
         2xwVPujYUvjNCbaub7/dlII6reWBWW7Y0/6/bNoX8zU6mwLQXEab94IJifXa1u+Ecyxp
         jsFw==
X-Forwarded-Encrypted: i=1; AKwUvBwC9krpJqB7+uXTkZiiENwQzogiqZWY4kBKCtlDBWbWv3ize+vNYrev3nuZf01TzCVv+l5MITSaOdpXiTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aUmnmtG+ftn4IWsH2cjV0vCrcKtzkx6B6CRSXhnl/IXT6pj7T
	/dxQV23jqviG1UHPDkoO0pcswC2O1IRr4SWZniUuqag+G5EVGq4tHRTf
X-Gm-Gg: AYBFou1Vzz2y3U+hfpRNWApSZUoqywZuAKldOphIGrKvHhZfUnNAKQQrmNoDFd9/u2N
	ehqRsBM903i2YK0OOdIKOTAPI1FPKjGAvD5nYZiV5ZV0pCNvLURX49+xNPBAexLwL+jBC6SJ62S
	lI7hp+UP2cG9PSDO4L/a896E/S5ejjTLDjXlJadl9/YI/fZ8ysZVdTD5+Ob4mem3QLO0ebttQ8s
	4WOlXoHrLq/PmbEeDiURf17XIHyeK+XSCpggHl0Cdfj+RPNTNsHWVCCI5aWeauE3e3QyLmY6mKj
	D/mN4ccoNrUIXbOcPC/X2ws4a+nN0Y3D3Y4aLs2zuH68udUKtAUksYYYxrE7NwJHPOYh5vt/vMu
	vJJSo1SZrbQqOC3lGE9xc7LBBSs1PeTODGwBGCG7a239yPSVmInrMTdHqz7LU55900o7Aky/EbO
	qtIOYxsVpM9F2xW8J89R8BANbpbMtAmD9lBcwC2o4U/+hZE9RTryxVKLjG0hmiCDM5NQvbjLJAL
	9A4XXpmqrrl/d+iX7DjqVq/wxwZ5hynGuj6fFCjP1Okwy36ZnNEJQEMa9Fb6vTxATgCGxxF+L4/
	fukpP92AakFe+sNUAQPcr7wO
X-Received: by 2002:a05:701b:2710:b0:189:ff2b:b194 with SMTP id a92af1059eb24-1ac5b9cb051mr17514114c88.16.1793687491593;
        Mon, 02 Nov 2026 22:31:31 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm45849488c88.16.2026.11.02.22.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:31:31 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Tue, 03 Nov 2026 01:31:25 -0500
Subject: [PATCH] nvmet: drop the extra RCU grace period in
 nvmet_ns_disable()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-bug-nvmet-ns-disable-rcu-v1-1-ff7ac5623923@gmail.com>
X-B4-Tracking: v=1; b=H4sIALx/6WoC/x3MQQqDMBBG4avIrB1IUumiV5EujPkTB9pYMipC8
 O4NLr/Fe5UURaD06ioVHKKy5gbbdzQvU05gCc3kjHtaaxz7PXE+vtg4KwfRyX/AZd75YeBDxGC
 HGKnlv4Io570e39f1Bxqjh+9qAAAA
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

nvmet_ns_disable() kills the namespace's percpu ref, waits in
synchronize_rcu() for anyone looking the namespace up under
rcu_read_lock(), and then waits for the ref to drop to zero.

Killing a percpu ref already switches it to atomic mode from an RCU
callback, so the ref can't drop to zero before a grace period has
passed since the kill. synchronize_rcu() thus adds a second grace
period in a row, about 4 ms here, and disabling the namespaces of a
subsystem one by one takes about 9 ms each.

Drop synchronize_rcu() and rely on the wait for the ref to cover the
RCU readers as well.

Disabling 64 namespaces through configfs, median of 3 runs on each of
two boots per kernel:

  host connected  before          after
  none            588 / 590 ms    409 / 409 ms
  nvme-tcp        617 / 619 ms    542 / 511 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 drivers/nvme/target/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index a8171b88035c5..8aca4b279bb9a 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -669,13 +669,13 @@ void nvmet_ns_disable(struct nvmet_ns *ns)
 	/*
 	 * Now that we removed the namespaces from the lookup list, we
 	 * can kill the per_cpu ref and wait for any remaining references
-	 * to be dropped, as well as a RCU grace period for anyone only
-	 * using the namespace under rcu_read_lock().  Note that we can't
-	 * use call_rcu here as we need to ensure the namespaces have
-	 * been fully destroyed before unloading the module.
+	 * to be dropped.  Rely on that wait for anyone only using the
+	 * namespace under rcu_read_lock() too: the ref can't drop to zero
+	 * before an RCU grace period has passed since the kill.  Note that
+	 * we can't use call_rcu here as we need to ensure the namespaces
+	 * have been fully destroyed before unloading the module.
 	 */
 	percpu_ref_kill(&ns->ref);
-	synchronize_rcu();
 	wait_for_completion(&ns->disable_done);
 	percpu_ref_exit(&ns->ref);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-bug-nvmet-ns-disable-rcu-30ebdfe414ff

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

