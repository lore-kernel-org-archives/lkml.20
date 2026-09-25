Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FE3D5222
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357635; cv=none; b=Y2mw/sYSvO3UmN+ic+Aa5SlKW+0CfBn+HzXnkwQ/PjKmRzJ9NyL06m0IQc28LrfBdZkqmvEZ/iWC4jUZ8elKYaHU9GyWf6v4whNy7K1im70FAFxd4j/1gBvL8Jp85yuHL8/Kwwa5+4I/HIlg0/hTFeK8ww+rMt6iTenC9bIu3Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357635; c=relaxed/simple;
	bh=AKrX3Lzl5iCw3CmadbTK56AysjGEIIIJQCtqQXycpDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oa9FwlSOZ/NR53kbkGi+FhNXEVGdC77DmzqSVyEzmtag2/VHpN7iGaBwNWYs1gUEZgx+5KUTEDKOMj6OYxIeEdWdXh3FWjC6chqxBpneqatCXIu0WZgA+BnJjf1W2Ou3HrbtEGtTJgfL+KOaWNsjaPJoA/bPDCT8u9f4YncKyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVy1k9ZZ; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVy1k9ZZ"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so686169a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357633; x=1790962433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9H6AqcSl8dN0oQQJUPRgrlL2dpmTbG/5cSDKBg4G6Y=;
        b=BVy1k9ZZEnn3g1wqdtJAPGn2CGi8ELNDUE2udCcQXedNpgsMtXFbYiUOiLsqGgF48o
         EF9G6cO97lR9Q0Nv52tTzme2wa38H/2WedjPlAikXEIu+hssEK0QggGrTzRLeIsVPTjU
         EhNp5Dziz3AJ2Gtq31U7OAvN2Arehz0IQrWuiVjvaNs5rL/n+sslshLs2UEhGTLyJHb4
         uiimY4ajzse0GCvixvYy37IhYeh/7Xr8Qzf4yNkR9rf0hjqSzhOqop4BsdEP0I/ddHD6
         rFdC1rG9J30xr4iPWgCa9LY4Sh5p/W6L9bardO95FOnsP7ltOs8z2Id4vBO3k+jkxjia
         EchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357633; x=1790962433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9H6AqcSl8dN0oQQJUPRgrlL2dpmTbG/5cSDKBg4G6Y=;
        b=CsvjvKI1AeyNcoH9o8vfFkZNfQMpWNqwLcL6lHpbiqbVoijix8gQzyfk4YJ6xHBH4C
         En8yTOGqdYIa4ACMxjz1T/Ip7hrBF7bTem9Dq4JMSCxYv6RZ9ruAehB0RwOedxhJqnDD
         T31l5yxmcP9SnkJJ8mg4nHcVsDTrrOft8LT8Uvf1GFiy48FYwfSivnXW/bD9FC86dfJ8
         8H7LuLiqsmcJKWLn9vfAVplpc+2E9NxJ7EZhux5GpLkHLQMI7D/wSEHGh1zRek4LS3n9
         UkY78pf0AISEEnEzujnP9LK1PPU24x7YGRwCfV2pXmTKpjTHRN5RIT19GJYJIIIA1vqw
         MnQw==
X-Forwarded-Encrypted: i=1; AKwUvBxapzsx9B3asQRKT6wLneZY/dYfRY+TFT7f0QvLM1u6azoB9/oSlv3bjp2rp9QagwdAN+w+9HYkhQnH/pI=@vger.kernel.org
X-Gm-Message-State: AFuF++kT8Zp/PG2ugY7HSKX4SK7ExddDH6GtV7o/4UZf2EDPeGvQBdcK
	IZ6VFSjuGa2kex7lY87Wip9unLAb3KEi2Mi1uZOT23eMZwjNxg+eUI08
X-Gm-Gg: AYBFou1a1Ov0Dfdoqa++FNil2OYkrw3lgp3otOkQxQFEw4mIHjI7YOYn/u6PbcZ9vam
	tT8HkpQH3qbTIo8aA94r5Cu4f/hsn8blteI7iOneK15/za30UCxQg3IS6bnsCZrwJ/tSAZcXZvB
	lTlAQkmywjz677yJBBy0/Ajp7YfRDDhdR0kkazUC13wrhFf6XVItcVXIaqxiV6GNpztO8YsklxJ
	N4f8cX9m3jUBMB1OT2d7pvG5xaM7dbNgkjlE66Qb0BwG0MnnOniBLkQ9HN/E3h/RrTNfX3KMlTG
	dyuUoyXzqvsRIVFj3gJWJB2086ZtgkQxwP4y2pKBl2Jiet+yCgpeqhVagV1bqz4FfclR6O338mw
	HeMzeTtrNA4BLXuVBFtUSIOTwAsJM5ytZeSAYPhj/+KIZebR8rqHX/kJB6AHwAdotWAWrbh6CwG
	0Ts+704c/HsabsAXNuzuupGPnv5/8tO8HdnSNYKmIyGvJDCfe9ve1ODfbgjYeiooDTe4li5LcHy
	86NJFOwYIJ9TdTFpy3qe5sQUszrmhRNK3WCKXQ1R2/TeOQdraNYJTjUpx6scDUcC1NtQpzmidW5
	W5P+cG4yULYH5x3qojEZlev9ZdK3JKvWbZnW073zJPH0MkAz
X-Received: by 2002:a17:90b:2dc3:b0:3a0:41ad:6b9b with SMTP id 98e67ed59e1d1-3a098a7d8a3mr5021151a91.34.1790357633221;
        Fri, 25 Sep 2026 10:33:53 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm651224a91.1.2026.09.25.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:33:52 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 0/2] ARM: vexpress: fix two device_node refcount leaks
Date: Sat, 26 Sep 2026 03:32:50 +1000
Message-ID: <20260925173252.933705-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Versatile Express SMP bring-up path leaks two device_node references
during boot:

  - vexpress_flags_set() (mach-versatile/v2m.c) leaks the
    "arm,vexpress-sysreg" node obtained via of_find_compatible_node().
  - vexpress_smp_dt_prepare_cpus() (mach-versatile/platsmp-vexpress.c)
    leaks the SCU node obtained via of_find_matching_node().

of_iomap() does not take ownership of the node, so each is a one-shot
refcount leak with no functional impact. They were introduced by
different commits, so they are split into one patch each.

The first leak was reported by static analysis (CodeQL); the second was
found while reviewing that report. The CodeQL query was synthesized
with LLM assistance, and the patches were drafted with LLM assistance;
I have reviewed them.

Compile-tested only (ARCH=arm multi_v7_defconfig, W=1); I have no
Versatile Express hardware.

Weigang He (2):
  ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
  ARM: vexpress: fix device_node refcount leak in
    vexpress_smp_dt_prepare_cpus()

 arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
 arch/arm/mach-versatile/v2m.c              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0

