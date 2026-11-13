Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567102;
	b=H0yIBfeNeZVbBhGylZ3wZNPdpEz+8yFvUKEmogFyAdQhLjUVVFjAzB47IOwZn0wbdb4L
	 pF8QfTmEFhYYbCvLPske0hPj/e6UgDSMo8tGCBklAxITHaSSj+7FmGOZeQJ25ueqKvYAs
	 csjeXZG2huoa82XiPwWNF9rCray6zLtz3PhLPFl5o2xa9Eibf4W4yz2/3TXxTTNCbViX0
	 1Wbjz1cXTo8VFx1xNn7BUAhM78RmYnnRmcP2eKjgXQA9gFguK7s1yJghpMuoJ9Yo7Sx9c
	 P/y/sr07UK8FPlH0Cr1kDDqODk/uoxzaYRplpn8nLoKrNNvTPAQeCTqCguLtl8YWlkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567102;
	h=DMARC-Filter:DKIM-Signature:To:Cc:From:Subject:Date:
	 Content-Transfer-Encoding:In-Reply-To:Message-Id:Mime-Version:
	 X-Mailer:X-Lms-Return-Path:References:Content-Type:X-Original-From:
	 Received;
	bh=PvWgb9sB0gJNLtO8374oDyk5f8yiTyQ7HhcAVQ4G2sk=;
	b=3p3SsAOQ2Wiu1X3W7ft6qbjlKOumOyNj3tZ04PaGRw34PsgW11t1QaZY0/+JKxi3KsHq
	 qe/f11/0pYinSFT4es0MXVJbLT5TZLJtlbmsOz+xkQf34B7XH6VnrCNlwrK6aR0bUgEaQ
	 FHHTyzixt7Fwlds4TXke424mbne2OssjBAWx+Zulzb94GaKEyXugTjjxZVCjigq1CejYV
	 N9Uc8RZ8qpyuuSmymTFT+VwoG/m/DrxDWF8pf7BdbgcYAIGB2wVKce+679lWqCyNkI+3w
	 MLroGhb2kiRkiw0TNfRw8iI48F7xIwzHHj1oka7sTCsRljaoy0ktqA+EIuiu6wDyVlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Re34KgrV;
	arc=none smtp.remote-ip=209.127.231.48
Received: from va-2-48.ptr.blmpb.com (va-2-48.ptr.blmpb.com [209.127.231.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDECA606B25D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDECA606B25D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Re34KgrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567100;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=PvWgb9sB0gJNLtO8374oDyk5f8yiTyQ7HhcAVQ4G2sk=;
 b=Re34KgrVf1edZ8RdP7wG3V/iHinLsMfPkF9AMJE2bMfTLcazy6zk7lHv/xfSYkXESgyAnj
 L5dt1TKOuozj5RQh75h0PET5CqMfuAmVvjMX9oI680TCvqYU1eppkrrN6ClDwOXdd+AXXo
 0rSDp2zCaHBLrpyLIDLiGy2H9zQilV1fjr6jHaKVJ3c0uvcDDy14kDGZz3BVNW5YM7dM0/
 3MNj7gdNfuQHmgJgbkOHhA7EB7Y/CPWsrSO0mkRz+ElhQBUNcUQXuStLdAHHDvctxrhvQN
 JhtqM21QVkkqe+pxwBrXTrcwWQbzNlt2cHDHDSFNnsCbT9/OiY9sPkBCqJHA+g==
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 5/8] MIPS: Loongson64: dts: ls7a-pch: Add miscellaneous clock node
Date: Fri, 13 Nov 2026 18:51:12 +0800
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Message-Id: <20261113-mips-ls7a-wdt-v2-5-e8abd6b2f77c@oss.cipunited.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: b4 0.17-dev-ce4c1
X-Lms-Return-Path: <lba+26af6ebb0+58033b+vger.kernel.org+rongrong@oss.cipunited.com>
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:28 +0800

The Loongson-7A has an internal clock source for miscellaneous
peripherals. The clock source is nonconfigurable and has a fixed 50MHz
clock frequency.

Add a 50MHz fixed-clock node with label "pch_misc_clk" to represent it.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 9f0a183bd348..2ef1ad10a8ec 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	pch_misc_clk: clock-50000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+	};
+
 	pch: bus@10000000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.55.0
