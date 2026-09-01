Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F38E3A961A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298956; cv=none; b=IaQ9MHM1nAnK/q8iOlX22mhSYRxD3wzELAtoptSBAxAFMnuODNxNA9UdKtyUZIRzNRy4EPurDpgxbBAwrE1B7+qiH8afQGCIaBRtHAZk8dMTizs8MN8To6Kz5GMc1qVGDAa8B2KadBAdExKLMIYiTZy63hSOttQ19qBvC+YjhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298956; c=relaxed/simple;
	bh=JPUA3viflQ2v9uEzqZ95Rm337zpwh6hXrUk2Yg+PzV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVz81ppJ6223rELF7+y7uR+irshWI/tn+zgQufS5XXXxZ9Ogatd6lUGX4Kbb8B0g693+AmhzDKQT4OB7X9bwWkwsK7iviedTLCv0wECUvNs3JcmjtHOvUQQ+D2w3VJ6WxWGTi8iDldkW9r0XvXNKmsdgFlHc1szWvyaYvgqum9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P02ltant; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P02ltant"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-46ad7304688so1684065fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298953; x=1788903753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+NmUzFRKeuEQ7M+1ibV0+Pzn+8gHlXWcUZ2COu4Ht4=;
        b=P02ltantu8oshKZx4o9a1xUnDYuKblvHDHy+YNGvhEPpwpmIO9JaWHP2XDXpg8QpAx
         Kmg6Zo9rO1JeLJfEltpVgzrJSU58i6DjzOnWg4sp1Wuoo48K82TI3+3JIWQU5zDz8rIU
         j+wXa4awoJHrC1xqRbTPVDMjTnB4EbKyIzX0Ar/u5evhkTFePKY8/2fUuN7UMuTb4CMO
         T3jDgt1zMw2j6qk8jOtfVPIXvwR0MyrE9DBcVovjIM8Tj1LkJ1G+DbyV1aEWLXJtq7Hm
         YMHIylHtwTp49IsQxtQ3JxYQO7Nl8gJIb/AZDNn2pBKPAD6YC7RAftFqaK+fq1LN9b22
         qAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298953; x=1788903753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+NmUzFRKeuEQ7M+1ibV0+Pzn+8gHlXWcUZ2COu4Ht4=;
        b=H2nqUPtx4j5EA3IhNSuZ9LdzNLnFaMmIZd/KTNEEoq1odMtGf6NrZ+pqOYADKxDVX5
         2U7w6sSAQI5QANPX47sIStL1h/o2sUGhJj1dVetVEJJL7LHrJn1s2Jt6YBWCcWUXlKp5
         eacI7GV734ZA7LJfeeSeq4XhryAjw66vB2eOVDGdDqOuoi6v3hxZyoVtxx96fp0QpRBN
         /qBKMSICsirql94BZnW6lvrFlBl+W53rJ8OanPoPJU1B74Z6rSBo+tCoF5EMrdI+ZuOP
         0H1z3MV56DUVao4ZIxKzgNqFNAEHz00s73ZsRWTHTzHoWkoja9rckWGxoKMHSP47+Tuf
         jCow==
X-Forwarded-Encrypted: i=1; AHgh+RpC7jUzP7sAMJRrfdxuNbWaExvDtg1Iq8EQWSV1eDojRkKST07dbMp+nUnEBxobfPUVdvHT0q6vUWBG0UQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nYcKKOEw0O9dHBSFFpDJoiNyUwg46ICJXbXXWZZmIGgk0Q5NeP
	AyhEPUJWVH6cd3beQ8LvEWLP3AwAKEBmR2uD5ATTgIBt5OYA2YaIyLqidf0hV1GN
X-Gm-Gg: AR+sD104/icPAbev4+4JMejTeDaMtSkUlWcp9bekOq+iccnPLEBNkJU1omWEIRbVNVj
	Mq/vXfNnwIraKiCjxw7SGmlQT6qNNSAjbppZgwfACWQbKNRvDm+GCSwoFgs6CXvJtinZOZtmpWX
	aA4GKCavRB0K/drOQNVXrKH1BSCXT7/1CIo8ezjcxbAJZS95CEYU8aITnne/fcamxCyVvhSCMkm
	41p4xeeXzRjZKShTTYj+UpVcnN2TEDMKOEQIOWPEvOUYvxbnw7mzJPoZWXOW7f3qlUsdmq13tVs
	lZJ25ndrJU2IAw1/MIrZzllQrFlnkcniGoWxg7V1dNGTFOofEwx/LuygtPnx3m7eZLClhO6/W+R
	spnnFa6CF13UUvUqc4nqxff8H7Vyq84XPmZobweqeSNUD39VAVtkwLcewGy4ViOBSo0YKl+uzJ8
	J0f0AHAlPZYSZP3d+1EPceFaFZ7xuUSW2P8pJj7BE6Mbms7QFNOfXS62JaTc1GRPWOg/AaQXODE
	2v54Zf5srHQ2EwIQMzDs38BKgvfdfUkd3diB3+/Fl2goAHw+zBCRgzhcapTBkMXUFu/F1ldB1mU
	6xc9UeCsK+HNFChAUXyYAgK54c/Quim+pxP4nJNw1xcJCQ==
X-Received: by 2002:a05:6820:f012:b0:6b1:a812:988a with SMTP id 006d021491bc7-6b4716950fdmr99940eaf.6.1788298953204;
        Tue, 01 Sep 2026 14:42:33 -0700 (PDT)
Received: from [127.0.1.1] (140-186-136-19-dynamic.midco.net. [140.186.136.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm1094703eaf.2.2026.09.01.14.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:42:32 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 01 Sep 2026 16:42:21 -0500
Subject: [PATCH 1/3] dt-bindings: omap: Add BeagleBone Black RevD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-v7-3-rc1-beaglebone-black-revd-v1-1-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15.2

Document the beagle,am335x-bone-black-revd compatible string in the
appropriate place within the omap family binding file.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index f694dcbf2348..9666c455628d 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,6 +104,7 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - beagle,am335x-bone-black-revd
               - compulab,cm-t335
               - moxa,uc-8100-me-t
               - novatech,am335x-lxm

-- 
2.55.0

