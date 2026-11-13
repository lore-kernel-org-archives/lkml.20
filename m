Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595379;
	b=GlWGKDFsAdA948oD6h0kkw02lJSWYrU6s184QAOyvO8z7R6A8WkQ5z9bKqJoGmfdNWGq
	 BuRhXFMRvafBDRn3lik9hMaJUFOnLeMdQ8wr/Wz9hC/XZCpj/uCeyT0tF/bJDyknLAumg
	 npJi279fVCCsALuo83Chat4khTtAoCiYldSALpfIi56VJ3rXc0zjBb/YjpWG5dyK8ckBk
	 dBWEe+V+MZk6zLxU4hereLnwZNsTWSMtvE3szF7vdalM7Db4cpHRoM84kkp3zEYjI7s+l
	 7PaS8DSGwr715K7x0yond6ycqyGTqSNjqnxGjN08S63/dpcR0IqbdD+d7gt4l4eth4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
	b=vLCioW4IYOuo9qkJ71lWCynanb4o0kd63UrcIuDcZ8N70KMhRo+KU2nBsRQUm5Wy5xz7
	 aGKtC4eoSouuaeKkQODh3pH+wUbvfnkLDWO/AEuMQSr1lPk+pKO+leJchFYgMH7/eU1xM
	 VcKeB4B2gKOx4pV1beLxEosK3bvwkoi00+EF7UPo6DFlycn2RK3H5nk8DzFTANcCRv9Aa
	 n+6IAWSLqnD2KBlxaJMbMOSIN+N0aybfO1dJLi3C5x3UlWLVEyoN9YruHOPP0PuwMnQpi
	 RHNl/9D4supQBtcpCf49+0gCWJgI0Gn8SC9kl8Z+UqA2/5g2VI+m3Udi11yXzvVToTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DujpyMGO;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A5606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7A5606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DujpyMGO
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so1638070c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595378; x=1795200178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
        b=DujpyMGOCXwBxNvFAHhXCzNwjDMLag7g/AGwePRGbvSeJuZ+/oWILTWgni9F3/IqTj
         0KnkDUv/wVZJp8mLg3DZS2jQXydz4Fg22cj42Nxck9LIWMsqflqnD0/ytfmwjyoGwn9f
         NDFEx96DKN/LIfxyTk118ydcAeMHEXNm81eVPLQW1yWSgy/u3Q5NviyZ7gTtFUTk8Re+
         oBJkzhSXsQ87/Ou8eFb47KlJEAwcQ0IpyBnydsmBo1inyUe8P9ZfxJMKZGrAHZKXYV7/
         /ATWRR9qwBJYCHbdHR+bHa2MkmXli5quY/ZxvPa7Xy6/8ykSRjyAp2NNF00PHGMfoLyC
         d4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595378; x=1795200178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18ub26cOjD0F2CxgTeL8whdA7ZyW82V6k9L7IoCUwXY=;
        b=t6mK9g7MiJHcaPYLtY28VHO8Wq1NBC5V+RNbiQhiKxOxuLwiJ0Slk9OpMFVWy3RmtJ
         ncd6rxz3CUSJNv/KPXfHfSl5MynUu+19wyJIofgvpL44Zlq7HtpANX04mLEAPmbDEmSJ
         5tZQ75cjCjtOG9FDFsmL4z8hrB9FrLZ2hKB80554ZzKxr+pS58P3JeM+6P9/6YQTCTmZ
         QNQxbVMRmpVbNYct1S/P43cLB/U8C4xQrQfplWxL8kSg/XAK8MiCkMda7niP/UfOWl1X
         N7Pjc4gsGrsFSGyt8opMpYg+N0eq+saq6g1fnNZqUWrY2O3KeQLlzMLpA/uswDdh9bU/
         /qHQ==
X-Forwarded-Encrypted: i=1; AL+hErG1MyF6OU8ItUr6H+zJHNZwuLQDn5YIQlc8OAaG1JE19eDJ+mv3YA0NVYV0SEDZ0mZ0g86V5bnFN6EFy/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U22vtAAHVE0Qexa/VfURRYfwdp6kNlOkb8bJnIsd6nZA+FDK4
	L8UxnybA1hepDTrBusI1scXTZudyOrK3klen8cTheS0nw5qVGPPCqEQQ
X-Gm-Gg: AYBFou0xd7TVE97xB9bUlCjqrTHWq0/prC6k4buARnlnivFDnzeMWv3gegZXWDTIR/x
	w04KaKts0GFVxsSSz0dFVTIQd2RW70tHk9XXpbz8DORl0COJe1LjsHe4QvdLieQJmTE8ZBT8jS0
	+cXF1LuM1iWA8hJe6n1mjZp8nx6wHkw8+LLTd/8AJzb6r/xvUt8Ggd3YuL7X2YDHYxlBbQSOBZ3
	tBtA/vN+FeVxFJgixmlLZz0yoArmXaeKUZUhvF+L6NGywtTb2i0F1Ai5YmHw3x2S5oUXBxziqtT
	X40dDIebHzrnqIbpo+mAyAz2XjrkyOzGo1kQRtmlW/Os4ErpY3TFTKXiKp7ih/8XsO6SVbSLSQZ
	/kgT0ckG1k8l1JzxWOIAyIIfNTVyBx9YNCDTH7H04SuZB1aNBSad9pbxOwnzh2wHqBpOZ5biIT6
	GSnyqB+F/z1OfA1B6uTuYeBXelH/tRVblFaS+GLWaZVr6LM0t56SpAg/c9u9F7GAIr5seZJXDAp
	/i8GCmlNaNw+DZ/8giK4uXTjPRbCdOniPOCfaTyCqjkHaod0vca2opFqmDsA8wJo4GiUHGkE7cY
	7xKzMHpob1WWP41zhW+6vxZVrG2SkQ==
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b5030eb063mr2749528c88.12.1794595377978;
        Fri, 13 Nov 2026 10:42:57 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:56 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v5 2/4] MIPS: Skip generic IPI setup for platform-specific callbacks
Date: Fri, 13 Nov 2026 10:42:08 -0800
Message-ID: <20261113184210.470320-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
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

A generic MIPS kernel can select a platform SMP backend with direct IPI
callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
mailboxes, so generic IPI allocation would find no domain and BUG when
more than one CPU is present.

Skip generic IPI initialization when neither selected send callback uses
the generic implementation. Keep initialization when either callback
uses generic IRQ IPIs, and retain the existing single-CPU shortcut.

Sashiko AI reported the XBurst integration issue; Codex assisted with
the change and extracted-function/build checks.
---
Changes since previous posting:
- Split the generic IPI initialization guard out of the XBurst SMP patch
  as a prerequisite, as requested by Paul Cercueil.
- Add braces around the multi-line condition.

 arch/mips/kernel/smp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..086298146dd8 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	/* Platforms with their own IPI callbacks do not need an IRQ domain. */
+	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
+	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
+	    num_possible_cpus() == 1) {
 		return 0;
+	}
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
