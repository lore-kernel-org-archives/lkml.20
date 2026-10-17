Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE937473A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202168; cv=none; b=p9UmjjLlw3qt0pSMbm0Burq4iptTzppZ6xPQBXCwNIbOMxown4T/It5lFkrl7QWRw7ZOVjIXd0T2sdUnWCJvH8IocQNz9aqdxkq1b1VQUe9bNcn9WLkkxOB6rrFcKok9A3YzOxYQVF1Bi1gqvtk9QIRMLiSEN1+wu1KQtDbznUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202168; c=relaxed/simple;
	bh=Fe8zxGQq/7dCid2W89W5GWhcTNqPOSQenj/BB/O4q7E=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YghOGK5dg/Rged8i6fnwPT9nfAY4ZfXGBAOOxHQ4qRenCYH/raa7rZeQqLCWmVZbs2ZVv/heES+NUMViFxPCDlIHvsguzzckdYqE+h3QdUH28t36lgMoUPTsT+seu5u8SqgjNeFyRcM/e9wdJt314hP0d82t1JJ7rUV5kuFND2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njj0NpxP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njj0NpxP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e49fbf92aaso2360075ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202166; x=1792806966; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:date:subject:cc:to:from:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe8zxGQq/7dCid2W89W5GWhcTNqPOSQenj/BB/O4q7E=;
        b=njj0NpxP7PMMY9QiiCHu2ZMK5ZNDmcqLnqXiLZCzhA26eiXXHdA0CikuUD+zuPTfNw
         phtEfb42sCyThPfhrO6X5q6PkzLVvJjplFoZcMaGNqv8hPNvY/AJs7ZvwOLxNKh/IBsh
         gAzjDTJVHVj/FWyo6gbPWWDf48MecKc9682oSwdSyReHfgXgVbzhHMa1kcoV97p2lKZV
         FeKdHc+Mv1hp9GOWMLtc17PvFkpTKVdPXnmg5tSM/f/wfm/VQw5ZwV2WlfzXpMC0R+re
         TDpPD2mOEzyg81PHtX9pDJ5IcMFC7XM3gWYYsC5w8m8MWjpsNv/yXxbZ18+4oywd5MGG
         10dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202166; x=1792806966;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:date:subject:cc:to:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe8zxGQq/7dCid2W89W5GWhcTNqPOSQenj/BB/O4q7E=;
        b=yjNXzniUJ6EWc1lSjKGU9tcbeRJSrV92HCEEBL8GNLMJJR8TTgUIMwkQvXMUGLvxjM
         SqM1xXWOGUiXup/3WoramrWXSIbSJaNCK3QHz7af1IGVOcIDTxU+KLFgYDuUzGNnnKUF
         3H9CTH9r9OScNII45IBpYy0CSEWwKK/IHS3/CdiVtBjpTsxehfatE334MQRW53U/U1p6
         kCC0BxADeLbMXASJu0j9lsaoNnFt1RF004kkKeR7hTPW2jF99l4BjBFl61b/6NEk7Zws
         +siz0tgqsfSEXodFoIoNcyoZ/SP1kRhWDaQo9mL5k8WdregG3tr/8QeMHE9v6Jkwlt54
         vzZw==
X-Forwarded-Encrypted: i=1; AKwUvBzCiGNKdzQww6YNlzV8QClUkE7p4yiiQiFh/n39Ybd2pIO+BeCuByNlQR4VqdmBi9E8XiCGhqkJCL6T6CM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5AcDiufoE+UPfF8gExQcljW/IM+vjZuhDXX8bkajz3TCWyvJg
	huQL/eQQDe+FlQcFnbtnVLkmADCz7KnmID68rMDgZ3hORYN0o6WfJIhb8N/BviKK1H4=
X-Gm-Gg: AYBFou1nlYv7/hWSeR5gLTPc78mq2O942f8LJxu6ZDK9jw/+oOdtQwBJYBdFzLPltfY
	z3oQ4XkALEV/xXmsJb0Kb86BOiffuDi9cFbr75HrCyV88WeWk4BwC7Uzpx5FYHm2MFYT+UHUXBJ
	OG7Q+NgwlRkG7hqCBE9p0UAqAaXRjpjZ33camQXiXNJMZJNyDIDdh9tcDbQ4dO5LVM7ENB6b3wJ
	AzMTYtjWvTI4mjalTGpLb2wKlyx/sLfMDhTswLR0vW8SXwSFvJ8xT1JWqGmnEqc/XV/ro2FDXnZ
	P1ocVSfZdQenMy9WmxZZB+gRNRGk+3r1t2xH0uXb5pcVePzYktK711VMsFhCrLRyILIgqxWBMiX
	uIwaLasKlnO8OpNhXLx/OqKsej7H3Jvzu0L0ZexwCR4++lNIR2i2h4zPH2z4k7vylNOmrvHg82/
	612W0ioNKA7vvhIWnKvnmJkf5RP/0aX0ZAz+LxRKBESS/GYNVfrZgcDMFGI7W2OrjjA4vL9l6xT
	QqsEF21FodmKLp4Uq6RLA==
X-Received: by 2002:a17:90a:c110:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3aceeeabd7dmr1165560a91.34.1792202165738;
        Fri, 16 Oct 2026 18:56:05 -0700 (PDT)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm11245327a91.12.2026.10.16.18.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:05 -0700 (PDT)
Message-ID: <6ad2d5b5.969afe5a.ee04c.f286@mx.google.com>
From: Zheng Shuhao <viennaoffh@gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+e7f24354da9f7915bc54@syzkaller.appspotmail.com
Subject: Re: [PATCH] xfs: fix slab-use-after-free in xrep_newbt_free()
Date: Sat, 17 Oct 2026 09:56:00 +0800
In-Reply-To: <20261016152359.GA107986@frogsfrogsfrogs>
References: <20261016085536.591-1-viennaoffh@gmail.com>
 <20261016152359.GA107986@frogsfrogsfrogs>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Darrick,

Thanks. Re: "What if some other thread initiates the shutdown?"

That is what I tested. The paused autoreap dfps are freed by the failed
xrep_defer_finish() in the repair thread, no matter which thread sets the
shutdown. xfs_defer_finish_noroll()'s out_shutdown path forces the
shutdown before xfs_defer_cancel_list(), which frees every
xfs_defer_pending on the scrub transaction, including the paused autoreap
EFIs. resv->autoreap.dfp is dangling by the time junkit runs.

If the shutdown is already set before repair starts, the dfps may still be
alive, but unpausing them is a no-op: deferred work cannot progress on a
dead log, and scrub teardown cancels the transaction and frees the dfps.
Any EFI that reached the log is replayed at mount, which is exactly the
intended autoreap behavior for a repair that never committed its new
btree.

The guard cannot miss the dangling case, because the cancel that frees the
dfps happens after the shutdown is forced.

Testing: helper threads issue XFS_IOC_GOINGDOWN (LOGFLUSH and NOLOGFLUSH)
after the xfs_defer_item_pause trace event -- 1 to 8 threads, 0-100 ms
delays -- while the main thread force-rebuilds a bmap btree. Unpatched:
KASAN UAF every time in xrep_newbt_free() -> xfs_defer_item_unpause().
Patched: no splats, scrub returns -EIO; after remount the log replays,
free block count is unchanged, data reads back intact, xfs_repair -n is
clean. Healthy forced rebuilds still do the normal pause/unpause.

Thanks,
Zheng Shuhao
