Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DDB3FB055
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235774; cv=none; b=YhqbqsnaawVGftSSqJNFInYoUXSrzY1KTJJgvBhgQYqAulH9mfVqYOg2HYOPrV9vkKLq7xrLUPu3wuvn8BMOFp1V8pJJyeLks3JMtFHX82iBqwqjdZ/Fkm6+8ZPlBcqM/0vv3TP3H6MbXJ5dAE8Dbug1iaJATNf5uCPhXUXSkQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235774; c=relaxed/simple;
	bh=ttOxI5Y229QMz9DbVBXaGOtOLX5sVcTcavTN6OTo46Y=;
	h=Date:Content-Type:Cc:Subject:Message-Id:Mime-Version:In-Reply-To:
	 References:To:From; b=K5mYWoF3jxUJxcC9gQuBDqwIWuoIJDQfqTCcgQaYU8koIs1qPz2L57uXkSmov3iUtGANaWMynlF8OTmBEBwICLk8kkYgToYNcbSz0ge5eb9LSAvQ9Xqf/cCWWuxDIzMupKjndLYOeu9W0IgU2E3IMxQXLj3ntw5NQ6SwB0ZlH1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=k7Ds3Vc5; arc=none smtp.client-ip=209.127.231.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="k7Ds3Vc5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1790235762;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Ad85azF8NuUWbQOZeE/AypEFZ0EAh0ubTf77I/hzDg0=;
 b=k7Ds3Vc5AUNi/W/mjc3JaF0b+YAImVxhNyen+Ibs2obHHnuTU6fJPX66bu/pogR/j4wG1g
 YJ/QZaebxM6kxovAJ1QFeTfzvnFFDKwN9AQlJMA37ir0V7MitlH8EuP9dzOGYphKXSctJE
 u5Kpp0FDI8gLE756sWHhipY9bD0dXjjUP+/R+flYz/+qYplwWKRh5Lrvu/gx6DJ2Z3Hd5a
 doYEXUqYN87wat3R6kMfxbxm2N+N7hjMWzJWp7rPu+wxrGwHyLlRgR4Xdh75aLod330pDp
 jaCN7fasfA2mGPnFyIP+JeDg6j9gumnWDMbO0ugdhlqJ4g2t/BHoMYgHMjw9FQ==
Date: Thu, 24 Sep 2026 11:34:10 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <marcel@holtmann.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>, 
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <zhirunliu@aicsemi.com>, 
	<dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, <liheng.wei@bedmex.com>, 
	<yanli.yang@bedmex.com>
Subject: [PATCH bluetooth-next v5 1/3] dt-bindings: vendor-prefixes: Add AIC Semiconductor
Message-Id: <a9adff17461c1e66d645d2d0edb35a05a536e1a7.1790235697.git.yanli.yang@bedmex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1790235697.git.yanli.yang@bedmex.com>
References: <cover.1790235697.git.yanli.yang@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 24 Sep 2026 15:42:38 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26ab4d46f+4f1b28+vger.kernel.org+yanli.yang@bedmex.com>
To: <linux-bluetooth@vger.kernel.org>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Content-Transfer-Encoding: 7bit

Add the vendor prefix for AIC Semiconductor (Shanghai) Co., Ltd.,
used by the AIC8800D80 Bluetooth bindings.

Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Dijia Xu <dijiaxu@aicsemi.com>
Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Liheng Wei <liheng.wei@bedmex.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..8d35a4b7d8ed 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -76,6 +76,8 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^aesop,.*":
     description: AESOP Embedded Forum
+  "^aic,.*":
+    description: AIC Semiconductor (Shanghai) Co., Ltd.
   "^airoha,.*":
     description: Airoha
   "^al,.*":
-- 
2.34.1
