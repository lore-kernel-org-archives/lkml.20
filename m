Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6C313E1B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132450; cv=none; b=aaYsJCpW86Or+RPCliqeWLUMkh7a13vmBbUsulx0fvCantGlESRLBnJK8Gsa/34LHTpUnoKg+Qtdczx5YLJ3oRLuBo4igUWplHVHqnr/7z1qX1jLKehGQsQFgflWs+DigtoEc7866bQx+Eo2X5lG2OruOvh6jocXBabgKiWilws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132450; c=relaxed/simple;
	bh=kb2P+rTup+4JQ+0u04UZoPNTMrRO+p4MdWOy6K8k+Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vk1Xr6LRCL9W3Up0qTr0Ub7w1A0BYIztebBm7XPutMYj3ydReQKZAvzR/qh5fhXBu8gknrjwXfJU+wHVlPMuISW8BRCGyB71Vyd5GVZ3LxKp0SUyCAPOGk0f6xjMoVIHTSW2cYYFRcZaxuxSjkOAERL2h59az57z4mOH5YwPJbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW/nzIas; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW/nzIas"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so966419a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789132449; x=1789737249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TweUWxwgfruCndSfAUR84PmaICMDLQdodubhsVbm6eo=;
        b=YW/nzIasoFDH+g463egLYNjF0dfdZf6OhBeSPIUjv9NN43w5UB44YyMcbbi/LPpBTf
         jnyBc12XjqTbnjvfUQmbNpFN/lbzoWqALWcOlA7KMz//Olclb/zd2aKJ19KKszixyXPm
         l/bC2ntS+8C63jpD/gQ6mzY/kCsd+dD7XRORF3WU44Zl6ca0Mw3wKlmzXRa+ygkyC4nE
         vsdlDbx604F9wmFM6vsh8Sn9D8FtavcKezktzAYcVxIKXKncin2Sn4otmiK4jxqj67B4
         alxXzljsKQTwZIzjJebDge1UGzk4XEtmRG6PSMk+1PzlMgJS33/4KwZdTUnVaea7zq0w
         YZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132449; x=1789737249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TweUWxwgfruCndSfAUR84PmaICMDLQdodubhsVbm6eo=;
        b=CBUxu0IuaxKDRbM+dmvqFj4iMVmNbj9iXbiiapYv5r/cqzYin64+Im7E4j7LLxxx/p
         2Hoz8mgJD/g+LISy5cE2osl9Khw8h6DeLDpagUGZAUAXPh5NUG+8CSXMu8lWcB52gsOC
         6bf9XJ+xhmy74NDwSYNJC2f4/qcWNmb4u1TIHutV2lnXUmCvB0GL2yBPibjIs+KtiErc
         5iq+bUxcel42ZEv6eKHiJtA0/mVIOTrNTL0MrVkrdZMlC/FTCSyaphi8lbJQLE8R0vlg
         6qrbioODJgRGzcVH8S0gxFYIS1gknVpQCvNLiXAxj3v9w8BRIU5XT8ISO7eiLQn7iJlL
         afRg==
X-Forwarded-Encrypted: i=1; AKwUvBzzedAYqZRwGZ8iB1NFDXCzdU596/iy1z1/DM5tGISeFsgoQpRcFBtXcW3x80No5DZKeR8BDWPBqEkyTdo=@vger.kernel.org
X-Gm-Message-State: AFuF++luj5dlGG4wIlTtepdbU+/lEx1wIvrl0EnNr1xRiSQSU+QwkjNB
	oayyRuuRgAA6W7iSkZ7buELXGQ1bezlhQrEjz6O3a9ibPxn7XXXpA2Du
