Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794065095;
	b=S3rOONS3KS7Ja7L14OqRvurNVtzR0WrIPclBHCKSbd12C/z2bNlHsPrDEZQvzfGx4g2q
	 j/80+1plFtCm0BpAB6Vpg6DHE/lgxwBkIrAk7bvYHXdxR9KeChoCCLrcH219HIf9PPNRQ
	 mdjzbKElpGX4z76cWMXJrrIGtGapdaXzIg6QhlJJdgrm1Dcc5nx7ryph4MdIw9MC1K9NV
	 bqpamaDMWaai2HY56f8LvdliWhjnQLo6kTOWtFHGBZm/b0NWIh2JGG0r67WMYXkhThzlF
	 yGer+hl4iQtXiA1HDWrEVXoIY2YFBVE2NSGIAWPOuabiO/fxqrZoCayod5A/KDZzH6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065095;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OMgwGkUYlxjWjFHWudYWbUzxlat71Jg28kxm9X022/k=;
	b=NZeP4yjL5wdNpjTW4t/U2YHL+cP/P6nx5E+o/BeGMRxXjlQLEviOdUGIBV74h4wOl7Ja
	 lRpQsnFxmcmF9uzkUbgH2xmc2z34poWJluLiSDEhpMZNz+hGpM4hhHwFsom0G6SHPTmGS
	 y2iqr5PkRiPqQ1RdeCs9c8YjWZPIQL2W2POCvCeaSnM77M4ukSOjFDGVVjqBMMteyx9GS
	 wIW6Nay/J/SuUKTNcKl2FfLNCROl3Z1fkVQ2NHv/O7WuNNZg6LeU1IbXq3xJSEoYr2AXW
	 zENC6pdKE++XzEZA20s7sev6GVYMwF1cMHMjcxDYi/RmsmEx57GklIplvhOzcpYmVWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OonpIJjN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1F606A32E;
	Sat,  7 Nov 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OonpIJjN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794065095;
	b=p70mQuVC/JrOXnWZ+DhJel2AFHYwvQz4XioUH5/DAh7oZFQIvA7SnOHE+zQPjtxvdEab
	 rXkwe6re4il0bCL4MvkxQ8rproRTrl175/vkg8F6/m/2drMd6V3EGqAELZtNFxD3nbcID
	 1G/jI/MjOFzj6laEBxCxxJ6cAj34aQxH2RGEqKiqRd5bhVCBf6XugVEMbdgTA8E7W/zyA
	 /dJgirqSdFQy/O89ZnIbCeauCDHmbuO175jpkSFYP/sJAmtfSnBaqVqfZGubm9cMHFxiA
	 MugEdmqzqMJ7C010gQK9Z1V9O0tWsFGbTzFsK/mlVTSKabUonIRP70yN+Sg8mquZusQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794065095;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OMgwGkUYlxjWjFHWudYWbUzxlat71Jg28kxm9X022/k=;
	b=hiuxd2fyi3qmaMhMIeLHOeDYWpk2/ZU/K3YsGMjlDMxse04y5LEHgqilql3jXnkZx0cp
	 pc5lVmgiRjT5AJ7Mwj+i8rHETSgBk62xxvD/XiGyhqhy7C5WL0YlH/Gbc2jLqL38l9AiM
	 bfelxhJai+16ke7dxGDGwoYu+AYjzsTUN7XgeJpbiJXoEwF26AlY3MAb86TI0BRY57xSD
	 dmZXT2ZVIIaW+UFGTH9PT8oZ6ALdjyy/+Fa65xOkvIB6gKYTDNhkckDr83YEYjGRj9A67
	 4AOSgX79H9oPDXiBxz+pVzDhTezxp2z3bF2sbWcwfmJK4Uvyr7B+jKDrMqoUZEJC11Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7EC901F008A1;
	Sat,  7 Nov 2026 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794065094;
	bh=OMgwGkUYlxjWjFHWudYWbUzxlat71Jg28kxm9X022/k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OonpIJjNyW5Tk9Ba+MrlBpjXZpI096JfI26KRl0n1wsQJKkGt34NF0+sLQ2piin0F
	 4bGF8RMBoEXQgwXHVjjVuakKjpsAm6oZedNWwuoy2ow7aZTBmxhFGqYyGpfMWm5JWp
	 +Cu1i4YE2dYYwI2FcwwQKfmk6Xp8mocDfFgNLhT6asiHzM8zQT1WyG1+3zz05SyS70
	 uKR7KDp226zQGfj86HBLG6YtnXScnHI7pWnYFN0vRHe1FZW6gdFX04XHSZL1/ZgJf7
	 FZFkRIDv1nod+VTjx+auLdMZy1p1neCSWWo6FihGL2lb7qv+I4nc7oiFCiOaf2MFEb
	 878CiZFO8k/Ug==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0DB8F47C43;
	Sat,  7 Nov 2026 15:24:54 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 09:24:53 -0600
Subject: [PATCH] staging: octeon: add kernel-doc to ethernet-sgmii.c
 functions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-octeon-sgmii-fixes-v1-1-7a5b0fe7d830@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtQi6KuEi3MpppFGk5EIN09a
 fn4/AxCiUlgUBkS3SwcQ4GpFPjdhY2Ql2Kw2rbG6A6jvygGlO1gxpUfEnR9PZtm1Y3vPJTxTPS
 H8o3T+3491QgeZAAAAA==
X-Change-ID: 20261107-octeon-sgmii-fixes-a93b14f04c7c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794065093; l=1423;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=UMDYflhe5DeZfL7ZUgNBxR1G7QGPyWtztw2kj8SfazU=;
 b=2jhsNCj8V23riUFLlbR3NbdlBXGlGBN8PCCNf/+fDNzpalgM/lc9l1OVLgk5k6/6QzR7VbOT8
 a19xdGTxT3BAxIimYjZ9Qyc3ak7LlmIBAzHvZ6j1oqZgh6jirc9jaLN
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Document cvm_oct_sgmii_open() and cvm_oct_sgmii_init() by adding standard
kernel-doc comment blocks. This fixes styling inconsistencies across the
octeon staging subsystem and allows documentation scripts to correctly
parse the function parameters and return values.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-sgmii.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-sgmii.c b/drivers/staging/octeon/ethernet-sgmii.c
index d7fbd9159302..2cd717709414 100644
--- a/drivers/staging/octeon/ethernet-sgmii.c
+++ b/drivers/staging/octeon/ethernet-sgmii.c
@@ -16,11 +16,23 @@
 #include "ethernet-util.h"
 #include "ethernet-mdio.h"
 
+/**
+ * cvm_oct_sgmii_open - open the SGMII interface
+ * @dev:    Net device to open
+ *
+ * Return: Zero on success
+ */
 int cvm_oct_sgmii_open(struct net_device *dev)
 {
 	return cvm_oct_common_open(dev, cvm_oct_link_poll);
 }
 
+/**
+ * cvm_oct_sgmii_init - initialize the SGMII interface
+ * @dev:    Net device to initialize
+ *
+ * Return: Zero on success
+ */
 int cvm_oct_sgmii_init(struct net_device *dev)
 {
 	cvm_oct_common_init(dev);

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-sgmii-fixes-a93b14f04c7c

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


