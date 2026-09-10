Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C4384CEC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055264; cv=none; b=n+suzN5dGVoFTUD1QT1WL92deRNtfTWW41hqKF73EZOVmr/92M6eXXpt5t7odT04YIM8xzwgipBQhLoQZDIJ9etXJnhhznFHuMn1rhq0MrUu7G6SKULHzyI4UnQcHxEHpAE1gHUssPl/dZ2RRqqsGqL9vl6taYOvC/kenSTP+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055264; c=relaxed/simple;
	bh=0+sxsAA/KszmbS0Y2uuZRM3am7zRasodMYDmegXpTsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCqFnXO56QxGNRhC3VYmil8P97IXrIMe4Q/A1kw1DgYls0FxDRAciNd6eek08LS5Ekzxwx0+ErMacnquzSSHuDJi0Y6qyrKgRKB9peLqpMTC826B/TOE5VvzP+ZtVS0uoc3fH4aW62263bfaZV3eepT5K2rEJBe+/023bfH1dpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAxsHCD0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAxsHCD0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8f265cbe6so62853195ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789055262; x=1789660062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68qGyetPcVC60nUYsKlBN4PB3E0Z8TnNr33/7f2ZQn8=;
        b=jAxsHCD0TuKCV1qoV0rBOVvyX/rsrxbeEGVfNDSJR6ZlqGGhjPsg0Jk/a/mTVfcb93
         snClXFLHk+lA6p66rkwIexMir3fPwWS+D1wPYYOaNDqFthBRQSnjEfMaVjii66JcyHr8
         +A8g4zDvnVh3Qrgfwe64oDpIpn1O5BDraIfYONfX/H8oh2wTxJmrAhU8uti2McU04N15
         g4/rOdEtkidwpdl1+cmQ+z8S82+0ukwKxJ7NrW6C4R38YEAdTI+iTbMq4PBpduaGZYDH
         6AaWFs1/gRHNJh/KKo7D+5AAUL35c9pIvAc77lQGiu/3KO1CQ9y6YBElNTq7usINDFRn
         WFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055262; x=1789660062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68qGyetPcVC60nUYsKlBN4PB3E0Z8TnNr33/7f2ZQn8=;
        b=a8DudsbBjARWK3xld/x6DigdM2aAjxb2bTPf3btBngYT0TVngm2GDWs26a/vS2Xeih
         B+NkA5Ut8I1euctO6Nh5f1sPouszkmhpFQbef/BWd25ZMtWMDwV0vgQWbDntrj1v7qdN
         47NnmGGbVTxRXEotvwfpled2gTRgvzLsD+yJuzkuKOqIML0Zw1wSBUgN+Zl2/8CBEoSx
         yiZPFiCKMZB5YhMbhrixTMpjE13jHyw6WcS0vZcj3XvVi5fz3x4oRjriUp6V9OQAk8p5
         pvkmLYpz/ZnmTn0gLza5JQlkp+cmOKx4DNzhy+c2Vbr2Q7F9GhX8B79h5HeKQWmCoYbE
         g3FA==
X-Forwarded-Encrypted: i=1; AKwUvBxsVV9KU0s6UvTEIqVcc2+7QqJ0ZI7l0Hz8gu0ombQXO9RWPBiaAWXwQ2kokykmmR0gyMEVIZv/1wwtfvg=@vger.kernel.org
X-Gm-Message-State: AFuF++nm0oLnTiss5Z3CN3K+oyNUo2gIvyaqoi2pNp/GNMNgKMXAKvWE
	Mh6sAYlWbhy1Igu88OjXpQR1/9i7wm7/ym4cJ8aq9Hr3NHZnZKwWRsXj
X-Gm-Gg: AYBFou2IcMtasaRVJ3wk82/NdRskaWxQT2G5jXPJ4GrZT54NfxD6zxk++WBoQpPsm04
	4XlpfAx17u9OUTMD29q/HKqH2/xG0BSrwQJnN1TU2pdq+SgYBU8PDEOFMPUaeKOJd8Znr4slsIM
	srjLSfI9b8CzUc+NRTG/1IV7e9UDGEQLzkyPBFXAqCpRpBCbsHDetA1wO7z7umUbKor9blmu1Cd
	LKSCl0ic+VnLpIDAubBhCkPvPkoYrMzeuHVhvmqU1YYqa7Fin/VmqbsWg+lc2uF5eU3KoFrSO7q
	b7QxCNc3HGmjoj+SHXA1yErERzjaBWfiaGC8k+5kPa7NOx0mG9/1YOZX2t0wyDZ6lKoKubHhDH5
	wjotRsbEn4maa9sE/qYumEhzPqENjGdaUUglA6SfK8UjkeJ9WU513iklgJjN3bWACK/iA3xIVaE
	rwZKKYAjuE6umeQcewYtfVtobiE3opX+CwTOPyDURuRO/v9JoKCJUgHNX1txcFJ1RENuRN9W4gu
	2+8
X-Received: by 2002:a17:902:ef50:b0:2db:5052:fd6f with SMTP id d9443c01a7336-2db505300a7mr385282565ad.17.1789055261972;
        Thu, 10 Sep 2026 08:47:41 -0700 (PDT)
Received: from Default ([2409:40f4:10fa:e40a:bc1a:13c8:1537:bf44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm58564958eec.30.2026.09.10.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:47:40 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dgc@kernel.org
Cc: cem@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	syzbot+a4fde844548510369112@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	jeffinphilip14@gmail.com
Subject: Re: [syzbot] [xfs?] KASAN: slab-use-after-free Write in xlog_cil_ail_insert
Date: Thu, 10 Sep 2026 21:17:25 +0530
Message-ID: <20260910154725.18960-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqI6v-_dc2DDSbgB@dread>
References: <aqI6v-_dc2DDSbgB@dread>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026, Dave Chinner wrote:

>The short term fix is to slap a bandaid on xfs_buf_submit() to wait
>for unpin before erroring out a pinned buffer on shutdown. That,
>however, doesn't fix the underlying lack of full lifecycle reference
>counts for log items.
>
>The long term fix is have the AIL require a reference count to be
>held on log items it tracks, and only have that refcount removed
>when the item is removed from the AIL. That's a much bigger rework
>of the code. 
>
>FYI, I've attached two document below - the design for
>generic full lifecycle log item reference counting, and the design
>for converting the inode log item to be dynamic similar to the buf
>log item so we don't end up with millions of ILIs that are never
>used left sitting around in memory until it's owner inode is
>reclaimed.

I read the documents and have started writing the wrappers. Is anyone
else working on it?

Thanks,
Jeffin.
