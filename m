Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915412;
	b=ET6RzhxaRikw3CAcEA/Sh8HuMuOiqxkbnHR3DyFqgc01AIO26fJ1bT6VNet2ZA6oOzSQ
	 JIpOXmwoUrgWR7ocJ1ERD9VhvRi8CRuL8lz+cyaW58EVqM7sgv8mUFQH1jjVYr5dKLaWL
	 2yppYYgSgDO3KXzV4u+Rtfubu5841/52IFOHipVjMY8KSfeJWGhw3BigCqgPMDS3ZcbSQ
	 BNQDWKbSWnFViwox0gZd3A1UTsm1baAmpel/AmFAxmAeF6KfVq8Gbtkn40kLPBGE2X+CW
	 rsHTwh6HTJ+DQJ2yhDgVL+d843/bTMvAjGkJmR9TkX3sIdiZTmI+OsiWRREmsG75yJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915412;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dxqcIqtWTxIZw43ZJIhJkSexxCStYIQHemKkftsp9Yg=;
	b=zdfYjOIPs6VyNXA5TWTt9jDLsXn01LrK+W8lsGU7NvPCQCF1yJsebrK/r6QKvQzTNAag
	 7sL6bhm/3HLrWWYNZO31OpORiHJlGnTaj64QFl2shp3tlwSumi0NFuTdiVMSgvHnICjDS
	 Py/yu586Jtnkgehf5qOb2a8ZMvF8z++C1QSCWPCRq4t+VZy7+39ahCILJ7yVmPsrehvA5
	 Y0tOi0pSze5OhJ3SN+1iOrOvqSL6yKtvUKCLz2Hq47n6DfMmturWFMAaHKiRc92dK+SUO
	 YJxKyMb8yomsbdmCBPa6x3WrdMN15BFzDTz0+LarCnay0MdAuHXSlZH0IrED4MsQb/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmx5vI3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4C606A32C;
	Tue, 17 Nov 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmx5vI3N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794915411;
	b=yolpu5J+3qyNUE1/VtijjH5Q3Z0leTc2vSxmU8HQYPQSqxO0Iufps+7RcUnlnFyKthrv
	 Y6dAeg3rzZtJLIfp6kWSQKReNIIW154+ChPGKb11wbbrwTb8B6cBaOL3d2Tiv9yjGxnLb
	 WEBgH3Wqk3sfzaQ3CVgaC2RPOwNjTEaQ0w+b7kBy3cFi3ejZOgYjNSDEEb1D5hVw4t5+q
	 0aVf1yKrPGuaYAHea3ATR9tI2kAiTQLpAU4SwU0dFkbXvPZESxE2aPgZ+4ssVHmrmxflx
	 96cVcqvNDOFTirUhVTHCuMzsnE9a50EIyZLsK1rIobWtcq/qBmH60zUndqn/VWj2qlA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794915411;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dxqcIqtWTxIZw43ZJIhJkSexxCStYIQHemKkftsp9Yg=;
	b=qU3UGzxXjmNBs+SIoZ7j2QlwjDLVluCGS109GL1+Gcsq9l2a+sUGDIdXaUtlgqKmK+8b
	 rZbHN908uJ+K5BrjdawIreZcK7Rxx6tSh3+wzBh3jR1hFvRhGpAdNqcULSFVSRmpO7f5l
	 S7baQmdv5y8GV9pWHN+AiLfoPmAMvFWLFQXzdj8vdCWrwykTwdsOx/haZ4MnZRWS4RnZO
	 wxL+q2J9euZqVe8F3SjkmqWX018qsWdT+doATiglw9NeM5J6hbbM/Oi1tb3K2yBPwNWLW
	 4/Vnb8rAN0/Z45cbQEeDOr1wndktuyZcjdVB/05Vm9heDSH1ROLl0GpgGxa2JiJvFAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD4D01F000C7;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915411;
	bh=dxqcIqtWTxIZw43ZJIhJkSexxCStYIQHemKkftsp9Yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bmx5vI3NgMAOo1PO5+XWgVz378rfy4oAmOhDsR39phU2KL9Gqr8mV53Bh3hi11Kkz
	 HFEmEt2Qgk1GVTfzs2rJZeO6Npi3q3v7mNjnk62lVoloKwnlmME7Et9P31S53Nzlmp
	 B42+tKonzpdx02OO28qWBt2XRtVD72ylDYTcE4WN4TEO+QwNTm+2ZW96M/uLTTSRMF
	 YVkRGAR28jwxM6lackJEp8KdsTblKO4uUJ6M7eZq0Yb1sgWQfNX0H65RoHoyIttWjE
	 YJ7AAAijNL99C8VlCftdOBnz7cf3bHarewkBXGJIEXU5Yh4zqbGxxXl/AXEa+wUHAJ
	 HEvCMOlTjlb7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5C34F4A81D;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 17 Nov 2026 13:33:23 +0200
Subject: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin
 post-processing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
In-Reply-To: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794915409; l=1737;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=2fMHy4JxbvhP2Nx70MB1a2Zu4elW1Lbb73LR5vQKGOc=;
 b=GEZYIJniMHkcE0LLN+BoXraYuM1xaVRYosLrMetE1QqhfWhM0dvsvNLsGoNwPP6fVcyCeuM75
 ATyT/SPm6g5BpNXis2ddYoMCVVdfRp7NN/fMuEYTVwyCD6F3aWFEbvj
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

MediaTek SoCs are often released under the same marketing name, but with
different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.

Since the speedbin is stored as a number in the efuse, add support for
converting it to the bitmask for opp-supported-hw usage in the DT.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 980c29d01337..d2e5c69c580e 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
 	return 0;
 }
 
+static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
+				     unsigned int offset, void *data, size_t bytes)
+{
+	u8 *val = data;
+
+	if (val[0] >= 8)
+		return -EINVAL;
+
+	val[0] = BIT(val[0]);
+	return 0;
+}
+
 static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
@@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	if (cell->nbits <= 3 &&
 	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
 		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
+
+	/*
+	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
+	 * a bitmask for supported-hw usage.
+	 */
+	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
+		cell->read_post_process = mtk_efuse_cpu_speedbin_pp;
 }
 
 static int mtk_efuse_probe(struct platform_device *pdev)

-- 
2.56.1


