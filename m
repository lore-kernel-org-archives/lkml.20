Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532661;
	b=ObxDJyVpAsmy8HIiWLOQaGpDvE+kn2aDB9sXV7rGTIkn1Dz5UmhiuIB5uPKuOfwo7uGW
	 1fJX+8Z5drM55QAsWWcAAU8NnAbB26F5sSAE5K8WoeRdMDMZLGZhJnEIGXff+mHix0AoB
	 ADXkNOGuosqLZnHtGjAOefpgGTxbog0HxXNzuGfuY3tz7f/9Qckdw+LelXUk25XKUPYEf
	 R0TSacEani1CJyt/sEfLShEQGSY14Fd/mtSa5xl5QMONSrP7h8xAknIMOc3H9/cSdPqCi
	 hmnpHEHmveFub5Emi48z14S3ACl2W2t2WsdCEAu8EC6tA4byhpwABbAWScUi7SE3e7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qixMFLQKVMmNskruooKfS/1sCqg+Gqo0bQrcrDyhyF0=;
	b=YH7sEQxVHd16jXTMbkKY0XSNU8KVDQ3YJrt+5ALzplPVvh46j/CCLJBbfSp4JVwmrLpa
	 5zBrRdG/S7PTZ22oWumSJPNz/GMjvyDT6YX0LE5sGG5SLuC0Dn4cABimk33oHzFoUVfae
	 I8VfwcvktENlClTpIapfK+lTtcstuzek3kyrKyije+vNjkbst8+AbQKR91BOF4haKbg4P
	 6iIEL54tIvc/E2Q3jCSyR6rWoGyr88ZmTo7fbZxi8TaU5t9Ngk1H/o79Y3iJcPXR/Hwjc
	 k551NOO6TkFHMCXMC06JWMdEq/uaTURMatdtvIRDohYxw72b7Xm0UH9O+Dz/qNU5Q4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUJVCm16;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D12606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUJVCm16
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab98332238so82520a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792532660; x=1793137460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qixMFLQKVMmNskruooKfS/1sCqg+Gqo0bQrcrDyhyF0=;
        b=cUJVCm16Z+DpPimxR5tNFKd7OiumeNsRlBKsES5RBw9fwVnGfPg24+R4e7bRVl2irG
         7MdCuKNH1BFpMAWMJr5+oTCUriQ2uKF8etftyhJ2N2nLgQ7RGuGqkQGwSU1pAtVCNL3z
         tyPLWoUZhR6niwkZ3BIHidnQJDVTyNCC0MBOB8+lBMSg5SZe/w9rrLtYi5JWqJ/QhrAW
         8U9m6CtTT84eukhVdS4Fsgq+YEJG6bYX5xMLKZ8u5CZ5qfHdOFPsvG2R8HklLj1XG7WB
         8jMKbtq6sGP3/VTGErSvKMDVdhp+t04AcCeHsBsNRDk6FQOQd/TbZmOlIsMGoZ611Zm4
         MDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532660; x=1793137460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qixMFLQKVMmNskruooKfS/1sCqg+Gqo0bQrcrDyhyF0=;
        b=S4xdH+Mu8nz2NnEZkHukumo1m6plxRErKkHxIux4X794QGgEeqk0Vgjwmvyl0pyTsQ
         QpaXOvGcVinL41+awS4TNeTo3Lc1aHI2VwOZWbP/Y5RRxntrGVQqRx3bbssVTbd9XVbh
         649eEFFfWYHZGijoLUJGKNM+drI6qJpsPT02Kj7AeGCGeJ8iUi7Hm+dmS/EJtUsAqRtC
         cMRIiewhU333ZKpr/hbwX2BZVLgoMHwXgUEDpjvqaDC0sIbnQUJ2Pk0gX5nlUiaUrO5u
         ARL3OFfTHhcxebb1TyMM70OOrdzMY4sdDLe+exPYY64fcWK0vYc7pmwHfLz4g/ybct9f
         e6fw==
