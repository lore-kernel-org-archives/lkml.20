Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447001;
	b=PXffdEMkO2ZYjKClFJchHBVW2whfAsB+bSU96A48QKCdpeM8ZbcZ/crHz0iO7bb651X1
	 P5Ck1mMurehPiPzGYgRjGc1044B4VvO3Vg+X4gd7w/dFeZ9N1XJYu3GA6iFmF9qqNPy9C
	 fO37VJ/tjxPhPaNIFlkSX6ZpMn7Q4N0JMXbRyahPyPWYA3MYHxnk/WqmUkkvqQgGxndua
	 TxeReJDp5NWnCmsbNw6X/0Jna2xSzHwmuWfPBdxgQ7MbZI0HSaNOj+sMN7Smni+iaAid8
	 9Y4Q6w/rONtvyE4wiVZmHVtZIlIziAd8ydIEU6L5ePVBk8xtTHD+F1RUJD2gj4fd22A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
	b=SQdmiFm5tFCIARYjvL7+1e47EjtJhglQQJMxL3vuULyC6DFKAb76wrpmOb6JmiU2U6wc
	 EtsxC843Kdvlz0v19JG1uah4/SUp2zmANIp34KLcz4quxLfUUu3KcNDX/MTvO/ncYHpNu
	 mlgvLDv9xtYz5ogr0fAimx/Lh6C7/e+Q06PrZedOpHnoxG2mAY8ZGeSSCdOikyZTq7wQU
	 01jDzFov/Cm68Ig4WZPBKMtwJy+lUsKe/DaPsRBKjHg9bzeFYSrKiiTAhzRAH0tUlwSAN
	 +TnuxRM/NYRaHz6RX5HHAfdiaz7/buO0CTUty0xf/x74kJmKJU9+3o7PCWJGTtt+BLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=carboniste.com;
	spf=pass smtp.mailfrom=carboniste.com;
	dkim=pass header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=j0W3Ljly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E19606A329
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E19606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=carboniste.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carboniste.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=j0W3Ljly
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6795df33283so381705d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792446999; cv=none;
        d=google.com; s=arc-20260327;
        b=E2bvHu66s+1NpEkAcQdj+5xPNp+o5PjyFTDMwSp/AIHE/eDtct6MAf/aQcsNnwdz0f
         +yZn53Xq1J3YlOnPB3hAH+PhKq0IU9vu3IbzKMEon9l1+VcY7puURi+cbIhLpKzHAF2t
         6xSwSIPNUFMLKc9vDvssk6d4NB6tVWhZ4v46ogVprzvpMcCAxC9vArSJQlHjqZDusne/
         EevNqbmQzL4dvYyniqSq0QRmLy5EjRLIIe0TKmRRKd6TsLGE0T0BMPugfV/T2JxvSzcK
         SDzhgav+2BR6rOLVeCsOfWa7X71iXZBms6bh4AFvo4R6xeDzdlv0KYcUsRfZouaTuQMx
         XEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
        fh=YnWtRSiQC/o9Z/80qnW2+3+ZQiDkR0UlAkkAmgeu9lU=;
        b=DhPnR+/AXMrf1mtugspmWKQJ6FMNPwjbKQMADv6CxwVHkfZ03HVCTJdIMCIiL3Vfe2
         Ixep5zcx0A9odw9JLufc3wuX6y51Wqg0HDbGgWENtF8n/Ms41VdzNd6IRJd/iXxtZtrq
         fG5Lo4XAxjYb6lBjFLymfhvgZLhRNFzGhdVKu54KYW9wvsO2gfLC27+pcqdvRJwY+94F
         yTJfIcWC2SJp5Rw3+2fcx/0EKafU4Zx8mc6jPOTx/dwGHpKO6RS5e4NLQqaQlLyyoDpj
         odJ4v5Rw6UcprfQHdiCrlKgnAvlD88HiI3TG7PLLX0XZHIbrv0QsQ5wLhLo0TW7hYHpP
         nk4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carboniste.com; s=google; t=1792446999; x=1793051799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
        b=j0W3LjlyKLqE+vOP81E1g2zt2kiaiImKkPo+yyE/W++ykdHspgJKCGrtCC4up8BmqG
         7opm7ELP/oPtBh29Wa/6gPKqPMqc7PdKVjApIrBtdghtjG17cAV9HYqQ7E4pR0DjoggB
         0WS+1chPGSVTFUlFLVwXKsD+4ATBFsCZCgDbcM0dxi2L6a/GB0jnUy84w9a8mDuAlhTx
         9ktqOGuyE7Luk34VTk6QxFS23q6aN9Aur+tJanVqUwHoTwnaQdGt18gr4FYLF1vcE8oL
         GFuF8HQxLxWYcUQJiRj6UXOAwxngmegHb7n41OLCjvviwfqrAVXO2tQYdljET7vfb3K+
         t6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792446999; x=1793051799;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iy6FFFbMo4zXlK5qylbVO8N+6UI0KHzjfQawpde353Y=;
        b=qy9IUxl3Ilmq07cECeQMbRB4fDEd+Q+feOkT8b5MJ2brxuY64OYS5BXHpz/gO2JI0Z
         aG+mQfYnjGs6NhUIAjDaHCMuSsjiXSTHv429/PNnjEJMSZGtQBoiJi1aUlsSErRQ7BIX
         5QREQ0peRw4bijbIBkYsKe1VCCaLB6C3TyY41Iq7AnQZCavFS7vRTyu0ozHvp41QGR/x
         3nhF3Po++Gx4wyvc7Ik3kR7GlbCGVxH8kyIOxGGDEj16BOMP/9loOEz2LM1GsB2D0fS5
         v0TMzTAemhCQwWkpOXHlOGniIPOPlPzAdGwzdcJF7nJUW3y/hLld8oH4xa8DPFNKJT/Z
         galg==
