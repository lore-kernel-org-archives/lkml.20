Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446829;
	b=Jh9j2G40ClOG+epNqcZ7q6kMW8oGUbPqRP/gWt570EBr2wGF2sNaoSRlfv5TJtTxf8nv
	 d1+trUCfzvtv3gBjmpLxbdHSpRu8rioDp8RjWgPl/BGlO/iF7FXbryz4P+xGEfTeVW1k2
	 FiYQKx4yIdlIMqGt511qPuvMmnstkSpaPbsVGbJJqVJjejqtXu1/ptCkAnqNT+FpHGmRN
	 n56NJgBfuTd8ge3l02RVL+Z6peG+1sypxmzusfWIkf4NwFrZ0XZtlg4q6HkXafnCr70+O
	 kfAd43eXlGPGmenQZXnd2h9LibeCPzRhXLbklGQqx4QfgbcYtCwCXaugyAxsx4JJqJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Pf+orCI2rLpYXGk3dzBIrPS1HgJeZ6wmt3S+jICR+IQ=;
	b=LkwULk/O14UkeLo+v7TjFkuyGfeqxxiE6zMRZasQxZFwhjYKWxtpOCOQUFdwRKBBIGn2
	 PAulTkP4qptNBXy8WscMkUA6A7ET9Yl/BEF5GXjZM0Bj5Fmjzp8hq1wxee21nPENmPlcL
	 KQzrcZyl/MH7fE5oq2iVH4Eh0HiURd35itpzgHpDo8boHCwWj49bDvVE1XqebEBVKVlDe
	 KeOPikVq08aEz93Pg/V2NoWIWqj940ZeP3YaBwg9z0E0CZFJi4KETSN9Z0miZvhrWLtb3
	 SEHGDUaup+JxPdA1005Q52Ta2hFuaPIvBoovyZZaFuoGfgxw1gQKIfHdLchsGYUIqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQYBxejX;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842DB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQYBxejX
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so149005eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446827; x=1795051627; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pf+orCI2rLpYXGk3dzBIrPS1HgJeZ6wmt3S+jICR+IQ=;
        b=GQYBxejXqj9xKMkrNLYSftKDOeRVn8MGo5YIk9XbbwLV71haYO1pTPDykyrDQahJKY
         eIJle8vCmyIM6oge/Xx+H83+68zv1DZREQv7gig7L2mUgi+X6oJziPYhi8v4w2u3QhlU
         9OeztHu/Txto49TDjRv+dj9WM9QfqNFpnFfr7W4zzNvykjeNaXJrf3uZDzyPDZyUYX3X
         2YDn37cpmNmoVs8FtOZO4LXESBQoYq09d8LOuKbMKZGWgM4cjwfW96JRcHWHi4hxjgDF
         iNZIc16V5k28cumvno3px7yJ+UHHJ5A8+p05RTuKlIe0bK0zn7V1cHhzVNc8VcDWyu4e
         srfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446827; x=1795051627;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pf+orCI2rLpYXGk3dzBIrPS1HgJeZ6wmt3S+jICR+IQ=;
        b=A+b4LxZissuOknTKcpBnngN/R0HMtk5DpeMEs3DYSKDOPvItNPghoqNy//zwMEhI9r
         arcaLCH1EPvgv8aozAFhnnyLgsUTQRVgAIdrAhsF7n15PfeHcV5AhEtwphBKD+pnnosw
         iZtp3VGTYIwUvoH2yh4F7Rc8+OYYGxGyAWl46uh9JHhpg2kHHExJC45yFT8sID3EpNui
         jgAjDrdBhT0oToz7zOKAJy5QapjdbYvkB9k3y16laIP5F8NzmUbdgDPgWeBYPuM5MkTy
         qfFmATjfB0+OZ/3nBGun822I/TlxN/etdVetGNfSWubQzd5O4U/XSfcBEt23axXABLUl
         uUvQ==
X-Forwarded-Encrypted: i=1; AL+hErGktXbFGeZpUb1hKtNOqVjE2V3F0gTfK9FtHAbdJwXA3f1GuQFlGt6aHr4B8mgtmWdTbDNjXTNoqe0UMzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wdjCT7tO2fFv+QcH4encq56r978I1dVPOtnLWQdpr22omRO94
	VPg5qCXEfHPiTAqlU78xKos3E0r0Unp3nzPPMDfYURZnmF5peJhEnNay
