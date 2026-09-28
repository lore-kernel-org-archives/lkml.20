Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE34F5E16
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628656; cv=none; b=J0mpItATSrGVtUzh1+8pjpAuslr6ZCS4w66V2oEjv9v7/bbXhMJwBLcOeKLTJQdRhQMLGENi7BK4bZj6BiqGTgxkeTYrNB4aUeDKllt6y6hkoIJs4EhvAaNS4xl7yCp3Pn8u5B20EebCH2q6MoNeyfNgTmO8JgKvuc7JrVDSDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628656; c=relaxed/simple;
	bh=7Oo6CjkgyeadWPVdHdSjHs4jmR9XEagio7pV7BczRBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8SY5UsU/dnVOCKFhtHx4RegQgTMN6D14H709CcBy88OVU3ir+b9K7yxrWT1V9DN4WuK8X12WYnwzrOlFDfAuNOlQ89RhraDDm29NRiV1jFesWlj6AB3nC1d7H+X3Uy28S12Tyc/+fxXfCoAaCCA7SHxtmgQFs+nasH7JPNKzZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Pupotxnd; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Pupotxnd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=KX61QIrNDMGQZNkhbujvGPtXrkJ/uJvb5+zoWtNRHjk=; b=PupotxndoUuSa+pFDde4WTWN4P
	tEarGnKKUwRirrBPpXIvvUYSgG5ZlZIiifTlXalzhldJOcA1F6oFPdTBb6saCrMiHrv0YBgrJ36pV
	GmpkfSH5Tftd8tQ2qsMgSpJ74D+57kBVIIQqHYlnaGpPN2NIOsbl18s4C5RD1RioWE9OeavQ7Ka/t
	gbQVdK9AmOc+tGluBeHUvLCUEwtPJDVUN0PusBMSnfn1TkWHMdx1tgrraUHAjpKMSpjoV3hukQErW
	1/cvYey3t71jE/vLQ/Lne40VDmME9FvZqrrXJuHmeZrodJHv9f7B7swYyZ+76R5PliH3/ZokLguW8
	DQRhssOg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJI-0000000F7qj-1t8K;
	Mon, 28 Sep 2026 22:50:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v5 5/5] riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3 Pico-ITX board
Date: Mon, 28 Sep 2026 22:49:10 +0200
Message-ID: <20260928205012.3689405-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K3 Pico-ITX board has a RTL8852BE Bluetooth and WLAN
controller connected through PCIe and USB. For the WLAN part, enable
CFG80211, MAC80211, RTW89 and RTW89_8852BE as modules. For the
Bluetooth, enable CONFIG_BT and CONFIG_BT_HCIBTUSB as modules.

Both also require RFKILL and RFKILL_GPIO.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511b..1bc79ba2ee649 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -100,6 +100,12 @@ CONFIG_NET_CLS_CGROUP=m
 CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
 CONFIG_CAN=m
+CONFIG_BT=m
+CONFIG_BT_HCIBTUSB=m
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_GPIO=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
@@ -143,6 +149,8 @@ CONFIG_DWMAC_THEAD=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
+CONFIG_RTW89=m
+CONFIG_RTW89_8852BE=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
-- 
2.53.0

