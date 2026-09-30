Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625253D813C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761839; cv=none; b=ZsOnNj2wR4bgqrb+Xx44hFv2fuYNzoj42A8Dh5W7zmJEncT2w+kZ/VG6kFpSU0H5QeyHjxN54toHV2kKWZBchRies32e7Nnl07TOHFUkul/G0xwpJl2iqjeE5mQuXvQuBqwCoRBddUkPvptbUJO9z0kOyCejT9i6y6VLE9OriBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761839; c=relaxed/simple;
	bh=uG4KbnlMHq1Uj4vZAB3VXab51g1tewuUnxWaMdpS2PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzA5Rr4yUyF3KyqrpyeeU791VDSKJoqY8GHpv+L5mHDzr805KcgMkOwIDMOlohkcjwGfIUxdKPHCgk8cH5HU8nDtC+0RxnLC5hJ+LIzAoLQTws5zLGHzYnCrafaOMK6eA0Xna5Ifwmwr1Y3K7+XPw4SgqNqsgKxnvNZng2HI6OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONgI/01j; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONgI/01j"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4918714eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761834; x=1791366634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=;
        b=ONgI/01jGmTvqgUyL5VdmT/0QJCVlKeM23FvXOut2H/nQcu84D80e41G+cY4Jc0QVG
         nFkntICfo4BY0VWn1n+iU/ud0VhTYL9MYcavVelxFDhxt/MXOog6o9/C2YfdgVCex6ud
         96gmm6xmV9xXoBuBi5wm+ZKyGOnJdikLj4ai3V2zUSwNSXUX/+Kd0wUr4QY/rHNWFRIT
         SoPFMFkhuBIoF2+OnEo7p3cx8yDu2Tcj+47bU4qBj84kKoG7yA5qUIpGGbj2XjW4JgX9
         gnPhIe1yr010wBredzE/YK/7uzNblJyvZv8qrg21bl2BOPNZCj+covI8LRok29p24hPE
         +g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761834; x=1791366634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLtGDvHzD6CrNoA94RNqXZ25K72u4Lfc7xmaaJ1VbZc=;
        b=1iq+QmUO9qbyFhnuuoXphrp1eVrz0D5HiUUZheRDRwl2j3ejQfN/JDUAjBnx299TtK
         QpfpiEkpagUm3dREJ+rQXgu3tJ1DXfbarCwIrQnM8VcDr9FGRR5Q8qofhY8i8X3vxrj4
         LepSaseAxf+Fkoth81tmAILvsbEt8vl1Rh4ely9vzGSDjs5drQf55aQnZjrWdWv1aswD
         0Smzzcy2CIEZj4ACQGHIDC5sE5zF9rnwU1A7psY05tbAF1t0I5zr8oW92ie8EZNkreKD
         QuGODP+n0/IM9hpTtXIglzw5HJiN7RnSlJJ83/xZziMo5fPXPM6wTLC5VqF001O9j0ZR
         ww4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzB+em+wWS7RcW4sjIKgbaoGn9W5vDGLE/Pc1fQZIsd3+TJC6lFfB9jmR/hnhP5nm7qiEtV3tGa3HPREVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3huHsoKP+TQUCQ2as55wmnIdsd9F3e6isfu/nprlj28MobKv3
	fjPtK81eKpsrlS42XjGdZd5GzWJk3/Az4/KwZtyseSHbd9N1KZHmwmjX
X-Gm-Gg: AYBFou2/0L78i+lugI+hBWrlmwKFtP7VHjyoIUsyKDm4AWlM89AVBpSKGatz552H4ZE
	sdi2miwo7byXsG+BL72wtBOI60YTJocXNhoj3ePvYoA5YUR0jxPGojJFojFEauQe8UuwkCbbF1/
	G2/ppwyzcpb4aTZEnqzw3j4uKh55dTJWzdG0k91aJpMSIyWCLgnrHIkqwU8JcnzGg4pd9956V44
	IODbaaMarAGsSAIB0Az5wIEbXxdo6MFEIY6sozjnJkQ0+qnvFpIkVKHmO0a5kqSP/qkXs9iEcz3
	Xkpk6Jqj9fcotQJdHfeCcrUX69ywNHcmWJWT1CBfPZt2AIWo/bAA1bCVgxHDewG9F2YMNIRx3Kq
	JHhTA2flCTNtB2b5Iar6hzBx7c/YSSMwO9TEzrVt82aUOGigbM7brwjgwfzEShE1TcUt9nJCAk3
	+th9zh+q1mwq+K+hCqCFxrpG+eqXFV6eT1t0N3DNjEdHDSDVLZTbG5hyGdAUFvQVa0hUzTyDuyQ
	GOoLpH3fq8U/IHoD2vv
X-Received: by 2002:a05:7300:fa07:b0:33c:3134:f45 with SMTP id 5a478bee46e88-34cd907665bmr1266990eec.5.1790761833122;
        Wed, 30 Sep 2026 02:50:33 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf50553f8sm4934658eec.14.2026.09.30.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:50:32 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C3=85=E2=80=9Eski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mediatek: Fix integer truncation in fls() for resource size
Date: Wed, 30 Sep 2026 09:49:12 +0000
Message-ID: <20260930094912.3069-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resource_size() returns a resource_size_t, which is 64-bit on 64-bit
architectures or 32-bit systems with LPAE/PAE enabled. Passing this
directly to fls(), which accepts an unsigned int, implicitly truncates
the upper 32 bits.

If a memory resource window of 4 GiB or larger is passed, the size
truncates to 0, resulting in invalid AHB-to-PCIe translation window
sizes.

Fix this by using fls64() to safely handle 64-bit resource sizes.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a60d1ae076f8..61591d0176bc 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -754,7 +755,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(fls64(resource_size(mem)));
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
@@ -830,7 +831,7 @@ static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
 
 	/* Set AHB to PCIe translation windows */
 	val = lower_32_bits(mem->start) |
-	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	      AHB2PCIE_SIZE(fls64(resource_size(mem)));
 	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
 
 	val = upper_32_bits(mem->start);
-- 
2.55.0

