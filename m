Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1481A3876A0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162487; cv=none; b=i04LQsptCkgKUBT9ADEyPhzHySZXTmXihnrHLi7/aK5WKKnpoT0dzejcU8q7KEXGO1RhQ+D9ARDsdZ+cLB2uZneZhj6V258FqpuByKu081WtwcRSynXViRDXOtPFAhQAt3C8EF6+33XR3fhI0fdJpWHJ6ERGw3XnD4PQxNTQhDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162487; c=relaxed/simple;
	bh=C24Y8pYzO/aPrLA9AMl8TvcQHVpbwYHJDkWQ8XX3CzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3CgkHzuRuANHnRBnynBKdAUVZay3f4XwDVpVy0/IEPVw+xtdlL7Fr6xe+xRDQQGECEpPjBHMY7YlAAvJv4H1yILLTCmgazX/1Xe5nXy0my6tAxgVMnciUYaZeueqFoHDKHGy5fWNavpqBoeKCJHEH118nfnxekhx9xVi/qIzV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2Ftfp5J; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2Ftfp5J"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b09c273caso1015028f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162484; x=1792767284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hZGPnwDEfX+nqOzBQskZPmMNJTIRqNPt8gbd4kOL/U=;
        b=i2Ftfp5JcX3Ok7EEeo+AU5BbuhXJs/sdV5zRXlENELgCFXkWhMaFm1wY6GsuL3YDEX
         A006cAW1cY8diJj08KNFzY88NVhhFbMs9LEmLhv9GSqF8xudFxWovM29tV+KiNstx88e
         sck7UqVpq/6n8wCWm+3nsA7/ifiFXdX5HnimGXivO4sZIEqbjHx4CGje29iIH+7QDf9h
         6lD7m405LKGfp8rShNGBPblhz8nffET0KL6JbDV+SjL239VvEzVlpoVjPPIX7iZU41X+
         4Y459Gjq1iXqCqZkW7Q8XllGh5G8I5AQiFQUT2KXZ257Af3/uZb0BSoFGvBD/Qw7TPul
         aDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162484; x=1792767284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hZGPnwDEfX+nqOzBQskZPmMNJTIRqNPt8gbd4kOL/U=;
        b=IRES7u5MhuqGYNphyhCq93OOgHbccmRdHOmERaoJnTDLqyHHKMcmlTvs5n8siu0OR1
         OEA7RO8aMt3yOeCH2t23Wry95hNvRivtNnO9bAR5RnyCci449mZNcaeUK+dIUzQQLMtb
         pU1Zb1rQorkSxBgcGb3baayEqZ3HIB/9NxkcX0AeoXPgREfD0AxCYOxEB0p6Aho1xIx3
         rBWOPET1GPKrAMEvpLNWPRuVj7gX3bBOfex5rrlUzjKBNvFLUA+lJArjZAp7DOvW0uR1
         csWscwjmxESSVNVvusUiXI5ZnVnC7HFx8wU+AT0XxDOQoHqBY87cw3/9ry9bsdClwNMF
         jq/A==
X-Forwarded-Encrypted: i=1; AKwUvBw6zs2d4btYtsk88lqstqmtlJVTYPcPINGEOYJQaocDkjBiZLMVa9j7iKm8fSN6BgjN7Dd4lK8n7QixiLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI071wNR3UOvbLS41BPAw/I3SbmWdBR4Pn0S1/8vs+ifA3ASWQn
	1BKcPnvH9fZEudaWEWD16bC0gGPaKNQifLatwGq29mz9REdLe46emDks
X-Gm-Gg: AYBFou2vdUEdlowkCtu9xPiRlwReS2CfPFTofdXpbBjG7rgy2egp8T2s+mjl6+rjRNL
	oQIWBJWJFKfEvCojX14PrdntsCbua2PCUspgsU/UdE7knvNCfVPmvM7YeOaBFrK/wJNJFTfcGNS
	iEE1RDXX14rYkqsb4G3+T5g5tZBJnVf6AJo6QOyRIQF3TARptOcS5XRVEnUTxsy14iRaahNLk0I
	q5wBvym8RuziIssv5U5GSPeTOgAvDrmx2sW7Vej1mJgYWrbwPVuZ7gy/Du1InWmRvDl5PFW/0Ry
	LgUa7xu29jL6a1Jw4n9WfY50uGG53behjm+BmIP0RxXD1ThfwdZbu0GSw/0qe2MMHvCpOiv0DPO
	TI0RWxDSPCPS0zXSNDuVnA/7w33ZtsdyN8zU1QrxYftNXMsKw0b0a2TN0uji//KQko50CJXVh6j
	HeAsk9faE+8B1vDwhia9VzOV5ucF1nuixjaBQsuYmAVTaztCreyAE4WzfBgcH73sPTOQvm8ZzMN
	qR+bf12sGKR8dCdcsXxF/SxEbm3ArsD94gXXN0DIHQPK6gEl4kDphOG27kM+CVUUmM=
X-Received: by 2002:a05:600c:37cf:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4a1d75dd618mr1120995e9.1.1792162484113;
        Fri, 16 Oct 2026 07:54:44 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a9ea3bsm50046305e9.0.2026.10.16.07.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:54:43 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	David Carroll <David.Carroll@microsemi.com>,
	Raghava Aditya Renukunta <RaghavaAditya.Renukunta@microsemi.com>,
	Johannes Thumshirn <jthumshirn@suse.de>,
	linux-scsi@vger.kernel.org (open list:AACRAID SCSI RAID DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] scsi: aacraid: fix dma_free_coherent() size
Date: Fri, 16 Oct 2026 16:54:12 +0200
Message-ID: <20261016145420.50870-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fib_map_alloc(), dev->hw_fib_va is allocated with
dma_alloc_coherent() with size
    (dev->max_cmd_size + sizeof(struct aac_fib_xporthdr))
    * (dev->scsi_host_ptr->can_queue + AAC_NUM_MGT_FIB) + (ALIGN32 - 1)
but in aac_fib_map_free(), the same buffer is freed with size
    (dev->max_fib_size + sizeof(struct aac_fib_xporthdr))
    * (dev->scsi_host_ptr->can_queue + AAC_NUM_MGT_FIB) + (ALIGN32 - 1)

This could leave parts of the freed memory mapped to the device.

Change the dma_free_coherent() size to match the unmap.

This was found with static analysis and only compile tested.

Fixes: 1bff5abca65d ("scsi: aacraid: Fix memory leak in fib init path")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/scsi/aacraid/commsup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/aacraid/commsup.c b/drivers/scsi/aacraid/commsup.c
index c4485629f792..cf0ae251e43b 100644
--- a/drivers/scsi/aacraid/commsup.c
+++ b/drivers/scsi/aacraid/commsup.c
@@ -81,7 +81,7 @@ void aac_fib_map_free(struct aac_dev *dev)
 		return;
 
 	num_fibs = dev->scsi_host_ptr->can_queue + AAC_NUM_MGT_FIB;
-	fib_size = dev->max_fib_size + sizeof(struct aac_fib_xporthdr);
+	fib_size = dev->max_cmd_size + sizeof(struct aac_fib_xporthdr);
 	alloc_size = fib_size * num_fibs + ALIGN32 - 1;
 
 	dma_free_coherent(&dev->pdev->dev, alloc_size, dev->hw_fib_va,
-- 
2.53.0

