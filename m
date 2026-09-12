Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35A4611E1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227920; cv=none; b=cvIzPavepfuPHpw/hdWD3hf1vTPALaSj1fqjPbKEHFfLIPXBWLdxudQI+pd7D3ZpLwbHfK6UXnuo8Me/A2iAXdfag5eGcekb0RC1apdyLRjQBEnjVHzeBesH6KUo1R2MuDolpinVpM9GM2gUiRCeTIHU+HQQJPHFL2wEqZgVepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227920; c=relaxed/simple;
	bh=1/dJm69p382Dvf64y//SEA6x/Du7hGEAXUvp4FFRMB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5pXfun7h5fYOLWIVvrhXmXie0RIo8bPHRUiORZ14w7bpKWFawQsD/MJKwtqEzag8lZlv4wbyLF/6T2CV/38LIT834ehf/y5gMMU2KlNLrkUsoEG90Sibe3cJTTxN5M/QAi9LhDH5/x3aXsx7PR60jDimKCYMGuPRPfSftQm0vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdGhCklv; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdGhCklv"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a0so517892b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789227918; x=1789832718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqAbgy3z4RzCxK+ybMctxWmgKaCsfUSkdmdpAtfX4kk=;
        b=hdGhCklvQ4BRAxSbyb20ep3tG+89UEyQRluwB2BBzEOcgRfx6qZ+bCIrnBQGu4hOW2
         Obc0znYyBH2S6200pFgNZ4DjwvDwF7RRvaQTIBc3+5NZb52FYO/mor/uQhHCqyEXOyUs
         P8jFxM7tza2YFFYE6fb5Zw4JPlBodoZF+v9J92JcyVSRuvJSkvzLieo/cWFEoRxHt98L
         667NrJ7kxXc/Db8gyrI29OhFKRg/kNWRp2yXVGinDbgxjv5kolGPAxDldIVOQ0WThAjb
         jkxeWvrikIMXpKM6k2updcS1RJ/XIVJkIeJ3c2Z6avE+u2U8LIkX9Wv+5fwjU3+1krhZ
         jJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227918; x=1789832718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqAbgy3z4RzCxK+ybMctxWmgKaCsfUSkdmdpAtfX4kk=;
        b=acSLC+bqIVCW0T8+H8nnEHLg4XARKM9G9yovcdOSr+F+v0Zuoz3E0E8BqaX73nzDbc
         8TEiCclxTDgOqiXm09XHSxckOBp5t1QgA1W63BOloGKDmvAS/kOiQWIkVn3QC9K3swIC
         1fHljTgsOlcFM1oq6TGOjU0HQ4k6B81m5/8DwPOXZ0PLB7wKWc1xYD4BgOH01p4cOanR
         VTJp2PhUN4jAs9ya/Vj/wdtSZQwU9H5vMkKIbq/LJFffQ+K13FYdGnBonYruQo3RCWqI
         TA0pLMNbvC8zrPoamgNwR4yJcqQI/KisX7nWoeZIuYg6GlBNPMzjrqOLEVBK+TfPiRi9
         I7Zg==
X-Gm-Message-State: AFuF++mp+Mckehk11Or79Pm3emZbMNhYfrJrttUCZb1fWWP2mPOObgGm
	AG/XNRm0h6BnEMEPsQGC1rgVUPDQBLfeJcWqUJOxrPfUH+HBUxH0KyhtvICGBbVA+Ss=
X-Gm-Gg: AYBFou3WEcrthANK1cGi+fnrMfbICOnDM/yWxniSGSCXBsMYEavOMczPyICkfh4tKcq
	5S6+45VTgLzUlrqnzbxEOUlOf0eEaqLUdtR5LIVG2Hn2M2xRRIdvZ9fV4Opsk2TsGyVmtP6RA5F
	LUhR3dsGsFg1Wf2Fh1zaYVNKi16BApxtqCo8tcY+oUKBdUi5Aq59pvruTRW/2nXeCaUmZCqQPuX
	kRieRhoifOaLdgQNSEUDTPSqrnXwvI5fijezQI2P26ajgtTbLCD6/U6W2VZA52M6UrpA567dbnK
	F4JfhWCnfUCx7w836KbMaQJk5fLh/DGf2WajE45vuYGPY24uoEPX2b3DYAGmXPMwfe33TUjGBzd
	1EyDbG+z0PVouAunTcd4bpFDZ6dFc3VkwnGR/+7jbM72Kg9eqtYqHDOfTnaMYI7xhR3EmAmiF5j
	QIttAi9FUvrf7A5RFa3thBALiLrPMPbqAFCwciijtV/iAZ47J4O4jCvXuum5Tyb5ohsMIPOY6b
X-Received: by 2002:a05:6300:2288:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3db0e448502mr6609880637.17.1789227918241;
        Sat, 12 Sep 2026 08:45:18 -0700 (PDT)
Received: from rxsakthi.. ([2401:4900:8fe5:a1fa:bca4:d2ab:82a4:7ddb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8ead8sm14065701c88.10.2026.09.12.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:45:17 -0700 (PDT)
From: rxsakthii <s97998973@gmail.com>
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	rxsakthii <s97998973@gmail.com>
Subject: [PATCH] README: fix awkward wording
Date: Sat, 12 Sep 2026 21:15:07 +0530
Message-ID: <20260912154507.9690-1-s97998973@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 010c58722422..f6de5b3ee965 100644
--- a/README
+++ b/README
@@ -1,7 +1,7 @@
 Linux kernel
 ============
 
-The Linux kernel is the core of any Linux operating system. It manages hardware,
+The Linux kernel is the core of a Linux-based operating system. It manages hardware,
 system resources, and provides the fundamental services for all other software.
 
 Quick Start
-- 
2.43.0

