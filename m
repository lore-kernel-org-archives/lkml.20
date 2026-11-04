Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823812;
	b=PlaVoOoN/S3rFllR7sKMz0gEHLva3fJ3hOdFnBUCmqsy6nfPEvC6pirlBE0jsi7Spq6/
	 hsEYrdgBQV3q8NPO75NppCwMkxJi/6RLfQZxvVu5u1bwzdWwzdGT/PrBebfEx8PuOg1z5
	 Nqm2O+xkHL0H3cvQoDKoiImCOFbem6AbAYUnDpJ8KUp/8KgPN2nwrvtFZIirrmNi3Gboq
	 D34K+jYtpBZvflFfvfwFzKfwQRs6v6WUh0FxbqPhaVDxn60W+CV/ikj1NX4mS+wbG86y2
	 Z7+2fRLFZlQQJryd4ytndVDESbd6swyT/tPKl0o4GoMNDV0T5sTYD+1MCHMKkWRWPyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=cCdcmu0viFWKMKe5EKDZzDMbAHNjAABEwRLXLVR9MceDQGIFQHk52I7GwDpA9GeiFZFh
	 xwgkSjNYqmXqcfGNOYXB7KyMnG/cPFfiqyQDc5Af9ot4HjzzWrnvVAEQVVFqDnRYHqTJl
	 jIs3VYanZLrqSTdCRgV2qLc3evs6pYSIOuD8IveHU2yMRDj7a5giYz4mZS82p4nmtWoQ9
	 Hso+m6oV3diNINAjZ7BfqoZMPlTwSI5bM67QZ/1OQ8BaMvy4s231ClFjqhcBAW5GyMR+T
	 D4dF1iCkqQadRQGSJB9F8JIw2WMgCCK2VSlJcZoFksBo4PN17k3qHnq9nzPlQTXuz5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VEpxIxb0;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079F607350A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3079F607350A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VEpxIxb0
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso952504d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823811; x=1794428611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=VEpxIxb0a8wfXYvhkeSKmMTvunJIxcraVVKLZX+mTN3NdQQ/vfiZmqDdf8VgZ0/5dP
         /sxmC9qMzBLR9O+p0fnIKEwySN6MXmp4fXaHIWnvwAVAmSR+QgNXzYQCwxutgObDrsOA
         wOWyFEM2xmRTkxqM9af2+03nc9dwDEziudLWUCTU6l4Km59522R/+GZgl182BbmPhYry
         UcLTpiqNhxMOQH0wmgPaQQTq5ZA7y8NlOzdnaW6ZNgN0wayNDdF8ozseUBUaRkHkhvhR
         3am3i+xX8J8obrfm2Oyr8K99WvBf70H6l0DvTSzcw3jWngrK9O2ODq3E6VBOjlZmcTCd
         6Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823811; x=1794428611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=YwEmmbCj9QE2DaL7oWAUwT/+klK8u4A0eBQS1p+vVNfen9cO+oEBKBnx9T2lRqurQR
         vrTAEkyt11EbxlqFppOL0Ey9ujLcvoKM0ErzJq825uVZPkaUiLJZUZgEVcP+upG9OJ5J
         xuyvkkWoku9fFytLpvwFJ8aHYnITlSNmWFGxT93a5xfoUf6o3fLOEUMLbB0u3bxdbcoH
         SQdEc25vqiaL+BZ75QR5f8lrPBRbJH/jdJBKeEGTVg5weZFLwjGoaTs/L6RtkPcXSZWx
         PpCLqRbIBuRBPm9kIbbNowtYWyGnVURQQ7vKnaTpUbZtU+TXnmRmSZwk4tMNArTwV7xo
         V/8g==
X-Forwarded-Encrypted: i=1; AKwUvBzplubN4uZ8mrwnRtwgUnWIDC8qohNDWA4GalWiUa2Za5M1NozVaiL7nHi2QaTKFyCzVnqDV3Oh3SZxHQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D8d8ZZL2Cf41n22CrnH3RjzIxFGW5QJmWeUeZeWjFmbXSE6P6
	62k+D+8G0eoP32pzHgIRV5E6WFpqH/nRNF3QjcCnI9P//lN2WXjKawKQo0ghozOfIwo=
