Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73DB48FF97
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990442; cv=none; b=Qi5dpEEEWgFQdBz0e/tu2RfZoCc8bKuLQW3FlW6uMwKHvvaZuCe2QyQXa+8WvqRpbmAJWDSoOa8U/VOBy74K+3Ah0BVS3/04lydqDcHFXjf/ySEhBj1sm0AqES1TduIQiputwb9E3ogQI8a4AMsxH3b3bGWvUWuwYNd8zsrbOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990442; c=relaxed/simple;
	bh=igMMVzyB0kazDBf1FCrnS86fOSdJceOcYZNYKQsRSwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKkcCrgDAypiPl/r/ON1RjORcowyiY1xmq6vsvFdcttQs/D/NP3yGgVkHmjnPETCvRvj6U3o90Jdkjd6JjCHrBzNLURm2NvlD7SVYTYm3loVxhAaIawKbBZ26n+H8hgeDEQJykXap0RB+dyhYVPQqLN4wLGewBFE05rjuSWQp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF3LwFfF; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF3LwFfF"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1624585f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990438; x=1790595238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AlSfZ5SyLA7gnS311aS5PZjku8Ua3hLuitk3rxSYlQg=;
        b=WF3LwFfFXyWuYmq2whc2ae97AmMrzq/jDIrAP4kyu+zgmGWXXaSAArmji8OQfhouxb
         j3HJazSeYnzF5rpOPmuB9EN1p10/5DoUjEy7Dqe8BuoaCvo7R0F73qu0SCX3/7EAsBSh
         cNwlSIh2Vhqo+RopxNtQxHneUj1rAWY6uLhUa+8EX+tMtarH9z7yp+ucIKylswfkgJzU
         mfkatn1g5TKgf94WVksalmzhhW05AuzeRJfNNj+kij90ogrhQnbZsjUwDj4nS0ORpBwh
         T1MtMg6rMJYA+175eLuOcihfaJLpqzjYvXK+sIqTv7Kgkq22dJ5lIewUKwT7J/3OgvCn
         ZY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990438; x=1790595238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlSfZ5SyLA7gnS311aS5PZjku8Ua3hLuitk3rxSYlQg=;
        b=qCmVfBEQsH8vjEcY4IMNcE9NT88jhfq5HRWaVCH9rr57DiEpH7bfm3JWjdgolAejNu
         vVd1NaXDHItJoT1Au0VXmfDs3MxhI5AyhwLjv+VZm5kGKuFny1JHcp1Iev3vMrChHQPk
         2WtoedM3QJx8aw/ovGQlvONXDpuoT3j+ZBTwktlxGWXVvMuB6fS22M7wU1JT3CyhiBwb
         wkMT/+YOlN7yvZn447mbFldvAggu3sJDKzeeKXmjbOzgcjEYj29grjuFy9VrSMfsscHB
         fphsqXnMm+CaK8w1yHeSM8pQvfjWKqjZNt9ns+29Yt5msRfUVbyP2yuIcExlDMRnehB2
         AOeg==
X-Forwarded-Encrypted: i=1; AKwUvBytoZbCH6KAcYOuyGflPiBnD93/jeEcuXNVzIT/CEu80NPJEIAkjXHS+niF2z0EPOMVOsXE4SPz6l9zOpk=@vger.kernel.org
X-Gm-Message-State: AFuF++nlYFW3bguTXsU+k3aw9OIbICuuAU1amwA0G7PvktV20feJT3v5
	zc3gVx8y8O0XFmZNORx7tY68HoXfIjpGLS3ZvO4t2k6/ZRcSpu/08iKT
X-Gm-Gg: AYBFou1Vx0otN2vQxeQgdi+vZ1zglo8f1xlEJ7DcEeAZB36BYmq/o2/iFxW8SgdlsyP
	rBVeqcNehlA1i1kb1EO11toplCn+/fBfFeAhPIQiJ66OGxN5HqAqCSvkMf7Bb0fEYEMlY19OAGh
	Tsex1jjSgj1glotVoU5QTKV90GVIZkKu6j/Ly84+0v2I6ZmKfFGw4HOxNv9qCWZh0GwmQPNysUM
	P7KSRWvoziJ+anSQs23BGHulN0Ml9MxcwDxnoy6to3ysyboVlTWxyaNrD1qoYAHd/m/gaj7PkOU
	WctJ8B1X/Dlz/RttKfAwlyY7LMjpYsL03apuOQlyVuuqWYrq2M2jFZ+ZBI8jWBtsPlKcKncd1uH
	CA7YQZUPTyVpCYAoFSY+1FQ2TMAdKseakmwh9+mQ8MQtIZpmRS7JFccctWqQg1DzqjJZSObyCN0
	gjiI6GSINOark3QEFQ04Snbq1INo/uXc/8DfFX0mbRkFVdmBVmNofBLqyTh357+WL7BnU4hCxrE
	fO1/vd1e8KqMg==