X-Forwarded-Encrypted: i=1; AKwUvBwWzDmDPS67B2GR2gxoEMCqtMED1NaZvU2MYuCXf+nbqZiiKMDYt7W4pa73LS4NS9wi6nJ/nLCyijFNivI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh8D4HHAmarnBKth1/H9rx3/G5mM4ciGvzYwNZnk/IiOe9ULrB
	cHGL/JCN61nVL1fJzGVboOEQazDIY0EqyT7hvQPe+NBluOiiV6Gc7TywuY7uqGaYzMuowygGGYO
	z/2dd3HJ73K73TaKBxZQW/r0ta1gSYSMNE/sNNtF0zyA=
X-Gm-Gg: AYBFou2hkMDdOpKgN67hHOLT3PITYRTZuLVQpKgdmkMzMRl52+WCIs9Ug9ffpnKxdsv
	gCRYpYlQHDnSLJWFEziCp0H9x86GEjJFdjVBMJMo2TB4O4blp//XeORIcaFjc9zIl1aVDi8J46F
	rBD1KIFOB7sEHkk6K4YkXYEAYXB22F8c4RgcEa2kOBg6It9k8saiJzLwvRpC1iEynT3eqd+G1Fl
	W5BC0eP7JX18Cz0/cgqkJk93PDDAAvs+J6JAEPseA52NKwIHm05bSpXwlF/85ebWaAiNStEwO8e
	a27rycGtT7aL1pBr4hRLdPj9JBw3xoyrZTPQoPAB9EHma4cGXMhaon5WIoWwEUzMkQU=
