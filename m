Received: from sg-3-42.ptr.tlmpb.com (sg-3-42.ptr.tlmpb.com [101.45.255.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28DC384244
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611674; cv=none; b=ps0L9a6CroSGftK4yNJoHn0iF+4JUVvQDoF/s8dxHwXcC3ALP906XghoD+Bm6DlfqyXbmMR5t4z9YccCFNhRGHKqY0JEMMpHr1LkcBYm2yOzvJxH8DFBy7somBYmxGFQwHWogKZmPi9BCK/Fr2pHgHmg7hUVTDkPQrLIeCAx2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611674; c=relaxed/simple;
	bh=2AL+oBYGO1Q6z+nVu/onAOobvEDkk6HWUgH8opq7GE0=;
	h=Message-Id:In-Reply-To:Cc:Date:References:Content-Type:To:From:
	 Subject:Mime-Version; b=hYtswZIHaS84FmY5XWX8CmtlG8KEWHQm7WKkco3L8a37eEn65UwaKpV2CJdGJoYVdWmvoCJttQ3UB4ogsyNO4Htg91tn8UgkKivSptIMkCM5MNE8u2+dTen5s2yIyCRJUGDwtkZxH6VhDEQrCdZ/9JJ6/WnF0eQEBxZjpacXFo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=zeCXsN41; arc=none smtp.client-ip=101.45.255.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="zeCXsN41"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1789611622;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ZbOmbVPbGESRSFpUkfMH9dPTKwf1GID8YFaKA+5ooJQ=;
 b=zeCXsN41DB7NtY2OZhF3Kw3lxYMMblgoSTl4aw+d2QIO7ho8DWZ527B1tItgrX5POa1C1+
 Jd7+grBD9nHM1+D3DpzsEhDE2/5jOrvHYfriMTx6vsQC/RM8l7kusf/wabVb8JcnjwtGgE
 HZekcQ1uibWtMC+oXigZPEpfcJfb+qeNF6M1uH21qHm28LTrEd1qmQXZc1tvO/hxuox+kf
 SL70I/7KqQ4+fYfNY3yIx5sxxFNJTLulgqjI6yTH98E51ioLTpFQArROezWxXJO7/1rp1a
 6okyGQAaKGG5T+wjdL0GfQlw0zBy39K0yqdLSd05nQ3prFyQp4IuRU9tNAZJFA==
Message-Id: <6bafe48e8b88ec3b35eca9e4da9e9f6af44ed361.1789546358.git.yanli.yang@bedmex.com>
In-Reply-To: <cover.1789546358.git.yanli.yang@bedmex.com>
Cc: <marcel@holtmann.org>, <luiz.dentz@gmail.com>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
Date: Wed, 16 Sep 2026 16:12:37 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
References: <cover.1789546358.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: <linux-bluetooth@vger.kernel.org>
From: "Yanli Yang" <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26aab4e63+a00602+vger.kernel.org+yanli.yang@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 17 Sep 2026 10:20:18 +0800
Subject: [RFC PATCH bluetooth-next 1/3] dt-bindings: vendor-prefixes: Add AIC Semiconductor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

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
index 396044f368e7..a55d0d974cab 100644
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
