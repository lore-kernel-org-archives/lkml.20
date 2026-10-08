Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE73A48E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438039; cv=none; b=SVwvFDmQnzCzrIAvBsCUzZwDf/xYS7JuPyRvczLWw/9rXElOUVQxeuUz/cQ4lCXtjvyNqHqkYaHoROO5jtSZ08SUnbuJSnmxfjINymLc7yU66jWZAA0zjRN1sa3OSmyU2iN/z8ppFcietlAwWOpKACHUFGM/gJ+2w3gsK2gTShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438039; c=relaxed/simple;
	bh=CvBIAcTaNvBuf6s0Q0MU5WX2dqdvQEhblCbv7hdG+20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iAWhtlQ79NBj3aF3njNl27tX8WD/KD6JYVxmxRhkHzbVg6apnbCKgyPLNqqtTbl0PQ9iy4dfrTFUMBq8wykYZLNfp/5rkLJEEfnpYp/AONT8SKmpE4BuTLle437mLrja9a7J1BKGGsjM4/AJbmdH0cMwJXOqsSgTmk4x+GDdXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOPzuVWF; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOPzuVWF"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b6dad2382so5921495eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791438037; x=1792042837; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9kdlXgDyFx5+Qdxi4wxGtejd514wpSbKU1RMyqlmI4=;
        b=QOPzuVWF4Lui7eUCXDZWz8oTardi6iBrdtoA47B5u4MoSn+pBhFFxNhLRgV5CA3Ud7
         J+To4vfgZFU0zynuw8LTsVk5ym6DLOCPTQGjzQSIx62LLCRgEYU8ZvCfOmUtNaGxH3t4
         4egiryehox/eBL+ckbslvF+YRzs3RKFWiD7nNElvmnKH0Z8dNSnUa6h8Z8oRSEUcRJKg
         3lyC1hk4wnJAJW6EM8ux00adAWunBI3GDb5XDHZsczxHYbf+M0psGbchSE6k77u6JOzS
         /Zkizl5XELwFE61G9QixO3rufsrakcMhZcIQKvMngG9NeHIUkq3syG1Kw8QQ00S3nWEO
         MDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438037; x=1792042837;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9kdlXgDyFx5+Qdxi4wxGtejd514wpSbKU1RMyqlmI4=;
        b=x0/k8DFdJmx6ZvoYnuMQXYHrH2jTOyw7lDsL70IVtmdbTF8k/a5Z2XIjD/vIWA41+7
         FUf7RpM0Wg29S5cpCFLGZSpuxYAKfhpFg/BIRV9FM0Bx24/MvzLhzMrYOuzRT5QdCP4C
         aHK6wKcaIAhPG5GtjHnWNo70NMCjNtOVFTUZVcZVihXFB08hzuBGPjhfqN/YSZ3lOb8n
         qBFiNcDSImKenzCyjNbkPtzUUi3it2ct2A+qRiyoMVFifo1K+a77cAt7vDJCE3+65F5e
         EvItZ4H0YbHbLfTTYw3pZTiSYmrpRUBb+OFHzpti7ujFF8zJYBHUTCLiN3yqoNhtv8Hy
         JAsA==
X-Gm-Message-State: AFuF++lpGI9F2/K/RoRAtqPtHWhnpBM0TnrJfolXRXctwvavHUCXgqqu
	RgMByY426UtblRGtoIIrCzFBYB/KBTz1946dqB/i+FwGfBbdPmsaUhxs
X-Gm-Gg: AYBFou19zsQSSKKjCbzGAIfZd+zLjh5hv3di/IN2JvW5GMYD1KRkx4+/eBJcDr4+vcP
	g6cOwby/FfkGT0g0PxCkZgNHeWvN4RyeZrD/GewENrFMM3MazeIZjndlDp0kURwRCqixv5Te79Y
	oYf1xMtJ9183HmzP50dpn3oura87Dg6KA/UXInajuxO+DQJbrT5GTyG2BE3aFY/pGLIHtbbbBOg
	rlc6tLpJDh9KODrSn45Gt+f+K5xNt93Xg9W/JT+xdH6W/vYvpB+BRLZRWxs9FJbpy86bGnC4VSu
	ADWRMMepkC4ZiToCRIsD6yvKZUFqQeFmhYgNGUjNmDIRhYEcWWfmM1AtRbmpRSnm4XB13qaylFN
	hc03CiupZw7lMYhEi7Jge0nNCAy87y6gCh43dDhgLtL6xCtKyl8LXRJcgMF0nwEhb9i8HQD0+hb
	kOtS07nsbMccFMa0IPZzRfbdiVaINmoFrSHqpNGKJ9pfplWGf/215uy09nQqOMzASKa+VlWJQ/4
	KUkBE5QoLQc+zBXqHsFrNqTTtGlgxTsGiEVoM/P
X-Received: by 2002:a05:7301:3d0e:b0:351:5112:ec4b with SMTP id 5a478bee46e88-3515da5dc10mr4941142eec.2.1791438036553;
        Wed, 07 Oct 2026 22:40:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5fffsm11498076eec.6.2026.10.07.22.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:40:36 -0700 (PDT)
Date: Wed, 7 Oct 2026 22:40:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Input: matrix_keypad - propagate error code from
 matrix_keypad_build_keymap()
Message-ID: <ascss_vYXDPXIxmn@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When switching to managed resources in matrix_keypad_probe(), the error
return path after matrix_keypad_build_keymap() was replaced with a
hardcoded -ENOMEM instead of propagating the real error code.

Return the original error so the actual failure reason is preserved.

Fixes: 7d0f351da460 ("Input: matrix_keypad - switch to using managed resources")
Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index f4a63a7bdad1..596696a0773b 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -443,7 +443,7 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 					 NULL, input_dev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to build keymap\n");
-		return -ENOMEM;
+		return err;
 	}
 
 	if (!device_property_read_bool(&pdev->dev, "linux,no-autorepeat"))
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
