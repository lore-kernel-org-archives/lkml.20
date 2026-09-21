Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85112F7EE6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004132; cv=none; b=MznAfyFNoRC1l4W9bqHjE/Ym3Zaze85mgxO5IknLs9Uh8fe/J0FFlib3AGzfkDIKS2HH69a/lM9rSmmdp6wEvvBFNzgCyKnGUjeQ3zSLeFvLwbxzHctPbOXk2n70OF5ICq29Y4cOz+53aci+olo9RxOiUZ6vLcGK9CeWLmKEK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004132; c=relaxed/simple;
	bh=aYD4nV9Wj797N5jj1Ny6OHeo10YNZu5Q6nXuUfYTHdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwnFoMlAGXWVZuBlKWMaVxLjVf7fE7a//KZo0MJJKiKzxjosKnpsmpwaujLGqpAFb5YMHpo8halZengQmEFuedUKxUFJj0ZX3MkynmJLQCLPi53Dd0Laz0mRurIQgJ4SwPMZ/dcOeoWc/vynnJjvomTotFEHx26J4ZubIE3avgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6xgDeQr; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6xgDeQr"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d37f94so1817110a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004130; x=1790608930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SI73avUfus8pqTPOHeH7viJKyMI8CsxokGnHNJh0Wgw=;
        b=C6xgDeQr80LhdaFW7J8j2h64gvFSzAZznJPVjnZqyyZeDh5rM14PdUKt/bJhqP6M8e
         Rt+PwfRQy1R/Y7EiR7LChiD2Yy4FeEfYKg2pXq13+UN9u7FHKNwxPOuCVTzTxkRA2nhc
         fAWzIaf77bewHSVy5U7clQtWjJgYeVhoQLOszBZGhJvHtyXF+zh9HAXuS512o3qjILoO
         FLjimCZgWCBSbt3XUlmP8jHTBnBKMEY79WfyQe4gJxGv58ZKDMwOlcXDFlUpNCkZKHF9
         91o5XpoR9M+4waECoA5/Ob29rlL8mlr9bH+mvl0d/Ww+JhjEC2mP1tmYEhQwNHrZJYJf
         7fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004130; x=1790608930;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI73avUfus8pqTPOHeH7viJKyMI8CsxokGnHNJh0Wgw=;
        b=hJmt4XAT1FSpLNVqFJhb5EcVqe4tcYQg99hN+x8y7FywjpnT/mBNF1oSFw8NJ0NtOX
         24fxzUZMt54zhwPswssyYvm+vagA1FKCcL5uEg+nFVnoUXYj9yxy3rA4x6S1l1MDGNC/
         wQkCUmhIOE0xHRoGVxZ6C+CDUM78zm3/yfkWFOj1kd+LqB4aAYYaD8/gyugZ2wVxWsNb
         haAwbFPzhV1rEO6bCcJUTg89TIOuiMk404551iYPGHZzs4tcWBjKlKhXtQo7Gd5mFwxA
         Qnrjf8LdRcEC9dlThSjMyMAICf4J+huFd4B37Ia+YDf16kAupfM4r2lj0KCqksJoYw5a
         rI7A==
X-Forwarded-Encrypted: i=1; AKwUvBw6yhZmf7cthmOhrsQchqxrv74LlZKCAD+sNVh8rYAomaKchejkcbQ5VSdXifPMPTaBAop5U9RSd7g06Jk=@vger.kernel.org
X-Gm-Message-State: AFuF++k3tHIHxki1UWMsnHA6ZkmwBz37ZJrLfirXcJFStiGTV3BakWux
	J7gzl+a3emf7YrF5LKQEl/o/OGwt8falffCn3VDGVqMTSCMyrLdnWpxf
X-Gm-Gg: AYBFou1jNxqA/wUWcKV7qLOaGVU4ff6iEYJa8vFuRINDdzAmRUQCfr/JlASk1ZAYWje
	I5eYk11EWEJu8WWFe4SNg4W50TeDs2GUj7df8WJ+bv+53azr9teDsIp8Q69fgRcJpZGXaGoYo+M
	qeUbiZBtHdKaQL6ac3fSu3Fcazfmq94EifzQHhkpLEOLTWFVbw/I0HWLmpriO6MsHzd0k4I23D8
	2jUiQHn7OokacJOCKv+Y2DPcI7XGnskoGFZ1z2ng+nbBzb5Tl12iGQE/IPJLRDVydpNNTvgOfqd
	5beNnhPuk3APdhRTgXYHT85Ub6b6iGv4wlbhhNDOEvBX5QgfC2W8dImXMgx9nIKYrhURkK3BKb1
	yG5EZjXWRtg8whWm0/2VEaMIEr3i8lA3ppn3pmaXjxby7lDl3Z2kaedHd+12wxOBlfVBS/Vcg07
	ixM07W8LmwiElwJOOHMZ/aBSQsZvJFNfZmb3LYxhkFizJZjFEVC2SE1oTNzUL++bs=
X-Received: by 2002:a05:6820:c8e:b0:6b7:46fc:1db with SMTP id 006d021491bc7-6ca9d5540e1mr9509282eaf.58.1790004129624;
        Mon, 21 Sep 2026 08:22:09 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d1476b906asm185690eaf.14.2026.09.21.08.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: konishi.ryusuke@gmail.com
Cc: dubeyko@comp.asu.ru,
	linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] nilfs2: fix checkpoint root lifetime on sysfs errors
Date: Mon, 21 Sep 2026 12:19:38 -0300
Message-ID: <20260921152144.3983736-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAKFNMonYVUbzjYm343Aw-=xjUk78x4EdUwGBfNRwE6zfmRVhvA@mail.gmail.com>
References: <CAKFNMonYVUbzjYm343Aw-=xjUk78x4EdUwGBfNRwE6zfmRVhvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In-Reply-To: <CAKFNMonYVUbzjYm343Aw-=xjUk78x4EdUwGBfNRwE6zfmRVhvA@mail.gmail.com>



Hi Ryusuke,

Completely agree — that is cleaner.  v4 (below) does exactly this:

  nilfs_sysfs_create_snapshot_group():
    error path does kobject_put() + wait_for_completion()
    
  nilfs_sysfs_delete_snapshot_group():
    kobject_put() + wait_for_completion()
    
So nilfs_find_or_create_root() and nilfs_put_root() just call the
helpers and kfree(); they never touch the completion directly.

v4 also keeps ns_cptree_lock as a spinlock and creates the sysfs
group before taking the lock, per your earlier message.

Aldo
