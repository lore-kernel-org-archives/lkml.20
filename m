Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9613EB0E4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781564; cv=none; b=Zdu/pWPWLB6wFrYaCpa+3V5KBc9VabSo2lbPYTtsE+DFZ0KTLP5O7yeCva6aaDRiPBQYLp55MYnFe8+gfSyiOZPXC9ULhYL6uY2szZQY75icAsqiA21OqenG7ecNiqzL3XGOdvl0ENwrXqsTl11UsiDO5i5QfQD7tGfEgLdTb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781564; c=relaxed/simple;
	bh=hSaXnB4SJwu6iwBOmgQqS2PyTjgCq6JqLDuo0OaEhp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMMJlNuT3azb6DJpUJ7tY5AX6VF6sm3ktAh7T8Mk9ZuU74qHHpVZ2C+yZ4auXcmdpqONl89gaDhjGgY69+DhvFBGxPk73Nh2e+61PNckvxIDZ29ZVVd8t2DtUzPRYala3ZrfQwNnDWKUcrMzEEyiC174YYYwrLzQDB0tvCtUf7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFf141h3; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFf141h3"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so12388095ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781562; x=1789386362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSaXnB4SJwu6iwBOmgQqS2PyTjgCq6JqLDuo0OaEhp8=;
        b=BFf141h3WJEy04g1/ItEybqxPPsStGiFx0NUgFrDl1Jybv9l7+eyGQOnfNvxOlvVjm
         Jfh448xoxFQ1+Pz0Tw4MCfg4W6U+8Fpedq15WW0GzLABzkANZ5Oi7dJD4oro8+EpJe0W
         PgaLLro5zNz3/A3voOSBxaK+6iPjZ4BYtk0yxJiRK/u4/R/Cwla7+lhImkO9IbL+HFPO
         q0LAXiADLYRLqHHCne9SSTQ522rfLrzB7QNt0pTK+QOOw7ExnWl7BPQz/26ZxohscTb0
         tua0aizwNVOG4s8lEsv7qfK9MlloiQ7x9cKULTCgyxVM7Aj+9VNKjzQR8Hr4/rjCceAH
         Iolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781562; x=1789386362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSaXnB4SJwu6iwBOmgQqS2PyTjgCq6JqLDuo0OaEhp8=;
        b=ZFIEkIvt/dzznYng0awNYSfyNXAg2eFU6gBLWtPfra/fY5cNFdYjDms/bB70UHWXl9
         gmVQutcWUc95OxlaTlmUSxFvopq3nM95YbxAZdYj63YUaZnVzeYw3YiRdreKiZP2QxeF
         ayaHsuwJqRT6HHGWxqwTxxequ2xzwulFvh8ucfws8lAMQLfkuA7Ix/ee+d+qIHwcqwW6
         hotEB4YfwLCDZy49wc40OeWl0NYxMY4fZRMHqtdCaMvpXhkQrV+LMUx4tm5OYKdmCS+K
         mDuvgiGIDkneXmaF9XwY7ZQ0XUSmLHMMqILFqwoAQCTCy0utR4Arw5eUAHPHfZ5EVdPO
         mHbw==
X-Forwarded-Encrypted: i=1; AKwUvBxlVpQmPM9jM1ExEbS0rTu1R2HkqEx0jylSGAAKUcQ0CrEsBdQiyHwnjl1ghhUqzF/0x2dxbWSuQVlwEZc=@vger.kernel.org
X-Gm-Message-State: AFuF++lra/BInB7dd/UQpoo9AqaowbyftWIDdJBFDFAf5/zLhUAPEGAB
	gj1W6tlvmv8RbYc8XiYWdPk3AjTUdES2ZYmMAnaYlpPexiS/vEek/inX
X-Gm-Gg: AYBFou3xclcDFRAsitI1ofesXkdoyHQ28cypxwa5VdtFoAonKZVSFdkoOMRTNwMnFEX
	9P2ckgSfDfeIOPQYvcjQ098PGffkFL/SaJ3xIvimgLWvH9A3M7ZIjSVM2q7gyFkCGm4hFPBR2dE
	cn6QsDHu50LYdTnm0HAsnB9LdrEyEfDB4lIHaujV9kgHC5j5wXV1JtjHQ/u9hGJVkw1h7ps0dCf
	lAm/WUy7KsA9b+a1sImWWfnC1nMyeygo4ZQNGCm0UX9dExvyUFaQkCUTdsMlz2ChANgApXeebxN
	P9u7oLqBbalAsYxA2vFW7eZNm+4I+iKP04RBzhGWjnGlcxg8irViPw9dVG6H0MnMitDCswJZUcL
	KML9w7bkgj2cWoSJr/vB8HFS98UAm+xgr7BGYlk2nADadMS9axa3HTFtQ6Lw4Ed49RsEOIm08+v
	fpBiu7D7Z7+u99ar/hRGdWhUjOnRR5FoDxTKfBQCZ46IXzCRHTb2cn+LQIhw6WXXBYnHwxDuDM2
	G5DND1eD2cwzOrVHCz9+YlwAw==
X-Received: by 2002:a17:903:94e:b0:2db:4bae:1ece with SMTP id d9443c01a7336-2db4bae2044mr100806565ad.3.1788781562396;
        Mon, 07 Sep 2026 04:46:02 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm44065975ad.12.2026.09.07.04.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:46:01 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 07/14] f2fs: make GC migration large-folio aware
Date: Mon,  7 Sep 2026 19:45:53 +0800
Message-ID: <20260907114553.2551964-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_yO+CyS=xBDA1iRTfjZtm_40wLGwD6TZQLRN2nFmuw7xQ@mail.gmail.com>
References: <CACOAw_yO+CyS=xBDA1iRTfjZtm_40wLGwD6TZQLRN2nFmuw7xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 10:20:40 -0700, Daeho Jeong wrote:
> Under Patch 08, a cleanly read large folio may NOT have
> f2fs_folio_state allocated
> (folio->private == NULL), right?
>
> When foreground/background GC tries to migrate a 4KB block in such a folio,
> `ffs` is NULL, and `atomic_inc(&ffs->write_pages_pending)` will instantly crash
> with a NULL pointer dereference!
>
> Fix: Call `ffs = f2fs_ffs_find_or_alloc(folio);` before accessing `ffs`.

In move_data_page(), the folio is obtained via
f2fs_get_read_data_folio() / f2fs_get_lock_data_folio(), where
f2fs_folio_state is allocated unconditionally for large folios. So
there shouldn't be a NULL pointer dereference here, right?

Thanks,
Nanzhe