X-Gm-Gg: AYBFou0gcgGmaONKG+NXaC8Qkw0/Mdy236QHiKml//TdWEUF/9KHlvrdbq2d3ynm0qE
	PsPA10RsiCtItPmIuHZkk/wR/EVwpgbmtP8Un3apCYAU8H7yjoSIQynJgdAda3cJNIhaC36Upqa
	VdJ8plf1cEwV0IBhi31ww8F22R7EblIwThUmNg+fVeFVBy9gqRmXmvGIQtN6ZJaAOBBBG6slib1
	ewuDdJ3pZYwYiBdEq8yK0haBDlDbcvXqSd13F9ubhGdEch/H2ZvY/GZWCMIpw626HMFbAYmUZ0d
	7TVzCSgYnw9F+twEPSw95glA9kMkRQZwCFSxYsz3t50esZTVg228FGxHtyL7QdxoZp7tX8iVyXn
	iXaqFDEY0bOt3a1L0bNxjnT4iUd4kRWU4WpKYK0Ibh911Xg0ikjq8EYRkw428z7LGau6J2rh9aV
	/0kNUqIaBo4WU2xAvWlt0g3F1s+e8fsOif13oMcOjH/Fm/u+AyKZ9bwdUmR9B0JkJArr9O3TVGc
	pYX72teKBbzx866yTp0v1FusihOCjJcp3G8OeVn+ltIjPryekYur5U4r3Y0muwQ6uuSdU5SXIwu
	MkeS8o8CnDok/ooSScIt8ol2mYwBLMSxPkGrLmnkwjROVMB5bfai5nixcuU+H/y9c52l7VB8447
	wRsYrtEA6nEU33Fz06JAzxzgM
X-Received: by 2002:a05:690e:12cb:b0:67b:bf6b:d9e3 with SMTP id 956f58d0204a3-67bbf6bdd12mr6448256d50.48.1793823811217;
        Wed, 04 Nov 2026 12:23:31 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:30 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Wed,  4 Nov 2026 17:23:13 -0300
Message-Id: <20261104202313.72494-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

csid_set_power() powers up the VFE with the same index as the CSID
before the CSID itself, through parent_dev_ops->get(). The VFE
implementation, vfe_parent_dev_ops_get(), returns -EINVAL when there is
no VFE with that index.

On the ISPIF based SoCs there are more CSIDs than VFEs: MSM8916 (and
MSM8226) have two CSIDs and a single VFE, and the ISPIF routes either
CSID to it. Streaming from CSID1 then fails right away with

  qcom-camss ...: Failed to power up pipeline: -22

although the pipeline CSID1 -> ISPIF -> VFE0 is valid.

Return 0 when there is no VFE of the same index: there is nothing to
power up for that CSID, the VFE in the pipeline is powered by its own
subdev. vfe_parent_dev_ops_put() already ignores such indexes.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93..532f6d36d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4631,15 +4631,16 @@ static int camss_read_version(struct camss *camss)
 
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
-	int ret = -EINVAL;
-
-	if (id < camss->res->vfe_num) {
-		struct vfe_device *vfe = &camss->vfe[id];
-
-		ret = vfe_get(vfe);
-	}
+	/*
+	 * On the ISPIF based SoCs any CSID can feed any VFE, and there may be
+	 * more CSIDs than VFEs (MSM8916: two CSIDs, one VFE). A CSID without a
+	 * VFE of the same index has no parent to power up: the VFE that ends
+	 * up in the pipeline is powered by its own subdev.
+	 */
+	if (id >= camss->res->vfe_num)
+		return 0;
 
-	return ret;
+	return vfe_get(&camss->vfe[id]);
 }
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
-- 
2.43.0

