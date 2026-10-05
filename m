Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FA47F2F9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199607; cv=none; b=TJAdRfaoAsuG+qyY/XcCYCi1LiSkhHDhUaU44XVRx9jArn9yE1tga56+1bWg3xYXYZncp8aFn6jNIkQxBpAWgpor68S16yfnaMWLt0tTlXqEr+nR7nWFTAUF5678PIRV6KASyBroEvs+kxaocY3ZWagCQ5mhbmNz6aG0a1519Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199607; c=relaxed/simple;
	bh=acy4YY8icqRpYM8WEcjVm8frb5ecV8yR7yaJrUuvVi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+ruF3nv8GSeMKpyLKXjEAYutk+FS9dxhYyhE32iz4Wt4WEC/hptMkJJgVESFu9tm/TKa+1MqvEI4jFaTR8+zFgCIJUHBI2El6CRpz7zNMUOEBxNa7ojPGLTyRqtF0ugiNCYlB3usEjQ/JbV7D/hqw6Or/CbKwJAJi1wWX2DGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDIznDWV; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDIznDWV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-34bb8b31647so2741980eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199605; x=1791804405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0E1H3YRUGu5NQw+dGCGvtMy789cF+yQ8PDHb0PAjkg=;
        b=gDIznDWV94LI0pSPlXnE1fIw/2qhDbRjtMBEhSFW6AZdTYRvZMNX7aszi689cFn/PV
         ee//7/+jhh87Ji4BDNYLeI7DNT+HCrrxsv6zGpfIXlMc9HUbcLYsT0A09Xd+88aOieBX
         0qN8+o1LDzp55oK+Ao7FdXvWwRCeRX2tAK3Sb13A/NW2veHExOUtWgqHHs/+/bEXZjMF
         Bf1673kfSzh7yXH7V1jG5ZA1g3phVu21ysG+tQ92EuVPbaFTS33ftwfYq1B5tFTdcG4P
         LLBVS0jm5KHVi9fvYEmWknvbnF6B7zxHM5r1ZySQPCCojOyyzdbr4hVz8uQE+4Kys+cB
         JEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199605; x=1791804405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0E1H3YRUGu5NQw+dGCGvtMy789cF+yQ8PDHb0PAjkg=;
        b=gJb+o3qOtSJshwVVUnqMCupMTW+2nwXURh+bvjK2wdDLLvkcRuF2HZxpsoYEf2SYcs
         0sSK+lYJjuQKDNVxrP43UOlFK85hFweiTol4Frd96IDosqojmCkmivYApR5JmBdWN/Fs
         jw61OWHm0rrPTCa3zd2aAFjjmKT9ZDy0jjOTrwaIVWFTmxBiCP1VpMAzUkKdq91rJLmV
         sLq/lLcuqSCEzEp2Bt2YzpZxDZq7pQA2vcsZzDonSxxpOuV/ZP3cOIDYsYZcqDtv1QC3
         4IvFGtmAvcpvNlTSAAlGxhA5/+SdmaJKgyc1qq2p4YCZjeSlGLIYJ76nlWCAvFSXESR6
         q//A==
X-Forwarded-Encrypted: i=1; AKwUvBwkQN4qd1LIQ8lWJsOBPxjx1b9ZtTvbqhyaSw4B/yI7L1hylIonxwZXZ89K9dK9GUb4E2rVQNHhSJ9+vNs=@vger.kernel.org
X-Gm-Message-State: AFuF++m9VWwCgE0RmPCJLjMI+Wkr1gyZxsteMsxbmeX8tRx7LBEHJpWC
	BBMx2X+fptpv2HcLZThwBNe6zCNo12CZXI50DOE5ZiPrCXjWrZvHyNND
