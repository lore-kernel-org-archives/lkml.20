Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B5349CE7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421612; cv=none; b=D4TRLjf7+Tu7Mghm6uun8LKoEI0DOj6gzpcCuEqZJUZ4IPYbeGHFmr4NhWLF37uFWz8GhA6s9o7kqnmBRfhTE4PK1uhBNgrNI3S1X1UX/FxrMi7+c4neVn54rb/+Rin4fmhc7GsF9VB+m7WR8idhN1cTiNOlGPbbf/rqSII4O/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421612; c=relaxed/simple;
	bh=ERP8aMixBISGoQkd88g9WXK3waX3DgHuj1l3pft8+F8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbzeS4NlaXY0y0/cCSXCH9DswAJ4ZWu6q4ApkUDSRm5VnAHRGIHYsES0QK4Zyjn6GvDW2QNWuK9vtHLoIUmvlGrnhI/uJST+D5JEgREoT1EuW/wnnXKqgcB1i/U1XymTHR1n8by3m8+yKlxQ4SomCcELXP2C3bT5wP9PLf+/cRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBdbPbLg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBdbPbLg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1957654a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788421611; x=1789026411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yk7M6QWeNfPTqVmroV2JxHOvmGW6NOpOKei4EsE+LhY=;
        b=tBdbPbLgS20+EYsOtKJUG9vNxwsb/pA0U0vPRqmgEOUuhlZ22YPhWv7y5HtEOgv+ou
         7YTxCYfJtL5W4DTs92JXGD/o4TcU4ebKuorIiJ6zyvk9wsCkMXDeaoPwgPho5ajpqrHK
         Zb7Z2K7a/U8g4OCCMo8zpfzYNatWZ1CKHyVWEO68x2KnRfYrzTLKZ/vQeI56U1Trq355
         F+HVUXx3zZALH+VyhGZULMgIX9VyPQ0Vxh7c2IUQK6Sv/pLGe2ryKD+/nZOW1CvZ8glu
         9vunwjQ9rMkTfStyiXlUJkeDac7/nL1knB1qRB19UloHmvs1YVxkQRhwU/2sxL/BUh07
         dDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421611; x=1789026411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk7M6QWeNfPTqVmroV2JxHOvmGW6NOpOKei4EsE+LhY=;
        b=PCQPHBVfzNSWFwLyKNG9mDMXJZzR+5Vxzl3XOEY19zKlUqrO+rBbVMH38L/s8JJyij
         AS7HLG8F4Bax7OFMdXhBRRRPUaoa6I56Ic1UvMiaFkTIXP1McvWE6U4qA/HTPkCA6hzG
         zmdOL25E1sTrGt6w2Bra28NhZMiaqibfUoEHaDlPYraaF2gFaR4TZlV77vL712Crauie
         EEvVDgArj2As96C2K7zV8zF2av4/thpF0Ply5C3BQ/e1kV45abdmppKbXsJP83GEbFeh
         0v50gLQbVpVse6Z2YN2eeftqZC7tzCZcMmPZrql3YL/YfAxwlW5HIp9HF4n4Oiz6ob9p
         MmMw==
X-Forwarded-Encrypted: i=1; AKwUvByva/I7bHi/Zt9FuyUwpojxM/E08WyvXrn4m7FwaHeFW5mbUxxjkHC+V6VYLt+B7CJpuiFJUoxx36IcwhI=@vger.kernel.org
X-Gm-Message-State: AFuF++ndxaroAd0h2FoUrFMrKqQfW5FK1Cn/cK8OZVMcLhrZEeSi3pXV
	jxg7VxSRf0VNdUm8WcRZJkweYRXkFiZ41w0TqI3AYLx1C7zHkc6tig7lQiq23Q==
X-Gm-Gg: AYBFou00VTLFzgkvBSdXbolODKvlDcEZ4XYwAoKeU9tz8IpEQdt8Zl+BqAb8UNtcKa7
	setbfh0s6iidAWGxy4Bxdmd0oXv5bd/Jz8sh5jEoZLnoG3XajyPH/SRnu4+0XKXzQiwScbyo+mF
	xbuUktER8sFUEayW/ogwYxON8Q/hY2/hCMnagAt125NzdMhV1stQ4OcEj75I0F9FC+/FEc/eJoq
	d2NNWCSLpjgp6eYtjXitn0KD3B0h/Q6yp207iT3RegQuL2ScyetgO20XUdHIHODPNp6Q9M/YjGE
	S3wNMOWFICREwzJtLwLAm+DiIj6ZXkgqmz6a8yCWb3YGzpQsh2wB87mzxoJmOpGPG0TZ4cIXbWP
	sh03ojDuujjnWGTNLTB5vGNktKf+rT3wuIDNR4AZN3XBiIupFZ2AhYqjaKW+GveNEUry6Up1GOa
	kxD6oMvXe3kfmghji3pDOfyg2+vLy7kPYzHECQUyjJBHMG7zc1cV81QZLHO6966muIRvWIgvVnL
	5EJ2Zkob2yi67Ki32/c6MqQHTxJb9bF/qELaCut5E/xkp5tz2p2O92vVT0WrtqoHDiiNqlLNMlR
	HNoMlcII0Y5VxBwZ
X-Received: by 2002:a17:90a:1602:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b19bbbd90mr441821a91.19.1788421610920;
        Thu, 03 Sep 2026 00:46:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm3832735a91.12.2026.09.03.00.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:46:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	u.kleine-koenig@baylibre.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v2] net: marvell: mvmdio: Handle errors from optional IRQ lookup
Date: Thu,  3 Sep 2026 14:46:38 +0700
Message-ID: <20260903074638.345952-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors should be propagated so
that the caller can handle them appropriately.

The existing code propagates -EPROBE_DEFER, but ignores other negative
errors. Propagate negative errors other than -ENXIO.

Found by manual code inspection.

Fixes: e1f550dc44a4 ("net: mvmdio: avoid error message for optional IRQ")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add a Fixes tag.
 - Add net-next to the --subject-prefix.


 drivers/net/ethernet/marvell/mvmdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvmdio.c b/drivers/net/ethernet/marvell/mvmdio.c
index 2ccb8c8f5feb..d59cf332d1ec 100644
--- a/drivers/net/ethernet/marvell/mvmdio.c
+++ b/drivers/net/ethernet/marvell/mvmdio.c
@@ -373,8 +373,8 @@ static int orion_mdio_probe(struct platform_device *pdev)
 		writel(MVMDIO_ERR_INT_SMI_DONE,
 			dev->regs + MVMDIO_ERR_INT_MASK);
 
-	} else if (dev->err_interrupt == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
+	} else if (dev->err_interrupt < 0 && dev->err_interrupt != -ENXIO) {
+		ret = dev->err_interrupt;
 		goto out_mdio;
 	}
 
-- 
2.43.0

