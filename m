Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB538F938
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765584; cv=none; b=Y/lNRqlMnZaSZx52R7enLvqezQHZDaY1oL9DASPFVTGXpzaNh0ZnP8f2glzyscA4FiwE4TZcZNSyWeZiAcOegSQ0u5C1Fv9KVHdxWGdWatojBsugfGBbAzku5TDVVRqBSYuDV29nvXmGfjKOjoHaau1EenV18B+7pwyIInN3FRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765584; c=relaxed/simple;
	bh=72SRx5dQmS01bTMQVm/HGfMNhXBTFVXE4RIoO8me+Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTaA4FDtJelPfg52Tis6CYf2u0hJvn6glh9pQlQzS17xGoi1t4rYoJegCeY61VGSQvk8ltW5X8MRKXFoyxO4yJfLDPb+UMgeJtcDhVBXg7zAHlrtomP4Iq8pw7SeRabwlehnXAHp+lbQy0DJoGgD/ecFSXLN4jATIu+b1w05pCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHlgXuHd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHlgXuHd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso29795225e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788765580; x=1789370380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n21XKk1J4MiPxr+otl4pfstKwkgN0uVP1mEum83myf0=;
        b=lHlgXuHd5QkgQcQ8kS6RHOC9sjhsZIZKoFEJpi/XYiuSOnss5XycoJxRNDqLbLgGT/
         lbPf52HnuRgGGAif/HWT8DvC0eBQ0yWabMfLNE7fL/4A07sdtNghLE7eSAtNZ6pSfM8i
         YtjN6pbZUQ/Qe/k8E4zCA/1NbnDkVcth5oI2Q1nIu2ml8iJ0G6CfBBAc8Tcy+ce1e20t
         W3oH1ugk+cCIUYNi4vP2Czy324pjUN3BCjOR/63OTaGGNRr5WL/zrvdcqk+OxwjRVqZp
         ECSyafuoxewcuQOM/Oq9En/3FFAPp1XNP0gQzifWFneRN8FRRMR6OGazycCfgO4PzSU+
         TNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765580; x=1789370380;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n21XKk1J4MiPxr+otl4pfstKwkgN0uVP1mEum83myf0=;
        b=Fxbpcr6NncYv+zuqA3+bd4+KvVWXFvLfxXGXRiLCdQfW0ZtWUX8kfFqvEBZ5le1Mo6
         wAclyqYPu7586YLyH+KWGKGJCCU8hJvzSB8rBkBSa3OKjmGXQ37bMWQevDY8xuuTXyl0
         3+1f2YaqTVfbMts6UBg6dk+AELPaNIZOd9DUfQqwxfQlFKR8oa0fgsgxfXpzoGkSAr6Y
         MlMLfBJD/tpLHqj1cmbP74SsWam+V5zrccJcD1PM30Bbiow/asi5QL5W7AQYwqO8zOsH
         zhVjrRt5hWrr84H9Ndl57s8D9oq4oShJTotChkM+YaiWM1+TYeB3q383TQUZnrRGaQCT
         7PFA==
X-Forwarded-Encrypted: i=1; AKwUvBwZge5ou/bGpV4T7vvMpEp9kLNuYf6XXG25Dw1+VmGYsXXfSVIXG10BlwPE0p2nbBaUNiE+hIzsLV+Ie60=@vger.kernel.org
X-Gm-Message-State: AFuF++lcaPsTGwP1lz7hehKZOfBi9X9nZ6zIYc31VyZwqQHQL1T142Sh
	RVQqI8cFNff/+mjQ3J1Z9RTG2CaAZ691BKnbS0gOdpP7n6X3g8c3CpKc
