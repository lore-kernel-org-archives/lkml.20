Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8822425B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269200; cv=none; b=XWyt5+h3JM2KiaK7EGylnYUqeItJUaIYCrYnUnouRAP44DM2nc1XSNpWcipizdibvkUCpUUHveked5+reAxXLPEosL7d2a7QvoLJ0hPvaLGJ5PpFhVTjnE5Qr0AcQDVRx7y+LnJOvBzLET538s93765/VLEXbPxiMN0Q28A95kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269200; c=relaxed/simple;
	bh=PlZFNT4DSHsplnw5ObQRPTaQ6kHLu1/oVOvgaR7oOYc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PMds5jyPcDUNF3varOV8KJDEncq3wAJSTdLkn7oB/KiJzLhmyceRRfV0GfVYflYfEgpMcgs8x1cFmpm5soIJOJ/ltjJre0ouzHLANlyvJhK29JJXleVEk5dGio0RqpeBz1yivir4jT2POm/kQJfhjg8EQEk/aOdc8DzhUJpnMY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nczwjA+I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nczwjA+I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso1786585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269197; x=1791873997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdJK5FuNUR00hsXJgZNxiTMk9OAmiaJF7mlmoaqH+4s=;
        b=nczwjA+I+1+PpNUHPI3vkEsihEHuDIQhPzi5e1fOWwYzJ801P1g1uL4aC7KqdK4mi4
         DP2C5yqNL97CACLPCw/FZTSiY6qw1IwTknZu7NOpJ1Wo1XDYPH3mxJ7xhNmSKe70OcG9
         B7h4jeFBl2pX4Acqa1XXqCfvmaQrtLs/tnxE7KaJJwBUoZ/GMJ3w6b0GmMtBcOd39ZNl
         MGec3UhI6qUVGOnz4WIO4AW4DX1Wsb1+emiJQSqhEIIQpmPkM6MkWi+OVIUIyjENZU8Y
         e2kRf7dQV8Oc7gzY7xN127hIbitgYDaotJ+GrMMs/s3swHcAHy9YdnYBF1nrSxh3DPxW
         +HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269197; x=1791873997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdJK5FuNUR00hsXJgZNxiTMk9OAmiaJF7mlmoaqH+4s=;
        b=Uc+qUyLAlHer8LxUFw6J5Xu7JeNplfok8yjJHQeIhrB/wQTXvFQ6C2jL4jtcWTXz75
         f+l5OEfmJMdnsXAYnnRhAxWdaSFExXxZM8MW7qGT9a4Eh5MnPFSfnyZfqyyJit6y4He0
         eHTWPQz4OubckTygRpa74csnzU9BG063ppRhxgks1wHRBY54u0nB3YH7LQhteA7oEgzc
         rxcZQ6ulfKcCCFNu2yPHYD3qxxkgE7DxrBuZ/E3suMqkfI/GPjxNU6OgU3es5bhDl1xK
         GxiojB+6AacGnP98hUqNyj/49zD8DB7juwmUt4lAACp6N+2GX9oJDCVCr/7ykKFGp568
         I0bw==
X-Forwarded-Encrypted: i=1; AKwUvBw+UFmuCm5/DrHQ+82S4ndqZFRBODEPUp8KQ6v6fbusse6y0unedQLkwP6SDBUeZ+euBNuzV8hg6pdiJeA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDjDjgDWrQ8Mn78xPhxPW9dyIAuyi4bR20HxFgCOdafOfoA8xG
	QnR0zsPJ4FqYeo+fX/zrZiqZxR7rvqIIcjdZcB8X9Ps2736lq5Yuh9/C
X-Gm-Gg: AYBFou2c6RaLw2AMpbEWURu0u2kyHZ4LocsxoF790MbReMuAg+uAs0PBGXVFlOBGf5U
	vH12ueKKgdUumZVLZpygbMJhQdbLWviqyTug/XlNmbOxdUmcSAbmZyLfA0lGT8Zh7ebbSYZ18mW
	g10x+jjQd0sBXviSkc3v56165QbRxLDiPG8GIKFmJZqAHBZkRbWWnM8llY4spVl87zZylqWYJE5
	JhQkIOWzWfXJUYU//pnp6EwflhxxFnXsQ/Qmsvn9smLJ5QH83tNZPN6a4Cc97TLg7uvZxKg/o39
	gI3lpkWVxwJqu9fzDQLJk6QgfphznsDZGhzfPjel0TNsC8ybY/ZqqK5wGPlUtN+gmHrZPD2lpkL
	HIJ+vwGmzniueNGXllZxQppPdoETBlMzqEWl9O5jlPBtFwLnscV0+NvksgkQk5/D99kKNp6xW41
	8BJFpEatRfz5CUaOH6WvmgRPI7O7Lu6b81xD+GadlUc6fC3zShcXGGY9YBFqCzNy2pHUHPyp09z
	nAIBjB6SNNcbuh9LPLPvZfsPi3RVgPoV26p5Y6pvWFB2i1XCLu6+MBDlh8m9hWcCOPYZ/9Y7tgW
	TjvQnaeTDrWLVPVEXnjZFOScdCWOtQATS9os6gIhpfrOjuFjLz3KzfnV2+ZiT23TcMpGI+AdCzW
	3vBHDsHcETM8LyskCa3IEEwMiyIJwxbRbc5Lg6PAssmV6xZh8QcuWKaIhZvK3eRb3nVXlFiXeA6
	V+3xaeg/p+lxsHDZA=
X-Received: by 2002:a05:600c:4443:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a17b53317cmr9187395e9.5.1791269196896;
        Mon, 05 Oct 2026 23:46:36 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178daa115sm48960775e9.9.2026.10.05.23.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:46:36 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:46:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jonathan
 Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, Sean
 Nyekjaer <sean@geanix.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: imu: inv_icm42600: fix kernel-doc Return:
 sections
Message-ID: <20261006084635.00005bef@gmail.com>
In-Reply-To: <20261006045413.14320-3-kapoorarnav43@gmail.com>
References: <20261006045413.14320-1-kapoorarnav43@gmail.com>
	<20261006045413.14320-3-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 10:24:04 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> kernel-doc expects the return value to be described in a "Return:"
> section. inv_icm42600_buffer_update_watermark(), inv_icm42600_setup()
> and inv_icm42600_irq_init() use "Returns ..." in the body instead,
> so scripts/kernel-doc -Wall warns for each of them, e.g.:
> 
>   Warning: .../inv_icm42600_core.c:511 No description found for
>   return value of 'inv_icm42600_setup'
> 
> Convert them to "Return:" sections. In the watermark comment, move it
> after the description, so the description is not parsed as part of the
> return value section.
> 
> Assisted-by: LLM
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
