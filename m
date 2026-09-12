Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5E47DD4A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219461; cv=none; b=qDTskzWPRRwyuXsdiHX5rHSxXgPnzwsevrD237/opriaT4kDkfDDVOi7YWqqFFZCh6CgLeCHJDgH8a/8YvCmGZRSw8IcUv8EnHcr8PNWskUXjozd4WtdH2+Vqjq+WTfpypaiNg/vHyJK5pualSpeDKKPJOo9NISDKXfss6faXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219461; c=relaxed/simple;
	bh=M3sR35tQ5K6JnPlLpNqOuF7I/PrARLfOJzKs8U989H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6vribkMo4EXujDoSXslRcAjvY6Ony06GCYXhbDKNST9NE9UI+xeDXryjYui4DlPtgJnAwah/N6sj8h6WjIpZQasFXw82OBXHFGum+mC5yOOWgUbjNbs0Ssdo+OBFa9Km864Cc7rkU6jnlYmpdlhEjm9yvTjHmafIOr/Pq00tKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYxCAnW/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYxCAnW/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so4054285e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219458; x=1789824258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1IRfk/ZVhXM0tDobEj8jOkMqWVwteMNo9N+xZSsVM8=;
        b=jYxCAnW/KcPJHaqlwxX8JJldOJB8YngwSrr3bxAnWqdqtBFnHHt1qrrFY5tbZSwsAR
         fN709BYaVow+wp0B2hMKS2WGGM73lLJG+WLXBnYTFV4BylPVc3VNMRA5NLSUM6uJwnwq
         9okTxVoMzvBzplE+0Us8pLZUA+X9qfWaibQIeIubVTn53Ycb4D1fLraetTB1ffvzMyMc
         pp7sT9OaoHu1qC+IESMFPJG9HFQTWB4ZST+gN6dNQ0ShEuRjOfC0oR+Eap4Ioo4U0eQS
         3ftUmHSSS8/8/eCuGx0CMQoc1J2nD4wpP+7aAJMXAvfpmzpDgcbdiIOThekdlI0qgPM3
         NNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219458; x=1789824258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1IRfk/ZVhXM0tDobEj8jOkMqWVwteMNo9N+xZSsVM8=;
        b=JdFSjBFEZ1v0GPhAdwL236ZF1ODRYQOMIuWrsmLo+dI9Lj/TkZai6i0vu31eRUPf59
         C7HZdhdPMhk0Y6M2lwh6JF6ZugUqKgRfKXg0BfzYsV5CV+bUpwA998nPFiFMo/jYWfMu
         olHi7ULL4DbHowCmf4/dxNgW1P8vgxpwntXlQnXpvUOReZ0bVIN6IS7CMdYJbLny6Jww
         EhZDnjioKwE7Bse1N3kUDTh4Wl0DpO9oJoxMG6w4JrPaXRVrO/c7Qk33RcGu8aBapbDQ
         DFmQrU+cmH8lHUXKi+X67WAT/819pWxgVyTqTBRPy9lP627w0s2aIIBspE0U3WQr1/Rg
         EphA==
X-Forwarded-Encrypted: i=1; AKwUvBxfdQCLeEU/ZEYQ2PxxvQAQ0acJpYdKeWQbbyuA6SVIsqEuwCbbmG3UD6Ba2y9D0gIsv0NnGDUxrPDI1BU=@vger.kernel.org
X-Gm-Message-State: AFuF++nzwNRsU4E75kRs0l9WJsa7//qWICWmM3K+6kp/3IJz16Cbqj1l
	lNgmtHiW5nchNd4PmvU8Ego6kvQ6tvWuxK08eXh1Ie8Kq1LOfSk8ekGs
X-Gm-Gg: AYBFou124xUA6cUgDP68xcJPWgYr6mCI/TFqISg+RlB03k2bvwU83vQDtffLlQoQlte
	Co+8tsH89MqECHGZ1Um/uGTYiqLoD6SGtcjQarVN6V9dyA2zN0MV256ob38TbdERga+OOF5zDYb
	jY4kuSf3lXwqtGX9fgqpBv5RggWkLM+ca4OcxdOJOqnqS8hRDhu5mG7gikGScqYFtjzaR4QnreF
	FrbZkhgZDUD4ExCHvdyTT/eLkMPil1sUtnVTVQzfGWzQIYr+pCoY6TzYlTMhN4uI9Ro/UejuAMk
	KzlO6iLK0QQH3INA8Tu6e2cxrmWdltzxJj5OrC+oIQFz+j/B+t+/z5AzRwuACPKZdI3H8/wNT/C
	mN1/VuLla8c6KFFt83ampx72/gZFNRpSypd+AxLOWKU38kbzzG5gm0kykLhFboIguihhCocP6PG
	ukeDyPvaTBqBRKuYAhoW2K9BMz6m9SaFCutPunHwonG/nw8P6ta1d8/y3bMoN/otZnuVRPGTdWW
	DogmA==
X-Received: by 2002:a05:600c:3501:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49e6caa72c4mr23494585e9.4.1789219456945;
        Sat, 12 Sep 2026 06:24:16 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm150435315e9.8.2026.09.12.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:24:16 -0700 (PDT)
Date: Sat, 12 Sep 2026 16:24:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Israr <7israr.work@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock
 definitions
Message-ID: <aqVSfA_Ns_plwCpK@stanley.mountain>
References: <20260910124403.95741-1-7israr.work@gmail.com>
 <aqKzBTM-CdBqQzXi@stanley.mountain>
 <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>

On Sat, Sep 12, 2026 at 12:21:01AM +0500, Muhammad Israr wrote:
> On Thu, Sep 12, 2026 at 12:19:00AM +0000, Dan Carpenter wrote:
> > It's supposed to but it is buggy...  What prevents multiple
> > threads from reading comp_vdev_read() at the same time?
> > I prefer to keep the warning around until someone fixes the
> > code.
> 
> Thanks for pointing this out!
> I traced through comp_vdev_read(): list_lock (the spinlock --
> the mutex field in this struct is unrelated, it's only vdev->lock
> used for V4L2 ioctl serialization) is only actually held around
> the final list_del() in the read loop. data_ready() and
> get_top_mbo(), both called earlier in the same function, read
> pending_mbos with no lock held at all. comp_rx_data() (the
> rx_completion producer) does take list_lock correctly around its
> list_add_tail(), but that only protects against whatever happens
> to be holding list_lock at that instant  which today is just
> the list_del() call. So nothing stops two threads from both being
> inside comp_vdev_read() concurrently and reading/deciding on the
> same list state unprotected, which is what you were asking about.

Imagine one thread is calling get_top_mbo() which reads:

	list_first_entry(&mdev->pending_mbos, struct mbo, list);

but the other thread is calling:

	list_del(&mbo->list);

It's a race condition.  We can't delete two at the time, fine.
But we also should be trying to read from one while it's being
deleted.

regards,
dan carpenter


