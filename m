Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7753A89E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951997; cv=none; b=MUzhMo6BELf/wFd2O8mcEnEgzcGFMQFubShis5ojvpeRTGxRcxC2OGuIU/xzx32hTP0mJWL4AQJGAkE8r04SaoeuTYsRS+s6dzKkuFkBvDIB0/qmQzPh+2q2hmV+Auia10zVaJCbsovvBBq9oQoY+gWUAiDdvgtrXBtOE8b1sLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951997; c=relaxed/simple;
	bh=rWAys0+HIWsiGqZtXhkqNKObTT9MbSHAj3J81e68H/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/KGP+qyYe5T2IzsO4gju5lU1oAIuyDHiMLEWjuCEi7jh4uhrDSDXJ/swx3DCMgNPtl4v20AK1cw03fSiQYd0l5OBJV+/DudFJLCiHPPwbqnDZj75IVvkRcoKj7s6rDitVjO4O1P+RVZ8OJ55KPzt2rkQzGiQQVdWVz8WVOYjkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMuyNdJ0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMuyNdJ0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so870971a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788951990; x=1789556790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=whHN3y9KIP6ye1VdRkpwr53aJIX9j72oYHTkN7oNo34=;
        b=pMuyNdJ0n5VHYzHMsMM0imwb7Aw4Lv+s8E2k7SvMoHrPkh4X1K66pXeKW3m5hM70Wj
         N2pm+8RA5V3Upr8/ltF/t3ABJHlGS0XAe5STISvK0h1tbPbd0JdE2k3sY9zO/FGjKl9x
         b/tQyUCPw4hFzrBDrtnJTl8oVmoJEhitgPwWquhpYO9TAV0Utr/dlpWLQ4xin87AOm26
         IUSf7n8NMElU78Nv9TeWV26Y4OiDcKJkj7DtS6dz4bzWBkWy4uIxwlUPMlr/ZdV496Uz
         LCHZMTX5JJs5dipxoQvTk+k/xDv/6zqz3q5j1KUOiVg2FN9ciB3pGXE7061UqXdzEpvY
         XB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951990; x=1789556790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whHN3y9KIP6ye1VdRkpwr53aJIX9j72oYHTkN7oNo34=;
        b=cuJoTr5qDKIBrFt0NTCQih95B0FOUrQ3KKQNpw2LZhFH2jAffGELYKcdk20KsYKJIv
         g8VxZd35N80Rq0tXgEO9W7nAZoOEsnSTrFzHbNxhN4KJFi0EtWYUr6LdLAmx14KQlulQ
         Uo7X5VBF1leiG2Ww2zJPo/PSPSv1inUZRsIcSakJe1ry4ynClJkUjz79Z131PxAxTZys
         /QY6ogEybSt/FhNePDN5BmigBOlU41tkm5g7JW/ty0f5mwB/UaBeA6QbMdZYLCsoEmqx
         1qvvkonT1BDGMAhnEw/9oRL0BeuNc48aSXBgSeZfV2pOYiHHd7AbTn+x4b2V2EWbkIaK
         ONlg==
X-Forwarded-Encrypted: i=1; AKwUvBwWjt0FATl+Hbk728DwMPa4bKqKDMeo3sY3DnWbpY64ztAtRwGJ5E0OAA/j+f34hvvlEZdiOrayiGxHdy8=@vger.kernel.org
X-Gm-Message-State: AFuF++nbqxVjb6u1ryFz58q3pPTHHZLMZ3Gt9mqIGvwIHia1ZPlof/zj
	KdTraI7TtnrG919w0bNU/AxstmP9FLB0Dn+SyiM00mDk4+FV+GANqD+1
