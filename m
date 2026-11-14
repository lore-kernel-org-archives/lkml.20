Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699758;
	b=Md+/hdg2WBmt966eWILbpwCTTcgL55uDrUScsl+U6wjGzaxZYGt8PrCeJ+soZqBiGQXz
	 oB8D9eWd4pm4EF16o9/dkL+34CKjCm36+fH0cSNXWU/ymNJHyjwlTDysDR/XM7EY7ePkr
	 R4hHnkm087MYQsOEhtT6kbX4oOzOOnoxZPWjln91XiX2FP5FFzmx2+BKnIjXq1f51DwIq
	 IbVcVDb96EcqacwYVSpUXQxm+PtBAMYTJiuNv7Ln+kK3dxdHNud2VNFd/QEV0RNOAG+Hq
	 8cJo2tQgCW9KfG3ftUEmQNhIqrMwit/EbRN5DL/PRG4v8/GaJM4JlDR8U402GvNgIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
	b=uAuXJiLRBf1HH0xNiN60Tbmm93VHLF0FbWfhGr8cB1N1xTwOLIK/3O2fLdHCLAZLgaFR
	 WleDDlt4ZKLT90Jvo9XhYT4zrrz/p4kqPFKTMWBiKqsINqG4Cz5HEnu489/F1uloKUm6H
	 NuiFICj1CRUhD8D5v8RKjbh6w6R5NyYwlTZItjVO1iUvncZnwetao+qfOBiyAD+6MZF77
	 PAWjEKvXi6pFGeUr14IVR8syCWG+JCShZMVWaFqitL8D7MOuVeCW5MNbRwzn9AU4NYdqI
	 76m0Conz/yhtGbonXTHT5+VTjjLvdNkI3dlGDXFKU7eKLqq6erHcl0O4f4S0Qqb4Gsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C5606A8A4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8C5606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG9s3d33
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1224514a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699758; x=1795304558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=DG9s3d33XVxFHN9OdMlrQizyH32SS28Z0pjRS/Vx64SZvizFw6a98TZcj6jr/GpZyO
         8uPe/AWMPFNzKqXlD5TITgeGVM+O+sIWE3iqRgVgg0S67t6iwcRsGaqtqEcZ5FguqgA7
         Wt12nhYnQ4MbDAljt0rcO72ySodvZep5pIIbMTHWiXTGImaxQX/tj0//q76hbSqEg9Ei
         UQv+2N78i4sR4DCryexyX1Of+9VvuZak0/t2moqY7KxYLpGPUbj0v9H0PNoG8vDs6I2V
         lyS2V4pPgb3Xfi4ccuaKjDUEpY01+FNK8teUEXpRE9bntEZe1uYg6UNTJcJAr8rfzj+X
         oPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699758; x=1795304558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W084RD0vMitsWt5r0GlWYVXrFKNwmQsR+8dQtTFBHCQ=;
        b=Y7No+Pym/xhhYHvbuPOEr0UXM+/DvaZFILj1PSlGEmx5Bkdi7dJbZB6yWtM4TYo4Md
         6gkxCoXdIvO3eKub4r2pgSlny0YoUOtQSeYHx5/v0zKHrHkUJu8OlGxHD9m5CfXR6eC9
         w11QF/XBr0jqN0kO8bnHmgTrFsPnNsBnqd1W3Frpc+DaUdyt618Ep8DBmChlf9bwRpPt
         c9JD06CgT/W54DpQRL8upXmsKgkiHfKGWWNVTWEeO78YbYnB6CQs6OQE1tfRLZAVyxfQ
         Fou50fmTsFzd/kUro550KsxlS8gPm1o+KtPqoTiVN6bp4IaLrn2rqlPccsz/3+ZvRrvX
         48Ew==
X-Gm-Message-State: APuU4Z9h747LtoFu3InBDntoP1eZaJBKGIogTfv01XRWpOJ0XJlnRMtX
	ocQ36qUcbbx9Ow1pOdvk5aPoUQkssi7Swnr02J+x0A+tWuicwNx7YteX
X-Gm-Gg: AYBFou3ZF8JUgkKQnBq8dIww9l3rKQpv2qzEeXtsMj4aMSXwEQtrN/w3ZwubkgBs8Km
	QVd6cBLMg4mGokSMwkHIvbhcR7/i5jXtEQPF3i8lrKPcBERYMR69v+d/1/zRpp6PFujBAFrqh5v
	YquCxtSa4jW4+Fc+P9GJE5UPIlLTW7Xc9BTzw/Z29prUcS/R/+ImUgpit5sVOR5I2gbh/Cr98Dd
	ZdNRpihjKkUCNXaaeScxDuIsKoe5eU0nBjiAPlVeTejneQUl/kfW9JP1RzqDBT/NuHwPLHtLBI0
	MP3IpQ4hEVUsWHXoM7jL1wrDgIY2kejxIXP/lViYo1K1NOB52ST/H5qLg8iSVw3TzMKLd7HHo3+
	WHPBJGYijBRS10bN+YhXILWAgFHJdUgzuAFj1rWvzL616Fk09nydwcINIo8xEnpemBOrA6zgFY6
	lFa0YnXnDPPwuLv7zJXBl+oL0nocG4NO5Gs8XX8ALxgGKlBF4rMDAw+R93IeNLkzchhfIIJYr+2
	26jyB4opCnRDi4Tap93eKk0oIpAA2Ns+20ggu/WKC3cNmxP+IEampGzloXYl9NMcxDyfEYBrR0F
	NHvtJ+lu5QFVLfLvCMDkGVLl7BERBnzN0YPWXjqHtJMGVyset0+IUZ3hC4zTfl+ck3Gp0LlGH3P
	NjhpwXgtu8+dlkDGKv4f5LmCD0o5nWXJxGZ4t5ihcmtgdMfGXBdK/rA1QZnmPk5p7Fz+LW8HFgH
	gRsA==
X-Received: by 2002:a17:90b:39ab:b0:3ae:8410:ae6a with SMTP id 98e67ed59e1d1-3b1b0a1eec0mr6608862a91.22.1794699757612;
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:18 -0800
Message-ID: <20261114234222.88337-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.1

