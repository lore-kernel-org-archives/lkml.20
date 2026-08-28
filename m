Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A914D286D70
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901922; cv=none; b=HIo6IroP9MraGiViXDYI5IFRuRSE65oZn3nIc2+3gGWs3xNki3JvcW8BFs9czUdj/AU/aiccOmZfMSU6qlM61m/B6SUsKl5wSnVZ8x+gNZL/9dhNCYU86OwuSvvEJYNbFEoZUCuzG/aDxubwpPpRcYVTUe7xVAdLCFpjbp6Pi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901922; c=relaxed/simple;
	bh=t7gdKZm2xv0x+8x0XhUmpm+B5MDDWADUhh3kpRjHlVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSiImPIxi9oNA8sqBOgcNroS6QwX5VCEwz6EePdmSXoeURVYEfOauVN2KpSreXVWtBCIFDmrkwvVFTsolY3uXTHT7vbset/bzg63lLCn8a/4NT0yhE+zTeo4Y11S7DDvYpvSs9NtZigCGkgVDrkhgCVslHthrLy/pN18GcVb9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZy1aBAQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZy1aBAQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cace91f112so5215585ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787901921; x=1788506721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZO22JXLmsGE48YByeozHJwqBsmsMLopePby7l8VwOc=;
        b=fZy1aBAQllNtnH21HpiEJv0kQYoulpySSmvEhvd9J55A87OnJ8lOUPCqSPdo0aZqfs
         RbdRI3sf+CAMDtEuCyPnXHTqcA6MsuPSeHBlIq0a8S+WGtHYBLojmBPZel9WLc6aKZGI
         dMggVNlAK9regrq24XXYiNhsIeexQ8qhWXid9eQLrGFRi2PAMVWvGiMypU7PEp8AjuzQ
         vNmMBAtfYWv6cGL0Rz9GRcVG1p7MWxRzts83ltSwByJVS3gHf43Wego9SmwQgk+HI0C4
         U6iPY9/R2DacheZ3BXlS8jwIsZPJbFfmDSTLHYy3qVICHvv4BHsQ+ueUqrcCJT2RxCKt
         N1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901921; x=1788506721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZO22JXLmsGE48YByeozHJwqBsmsMLopePby7l8VwOc=;
        b=pHcL3TJ437noUSPh8idV3rJDfhRmWTj4ksghYwDkd4ehdqh7dhKm5U/llD3NJCpUmq
         syihVh5NY02q6t7+a23M1G8terLVSVuf4mBZ0jktl4BfGp1LSAaxgRg666oEEcs/H+7/
         sASbWfYdRo7cnTmWvUUMzmxElRxeYWK+KFU9QYbvDGH7fmpYQtoXkILGofFm4khBujkA
         B5VD9BlSFXHMlrUyk3ELsvyqJlbcT6D6IzbztEbDmiKbAYX+C5J5R2y/07usPgKGtNLH
         rxR8I4dYvdXsxePDt0Ue9zTs81I1iZnm7/Z4Q/C1jLCib6G0RGrXsBNTrbrvCa5Vd0M7
         /z5w==
X-Forwarded-Encrypted: i=1; AHgh+RoVjemzsZYNx6In/1M6PMd0aLeo3znMjWJZDhjRVvjgw+iB7YbDuKgqdKw2Qrq/IMRlGp5ps9P7OUya5sc=@vger.kernel.org
X-Gm-Message-State: AFuF++ljIChIivuPtRUYckEpNM8H02uphHvbki+NQpplmBNFTg1yr6ej
	6fsER/1zZR1QEbv/B8ngEi6R3KSENSlApRCTeKSK31guJOIDZcaOWnzJ
X-Gm-Gg: AR+sD13QoJRRM0pYVO0gvpkmEwNDW2NlT2HGqFDOUB6aR9l2hFv0+L82/zWro1/061U
	JJnjmUJbiWZp7TCSqmq86WOtKWUZ9mMrvsjT/IBb1CECISKpzLK3w7aiwthFRJQELUMdi5BMDnH
	wv6k+9ImekibQYdNZFv4P0joO9IKNwkdGkcHdzngElFybdr8nO5QwhRDg3qo0q3sDnuywQe26CH
	OOj32zRSXvVPeMiO1y0trdeUHZ4CUejgTthykImm63NzAfOtCD4SsHFKdKzyjwNhkA1OxwPhI/4
	OT8U9uepCq1vwyscXtFoe6kdOA/mJQngmzSoKjC7h5H1etCHP7bysIRiSYpMsY/alE8g5TML/6j
	csMEHI+X9CK+W82yxFeF6/T97chLqqTuV4DNcjM9gXmMJ9hv/0C6ny2Ex7VlfDTmlAsRjbZMNbU
	j6i0CvNVu1fMxwNo6GcAgfbc8OXOmYVjp7k0alOtuT108uijJb+FSjPymK+6vzeUfcz3+wNIcHI
	rCxjZ4j39Wf
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr74932305ad.13.1787901920985;
        Fri, 28 Aug 2026 00:25:20 -0700 (PDT)
Received: from adminex-ThinkPad-E14-Gen-7.. ([14.97.7.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm2532209eec.25.2026.08.28.00.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:25:20 -0700 (PDT)
From: Mahantesh <mahantesh9789@gmail.com>
To: w.d.hubbs@gmail.com,
	chris@the-brannons.com,
	kirk@reisers.ca,
	samuel.thibault@ens-lyon.org
Cc: speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org,
	Mahantesh <mahantesh9789@gmail.com>
Subject: [PATCH] speakup: Fix duplicate word in comment
Date: Fri, 28 Aug 2026 12:55:13 +0530
Message-ID: <20260828072513.6589-1-mahantesh9789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the duplicate word "the" in a comment in speakup_soft.c.

Signed-off-by: Mahantesh <mahantesh9789@gmail.com>
---
 drivers/accessibility/speakup/speakup_soft.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/speakup_soft.c b/drivers/accessibility/speakup/speakup_soft.c
index 6d446824677b..6549bfb96e7f 100644
--- a/drivers/accessibility/speakup/speakup_soft.c
+++ b/drivers/accessibility/speakup/speakup_soft.c
@@ -446,7 +446,7 @@ static int softsynth_adjust(struct spk_synth *synth, struct st_var_header *var)
 	if (var->var_id != PUNC_LEVEL)
 		return 0;
 
-	/* We want to set the the speech synthesis punctuation level
+	/* We want to set the speech synthesis punctuation level
 	 * accordingly, so it properly tunes speaking A_PUNC characters */
 	var_data = var->data;
 	if (!var_data)
-- 
2.43.0

