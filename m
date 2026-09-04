Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E96E488200
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525561; cv=none; b=KY9LTzqkcxi/j4+1zkCUW3iEXKXsTB70ajifapuskocQrNvmE3UV+XUFKNr4d8G0aL3no2E1SWhtKmT0Y/0q2z/6ytxHgPpwz4m2m6O+Xi1PIEa15Mi3yqK7s5JODkVKP70XCOGQC1ofDfOL3eoFP0embDZ3Tzxj48dkmQr8t38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525561; c=relaxed/simple;
	bh=a6xYloLLdYX0cAtqYS7RsAg6FM06w16G8wdbVf2OzwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2ExnwcjkOGYJkE1bOg2MmISnLPQcvCQIfnnR/UUq8QFDCc+ADKttFPD+ba/UPYQdNzlvVt9jD4poJO4gMxsatCdOqIfQf/k05agIZYm+a2kPD0rfm7zjA3c97DfVxIBReBueQmqga/xe/zsuHS/L/e/h1sgUCMmBg3LW5KQ48Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAyw3+eA; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAyw3+eA"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b12d146e6fso461779eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525558; x=1789130358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdL21V6dT/0CedcIDLqVQ9Tv8x5UXBkXWpfky8wqTYA=;
        b=mAyw3+eALOe5FAwp7M4PLfUk4HRG7NsPU1XjSIorw9Crocb3lQRC+bTutwEDrte87c
         oggufXbSsrO86skKZPycGCXjwZp/WeidPeIHtrgjQT69LztFB5/sNwsdbLt8ZvHwlRni
         3Ig1rEyChizMZcjOqsGPP+rJ7UX2ZfDrkW2eGim5LkAbDM/egFiom+4aUK1XMHoW3wak
         2ElGEaCas9L5X9aP5l04O2K71klamNeYQsFFoqWLiVdIt6vz3Nx0AMtRdTjWWjqsNsAi
         9vpmAcPX7wAHCH5eFuABXol4WdmKOjiQW28mxOXkPbx7dLPTF1JLjN9aB9CVVZcR0kmP
         PEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525558; x=1789130358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdL21V6dT/0CedcIDLqVQ9Tv8x5UXBkXWpfky8wqTYA=;
        b=eyBbeH6hDGFe1O7659UpkMSzCEzURgWh/5O5p0O+jVyODJ2kljOgQRzuY6R4P5YZKz
         CL/+KFv1I7WPc/bt+XkmOmh0OnOqITxWGPtz9h8dB7oskHHR8w7rFL9Tbc19d2XGZsp4
         UnmILnptPhPlnhSyxGpwjbOKadr5x5Kj+V3EFiNNdX88CCfyMK0ga0XDf4QCwicAfqps
         tmEenLNDnVGW9x8garwnnfG/msNTGzMRjKo1SZRF//BcoWVcMgjjYm2VlB5ni05dP0gc
         ik4Yu04tUDsAO9D/j4FbYDnfW2r2+ltVdFI2UMfgYT9ijC4XahQ6CBW7AMS1Xurxnlb/
         PW4g==
X-Gm-Message-State: AFuF++lJ/Aa7RT9xE4NZUpihH6mf/gxPJeu+BcMyAE/zmI3Y6lE7bZHc
	q6/iUbx/klLK5Gd1bQ3Hj1nBNe0mlisQUil/4Zwf+kCqB6aaXrluQc1f
X-Gm-Gg: AYBFou3JdQpveRZg41utUeRgIg+1QjGLAEIZam8X9egvD1LAdEo04ufJSp5xHGMIyCS
	iJCvUizFWZKsMV29g7qwhCojz28jvNgTqMcxJooNOTn/5mvELdhQyE/sMfiw2Wxhr7VyMnvxb3G
	ndU63P69ccf7X9hro+XSjHgDBwoF2C5S7wT76/WkWi2X+LAhGjxq5Hy2OWqnXlKSP3ETlsINA4k
	mCJyMtQPk7WvcL2LCmeHUF9+YsJSIdkLGCd97bYT9tjnMM1UdRFa2Dhc7uBV7W6X9mtnvX5HZ2s
	sfazfOIRGCUYU5YVijftzwb3KyZAIfcl8pgSWOycGpIJlvD5aDNtRQZTa2Pmb/cH0+LEsaeQZ+Z
	1sLoDdX4677kOcq4hFpRyg/h82wEssYxGBvqY/CFpeitf+12HkBLRO419J9vloCGViywQTTJ0Mo
	HwD6/N3xAN94wZMQUqvjCHXQ11pIp3/qRpFeOGhUe5HHdqcU2Xb74ZXtzHdz9DUTNwQTpPmV5Zu
	tAWYnF1RvAOLUg=
X-Received: by 2002:a05:6820:991:b0:6b6:d425:53eb with SMTP id 006d021491bc7-6b6fd1cac0bmr3521457eaf.25.1788525558344;
        Fri, 04 Sep 2026 05:39:18 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm9867944eec.15.2026.09.04.05.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:39:18 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] isofs: fix repeated word 'in' in comment
Date: Fri,  4 Sep 2026 18:09:13 +0530
Message-ID: <20260904123914.583-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'in', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/isofs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/isofs/compress.c b/fs/isofs/compress.c
index f9869d62b850..9efd7a9082e3 100644
--- a/fs/isofs/compress.c
+++ b/fs/isofs/compress.c
@@ -90,7 +90,7 @@ static loff_t zisofs_uncompress_block(struct inode *inode, loff_t block_start,
 	/*
 	 * First block is special since it may be fractional.  We also wait for
 	 * it before grabbing the zlib mutex; odds are that the subsequent
-	 * blocks are going to come in in short order so we don't hold the zlib
+	 * blocks are going to come in short order so we don't hold the zlib
 	 * mutex longer than necessary.
 	 */
 
-- 
2.48.1

