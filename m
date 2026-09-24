Received: from va-2-48.ptr.blmpb.com (va-2-48.ptr.blmpb.com [209.127.231.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBD1322B6D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221080; cv=none; b=E6FsPnI4iv6iMe/1iMU2hKnNqq5mPYLsKlHS6FbQHsBRCp9lnZ7AhAH2jNGeKVWlUrKEDpJ5AzV4FEh6Qm5PRJuE82IQi/A8vqhpvocVZ8BxdlnOUugskMNEgs1jp7eEXulfDOJI2o2ZN58eYEfuQ/WuWI51tGSDN8jCbBid1AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221080; c=relaxed/simple;
	bh=ttOxI5Y229QMz9DbVBXaGOtOLX5sVcTcavTN6OTo46Y=;
	h=Cc:Content-Type:To:From:References:Subject:Message-Id:In-Reply-To:
	 Date:Mime-Version; b=pVqmQKpz6tZFAaLZMrB/o/L0zVr82CvUgEsIF5pCVBJG1W16MVoXL7ozlHPemMw4tA6f8tvxlKQfzwSA6W2ThHOrl2yGm0uLsPRzsQPelVLwaM/nsY/jiLA1W9fhqkj/XaA7ePqmdiedmg676VFun8nkSLvNai6uthZ2w5xQYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=Qx4HrA3z; arc=none smtp.client-ip=209.127.231.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="Qx4HrA3z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1790221068;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Ad85azF8NuUWbQOZeE/AypEFZ0EAh0ubTf77I/hzDg0=;
 b=Qx4HrA3zBU2+rz9q2y6SkSGGFC1VoEqlFeHqJ3h0dPtnMikt0xgI+1yqSE7UJue69F1ZgP
 nNQ5wLWBsKA3t5bvrb/w5CjEy8R3dDXRg+KFZfaHSo36jOX64BSs8TddYt8oshv7nGWksA
 11o/ws680O82rfn9kDDNVXNyI+gOa9p2uvowY0Um61KpyPuxaI7QEZY5ZDAuCHXuww183G
 YiH9WWaUgAtxWqRn7KpNhMGGDi0eiAKxyMBxpBmlNQVVxbCjhhPK4IgjaqCJxZe8u11N5x
 CnJiwi4SvyIWcw2cHHrpxuhfo8btWrik0/SRtWIVr3CWqm9KdanQwncxWCGxWQ==
Cc: <marcel@holtmann.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>, 
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <zhirunliu@aicsemi.com>, 
	<dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, <liheng.wei@bedmex.com>, 
	<yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26ab49b0b+2c2a63+vger.kernel.org+yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: <linux-bluetooth@vger.kernel.org>
From: "Yanli Yang" <yanli.yang@bedmex.com>
References: <179022103315.2.2907053891316619435.btaic-v4-cover@bedmex.com>
Subject: [PATCH bluetooth-next v4 1/3] dt-bindings: vendor-prefixes: Add AIC Semiconductor
Message-Id: <179022103315.2.14115293924296380485.btaic-v4-1@bedmex.com>
In-Reply-To: <179022103315.2.2907053891316619435.btaic-v4-cover@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 24 Sep 2026 11:37:46 +0800
Date: Thu, 24 Sep 2026 11:34:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>

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
