Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1232470F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926083; cv=none; b=FJ/Eu51tyvf8z6HAszPYhS8eX9c2ubeXarWPz9NYAvywSKpGik33DGCoaQBQ4giIpSznObzmHbR3zNV4+Uc1sk2Q2Ej8JNUyIn162kLTPV24E9KlGKwANRaVEYJ66VuzDSxkXnaJjxH1N+Vip+g7Drem8NnDOL2s9ueeHpKjMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926083; c=relaxed/simple;
	bh=Xiqqil3lhejwyFNGntLSKdddo5jmG4i9c0LXeFp46Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVHTcrU9UVSVaADMtIXmh01LmwI+77Q2hJbCrU9uZXJOFsaQTVXwTRxivO1Ek0GXfdRPmzpFjdOirdXl2f5+zmj5ENYrMDil59HJ9nIlzfD48u6y+aSV/OJuHUMGorjckCmaJ+sc6pgdtx5A1a6hJN/oy7fmXKHhvQ5SzsBgbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyYE2PGp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyYE2PGp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so681263a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788926079; x=1789530879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVrTOgTm+0hJ1CwNzLVTB+HsMENUpTPm4cRxnxEzp5M=;
        b=fyYE2PGpd7Dqs6n9aQhRMp1NWC0tLWkohZBECp7gwZfuLcxvO4pOrIeLG8DeCFLtx4
         INa4UNxjSJbXvah5rrz29I+40M87nieoJBwiSmvWX5PPUYO7+adhQP3i5i7NKhPJRl9K
         vspiPmS/isVMomlSyXjvFxRn0NCL15CMtlvCBGJUfDAFjIbhjCGDlC5KRHVLf6jI2HD4
         By40N9Pye/HJnroglzUX8c3JfHweKM1W3v4f0TQtxQqFtMppUawEluIh1ZhcNiosh58a
         UrAsBxVapXnCCy1jKlVhthNO0Ph8JX/rxEeihdmMRCe/h32fvsYNdlw5fQkrsVVqz0E1
         Hy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788926079; x=1789530879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVrTOgTm+0hJ1CwNzLVTB+HsMENUpTPm4cRxnxEzp5M=;
        b=Zv3xqwwTRrmbzOsBMnfpODid9fboqtDCdPn2VDSvBlXK0K0r9Bya5uY7MOBALVmcV+
         If+x4k9BPB1YClLOnPwtqupJ7skE/wzxbQ9cR47xw2hdvQdvTtofnI6tW3DvcQxqnAvU
         ddZYGN6SGFLorJ9KaMKxG4jnmPbErQmC2gG13WikaWO19/tlbLaQjr2B0JRiRHoIvCGg
         zNDdEKotyHKoSosiDSUd+IxF0enEwCmgsyNtIdKWkP9wY75AQD10TLk/719KtPViNy3o
         b0EGXpyKjbJej8oyZdr+Z5BqsyI+Q/wEv64yUsdcKvRmt0qXGf6945RsrhNp4rSARfXf
         RFwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcLtDZNjGn3g95MOhbrnpCJGangqCvFgiTNqskdMptr6+CqjhSa1ftZD7KpvMRee/E2mb67/PbCSCzEvE=@vger.kernel.org
X-Gm-Message-State: AFuF++klU34j8CWO7YuM12SyUyKVKyzatmR17NPdof+t+NGpH6+ZhJYh
	bqpan3t8jphLKQEUZgMFXFoTvrBpjPevzFTyiau1jJtnwvYw4MoXC4wuJM2nlO0Iy6w=
