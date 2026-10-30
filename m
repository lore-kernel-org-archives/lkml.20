Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353307;
	b=iqyXkjeSdxOkWRfHBKiqs1nLYm/o8vDRMgNPrT+z504cHy2+0rwfPzwVgirBtbTdlI/x
	 vm68o58fkxFa/X0ZvCAKZFfXU6nndHhtAxCKzPFfGtmQGydEBmleUY9NJjw3WWjY59nHm
	 l5t9iya5BKkZ94uzkr5EnIPI31l9XwkIPnxJijga+ld2oQNBpDCh8YTGphy55t8Wr9tcA
	 Oq+wHpOSvcdTKC3kyjP9X7anXmtIc2P1JlQRueEuxGlZi8efsBROgleNvWqjVpo6qXxNR
	 c6VRrPTQ+SwiQWEi/RIS//IFdGXSBOmsFxXLuwI8ZPrJDzZIZUUniQKvcQMY04AFLAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353307;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ey4e9MzSvJkP1rnuMio8C0fl+aTIgJsGS7g5QzPfgJo=;
	b=TyKr7zXDcM5G/n9wDT98+VhZAXMLrxYD5gI9DCHN2/m/11MUdXwDsYSKJma9URKYE9Uo
	 JUn9Ek08D875CS8LecEDiJb72yb1EVSVORti72aahBlZ+h+uMURVflsFhUyAcXh2nn1qp
	 Fdpo/IEPD1gcLGyNaMBc3RyP6LaocRF3AJ9RGTO94VFVmoqyz81WBJgVDuBE8NrZ643up
	 D1cx0LlZO9cqD+HyydFdtEZ4K5ucHfA8X3zq13Gl4G5a+DIIsaVefvip7S13M+3viBnQ0
	 CFdPoEboT5Sy4KAt/u7hLhiLI3ww4ujYAujar5BGJVGdKql0H4xWtrDFisJWFTpfKLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rt6wGl9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C6A606A31A;
	Fri, 30 Oct 2026 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rt6wGl9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BB51F000C1;
	Fri, 30 Oct 2026 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793353306;
	bh=Ey4e9MzSvJkP1rnuMio8C0fl+aTIgJsGS7g5QzPfgJo=;
	h=From:Date:Subject:To:Cc;
	b=Rt6wGl9eYZJhaLBEUb+SzLeNqsUI4X24IqYurK1bvaWatYXjzeLic6eUekfatCAt3
	 kYi3ATulPZ82chhij0blLNR/qE/CfnEeu6XPRsg4EjCXnslqBmvmVtssiCDc6opOY4
	 sBDC68vivBl2tMZxjfEhK9b2JrgGeFj6vMDGziaUbqRxU/tlFbXFAmoCgdnIBORu7B
	 QI42cLK/JdfJVrYfutZA40dWco2TN2VpsMd0iUJdK+GDiSbHNFZz0v7NwzGVXN55Ig
	 9tQVVVypnuo942/gorH0IkD7wl6QvA8AlJ2ePIeaDU3kaKQjCg9B8vbMnf9FABMFZE
	 KuzVMEZNloedA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 10:41:40 +0100
Subject: [PATCH] drm/msm/a6xx: Send AB GMU votes on A8xx
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-topic-a8xx_ab_vote-v1-1-66afb5bc50b9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrA3ENFj1KlIkP2MdF0aSVAKSu
 zfq8lu8d0JATxhgqE7weFAgtxU0dQVmUdsXGdliEFy0DX9xFt1OhqkupUnp6XARmXjr3spOtsp
 YKOHucaZ0T8fP4/DTK5p4nSDnPzEffh12AAAA
X-Change-ID: 20261030-topic-a8xx_ab_vote-27b9d4846acd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353301; l=1007;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eVOTqO7c837FF2FRgrfs8NEe8GzqfRGTnA355bl0RHI=;
 b=Wj8KHiAuUU+tmeDHSDD5iLYKughCNxCCKgvgigdfLzK5zkiLvSxA74yMKeRzFPWqSKBP+5v1h
 9QqSWJRUxKYBPflzhREFvgUFUVjiNyXpPGBwchVJjNAow7w1/cx0tBS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This matches the kgsl behavior.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Compile-tested only
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..271e7b5fb871 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -196,7 +196,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		}
 
 		/* Vote AB as a fraction of the max bandwidth, starting from A750 */
-		if (bw && adreno_is_a750_family(adreno_gpu)) {
+		if (bw && (adreno_is_a750_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))) {
 			u64 tmp;
 
 			/* For now, vote for 25% of the bandwidth */

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261030-topic-a8xx_ab_vote-27b9d4846acd

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

