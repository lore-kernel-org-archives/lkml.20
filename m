Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232030;
	b=PgRvc6xn5UQ9tueKaeGfJk0HM4m4unAwum26mp3wHzIyG4NHo8qpM6QNMcFZHSV/i2aY
	 8j958ipC0SkSIbAiiTSY4M5h0/vTgw2uVCB+wvVuMz6S0u40KhC2DJmdk8rYQuA6ris8j
	 BZuYfRcKXOoIlcYPy16dK8Z/jS1/RWC5rPqZZRqGMIOYa+rK3j6ILH78ig8V23LQtXE/O
	 9mEl/QBnrMYCZMM5qIQeSM8FkaVZOBhuinQZ0nmHcVdATYPVf+rvt/jAAp15hi9hXqJbe
	 lZIzH4ishJ08aOSkbn4kwJTkyuXjfML4NkZ+KpFi/rEdxl+Pi9Keulp+BkIdzG1UjRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232030;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wflvUIvpb8LnTrG2Z0thwzr5WF/qe04KVVFy6OMjJiw=;
	b=BCrf+QFu7+/HQzIBWRK+7vN8INfOdRoKlMoqK0i6CifbWZiSfIMFi1V50MtBbDjwNZwA
	 JCH1F99zfQc0JWW+FpmJYHCYhV/hODvkDZMq0rvCXp9ukE+v95IhLUo5+EdfpV67P6bzm
	 yxx260cBO3xW74jbQXTnQaquLuXaxNGYGeOr1uh1b+GhKirmfQrd6Kiv2JR+PrQefubbF
	 ciK9yetOUYCnlovPHX0hRLy97G4HcuRsF+nyeyameRT5Ubq+j5lER8h23bD+chUxQDoTF
	 fywzS9sOqIgOGwb97YMBjiYs+5l8PyRXQ6lXMHJsbfOGSt+YUpUe3VJFbgomECrgtlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGmCixLq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E4606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGmCixLq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9301F008A1;
	Mon,  9 Nov 2026 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794232030;
	bh=wflvUIvpb8LnTrG2Z0thwzr5WF/qe04KVVFy6OMjJiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cGmCixLqUharcHBFLfkO+gxu8owcaLPjfo7w0bi7QU9ixMCKLeNghoEwCwwx5oFkC
	 l3N4yUfMCO8RFkoyCd9+j5E4iScafjAzQizh8wN3W6COMBS2jLouJJZTKfqAFmVlLy
	 KkVrpu0fyz4sQRPnxAyLhVA/JW+5bW35tadhCiSRXbQKm3lMi6g5XibEp3eGvQUwpD
	 D0kIqDmEC+9nsU4gt5EUm1J8DHKlN1nkGal7IrkjscG2zYICQ6yEIK3bd1+AgNEKy5
	 VzmDRCmULhP7MG0xb7IhOIWMePg+zHagSFPLWoho2J7sEkehydwwnNCkbzR/gzlras
	 v0/J+BT70OwTg==
From: Sasha Levin <sashal@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Reid Downing <skibletz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memory: fsl_ifc: Do not dereference the unset global pointer in probe
Date: Mon,  9 Nov 2026 08:47:08 -0500
Message-ID: <20261109134708.263012-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179370686157.132651.15818367772843670877.b4-ty@b4>
References: <20261101120838.36227-2-krzysztof.kozlowski@oss.qualcomm.com> <179370686157.132651.15818367772843670877.b4-ty@b4>
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

Commit a78ee2e05f7c ("memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure
and removal") assigns fsl_ifc_ctrl_dev near the end of probe, but probe still
reads the IFC revision and fsl_ifc_ctrl_init() still programs the event
registers before that. Both go through ifc_in32() and ifc_out32(), which take
the register endianness from fsl_ifc_ctrl_dev, so the first probe dereferences
a NULL pointer.

Use local accessors that take the endianness from the controller being probed
for these register accesses.

Fixes: a78ee2e05f7c ("memory: fsl_ifc: Clear fsl_ifc_ctrl_dev on probe failure and removal")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/memory/fsl_ifc.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 83991c05a6a5c..abd033bd94c5a 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -63,6 +63,23 @@ int fsl_ifc_find(phys_addr_t addr_base)
 }
 EXPORT_SYMBOL(fsl_ifc_find);
 
+static u32 fsl_ifc_ctrl_in32(struct fsl_ifc_ctrl *ctrl, void __iomem *addr)
+{
+	if (ctrl->little_endian)
+		return ioread32(addr);
+
+	return ioread32be(addr);
+}
+
+static void fsl_ifc_ctrl_out32(struct fsl_ifc_ctrl *ctrl, u32 val,
+			       void __iomem *addr)
+{
+	if (ctrl->little_endian)
+		iowrite32(val, addr);
+	else
+		iowrite32be(val, addr);
+}
+
 static int fsl_ifc_ctrl_init(struct fsl_ifc_ctrl *ctrl)
 {
 	struct fsl_ifc_global __iomem *ifc = ctrl->gregs;
@@ -70,16 +87,18 @@ static int fsl_ifc_ctrl_init(struct fsl_ifc_ctrl *ctrl)
 	/*
 	 * Clear all the common status and event registers
 	 */
-	if (ifc_in32(&ifc->cm_evter_stat) & IFC_CM_EVTER_STAT_CSER)
-		ifc_out32(IFC_CM_EVTER_STAT_CSER, &ifc->cm_evter_stat);
+	if (fsl_ifc_ctrl_in32(ctrl, &ifc->cm_evter_stat) & IFC_CM_EVTER_STAT_CSER)
+		fsl_ifc_ctrl_out32(ctrl, IFC_CM_EVTER_STAT_CSER,
+				   &ifc->cm_evter_stat);
 
 	/* enable all error and events */
-	ifc_out32(IFC_CM_EVTER_EN_CSEREN, &ifc->cm_evter_en);
+	fsl_ifc_ctrl_out32(ctrl, IFC_CM_EVTER_EN_CSEREN, &ifc->cm_evter_en);
 
 	/* enable all error and event interrupts */
-	ifc_out32(IFC_CM_EVTER_INTR_EN_CSERIREN, &ifc->cm_evter_intr_en);
-	ifc_out32(0x0, &ifc->cm_erattr0);
-	ifc_out32(0x0, &ifc->cm_erattr1);
+	fsl_ifc_ctrl_out32(ctrl, IFC_CM_EVTER_INTR_EN_CSERIREN,
+			   &ifc->cm_evter_intr_en);
+	fsl_ifc_ctrl_out32(ctrl, 0x0, &ifc->cm_erattr0);
+	fsl_ifc_ctrl_out32(ctrl, 0x0, &ifc->cm_erattr1);
 
 	return 0;
 }
@@ -231,7 +250,8 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 		dev_dbg(&dev->dev, "IFC REGISTERS are BIG endian\n");
 	}
 
-	version = ifc_in32(&ctrl->gregs->ifc_rev) & FSL_IFC_VERSION_MASK;
+	version = fsl_ifc_ctrl_in32(ctrl, &ctrl->gregs->ifc_rev) &
+		  FSL_IFC_VERSION_MASK;
 
 	banks = (version == FSL_IFC_VERSION_1_0_0) ? 4 : 8;
 	dev_info(&dev->dev, "IFC version %d.%d, %d banks\n",
-- 
2.53.0

