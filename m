Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99324D9915;
	Mon,  5 Oct 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221605; cv=none; b=MpVzFyV4JcWXup+QKVa7Lst7jkAil9hL5afvQRaMgIjrTi5wj6EHk43YVT2rrJfGmCTCy0vHhynZ7by+zDsCxeXZCmVFjqRpPY5Mp7OgRY4d/tw7pZcec9JtoKh71fySepAQ06Z/OC+YklejaEyG0nSxgKZwBOueF7F7y0hw0HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221605; c=relaxed/simple;
	bh=ru+ebgapaq/0AmUGGrPeE8LajveSkFkh91VhizWmxKo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=kbx4rRjGAmkrWXHbz73lG60EOcWm0e57Q3EmxGi/KLYRnt6cCiH7tX59rNn76F1onBPZVoRS7icTo+hjqpr1KO43m17wChR3OoPaNq9NzhjgvUWKjsvYw/l/UGHkn1o8oDTo6kun4a+V8gpAWPcwNo70cHSII4Qq391FUhVpAnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CeAP4R2E; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CeAP4R2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221594; bh=xsQ6WpVz6dLVvH0jIBhmi25p6i3B1TGiyxsQ84fsA2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CeAP4R2E+XGddrFL1NvuJHfcJWjHGcURzRmVMHnx1+ikAWi/4ETYPUn5K6RUoPY8Y
	 yNRscYJIFwalq2FsaiFJiAet1dJr1gUSxV9EgxFF9O9Oki/zve9JNtvukZAwi6FgDw
	 LG1avGynscl1CpT+QPnCl22GaFj412v43oY+ReHM=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8493A252; Tue, 06 Oct 2026 01:33:09 +0800
X-QQ-mid: xmsmtpt1791221591tnj7j1o1a
Message-ID: <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
X-QQ-XMAILINFO: NxKoLLhE22aT9FMcDdKuxzg/LrQ63U5kQq/Wfq2X6KO052ezmQI437CjloEi1F
	 Whn3Aeeoq9TlAeic7f8ZMRhssaqnnlNNkse++sQTmg63RW5uKrGwstlylr/qBUVq73AzG7T4kmsQ
	 i4S8gGMWj4u3Lo990yvMerEmvKfHpJQCtoHLxKiVjOF4KT8LygLFLd9ph23SR0fC3w0Ef9fUMn+n
	 NKMFwEWqoKAM8NZQMWAxWUzFPyAtqCgM2MalUG+m/E8vV4rxCnEhijOEU+DiQFJ+rm1l10n1w+xj
	 v/3TNFh6msls33xPQvgaFHMyz0jyG3vYdxzae3+sLOScjD6om1CfrM5KQqHMr5hYx7K2UPNEmRJF
	 g1xWspC24wK+aF7SHb/jy2kzr/imjb3mhWn90wvrXDsheLwoZoAG1YQtLTnWd6daeUIjN1XmQtiw
	 qGT7ZTuBFAYCs5Qgqikupdi3DyYyqInCUX4HTCTeYpmWwJI2DClvuMzU7eU2Q3BY8kwNHi1uNs3Z
	 fjWkyegvUsRd0nVXH/d7jsX07GDG+ui/hBbxXsIoGEE8AL81qDuEuL1YHOTkZaSnvsqh2gUqJI4J
	 Ls+f9XeiXF3DJxRKz2BaBkcaMY+czbv9wB4tPbiB6GzWEkhlHjsLfPQAVj7KO9PyoUyGzeJsKI86
	 B/evtg5MIp8Qscoo1+7Wj8mRQhzu5RfJDLNy2jLlXc0EMWBOzgcuGSmKDEI2r2KFbpCycJSJHUn0
	 hmMNKXq2B6HERxiW2F7rIEYrSDZxwasv1RU97NUYcDjGlIKasGAAReGve+/AbPLDmVfyzDi5AfE/
	 H0qWoH3KyK0GIw3BLbED5PDnt6/xYPffH2cyufGBKPg61yh7QvWYCSDRV2FTOqbLJkC9agBsqcmW
	 /90NBhEQQ8Owe4v09l3gu/0EGIk9M/dLfHqFmcODKqTNrIdO3G0Z7gCL0y48V4mQCwTmbm4GFb0Y
	 TLioPO/tw3mjI+EnCtyRgDcsvEoehVuQjpxcXZX+MEfLy56rcN+fQtzIC3OTj/9PCNIre039iVy4
	 pEA6nJ1ilmvMgWS53rNBEPiFPtXWU8j/S0MYrDb9z3owZnctrGL8A8TCArc2WKHY3XiKl77gITQO
	 5t6XshOMmTRyFbvKlPwCWw/f8JaqRoyGaV2MsAD88730pQAXYz9m+BdW6JG+bh9T/9btqy
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor prefix
Date: Tue,  6 Oct 2026 01:33:06 +0800
X-OQ-MSGID: <20261005173308.710986-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173308.710986-1-2254650260@qq.com>
References: <20261005173308.710986-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
Co., Ltd.).

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..97e7ef340 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -90,6 +90,8 @@ patternProperties:
     description: AlgolTek, Inc.
   "^alientek,.*":
     description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
+  "^alinx,.*":
+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":
-- 
2.55.0

