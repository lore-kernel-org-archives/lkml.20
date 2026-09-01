Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59782470E99;
	Tue,  1 Sep 2026 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254449; cv=none; b=Fih82XmprjpHuki7lZ0m0FJXQ6XILLl60YSInMF3i8pldnetQ9cpgqZj8H7OsDDgauGI1jbrhWHN8BQQiDi8qeBwdD9GcLSQM+nwRDix6TpaNAFVexh3anXNDcmrXsZ9TB4u63msgxSRB89mDNmYT1kQvGRhLZ9eeg4Ab35nIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254449; c=relaxed/simple;
	bh=ZwHs0S0btepTACuCuCb4VlyK6Zr59+wGS6ik+6j6IFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=srHK9qcqTFWe9UjXRsYHtxyJyan2olByWSFPmqxUJPriXvCvoGiekQxLwSHjiXwO1u0he71RwIBA7PygaTIDyBW8t892f1JD1wpdzj4cxUGhUewgv6VZ67aPxXPpfnULIkw8JC0bUo0SxHQKvP3ue2Ezl5V//7xjNgyk5ywL1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819JbJo047673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:37 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:36 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:30 +0800
Subject: [PATCH v2 3/6] arm64: Kconfig.platforms: add ARCH_AXERA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-3-993bea305476@axera-tech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=759;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=ZwHs0S0btepTACuCuCb4VlyK6Zr59+wGS6ik+6j6IFw=;
 b=iBYMfgOq0yyso3QDB2sGEFVsgHzpq0sydRDMll7jVrKtuNYyBUFPDLO552fFtXBidyfOvsHjj
 DqJKjxrTEk7DWzXhzDOD/4dOugkV0h1XVLfdTRgxdp/PbL64BF5PFdT
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819JbJo047673

Enable the ARCH_AXERA platform option for Axera arm64 platforms.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/Kconfig.platforms | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..a6f2f009461e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -54,6 +54,11 @@ config ARCH_ASPEED
 	  This enables support for ASPEED's SoC family, such as the
 	  ast27XX 8th generation Baseboard Management Controller (BMC).
 
+config ARCH_AXERA
+	bool "Axera SoC family"
+	help
+	  This enables support for the Axera SoC family.
+
 config ARCH_AXIADO
 	bool "Axiado SoC Family"
 	select GPIOLIB

-- 
2.34.1

