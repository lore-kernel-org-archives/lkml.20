Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482789;
	b=MYQuncNa7JYVIvesOWNYda4jTEUGT7jRX8EAu9Nsdu7gsIDEFbBHd0mcuygwGToZkzfk
	 wBrMTM7YtEdwbN/PKxg99Y/aIeypPgbntMy2xbTaEKWpZ8YTo2L6B07EVl3NAe9A7Nvvn
	 2Oyrq8bgK2SZfc6lXVuiS2PV7dOo73z7ZZes8R+HnByoVrKrHqkXlffss9oYjXPfg04iD
	 00ivBlAqqjcjQX4bQ94g/eF3mU2bePLXyFdRatBlCN0LihO5aGSs5UBodLzbAhAO1MK0w
	 hXx/vtL/NJ5hYnhYmqr0WRQ4m/2X7Qfy7huEFG7Eckhv46QE8srZb+SV8WFWLSc1h4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=2nWBtEEn4hd48cIOC+JW/bLoHA1gTBtQ/8nPmmpZzBk=;
	b=PMNrzQ9YTugizEotO2iR5j1L1zkX0j4UGVgMhtX9Dv8vzXDxGrZK0ingbNA3l6pc41TQ
	 kVeNj2nCEI/EdUXMq2C+cZUo8/3zIR8pmjg/6jeJlg2UlOlUOKudnoR9Dgo8+L+tX7vOe
	 WDfj35Rcrvb6dwdzy8TbPbWemISZBUdSRNzal4Le+oldHnH8Ce5vnkJWjgai3jUIKG1zj
	 ZKgSNDpSLQGlJcixLG3WkA0kPmndEcdEW0LFC4vuA7bM0ZxsIsBSURKNaRU6KpnIsdhwD
	 DyChyxg+MN0nLdpaUHP9JXaI8BdagknVHKvQ3B7TpkQ34wQrvKpj9+ZUlr84v9+gKcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9UGKRc2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB7606B367
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DB7606B367
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9UGKRc2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e90071735so256079eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794482787; x=1795087587; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nWBtEEn4hd48cIOC+JW/bLoHA1gTBtQ/8nPmmpZzBk=;
        b=W9UGKRc2VpXLmhTp/WpfJWMZ8+yRuAb6+uRW/wiTSfJRv2O4YFBYyF2VrghSwiHmtj
         m88CI55CSUU09SUUnLyLquc8Rum0kVd/GVSZ0dyVx6hamjNBtfkVl+jxNggqxGMOH0rs
         x9SeNmVOrPcixQY99GpzlDmY201Ozk6VJeAjxeE+Mn3fkKmGXOdZreoPuUk+KdLeHIqc
         xfKvuJyKAoBobiXe4PODiMLA3u3LNONJd2fxNIPULiBxAjwmBOzn6GG6OmR5l5D1WFxq
         PoiPJ7eQ8GHDoNgo87TAOi235ekR9nfqaqJZ7BF6Lu18RXMrbJuupNFqYzOgPkVq2Uau
         6iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482787; x=1795087587;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nWBtEEn4hd48cIOC+JW/bLoHA1gTBtQ/8nPmmpZzBk=;
        b=r05JkQif0GjSn6pvNdv33Zw5cASz27XghoLLASfhP7SGdMj9s3uVoX2j62y+t3NRvn
         vmAK6KIgNEmFAH+MIG4LPkUrVAnCtz92Q0Kwtc3qS1rPyeWGXSBuAvxi3Jy2qlhN+8UV
         OgrsRpat89rEKqmxdojqWK1lGYvDmUDC65kl+RlDDykO4nY6t9A06g72EK0EgxHXCkab
         3VIA4BWW9DlNCukcupPrsWTkyNAfztD5oHaiZNptXjR0vXrHFL3WRTCKQ87JFZB12tXV
         l7Ui8/S3SKE+z/NG3/XqfIEFCDwp5rbSJtbDV7HdkGgf4Sb/Pf8Fqb4+yCnMFCwgjqjD
         VlSg==
X-Forwarded-Encrypted: i=1; AL+hErFawXwTJaPso0HN6sH7aDlp8eUIxfDy4rR02qjtcM3lQQB+UJx5Ix++DdlKHsdc1Hhb7XYe7Z+iZ2ia8cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M/fDNEma5wAp/qwI0TxXD8lhgjAAeNe5CFLtMocDqlc2uE+21
	mFjlsFITrQH92QkDJM+8Rk5/8qmS+cKFoPt/knnYyh7ld0+gDpm2Zfa3
X-Gm-Gg: AYBFou3TQ7OcrJgwosleMpp62bpXzehW3dAavUWpkocvkK3mwa4C1/w4fV1rNce8dWE
	XYK/stWAEbCA7niNsI4YRTuNpxJENMsbORJfNBSEagsfkFDvEcy6QiCr/ybXRhnbuEwDQlKJHp5
	gLmEigNCK5t30NBVOPa/SxQWkfrRwrV4Ho7f6XtBlQ0wogwJGWB8nbcLE2IexSTEBp9jg66R+Qn
	9i7POJV1/uThXKXbTLaT2fn8G5ulPWxaT9BbbIMbpt1Sg89OIcpZI0IO31O6gsmQc4hxkbdY3h4
	LmVXAgwHwla2LTIKw1ntIBATB5u5kJi9Aodz9HsyMHLQ+SuX3IGg5VDKtiQzKiF+8ZwGfA9vAQ2
	/86DOwR24LoeSM1Ybw9NKsygH9dKzV/ypIcG50RiFY7ghx5BoaYBQHFIFPaZaD1WYnss3hgozOw
	BVAHcUwlqoq2SNTkZyImYkDPC35s87B2UWYDbklSdvwRS1bRt/sJXJM4yHBo8Kmhkt0Pjmej2+6
	AKBPoVCkkvdpZpnfXfKZIj15X9yxyepjeH1TImY9Yhkd+xm5s+7qPkxXvUZdNH3YBd4JbFJeJxQ
	yiwKCgYx8O2R6Gt4ycZApRTUY6K6su+QsQiJ8PIQmKmdRBx+fD+6EhTAeddI4jYRSN4=
X-Received: by 2002:a05:693c:8113:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-37684ceea1emr9219901eec.2.1794482787103;
        Thu, 12 Nov 2026 03:26:27 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm27380131eec.7.2026.11.12.03.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:26 -0800 (PST)
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
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
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
In-Reply-To: <avUet_6jVqlWSP00@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <avUet_6jVqlWSP00@google.com>
Date: Thu, 12 Nov 2026 19:26:15 +0800
Message-Id: <179448277582.2553194.12524350925159624366.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-12 11:05 +0900, Sergey Senozhatsky wrote:
> On (26/11/11 20:41), Xueyuan Chen wrote:
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
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Thanks!
> 
> 


