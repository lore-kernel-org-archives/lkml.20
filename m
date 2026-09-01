Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A20477288;
	Tue,  1 Sep 2026 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254450; cv=none; b=XjCjcUJvn611lLkDQo/33Q+zVWYgFuVcch0HZ+Qi6OkLiPU0tMHmHqQHhx//8miEboHj22oFjbcIOq51KRh9gMWNihUE9bgXW/wHI9TovmszvV321wsAsSV1nX8cKtbQnKkIiki8ePZxqBdttqRa3kOnTNg7UfdPYkXyvtiVZYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254450; c=relaxed/simple;
	bh=oklh748WlI1Baphd5KWMOHKbvNEfa9GuqtcojTIdGwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wr/lVjQ9wM0K8iSMfGXqA3vEbjmT2ncRvZekSPfdYuAzUGqeCmzo1TqldZpZmnib9FNqXC1s6WstYvXUi6Y40i7HQumw/AwJLCH0ff20QdPiBj70GIxqg6JW9EOuEDvAXOX+23OnBUDzeoWR2uFzrjulgHicSK/IojMghkvBK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819JaVd047670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:36 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:35 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:28 +0800
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Axera
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-1-993bea305476@axera-tech.com>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
In-Reply-To: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>, <hlleng233@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=996;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=oklh748WlI1Baphd5KWMOHKbvNEfa9GuqtcojTIdGwY=;
 b=Qo/FT27rWdpBzvdqt0fGZsyFt0vtwMC1aX9edOXITLiKjIlDU/+6/X+GiKK7Lz8NF9nIOYOXB
 +FgwcYCBFhTDPciWKObSEGsR0uVzQwx35AQ8zQ8xvP7hgwAx1defERN
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819JaVd047670

Add the Axera Semiconductor vendor prefix for devicetree bindings.

For more information, visit the official Axera Semiconductor website:
Chinese site: https://www.axera-tech.com/
English site: https://www.axera-tech.com/en

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..1dbafe682724 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -219,6 +219,8 @@ patternProperties:
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
+  "^axera,.*":
+    description: Axera Semiconductor Co., Ltd.
   "^axiado,.*":
     description: Axiado Corporation
   "^axis,.*":

-- 
2.34.1

