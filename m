Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933397;
	b=zpsF+8ShNCHqGPznmtRmFIKsHI2GJJlqUfqfAKj49Z5e4ejaTRCq1FZcLW/2URqKGZ7O
	 HmPafK0JI3wN3yhRVE3WZNU618rIezorK2HiB59CvTxtG8E6hWbf4Vo8CFgehZJt0xluW
	 /97K+SLFP1iR8gkcWFY2fkejDX15qEJGao+e+0OT2+Kjs1oT8Ofx5tp3qVMqF10oMf3i1
	 ecyZrmUfDCnr0ZlsDUphNFa8SjItzWFrE9CovMwsjAN4eXhlDueZo4c5IvcqGrpcJsJXY
	 qXabvEf7kxFHME7xT8i3XbTsv0Ae5TIGar/HG+7PMlk+6ijaroVjlIoh7SJ5fQW7H6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pw+VQzikrvNhFcsLNLiHCOdnZ30fvzuuTNfRPpO+bNk=;
	b=ico1b5MW1wk8nWUBzLT/RXhadpKofM+1f/4wiS5vW0VCYXcx5fzW/Sivm7NZ3wqWiUAg
	 Yai7qVvFN0zlH+LMTnZZjxCSwdbD1+y4KpU5TKRh/Aml1H1y4aMB0sN0PaoOzmOJbuP53
	 lTJn9HU6o+I75nKMQlVJ10JU/B2zBVUzJu+qAuI/Rm4G/NZt8kG4N9ZZRada0mea03I7Q
	 4wJ728JXzXhR0PxxXQ7DlomXAQabfSRFsqYCFxVlaVo/rvwiWqL8118qamUJxqgrVC6rB
	 vAvItC+4+1PmkZAY7x7skW8mACqB/Id3s8DCGhUeiqn+Tuy7r+fRXY5c2WD2gifytJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Arc/I2nN";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71439606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71439606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Arc/I2nN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso22725845e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933396; x=1793538196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw+VQzikrvNhFcsLNLiHCOdnZ30fvzuuTNfRPpO+bNk=;
        b=Arc/I2nNT7rH/CtpyJYfHvjMnenGPvEByGpIu9xigsqKL3Jh73UlOuO8gwX+BjKbco
         R+0qhcYclzCSXoJX7XFUt2+Ahtf8QNYf+5pAD8u73XsAcRK6cQPHrQC3+UESBvg/Kskr
         y7lMBEF99Z7mVBn7ya3bOY6vYryXyh+LXZfEot69HgEAN5VeB0QK/uJIKXaTXhJ5wmZr
         uswbF679IdSMOgv2SoMXHXXps8HheNpsOr4vI1Oa2urkItnX8q8rc87LDvXBaRK4glP5
         vZbdDkLsU/E2M+RSbvfDaePpWs4KAU1JL9mg0z8jO0NmYBoPzND1bzjQv128ENB2+0mx
         KVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933396; x=1793538196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw+VQzikrvNhFcsLNLiHCOdnZ30fvzuuTNfRPpO+bNk=;
        b=OWbiUUqlCrCVtd0MM+Ga8bGNOMMaTRTto3lWanS7PFCKyTK3W4VijLrPsb059FPGhH
         kgPMSbB0NGnHy7FexMfl5G1u69ksIc1bHeYiuw//1CntrHmBpc7Ry6tZZ5HUrViK8ND4
         DhCbrJZtOu/wMDLpF1c6J7IZQ14mmJWSo+bsfexC9Oz7Q/MvDK2LWSogoZbsPvSAGBbL
         BzZGUIpboPyctwMkbqQ2sAT+va7nJJK5n8IT334Yq2rsHc9JGQeCVmXOGQcKDGrDSrL1
         aMXPErK4N23lBhm80FIx85VLxGC/jtsbLZjcfbiQsWcwelKIe66HdPM2KxKpTyQie4cY
         FKAA==
X-Forwarded-Encrypted: i=1; AKwUvBzS26AoQVG+WVeRiy35U9Eja2fjleEkVSQ2DRqWdw1wHYlYg8pKFz7fPJDuPB8V+Upa3WVtZBPiX4GO344=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXUUcyO6nQhQqgxXeyhZpSWo3lxIDoECz8apUTBMTzKX30ula0
	U/iP99Fpou8lmUoeghaFjgM8kFNHSK39Zd40TiklOLnorv+qJXv926UvOyXp6aP9
X-Gm-Gg: AYBFou33RX6gmNlQr1Qkave4B+NgNIkCqI297ThlccW+khHbOlrktTPe6dId6vSxtIe
	qHhzyLkZ7a9iOrZsmNW/rSs79j3Zse7FrwEEpcuvgeyWucrxhk66e04NLGyHFtANz5F4OImpKZH
	x7RbLXSg7eY/a9tIB7CPyH409v9RmKc+3ForU4gtey1bsbN4B2/cYAU4ZwN5WzBoMMAW4I6isn7
	p3CkKg2cr5VD53iCYecfWzsysXquBRn2Zvw40pf8bxMVN8MCyQUguAAonyP0i02WKh9N2RKOuMT
	KaeH8bwZG5YgN1JJH/YmOjqI7WbRbzpQ71wF/erq7ROVE8ddXZN9EiN5Su+dj2Bp1AM3JVGr/6U
	JJ9g/Gez6WwgiaZjigb/VundbeTMKHzRvB5UIWVSEWMO5FEgjRAd6RckxjAy/hCxAjIzsCrup8G
	fhCH2SupP7pWton2viG3a8Tc4tcZubu2EDNc5IfeFD6zDVTTDoGMmyyDnAACwx94MbWyl2IixQj
	mcwiTizZqbFLd8WCn2GSgqnP0knH1llbe6weWxLbStS1SxTriHteoAtmoL2Th+61Vy4c3b7SrF8
	XUCboZIqtTs8Nod55Q==
X-Received: by 2002:a05:600c:6749:b0:4a2:e0c:2b10 with SMTP id 5b1f17b1804b1-4a35aca32e1mr66130535e9.19.1792933395658;
        Sun, 25 Oct 2026 06:03:15 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm108000685e9.4.2026.10.25.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:03:15 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unnecessary goto
Date: Sun, 25 Oct 2026 13:02:58 +0000
Message-ID: <20261025130258.10747-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The error path in hw_sm750_crtc_set_mode() jumps to a label that
immediately returns ret. Return directly and remove the unnecessary
label.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index c4358d3e5091..22f93277e91b 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -272,7 +272,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
-		goto exit;
+		return ret;
 	}
 
 	if (crtc->channel != sm750_secondary) {
@@ -332,7 +332,6 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 		poke32(CRT_DISPLAY_CTRL, reg);
 	}
 
-exit:
 	return ret;
 }
 
-- 
2.53.0

