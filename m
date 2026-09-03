Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECF3A3E97
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476374; cv=none; b=gRLRizfs63r1QJ6KnLbUg+4F6Z9bQX5Ig2wuIWRFPzoyPOREKyMczL7wD8wbhkbX2hpW8OjAM6InfguVDz9DhLEY/7pRBp3NU4eSD6dW4XnY6CDcZ8py2Crd9yfpcPO+9SLYOflgLIDuv8et+wLJ95sKTe2DGyTScpcy9HE9NYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476374; c=relaxed/simple;
	bh=dBm6wiR4NCMuszCPNIsVX9WFUcZFQlUHejOmhcoyT0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8mo4Jg6rPcS79zE0RD0KgNerB0ZezHGXafaNag6jKrPOYvHmH4on+LLN5I4HcTEkZlAMMWK1bRFD7qUnsAQSn9/wb1tjkkJiyxunIGO4NnvE/0WvQP/qrynA5k2/toTYLl7DRl3Ddm4uhXSuOrotGJdtUmaXWdjHWwYysZWxTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48436216a98so281335f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476369; x=1789081169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1SiDePVmO2z41UWzhMW/dfuGDGSD2CkgizPnd7ksWA=;
        b=lgyrduy5++TAZ0U3wUutjiw+ywYp0Ass0XWdrDC6CweXSySV/tRMbVkv9moXJshGOj
         MMEPia7DRSPJ9QM8CuK6lfASpVC3fxbjpcV5ixd5qbtFPLDlgD8rd9oF08AMrl6nAYhb
         S4juxcZpkbjifbWd6zR5qbj/jq/VIaD2Ch9delLymmAY3xJWDB8a8iRiERkUUMn7WIig
         dokC8mcKOte50D0ceMC/vm6+nxeW8rVO7Sd/xCIH+gMp/haUwZM/QpOJvX4ofGMMXCKb
         gSEpjLCNNb4v26tBt7NKqfGd1LQyGcQyybFmYmerdp5MxEZN70bzCXL3iVh0gJK/cOhp
         Rykw==
X-Forwarded-Encrypted: i=1; AKwUvBwwwCm/dVENFh/8+p08Cu+i1/pZWLzHSi4qdaWyE1QUzsiHgQJdUdgECZ33KCZE/41XRsXpMpAzshDVkjs=@vger.kernel.org
X-Gm-Message-State: AFuF++m0erMisY4vMWdnVnsn5Ck1D7HAQvwwkxqiqJTfgg4T2UONoCDX
	TbuabExZRKeZi4NN8MWwyzq/U1qF57aPAXw6tKo1ZjZooTKRYuCWKoCp
X-Gm-Gg: AYBFou0S5ntLf7S2UgBDoF7wzEIrMwRyhtpGZ080y7Wsafa2Ip+t9to4KOtUmkV2Wxy
	xAeTMFQSvJuZZ+T7y9E9GxII7Zlk+FkzVWOMdqR0V5V9u61/RJDitBqm7wXIIG2cMReObitY3Bc
	uzqYoQk5xF+I6OmcgqNkeGSgLPa2S9Z3AUiYuEW2Hxr8epAMFS/wAmcR6OkWK/o/hKNqH+xkGa1
	JQ8ND0WrhTcTRFBmf29MW0xAA9M0f4DyADO7pmSlynOd8IfjxoD6v+DNv0MTktSzUJFKKGvVJP6
	TOS4vKS7QEyNUcpaqhjZt9PHEX7Gc+DywrC9T78C1Ck6pUNaZcJ8sLoP9FHw/ehR6zzICJlbwK8
	cww8l0mbL9bPB43D+WhpBeH3sc4MO69PdwSUnsNUtpIGKpslCgnuGyiezJnM24O9JBqXsQEFeAN
	D6KmrUChEl9MKkTMc+DtJeamBGOF3gEFhMt/Qyl2q0WBYJo9jKeIMuy5m1w7hd5p2Gad2VjVEre
	er6JVj3NGNq/jm3OoiiURKFkQ==
X-Received: by 2002:a05:6000:4a1e:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-485870870b6mr4790999f8f.1.1788476368800;
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Thu,  3 Sep 2026 23:59:21 +0100
Message-ID: <20260903225921.2290441-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

This depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this one, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")
Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0

