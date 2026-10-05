Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB484E8E18;
	Mon,  5 Oct 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221459; cv=none; b=IsR0sjR1HJq7P8dK+MGZ9sZOAHyD1YbyUxiNWdjpSCy8m6o+M9KChiPNBGr99GEmkZ30h9zc+Yzk3TXwdkgtHWtVjvLMw8fn5Op8j4jRZCxniMWVe709ukqRO/kels9Sx73qG22ZY0Kvc9xBMMwxPhHio5zCA64m0FFyDJn9I7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221459; c=relaxed/simple;
	bh=ru+ebgapaq/0AmUGGrPeE8LajveSkFkh91VhizWmxKo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pMYEe5CZKikhlzFV9A2BOfcy12cBb30O+3VNkHSuDN4O+24x8GMceXUPjWpwTV+PPm3T+REKwIuWrJR1qzUsCfm1YKOslLk9rh+Pm+0g5CvI5jRAGzTU2CzYluiUEtwGYnnFJO06RGL2w9sZQk+5LiQy8CiCtO587hlfLe12A2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CnYcGjsz; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CnYcGjsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221444; bh=xsQ6WpVz6dLVvH0jIBhmi25p6i3B1TGiyxsQ84fsA2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CnYcGjszzX4vLRX+c/tVUCcO8hGJMp1q3PVyJoN/6xjb7xwekfJD9bwP5tCOTH3vE
	 6Yw+uEBODCQKULOXuUcv8G2UJKRUqeoXlC5fy6EMEFe7XBVN18VjtPkPl79IEbg//B
	 2pKdVO0heDyI5kpKDuqIh7mKZzkA/ylJbOWzKsHs=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221442t6kaszaez
Message-ID: <tencent_C77DAF0026980C137B8C46907F855FC9E506@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqf+ciKQjAvwfVmEe4sr15OLSKB4SNAmTOQmrBm32CGsyNdYdTAaG
	 I8j/Cid2dyzy1w5em+7qNt5yIbjAxZ2KXvvAfu3Vb36iuzTRscsKxRCED8KQlwpsqRW1xBS6Aal0
	 mqa0OL1koXEqMm2ec8V26dy3crIuSE9w050iTVBZnhsH/zckZTXUp2nj59xqR58os5P+9KlzXZfv
	 SyOHPQ9S2bLxEfKKot1KmrelxxGNd8wgavvGDyLoaCLBcsaAMEipw7zfMRcSjdSoBMXwiNQaV+jZ
	 rtF9KIvaviVkH0qYMkMRcozEpiVVAzcgMt+0o+xeqR+wZiP1O0AdDvWyIY6+7L4/yjdAKlDs8bro
	 uPIBuyx5mEjCUwtyROvC8bJwgCbsJNfgadFINjkd3yx7amXqhYnh3em5ze+jGlurDJ6xec4hIIIb
	 b1Vgu8eTb55FvomtDeeEJr9XMFZleh3zyoyDw4uhV+4wFad+iZ0w56pzgLCzueOUBZWPNd0vFek9
	 pg4wvIIj5SdIUpXCOFhqXDNNm40m076RTEXJQJmg+FfOvL1bZQB+Oly+QrNa1NoBW6FyfvuDp5RP
	 U7MzTKzxyxn+q7ACzB5NwIppxsrB8xPqEGiFa8Suhty0dZE8AswJTFzrb6o+U2IPhXm7g79nkmV4
	 2wdPU0kclAQDpIAY9mfe5d8UBF8iJGpVLN3tQV6EGtVIrmjz37tP4m8HsK+nop2Palky4Rn3qohO
	 TooJgjZX/6xKqcVO+PEhye68xsZ1t+0/N/r/LGdsc4xE9TELcMszYwGFNpcpk6YZdxs8riZy8O+D
	 NcxXdcqCGXEl4IXvZDz8KCcr0QDNxEU+MyOWU0KLv/JpjVNrS8+cRvIdXvM2IOCna4EUYHppowpM
	 /lp7O4BeGj6v+UllWYbHCKgOxUQsXubsI/On5Gv+EoQE3sFJRcR5eKj4YZ3ng2R5h6Ogztfjitm/
	 FI3VL51J+dlUgUCtaO2lyg28bIpnKDqDGwkXBi+pGflec7mWoa0GbifAZIGHrv/pq7zl/eE5AHqz
	 smzbeoNG+yasZyhsaEcg5nEf5v9u2W93mC0C1WBhQ5eNR/UQ0dXXwcpRGkWLWymCikkDlGOlSWyb
	 XK065aFcyMJdB4Sg4=
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
Date: Tue,  6 Oct 2026 01:30:37 +0800
X-OQ-MSGID: <20261005173039.707304-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173039.707304-1-2254650260@qq.com>
References: <20261005173039.707304-1-2254650260@qq.com>
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

