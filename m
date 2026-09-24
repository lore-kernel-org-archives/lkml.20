Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101943905E3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229903; cv=none; b=k2ohMz8L2a21VAlnictKCz6FMm+Sa1ypydX+wyesijxri8njblWClIUhVgF1+ijJ0GPdNWMBbB9gUlkeXPSq93q4tYFPFy91Fou3+wNd/z68aYj2pe5UcUD8v3ha70Hd8Lh+UHNpeqGArDxo9j+kaLIKGp0Q20It6huYM0/IkNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229903; c=relaxed/simple;
	bh=5hZLI/kIQpbikAHkHpMD5b6GN/lBgqrwDhltNEQCbYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp3EkG4CehxZ94aaD0N+BqWNGbNGhWn+D7WyQh1SMoq04pShVGPyDAbHDTmlJ2I2NQZ/lQjlCSiSfGgGwDnKmEGWIRbBOAJYuMwDL8eI/OaUpPgBvIsIgfYdpqXDGP6cC2aDRB+jCUYIbsManOlXEvGg3GKK7+gaKDwtMzRv8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQAOdMYz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQAOdMYz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so8568475e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790229900; x=1790834700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0MllcKz8m82n4vcEekbO0+kdiwKRbPnFxBUUcpz3O0=;
        b=LQAOdMYzM5PHZ3Rv4IBidx0WBUpOP66/10x8GIalQlejYwKP16mFmkUwgSadrzC2Zm
         JsOKgmGo+s20Ls4/a53zC4PMnmjPzJVPzbvgCzhm+bOEjgxbqz4Rhk0LFj3ZRcjiPJoB
         FHu6nWqf0C81HW+wEY2nLhTFh9acz1xZWQ0yEoDPLQtYgRW1VChK5keO8gUuFWX2RAxT
         /VcaEZGVm+I4AJc00ySP+qmuyH8OnoYTukkijirJVGu+4+go/e5mf6wI7HEfWHggfNvF
         90pG3nq1eXxAniYJs2Wby+othan43OOSBja4OW9nzgtuyxil4sFJyYdqccuCsxRcMFj0
         gE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229900; x=1790834700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0MllcKz8m82n4vcEekbO0+kdiwKRbPnFxBUUcpz3O0=;
        b=BDQaEF3IawOV9FtDUMkBqVYy9423Vgc456QQhIm3/hzEggY8141UUSnCBcEA/NeM/7
         J1xO2WbwRncRjm+ioTYpavqwR3wle+HwlUNo3CGLdIqA8RdxMXtd2aJPp6hvOy1aT5ec
         6DH2b/7oORTwTCRfWFagyjOkJKqdHxviKmFpIkIeAoGro4o12qQxi14oVrq2l2r42GLp
         1oc+rkz3lx7Rjt1yA2PkW+YHorqUvT/nUClbyQL3+he2Il9sv25GOj9m0JPilxb1nwt1
         ZKxFXdANzFiFasWlqUydLvz1MebFYFS4klH+jI8bCIbvMJpq2srOxnoLKU0Eoi/1KvYW
         QmEQ==
X-Forwarded-Encrypted: i=1; AKwUvBykPcahhYriBF374cU9mElitjcjR0VvextFpJWm0ZmZDBtNdSPR7qbusobN20M+1fRhSm1vZE3g8DC/OsM=@vger.kernel.org
X-Gm-Message-State: AFuF++mUss9Q84u5Wgi1/5h3pHG11Rg5rekdRphyyjIzoDcaELWAUKNf
	ExhIvv2T3BlPt0NV7cwZM4TKCWm+40bvLz5t+NQo1YeKwIxsdLCf/utE
X-Gm-Gg: AYBFou26f8fqpQvJgLbav8MhRcLhWi+qFeNFveSHcVGEBOXQWT4cS11MNrDnZVq1nNE
	PLQdXNSYFssyGoTlXQdH0XlNZNy2V2AOti/mCnY6g2/YA0gaD1BxlwLvpgDdATEYusrKXA9i2y2
	0vWo2WiozG2sPx7uF9rk9piJV0MwNtcgd6ji7R49x2fF19ArkQ3Deb69oIdQijLwf1VSxUiWJ9V
	MwKZYx2593B/oLHCCw9RUM+Ns2vtMMvRs13fsJzNCgrJPMPt3/djGj6pMkWFL9FTtH3CbJh7LH4
	V76Yzewj5idKBlM/WTcZVzcu78pwJmK0IwxRHzrNzNMo2WDixn8HhJDcMtYGnRSyDGQIsEWf2d/
	ccHS1yYB9HPfHSFTeh2GlwKozbk7IxAYaWUfmOOp6JOqE+XlypL91Lt7qrUuPeCasfwMVqBjAh5
	6FkpGr0ElLmFheelatkLmKUnc9b8/vP5BJ+bKXkjZAr/ruh6dWby2Ofe3dD3RvjEnQN/tN4edIc
	i2SNB4jhFIPqL3cA3dpEtggHEpIoo13N+g=
X-Received: by 2002:a05:600c:468f:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49fe66e6438mr22822725e9.18.1790229899991;
        Wed, 23 Sep 2026 23:04:59 -0700 (PDT)
Received: from githubb (bba-86-97-124-202.alshamil.net.ae. [86.97.124.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm43099825e9.8.2026.09.23.23.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:04:59 -0700 (PDT)
From: Ahmed Abdelhaleem Ahmed <ahmedhal@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loberman@redhat.com,
	yanghao_ht@163.com
Subject: Re: [PATCH] scsi: ch: Do not keep references to data transfer element devices
Date: Thu, 24 Sep 2026 06:04:40 +0000
Message-ID: <20260924060440.33252-1-ahmedhal@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260922-ch-dt-leak-v1-1-2b2e40bf1624@gmail.com>
References: <20260922-ch-dt-leak-v1-1-2b2e40bf1624@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Self-correction: that Fixes tag is wrong. drivers/scsi/ch.c is not part of
the initial git import; it was added a month later, already containing the
lookup into ch->dt[] and the kfree() that drops nothing:

  $ git cat-file -t v2.6.12-rc2:drivers/scsi/ch.c
  fatal: Not a valid object name v2.6.12-rc2:drivers/scsi/ch.c

  $ git log --diff-filter=A --oneline -- drivers/scsi/ch.c
  daa6eda65a53 [SCSI] add scsi changer driver

So the correct tag is

Fixes: daa6eda65a53 ("[SCSI] add scsi changer driver")

first released in v2.6.13-rc1. Nothing since has touched the ch->dt[]
reference handling: the only other commits mentioning scsi_device_put() or
ch->dt in this file are 66167283c21e ("scsi: ch: fixup refcounting imbalance
for SCSI devices"), which does not touch dt[], a2cf8a6306c8 ("[SCSI] ch:
Check NULL for kmalloc() return") and 85bc081f44d5 (kmalloc -> kcalloc).

Please amend when applying, or say the word and I will send a v2.

Thanks,
Ahmed
