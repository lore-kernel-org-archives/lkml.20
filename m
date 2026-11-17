Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906581;
	b=vugGZyFAHCNVLcLJSDZ8KJk8F9K4aoNqv3AxaLU7jzkMRw8wedpqJ2du9zrUuvP1LLZz
	 Y12E17WSnQPdwWbd++B3gBwXYOLvGXRPw1kmKyuBtEcohAEaPxXsQHeJ75sxEJ0QQnlKP
	 yknFXOiLSRjFFAEwAj1EYAhuZmEj8APAZkGbdY8AWb2Y3GH3PW3uRkuMeX7zyef6ee5Tn
	 4zD87mRz9aYSGkBST5k1BVwx+Loi1iEu858Gqydu0rERevqmnLe5CMN4zQOb3XhzUipu4
	 XNGUOrVvIhlWezT1tJ+rTTjksmnsP8SZZp25rYi/yeGVRPvsbgI1iAamlV14IQWq5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906581;
	h=DMARC-Filter:DKIM-Signature:Subject:Message-Id:In-Reply-To:X-Mailer:
	 X-Lms-Return-Path:From:Date:Mime-Version:Received:References:
	 Content-Type:To:X-Original-From:Cc:Content-Transfer-Encoding;
	bh=VMdenQr9IZWAxshzwA9HVckJqtXVvhwVQuGES233IgU=;
	b=JWOfiJWSSgyIb6nWbWdBNMMppLhaAS+IrdUTwaPMZz3ILbTkdNSe9TaW+MIO4Z4r01xw
	 1PruGGqBnfGvU/iNqlHH5i0jiebuem3UM9a+CwMfh8CcLvEeY/Tusq6xsSjrVqb1RdGKe
	 chGPHr/E0eZLiTJ9Fip49il6ca/VdK+cgkjCCz0q+MrPAbiP4TWqs2sYLc6ID9QYUC5QZ
	 IJUgttskow0NoHctHJ6VLrlOSuAVP4lmOum+uCQUku5p0F6olfBPxm98E64ZXpDP5hp9G
	 WC86f/3E/0ggmnyVPS724HAfYWkahEBV5Zs6Xc594qez1tf2iLsQBWmYxYwBPN6CTvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=HwNwBAJI;
	arc=none smtp.remote-ip=209.127.231.42
Received: from va-2-42.ptr.blmpb.com (va-2-42.ptr.blmpb.com [209.127.231.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D6606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978D6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=HwNwBAJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794906576;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VMdenQr9IZWAxshzwA9HVckJqtXVvhwVQuGES233IgU=;
 b=HwNwBAJIjyjZ/QvXabymwxuFho8rZAyFHxfvQvoSIzrINpyQLU0BJqbATsvty02sMDnJIt
 05lxT8L8GGNmT/VDxrNwaMNRYfY4XslkVhhdIvdwho940D08yzctxlGGu/hXyplF4Xy1+t
 YrTIXzdcn0++WC0hWCeW/qlObAC8gwl2OAc9YtgutA4S1hgV0JhkVBP/5zIZQIkJV/kifB
 ocwiVUsZuDvu2SQY1GclbWj67fKzYAuDwHxPmVB3ZM6yeV3f3a2Vk5Wo54Iteamg3fKYOI
 OcTxwYPRthGV85zrF8l6ZoeYHBWdrI7V+D1vtpFM49VkG7M+CH2b88lT56slrA==
Subject: [PATCH v3 1/7] MIPS: Loongson64: env: Don't warn if UART has clocks node when fixing up FDT
Message-Id: <20261117-mips-ls7a-wdt-v3-1-2e88f7e1d6c5@oss.cipunited.com>
In-Reply-To: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Lms-Return-Path: <lba+26afc19ce+401032+vger.kernel.org+rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 17 Nov 2026 17:06:43 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 17:09:33 +0800
References: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit

A UART with clocks node cannot (and doesn't need to) be fixed up.

The fixup is solely for the case in which the UART use a dedicated clock
source on board (say, a crystal oscillator). IOW, when a UART has a
valid clocks node, it should use an internal clock source that is either
nonconfigurable by the board manufacturer, or retrievable by software.

When fixing up FDT using UART information from LEFI, don't warn if a
UART has a valid clocks node.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
Currently no Loongson64 platform has such UART nodes, so this is not a
fix. Later changes will convert some nodes and depends on this.
---
 arch/mips/loongson64/env.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 7abcca7ab4ed..8135d50c777e 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -73,6 +73,12 @@ static int __init lefi_fixup_fdt_serial(void *fdt, u64 uart_addr, u32 uart_clk)
 		if (!reg || len <= 8 || fdt64_ld(reg) != uart_addr)
 			continue;
 
+		if (fdt_getprop(fdt, node, "clocks", &len) && len >= 4) {
+			/* The UART cannot (and doesn't need to) be fixed up. */
+			pr_devel("UART 0x%llx has clocks property\n", uart_addr);
+			return 0;
+		}
+
 		clk = fdt_getprop_w(fdt, node, "clock-frequency", &len);
 		if (!clk) {
 			pr_warn("UART 0x%llx misses clock-frequency property\n",

-- 
2.55.0
