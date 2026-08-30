Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4F0231A3B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081232; cv=none; b=JNOmqI9N6Aw4ARt0mqe9NIicb5HoeTQAgu0WJDWve+6ciaeJEnjXyj2gm/ob1G6JsJS5Yt/T8yyoRvqOaMrMdbYa28XFNyEke5sIv+/ZzHPGxFETdaf2qGXpi81GfUJvImOnsKndhw6BV30H3l0MK9EdvaKZIxH+P8RSDblzQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081232; c=relaxed/simple;
	bh=YeEwfeyHKK6gIeEWh/rVLFOhOsvD3Jt7Q0LgN6+iTPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFanu+dcELjChy7dz4ZuizKwyNRbSgaheJU4wArHaA8GUdxKX5rz8QdNNI5sujCJKBnP2mJE+X9pkq6BQOx5Tybz7eqP/jLhIPGmGD6LSoRKtulcH+76n6rABoRIrWoOclPxf1FU0XIoFvrJ3iCasoYCZ58NaAOX3CDRXcIsbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mlx6S+eO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mlx6S+eO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d5335cf904so23679115ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788081230; x=1788686030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mZMnam9PuFjLpm1vuMO2JXE5Y2qa9SZWkY6IJ6iwGk=;
        b=Mlx6S+eO76CyiF4syZE6PzjFBqLUbW+MZG283x4kPIF0e3A1TaFKhijWBr5vye/atN
         ypYsiiuWhHSUBW7PDDTopIdYU8ccIkGdmtpvF/Lg8dPeCvuEvi2+Ycqox2lWgaK5pjMr
         Ezwpkv/9vAUdhoWGEd5Q3fJzm0y9aWijfUBFEvvhwypZlwvv09UQvSEyuFzt3mYssmp0
         /EjMKdn6bxVpIfiGsEFN0P9tZU4z6FVmGGR5ELXTy1OJsTYFvSBzWg7+opnoDdoOW5oC
         wZARTsl+SNJfco914ANaeDFYDLy+57nTtFtRjyWBm4Vubre/syIJ+Mtfe4oURiF60Bi0
         CgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788081230; x=1788686030;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mZMnam9PuFjLpm1vuMO2JXE5Y2qa9SZWkY6IJ6iwGk=;
        b=ohytpJKC6kdZOVFXA+0PRRufXdmNJNOEjYO4p6PpIktIaTb49g0adLM5H9tANe2BJI
         mktIOlLU1MNYCAGpjItLUffCA2RpDo/jA6Si9TTwGXx+bZPRf9UVekmxv9/LxikMcKaw
         p1mXNQ8q5pd+VMF0eMR82x1z5vZ8mDX2CpdqwPwg/p7bDV/NFvcUqXODWAmKXmCopJ8X
         3yJ6rPUuL+yfTKW2n/FSjTs0z8PkNPhix7CxZ7FnrK/mEyks1qJ7TLsWfA5RfpHmSaye
         f6u3XjrI7g65SQXEXEhnSF4hCS/USDq5d11TOcFQMEG0Sw1NKvKg19Id77pgdpB2JbDg
         MOsw==
X-Forwarded-Encrypted: i=1; AKwUvByW01ZP1t/I4aliOQgjGVG+FEdv6SmketQWEcOSvUHvH05/5fMtUK15+crZ4N9GAOCkPw/eMhIFehPgwAc=@vger.kernel.org
X-Gm-Message-State: AFuF++nGfjEtFzEvHufazrpKwIF+qi+rH5DwJQ2PEVBZMUjKPPoaX8cA
	knA3eJoDVOP2f9BEQwnjmLMg4YKf2bwiqAH+HoF+9Pj1+nb1j1ho1frJ
X-Gm-Gg: AYBFou2cXKXIlBzXOxueUV2Zsnko3fZ/jveG6aTaLN2XS8HoGoiT4jjaiSR1ocloMyJ
	13Mcjb6QLm4OWIm43uSw6xashGqc+N0pbS0LbugWPHBggMMAdpt2WPIe8WhQHB5fFb8KasiKQtv
	nxTBFvRwXXXcMbhz/GbHEpzU0FiH4Ut1K6ZWSY31PeHZKub7AH8RtM4Cbc3p8uYdJhJx+itCxud
	v7llMy/YL8hVUZ4NPX6LnvrEZhK54n6Zp1XABeQMly0zeiXEYUYd20UqVQ/4V0k6OmGgjwd5cp6
	Tr7Sft0CRmJyYl8x19gfAHpd4pr1GxqIrNKJS0LerGe5BkbszRjVaeEGP+Ic1diqIhCPJ5Rw6wd
	vy2r/bMLZn57lZe52qKRhmCpyOd1HXXB3lRuTfCB5gfIh5WU7RFriSab6T1ocpwZrkFyiMzdxed
	zPHWbulEHf2ldA4rfDWjIkmiUOP8Ha+dUthqFMewRUd0ZkOVuXP5EUjJ7IP3vy9Kvx2AhUdHoaN
	uUbUvq4Ccv4M94uB0UmxA==
X-Received: by 2002:a17:90b:2642:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-3989be8eaefmr17172526a91.17.1788081230369;
        Sun, 30 Aug 2026 02:13:50 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea80a2sm15459428a91.3.2026.08.30.02.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 02:13:49 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
To: baohua@kernel.org
Cc: willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	axboe@kernel.dk,
	trond.myklebust@hammerspace.com,
	tz2294@columbia.edu,
	jaegeuk@kernel.org,
	chao@kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v4] mm: filemap: retain mapped dropbehind folios
Date: Sun, 30 Aug 2026 17:13:43 +0800
Message-ID: <20260830165401.1788080041-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAGsJ_4wpUBOXKd8aGNz76U+87bwDUXZZFSW2UhNcq4qpjVvggQ@mail.gmail.com>
References: <20260820142956.1414337-1-qiwenjie@xiaomi.com> <3fa43eaca792bc0bbde4b82a6c1fcdd3f528b398.1787999152.git.qiwenjie@xiaomi.com> <4aba05e1a2c3b61cb337d373eb9b7a8db4ddd822.1788024049.git.qiwenjie@xiaomi.com> <20260829111621.41ed2bc9a0e99e3367eb96c3@linux-foundation.org> <ef160933595c365f2c47597b260bc7ecd98ed7ce.1788029516.git.qiwenjie@xiaomi.com> <CAGsJ_4wpUBOXKd8aGNz76U+87bwDUXZZFSW2UhNcq4qpjVvggQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Yes.  The current path removes the folio from the page cache, so a later
mmap access can incur both another fault and I/O.  I should have stated
that explicitly.

For fault-around neighbors, folio_mapped() cannot distinguish the faulting
page from a speculative neighbor.  This patch takes the conservative policy
that an installed PTE represents a competing cache user and wins over the
writer's RWF_DONTCACHE hint.  It can therefore retain a speculative neighbor
which is never accessed.  Distinguishing those cases seems to require
fault-around to preserve the faulting folio while not mapping, or later
dropping, dropbehind neighbors.  I think that should be considered as a
separate follow-up.

For folio_launder(), filemap_end_dropbehind() holds the folio lock and returns
if the folio is dirty or under writeback before calling
folio_unmap_invalidate().  folio_launder() also immediately returns for a
clean folio.  I do not see how nfs_launder_folio() is reached from this
completion path unless the locked, unmapped folio can become dirty between
those checks.  Is there a path I am missing?
