Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA123224AFA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566965; cv=none; b=D+Z53AZoo/VRtALmk5UOSnE0fzXiG6I6Y8QF9CKc/Ltz3OUPynMLzr9tjp2ZzIevTWtSD0LGIIpml3KqgK0q9K56sMKwQFK/ymb9x6tA/BJY4foUqdnd7oxjvOgFCKvTNf+dKo29gBL2R29sXnfqu+9V9SuIpQxzkfA/zFCW9lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566965; c=relaxed/simple;
	bh=Z0eqXMInzFdWundp0bdyqvyQWa4WYterHClI/OnGILA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+p0hfJHSgPYOfiirHkL2dBzd7esHjA4UqDqHJHi4b7CvugRqJmlfvQYlD7NDyAkhSxhze7Obk7iD2VzEXoaQM81MvMVonxZkT2QmKpQv7v4yCnBVmpoVHJPYoOArcRc8GFqVADsYWJU+H9Y75MyaFUw7eizu1h3Vg892a+0V9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fucYi3dP; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fucYi3dP"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52d8679c149so16606561cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566963; x=1789171763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5lvUDKi34eWgpEQ9bn1qS/2tjyT90hT4Ul3KLa+Q40=;
        b=fucYi3dPfRb/u7nOr0gUdD3Ka/yaeSL0KJtpSf6GwvdQrt/fCh5kRd7JzaPBe47xQV
         EH0VUYp62gWD6xkoZMHEfuLjhfxSESoHA1OJNV6YtBqVpxKeVDRQs6LfhMWWPTrlUKgt
         WdP2HNq2uHbTWx7aaFyfNXsAiM6CtVXlxZ87YngTQfmZdJ1vyK0QM1YrGMjJ9f/z5Qel
         nFVRqNr+mrRxy1LZqhdZkIRN2XUX+rzeDYnbSFrhsFG1ByugtGtm0wXhCCmLSfvObacT
         C5+sbPWKvl2wPepZgaxxZJjZdJ86jwzrt9sNsA2BzRZNfyIkKmV57ZxAu8vbY39Manma
         AqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566963; x=1789171763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5lvUDKi34eWgpEQ9bn1qS/2tjyT90hT4Ul3KLa+Q40=;
        b=js7X1aygLsdPURNAO6vAR1gh26gV2HZ4Zf24mCyI/x3HffthJz2wEG0F7hdZgVWyaM
         bw22jptKH2ru6l7wHsDy89yAd4VO/ZYcuqRDxJxkd79e1rS2HaPIIBtLjeW4RZbDptU6
         2t+H3IScEBeQKcAY98lgrrY3Gxzv7j1ogGtJCyBmB0BBDx3oNQ0uR67MEqrk3PJ4N2tZ
         fvhrDIN74ULzQQJG4KdnGdm9blj8NqU0mZSYdAgYzI/lujcrdqCdwy4W9ivpC8DsfuZ6
         yyQybxzfmpkkkwUIpLTihXb5rZ57Ae9lzod4YRcsq5Ag0L4jJ8j0zNi+BI3eCdDV1Uy5
         7Olw==
X-Forwarded-Encrypted: i=1; AKwUvBzhlYru4MsWkUqWdP+Lj0fsDVKEMbm4yS1CfQjH20vLhlkYm1v0+m3M35sTmEplXJd4Cpscos/411ok0uk=@vger.kernel.org
X-Gm-Message-State: AFuF++l09GSWkhMN/Moc27y/UpwfHOx8Gr77xs+54myw0lNm8/gqcclG
	mglEas6GR+X2aqvGjOrsbfrMWG/C6Lm/0U4mkT5mH2jIVDqhjaLlHr8K
X-Gm-Gg: AYBFou1ZuEsvQ3nBiwZrgBknSsdlMR7XLJXO2DbK5LmTuMli/DELa+RC+CbOSgrgoPF
	g7ThotgkCCmnziYCpfNNeZg12ZOg3y9mzJ4PUh0fSgpLucPSHGVvSX3UjusG/KUnJLs738RvqN2
	x61mvsM6I+gMELFgcR+wGrgbSffPzuTWEr1SnP0He25ltzNUjFUrORoN1gOqSRW34PBXnhu1a5c
	l94bl/moGv9qhIg4/HyKCeDc63HWghCAoU/iAdiJEfd3Ujf7J19SSh05gzgmf/WQZqZLs3jyAog
	9lqGWgQZ44qTaRETUtRnmA1vOBpfCoHdE/CQiusiGKwUJNbUQ9nFs8PM4oA0pMnAjvw9xH75MAr
	SIE7hJFU+7FZTkMHyjzHlPBOoDMdRlxpU69NuSRplhkHyYl0iBYuNdu/9VWJ5fvgxKAf0PJ7AaY
	SeftfGiX08d6S2TIKInyqbVRxkhVPY8uDDe6Jw3yxzeam5U9La2a2kDO9gZbv9v+FLpUlq83NuP
	b+pXgWIpP/4UTDimPUuMUJo+LW2S76EovhwOLOOg4Gcmfl0l1hf6JOolpL/rnbGvqQRnUA7bwbK
	xMXHmXwASfK93+BTqA8obNoC6vomYMU3NOJfRQ==
X-Received: by 2002:a05:622a:258d:b0:51a:896c:9aae with SMTP id d75a77b69052e-53054876057mr102752221cf.13.1788566962767;
        Fri, 04 Sep 2026 17:09:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53053ef5af3sm33158421cf.0.2026.09.04.17.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:09:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Date: Fri,  4 Sep 2026 17:09:19 -0700
Message-ID: <20260905000919.155694-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
expander and is register-compatible with it. The addition of the
compatible in the driver missed the documentation update.

Fixes: 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi pca9655")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4631388a7d91..563f61e6e543 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -67,6 +67,7 @@ properties:
               - nxp,pcal9555a
               - onnn,cat9554
               - onnn,pca9654
+              - onnn,pca9655
               - ti,pca6107
               - ti,pca9536
               - ti,tca6408
-- 
2.55.0

