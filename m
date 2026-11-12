Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490337;
	b=ZBRQSWz09xYlH5GwrjvKNRXVG9FJVF3NJ9blV6W5rRYTlAtYLYQbx6LazpqOfI+x8o24
	 L9ZtHZVCIKjdCK1+hAK6KH3iWRA2nqhGP6URnkbwlh5VftMfPOvXd1dcLkAluXCWnQKc/
	 s5u5zq7Z8twdQw9T0DQrDlrl5IrV4ErfBVTLpBLzIKkjM6j0UH+RXV0Tg+ufvuJuNbz6e
	 ssguxRlSmK7nPhbxmJpICDOw3MdA5hMCg/oJ3jFsjT1KtlMc3oznDjSWuinat+GUkZKUV
	 rkRQVMLVX+P02LSgLnbgnh54FERTaK+C/aG1HjbFevGBY6yOdb2/fADYIMjWSdr0rCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490337;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lrAVNSWfGk0qYRT8UdiOtp/VGNrZkTPuqON7iHlUxAw=;
	b=2nCvA+XnTRShv3aIhNuXvBe0AHpPp75/DsUnaIJF0gssmheJoGo+YSE/PZdy6lN5HxlL
	 VQXKl/SzWn4C5tgHhL7LbvChlwmEw6MkHr6zo2kaIum2fbjE2c+Db96RRo5wtfZbRpSSx
	 uEhGUe/FYC15jqcLxUwfEhXHMgyEWn/wpRMoPs3iOPAKoar8kChtbnKpnevIoFP7pk1dT
	 jWm0AvLyN9Q5F1WCp3nq/XChF9gqW58UUS35oHkUnZ/LYMy7dPaXwM0b15afUAO/vn3+7
	 Z0qW49KTx96mF7WmAfXi2BNJjnPbuW7eC76VnsOW8nAKBYya2WT99I3b5IoIMOfkvuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHYEgyKi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHYEgyKi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7BA1F00A05;
	Thu, 12 Nov 2026 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490336;
	bh=lrAVNSWfGk0qYRT8UdiOtp/VGNrZkTPuqON7iHlUxAw=;
	h=From:To:Cc:Subject:Date;
	b=EHYEgyKi+5QDjkAg+wTYtzJswM7A5/HlhibZXCeu8kY8GRP+uowQaAlMHk+9m53zK
	 WWYaHDjcHWpfX0gTrhcrqZpbzfhjha1xFKhTvECVyTDwmYxpr0LzuyomEIWeuM7I54
	 OCxEzK2HisKdZ5IdF+XLt84MN+X9TZShCH/PWtQ8+DPqk2dvTOc8rdpHKDojwbu85s
	 PESUGhLNzkWLtc8E8ZbgwzuiV6JFMH+DfqvakuzmWJT/TWrxwZmufnv6zOVYSgPfpD
	 Iu+3GIEWgjl2ifi74DMXI/Zzs8XZkCwTEu9l5zOzi2aByWDwxEV3/alEpwA8bHrrYQ
	 52Wz0U8b3NzWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Brian Masney <bmasney@redhat.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Drew Fustini <fustini@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Guodong Xu <guodong.xu@linux.dev>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Sven Peter <sven@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] reset: rzg2l-usbphy-ctrl: add power sequencing dependency
Date: Thu, 12 Nov 2026 14:32:03 +0100
Message-ID: <20261112133210.3004176-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

The dependency on CONFIG_POWER_SEQUENCING is ignored when
ARCH_RZG2L is enabled, and this can lead to a build failure
when power sequencing is in a loadable module but the
reset driver is built-in:

drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `rzg2l_usbphy_ctrl_suspend':
reset-rzg2l-usbphy-ctrl.c:(.text+0x21c): undefined reference to `pwrseq_disable'

Change the dependency to always depend on the power sequencing
interface.

Fixes: 5ca65d048910 ("reset: rzg2l-usbphy-ctrl: Add RZ/G3L support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/reset/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index c63e26f0ac47..acebf03d3da7 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -279,7 +279,8 @@ config RESET_RASPBERRYPI
 
 config RESET_RZG2L_USBPHY_CTRL
 	tristate "Renesas RZ/G2L USBPHY control driver"
-	depends on ARCH_RZG2L || (COMPILE_TEST && POWER_SEQUENCING)
+	depends on ARCH_RZG2L || COMPILE_TEST
+	depends on POWER_SEQUENCING
 	select MFD_SYSCON
 	help
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
-- 
2.53.0

