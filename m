Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135D55D888
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959897; cv=none; b=dpuiAcqej1e5p+wiBuqPGv7heTRO2ZixXRlgokN5OcKBSmpQryNqqtY02lSJXSBzFuWs/esD0M/6BOUHdOhVU052p3+oUdqNFF0TbIL1kWeJS4uI/MQIqJ27MZOZ4R/g4Ts2LODqUS5Xsj8phVAnliO+Yy6mL9DZgjf7AzTr6AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959897; c=relaxed/simple;
	bh=HvghOuLjdGckWUGg22tsk2EsT2+V1tsYrjUZGr3klh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HtVaFvbFniRyqQJQowAtKrs91lGjydKZb7LeqWHGA17BZkHR2Z7oNLrQPc7kb+7oIrgmH6LbdJKoWJDQ/VMV5TS2MjsLll2ZkSHAmVBtzuLcYbjLZanmPt8iK4xLiT7unm35bMRe4I/zK/aiT/QYlHnCo5rFkoI4dfTUkwAVXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hr3GPx/9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hr3GPx/9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so45922635e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959891; x=1789564691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvghOuLjdGckWUGg22tsk2EsT2+V1tsYrjUZGr3klh0=;
        b=hr3GPx/9tzRbEhZZcsuAP1wV6bM8I5ENOgbaFAmYudeicv1ASJxux+fJSgxbN7cPYH
         7zqSFX+4Mqy7VzWQHOwkVcruCO33WyppElCCx+FwdUvxTI07NVbcCAU1ldjkyLZtCD2U
         8F1ACmh163pyl/nmENzi1jhKyvhCNUgy0fJtZgo4tII4pq8WPHnsYeQeBNx5+HwQUKx4
         oSQFQseA/m0YdiWTjygaz9GgN0sp+XHa7GmngDgHZOuV3oV0qCabKux24xR0omnVph23
         6tF23argZ/q+Y5YvVFa5VvPKu2kLgtlnr5Wq++bXYoRVM52IjjLmUEPT8PvLvwrHh0of
         9IeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959891; x=1789564691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvghOuLjdGckWUGg22tsk2EsT2+V1tsYrjUZGr3klh0=;
        b=oA8RVwm/4M5scDWxY48/SjzzBBU7c/QPGrd5LShE55jgO+9pjH3rKaCdQD/eRjA8yZ
         3msyfmN0Uc32eauHDXYnpU98aCU2cKNtOe/3LEaPUDJLe4Cwj9x7T6aynqIrNLyiyO6E
         DSgsOoXwDBMzoNRp2MF1F6DSPnOP9yeaNvnBhFPVOpfH2PUjI9dTPyEOdAohN4ck1rhw
         F7O/WBZKPCrJjCILo1edmoY91em/jjFKZB9TDrv6gAIKJyW/a7l5N4MruiLmNip6wjLv
         kNPehvds2My+FiTqE1u29fbLzn73v0xevgGoraFCXZ0NKsNqJkxfC2nqbp7FWf3fbTdL
         w5BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaayKXlh9H6kG2357YeS0DipQ30exEhDTFoFjjYWGTZIaagwRGDBoX/XhM1/QIofbNodXgzh/hiWkpOpg=@vger.kernel.org
X-Gm-Message-State: AFuF++lKeoTwCWiMINY8I7YglFJhjb8pOS58XWWMHmE4x49dVAgFwd6e
	+9vK39Gj1hkZ4pJVqqxg8d6KyoF5RN9loIqIm9embp6+Ba1Agul0R7sD
X-Gm-Gg: AYBFou2LVpxTMrn2HmVEMCYrgTvgZ1TICp0tlJUJPjvkEZif7HwhuLUjJ/m/ybZfbvb
	w2OFgAEhf9mgZ5oHKRulXkQrudDcnXKIammhSEgQoB3bOSbcmM00ZR/L0fTPtdzSp1MwRPgiCAq
	WHjI4fMhtS+wAVHsPyOV3iATAw598nsnCEvyKRpD3T6lioBi+P7sd0qHTDuXYVnz8t1WDrEIdbl
	7pVD4Q1UQzVr8uF669rwOQmUoj9o1cjHDuehgpd2PngLqB65hLo52OLBoWy3UY3BIKzkbgvvTK5
	K0Z8LjesXeBmCTgNuHpwT8f40/+J0FXhqus2yOl+SW9biC7d6F/3UvBsqqqSdzM8dmbljzaSsa2
	X5EgByoroqCPUA7f54D9/mBgrRueEykc/KRgnZ1wTYciUJss9DSTQvfR7j2lO69hYvd/Vj33Ppc
	8JT2CrqdKGFIz40VtTy7SiWzj15l7dekQqavrSzK41kQ5WxDMlpLBli0H7k6zOb6LKMPf5wVKBw
	qS247XpJd98
X-Received: by 2002:a05:600c:c173:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49cf82a514cmr371518115e9.16.1788959891201;
        Wed, 09 Sep 2026 06:18:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1568:cb00:7389:2b93:7e4e:44c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm555457755e9.15.2026.09.09.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:18:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@mailbox.org,
	malhyuk97@gmail.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: Fix dma_fence use after free regression
Date: Wed,  9 Sep 2026 15:14:22 +0200
Message-ID: <20260909131808.2201-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

as discussed in a separate thread Jonghyuk Kim(MalHyuk) stumbled over an
use after free which we through should have already been fixed last
year.

Turned out that a recent patch regressed that by limiting the check to
the ops pointer instead of checking both ops and signaling status of a
dma_fence.

Fix this and also add a few lines of comments to drm_sched_fini() to
document the necessity of an RCU barriere after signaling the last
drm_sched_fence object.

Please review and comment,
Christian.

