Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E93F2701B6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846821; cv=none; b=eDsoClcye7VJb4I8BLz/utEFT9lf5pruhs3H2yrVlly1YjBxdxnEHAxdcBXracX7DGWLXJQ54ej/Hd3ZUVUKP79hxvHwZX/Je2MzI+81E10MwNUb7680fOTIF15PYHUYJ8E75nDkXiYsmv2rK3yMw51qOq3mkIxVRDo2Y+qkbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846821; c=relaxed/simple;
	bh=6ps3gbrvdmNYpe3ebw6DbPrKYnmJCb2NTncifethu10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4q7pQQYoAQHTsII4V8ZWl88TxiUCMJpI4E22h2qrXZTpA3pTt9hCXg+V2imds8vsFxKshoAzlhztUwJm6FED+Up+IB5q4kbLB6ge9Lb9qclEKvwHEZmhVzgJoOww+890s5iuzBsJzGT3jWh1PCD/spu6WJCRilxS908rVkE+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fo7av61y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo7av61y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d715f4a587so59154165ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846819; x=1789451619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cDc/2aCyyotiOf4E2hjtbDQRp9Ebk3+6j8nFvwCYE0=;
        b=Fo7av61yk2jztdeto41Piz1ltMSdOtxsHsW1hpP6e039SNN8dipGjyZgpK8kPmfr3q
         pn3KTnjx2M6Ug4jNEyATlYo34WOYTJ6qEsKgGxG9wmM89UWUluUlExXrlNvEdFQom8yg
         9OdnM8jd9LkFOcqqKFrXG8E277P0MBF/+Z/wB1D1/tp1azffcOUBgjmJwACxEHGQ1E5L
         6cgRYdExtAIRTgDvQkBUvVyM8le24FlSH9wZu224h4MGAvHzsrTzCE9YwtZiCZ424PzQ
         pdEJWGfKKPoV4oDNf6ITIeXnGxpyhbyU9KgC2Sng9tsXAfworCq9vKIlBGd7gDDi8YL0
         4KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846819; x=1789451619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cDc/2aCyyotiOf4E2hjtbDQRp9Ebk3+6j8nFvwCYE0=;
        b=PNc/cyHiq1YkKuLCThHUcVkvs589WDz+l7DQQxe7v3gbsU8kRZdBAgdrLpUH4+BZxR
         7cWaG1KWSSm8YiQZQD0QcW2TnDdIK8IfR8pBQ2aSlF1fnKuldQzpFZyUluQOEJLpoXH9
         IPfjI4PvPBzkK0+hkeZ3fPGg6AWtxNo/POPr2WlyBhDg8JI8a/4oU3gq/tG+cuW1yfjq
         K3OcGsu4NyDZLwYhmRSiJjHr1pEfyCVSmGIKM/lURrQyyFRJTlIRMCWl94/+kzokX+OB
         Or7bXi+at/mgn1bywtZqCh+4wN6vj5sSSnc6CdTuSjPU5EIVaB08WqHF+8B//Pvfie1J
         /9QA==
X-Gm-Message-State: AFuF++ncLrW3wi/yu1aTa0oZGuBdHxBZ3ip747pSxmpeTcuEFBbaNjWP
	2TZxizuEytMqJM+57kBEfz7VMnxH3RvlU8WeQhkRtTY8ajuN5FN2G5S0
X-Gm-Gg: AYBFou2liZgPogJJFLj4czk4ZOpDrMnDe8g0WD9IWFOEe1qkFk12JJhh8OEdZsz0+pK
	gbOYjvVw3yBmspHcPh/XJh5MylcbBDwzP/KMfx4ZS68CcEgSLZwpS5nSzEp0v0KfGGzMjamVQgW
	o8zUHE20zpmS3/TM6OQLIwjanYWN/jbRTNLZfJ3QB/CIiYhoDjGM05V/xKbw4BRtdU/8C/XlJQt
	Cetxt3BKoB6DeaXymejPxgaFJ1ibjyjvnMmiAEEjjP6ux9H9MjYAZ2ZBB68sRhCUUZVVmX+Z4Oo
	IpotF54qvfARVL2W4G3tcCYzKPCB7maw3KIGOlHK8pQkW1qIfjubKvyb5PKcon/ea3kbr/er/zK
	cLjrpHZqKw6aZLpvyPDlJNs8sc6EEeVoPJpMxGT9PYAhGVp/hCesT2W79kbd2/wz486aqjptGZF
	EZgcMHosT1qsND5ERyCIw8z5lOQWQ8L/QqeRMO8PhSknTXcPJjrp9Jf9krGybs1tSSYM5ADZvzV
	1Z9r8SZhnv1Dg==
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr41109121a91.9.1788846819489;
        Mon, 07 Sep 2026 22:53:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm50372811c88.4.2026.09.07.22.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:53:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] firmware: cirrus: fix typo "upto" in comment
Date: Tue,  8 Sep 2026 11:23:34 +0530
Message-ID: <20260908055334.22173-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Changes since v2:
 - sent on its own instead of as part of a cirrus series.  Mark Brown
   asked for patches touching different subsystems not to be grouped into
   one series when there is no dependency between them.

 drivers/firmware/cirrus/cs_dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index bb93b24c659d..04015280ac5d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3505,7 +3505,7 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_write, "FW_CS_DSP");
  *
  * As cs_dsp_chunk_write only writes data when a whole DSP word is ready to
  * be written out it is possible that some data will remain in the cache, this
- * function will pad that data with zeros upto a whole DSP word and write out.
+ * function will pad that data with zeros up to a whole DSP word and write out.
  *
  * Return: Zero for success, a negative number on error.
  */
-- 
2.48.1

