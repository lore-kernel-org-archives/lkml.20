Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244960;
	b=af0saCE9JSbeg4PwValgsrWA/ocT7k3hlLpy8KSuldGCLP2VnoG5r320ksixkpLvdM+b
	 4BWGtYjVoxVEF25455gHna/v9W8tI+LVuK37cx2dvKKBZLSOsY1bGVVDdD5bjZHar3nsk
	 uxbxQMLnIlZTiOzuiFcDkiUuUYwaT2W5I9gwCgOE47F7jvH9ITpXJNlHQw8EhEUwbnVzM
	 Ln34PAa7q2aWLs9RfHLFYr5t1p+Z9sVIb0Z04CBlPL9khEa3ut/lPjC+QEvbEWXMUnzRM
	 pDh50kWkta9zwgbIF5KUA87P+z5yHf/jdjNRWZy00MceTomVEj8ZvmCP+BGrb2N3C/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=b6mHS43xjC7bUToGiz9ZtsTkKl4SjMG7SXbvThwI2D0=;
	b=2Dj3GMy8PztBhpvJSXaW2vxbWe2jGvW4Fd9EuJnRZMrJpjkyIUwdeNRewf82oalVokkR
	 yQaZ70tuXj0PJa/vSivKxBRtv4W/9tsNCHtPEHxo9NF+wIMgVpUHdE54Qvbget7HshD8W
	 j/aqqNnWsN54KMxW5ppFv4jCYP/wqVqYWloFLMzO4dK3hVhvl8YZ09453pKNgd+h6CyOh
	 eqClxRMVd5lNhVXlMp89aFAieNzjGK8Aw0QaHdAqxkUhnUUj/NsrQKEJ6BoDhQ5H8XPqt
	 cfOGRr9KKTyZI7gLOZ8RAjPl8ODk1QVTsLfIBsJy6RIFu5qLS9z1NRLw6eEX1OSGMWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=U4v0mlex;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732CF606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732CF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=U4v0mlex
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9491775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794244958; x=1794849758; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6mHS43xjC7bUToGiz9ZtsTkKl4SjMG7SXbvThwI2D0=;
        b=U4v0mlexhWlX56e50vl+rHtY0E4bzai4WnqBSNUoQGJvDFH+jhJZG+QNgLf/ou8Qhj
         c4HdzeD9/Rvq4PLSw0i0SegdfnVBgRa09/CSARvygTBgoCOGLU3+zQutEf8u/FiuhFMW
         qBH/0nEA6GfUKokeDCAqKFvRKRJhW6xSfRu1F9jQNByvFJtRvrszHUpPhpxL0oH0zt5E
         8pNyo3s7ARdiyEuFvG4/2nP9ZwebN7wu5iKRFeejPNZ5YO85nvyWIXBcKsBeNIq+iuTT
         LCKGawt2Bobn3BYRN36mW64rBrcAtzymMoS55QOhqALvVjMm8F7KHt/4h3QwtQ4mb1rv
         Qaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244958; x=1794849758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b6mHS43xjC7bUToGiz9ZtsTkKl4SjMG7SXbvThwI2D0=;
        b=SEgJZKTaVROFyJSQ0jxu0gSVdo5kBoZCevuI3t/b9dd58Bnp7MYmVTNtfD3R9F5p0F
         rIVAgLjk/Ma3gX0hZz/83T1tDbBD0Egzns+IYUnmvlVu/GQb9KO7ilH8xJT9decy8gT2
         fXsw1g5tJHxkiqpAt2L4nzt0nqFZiZ3jsXvygPYIuBDemwhRRgBngR5wWDA9e581UlU7
         P5GJsmZ3iwCMz5Vb5qN7ou3mCMwj03DRZkmaggB2eUQ9SfH5ILXlqJIjHs6ahBMg8rJj
         etWxI/dOCfcP558q1JcC8dE/RD7Zk8UefcAqU9wU8k0W6+EwlOizhHPEswoHPp4KjGJs
         5tBA==
X-Forwarded-Encrypted: i=1; AL+hErG3hxn6FkFyfxi1T6Akg5t0ubBO3GtT5vJm07xtJmIPyZa/6Zg5SPgMLQnr8zmRP5hHdtc8Ri3LEW/vzsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wyxwAH61vHSML7ilh/ZxLAw+u01uxQXWFES/j68PHMqqSYtfb
	o6ONDVA/cQv6CXWvBYn4HHKep0CkyDqvIBrWZaSQVw7QWRL9oD1UfvgsYP5/N7Xw4dc=