X-Received: by 2002:a05:6000:22c9:b0:486:fe09:6918 with SMTP id ffacd0b85a97d-4871e373ae9mr15558359f8f.56.1789990437762;
        Mon, 21 Sep 2026 04:33:57 -0700 (PDT)
Received: from iv-work ([193.43.9.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562bcbsm24047359f8f.16.2026.09.21.04.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:33:57 -0700 (PDT)
Sender: "Ivan A. Melnikov" <ivan.a.melnikov@gmail.com>
Date: Mon, 21 Sep 2026 15:33:55 +0400
From: "Ivan A. Melnikov" <iv@altlinux.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Francesco Lavra <flavra@baylibre.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: tools: Use proper macro to detect _Float16 support
Message-ID: <arEDbA8fIxR6mrZq@iv-work>
References: <20260918161305.1161852-1-iv@altlinux.org>
 <20260919113945.2bee973b@systembl0wer>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919113945.2bee973b@systembl0wer>

On Sat, Sep 19, 2026 at 11:39:45AM +0200, Joshua Crofts wrote:
> On Fri, 18 Sep 2026 20:13:02 +0400
> "Ivan A. Melnikov" <iv@altlinux.org> wrote:
> 
> > __FLT16_MAX__ is an internal compiler macro. GCC defines it if
> > _Float16 is supported by the target in general, but the support
> > may depend on the exact target options. For example, on i586
> > without -msse2 I get the following error from GCC15:
> > 
> >   iio_generic_buffer.c: In function 'print2byte':
> >   iio_generic_buffer.c:141:17: error: invalid conversion from type '_Float16' without option '-msse2'
> >     141 |                 printf("%05f ", ((float)converter.f + info->offset) * info->scale);
> >         |                 ^~~~~~
> > 
> > To fix that, use the public macro without double underscores.
> > 
> > Fixes: cdd445d4b2a9 ("iio: tools: Add support for floating-point types in buffer scan elements")
> > Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> > ---
> >  tools/iio/iio_generic_buffer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/iio/iio_generic_buffer.c b/tools/iio/iio_generic_buffer.c
> > index 000193612aad..9ea93984e0e9 100644
> > --- a/tools/iio/iio_generic_buffer.c
> > +++ b/tools/iio/iio_generic_buffer.c
> > @@ -131,7 +131,7 @@ static void print2byte(uint16_t input, struct iio_channel_info *info)
> >  		printf("%05f ", ((float)input + info->offset) * info->scale);
> >  		break;
> >  	case 'f': {
> > -#if defined(__FLT16_MAX__)
> > +#if defined(FLT16_MAX)
> >  		union {
> >  			uint16_t u;
> >  			_Float16 f;
> 
> One Sashiko issue:
> 
> Does this unintentionally disable _Float16 support for all architectures?

Indeed, it does. Sorry, my patch is incorrect. I must have completely
messed up all my checks on Friday.

> Since the tools build environment uses gnu11 compilation flags without
> explicitly defining __STDC_WANT_IEC_60559_TYPES_EXT__, FLT16_MAX is
> undefined across all architectures. This causes the preprocessor to skip
> this block entirely, causing the tool to always print 
> <unsupported 2-byte float> for 16-bit float data, even on platforms where 
> native support previously worked.
> 
> If FLT16_MAX were actually defined, the compiler would still parse the
> _Float16 block and throw the same missing -msse2 compilation error mentioned
> in the commit message. Is there an alternative way to check for hardware
> support without completely disabling the feature?

Apparently, the only correct way to detect _Float16 is to try compiling
some code that uses it. For that, a feature can be added to tools/build.

On other hand, x86 without SSE2 is the only platform I could find where
__FLT16_MAX__ is defined, but _Float16 does not work, so a simple
platform-specific workaround would also work and would be much less
elaborate.

WDYT?

-- 
  wbr,
    iv m.
