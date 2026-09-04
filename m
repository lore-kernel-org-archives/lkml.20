Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0347668A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525083; cv=none; b=qDx5FcBhK+omvogozevG1W4ZUJp4x7+n8M/xn/Zp/lAjFc78/3XTeliTJPCfGxEnxYPecY1s9cJfthYic7x+qF3kLUmDnPYAcoz17z89DQQPrUEOiU+WfCHZGaMIXtACHzw9i3bxM9Ix9SFq7oY45aWxR15ca8XkECHqZGnbNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525083; c=relaxed/simple;
	bh=T5b+d/OS5/eYcnEjmtuH3aLFvdcVAyfOOmY8HX2kPnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dduFluoERUq6lbCTlxGF3542rZ6sBNCFkU6pIbTRLhh66X8nJouynIv/FUkcV9KTIZ9v9+hG9CPVhaqhB15/PHzDgEvg+VnSuaf+bUjMs0iS71YHBi+EPtLMxub04uKW/41Oz3vZZDfiFLYtcBveeHtg8QKAAbGD51hXRe0lpM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWP+9G+m; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWP+9G+m"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so1064857a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525081; x=1789129881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+j20Eu0FfzlcTgOQzGHgkUj59C3DavZTxLbAshT4k=;
        b=nWP+9G+mKQoMiYe6yYTj7f9ct+eH+Q/02ZR4g5n/r9yhuVQL+ajBeOXmvtiPkVhf42
         jAqMVRIGFWFOO632zvzdCKA53JbCv15YVtOZIpom2jZlgxoNe3Q3+yjfBoWizOY/nQF4
         Sl7uIb6G63B+C1e1ngXiaLu3BZruq99j/NcOuv3gWwfkccvZtRlA1fWB18Mm0SWPxCUh
         nTNczUzHVbNC9jOdEdF0AAGj8J5jzgVbRS6ST/ihS+6+6O+elfgx//gtYygXtR3uo1Dn
         yWnLrpp3/o53RbeISbabSpWr+LzKCKI2FWh98nWtu5IFPFEAHEJIA17mNZMKPfFadyz1
         sUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525081; x=1789129881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+j20Eu0FfzlcTgOQzGHgkUj59C3DavZTxLbAshT4k=;
        b=od2rqvYFbXlGN8vfuLOX5ZPoXE+FBoikfIhaFK+rTa9wo6zL/LcNYN+x6bzUjEv6+R
         UHcTbBhoUaOOXS6uwXYwWkdvuRBoGtQzV/8UosWoyXc5z5Sz3zzUqMClwl1Flxk/OQfe
         SljbuZryR6SeatxZ2fWmIlXgVsakBVd+C/frkVlgqPb2oXCZfH2p/gX2CTkWdW8aTev/
         BDyws0monO+45OebUy1hg2tACcnwYXnhB+Qn1Dm6p1yoLYewnOre0FgDP65LigoBkn3/
         Uroh5ET+7wyD+1DOExlLWVG3Rr5atPGFoa4JCnhhx/55vAekNnHotpTxTul1tDIU03KB
         zOsQ==
X-Gm-Message-State: AFuF++lv7gi9y9zxtke6TmOVabi6phrNns2YWgc76AOAciHWtCSmtTiG
	1jm9jz84Qg1js70IRvAIsfAkazWf5C+IGtAgWuXfwU9PLL+nufPb09fM
X-Gm-Gg: AYBFou2MprZh3L4ldHviJpDAbRs6RbH3YND0WyGc6o/2ugCagO2LGgPvA1CNBPe6PrD
	ukQNx8bM6tWZQWTx5Po4qpHc7L4J9+8KK6X/eIT2LdL/XPliNZKAXOoTWiObcHylcSuyA3s7YSR
	l3SfHrGNgvzy06IWh5zuGqs2y6cHRLzP3Fn2OE5m/xmOq62hNfP8I8RUMSqr5n0PU7CZxUka3qT
	ROGgnudh9DHNHUv/lancmqWvaJYc5t3Mf2kd7Q8/cnI1xbJTQmPaLOFgLsMbk7MaXYJZW7qXbl4
	zdBhX/I1CLvNS3nxO/pzLo60jvEGVPZ0m51Ki2SdLJPC+ctGzbbF1dgpVk/nVrIzPWmETJ9zy/0
	kzKd65aQak+SfeJFhPUwBmwLs6Pu8D383z4zpNShAs4nKeIHamAF7VV8dOPdrw6bW0LICVWMo+R
	lhdCTBGyACf426zRFYBy0uX7drEqNiAtfcvYfAiKIKGrb2KSgYf06fBJGxyJggpC9AqWG0S7cFu
	+ODIf4dt239xIs=
X-Received: by 2002:a17:90b:28ce:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39b26100cbfmr9757473a91.10.1788525080469;
        Fri, 04 Sep 2026 05:31:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm4447030eec.17.2026.09.04.05.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:31:20 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org
Subject: [PATCH 2/2] ata: fix repeated words in comments
Date: Fri,  4 Sep 2026 18:01:08 +0530
Message-ID: <20260904123110.35532-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123110.35532-1-hemanth.selam@gmail.com>
References: <20260904123110.35532-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/ata/libata-eh.c      | 2 +-
 drivers/ata/sata_dwc_460ex.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index c93c24b22d9c..630e6d44190b 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -923,7 +923,7 @@ void ata_eh_fastdrain_timerfn(struct timer_list *t)
  *
  *	Set ATA_PFLAG_EH_PENDING and activate fast drain if @fastdrain
  *	is non-zero and EH wasn't pending before.  Fast drain ensures
- *	that EH kicks in in timely manner.
+ *	that EH kicks in timely manner.
  *
  *	LOCKING:
  *	spin_lock_irqsave(host lock)
diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 8e3fc713891a..b0c069a02cc2 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -1071,7 +1071,7 @@ static const struct scsi_host_template sata_dwc_sht = {
 	/*
 	 * test-only: Currently this driver doesn't handle NCQ
 	 * correctly. We enable NCQ but set the queue depth to a
-	 * max of 1. This will get fixed in in a future release.
+	 * max of 1. This will get fixed in a future release.
 	 */
 	.sg_tablesize		= LIBATA_MAX_PRD,
 	/* .can_queue		= ATA_MAX_QUEUE, */
-- 
2.48.1

