Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43147257854
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788495595; cv=none; b=KYrFomvgo6qgaTZwY2CxLmedUoYY9iELIdgO/ldql6OsDmFaa2Zvxgsp7XsVJ8k1ObxZ9IXAOHVsrFsSdVwrhu/SLyqTFqgYN13nQP/KODQ2oCWIyIYIBqKjoTd59Ia6Yh1gxHCYKjMHMFtsiK5Xgc4Gd85uJp1APyQ4hAPh2zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788495595; c=relaxed/simple;
	bh=W4jhwngAM0hPLgodcv1pBCY0xmZ4FVNU1FFxr2xmz4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=moXH+lqp8oGEaw2Xqv8xks5KHCP0Bxq3sj7qVHMZ2h0/TAs29pw10s0/nfqiebaym11JoenH4I1dBkp2OmRYJ9U/Z1mBBnOxrTFRBVmCW3FF2YULmt9WyQsxHjZ3jcxvXxfoAvrm5zqpygdryfld1i1suyOzcuyyWYht9htavaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMdeDSiP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMdeDSiP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-395cf2535acso621881a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788495594; x=1789100394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fxf8J4OmCFyk0Iv5TozrZp37SHzY+6D8S5rOoPdJqQ=;
        b=gMdeDSiPpcmFeuJvVPT+WjPWQMXqy7Vp1yXTLbep7VkPiDtB4CdkyBUo6DMmOYefSl
         xBkL4Bo4h1sQssRWg9pJLcq1iW45bMFXQqCdOf3XGJnFUJpHL0rmTtAeGJQ3vXTxnbRt
         V/BOU7yjJJC+56zdncWl5exofT3Vb+AsEFsbJbyAV951YK+cwLrWz31u1QwTW+7fzwRH
         +OhiTSeN/mAVauQMhfEwH7L2mApG8Y3fjko950Q8cyvx1VX4YIiRZDYAONMLytw7L9Vp
         eXsXiGXEhCe+pXWdA6CiehdX4Ij246nxbVXUbo70i/z0eprcseAXGMi8P5O+1iWwMylb
         RMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788495594; x=1789100394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fxf8J4OmCFyk0Iv5TozrZp37SHzY+6D8S5rOoPdJqQ=;
        b=HsWg2cpFs88kIojBvzKsRDyb3m9fQxNKhNnW04mewcx21N7ZpGhWwtHGPikXXnYxYl
         1NRsaQyBET89rCWDHhS50oIM5sOVRSIpWOUDlpmSqKPf5IVh9RnDTOxFZ3R/Y03SKOHX
         dekTYqGfetvEIyIiIv+VgTq72hbU/U+IIAHVkvxYx+RKyW75eKLElf1WKk3ZOxi0sr/a
         KsxuIFungHkdGHuTgRBEows/cynKeim32/BeXZGkpCrrpL62gVL+E+6o9K7XxN37ZWBn
         +PGesahcqcYL+XCUQRPoEMDqnrMRHExg0ZZ+R2WlDypa2u69Op08frig1rrHhKnHGRCs
         8RDA==
X-Forwarded-Encrypted: i=1; AKwUvByUL+JGe1DTIbtGRhzhMt3VYniGoEZnzueoSWqvYDHnvUuJpQtNwVr7g16LxVpEI75vnGiePbFxsdRhb5k=@vger.kernel.org
X-Gm-Message-State: AFuF++lBjHPuaYoB9fAaz8OU6MdJFM5nEQTxa2dxQhrZS0cl01Y06OIZ
	+E9O8cgHC1vnVtsDnznscmiLRdG8zz22enbZtTuPy8Vf60x71WiHMncZ
X-Gm-Gg: AYBFou0mBzx3sdGeb72pVJ3btF6W3/R71okJdQiG1ug9w+8VxqaTilMcFytXn949GtJ
	6Cc+9YB0s50mktqclfdM0DL/UqlbeGB+pEsplplucpSnZGNdVVGg8PMSZjj8ECnfkJI6JG3UCrd
	kOfOmFBiXbcCvqX6fMszziTC7RrmSczoccHV0YsfUgS1Rts5vG6FShZVXqddZi/R7k5iRkRVt9c
	Spf/L2R6gEQ8GVnHgl0R64uGuKTRHzx9/HLxIdI9+M9eNqMUcwktsAu8bbRxejz6txWOdix78xN
	WU1FsGg+5ui+cE5gRNQeC3i1iZiXAd/nhyK1SyN1N2CA+fWdVIirC+vpwEYDk+U2YKzFvtN5K+I
	6q2dfrjqKxzH4TtS20gyZvm6293oauUnQnjqrIQ2efrW9YFcixD1N9J6ZZhVuMEEqZhlJHwd22p
	lBQi87RGUcpL/dUWGbLU2gPAGmzHMi8HK/HbQhSgAFLHkF0zi34oOv0kXt0cbWDBod57gS+lR3X
	UsAcuxXMKf1L52VsPf1aeq8extpBcOGIY/IqzYGmkkDlbEGUBf5bkv73dERmW5LevikDyu1dTPY
	MrahHutmg48=
X-Received: by 2002:a17:90b:5745:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39b0803accdmr11317552a91.12.1788495593587;
        Thu, 03 Sep 2026 21:19:53 -0700 (PDT)
Received: from workstation ([2401:4900:8902:9774:f2e9:38cc:6b1d:1764])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm5424299c88.4.2026.09.03.21.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:19:53 -0700 (PDT)
From: tspamiitesh@gmail.com
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amiitesh TSP <tspamiitesh@gmail.com>
Subject: [PATCH] docs: fix typos in Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Date: Fri,  4 Sep 2026 09:49:42 +0530
Message-ID: <20260904041942.150054-1-tspamiitesh@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Amiitesh TSP <tspamiitesh@gmail.com>

Fix typos in the CoreSight ETM3x sysfs ABI description file.
The errors were detected using the hunspell spellchecker and with manual
verification.

Signed-off-by: Amiitesh TSP <tspamiitesh@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
index 245c322c91f1..a2e6079ff01e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
@@ -2,9 +2,9 @@ What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/enable_source
 Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description:	(RW) Enable/disable tracing on this specific trace entiry.
+Description:	(RW) Enable/disable tracing on this specific trace entry.
 		Enabling a source implies the source has been configured
-		properly and a sink has been identidifed for it.  The path
+		properly and a sink has been indentified for it.  The path
 		of coresight components linking the source to the sink is
 		configured and managed automatically by the coresight framework.
 
-- 
2.55.0