X-Received: by 2002:a05:690c:6303:b0:871:3e81:955f with SMTP id
 00721157ae682-8b0f2055da7mr52311397b3.1.1792446999140; Mon, 19 Oct 2026
 14:56:39 -0700 (PDT)
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:38 -0500
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:38 -0500
From: Dan Person <it@carboniste.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
References: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
Date: Mon, 19 Oct 2026 16:56:38 -0500
X-Gm-Features: AclHuK98tWdLxJ5Ptsrl5ocriRgzu6Qah0653CJkL69oCt_cti_0kmtGhHOWoFQ
Message-ID: <CABZx5LvZ29kUp2OEhLebLS5DRELRsh1LXH5-YDMEkvsG4c06mA@mail.gmail.com>
Subject: [PATCH 1/2] media: ipu6: isys: use the port B 2-lane PHY settings for
 1-lane sensors
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On the Lenovo ThinkPad X1 Carbon Gen 11 (Raptor Lake, IPU6EP) the IR
camera, an OmniVision OV9234 (ACPI OVTI9234), is a single-lane CSI-2
sensor on driver port 0, which ipu6_isys_driver_port_to_phy_port() maps
to MCD PHY port B. With x1_port1_config_regs the receiver accepts the
stream - firmware open/start are acknowledged, the PHY reports ready and
the CSI-2 error status stays clear - but no frame is ever written and
every capture ends in a buffer timeout and "stream stop time out".

The Windows IPU6 driver for this machine embeds the same MCD PHY register
tables. It has no 1-lane table for port B; a 1-lane sensor there is
programmed with the 2-lane port B set (PPI 3/4/5). The Linux 1-lane port B
table also writes 0x5d060100 to register 0xaa8, a value that appears in
no Windows table and breaks the pattern of every other data-lane entry.

Use x2_port1_config_regs for 1-lane sensors on port B and drop the
now-unused x1_port1_config_regs. With this change the OV9234 streams
Y10 644x364 at 30 fps, alongside the 2-lane OV2740 on the other port.

Tested on Linux 6.14 and 7.0 with an out-of-tree OV9234 driver.

Signed-off-by: Dan Person <it@carboniste.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  | 31 ++++---------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
index 71aa500..cae4dc7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
@@ -150,30 +150,6 @@ static const struct phy_reg x1_port0_config_regs[] = {
 	{0x00000000, 0x00000000}
 };

-static const struct phy_reg x1_port1_config_regs[] = {
-	{0x00000c94, 0xc80060fa},
-	{0x00000c80, 0xcf47abea},
-	{0x00000c90, 0x10a0840b},
-	{0x00000ca8, 0xdf04010a},
-	{0x00000d00, 0x57050060},
-	{0x00000d10, 0x0030001c},
-	{0x00000d38, 0x5f004444},
-	{0x00000d3c, 0x78464204},
-	{0x00000d48, 0x7821f940},
-	{0x00000d4c, 0xb2000433},
-	{0x00000a94, 0xc91030fa},
-	{0x00000a80, 0x5a166ed0},
-	{0x00000a90, 0x10a0540b},
-	{0x00000aa8, 0x5d060100},
-	{0x00000b00, 0xef053460},
-	{0x00000b10, 0xa030101c},
-	{0x00000b38, 0xdf808444},
-	{0x00000b3c, 0xc8422204},
-	{0x00000b40, 0x0180088c},
-	{0x00000b74, 0x00000000},
-	{0x00000000, 0x00000000}
-};
-
 static const struct phy_reg x1_port2_config_regs[] = {
 	{0x00001294, 0x28f000fa},
 	{0x00001280, 0x08130cea},
@@ -475,7 +451,12 @@ static const struct phy_reg x4_port3_config_regs[] = {

 static const struct phy_reg *x1_config_regs[4] = {
 	x1_port0_config_regs,
-	x1_port1_config_regs,
+	/*
+	 * A 1-lane sensor on PHY port B does not stream with a dedicated
+	 * 1-lane table; program it with the 2-lane port B set, as the
+	 * Windows driver does.
+	 */
+	x2_port1_config_regs,
 	x1_port2_config_regs,
 	x1_port3_config_regs
 };
-- 
2.53.0
