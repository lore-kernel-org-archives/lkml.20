Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F105131F9A5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862712; cv=none; b=ZyV0KGQKNlSxtQgdRBH1SKPUQiiB6IB1F1jkY1hAlH87+qtff1ybo17o1Md3khMjIpx2PLKbrDrF/zay9IfYyY5CHPMEjptXzazCHpWjM24zv88OLZnjMcIxP/XrwPl3kVh/3MEFN1qLKecWvylu1JFNvkY/S5XB8iq53ghyipQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862712; c=relaxed/simple;
	bh=nzmzWlnZwidaKfSfKM+uub0Vafp1TYNjiKAN5DG9grE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QqNRFFt44B84z2IJoFju6sRps1kYwWcnHOZWG2zaJht74gLb+IeTTkYcCriJdfK50jnL/SMhlIdiY5SWXMP9tnQTy+dXGPmWKKzeG1jjDX55FSsP+tRH3sZZ1IC5uQW+i9Lj6Uq0bGQIpY1m77mRtAOIfgSRt5/YvYqcO6ZgLso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+5liMXC; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+5liMXC"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955fd77c18so727635e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787862707; x=1788467507; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=se85jEeQNMIVMtpgzOiz4dZeEIx9etLZFXPS4ngtOk4=;
        b=v+5liMXCU3F78rpzsp20nU7IOLKNqXUX4DIIshNStE2duhNNhH9x0hxI3UgvYsGQk9
         c65yFl9ehyI5vOu+wPoWgjuVX8v2A5M7DrhUJPpPBqU+Gq46pYy4O9Zb5yBTZ0bP7H4P
         3VqgU34ya6ceDUzTlDvXchr6hLAHT1Y4IXK6zzbl/yXf63SaQkoh+oFlbPOhMTXW36Qi
         V/lRXYN2Nx0K1obClZN3mUvaOsZ8KKj1oh26UQF3/0vQ2fpPl9wiU9+9XDKSNqsijEpn
         qcMf64RDQR38uMgkukOW6LsZA0RZDB5wIf1Fi7YaH4pyOReo2DGWFrWrwyVStbRIHfuS
         RB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787862707; x=1788467507;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=se85jEeQNMIVMtpgzOiz4dZeEIx9etLZFXPS4ngtOk4=;
        b=GESGjU7Dv3un5J+fOJh04GRd5//E8XtE4kRZT73cGyH+RDUR5vBrarUFDZvPzZSUhQ
         mLZC8pYeTmuFP+NZqgWNnxF/NhYOg3dKDPdUwoNDNZlpFUb9Qw2kBBAA25SKuOgbrxH6
         GzAbJsh9Bfje3U1ArX3YXlOIlo2g+1djokAEzS8+eRC0E8WyEh/NHy9+454Z7CA1+i40
         c2H+HbBpN5VW1k0hOdpszgvzfydPVRu2086Wu6WGhaQ1yzJtn6/9hAIxIkAmjFvRLzYG
         YsQ54hNo6EZ7ui4z36J6Hf7+dLgRCn1b4ZoxDewcs651+JeCLi4MqshROvpmhkxjOKaH
         Vw8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqZ6yFCSGsmVNwjpGGCPVOn1PBJDNrwkHFlnv7J/psNLabqVn248mCG54c/hnoLyCJrO5oYu5KPD2eX3YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mIL1Olr/DACHuYJevMeTRFFd8s9yjirYYB4YahyQGATYHko+SQ
	AR+tts2uF2mbPD2rQLgo/GR6RhQOxIPVnRed3sGOfhlfrs6fqEWJU3x3CwR6BNz9kDyWLzvGhyY
	E/V6vFRprVdNDZA==
X-Received: from wmqt11.prod.google.com ([2002:a05:600c:198b:b0:493:e006:3161])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1992:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49b91c1fc56mr22979755e9.1.1787862707433;
 Thu, 27 Aug 2026 13:31:47 -0700 (PDT)
Date: Thu, 27 Aug 2026 20:30:55 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827203055.640116-1-smostafa@google.com>
Subject: [PATCH] remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	quic_srivasam@quicinc.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

During adsp_map_carveout, the IOVA is computed by combining the
physical address and the SID:
    iova = adsp->mem_phys | (sid << 32);

However, adsp_unmap_carveout() uses the physical address and not
the IOVA in iommu_unmap(), causing the unmap to fail or leak
mappings because the address doesn't match the original IOVA.

Cache the constructed IOVA within the qcom_adsp device struct
during mapping and use it during unmapping.

Fixes: f22eedff28af ("remoteproc: qcom: Add support for memory sandbox")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
I found this using gemini while auditing the iommu API usage based on
unrelated bug report.
https://lore.kernel.org/all/20260827145855.1616223-1-xiangzao@linux.alibaba.com/
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 39654206781d..2e5fb5954fa9 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -104,6 +104,7 @@ struct qcom_adsp {
 	struct completion stop_done;
 
 	phys_addr_t mem_phys;
+	unsigned long iova;
 	phys_addr_t mem_reloc;
 	void __iomem *mem_region;
 	size_t mem_size;
@@ -333,7 +334,7 @@ static void adsp_unmap_carveout(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 
 	if (adsp->has_iommu)
-		iommu_unmap(rproc->domain, adsp->mem_phys, adsp->mem_size);
+		iommu_unmap(rproc->domain, adsp->iova, adsp->mem_size);
 }
 
 static int adsp_map_carveout(struct rproc *rproc)
@@ -341,7 +342,6 @@ static int adsp_map_carveout(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	struct of_phandle_args args;
 	long long sid;
-	unsigned long iova;
 	int ret;
 
 	if (!adsp->has_iommu)
@@ -358,9 +358,9 @@ static int adsp_map_carveout(struct rproc *rproc)
 	of_node_put(args.np);
 
 	/* Add SID configuration for ADSP Firmware to SMMU */
-	iova =  adsp->mem_phys | (sid << 32);
+	adsp->iova = adsp->mem_phys | (sid << 32);
 
-	ret = iommu_map(rproc->domain, iova, adsp->mem_phys,
+	ret = iommu_map(rproc->domain, adsp->iova, adsp->mem_phys,
 			adsp->mem_size,	IOMMU_READ | IOMMU_WRITE,
 			GFP_KERNEL);
 	if (ret) {
-- 
2.55.0.897.gb25b4bd76c-goog

