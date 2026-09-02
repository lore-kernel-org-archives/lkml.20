Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5064B472F93
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350221; cv=none; b=taVoXJQASPO6dK3sK6srNp4AtsGBhuuCGpfnjnSQ37wQEzAyxv2my+hXxiFg5t8B75dsNqQUhR22SH91VROe4p19P112LJDafAJqc0OOsgaZGinosVOmuvVWsUIWdRljFTQqegQEB6kSQ4OnGlgeIybjm5O538Fvi3eT1iQLy/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350221; c=relaxed/simple;
	bh=VgHUOEaDALwW9c/wDKe2hnLxdjFxCJOoX2Nr/VCyVE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d92gg6wNhcw8ylUwY2A+OImDHGDVKDJ0BpjrrbUT0bQUdLHccyRapkHTTsMNWQABI+pIFcn0oGM9XplLfP0dCeTTL2nBFOeNSsZEC4Lo27A+/ig7FK7DcAPX/MNiI6o/Z5SYorQxDBOBAxucty2rTf1DbUA1hdGUJueFM5hgYNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbEwNy66; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbEwNy66"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d8f265cbe6so8765815ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350207; x=1788955007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNEuPqEuWyvOeNnRKiDgQZ4g2yOI3cJx1FKCZezy4uc=;
        b=sbEwNy66SFsocNt7tpuSp6+2S7aevXVrFEkwjQk8anDGwf/qRVElYgZx0Flb2vheJ5
         7D52OtKuenolQDs7gZw9zisWbTECQ8rHqRo+JPE69X8/DIZ8TlOVgYuJvrCLKrNscdTq
         cPAAoL9hpHFRKTgWBhyI1laaeKmg321KndDipWC6wBoA+WRA4qndkJWHMHwJiMAvAdIX
         dR9j1LSsJrMefIre3O9BIKlq1zeA8XFOZXB2kRgWdu8VTVVlhTAyaJL0n29udhNyHYu8
         +vuvkT0pvmE5MeF+KV0ZFH3FMkk35oZIiCdxJQ86nrU2jFyqMLj9sG58VE3uucIrz06k
         7iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350207; x=1788955007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNEuPqEuWyvOeNnRKiDgQZ4g2yOI3cJx1FKCZezy4uc=;
        b=cDdbsiT4PjGc4TkNyrEBExKglzXxWH1K81TwimrGqHqNaCThM8CM6XWqu8C9dZftPE
         TPj+UCxV7LrMzs+QT5Ns0F6lClC773GBzRPEOlr1utsaQnpoz2uM+QVhj9UiT7jAvakp
         4dxmIPtTAe+CfNP5zfl0pbWUUSfV4iX7YkkJxh0MH03mqaUOSkt/5lCIav/dMXUzzZPK
         +RFWimmRP4j+truJFI8TK3N3wf22C88EYMUsjQF8De7ghwrJ6rx3a8D5wxJPSpzSubbp
         EWx85r7rN4685wD3wT5K9jw+PTORHdQmQs0SJ64VuFzFqhzrvNqzgh8B7I8h/H1qVMxt
         28rA==
X-Forwarded-Encrypted: i=1; AKwUvByrhhSVWLwhy3S10EWjHwlDNQypzUppQy9ocRWr1lruM4neECiQL8ZbZ2wXnT205sB+KbIs5Fp/ZU+LMxE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9QRTSzNleec1T9Klgp9L7zyub3YRyfnKIDcIh0Lkh2zlI+Xsn
	ns1HSUSAkoIFKJ4rXtswmstL+WHTGnZ6vmmMAbSikK2RGiIV8eBr74so
X-Gm-Gg: AYBFou2nSfOB7UiHg1YnZxJjVNnJO43NRcyswXsECRUjg5N2h3PbOW2MlOte3/AMPHR
	+vw79+txwih6gyo65ksisUN+YrF9Vsrzp46/deYceIY7zG6Jf+LP4J8gYbRCRJIVKSROS1UdGRB
	1MprFCLuPliDMLNGed+wVXp6IYOO6wY4r81OY/K1n4+KdN3q6THPB6pjFVVBHZoYjLTx1IdlnXd
	0AqHn4rIKSrs3tWhxNJDJxsW71udyTHy2F26Gvck/eXhJgObgnqBtnn1pWXLccYj4sMyKP75yXs
	cn0xrIJZLz9tX0RwQNrdnanAfzXQaVehH4rgtnhltINGYIaRV5Va2tgUBr7L6ymzCp90BdkZ0LY
	bIH/PWWQ2qdO/64jIXS8PtWH5GgJuUR7YUBdkxmj+lnu2zwifHgCgDee8SSIySllTxOOUzYiYpp
	DPKszmKg5Vb3sfyA/SA2Y4jhzTeppufxpCBKqvnZpQktiEYplbzaHH/+RA7+tKrOAzFMZd1WvCn
	DtXTDiNEHqJu2PaEGQqoeLl
X-Received: by 2002:a17:903:19ec:b0:2d6:e4ff:9cad with SMTP id d9443c01a7336-2daec5ab9c5mr67402435ad.3.1788350206638;
        Wed, 02 Sep 2026 04:56:46 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488af8sm11847865ad.44.2026.09.02.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:56:45 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	qwjhust@gmail.com,
	qiwenjie@xiaomi.com,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v5 04/12] f2fs: cache: introduce writeback thread
Date: Wed,  2 Sep 2026 19:56:36 +0800
Message-ID: <20260902115636.691796-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831092227.739737-5-chao@kernel.org>
References: <20260831092227.739737-1-chao@kernel.org> <20260831092227.739737-5-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Chao,

> static int f2fs_cache_writeback_kthread(void *data)
> {
> 	unsigned int interval = cache_thread->cache_wb_interval;
> }

and startup initializes the field after `kthread_run()`:

> task = kthread_run(f2fs_cache_writeback_kthread, sbi, "%s", name);
> if (IS_ERR(task))
> 	return PTR_ERR(task);
>
> cache_thread->cache_wb_task = task;
> cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;

`kthread_run()` wakes the new thread before returning, while
`cache_wb_interval` is initially zero.  The worker copies the field only
once, and the sysfs store later updates the field rather than the local
`interval`.

Can the worker observe zero at startup, and can a later
`cache_wb_interval` write change the interval used by that worker?
