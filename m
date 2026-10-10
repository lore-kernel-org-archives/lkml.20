Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2F4371D1E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791640052; cv=none; b=EXUMXPo31OHdrz+mLSHu+ReoKpexa/uZ+w4f654Z+XL2WLqHOFpC1AwJ8ns19lFBe01waFO0VuCbc5/qkyN94G8h66mXvD8mSxTfZDHusOjB1jn2LD+c7ZmjEdW+C4gBdCX3YWKFA+KX8XC6DaH+cPQcj7qU53ZbTVG3GGOHzYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791640052; c=relaxed/simple;
	bh=cQbUomhM1env3fJf0eF+5VFZ8Qjd1pmHZIJowGj5XeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l83vJbMAG1VaDipq4nCLssMeICgSD1qQjDpnGFCcZG4uGwvBRpXtHmzJvgur3ls3jGvR+w8of7lWkm9M2RKpEGm5A4ki9UQzX6vlaiqGO1QKu72oaIFuyb1cZXedMd6k6WmO3Xr+yUxhw0usdskLxjgGozmSQpCS1TOWqnwSrVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ltgkjj+I; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ltgkjj+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=vimSJXC3w8/Z7/4ChsrH+qCBDI8SD/MEZ7aapKBWh9I=;
	b=Ltgkjj+I7NyHGU6CXuLNcppDCtfK8FwsAXoOkP2bXx1RaXNM3/uva3p0rYNjmF
	ayuowce6cMf9elyZQyo9wCPCwle57WHj2fjsZt+qzZizG4HN4jiKu4YiBOiNIP9c
	cQikOAJuk28O0EWwObmveF3MigSYv7b48x1CbIJi+llOk=
Received: from E480.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXbhndQcpqGhmSDg--.42458S2;
	Sat, 10 Oct 2026 21:47:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Yan <andyshrk@163.com>
Subject: [PATCH] MAINTAINERS: update my email address
Date: Sat, 10 Oct 2026 21:46:48 +0800
Message-ID: <20261010134705.2131-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXbhndQcpqGhmSDg--.42458S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7try3WF4kXF1rWF4UWr45KFg_yoW8XF4xpr
	WxCF95Cry8WF4Yqr48K3ZFkFn8A3Z7C3W293y7K3Z2yF1Ygr15t3sYka1UG3WDXF18ua15
	tr93Wr13ua1xZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUwIhUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxQTWNWrKQeTRDwAA35

Switch my contact address to andyshrk@163.com

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..17410260baa0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8575,7 +8575,7 @@ F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
 
 DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
-M:	Andy Yan <andy.yan@rock-chips.com>
+M:	Andy Yan <andyshrk@163.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -8928,7 +8928,7 @@ F:	include/linux/platform_data/shmob_drm.h
 DRM DRIVERS FOR ROCKCHIP
 M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
-M:	Andy Yan <andy.yan@rock-chips.com>
+M:	Andy Yan <andyshrk@163.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
@@ -12883,7 +12883,7 @@ S:	Maintained
 F:	drivers/power/supply/ip5xxx_power.c
 
 INNOSILICON HDMI BRIDGE DRIVER
-M:	Andy Yan <andy.yan@rock-chips.com>
+M:	Andy Yan <andyshrk@163.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
---
base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
branch: master

-- 
2.43.0

