Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338647F786
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350289; cv=none; b=l8TiO0w24ZeUOOY+29JC1BJmvInQBRqMIFC42ZB2VMv+LErVvOjVBdQ6oMaphf7tHdy0e7EolWeXdSesi4RBDvTDRXEh1c1GIu8/q/GfZXTNU6dtp0rMkkpHwCMMQlT5APR4cKLEpkItCaZayeoG9XTmUxsTnNsn+mrF1ELIop4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350289; c=relaxed/simple;
	bh=tO0y75VMEYamnBaS6PAke3LTTxdn7g0wBN/VKE9BEPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNGPZZMoIdmqRjJbBKERmfcZ7Yxdpnpt1SADmwRn4RqRR20siV4y0sN33pSI+8fuJKl36BnShex8LPaRJZrkPETx3XKUdXZeDMQPqHYpWv9dxfLRT4xMb+VGqRGIAVuZGBpkGcIc4tjr10/EOFPaJgVv+mIa855YdCdRxvfWolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVbQDH6v; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVbQDH6v"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1680545a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350275; x=1788955075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZVF3OnSwA/qMIPyBbfYfBBIkjgQyRTS9OHeMu2tZqw=;
        b=FVbQDH6vQua1R7a1Eb5rNlvqJj2KtDJeucyGCU/dX/yJqtlcUodaw1uaZw8jPkpgDV
         X0wF2nCiJnk30EmIyD/w0HrDcviLQp1oo+rx8Vj9Z9q0M1xfWpiMEu8jClUTbqUsmDTr
         dlHx/zuMwFxqna3udjgjbUmt6oC/6jrjZ9Kly9ckdI6xCHPcgR2a7JqnHm7r5JJfCPPF
         ey0FOKFkv+XQ0OAa6eFstzoiYQbxkj8rRJzci6OZfQGuohM+rtZ23GHfVgVbHQjEC0ZI
         5j+5+lXOAyeDNCyRa7175NHdK4HAQA7KHlelZlgv0LibcAIXXJzZEWqf+GptYp6YscaZ
         ygHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350275; x=1788955075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZVF3OnSwA/qMIPyBbfYfBBIkjgQyRTS9OHeMu2tZqw=;
        b=nLd4BzcccakGMJZPHovbvLNkbUL2xdxmlJUTsRHtugPVpTb7yIPz9pqULgsJzhAMiE
         i0rqWZPyczjupsHQuamOql7aKmAOYtI4z6EcBaKM6vdCDy+mlLhKTH7LN3ok1w9WDVDe
         rlSmKimNlaEwgx+CQN0bDY2sTg31FZgMe3APEk6jWcmf9Po92TH3fvwy3435yRsEMlP7
         4bHSCdZWJe/YTq+jSeo4ZZVeVGrruxEAbT/HsqKID5HwIyUOHCbGjJNP8Nob2pSG7lqj
         /9iqeMklm/hICSZq6HH0D5y3WHOviZmpuakjHA/qLcsPiQI96IE1Yhyi9BJklsZHrddU
         1vew==
X-Forwarded-Encrypted: i=1; AKwUvBx3zoxpEvpyvyL0nSaxlktAjO5kNLTAeaTWaqIfyqAEj/rS2CuEjirCVfWf8mDoeA+jn8frIHoPTz5Tras=@vger.kernel.org
X-Gm-Message-State: AFuF++naanPIEGmYW59MDuGeKh+IaqW4vIOWsPI/jXwxJfS8gdFspR/t
	+zPUHwOOiE9yvVrxgb+cKmC7TQjVMVTXQFUAxeue9oafENjfBxvvrIhQSwrJ5W+L
X-Gm-Gg: AYBFou2Na6wTQAWVbzbYgQ4FkBKgZk3VCGMDSkc8L3y1S/c1Jt+TIzN8PR65w1Gwl2g
	M8b2pkG4GbWoBeGonlcjnUO6NdF7PapGIwiTVGek/4JG45MoCLsUZVxr3B7GTeJnuliuL6zbMvW
	5uVFt6GUvtm3wcd0fg7ENriDxAJnRrtFIK00UXfZ0oWa6aHmpUIEgq+6KfwdiH6rVnOA3Rz8Uaj
	c73BDvvXWunvL1L/SKm8feMiHs/YqimMGR8smVITdvL28jPxML9kALpH1Cl4atwT65rUyDC1z2o
	K9hurp1+HeJiMtbP/1MiJeH9wWthmlrE6sYUOBfy+gf9Y39zbCtYNdQxyZbKQQHNyI3lCnNvOAp
	+ui+tX//n8c2xGZdu92dfMCvBD/uM/Zp21bvbKN99B+EkutClnWRc5DpQ5Rx0BFi/B48ikdoclN
	+qdPSTbKMIYz12MuBHCn0+GCObYXAtqtgzH27wb0P0Jq3mKJf9nEp04SWCOaoQ6s2ITktgEblWS
	ecsOlWVCRJFNBIZajR/oyn/
X-Received: by 2002:a17:90b:5201:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39af655b35dmr1951709a91.13.1788350275447;
        Wed, 02 Sep 2026 04:57:55 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f28b19sm5919574a91.6.2026.09.02.04.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:54 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	qwjhust@gmail.com,
	qiwenjie@xiaomi.com,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v5 04/12] f2fs: cache: introduce writeback thread
Date: Wed,  2 Sep 2026 19:57:49 +0800
Message-ID: <20260902115749.692330-1-qiwenjie@xiaomi.com>
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

> if (flags & SB_RDONLY) {
> 	if (sbi->cache_thread.cache_wb_task) {
> 		f2fs_stop_cache_wb_thread(sbi);
> 		need_restart_wb = true;
> 	}
> }

and later:

> err = f2fs_sync_fs(sb, 1);
> if (err)
> 	goto restore_gc;

The writeback rollback begins at:

> restore_wb:

and the GC rollback begins later at:

> restore_gc:

The common option rollback then contains:

> restore_opts:
> 	sbi->mount_opt = org_mount_opt;
> 	sb->s_flags = old_sb_flags;

The RW-to-RO path stops `cache_wb_task` and sets `need_restart_wb`, but
the sync error jumps directly to `restore_gc`.  Since `restore_wb` precedes
`restore_gc`, this edge does not execute the writeback-thread rollback before
the old mount options and flags are restored.