X-Gm-Gg: AYBFou3iRf0HA1xXB2b3XfB33fjBN7eaKKr0AKrKKOxUtK3cZpHb2HcBT4gc7XFa5CH
	zRdwefL5LmQfw6+zatMaaoOiFAHhsRLUuvZxlRI0v+9xH1aLn+Q+1WPCexz24Y/97cXc3jmgRF6
	TbLTZVg76TgZA9uPNPEPEYyVxYZqHOpBfW8YNDz2Z5PpfBMQK+78KdsFAWJtKvB/GeIDgIJ6BJJ
	zyfpdDFif0rTIB078KjVlIPRd3CELq87MmrG1Hx6KnUSnEfz/eCDG0UfwF0J8jJCRcbyjKwc+YT
	Kd4mAArYhJ7nV/fH2QMYduJcFrXdfzjRBSUvLvkirB9octCmtfeKcPQLKiPkc0L6/Kp069bUn2o
	2KKWS/zE1kpXK/LSSw2Ykl1IH1pdU2iET1AoOjVjwfaspu/dN/TIO8o74wuzLkDYDULRqhgezuM
	GiVux9rhtiy41Tjq8Z+lxOBwwSC1fJWzAhABdozepKFbYeaZvYlam9EzpqLCONvHUBp0H9Lprug
	VVOi+SP4vrjma/CA2aCFjtDpI+a5hVZ2OTFVU9xnGIqoL5Kp2R5kn5W491rNy9Pce50ckHePTv/
	LmQCuqfS71EVnzgQCum7AT8w4zHwNx9zAqrxKBcdc4Jo0lK4r46nJ+N4Na66fcKnWkEXzwdK0bI
	eQnwEOw7lsUjJ0kJ+zA==
X-Received: by 2002:a05:600c:470a:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4b943f76fdbmr96705385e9.0.1794244957763;
        Mon, 09 Nov 2026 09:22:37 -0800 (PST)
Received: from localhost (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba015c1e31sm4470385e9.1.2026.11.09.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:22:36 -0800 (PST)
Date: Mon, 9 Nov 2026 18:22:35 +0100
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars@linbit.com>, drbd-dev@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [PATCH 0/7] drbd: preparation for DRBD 9
Message-ID: <avIA1j2pX46pzOr0@linbit.com>
Mail-Followup-To: Jens Axboe <axboe@kernel.dk>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars@linbit.com>, drbd-dev@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>

On Wed, Sep 23, 2026 at 04:06:01PM +0200, Christoph Böhmwalder wrote:
>This series contains preparatory changes for bringing DRBD 9 upstream.
>Each patch moves a piece of the in-tree DRBD 8.4 code to the form it
>has in the out-of-tree DRBD 9 code. Doing these steps separately and
>up front keeps them out of the much larger rework that follows, so
>that rework shows only what DRBD 9 actually changes.
>
>The patches are a file rename, comment and internal cleanups, and two
>higher configuration maximums. Defaults are unchanged, all existing
>configurations remain valid, and apart from those limits only the
>wording of some log messages is visible to userspace.
>
>Christoph Böhmwalder (7):
>  drbd: rename drbd_worker.c to drbd_sender.c
>  drbd: modernize the file header comments
>  drbd: raise the socket buffer size limits to 128 MiB
>  drbd: raise the maximum resync rate to 8 GiB/s
>  drbd: replace the drbd_interval bitfields with a type and flags
>  drbd: move the packet name table to drbd_strings.c
>  drbd: rate limit log messages per object
>
> drivers/block/drbd/Makefile                   |   2 +-
> drivers/block/drbd/drbd_actlog.c              |  16 +-
> drivers/block/drbd/drbd_bitmap.c              |  18 +-
> drivers/block/drbd/drbd_debugfs.c             |   4 +
> drivers/block/drbd/drbd_debugfs.h             |   4 +
> drivers/block/drbd/drbd_int.h                 |  59 +++-
> drivers/block/drbd/drbd_interval.c            |   4 +
> drivers/block/drbd/drbd_interval.h            |  55 +++-
> drivers/block/drbd/drbd_main.c                | 106 ++------
> drivers/block/drbd/drbd_nl.c                  |  15 +-
> drivers/block/drbd/drbd_polymorph_printk.h    | 256 ++++++++++++------
> drivers/block/drbd/drbd_proc.c                |  10 +-
> drivers/block/drbd/drbd_protocol.h            |   4 +
> drivers/block/drbd/drbd_receiver.c            |  61 +++--
> drivers/block/drbd/drbd_req.c                 |  40 ++-
> drivers/block/drbd/drbd_req.h                 |  12 +-
> .../drbd/{drbd_worker.c => drbd_sender.c}     |  42 ++-
> drivers/block/drbd/drbd_state.c               |  15 +-
> drivers/block/drbd/drbd_strings.c             | 138 ++++++++--
> drivers/block/drbd/drbd_strings.h             |  27 +-
> drivers/block/drbd/drbd_vli.h                 |  12 +-
> include/uapi/linux/drbd.h                     |  12 +-
> include/uapi/linux/drbd_limits.h              |  12 +-
> 23 files changed, 534 insertions(+), 390 deletions(-)
> rename drivers/block/drbd/{drbd_worker.c => drbd_sender.c} (98%)
>
>
>base-commit: 85bffad4d2fea373a72d68bed8012e8cbccb8ee7
>-- 
>2.55.0
>

Hi Jens,

this never got a reply, and neither did the subsequent v2 drbd rework series
that's based on it [1].
I think this should still apply to 7.5, would you mind queueing it up?

Thanks,
Christoph

[1] https://lore.kernel.org/linux-block/20261006154607.3936501-1-christoph.boehmwalder@linbit.com/
