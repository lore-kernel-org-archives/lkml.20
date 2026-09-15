Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC873411FB8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501960; cv=none; b=KRBG4N4MO+MN6Gmh5ZVacDMeNvRfcvgplEVxvlQG/M3oHgUhg08aYGISDqDtH8N3WMSZcGj5Z5NE0YKovsiOwd+KZoQU4t2CBDKpvtCn6goaU9oUGqBQAWOthad2IoHUfc7ZP/xB2QcDlpD9N0Dp4l2zDzV2RZs0Zh74YYem8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501960; c=relaxed/simple;
	bh=2cXXOWjK7JoLdFJFVCJGqbFrSo5eKES1Xt0NI4Smz1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ikeq2Wqw2+Ejpifz3bhluOMSAcEazrpbeMRLJ2Gl10XSwBJhFO1tTjcTVOlEDM/uyud4qLG84yyoP/ty7MmATvBQ4pVluN6uiJZIuWEJJxOkcWsYTG8AidZFORufe8DXWfQeaL+M14NGpejacsNDfPzt2Gt8Lf8jKfV1yQxsUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1PHTmnQ; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1PHTmnQ"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-980b6159d30so47363241.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501957; x=1790106757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eB/X2yMgQrn8vw6u8/x8ViKhD/NsvvzC8LKDvhRpti8=;
        b=L1PHTmnQ1HPmI+SvWbUih+Fgde4geOnQfNUR3ZSZhvfB7ggKWH29iEccuOvvIV6hKB
         MBED8p29l6vNm1hxkBwv/9C3iMwBhs6RXXIkrWH0IBT2BSfKFCfYORuU99w3CvUj47FT
         c/RZ4uluO6OF977TJqa1Myi1tLKgXTuBY+9+TxBb0rgELNW4U0Hum6o58P4DfBORwbmd
         nehK449bPD9GmvAclz5z1kesvSdAjunXXC/7pd2M2O2LmvkKhZw7DusHJze+AJfByDJ1
         bPDw5lxTE34mZGQ4pW7btvoycCgExWoRWpepkjne4BPd7N93c7n/vb4euYQYHf6NbFIT
         1oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501957; x=1790106757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eB/X2yMgQrn8vw6u8/x8ViKhD/NsvvzC8LKDvhRpti8=;
        b=hcZNU/SZX+jGonOjk/9/ZEPmMFPC6nIJ6UddSDHYhyEpJjGBECPo/vNWYcb1i6twAn
         NiXEFljM2pSSd+Ii5R+030PFfJcK0yaHmy4VFx2SrPcy9a4LOjFJOcOh8H/Jq71p6QDP
         8tHssjsLB97nzrYJssaHXemqtZwq7tPOz2x4u1545Bqq3IEq/dLRaPrPcsA+V0fzVCCI
         whgwTrgFjGwVXjhVBf25RJSyPSOS6V4+GnKMJ0+9zTMFzyIR8s9pewZWZWZLsW/uHV+r
         cWF7H9OPUlVKsRJ06D7SysblP/AFVa2Qa7Nb5cTRipWe+RlaaHOZLXSNLDQVB0USc0P4
         LPGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW6p554+IcSX5QA9B9YQGh68zrPaBOre+sDYMJmC45jqhoZuKCpowF1IVy0Li3/aUNmf4bnGq9B1UH6jQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kF+P7jl1rAD67lUhsb3gvfUMed14SF5jQmAKaZqUHVvXkA8Kyl
	beEiEIzxI5TKp1ExuAACdXkhXuBKjhBXSxjRYsUV5XI9M/WkhD4ZR3GL
X-Gm-Gg: AYBFou2QbhaCGfyACTch8/VV11QK2zdQyjrNDgibBWJ7YKl4SnJbIjBZJb1Wf48WY0B
	fmEJ/HqYfxohbEl4f5E62xL2ALA7O43Vfpw7oqOaQHZbdKy/x7GV/gmdJwu2i7T+38kOgAj0Ow4
	UrgY88UjFj40m1DBl/zR84WwTCfT34Y+8gfGMxnTSYVlK8l3CoXI2xngYLBiAgMWim+q/bCKnnb
	FdMquemwFUlhdcf65oB0b35YworsQORK2YoDcugzu89d+cmWUtu2a5ch6Kcs9o1/LE9mhPd73BI
	wowND8TAPqIrAxVcVsDH0RDSKzEVbjQxmGbyNNynMm9vg9i1i5G3kbyrd5Kcpv4MkpdWNtNDl+W
	iM/7ly/kP6N/ipa9t1QsfpfOXahVQdLQUspj0j7LszZ26XbS7cD7nMMgckY3rEdw3cykYZaIy8W
	hQSsELKVeoc0CvV5z+jA0yIvwHM8ghGy0gM5LGTROQgtCLULWC6dOBehLB2OvzbrHkBbkgGHGBb
	jc=
X-Received: by 2002:a05:6102:3fa8:b0:789:100e:3d1b with SMTP id ada2fe7eead31-7a01f188877mr34423137.0.1789501957560;
        Tue, 15 Sep 2026 12:52:37 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb193720fsm823368137.6.2026.09.15.12.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:52:37 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>,
	linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2] nilfs2: validate segment number in nilfs_sufile_get_suinfo()
Date: Tue, 15 Sep 2026 16:52:23 -0300
Message-ID: <20260915195223.3331909-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <MSG-ID-sufile-v1>
References: <MSG-ID-sufile-v1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nilfs_sufile_get_suinfo() subtracts the caller-provided segment number
from the total number of segments without first checking its range. If
the requested number is greater than the total, the unsigned subtraction
wraps and the function may process segment numbers outside the filesystem.

Cache the total while holding the metadata semaphore and return no entries
when the starting segment number is at or beyond the end.

Fixes: 6c98cd4ecb0a ("nilfs2: segment usage file")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/nilfs2/sufile.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/nilfs2/sufile.c b/fs/nilfs2/sufile.c
index eceedca026..573646c5f7 100644
--- a/fs/nilfs2/sufile.c
+++ b/fs/nilfs2/sufile.c
@@ -870,10 +870,14 @@ ssize_t nilfs_sufile_get_suinfo(struct inode *sufile, __u64 segnum, void *buf,
 
 	down_read(&NILFS_MDT(sufile)->mi_sem);
 
+	nsegs = nilfs_sufile_get_nsegments(sufile);
+	if (segnum >= nsegs) {
+		ret = 0;
+		goto out;
+	}
+
 	segusages_per_block = nilfs_sufile_segment_usages_per_block(sufile);
-	nsegs = min_t(unsigned long,
-		      nilfs_sufile_get_nsegments(sufile) - segnum,
-		      nsi);
+	nsegs = min_t(unsigned long, nsegs - segnum, nsi);
 	for (i = 0; i < nsegs; i += n, segnum += n) {
 		n = min_t(unsigned long,
 			  segusages_per_block -
-- 
2.43.0