X-Gm-Gg: AYBFou0nGJLVVi7cqFw/uKscownsMzvNeCr+pyrVkYjfaJJZ7lOx5alfOilplr7aKcq
	6axSaMSdn/XOuBRdLvuNuyC7Phe9veNt8AcvPYxA8nO2xe8Gg9bHYRzFQEiOd0MM6aS2cZjLCtP
	az6p2tHgZY3u0u5Y5+OWTVX7Lk/wbRD2x3ChY4mq8f36YWBZg3UFSwWzxVBkt5p+CKZo+rplmBe
	rQ0AHhUUAPkG0/Qq7ygJ46/pgIWS1/M4K2jblMNkkVm6eI4z49p5LZv3wU2VquT2cKgAA/1ruYD
	hb+ROD+2/H2EhYxSp+0FXdoy1EfIL0+RmXV45yGuNBqWqDW7TpsnIiwM4NI96RMoHC/KRtf8Kpl
	B/7gfT1ksWK21IV88BxVjlIlHpmBNc/jbaJ4HhN7xoJEn6VOKZldVgnDjcwhgZiDngt8F844aTj
	x9Rznr6UEEnAyrdABXuot4M1dVCol+azggcvbFAlubXkQS7u1cv7vTHMCQhGrgI8mUbRx+wJ5AU
	qJg0ZXCg+lzw76Lr6m2ErplBWc+doZ/V94xxIXc5XQbHXvjCPJGi88ofeA4RX3tzPapmHcdDSgh
	O3a6GzOiJhn/809YQXnkL5y2RXRRFTbeQRjHexQftvzImU0p2PmeFGBxr/YtATRtY9s=
X-Received: by 2002:a05:701b:42c7:20b0:1b2:5884:a039 with SMTP id a92af1059eb24-1b3c0151554mr6228487c88.0.1794446827180;
        Wed, 11 Nov 2026 17:27:07 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm24887181c88.11.2026.11.11.17.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:27:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Nhat Pham <nphamcs@gmail.com>
In-Reply-To: <a7b1d671-18b0-44e8-b112-ab66893b3bf4@infradead.org>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <a7b1d671-18b0-44e8-b112-ab66893b3bf4@infradead.org>
Date: Thu, 12 Nov 2026 09:26:55 +0800
Message-Id: <179444681565.2553194.6533752746321637708.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-11 16:26 -0800, Randy Dunlap wrote:
> 
> 
> On 11/11/26 4:41 AM, Xueyuan Chen wrote:
> > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > counters are updated regardless of this option.
> > 
> > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > debugfs is unavailable.
> > 
> > Remove the Kconfig entry and replace the existing CONFIG_ZSMALLOC_STAT
> > settings with CONFIG_DEBUG_FS=y. Update the English and Chinese
> > documentation to match, and clarify the pool name in the debugfs path.
> > 
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks!
> Thanks.
> 
> > ---
> > Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional. The
> > option only controls the debugfs interface, while the class counters are
> > updated unconditionally. Removing it simplifies the code.
> > 
> > Following Nhat's suggestion, remove CONFIG_ZSMALLOC_STAT and rely on
> > the existing debugfs API stubs when CONFIG_DEBUG_FS=n.
> > ---
> > Changes in v3:
> > - Squash the three patches into one (Nhat, Sergey).
> > - Add Nhat's Reviewed-by.
> > - Update the documentation wording.
> > - Link to v2: https://patch.msgid.link/20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com
> > 
> > Changes in v2:
> > - Drop CONFIG_ZSMALLOC_STAT instead of making the counters conditional.
> > - Update configuration files and documentation.
> > - Link to v1: https://patch.msgid.link/20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com
> > ---
> >  Documentation/mm/zsmalloc.rst                    |  4 +--
> >  Documentation/translations/zh_CN/mm/zsmalloc.rst |  2 +-
> >  arch/s390/configs/debug_defconfig                |  2 +-
> >  arch/s390/configs/defconfig                      |  2 +-
> >  drivers/gpu/drm/ci/arm.config                    |  2 +-
> >  drivers/gpu/drm/ci/arm64.config                  |  2 +-
> >  drivers/gpu/drm/ci/x86_64.config                 |  2 +-
> >  mm/Kconfig                                       |  9 -------
> >  mm/zsmalloc.c                                    | 33 ++----------------------
> >  9 files changed, 10 insertions(+), 48 deletions(-)
> 
> 
> -- 
> ~Randy
> 
> 


