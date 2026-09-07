Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8EB67E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788821876; cv=none; b=NL53pdDbPecYkC31zrvhhliGk4zwr1oTNDQCygXSkKx2l0+/a2tEBQK6IkvaEUKYl4Osu0w+bZsrll06JSp5KGite0dKpAnKMHv6f/TT9vasZoFNPfADw8iwT+NOcdsdCvnZJJ01PzePLHdY/YAG/0Be7IMxOIg9RQjjOabfnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788821876; c=relaxed/simple;
	bh=xZMHYZHtWy0wa4A4svL/RzMbCC0aEYcZiTj1vBD/81I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNWxgaEH1cZNvBpa3fs5MD7JG+RtX3sJPa1ZwQkINILWYepuzaRVA2Ok2oYFUHZxwDyJ7tBuGPMD5/uxPojCbcDzdCMfQiz4yYzg58D0ReFa53Z7vNEgyQB4mThk8XutuO1R370FsY3lgwy0mUeB6k6B19o1NQHTyvWKsZhLpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJueRmv8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJueRmv8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8535a9be75eso2925710b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788821874; x=1789426674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl68zE3FFpTHMBRbqsY1/seQEtcoINTSg5HXdNhyMsU=;
        b=aJueRmv8ja3xHFOwt2z9IHAOrK61G46LyxkdJr/YQ8hqyEeQdMEg+YNLfM/ndhuX48
         YgQcYQ0HSjFe52/X2pOR/dYRdLnZIm+eCfmPMTmJ97oZKDl3W6E9WKGG4syMB4Dvzxkq
         64od5h13Rb/cwhStDCrn6NoRFf+cOlY1WnMknndQSM+Vj7UUWyf+3uOTNPX+X8aTjnCn
         pKe+G2EK4VwYL9Eu3M0+iNtfhzc5uHWpq/nOAw12DhwswbBs6wce8HqhXSbYRMF8gywS
         OXuV8rPj6n/lkJhBfTORd+dyqqKmnDnnllAT5TWWpoaP+ZXhK4yBoRoJAiIy8XejxsAO
         f6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788821874; x=1789426674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sl68zE3FFpTHMBRbqsY1/seQEtcoINTSg5HXdNhyMsU=;
        b=CLr1AQhuJFd7OfmzKJ0v0v179y/67vX7CZMxr1L0pN5ZL7C+3/74GitkgfwLp+HhqQ
         Q3LiAj4B/9zoTRBk/P6rMnS7t5UXKW/oQ6UoQLyULZrln4HtLvzLBUuvKsoOZs1NjvjY
         ZWks40EaO5vc5SfecFQEOo6w1IOyZF/+Oofrd3yTWC2WC9AaQE0LXmvA39cFIp8KeMn9
         QLT2pK9Aqdxrlb4hNZgKTjzQkVEaDOk7P4LVYFnL5eEs1hXtiFenN3sTUwBd4pcZQaGm
         0KQluFkvf/J8KoVb1/1TIEX6oojIAw4KWj005pErXp+UbRpjuYoVE7tUB++Jb7U6jEKX
         4H6w==
X-Forwarded-Encrypted: i=1; AKwUvBz1x12ODrZOZZr7gCeb3rKxccxqVCYl651K61XrrNfwhNnxWJ6OgB/b5mV7bYjr1F0QOZ48ZyWDuHZrgXc=@vger.kernel.org
X-Gm-Message-State: AFuF++nlvUjmwjPV3aY21adE4C6riA75KULZ8RUGOv+BZe/q3BDW15oj
	wYtAIhY+MgFd0ZpRJI4h8uEQN4fY9WGwp4Wm+Y8TqDfnUsu5UDGak8Sa
X-Gm-Gg: AYBFou3+/f4//K3JhPTdxtnamzErQk8MkzGyQNq0UVcv37wM7aW/p/qITtT4jWBMMtx
	9g1XJIDAZxRIYEhvxrWXuMSlNPIcThyG28+YquZwmIEy5kSLG38eI/k+Wn0QeFGG0aiYuFn97mL
	vsMrqGBtAYBOXwi2UXDS2TUj30MYSCWFyPGV4xCcr0u31BwLji65z61WYb+Kw1LEsXkT+RsZbCN
	2VqkGQulcyr65ZAGA6XD4Zp/2Qos1o1LyJiNvSnYcU/TRuRW5T0t01X1dZpwFa+0XsF1mZYHby5
	qA1ryTHwJhZUHuDkgVe2GtmAFhDrxPRT0BtqoeszjT4NwO9ZSXyYX8KvuOrcK/WdcZa+b6TDjsI
	alC18YLXnAtwBGD8npcHICmxfXs504yawXEiK8ip6bIiqVDudB0REmwT+Xhkj5Yh20V36HQJxOA
	b9VexZhN4GXVTQvfoU1MJTYN0vizn784X0er7RuDyQOeEUYdkfVOWyIA==
X-Received: by 2002:a05:6a00:4c8f:b0:84f:5cd7:e3c6 with SMTP id d2e1a72fcca58-861662d4ce4mr36353360b3a.5.1788821874350;
        Mon, 07 Sep 2026 15:57:54 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac30sm4709967b3a.56.2026.09.07.15.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:57:53 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: ionut@badula.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] net: starfire: fix ioaddr sign-extension causing ioremap() failure
Date: Mon,  7 Sep 2026 16:57:48 -0600
Message-ID: <20260907225748.167279-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819083731.GL265046@horms.kernel.org>
References: <20260819083731.GL265046@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ioaddr is declared as a signed long, but is assigned the result of
pci_resource_start(), which returns an unsigned resource_size_t.
On configurations where the BAR address has its high bit set, the
value sign-extends when passed to ioremap(), producing a bogus
64-bit address and causing device probe to fail:

  ioremap: invalid physical address fffffffffe480000
  starfire 0000:08:04.0: cannot Remap 0x80000 @ 0xfe480000, aborting

Change ioaddr to resource_size_t, matching both the return type of
pci_resource_start() and the type ioremap() expects for its physical
address argument, rather than unsigned long, which is not guaranteed
to be wide enough on all configurations. Switch the associated error
print to %pa accordingly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=198035
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: use resource_size_t instead of unsigned long, and switch the
    error print to %pa, per Simon Horman's review.
---
 drivers/net/ethernet/adaptec/starfire.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/adaptec/starfire.c b/drivers/net/ethernet/adaptec/starfire.c
index b72b393e6fb2..b2f3998e128b 100644
--- a/drivers/net/ethernet/adaptec/starfire.c
+++ b/drivers/net/ethernet/adaptec/starfire.c
@@ -634,7 +634,7 @@ static int starfire_init_one(struct pci_dev *pdev,
 	int i, irq, chip_idx = ent->driver_data;
 	struct net_device *dev;
 	u8 addr[ETH_ALEN];
-	unsigned long ioaddr;
+	resource_size_t ioaddr;
 	void __iomem *base;
 	int drv_flags, io_size;
 	int boguscnt;
@@ -664,8 +664,8 @@ static int starfire_init_one(struct pci_dev *pdev,
 
 	base = ioremap(ioaddr, io_size);
 	if (!base) {
-		dev_err(d, "cannot remap %#x @ %#lx, aborting\n",
-			io_size, ioaddr);
+		dev_err(d, "cannot remap %#x @ %pa, aborting\n",
+			io_size, &ioaddr);
 		goto err_out_free_res;
 	}
 
-- 
2.55.0

