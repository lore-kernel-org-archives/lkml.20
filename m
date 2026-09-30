Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08446984F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756399; cv=none; b=a9FvXYWsXbHZHRqCoH5D7gxnCfAeCA7hX5rIw5mSk2ygyIYGiu4GuLQpJjSD8SPd+xePkZTUpwDqekugw42ozAr8Sj5uedcomN8fPj3hgvT7vULetqIpQxf0NhuRfvpcog0bJt9DH9MBVwG4NTjGEmBgmT1K+VY7V74nRVZjdNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756399; c=relaxed/simple;
	bh=S1kI0kz2VpIgx3UB+JHbQdXuW4beVBoQ7fRV5J6w0Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gw+ELrgCkluSuo8IHWIfFEEd4VMr+F8wV9IVJUBmpF2i9FhHWx48GS7gh5Q3OXCtDAb0AkH7FWg0rQAB8RMOnGcQ4xkf4GGewiM13ayAgJ1WjclaQB/iuDZ6VvFwNkl3WuOi1ifiUuXAEs/aqty3nHOpd2xhefEdoQH1Bpff6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8npc05Q; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8npc05Q"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7c058617aso967957a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756393; x=1791361193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++V1wMCrHdy0Mjct0UTBFxjzclTBEd3vplbF3Wd2tWQ=;
        b=Z8npc05QGf4zSc7ViLHPLTxzVjUE0bRgL3/LIUFlc2Xjw1PjMkEV0HNF91o3xpNuc1
         HPGT3RBdplQ1Ripe9ZRAXhi299G+NHWe7X/VDmcX8+vUK9EYXncmBiPrsTvj2oJeSESD
         ppm4uP8c3COjbcNGlsrBzGrcc7e63KyW4Ull9SkX/Ygp/Cgnr8Hejx4oVPT2VKw0ordi
         rcHoF0ifuBMET1kULb9ijBblnsspIQjW3gEkKs3TChpB8mMdUddiMUckqTjUFRteNnY3
         5Utia1AbY541AYDmLmhWdtnUjxErqJKTPIf0tKumaq6qObHhRJ9L0VraKsAJN7PRipOV
         dPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756393; x=1791361193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++V1wMCrHdy0Mjct0UTBFxjzclTBEd3vplbF3Wd2tWQ=;
        b=FFCAMqZu270idijnQJGdnnkiXKmBkVpngQfKYW3c4/Xjn3u9oNh4MVKv7Nlr4Ape5E
         mrJfeCIlBb9lQCHLYfcaMphRtDwruDi83ZzLwr9OMDfIyBukkvqyqAdocNrxs1uM8WIE
         11WWFryzLecTuYRCuneO841N7QjtJmI7cQcAgVcnIiV81/8p6qNXZfp4IQsmARD+oBAr
         Oa+InvJ34Is7QdONYbr4QLSvE90+RYjw4bcyQ9r4XES3z1fRv9MsthKGScCYTrTTKVDQ
         CXEpFGVa7QCR9MHXvZJOcGCo9pPFxTsh8gh67Fybwhv9uvDOqnVYLBscgA1RarZSu7zy
         uuLg==
X-Forwarded-Encrypted: i=1; AKwUvBzUsR5pscv9Z5g/WpWe4dvecQDrZ1y+5Yo8stGMdkeCev9AVn3z74Iy8caRrICMmSmvdErw/YteTD3wygg=@vger.kernel.org
X-Gm-Message-State: AFuF++mxfSwEIf57n2iBc850+T7Pxr3tKuIuKfLqahjVmHhRJfvFbY8e
	tPjCySgORQugWre06JPN7+hm8O2OAqxyvg29y5CrSGxVaI6jBZ777ZD/
X-Gm-Gg: AYBFou3r+7Lr9AG20Lm2XaL6FTu0W1vbji9iOfxWnMyE8kESi4b00sXPat02FLIuouR
	S0c5zjkSmOUyE3hfQ3tZMgs3cvbGZ1R+GWtA4uRIMjFvDm+u/FDXRucBS5yoshqIUCOwxOgNJGm
	WsBri3JYAJNwt7LlnBgZFruVDU6VzoBKmRXuen/D1V0WsUGU0MlsdQnGoDfocmMU9jYeGO+UKQB
	t8Qn1TzRdoifyVic3DG1Mm8KO5TfeQRNhZxulFBlqPxHrpHZfj2nr/0AZVi3oHNwpnmLI1Ou6UZ
	B/umYhl1LrWr1mCAVYFchsNJhziBwwZ7TtJpzOEO6aKMTB+k1Gr+EWy3Q3XdalN9R5bKMptphrx
	jFqkxxn9sDZp2NyfS4rw1Zp/1dx3bmTKhumgnpOkFfL3jErjn8SgyhS1cMHTrTQ6u0k2Yt+SIRx
	fbaEKjhPazRRmwPYK5O3fmVmbHG8b4GmURWFznNUMo76SWs9YbfoArVOYQ8BrMayOf2Xtjv3acC
	dEN8gLTfQQcBiRzxWD3rY+ioLAhgLH6aKynh2wLwPKbTND809IbwrZdY64OD7cX/3kNJYtkcn4F
	kbZAsabf0Q==
X-Received: by 2002:a05:6a20:db0c:b0:3dd:a196:308f with SMTP id adf61e73a8af0-3de9eb7cf18mr792880637.63.1790756393029;
        Wed, 30 Sep 2026 01:19:53 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da126a49sm453319a12.7.2026.09.30.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:19:52 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>,
	Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v5 5/6] qnx6: abort mount on superblock magic mismatch when silent is set in qnx6_mmi_fill_super()
Date: Wed, 30 Sep 2026 08:19:46 +0000
Message-ID: <20260930081947.511613-6-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930081947.511613-1-benquike@gmail.com>
References: <20260930081947.511613-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_mmi_fill_super(), when checking superblock magic for candidate
superblocks, if the magic does not match QNX6_SUPER_MAGIC and silent is non-zero,
the error message print is skipped but execution continues to subsequent checks,
resulting in invalid superblock processing.

Jump to error labels out1/out2 when superblock magic mismatch occurs,
regardless of the silent parameter.

Fixes: 3377755f1064 ("qnx6: add support for MMI (MME) media filesystem variant")
Cc: stable@vger.kernel.org
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 fs/qnx6/super_mmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index 19f123d45678..2b6183d2c889 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -62,6 +62,7 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	if (fs32_to_cpu(sbi, sb1->sb_magic) != QNX6_SUPER_MAGIC) {
 		if (!silent)
 			pr_err("wrong signature (magic) in superblock #1.\n");
+		goto out1;
 	}
 
 	/* checksum check - start at byte 8 and end at byte 512 */
@@ -83,6 +84,7 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	if (fs32_to_cpu(sbi, sb2->sb_magic) != QNX6_SUPER_MAGIC) {
 		if (!silent)
 			pr_err("wrong signature (magic) in superblock #2.\n");
+		goto out2;
 	}
 
 	/* checksum check - start at byte 8 and end at byte 512 */
-- 
2.47.3
