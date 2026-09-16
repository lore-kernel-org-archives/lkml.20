Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0FA3603C7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525811; cv=none; b=Ig8WTxI+ItnEPE4PsjZUbp/dd8IU0ke3RidCsN621k0XymY2cBZ+MAFByNYFP93JZhlnFAZMjKEuzXy2GUn4Fo0qP9+kAbyyTsVxJeADxcY+77BwEeeBD0bxUTTXuv8O331oaxCad7dLOYvGsEwj+u4EVZEDrgX9L1H3LTQ0XJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525811; c=relaxed/simple;
	bh=lRZjMrGJtMkO5fjKjctGS+IB0XlrEM2bLj8+OXK50P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Al0ZLX5zfozOUa0RXkA5tyYdv1qo80drvGcV/Y5VsaCC+++Iaf+8sBmTZorsBKhUPQn2WVC6jlQJMpr6Ialm7LayewfUCxxnjVL0vQU/9Dej3tWdxV/MBq9IhMEBJBCLgE07qTuctOLgwgbnkjt3KwmKu3AIXwViAn6rifpQoms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQBS+w4M; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQBS+w4M"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a34907so409894b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525806; x=1790130606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvCNVHGgMCfVbha0X/YNf7Xfe8skNfPu5j6zn9xlEcI=;
        b=FQBS+w4MMi/Uv3n4LLkSoqe3UX1BDa/HJxIfizMN9/O5fP1WezlwxnKj6ixAQcGO3W
         xiKI9wsEUMILSNfgOJB91Ic4JUw/imUOS2uzRuyhBS6TelpckdeiXNAT5ttlwdOLAv/D
         pxuGSdvsDkq9EXoYXf7U+6V3Xxpcg74ZnjlG2Pjau1DFkziRtt31m5VRYiikObbhCVOH
         7NgPqUk+OIk1LPWBz4z5HLvMDtvGW+ziRF7XN+uPEH1DWrnYlXly9FmosOJLlrEZ9z2j
         PzRL05BYo08PDAaRj+uqpbBO+tqSsSEimxS2vy5BodTKZxLnG6rHaEhC8L6J2qvSErNK
         SZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525806; x=1790130606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvCNVHGgMCfVbha0X/YNf7Xfe8skNfPu5j6zn9xlEcI=;
        b=h8Kkz47ZK18psFoFCrLx1KhRBDhNZPnPB/0qvjbS4/+XpbKfC7eeDw5crJk5R3KRX1
         /UxO0roghmd4/7gUJ43pX3+sermf7JIvi5g5kdzpZtGvXxwUKxkevfUm1PdZMB94mX3j
         J+k1yEN+jhs3DXC5ZF6MWaQMehK46dLKsHzBe/ieQMZFY1uiMUq4wqWOW2Ev5xuj1r4d
         5wr0AlZRBrcBIQXDI9a1rr6qpHT7rF/+aY+EaRLOQL+AgvFvidsmlTa6NQVd39U8QmNT
         K26anAdjgQqHdstiJG8fmlBfwzmOyM6DfGiHcpuVgdhgememP4fyOu0zYZEbTO1q7dX0
         v+kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqiSJ6orGxLVRmLaAvsiDG7M6+qHylAVXU9sXqaqU0jbZBb937F1mGxEnPFSHJBcTUaukO/V4uWc79wf0=@vger.kernel.org
X-Gm-Message-State: AFuF++m/GE3Vc9CMgdDPoqdYzSbG25PIYPiqjGImmmms9lN1pnL6TclP
	J/3hA2w21jp6YXah7XBGPiLkU/S3XAPUpJMt3NUiu41gOuHdBJAAKEjn
X-Gm-Gg: AYBFou1cYVKFPw8TnxfIUO+CKxY7DSnmyHOrC7Ic1UXjUlNTy8xbZ0YoIMfiA37kzOq
	iT4HbcgLd0Ssd/zXvzw+1JlGtp0Y9+KKLWu7CuQIkqlpp2kWs1XEJicO2f+jlhXjp/nz3ufkW31
	1dbp2Oj01qADcglmZQGsTa1IAjieDW7Q199pTS4etjKS749yOqiVLdxxt7LC1SATcZ2juNX6JZc
	DZuh3NHi/BcEO1hFf+oMMH7A/IJ33Bd6VGXL642ANNzdFXSk3x6k6bIXBeJrtHxV7VkjDM1RvB2
	5FX9okKdZjoLsA5ADvUueMyACZOk+IviutDXdrh8Z0d23FJgOPUmyI41RPNwu+1+1V4xCrTAEU3
	qFonAKNiu1AxH69BftCzPNylI11PA/WoS1l46jrk0NwbDor+sOWf/Pc+vgcxfuaNQEm11CdzzTu
	1UGDhHedxJvK10JJOl+nVTjUx/kaAtWgZoiXzse1fMWZn0qAnNqH+C8A==
X-Received: by 2002:a05:6a00:3d01:b0:847:77e9:acbb with SMTP id d2e1a72fcca58-8723c64cf99mr1242381b3a.13.1789525805860;
        Tue, 15 Sep 2026 19:30:05 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872025dd644sm407987b3a.61.2026.09.15.19.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:30:05 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Amit Bernstein <amitbern@amazon.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] net: ena: fix PHC cleanup on probe failure
Date: Wed, 16 Sep 2026 10:29:54 +0800
Message-ID: <20260916022954.2690322-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ena_probe() initializes the PHC as part of ena_device_init(), but the
probe failure path does not destroy it before freeing the PHC private
data.

The normal removal path calls ena_phc_destroy() through
ena_destroy_device() before ena_phc_free(). However, if probe fails
after ena_device_init() succeeds, the error path reaches ena_phc_free()
without unregistering the PTP clock or destroying the device PHC
resources.

Call ena_phc_destroy() in the probe error path before freeing the PHC
private data.

This issue was found by manual code inspection.

Fixes: e0ea34158ee8 ("net: ena: Add PHC support in the ENA driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index ea89619039d8..5f0864d16dd3 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -4122,6 +4122,7 @@ static int ena_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_device_destroy:
 	ena_com_delete_host_info(ena_dev);
 	ena_com_admin_destroy(ena_dev);
+	ena_phc_destroy(adapter);
 ena_devlink_destroy:
 	ena_devlink_free(devlink);
 err_metrics_destroy:
-- 
2.43.0