X-Gm-Gg: AYBFou1t/WOyU2Xit76Yr1ET1xPwCxK+U8AmIx0MOuj23j60IGdgCkD/fw/X0Q0h79k
	qxT6SwofkuiWaOBNPSDja7WWrhIR25jAMC4b0xAfsp5QwlDOUBTEP9obhZ46LP0a4sx3ZWue6gb
	XA5eHKgVrwwU4ZeZVI+lrVIcp0amFxgScJ/qx3zmhim2yz/K8ylkcH8y5aaNBs+7WaoDoJ04tiZ
	6kRPEkNUWJBhE7Stzkm4YRi7ie2IUciUN70Y0jQl+nfErmVDO7wddZtSGSQ3RNYyvhaO+K59hS5
	MocbQSNgVXdVSvbWoauegiaIV1oEmpvCc9IzTssy42wMYWRjYMPFGT/+XICFqNuhBUnn19hGDA/
	gtR6w71Wle9UIhxp2oabrkoV4aDNs4mO5fjV3eFTy5Ic8BpO1yCs5mwSS9qnHtkUFTHup0N6V8V
	WwGsgRtDRwq6Z9Lu/syDa2i2B+YNiggI3M1oaJR2CSMMXs0cGfZJP3liUvjdCF0irwO7c7BfCFt
	oMZfA==
X-Received: by 2002:a05:7301:1a16:b0:351:2e6c:9e1f with SMTP id 5a478bee46e88-3512e6ca15dmr3609482eec.31.1791199605214;
        Mon, 05 Oct 2026 04:26:45 -0700 (PDT)
Received: from JMD.localdomain ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351277a2fb4sm14902080eec.26.2026.10.05.04.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:26:44 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] remoteproc: mtk_scp: Fix bounds check in mt8192_scp_da_to_va()
Date: Mon,  5 Oct 2026 11:25:18 +0000
Message-ID: <bc3f565d08f6948aed9172c01c7c38b4cafa2ec1.1791198233.git.atul.akella@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>
References: <cover.1791198233.git.atul.akella@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8192_scp_da_to_va() translates a device address to a pointer into
SCP SRAM, L1TCM or DRAM. Its bounds checks have two problems:

- (da + len) is computed in u64 and wraps for a large da or len.
  With da = 0xfffffffffffffff0 and len = 0x20, the sum is 0x10 and
  passes "<= base + size" while da >= base also holds.

- offset is an int but is assigned from a u64 difference, so it is
  truncated before being added to the region's base pointer.

da and len come from the firmware's ELF program headers
(p_paddr/p_memsz) via rproc_da_to_va(), and the returned pointer is
then written to by the ELF loader, so a malformed firmware image can
make the loader write outside the intended region.

Use a u64 offset and compare len against the remaining region size
instead of adding it to da. Apply this to the SRAM, L1TCM and DRAM
regions.

Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d18ae676260a..b1d83265fc26 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -775,30 +775,30 @@ static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 
 static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	int offset;
+	u64 offset;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
 	scp_sizes = scp->data->scp_sizes;
-	if (da >= scp->sram_phys &&
-	    (da + len) <= scp->sram_phys + scp->sram_size) {
+	if (da >= scp->sram_phys) {
 		offset = da - scp->sram_phys;
-		return (void __force *)scp->sram_base + offset;
+		if (offset <= scp->sram_size && len <= scp->sram_size - offset)
+			return (void __force *)scp->sram_base + offset;
 	}
 
 	/* optional memory region */
-	if (scp->cluster->l1tcm_size &&
-	    da >= scp->cluster->l1tcm_phys &&
-	    (da + len) <= scp->cluster->l1tcm_phys + scp->cluster->l1tcm_size) {
+	if (scp->cluster->l1tcm_size && da >= scp->cluster->l1tcm_phys) {
 		offset = da - scp->cluster->l1tcm_phys;
-		return (void __force *)scp->cluster->l1tcm_base + offset;
+		if (offset <= scp->cluster->l1tcm_size &&
+		    len <= scp->cluster->l1tcm_size - offset)
+			return (void __force *)scp->cluster->l1tcm_base + offset;
 	}
 
 	/* optional memory region */
-	if (scp_sizes->max_dram_size &&
-	    da >= scp->dma_addr &&
-	    (da + len) <= scp->dma_addr + scp_sizes->max_dram_size) {
+	if (scp_sizes->max_dram_size && da >= scp->dma_addr) {
 		offset = da - scp->dma_addr;
-		return scp->cpu_addr + offset;
+		if (offset <= scp_sizes->max_dram_size &&
+		    len <= scp_sizes->max_dram_size - offset)
+			return scp->cpu_addr + offset;
 	}
 
 	return NULL;
-- 
2.43.0

