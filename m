Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7311148C3F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350358; cv=none; b=c6e5gKSwXzRYvTlatuXUVgavwoJGqirVUm9WkVeHX2tHzuklwNGLs2YQCtDHqBI4to0zYZtzRYSi1KJcN2WMQ4eJuovVbXvve+7+dnCOnRrHFaS2u85+CMxq06kkeL+eS6rtbSq8bRGrwyY2eR/ae8DMe0nN5+bggRsS7+LVxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350358; c=relaxed/simple;
	bh=N9Uqqu0Z1UXFtBUBBaKIE4GiXAYYaa7Xz4qEikGC5Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuxuWQHz01xLxRDKMs9t2KrSscviZ/4CwQGucsIGbWuJRWWU4nniy37U90s1ywiNYxS1SmDrlUhoE3SrDEi+d1hyoL5lP14pCnBXTo6PrXtolrBuOf9RzMk5wd5epgf9tvT31utht2g8yfnU8OeMnL+53AZWW18ytw30pONgHzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxcoMtYR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxcoMtYR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485b358552so773148b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350343; x=1788955143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71/4J9V63EhpSKyZ0UJW2JBEz42BoicMEjCAA+zLsxg=;
        b=BxcoMtYRkqImmWBPcE0cjLWnjGODKWpv0LRPdBnADxQvmAx/a9tnuEsZelG4UnDcYC
         1jmglSL+AVh1U4uagdZ8m7hdTbKpnDI2CiRiCjYD5WafXBDn8t0tFDfOz+ZB/ht/ONjD
         wGNkc1NxI+r6sx+QiL6RYH5OUNFJ4A3xjX42Au9fkGkTQkCZtwBbAPLKKnXYVWUZt5Ir
         0DthzPvBKMEypvue+eWMi4gtYvhhA/BOSg+weh4m3g7n0ORFXeKtbV/I1KI4E/xudPbx
         93aKgzWgL0a83eYd+bSzcPHUZnNfPQ6c0dTn7CIPMb2lBjzsG5yW99oVqJhFDW+1HMg6
         3DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350343; x=1788955143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71/4J9V63EhpSKyZ0UJW2JBEz42BoicMEjCAA+zLsxg=;
        b=iiTy1Zc0Wfm1hdr0DvQDKIpXix31w1lXIB+E3VtEK7gSIJ9PHDO6+Qi6Ozhv99vkHy
         dqV8f5NTuVm9KAVOFLt+EbK2c8DiM7Y5j8PqXonT7bn+NgNQlmgvwmRTYpRDhlB7+DLA
         sbMEgebJHoWlMwlcl3NgVEnvFOhgD79O9O/LbDuaAuSx/CTbvERPS52ywlYKAEG9/ogQ
         KiS+36eAQP+9qzvty+Qz5fntemQiJMCyD8TkDKYm63Ktk9oOuBx4mdB2GjnnmOoqipTR
         hKWbFqMTDzBRzo6VSaj7ZsOTq5fR6gQeU7knPMdDJdvDpD/GpCaubV51b8lcdH67Ot/0
         Prgg==
X-Forwarded-Encrypted: i=1; AHgh+RoVerG8HCxfZhoij5dKURGIGYB0W06ajB7Bjy08OTAx9I4K1fhR0zf7g39ArY73QSO9r9QyNO8+v83TCyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++noRUEJPn+U/3CWFivY+toIjmvtrAWCj7yNMEpoqhat8Qqrb/fY
	cI4r3DH7Jci4mDgoHCO0Mh/3hbfNz5MGinIR9xxPC3LLR4xZP90rk1vE
X-Gm-Gg: AR+sD11m7ZE+HR3zpo35jKOXBhg+ynZ5kWAEgMf7Pg5Oik76bDARravH5n4uXSLaL2p
	frOv/doCvoNEteABlT2h3hJmBhI8Rezn+HcI7YheXVJ6nbUYfPlgOa4clEYiizwo6BqX9divdlq
	+W8Izr3PyFZCU9H6BZUK3YSbsWrHVz6GbfVbxjPre+rnzGyptVUk9Tol02EzMxnNw04X3xcNV6u
	p9Vp/jObcCld4ek3vrIWQcYfiomJUa7JtWx7IC87yZnxS6+iiQisxI/VNrEpR/MNn2DX9Pk5+c+
	6eAkoNutCOI7HlY0TfmLegrN6PS3jYDZick5Mh8LcRsOrN/1WR35yAHcdSjNJjRrkGJX+CeSv7a
	BnVQgngD8ZpWrquzpVt88P96Dcq7VG8C/8D+fZ2b3YWSWL2uzRI7T76BFktRvyMEAcoowCueqN3
	rKFm9QEmlHKLtGDUZY212FpdIu/mSoK/U8jGStQAVBPEKC7NO7/g7mLZf9Z74FWxUlZd8NYVgWP
	iXSum4hF7ivXjblHu4YVCWJ
X-Received: by 2002:a05:6a21:4613:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3d9af9ff7a9mr7306617637.13.1788350342526;
        Wed, 02 Sep 2026 04:59:02 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc355c934a3sm914372a12.29.2026.09.02.04.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:59:01 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	qwjhust@gmail.com,
	qiwenjie@xiaomi.com,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v5 09/12] f2fs: cache: use compress cache
Date: Wed,  2 Sep 2026 19:58:56 +0800
Message-ID: <20260902115856.692764-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831092227.739737-10-chao@kernel.org>
References: <20260831092227.739737-1-chao@kernel.org> <20260831092227.739737-10-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chao,

> entry = f2fs_insert_cache(cache, index, new);
> found:
> if (lock) {
> 	f2fs_lock_cache(entry);
> }

and the compressed-cache caller initializes the identity afterwards:

> entry = f2fs_grab_cache(COMPRESS_CACHE(sbi), blkaddr,
> 				F2FS_CACHE_LOCK_CREATE);
> if (IS_ERR(entry))
> 	return;
>
> entry->ino = ino;

while inode invalidation reads:

> if (entry->ino != ino)
> 	continue;

A new entry is inserted before `f2fs_grab_cache()` acquires its entry lock.
Its `ino` is still zero until the compressed-cache caller initializes it.
The gang lookup pins the entry but does not lock it, and invalidation compares
`entry->ino` before `f2fs_truncate_cache()` takes the entry lock.
