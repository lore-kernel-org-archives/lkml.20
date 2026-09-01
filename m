Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08684734DD;
	Tue,  1 Sep 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254449; cv=none; b=lWXvWtpVxs0a5IgpxFN5qZggDL7TWkyUmOmt6FECtC+B0g5VE2gXmFMioiIAyxfB/9Qe3mjZB1LiHnDI5xwPqj3TM1n6P8LAsPId8aDKPn6mlnQDn4k+bZOmu6qa+yafZshSri3opoTjwT8kKzGs1dm3khi56CpiPWzIwdJREO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254449; c=relaxed/simple;
	bh=lY3H3CECdbVmg66k7XKZsXiqwLwFaAv/7LL6m5RONQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EXeywXBcG0H24GekoFD1zIKqHDPK1/DEd5r/AjpS/hua8MeqjXpYx0yCegbUOsAYI3ZkarVRdIpyWF9N0RZqjc/P05z6jCkLzWQJfkvBHGoMrO3k3IdUjEs9vNqoTOTXnC/xwY15NtC1hOXEIONqNLb2Id4IeapluMe6j56myGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819JcIG047674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:38 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:37 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:31 +0800
Subject: [PATCH v2 4/6] arm64: defconfig: enable ARCH_AXERA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-4-993bea305476@axera-tech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=579;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=lY3H3CECdbVmg66k7XKZsXiqwLwFaAv/7LL6m5RONQs=;
 b=PO+EGm4ITO/sCGhBPDdL30RjnQwHxVEvYdK/B57ayU/qU4R6VYkK40Vm7gm6IhlFgWmFtBUFO
 +aTH4EVD55qB09MJ6aP4IQeuRpHB7LohKuS0WGPommoibc9/JSIdj8H
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819JcIG047674

Enable ARCH_AXERA in the arm64 defconfig.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..a2c2b41f0146 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -40,6 +40,7 @@ CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_ARTPEC=y
 CONFIG_ARCH_ASPEED=y
+CONFIG_ARCH_AXERA=y
 CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y

-- 
2.34.1