X-Forwarded-Encrypted: i=1; AKwUvByfYbLxTXQnrpOKcTiCBmXg/3xjQr8zkq/9yPeV6u+cB1zk0E1dkHC9PgYJtW5NwpNJdjbSe9r7FLxqkyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsCuS0iExe6U37JmNcNKj6FvGlA0a1ChmaEeZAAtudW7U4MYqT
	qEGmbai5/9LszaeXkOB8C+/kyVQdsE8A6hcd/udeifee7yIZTUCPRTcY
X-Gm-Gg: AYBFou2vHzIbMtuQFHXtYEAK6nTcIW7Xsh3QH2jzpgBMEOPvEG2auGsigRXciOZnJvy
	EaygWx7i/PxFYyOjgA86qqnoNOrAQ99YD1G6x4+Y3JQWmGWW67BO3wnc3EWwtEtqO2PFMtmXgPV
	4cMSbrxDQcGG5JnJ0zCjRaDvmp4HS9PPBoBLEfGKajmGlbf+EyeYFF19kGdlbhdkli4Cdju+wj3
	//O2l7m4c7g5PlMEqecTyNePdoO6/aHhsmp06Ow2BWeiaQRI2a71wuwiLiLPmLwK6v4FKv9sy1e
	lcSU54PFaSDgzwniOFp6L874e9cozFK9sV9XpvvPIiceU8M4NhwsmGEkVa6s1jBsYF/nmx38z6a
	3UaLPLnSuyhn4rJgCNL8hNK6TZ+k/HwxzBgDXvEIjC0deAkIAWWJ0K2VZ6j7ts6h7Aldyqkkae9
	8ZBXi88EaNjkQsLsG28hVV7lX78yPVAq0C0Gzz/bePTSDmqcuoSFvHMjcNhWl/KWDgb7AWlxhtt
	ZsiFX50wihf379gDbR77VqxXR0ehraQQ0JQmN/4nJ6shfKoyM++afVs69JQuPVTeHwmPuhWP6Zq
	Wz2mPAAf3pZOV7mJ0xyr4hfeAzmbk+nXVxJMMWRnm/e9vA4=
X-Received: by 2002:a17:90b:380b:b0:3ad:6738:db14 with SMTP id 98e67ed59e1d1-3ad86d63c56mr191921a91.55.1792532660502;
        Tue, 20 Oct 2026 14:44:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802957d3sm1216158a91.8.2026.10.20.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:44:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] dmaengine: mv_xor: protect MBUS window access with a spinlock
Date: Tue, 20 Oct 2026 14:44:18 -0700
Message-ID: <20261020214418.1525032-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv_xor_add_io_win() reads and writes shared MBUS window registers
and updates the shared win_start/win_end arrays in mv_xor_device.
Multiple DMA channels can call this function concurrently via
mv_xor_prep_dma_xor(), leading to races where two threads can
select the same free window slot, corrupt the registers, or produce
inconsistent cached state.

Add a spinlock to struct mv_xor_device and hold it across the
register read-modify-write and cache update in mv_xor_add_io_win().

Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: add comment to satisfy checkpatch.pl
 v2: use guard()
 drivers/dma/mv_xor.c | 3 +++
 drivers/dma/mv_xor.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..da8eea8789ae 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -494,6 +494,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 	if (xordev->xor_type == XOR_ARMADA_37XX)
 		return 0;
 
+	guard(spinlock_irqsave)(&xordev->win_lock);
+
 	/*
 	 * Loop over the cached windows to check, if the requested area
 	 * is already mapped. If this the case, nothing needs to be done
@@ -1345,6 +1347,7 @@ static int mv_xor_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, xordev);
 
+	spin_lock_init(&xordev->win_lock);
 
 	/*
 	 * We need to know which type of XOR device we use before
diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index c87cefd38a07..36c1fde6dfea 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -80,6 +80,7 @@ struct mv_xor_device {
 	struct clk	     *clk;
 	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
 	int		     xor_type;
+	spinlock_t	     win_lock; /* protects the MBUS window regs and win_start/win_end */
 
 	u32                  win_start[WINDOW_COUNT];
 	u32                  win_end[WINDOW_COUNT];
-- 
2.56.0