X-Gm-Gg: AYBFou0e3GNy+JSuuOt7jCvWjqDEUAtDWXMAESnCKdEkIOtFTpP7eEHJdRz33x91zb0
	B1OfAR0MI/DVkr9AMgCcsp6vZyfp63VtAA1GP+3KdF1yG779hGeVvp6UKls2gbWf0W0bX44FjNf
	Qtng2gLcBZkuAsKTiDl/w7WOWP8Dux7Sz5hBnbc852qGZzg9lY1DAwJcBNbZf6Z8Z3TLHyfMlN+
	2IaBUJxuCJMqe9Y43W1lnC1obCuSJh6Fl/8wNnk5dmUCKAooNLcih8cZVJX8CEd0OCZpbKyQ7aB
	PxBVNEB0TXLqhQKeAhIQ/M2hWlTW4npqXpll4uxZDHEETypd3xny5cKoIi75mOpMtHge8af+Wgz
	cDD9no8/cMLRQ0y7LS9MDIR4uu4ZP4ajfLErIVX4v1/rX+vc9b0qLb9HOLvXFOddCbfBu0qe5sH
	5ao1Ib4peydGqm3WQ3Xc99MQefJ8PgM3u+9n4c1utBbJzOIvvuNZGlUbcu1ZkO1ElC6WuXZLG/p
	f0B6ZItUwYl6DQVMkqXhMRX
X-Received: by 2002:a17:90b:5485:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39bac34a3cemr7994615a91.12.1788951989646;
        Wed, 09 Sep 2026 04:06:29 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm31962556a91.1.2026.09.09.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:06:29 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Javen Xu <javen_xu@realsil.com.cn>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH net] r8169: don't enable chip LTR when the platform has not enabled LTR
Date: Wed,  9 Sep 2026 16:35:54 +0530
Message-ID: <20260909110554.1977-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl_enable_ltr() programs the MAC to generate LTR messages - ALDPS_LTR_EN,
LTR_SNOOP_EN, LTR_OBFF_LOCK_EN, plus LINK_SPEED_CHANGE_EN on
RTL8125/RTL8126/RTL8127 - and rtl_hw_aspm_clkreq_enable() calls it on
every ASPM enable, then goes on to let the chip trigger L1.2.

The only gate is tp->aspm_manageable, which records that the OS is allowed
to control ASPM. It says nothing about LTR. LTR is a separate PCIe
capability that only works if every device on the path to the root port
supports it. The PCI core determines that in pci_configure_ltr() and
records the result by setting LTR Mechanism Enable in the endpoint's
Device Control 2 register; per PCIe r6.0 sec 7.5.3.16 a function must not
issue LTR messages while that bit is clear.

So on a platform whose hierarchy has no LTR path, the driver now tells the
chip to start sending LTR messages nothing will honour, and ties ALDPS -
the PHY's link-down power saving - to them. A report against RTL8125B
(rev 05, firmware rtl8125b-2_0.0.2) in a mini PC shows the effect: 291
link down/up transitions in one eight-hour boot, with repeated downshifts
to 100Mbps, against four transitions at boot and then a stable link on the
kernel before the LTR change.

Read the endpoint's LTR Mechanism Enable bit and leave the chip's LTR
machinery alone when the platform did not enable it.
pcie_capability_read_word() zeroes its output on error, so an unreadable
capability takes the same safe path.

Fixes: 9ab94a32af70 ("r8169: enable LTR support")
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2529752
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index ec4fc21fa21f..c1ff4e898570 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -3037,6 +3037,16 @@ static void rtl_disable_exit_l1(struct rtl8169_private *tp)
 
 static void rtl_enable_ltr(struct rtl8169_private *tp)
 {
+	u16 ctl2;
+
+	/* The chip must not issue LTR messages unless the platform enabled
+	 * LTR on the whole path up to the root port. The PCI core discovers
+	 * that in pci_configure_ltr() and reflects it in LTR Mechanism Enable.
+	 */
+	pcie_capability_read_word(tp->pci_dev, PCI_EXP_DEVCTL2, &ctl2);
+	if (!(ctl2 & PCI_EXP_DEVCTL2_LTR_EN))
+		return;
+
 	switch (tp->mac_version) {
 	case RTL_GIGA_MAC_VER_80:
 		r8168_mac_ocp_write(tp, 0xcdd0, 0x9003);
-- 
2.55.0.windows.5

