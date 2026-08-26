Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484DE4519AA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764216; cv=none; b=pqKgzGSaKsmdXL9J97LUeyMLQUh/TRUzwLkvg0hAsnfElcjcsWrD86yAtOoLENpIN7r7rxSUKhOy/KA8tyTB3C99TKY/nWx+b8xnumB1P95v9zBQZTxZtwiugplG7/g9rRhoMdxSQq3P0qR2HtorB6KX23DjCcALyfc1OszBIrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764216; c=relaxed/simple;
	bh=4qTy9EY05MYgzjfQZXb22+wxLg8mKbw/2dfRx0/rF4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8aKU9ATp7HhSZseko2ruRCNhrIFxeAAJ5m3CEKp5AI+ROKwPacSqPVIEBPZ+XRFQVGMON6wOCz2KLIiP78x4FW/6G3n11UXq3OvGnvM33UjqTndithMSpKUD1qHyN1gBieY5iB/05yua5xbRi8jmIpF+cJKiCe+ZnrIAfOIT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZUSQz5p; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZUSQz5p"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso13666105ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764204; x=1788369004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qTy9EY05MYgzjfQZXb22+wxLg8mKbw/2dfRx0/rF4c=;
        b=lZUSQz5pIWpCtPM/3VIWOv8pzCtq31uzfDWHHxdJ5F7eYyOuVz6uj9H5wEBTpDoaGo
         vLxmjM9muE/8CEdIHiEwcJMiCDfTrJCyms817o6toH9sVPMb7oyMbz1s1CD62ZIoe8t2
         xcwd5oZKECSSs+hhPunYro67kU6TjT+GgJ9VzMcWlPOR9JcXab2tw19TisGD3g5236GI
         RKqYicQhgwTpCn8r60qMY6fGI2jtACQUns5pTHz5U1LIEknG/FwICn0iXPN+i4WiaA5A
         x3voqkXYY2hhEtZ5ey4+9npz3J9ocVob/31/TGAW3ezoB9ZRazUUHq44HXl2tNpI5Z6P
         qKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764204; x=1788369004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qTy9EY05MYgzjfQZXb22+wxLg8mKbw/2dfRx0/rF4c=;
        b=itDfNzmUls7N2qsK101T8WW/7cZl/mXzQLWM9bC4NNI2kXrVB55OdXRTd6j9SmXYRx
         fSD9nLqEosoBF0LYa+rNg6nE9SgC5w2cVyomcIOyF/lqjIJV81MjlrXrlqiSyIdef7cb
         CKm8sPCyGyPJV/QfQCUKJAj4vDjOTWeb8xHKO+NqjaimMEuLP90sb0oNtztWnc5ZIW5k
         UeLEUbeJcwcnSTeUDzDlQMU+fX0+c25KrCaNAzEdduYF1q954xJnpgXLOVWQNGEwJL4I
         jLY43SZ2rP89YWHyl8e7S1Zi3vonEz/0l5P5v04+9vDcjHE3fQ50XertIgQsWxUJXl8Z
         yNhA==
X-Forwarded-Encrypted: i=1; AHgh+Rolov3X3m5AsVDxiMRQGSFFjGHLBAdOusJFEaHiQOTROB6+Sg2Vhac59dtWUVUVFLo3SVfAdCET7QYFTSs=@vger.kernel.org
X-Gm-Message-State: AFuF++l0pqzfkxRhOJZZJjwTSkQrFV+K+9Av382+aAIBRns6LbW53lx7
	eRo4sbDup/+xv1XGPxcWeLUK+4Mbi3yW5lX4wo6+71dmTOOReQHMgJWI
X-Gm-Gg: AR+sD13Mz05qwgaItlK1V89qfEaFNxsEGx0t8SdaFqXYpIPQuvn3A703RFtsEn5A5Nl
	TscvE0jk3f+9vCxcXBWhE6CrNVx0gxhFLIUISMGat1aMSLOWv50Sw5Xm1bQ1ZVmbUFeqWXEIH8X
	R7pDUckqsvxU7C/l74+AYezxAjN85L05n4XTT04QTzZmnSxWIGIZATGtlZzX1+Bo18RdsdcXOPD
	JhQHyAbnJs44u14OvvDhY9ahO16jXsQNEqXst7AuggZ20Fu7AS9SAozK0tkd5YPZ6eFBwNzflIb
	rhjWcc6KSZhhXtvIfzx39W+8Xp549vl2pyWALDJ1BJRnefW2ROs7L/LdHMAcH3XNjMu0XVGFrMV
	x38K0DmOOMVXvyHmTqM36ehPMjcpp6hnlpxPFIefJCADetlVXPs8JyuEVW2+yuXLVMy+Yu6cZTG
	yTYQ1FOkSVpTjG4L5W+g+ADjWoIvjOTDyB0fhq9YNiP9AE0oyz8eiqNQFDZJM9JSHoClH6OCcAh
	+chFCvcPKzdg8M7kNxpPvsx
X-Received: by 2002:a17:90a:dfd0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3966ce1df3fmr18948253a91.0.1787764204456;
        Wed, 26 Aug 2026 10:10:04 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d989cesm8866449a91.16.2026.08.26.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:10:03 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: daehojeong@google.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH 0/2] f2fs: fix device alias state across remount
Date: Thu, 27 Aug 2026 01:09:54 +0800
Message-ID: <20260826170954.3878638-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_xpF2fBnJwXPATANo5bK0UWUEx2uNKpy2RCfZRzhOphoA@mail.gmail.com>
References: <CACOAw_xpF2fBnJwXPATANo5bK0UWUEx2uNKpy2RCfZRzhOphoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daeho,

The f2fs-tools companion patch was sent separately. It populates
dev_alias_ino[] when mkfs assigns the alias inodes, before calculating
the superblock checksum, so a filesystem created with the updated tools
has the mapping on its first mount.

Current mkfs.f2fs accepts an arbitrary slash-free alias_filename.
Enforcing basename equality will prevent new custom aliases, but it does
not handle existing filesystems: after release and remount, reserve
cannot identify a custom-named alias, and has_alias is not restored for
pinned allocation.

The added superblock commit is needed only when the mapping is first
recorded, and the release ioctl already ends with a synchronous
checkpoint.

Should existing filesystems created with custom alias filenames remain
supported? If so, a tools-only restriction does not seem sufficient.

Thanks,
Wenjie