X-Gm-Gg: AYBFou10rW40r0E4XCUxzHaVMCbV/ppB/00/WetQZLhcTC6anbORs4j/vzbC2qTsRl3
	L8PHUDn1XRd7ReKqT7lGigw9PqsSJJD/6IuXcINnX9qyUxjPT5aKIPr0L3kAVKcN8h6Ze5lyctZ
	KwBL52D7zb2py6vyEuLYpjzT+4u3xs/fSbsK3TxQZBBSH8EZ/GNhWhNhds0tPnqiMdeeCSSkS9i
	uLoY7VicMlJJmeXPF5imN4qQoY9Lr0MSVwG/dkzzOihY7DcjE7pUbJdpMONbmWIBdkeaNgbznaX
	l3cItbhqpMS+rlOed2HQ6ocqGrhnbjiF6ruUpJt44XHukf+7QTRmgNfjp1H6VVjvW0xrkpmM9MI
	m32s7MLzQ9hIZ67/6CENGC0jzPf8BeSFlBNI4QXzFhnAijja8BobAhOHqRwkDmnbFcQi0RLlIrE
	IlT9HjOmA+9/K+al9a+nmGpug4e9+UzTz/ze9+ajUFijpmAPN/XeR6En6yTXyoLqVpfQJYloRwI
	NKUbNXkRK6NqiyHrXSN3cKtTA==
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc0mr6616814a91.21.1789132448828;
        Fri, 11 Sep 2026 06:14:08 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm5582882a91.1.2026.09.11.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:14:08 -0700 (PDT)
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
Subject: [PATCH net v3] r8169: don't enable chip LTR when the platform has not enabled LTR
Date: Fri, 11 Sep 2026 18:43:52 +0530
Message-ID: <20260911131352.2036-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260910130140.910-1-yogeshgaur.83@gmail.com>
References: <20260910130140.910-1-yogeshgaur.83@gmail.com>
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
supports it. The PCI core works that out in pci_configure_ltr() and
records the result in pci_dev->ltr_path; per PCIe r6.0 sec 7.5.3.16 a
function must not issue LTR messages while LTR Mechanism Enable is clear.

So on a platform whose hierarchy has no LTR path, the driver tells the
chip to start sending LTR messages nothing will honour, and ties ALDPS -
the PHY's link-down power saving - to them. A report against RTL8125B
(rev 05, firmware rtl8125b-2_0.0.2) in a mini PC shows the effect: 291
link down/up transitions in one eight-hour boot, with repeated downshifts
to 100Mbps, against four transitions at boot and then a stable link on
the kernel before the LTR change.

Gate the chip's LTR programming on pci_dev->ltr_path. That field exists
only when CONFIG_PCIEASPM is enabled, so the test needs a preprocessor
guard rather than IS_ENABLED(). With CONFIG_PCIEASPM=n the PCI core's
pci_configure_ltr() is a stub and LTR is enabled nowhere, so the chip
must not issue LTR messages in that configuration either.

Note this does change CONFIG_PCIEASPM=n builds, which used to program
chip LTR unconditionally: pci_disable_link_state() is a stub that returns
success there, so tp->aspm_manageable ends up set.

Fixes: 9ab94a32af70 ("r8169: enable LTR support")
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2529752
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
v3:
 - Drop the #ifdef/#else pair of rtl_enable_ltr() definitions and keep a
   single function with the guard inline, so there is no stub function.
   Suggested by Heiner Kallweit.
 - IS_ENABLED(CONFIG_PCIEASPM) cannot replace the #ifdef here: ltr_path is
   declared inside #ifdef CONFIG_PCIEASPM in include/linux/pci.h, so the
   member reference still has to compile in a CONFIG_PCIEASPM=n build:
     error: 'struct pci_dev' has no member named 'ltr_path'
   (x86_64 defconfig + EXPERT=y + PCIEASPM=n + R8169=m). Happy to send a
   PCI patch first that either moves the field out of the #ifdef or adds a
   pcie_ltr_path() accessor, and then drop the #ifdef from here - please
   say if you would prefer that, it is a different tree.
 - Added testing disclosure below.

v2: https://lore.kernel.org/all/20260910130140.910-1-yogeshgaur.83@gmail.com/
v1: https://lore.kernel.org/all/20260909110554.1977-1-yogeshgaur.83@gmail.com/

NOT VERIFIED ON HARDWARE. I have no RTL8125 here. The causal claim above is
reasoned from the register writes.

Compile-tested only: drivers/net/ethernet/realtek/r8169_main.o, x86_64
defconfig + R8169=m, built W=1 clean with both CONFIG_PCIEASPM=y and
CONFIG_PCIEASPM=n.

 drivers/net/ethernet/realtek/r8169_main.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index ec4fc21fa21f..c305a8f19551 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -3037,6 +3037,18 @@ static void rtl_disable_exit_l1(struct rtl8169_private *tp)
 
 static void rtl_enable_ltr(struct rtl8169_private *tp)
 {
+	/* The chip must not issue LTR messages unless LTR is enabled for the
+	 * whole path up to the root port. pci_configure_ltr() works that out
+	 * and records the result in pci_dev->ltr_path, which exists only with
+	 * CONFIG_PCIEASPM; without it the PCI core never enables LTR anywhere.
+	 */
+#ifdef CONFIG_PCIEASPM
+	if (!tp->pci_dev->ltr_path)
+		return;
+#else
+	return;
+#endif
+
 	switch (tp->mac_version) {
 	case RTL_GIGA_MAC_VER_80:
 		r8168_mac_ocp_write(tp, 0xcdd0, 0x9003);
-- 
2.55.0.windows.5