X-Gm-Gg: AYBFou2tC4WSVilK0EQiSP6nocb4pRS5V+/3TozWOU4beIbjxDuhuhSA2yDWWq6SIud
	Lz6rVTfr6v03wF9uKw9ac0X4tuF14ngaLfULWRsbQJ1uI/XQwhtwWmzfaXFRlQ/vua+mfaSi22B
	VZHn9WnEzFJXhYBSfX2DYzgjMegcmZJT3qrkJC2ljCug/ftqFDRrkn2AfMDfjqL9lA02PM/mogD
	WjshxFf/JUGSjnwt7Y7zcT/3HkeZTZusmVu3efBCyQfWkIjT4eufqiGWak9hfOkatreI2M+gvI9
	v/d7onwSjjsJNW66FRI5whXPkjpWtfPp6fZl+64pAooCxbVywvMqx6BJomMPJa89U6jJ7GTtwOx
	s961ELgAh7rYyZ0VsFzTMenaTz5zkWVXB8kebmzpDaw75ST7KLvyCNjL7KTx2O3K5qor/ZZoAuM
	UJxOdIqfD8v8Svg4l7osjMir+B5b1tHYYhRkeVsov7J+ZrwRIS9YxeJPOxBPr/c4WR6frxaftSX
	S9Vq5ic
X-Received: by 2002:a17:90b:1c01:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39b8bc95819mr8444097a91.1.1788926078043;
        Tue, 08 Sep 2026 20:54:38 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm35037781a91.0.2026.09.08.20.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:54:37 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/damon/tests/core-kunit: improve nr_samples_per_aggr test isolation
Date: Wed,  9 Sep 2026 11:54:26 +0800
Message-ID: <20260909035430.2432886-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908133651.96278-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  8 Sep 2026 06:36:50 -0700 SJ Park <sj@kernel.org> wrote:

> Hi Kunwu,
> 
> On Tue,  8 Sep 2026 14:36:35 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:
> 
> > The damon_nr_samples_per_aggr() test sets both intervals to zero,
> > which exercises two different fallback paths at once.
> > 
> > Use separate compound initializers for each case so that each case
> > tests one fallback path independently. Also make the overflow case
> > use an explicit non-zero sample interval so that it does not depend
> > on the zero sample interval fallback.
> 
> Thank you for sharing this patch!
> 
> > 
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  mm/damon/tests/core-kunit.h | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> > index c01e6a75cad..ff23208c181 100644
> > --- a/mm/damon/tests/core-kunit.h
> > +++ b/mm/damon/tests/core-kunit.h
> > @@ -627,12 +627,20 @@ static void damon_test_set_regions(struct kunit *test)
> >  
> >  static void damon_test_nr_samples_per_aggr(struct kunit *test)
> >  {
> > -	struct damon_attrs attrs = {
> > +	struct damon_attrs attrs;
> > +
> > +	/* Zero sample interval is treated as one. */
> > +	attrs = (struct damon_attrs){
> >  		.sample_interval = 0,
> > -		.aggr_interval = 0,
> > +		.aggr_interval = 5000,
> >  	};
> > +	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 5000);
> 
> Thank you for adding this test case.
> 
> >  
> > -	/* Zero aggregation interval doesn't cause division by zero */
> > +	/* Zero samples per aggregation is treated as one. */
> > +	attrs = (struct damon_attrs){
> > +		.sample_interval = 5000,
> > +		.aggr_interval = 0,
> > +	};
> >  	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 1);
> 
> But damon_set_attrs() disallows sample intervals that are larger than the
> aggregation intervals.  Hence this setup is somewhat unrealistic.  Should we
> set sample_interval zero?

Good point. 
I checked damon_set_attrs() as well, and the `sample_interval <= aggr_interval` 
constraint makes `0/0` the consistent boundary case here.

I'll update the second case accordingly.

Thanks,
KunWu

> 
> >  
> >  	/*
> > @@ -640,7 +648,10 @@ static void damon_test_nr_samples_per_aggr(struct kunit *test)
> >  	 * overflow
> >  	 */
> >  	if (ULONG_MAX > UINT_MAX) {
> > -		attrs.aggr_interval = (unsigned long)UINT_MAX + 1;
> > +		attrs = (struct damon_attrs){
> > +			.sample_interval = 1,
> > +			.aggr_interval = (unsigned long)UINT_MAX + 1,
> > +		};
> >  		KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs),
> >  				UINT_MAX);
> >  	}
> > 
> > base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
> > -- 
> > 2.43.0
> 
> 
> Thanks,
> SJ
> 

Sent using hkml (https://github.com/sjp38/hackermail)
