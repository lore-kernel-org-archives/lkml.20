Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA1D48165B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522571; cv=none; b=gc5gO/9N2CVCu/dLve580BfZ+ujaV2LtkKBW6shgWFcAGmSD0dhZZcvPyJyOyUEw9DLfA+5R0B2NSM4PwovKglCvuaa6C9np/svG0i6fiZCWTDCRvRiGwivICEqkQzc2Iie9eTj2G3XyvuBQshwxMM0k17BkOL3YAITZax1QceA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522571; c=relaxed/simple;
	bh=1N6S/0++RuO3ppCjn2I3KMPwSzeZZUApnT+MaalWnhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7uHiP2xH5mef/7fmVWNR9gGDb9nwSy2v8QjO5q8qvHCcTwaR6QQSqTRl5g7ga12GnfNe+rFw57Ptg232bDHn/i+Ch8r7lVIDuspLnNh0KxdNRGHZY5FOQE45FOLJesN3nnJmhgEyTl1ikDcmiodzE6n6LSS9SbJSisH7DJ3Jm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLy/PKUa; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLy/PKUa"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so697310a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522569; x=1789127369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NENJaIws9zKIIeoeNZgCpTiVTdEc2ZBt9Jz4F+j3AgM=;
        b=WLy/PKUaqZVbs9cBl9W25dBzcUC/EaiTMpxULe25fw6OkTypYVlJJrzTncE2R0pRbj
         5+VoiVYtifOYg48tLidsDM/gPZtBFNvVFGscuSirs5KDQX9lXPbKdXt+XqtVpy2S/5Wp
         MK0wJaFp8oGEN7lAEsjBj75KVJyoD4eMwCpvW/DOkiktQ2fcf4NTD8ui00Gxq/lzOmTh
         NSYx6txjPNxbTxAiJ56p0JeZnbDtems8qSh6+jeYLXpBGBkfb+SgL5szs/NXT8+VqJHO
         X1uNq7SLEtfOPWHn3mOI8nk3G21mZkbOO70SYPWjvbpKY92NbcU3ukdBRAgBGpOjo0KR
         RvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522569; x=1789127369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NENJaIws9zKIIeoeNZgCpTiVTdEc2ZBt9Jz4F+j3AgM=;
        b=IRyl5sltvWrNOs+vrfhSRCo9OMaSXF+XkinJqBSM5AfN1OPJ4DkhVDWI+qQlCY35Ep
         NxVpNzytfs0ZTlIaJupJnY5rgtMSTkJF287+S86C+v5Qhu0nBvMlnlT3RoUoZa6+ZtO3
         rYWaWpGy9DUoGZBSVMQ0f6xMUBkCVq28hblQIly9JJ2ottNXu86MxB6QkGh4jTIjkkVY
         6ubD7DTjQA0XHbr7j0IfQ6lVjU4AMgfyGqpZD66ngp1VE1ML702hIbbBI5GIOF0yT1wM
         2QkAMncmQN58tqxTdsCxfZeKQ9Plou+m1j42xWprTK5elh4etFl0mXu67KKD2+L6DZmA
         6pKA==
X-Gm-Message-State: AFuF++ntHQwyAzg0hnp6YTwbpNU7ebvHlWTZ2zf6lsm9fyHyZdxl1JXX
	4o7Zca0O296XWbPIENevMcCbRvoD2YyoeqiiGyowFJ1wD+23GWJa3RLQYqWBemIiX9A=
X-Gm-Gg: AYBFou1ne/5SMvYlfrRsULnuZGSdTC8gPXB+7m//6K37HJ+AsAgJFySoCN3sMKE4jvf
	tCtY/XWgXcdAew9hFYVyUx461j8EfCSqg3yVW0MxzDIS80ZZx+RXGrGIrM/Mw61gcHNg7HK3nxt
	EBOEHRv5fFT/7pOF7sDhB3gseytTwi0hf0EvYSoNcZ666Oi1wjp8G+1icI0y5I554RqMWqWVqE9
	GAe92H4pHGWeeuGZ9rQc2RZ5/8DeJezPB9ohlFsabaVGYM3s15Si9NsR+3Vu57r58CaXW9sVHOr
	M9/Bepua4xbFqBptYy8B4ky0SX47H2lfeLy9SdUpXjAHDTdNS36Mevd1R6VQX2kT41pf3ZmzAZL
	v3f3JLu5E+DtcA+NIa0O7ZL+2/VkwzUUCYNw/8u0Ta4xYcKKaj1T1BxQTpvEyOcqilFQ6SnTwCa
	1nGhMDcHgaccPRvEj1xgTWxbuVK+pX9o956cgoww422JeDlUcyADVFsmwXMllNckPpQxY1oLvHf
	TehDLImV328mjg=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr8362834a91.23.1788522569111;
        Fri, 04 Sep 2026 04:49:29 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6723317eec.20.2026.09.04.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:49:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 2/3] firmware: cirrus: fix typo "upto" in comment
Date: Fri,  4 Sep 2026 17:19:13 +0530
Message-ID: <20260904114917.28603-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114917.28603-1-hemanth.selam@gmail.com>
References: <20260904114917.28603-1-hemanth.selam@gmail.com>
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

