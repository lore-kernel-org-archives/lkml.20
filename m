Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34463AE1BD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151557; cv=none; b=F1l2Lt4Btu7+y1O5U2EmZyQLeIcwg2yxh3CozQYMOYCNuHflRT6509cKYVMBGP7XUmo227jFrrrh7RMzZAKIswYDoG3KfYYEmxDQUKxRuAJHkvuLK7vhzrj6/Y7TpzUH5BNklOxl7umCdYZ1fuNwU2Ng2OVX9/VdZh2wWwCJKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151557; c=relaxed/simple;
	bh=7Oo6CjkgyeadWPVdHdSjHs4jmR9XEagio7pV7BczRBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnK3+W72SyyQTXj/nT/WmDFx2636DlkcO7o8yOquHgP9LmcaLDfNPJX3iOQqqBs0qVc7Pnk0MDM44C3QJKa82wlizqq0wPxad1kJdM15F9OwafA4+sMnZtwEStYcRcqYqmseN9OCxQmkRyR7FqHMS6a3GflR50Ts1iP+nhSJoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=0X5CSn3b; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="0X5CSn3b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=KX61QIrNDMGQZNkhbujvGPtXrkJ/uJvb5+zoWtNRHjk=; b=0X5CSn3bQBiJZlBdrT/fLfEcIN
	HtfA3z/+uSh6cLGhejo+QF7vdKbYAB0AoPqUKJisVFiW2Jor/QZhLSZZg/F04bLxjQvCypORBXvL3
	py+sI8M1m3/GE5W7djluQan6srqt96N6pn+bo0onhPT1diO8YTJwWLpavSpbWAZV1dVtb9e0fRMCx
	3NCDbyaF1gy9dLoJkiI36lHnHm1aEeYh5oOmOnx43B+qZfCdE9y4pOzi/a7e1c5GVucujXP4F2IKO
	EWlkiaEQg4Fl/tZvRMz9GJqcbaL9qRZLjDJnkE2WB1K9rIJ+jcAcCsKuyxQvxwtC2Cb8X9znGkeHq
	iiUZTFfg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu4-0000000ApeD-2mOd;
	Mon, 31 Aug 2026 06:45:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v3 5/5] riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3 Pico-ITX board
Date: Mon, 31 Aug 2026 06:44:25 +0200
Message-ID: <20260831044540.3304350-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
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

