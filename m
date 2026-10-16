Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93B4DD3D4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160190; cv=none; b=IhDrLsHVRGj6YxrJWoLTJY5gNWetginrzaSZYdcFtpeZ5hwTS6kDMukQZ83ILGNlkpX+3MwseuEsu9sKEYv7+SPzBYJgsSn26DCuggzmmKe4poFyJGI2VOOw+0HnQkC2VjnGx10DL6rDan7myhl0TkEaFkwR8gSjjGRq7P9abZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160190; c=relaxed/simple;
	bh=u+fkloLOEBfCZ7XVJCKiDAjDI+S6TUXHUiE+ew62bSY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FjaFb98QWUdzcqd1sAhV3rEVzWxWxQjXyVbWh+ZEBJFMw0pbfQ8rJC/vTZB/ZHUUAkcQg4wMwgtrby5MtcwF4ICegqMtR7wi+MCSmagg5EVUJUMIlBN1Uxb0UpKwtUo6G8WUtM8+Bdxo1jJN6tsaSav7xiSEEwY3RxYlX4YuB2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGJmYFxD; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGJmYFxD"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso2645577a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792160182; x=1792764982; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:date:subject:cc:to:from:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZ+mTiIAxhmwhKCyjV/xAz+dOI1Ti4dVU+974wnLdYQ=;
        b=rGJmYFxDrkf5xsdfC8cDPbrm/FYYMNsH7xVvbsXFHUilUakaHARLRwDtaXnthEkJju
         Kn40s4sQeeYqwo3DY8MUG2h3Gf9Dr8/Nub13Ai5SJtCNHlCd5U99M1qJiMElHjU5EGxz
         fHK89k4E9WPpJyCGtwzVl8C7L36f68pPxIPpFLblGSzjARjM6xWy9XhV6brrRqSGt10s
         mLnEAe8MITUSI/RVPELjwVNXnT6Bdr1wX2Q5DeFCKM9NJTJq0WJ8xRWd0lYni0Ivdmhe
         bei3hBQvKnoS1h1FP2suvct3slav/YvIARdtkDdAFdvzG/sylu/9fowwYK+klsYFdwtZ
         LuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160182; x=1792764982;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:date:subject:cc:to:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZ+mTiIAxhmwhKCyjV/xAz+dOI1Ti4dVU+974wnLdYQ=;
        b=bVZ6DNtPkE8TavrsROYadrw8EfoZf0rBUmoUW1RyTN/FIIqXlcegKdsyA/zJWZhqE2
         thPdtFf2VmCTCXP1pmbq1P+XG40u8ZPPCuW+AtrAnMav7PdWTC31Rg/gSZKpKrjrleAE
         FALXvB7dYdc1nk4anSVr6VjvYmSALi+nqpfalaXiwJZ0D3A5RtoE1oEeQvsVjFi8mzut
         RstV4/CQhut5hOr807I5yN2UXD9fRlIwkx/cGj60Wnef4o9u3hZQNpUAyx7+WROjEDHM
         FjjunkPnhTz1cm2re5HLd4uxS87Tf2lEmK4ojUIBd23Zcnm2Ht7qgaIE0lMxFl+Vlh/z
         UhzA==
X-Forwarded-Encrypted: i=1; AKwUvBy2Negt7K8cEtbHfkABBIp4Wk9pD2r6zMu04TQn8djghX+qdltJjD5F2UJJSoScO8ZwuLfboF3cMUDmJZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv+5lrSCfW6VgHuvdzdgyaPpTYMTmNvewBYkTpBBZlfUgSZD3L
	DmBYSASB4UAN0YHrS6OG0UumpMdgMHpCArbznvATLsNcY9f4VWKqFqu8aSu2xmwHgSs=
X-Gm-Gg: AYBFou2SH6gxkSYaSCFcfU41TPfaqAQvieBEaqwVuyHulVKlcG6gHcWI6q4rHQS0H9x
	b+IBOKhDuRUMIUuE0Usa92ahuyTrILIoA/xxUC9OG5bslESukSHYaBKEF/2y99XaDMT8tECuP0D
	321JYbi9ym6lrKxJpfL7fA452hrhJO5H8uwnrirdey7IQy5VbxtPAkEHcux+K1A31alffFPPQeP
	StTD93ddbFaJyR7cpnmu+0nlIBsVLRXtWEr7ipdmKAqcJg0jqPI7hjFrMxAXejB+yj2zwuQFXua
	KUgMz9dfa/GhOyLDtvIzZsnXksnm1o4vbyqqjr/rMoUgWekqhr3xxH4HPQ3yJcUedcve+q89OYe
	zKx1c8a3r+EpJH23DwBmFs/Fks4h8GvUOPdDxClNJNRsRzo/E01w35T51TtofSlbdo8nfDHl/HH
	r45KXJGRvsE6jigfuvFdHRofE6G1+AqH0KoyiqE7s3mqkWSqu0fPcRthCCOWyaBxoQ50RJbUUm0
	cRYfoQqpRjOze6fBkXSfg==
X-Received: by 2002:a17:903:2f86:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2e9a68d9693mr992475ad.24.1792160182121;
        Fri, 16 Oct 2026 07:16:22 -0700 (PDT)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e87994bsm10854635ad.60.2026.10.16.07.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:16:21 -0700 (PDT)
Message-ID: <6ad231b5.6655ddc8.1e37bf.a74a@mx.google.com>
From: Zheng Shuhao <viennaoffh@gmail.com>
To: "Carlos Maiolino" <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+e7f24354da9f7915bc54@syzkaller.appspotmail.com
Subject: Re: [PATCH] xfs: fix slab-use-after-free in xrep_newbt_free()
Date: Fri, 16 Oct 2026 22:16:18 +0800
In-Reply-To: <atIj2DeA3TOMJQ2-@cronus.toxiclabs.cc>
References: <20261016085536.591-1-viennaoffh@gmail.com>
 <atIj2DeA3TOMJQ2-@cronus.toxiclabs.cc>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Carlos,

Thank you for the pointer, and my apologies for the confusion. This is
my first patch submission to the Linux kernel, and I was not aware of the
known-identity requirement for patch authorship and Signed-off-by.
Understood now; I will use my real name for all future submissions:

    Zheng Shuhao <viennaoffh@gmail.com>

(vienna-0FFH was my GitHub handle only.)

For reference, this is the testing I did on the patch before posting:

 * Built the patched tree with KASAN + XFS_DEBUG enabled; checkpatch.pl
   --strict reports 0 errors and 0 warnings.
 * Reproduced the use-after-free deterministically in QEMU on an
   unpatched kernel; the KASAN splat matches the syzbot report exactly
   (xfs_defer_item_unpause <- xrep_newbt_free <- xrep_bmap_build_new_fork,
   and the xfs_defer_pending object is freed by xfs_defer_finish_noroll).
 * With the patch applied, the same trigger produces no KASAN report: the
   scrub ioctl just returns -EIO and the shutdown path unwinds cleanly.
 * Regression runs on the patched kernel: all metadata scrub types,
   invalid scrub inputs (bad flags/generation/agno/type), and forced bmap
   btree rebuilds from 5 up to 1500 extents (covering both extents- and
   btree-format forks), with read-back verification of the files. No
   regressions; normal scrub/repair paths still succeed.

I can share the reproducer and test scripts if that is useful.

Would you prefer that I resend this as v2 with the correct
From:/Signed-off-by: lines, or can you fix up the authorship when
applying? Either way works for me.

Thanks,
Zheng Shuhao
