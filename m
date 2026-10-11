Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10D431A51;
	Sun, 11 Oct 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719706; cv=none; b=mNL9BQ0+VrP+8FgE2t7T8hCUbkDYQiG8xR8RrK1Hkl18vlOKJvde558LNyg74do8yKo+wWNl1Mz/ShklRFRJ/PBU0GaSrbmuY92N7ydkQw1knh4B8ufwqKDM+pVkFph6STRAavS2MOIOhNwA8svbps+YYD2IJrxcCKfahPp8Yng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719706; c=relaxed/simple;
	bh=ciM0UdgmYPw41W8axENy4KvMcgd5g4fO7hMNnoX9E4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXg+XqjfG/EEgzZg3llvVYz66szzTMTjwh8t/ZYHQi4QNd4HMYt4lfzupYSCu1eRmzAwJMHmY8y8JlBTXWJ/W5xDqs1jWGvRsc8re8pD7Hr6UmscKlYnbJu/r6PKXd/k/oUib+uuPi3fwzzAsQTwyei5peWu1ZQ8YcaseVH1zGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=l+fLS4tQ; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="l+fLS4tQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xrpnSEJI3qe7+SbaOidZAHDIvSiBvdp4KNbKBAT1h+c=; b=l+fLS4tQlWmwkf0ylHLC4v1nfN
	tZ/SkVCsB7vlqOJc2kj4XyhGrN4RucqhWFJkc//U/aQn27O0PS0rQdvnvSSOsQjVmsB2l4rt4KwV4
	Ap58uPmrzbJTvEo0uuXQn2SHRcuKRRWbzR3BSZd8XoIYNpARpNqGH5jBlLdCaz+Tpo48=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xFs8h-0000000GkAI-2VM9;
	Sun, 11 Oct 2026 14:54:52 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 11 Oct 2026 14:54:02 +0300
Subject: [PATCH v3 1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD
 Technology Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-nt36672a-panels-v3-1-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

Add prefix for Shenzhen TXD Technology Co., Ltd., manufacturer of
medium sized LCD and camera modules for mobile phones, tablets and
automotive.

[1] https://en.txdkj.com/

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
v2: prefix changed from "txd" to "txdkj"
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 473019dd01263..7d0efe58d2766 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: Turing Machines, Inc.
   "^tuxedo,.*":
     description: TUXEDO Computers GmbH
+  "^txdkj,.*":
+    description: Shenzhen TXD Technology Co., Ltd.
   "^tyan,.*":
     description: Tyan Computer Corporation
   "^tyhx,.*":

-- 
2.55.0

