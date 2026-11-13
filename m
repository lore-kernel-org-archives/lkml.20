Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567087;
	b=SFRlNQVSC8IeNGVKXnUV/71i5v6yfRPcnMiLJO/bsK1vbVUwWE5VrORgCEc31YFfjEMt
	 0nmysaSvHgK1mQuNPFq5yHOk7JHcXgSZ2TIgGGte/pS4+cJ94V94Q1BE4lqxXmISZMczA
	 fXl72p2JvuYhKxGapZgh9i8Ee2MBChgcOBtbNTyZ4Wg2bg0Dgr92y2dUDyAFdbrmkrK3n
	 UGuVgq9Mq6hMmfXLD7l30HabujBsBk6XM0TrVPWbZk7R6qUDBSrh0jtEXw5HExu617VKr
	 FUMZuP4TlyztdrgiJR4qsCi9U4GEm/5wiMBialXAy841YluWgaVQrw1vOGsi471Zn2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567087;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Type:References:From:Subject:
	 Date:X-Mailer:Content-Transfer-Encoding:Received:To:Mime-Version:
	 Message-Id:X-Lms-Return-Path:In-Reply-To:X-Original-From;
	bh=UtQIaEnaYQpscdnv8kS89CFZoPvgwXTwxpgQLK+sMwE=;
	b=bJx/TwfVTOha9BMpubEnkMERcs2d3Nn7U0PZ0ORAwvBcYbrskW3EC0k37XGVsZsRsdLu
	 BQRe2oURgG5PKDSEYIB53+k7TEhHVi7wM1TWoE9fERAf4uaw+iYBWfExd1V7qAcmvlBQT
	 4e07J5tPJ4nWmcs/CoTpHcb0OuI+XqeQNOuf94qXBIXUnBQ+P68/J9r/F7vyZ9+ylph0h
	 GvS+Pf+ocZoynZShie8mkL8ojm6uiC+20jF/C/gCrM9DEb3Pnh99QdRk3ac/P9sJF9GIs
	 QcNKW9IHDuyNZBRpcIMOZDGuUd9youKRE/pm8hiNpWLj8+SZajmORqZF+d1XErsXGnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=fZhqyBlv;
	arc=none smtp.remote-ip=209.127.231.44
Received: from va-2-44.ptr.blmpb.com (va-2-44.ptr.blmpb.com [209.127.231.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F07B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=fZhqyBlv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567081;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UtQIaEnaYQpscdnv8kS89CFZoPvgwXTwxpgQLK+sMwE=;
 b=fZhqyBlvo5/jkBbq1IWgT9qOO90rgLZOIAxGcnX4Kyx346r/IC4XBB+ZcyiF9/aFqqgg/7
 amismXbnvp0vHcwskjK2VDez4c7lWLjB7PLZeqlCLvvKzA6spAS8oOPeey9qKpPg8yZ44y
 TtkYMInthjvkWP93wXMVcRXGY0n+kic+QyLX43C+rquAs8sZd1i9kpB944Xhb9mAVjnugj
 xIJSq9ydOnpb/RLVgRfvwxV2dskVQm6497DN/8XsfB+qnWrKyytpVez9J5Gl3JwxW8fH/0
 NqEa9Z5/FUBCX7r1xYlNL1BlrpRlCtun1xu58rldYGh3xWZ4/Gj/VtvUFR6DBA==
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 1/8] dt-bindings: watchdog: loongson,ls1x-wdt: Add compatible for Loongson-7A
Date: Fri, 13 Nov 2026 18:51:08 +0800
X-Mailer: b4 0.17-dev-ce4c1
Content-Transfer-Encoding: 7bit
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:18 +0800
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-Id: <20261113-mips-ls7a-wdt-v2-1-e8abd6b2f77c@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6eba7+92ad88+vger.kernel.org+rongrong@oss.cipunited.com>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add "loongson,ls7a-wdt" compatible.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 .../devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
index 50a9b468c4a3..dbfe9795c835 100644
--- a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
@@ -14,10 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - loongson,ls1b-wdt
-      - loongson,ls1c-wdt
-      - loongson,ls2k0300-wdt
+    oneOf:
+      - enum:
+          - loongson,ls1b-wdt
+          - loongson,ls1c-wdt
+          - loongson,ls2k0300-wdt
+      - items:
+          - enum:
+              - loongson,ls7a-wdt
+          - const: loongson,ls2k0300-wdt
 
   reg:
     maxItems: 1

-- 
2.55.0