X-Gm-Gg: AYBFou1MJb1uZY2OGbIWlPRScyu0kWxPDLcSSUdLof1d3QwYQ+NyC+w+VAzywQUqUgs
	USF8whVjxUri/3X0on2DhC8XHa61jdWXP4FDa4GY5g0Id77UIBZoJmzmF6buBtdFDSQKuy7yojG
	S0N24B4SkQGM+9P8y13/469PkMiluDCR29VPwrlPxQ0SLBKnA8+1L8WYp8cOljpxj4NNvujMgP5
	4EQ3WZxlmOf8Kmnb8iP8ot76OYx7es/ghVESg2JwSrsZksKqxhFSMaYRb1JGUY0h/lzOkMF/qPk
	KO/XZNqeED9R5cDlSk1AKENIiLTV7NKvY406rqgRlA4ChlJYD6LJIcAJ50lXVAj2epsQrh6BQn5
	nCwX87T7+UXav4ZO2zyZGYfEentvGt3xubIY2XpZyLdf9YFcw3ojByf0zcXDiLW0YDKidLaFWw3
	Zxh1sAvoLSMk/as/5vDsgg7MufijAMf22JKY9OQuj6pkQlhq4NLJ6bSH9yhrBTX2aKTNlNwk+uc
	W1dioNk3EEi42SOvEujzZNKU/aMcsEtdSl3oUj82WrQpgoKy+NvrnKkuj8A2li2qf+PDLOCx7Cf
	YRKLnXYK2Bm2aquw49Qm3+7Qn5FHTR4Y3Luh9uR3q320cDzhc7dttIe12GYV5R3Cug0EID/Cfv0
	8AsOsAjS4ccOA7lcVLQj+afEUT4W0zPqmmZwhrE9mCJhWvq5YKwujaN6fNij3WqpHwXoqvg==
X-Received: by 2002:a05:600d:8443:10b0:49c:fa20:cc09 with SMTP id 5b1f17b1804b1-49cfa20cd42mr139379245e9.32.1788765580299;
        Mon, 07 Sep 2026 00:19:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm324187735e9.4.2026.09.07.00.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:19:40 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:19:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabio Cesari <fabio.cesari@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: light: isl29028: fix runtime PM reference leak
 on error paths
Message-ID: <20260907091938.00006748@gmail.com>
In-Reply-To: <20260906223737.206730-1-fabio.cesari@gmail.com>
References: <20260906131203.125407-1-fabio.cesari@gmail.com>
	<20260906223737.206730-1-fabio.cesari@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 00:37:30 +0200
Fabio Cesari <fabio.cesari@gmail.com> wrote:

> Both isl29028_read_raw() and isl29028_write_raw() take a runtime PM
> reference with pm_runtime_resume_and_get() and are supposed to drop it
> again with pm_runtime_put_autosuspend() before returning. On their error
> paths they return directly instead, leaking the reference.
> 
> The usage count is then never balanced, so the device stops entering
> autosuspend for the rest of its lifetime. The effect accumulates: every
> failed access leaks another reference.
> 
> In isl29028_write_raw() this is reachable from userspace with a single
> rejected sysfs write, for example
> 
>   echo 200 > in_proximity_sampling_frequency
> 
> which is outside the accepted [1:100] range. It returns -EINVAL with the
> reference still held. In isl29028_read_raw() the leak is reached when
> the underlying regmap access fails.
> 
> Take the reference with PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND()
> instead. It is then released when the function returns, on every path
> and without an explicit call, so no error path added later can leak it
> again.
> 
> This also stops the result of pm_runtime_put_autosuspend() from reaching
> userspace, which fixes a second problem: that value reports whether the
> device could be suspended right away, so -EAGAIN or -EBUSY turned a
> successful access into a failure. With CONFIG_PM=n it is a stub
> returning -ENOSYS, so every read and write fails today.
> 
> PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND() is v6.19 and later, so this
> does not apply as-is to older trees. The adjustment there is to keep
> pm_runtime_resume_and_get() and drop the reference on the way out with
> an unchecked pm_runtime_put_autosuspend(), which fixes both the leak and
> the return value.
> 
> Fixes: 2db5054ac28d ("staging: iio: isl29028: add runtime power management support")
> Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for < 6.19
> Assisted-by: LLM coccinelle
> Signed-off-by: Fabio Cesari <fabio.cesari@gmail.com>
> ---

Please don't send a new version as a reply to the previous version,
it breaks certain tooling and workflows (b4 for example).

-- 
Kind regards,
Joshua Crofts
