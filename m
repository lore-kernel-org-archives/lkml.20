Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909449D59E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381690; cv=none; b=eEbj6xCJndrydhMvRNIRAl320ub9hCUpeeu//XGJotz8bAfF++Jv45ar/cZvdPFPcvNFUybCa85cDMPa7KfBMcw/bhI32R5MsW5l1KNGGPjS2ZskButK2QJbbrYluVsh3w5okTkq5JNN5l2K0hEUDOYXDtqqHY7AavN04rsF6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381690; c=relaxed/simple;
	bh=Bzonkp4Kl647I49nPKXVT8eFQsR7sFNTOnQ8eIGUtOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SALin0IGVbRqfWZ5WED96XU+0qRDXMBSYa5bIgwU8FUnvVIv80lCGoKMIyDj/8morI/r/v78nmeVTTcVEUOZKKQ20heMVdvoxrvp7kHdLgcBd7INPLsIWbXzbCqxcZgF29D1wCEII/kOlNPsCpmv4ALzxzm8k0pqMI4p7zNKxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1VgcXry; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1VgcXry"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34c4a0868b6so3657651eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381681; x=1791986481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=A1VgcXryepmu9oJcVz7z2l0VF2lYQRJmesc+tJSYXMOUTYOaoUX3U3mpLzUbxukEx2
         UrpZS/Y7m7UL7JWLLMLGVUVaJFza2R1yHUksD2Dmfak6gcUy43H4Zqu57acLH4F2zMiI
         DodqIMRii6+u3Z0I9qXaJ3IxL+6etXTaghCFXUaTpfPBCY2QEK++2Sve/qslAtMzPXrv
         Q70tQi2Sx/+SvSSuiVUuxFZhszrleyminA2jMBPGdE65FZyKKRokQBm1JSCjKJkqdQb4
         xe5r6Wi33YtdJjR1n6GXvECdLDNSrCWO6CLbVqNIBIxe74dAeSRA6KXLqHt5WxXQD/HO
         8F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381681; x=1791986481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=fHJyVtCi2k9c9zcR15Ad/H0b5fa2MhbsmYrMt7clpdNv4HkQD/P5WUQkY3RZyotcUS
         7UoA1em5TG0VwUEqRwN3jemr1mSu319qTBcKhZU7XUUHm8VZDaYc3t4lWvxyRaGMQmKB
         AM8ShM+eSJE58zI3cWbWjBBIRcaE83nuDyqn+vh9Tl4XJ7VvQA+RjMkH/w+xv5nAybLW
         y4dmCcGfTwYLOcEUgBiYpSJmT94X9zi0Bfppje83dPTyIn27zuASzBi/r6UfSZ+p/yKK
         h2YGWNW747pDcBolkKOTvIaTQniOnX/MDoXbtl+p/0L1jEjwC4qDUwY7Gntwx47UDMTo
         E3Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwKpkDZM9XHy3SSQ8P8K/MP4dVEhHt2aMfmUzWjfvvWe/kCd1dW5EbKZVSmK9IBZdvl57JEZ0GeqnEQF8A=@vger.kernel.org
X-Gm-Message-State: AFuF++n6+vdPOCyplcmXPwDMuu9fF9mD1jIyjO7vk57gbVEjw5z0KOLv
	Si/8WfsggnlOBJ6xz/TnaT+d0Ilbj+t7BvosqXiPqZdnm/jBf1/HqvXX
X-Gm-Gg: AYBFou12r5FiLkspx3KExoV/ou5IybW9vwW4cq9MyFzvLD255H+u2oIKw8WFIF0w73v
	iPh6tiqC2KuIXwbnBuyN18uj60VsqF/hZvQuhNXxRstZSTTnZB3G6oVaybd0MJfNuMHQmxHF515
	Y1qu89rRAo/2r6Wl64BKpTnphj+pXcHk658YOB69MgaQuEkJ27r8jxEevlSQEj40oieKL6T6pZe
	GqYFDotc1pIVA+qwr4TGLiFRwaJAk6sCRbJBdTPss0p0naPUvjMMMW++HWF/5uCB2vRqovQjZO0
	hBhS5p+ruaGV4tFB8Y9azvNnDCRUs3AXQMM9/1JdOXwG504H2aW4ikgA7q9TB01m7ajAaOfwdTi
	bAhY6SDwTC3XKVulgtOywhyg6txKjrA3s3aETJU1oF7u6gP/Q5G+Uy0OarkeCgafPxuMQY3nwrY
	qbAhnCxyiZSRPkABuAkjqS4eOXc7jmETjnv4jb5ns7GTLrn7VBUMNtcE/sLvA7P8hWFilIfoUpr
	LCfTRzFqxNkoqaGYd4Xo9wnC2exEw==
X-Received: by 2002:a05:7022:ea8b:b0:143:3769:c680 with SMTP id a92af1059eb24-15d3115a913mr6364429c88.25.1791381680555;
        Wed, 07 Oct 2026 07:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1630180f6a5sm4179461c88.22.2026.10.07.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:01:19 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: cedrus: fix typo in comment
Date: Wed,  7 Oct 2026 11:00:56 -0300
Message-ID: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: Neightbor -> Neighbor.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.56.0

