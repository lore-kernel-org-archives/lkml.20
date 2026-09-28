Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AD2F12A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599114; cv=none; b=kf1Aa/5JS/0yFrultzD1NSqIZ6eTgj7W19QzEFChduyJuK/m7+aaJg7/bndN7vE5QUSMqZYinY/qOIEEZSWGnlE1sRZL46boiNScQwunCih8nkEXwzFaLwxoK5UjSVhsgEo3PHIFdQpQAjfQwwoqG3cHg5VmulcaZUch3RN0vKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599114; c=relaxed/simple;
	bh=eGWh/UwqM5JjiDpOuyETKfrpirh9r6j0dXiN+aB0t5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O21ACHD9n6VOxyvkqhmos38xsY3oQsvreYLP+96MKiIU/UKiUCNxdv5d08q1mZFQUdhMmGIzkgoFs2zT/iaHqJPzjjxJm9BfhErC0mkJOJUDvF8IiMxLTBpuALMoEOgZMj1aIlEKCMSOwSOMef9CXm7oA/azfcBOScG5Qn/1c90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1/oRNTo; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1/oRNTo"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so3922674a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790599112; x=1791203912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+buAjiyG4ncBlcUW+2BpEu2Hb7PWv2fVmuPggXs8iY=;
        b=Q1/oRNToeLjB/9+ZiUDBqmLg4/4RpqYLTtQ3dtXFDHve+P2i6Be+Cjdnjop5o4S2aO
         tLpsTT23t3hhZ3IIfs5jKsgJy/p00J9L2yu9AMlm2X64pOa7t42qP2MhjqCxtK3DlIBk
         6jIqrg9l1JxC1X+HDtcI6ZEum0K98OWiYvMtZ+7XVBqSwl08uYZmdpYdnUF5+JeJswQC
         I7ejwGVG2om/2wfhDq7zxe1F0AJE6E3Ud65hGwPCt4hbpZFdjASSSksBiOqWAeC7P27s
         FYRWN/BzrRf+owoBRsmpu5H75+UUa63nNCr67uvPvJDE42b473gAw5Vd1gECetw00LjV
         oFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599112; x=1791203912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+buAjiyG4ncBlcUW+2BpEu2Hb7PWv2fVmuPggXs8iY=;
        b=V/4a2o/0QXFFuSEYL71J5BBZe6WR+tyF6qAHoT/Vypftb2b6WoyRsiZFSwraKHh6mK
         +8Uo+OeUYgn/zBC8Hpjvdzs3BTIwqNUMlmFtVPZQtYiRn4gwxuEMrsP63PyE7CjaAT27
         an4ncYRuv1XOEv2vtwTrNxaSUeMrePJABqI1LsGdmwXVQk6IjFUTAb7A/wSXIJ04vJaj
         60CxZ1qjLKr1ROSQu94h3urnMGu2cJ3TPN0DeDYdxJBHzjVu4K1+tTgp/d00TnDCXhEW
         xxerjRVlbWQBCjP7VUov0kvz2AwDh5XAr7oLFDtYr0KPsuHDSRiaX703zceAOY2o1f5Q
         q7JA==
X-Forwarded-Encrypted: i=1; AKwUvBxLA7K5RLiSC2wIuFF8OG39SXhsnKoNQZQ93Ql2gEGM+6mMW9YTxEYM2lJxMrDCFAuvkFEsfO8BLNzsouc=@vger.kernel.org
X-Gm-Message-State: AFuF++kfInnSulHYf/t6iBySG6vmiFdDcVvHgrN1EjVTQKaNf9I8qCAs
	MO1tugKTnq+j0Di1fTbUQFV3hhwdzAq1uEo8Rc3KxTmlU/UeVBdingRe
X-Gm-Gg: AYBFou0jjClrD+Q8t6igIasLv/b9c8JaAhEqNnrOrZgSswWAh+jO+UixXI5VZ8s/TwE
	cYbgAnTogpeQWlhYkDwXKf5IswnkLGnlOLDcpeqXj9jhFcosOiebuIbRfIIxvW9hk4nfU6ptp/K
	oABiEe/FLmcXdtW/A/JY6/Ovec6aSFbDX1ZVictkcDQ0Kmbks43QHk0etEV2iHnWgQutHBefGJr
	ANmLuzuNkEffCVzifuaztC4nmHdIoJw0duI06KLIULHojeLSTIu2cg2tNMK8txzBeGKroib4b0n
	3NiVHMDuu76D9ewNMGlDEOgEazewDhr7TIH32YzcPkXgwPrsMiWkpTW88KusGKnnRNxVFUoGk3A
	B4m0BxVXsm4f/Z+nsNlGNrH53BTzlboBAvEaMrxLWuR4omCVXxixPkPx93REZjZboz0Ul6N6uqx
	imw4bGvsrp0ZteB/fr3UIUzLD4fwcgxDRM7cYX4VrWj7pAfdx5sFAWp9Z5fE51Sk6nQaflwW4IM
	S0+sSOXJhdAG/ytHQ==
X-Received: by 2002:a17:907:97c3:b0:c25:9102:ed with SMTP id a640c23a62f3a-c2ac2311b07mr1040138666b.5.1790599111445;
        Mon, 28 Sep 2026 05:38:31 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd69d4f65sm161462966b.22.2026.09.28.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:38:30 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH net v5] net: e1000: fix warning in iounmap on probe failure
Date: Mon, 28 Sep 2026 15:38:13 +0300
Message-ID: <20260928123814.2605-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In e1000_probe(), the error unwinding path at err_sw_init unconditionally
calls iounmap(hw->ce4100_gbe_mdio_base_virt). On non-CE4100 hardware,
hw->ce4100_gbe_mdio_base_virt remains NULL.
Passing NULL to iounmap() triggers a WARN_ON_ONCE on x86 architectures.
Furthermore, on CE4100 hardware, if probe fails before or during
MDIO mapping, ce4100_gbe_mdio_base_virt is also NULL.

Fix this by adding a NULL pointer check before calling iounmap() on
hw->ce4100_gbe_mdio_base_virt. iounmap(hw->hw_addr) remains unconditional
because every code path reaching err_sw_init occurs after hw->hw_addr has
been successfully mapped.

Reported-by: syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ca1ef9e2e234b8d3599b
Fixes: 13acde8fffc0 ("e1000: cleanup CE4100 MDIO registers access")
Cc: stable@vger.kernel.org
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
v5:
  - Updated commit message and changelog to accurately describe the NULL pointer
    check implemented in the diff.
  - Fixed subject string in the Fixes: tag to match commit 13acde8fffc0.
v4:
  - Actually include the code changes (v3 was sent un-staged by mistake)
v3:
  - Switched from pointer null-checks to checking hw->mac_type == e1000_ce4100
  - Removed redundant check for hw->hw_addr since it cannot be NULL here
  - Added missing Cc: stable tag and Closes tag
v2:
  - Expanded commit message to answer reviewer questions (reproduction details)
  - Added appropriate Fixes tags

 drivers/net/ethernet/intel/e1000/e1000_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index d7f5c6f16142..d7e279b739b8 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -1227,7 +1227,8 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	kfree(adapter->rx_ring);
 err_dma:
 err_sw_init:
-	iounmap(hw->ce4100_gbe_mdio_base_virt);
+	if (hw->ce4100_gbe_mdio_base_virt)
+		iounmap(hw->ce4100_gbe_mdio_base_virt);
 	iounmap(hw->hw_addr);
 err_ioremap:
 	disable_dev = !test_and_set_bit(__E1000_DISABLED, &adapter->flags);
-- 
2.47.3

