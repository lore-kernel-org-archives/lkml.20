Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8A4B2CD7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622364; cv=none; b=oFVDS9mHcbdNHimFDiA9HELWcdSEVmE5+TrOl38qADU6vduiMBxscGx99wh3n10tUYPG5rxpHG2WIMn6+1dT5tSoyjY1FXL+3A+RdGHHp4M2H5KX/FoP6OCh2URMRxPHYXI+fkkGIbMDiuf8m6tjV5n0RUvb1EFWtyecMK05kxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622364; c=relaxed/simple;
	bh=HlStx7vx3piFzayiVi0TqGQGaEyIJNcVSIFbgAKrR84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCkE5+Rgf4rZw9GDzXjSB30cwbR25fqzmP9O8HIDeS8o7aoTWOqAsOAZrCG0pgbDQW5mOTCnBowyYmORrfFEvFVkahNIg4bgVXMlu9p302q11ykfaX/AwgkuKrarTnT83vUQMfWOokWZsuWByojDk/An4G74OJTv79pLW++LRIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4858303de5dso2480109f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622360; x=1789227160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBqYYCS5py1zvvdbPLcK4Z1TQdgdHGp93LoH6od28Gw=;
        b=R3oLn/Boy+GvRKks/B3Thzi+bkDanL6aQcD0NjXJZN+kOp91SaTcl3RadGOBj+1B1v
         c8FX8kbp5/8DgaHb8yBF6a+r6FEEjzYUQWFfS3RF3LtUmwCnWQTSmO/f17Tlv3F31s5Q
         dhAKF27pDKC5wiNqR+L2pniT4PsvmMxWNZixoZsPE7tMz4zwW7ckPiNNoI+2hzqesuNd
         bUlrgYahpVap7StDL2IWP+csXNb2CiylvOQjPaM6/dfZIIeYDO4vnUn9mxuFVLdbwG9s
         jY8pQ9LUiYXUc7q7CXK0wOs0Cp1Ts4zob6RVD9qpRIcXsTr2oZk+rfQnM9uj4g5xp8en
         byzw==
X-Forwarded-Encrypted: i=1; AKwUvBxIvM3J6cewYDLzeS7kE0XfPmDsyjt/OZ+5ufwphADbRJODfPUJ0f8msNqtq3fAZusbepGW3XCTYiwgNc8=@vger.kernel.org
X-Gm-Message-State: AFuF++kSn+yYUF2hk8n1w8gGKLv6oQQsyLFhujU0zRdmQ+nxm96MRjew
	iVFbQjNrxm6WWlXehhwGkS27GiNGmINEpa4SwSZeoWLshaNmqfBO/LF3
X-Gm-Gg: AYBFou3WgOkXZrsIPI3Ha1yXV8tz75hUaahJBYpK5SQxoVo01rXyPdxcN+jqR9OoTFm
	9Zrg6sojqjdN6dK7RWl1TGq2D92CrNACzVlze3bbt4jEF+x7zoFIaEGF+OJF5lDuZtCUfdn6rvw
	QnK33c2wK9+zH4yF2btC/xExEXWwb4lR1qaK07upgbYm2c0Lvp1ODM0HZ8uae2uCiZpQvOODtjp
	shf9YheBB2ALFQ6oyfkyeLxImU89/PP3sGE18+97SSF3/HyS6jgxkyygBoCaRObllO2FdtJT36w
	i/5PO1ZwwtB4fnZLp8F9Y/a0L7qyOgbWP4N/jhQTpTZXAeDLJObz6WawtjOKh4z4HyLYyZlthsY
	ubCVIvvJ7xrATM7Sx/DxfSidK0zN9bn5x/pwdnO3NAndl74CsjaKO2uKqca2Miu3G8uZE5gT8WJ
	CpaymOEKj7ZyENd6t+Eb++77pNLzSvtN2DZY5u7KBFuzdpjWwoZnM1lC6HuIePipW7gPfU5dFnC
	qtDjCSS8DODqDdD//HJDXynpQ==
X-Received: by 2002:a5d:5f09:0:b0:484:3332:d1ce with SMTP id ffacd0b85a97d-48586bf9cfdmr14652908f8f.0.1788622359412;
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Sat,  5 Sep 2026 16:32:34 +0100
Message-ID: <20260905153234.133217-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
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

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
This patch depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this patch, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

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

