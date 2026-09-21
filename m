Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7349B473
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995607; cv=none; b=aYgHpN5cCeed5AYIucF9fGLA+7N6ddAKuYbcm58LOVAAIALLMlUhrGj6HB8XKwPgz21eme+awgSyIDet9FittCydx8M40TDzkEmIXdpGBETpUqdFh09Mf5dWYrp2pWtSYNaneXSPBI9HlbTcC4nqSJy76juMvzafddTFzI9IuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995607; c=relaxed/simple;
	bh=ikNEYMx+B/ce1BP4LhNP2vesUaLw9BeI3qM6wtNhxSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XmU4LjdKlnlSXeWpencvnq7/GBC7X5liEWm0ooufBYIOw4O9VRcnEm9CWCrzxASplfbeSDm0opt1BBJ68WnyIKnZlm4w5uCg8NMrGCEXECU11e1Kl1f8UtLCD58ywPggs1Fq6DU+9awdI3DNgigiTneVQ9Hd82BNqCrS+IVtv30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMiCVpqQ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMiCVpqQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so546399966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789995603; x=1790600403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRV8TcWW5ZwNyFZnqA6Ki45Wf1bqD9wRv3NLNzR2dP0=;
        b=jMiCVpqQVf36pJVxR29Q6I8K7/sLbIt7peFUvCAcykYezqPzZkbUTzexCK7OFA/m9R
         tnH/2oELxQKtYEMp3QTS7FXg9E4hyjIpCX2xm7xfq6mORHdZ4WKnbZu+c02Hmzj4oAVr
         98s9NJgpEFzUss9QEGeP01kKYgrUuajFJ0/+/Lf3MQFSm1khhaWZ7jlVpIRapYfJfdeB
         h+4REURNp09nupRobhviZCbBkYpMMIP37LC6lr5Mylss/UsenNP3BFXaPUXWA093XH6q
         f3xTj/291D7YcGARjTFvBsG7yUcHV+/i81Fhd5KdtuXs2sJa6nqXccM/1fEKp3EJVl3C
         js1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995603; x=1790600403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRV8TcWW5ZwNyFZnqA6Ki45Wf1bqD9wRv3NLNzR2dP0=;
        b=h4A04xcDOR0pgzsQCo8SFSM8dcM6fRgr/rZ2WmldYsOpnntbrLEQhtVyc5nCqaX6wM
         ViS79WtSS2phGCtcuJtEPRh7d+TOfcayET2ksrFpPWvQn4ibgWB6O402SFb2G4EvYiQH
         1xqyaEcfr6XqrrvlFfmzraqoytFPAdWxqvIuBolx72fSNgAfynEs8ysZ3imikY0YO7eJ
         RPYMLt3ZVuVDRNXUr80Rm9pOmyPJYB+AFOwqCYzvCs9lmNFgSsduB0mrNs1hs1xmcC05
         wJQ6SHS9fh7zrnZ/eX6wKiKXhf4cq2R1A/7Dixew2qExzpZpYeNoVrMK+eaR2k6zk3ni
         6NmA==
X-Forwarded-Encrypted: i=1; AKwUvByQkG9uA33u8qEL14zW2gp2domhK+0236Necbm3up0rcrviMO5D3TLRwvg8VeLdctwhHrOaTcGBUKmKltg=@vger.kernel.org
X-Gm-Message-State: AFuF++nrgAZTlHrV0lVX4lcOIZ+6KsN2TXPTyH3B4U0rOjVnOAsHi0t8
	xrSiNaBRigGe96Sv0i701XD0Y5sY632ZM6OdL9b+wHYDYORvPPaariW1
X-Gm-Gg: AYBFou1v1AIXL11CrBc4SR96moEN78oOMav7yPugpY8SfuaEBbyE+4JRUgdtI+Eooz1
	o72mIkoLQ41loRfiB+47TKvX8knWWT7M+eAqnh/mukZT+49jUFqMtR7jN6qt2Ho4o0by/sr7piz
	RlnDfm/9blJ/vLb0t2rEt5Yv5wW5fzqQiOhkSL99LOpgGCA5p3KRsE8Ob7edzdsHboJNz5GN7WC
	ogaHMKQs2lme5tLp0pDlrDLZnWQNuAZVZyuilW1d3l9xmt3ZMYqJMpvi3pPfPxW/9DlKbjXDDjx
	7TJPm0Xt4CT1NqA2KdA1s0Wi8l/l+mond7S+ZGP+AeedyhrvP2rBV7twZkg1mSDq9C/CJjijM8+
	wV0271msMPtSe23L/NVpAfAGX0rpLxlY5tev5WlBbusbPzd50LI8dvKl/cLAYFujbBK+I+AgDVO
	uHFNeqOhKwlsbacOFPR7pRXdD9ARSl9FNBASs3+NkYeUBSL5WjdJCDGZdY6vCddRm3rCh9lKU+T
	ZsR3l4ZHVVmLhc2rQ==
X-Received: by 2002:a17:906:9fcc:b0:c26:1648:a070 with SMTP id a640c23a62f3a-c2a15ead5ccmr900804566b.43.1789995603107;
        Mon, 21 Sep 2026 06:00:03 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eb33bsm321193766b.15.2026.09.21.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:00:02 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com
Subject: [PATCH] net: e1000: fix warning in iounmap on probe failure
Date: Mon, 21 Sep 2026 15:59:32 +0300
Message-ID: <20260921125932.7943-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported-by: syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index d7f5c6f16142..156903089fa6 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -1227,8 +1227,10 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	kfree(adapter->rx_ring);
 err_dma:
 err_sw_init:
-	iounmap(hw->ce4100_gbe_mdio_base_virt);
-	iounmap(hw->hw_addr);
+	if (hw->ce4100_gbe_mdio_base_virt)
+		iounmap(hw->ce4100_gbe_mdio_base_virt);
+	if (hw->hw_addr)
+		iounmap(hw->hw_addr);
 err_ioremap:
 	disable_dev = !test_and_set_bit(__E1000_DISABLED, &adapter->flags);
 	free_netdev(netdev);
-- 
2.47.3

