Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF343403F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174081; cv=none; b=aQ4HOc6cGJvEzsxoECLD/0LGKvijk97QexAfuXbzmmpSCUw2AQ9xtmI7Agx6TqVQOO/cW7kTAQT8BmCVrLKrE+I6eruDtZL3eZjtSZ18cYXFCErdqZ0nArPtqXTaRPUovkzqKSQDn7uKnJbP7n2lyguZyE0ksq+c35Zqoa8mdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174081; c=relaxed/simple;
	bh=gMwOWytVfApIXVwRhQgwzN6dc2QqsVwMDZxh04IVShA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPMAt75AyigfzdSXF4+7rRIm3/l6lxszbsSiDl3TRAgPHIWPegvBVNUVLP2e7+4mtSDW9du4gp9v/GC4EDRWrpmaSoLktxdcVUORY0lcMrMRGcCm0IzuOL5UPVUtksRYqz97osLCJYn1O7i4JiuQffvIYrvKvoCpYfwha4Kle6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMR8xAcn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMR8xAcn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48436668d20so754536f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788174078; x=1788778878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gEYWh1Hd21x81/OxUkfsA9UY6dgGKXw9bS5ohxjr6uE=;
        b=rMR8xAcnrAObbCP+4++lGpPVdF+KpN4icEjfZDEEKW3KLexjDWPj5+6wZDsAa3DOcl
         jHMxL5I6neizhlL1gKhrVkrNUdApVXWR+R0BOtg0Lsfxf3qsWXFMlUjUoqVAtMn8HIsW
         QKaHOwcrKusGgW7sVQBDHaASYqENn7cWLkpIeYT4uKsNogJdrBquSSvQsuqYm3rXndj6
         pF1vkv4mmm49cQwv+z5HPTBK3XhuymQkdIbF3v8v4ORZ//cTaG9N2ln1eKb0RENQw/h1
         ej7Doy0+g7Zm9IRfRLw3fbSi/WLhoFjp15Uhbx3TnYEsFSKfHtJjzdYvKQ9cdNHds6u7
         w2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174078; x=1788778878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEYWh1Hd21x81/OxUkfsA9UY6dgGKXw9bS5ohxjr6uE=;
        b=CfbISQmm6ApaqE5UkbKgeszq54RmV5y+NgXRoAzYYPCmMP1fm+98l6h5yqS7lIF3sO
         3TuT8NogsvFq//AyzweR+evbTmpPwNATk1J5Gp92KGSSiF5ZNyqn7Uz0nUNtdmV4bQKk
         /9IptbomSmThw+uH7N05Wmw3oyg2adcbOBSdU8vdf7qhxIgMDT6hw/NCeWdSMiH461qz
         bAPytXMvHjWU7je5tsixgo6HDqXj75AQw3acsewE0tDODLJAY4LRQ89KIsqMADWOAfJs
         JoDahLnqs83zH/I8bmP8C+qT1WPIJY4MP8SzcaZ21eIYcCcxGQwlj20EcTTIBX8Mbv30
         XBrg==
X-Forwarded-Encrypted: i=1; AKwUvBzp7K0DGZML7Iy/fokjdEu2mp5QgH4j61LCSKWPVUIGR38UXnTf2QJB5gPGVckRGmmq81mtH3MfkGSQzvo=@vger.kernel.org
X-Gm-Message-State: AFuF++lf0g6aRsl/kggVDlcO4JZssJAkKxaDZ7EtIjyxCL6Y449X0/32
	c7f2QrEZZAyhr9YZJvkUIEWeLdq/YnDG8M2y0geN9CNuxVk4FkkAe0Ma
X-Gm-Gg: AYBFou3G1mYLHR7aYmjDr6dPqJ2XC8Ts72/XYDASZkmYZuKxE0Muc7ekOznSVDiRjkR
	dDKL7+vfI2bZLwwD0KqfmtlNypO35Yg/bCqCEzyrbDmPnwm6RexeeTQpZhk5WzB9A8IJBhT3Kgm
	+PKXsEHY68t+Ro+SLbbZ1LHzGF/FTSi902bqMezqlMuP3fFGrOlvSv1fa4NZPUmO8CkozID3KT4
	2J168bPL6RTTROkqlSMUHoHOMvV6FoNd5oCVNj1cBTyVxks0530U2DWldxt6RPrWJ4uGD8SHsiN
	WWnH39cXkXExX+Tegyn/8LfXRysizgY8Z4Amhz/W3Q6PUU5LNRHjx8bw8DADaXZCCmZ1mYhi40R
	m5Trpa0yA0WjKKTXlUFcrviz2bIo/iRAU7nDmK/89/C89xJHfAZb9H7VwHC1TrWrNTprqOBJm5I
	F8JL6nKxG3m9NS/3bpXbiApBaxvnj5AmMOlyj2K4JRejEzg0o=
X-Received: by 2002:a05:6000:38f:b0:484:3317:a1a with SMTP id ffacd0b85a97d-48433170bb5mr25994140f8f.27.1788174077772;
        Mon, 31 Aug 2026 04:01:17 -0700 (PDT)
Received: from pc ([165.51.40.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843f5c4f35sm1726135f8f.14.2026.08.31.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:01:15 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:01:12 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux@analog.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: ad4030: fix invalid oversampling_ratio
 validation
Message-ID: <apVe-Gcp6MT8E9Dw@pc>
References: <20260824051026.11049-1-salah.triki@gmail.com>
 <aoxbJzV5OQ839gAN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoxbJzV5OQ839gAN@ashevche-desk.local>

Hi Andy,

Sorry for the confusion - my previous v3 email crossed paths with yours.
Regarding is_power_of_2(avg_val): following feedback from David and 
Jonathan, we agreed to keep only the check for non-positive values
(avg_val <= 0) to avoid the invalid ilog2(0) call. Checking for non-powers
of two was dropped to preserve standard IIO attribute rounding behavior.

I will sent v4 addressing all your formatting and style requirements.

Thanks for your patience and thorough review.

Best regards,
Salah Triki

On Mon, Aug 24, 2026 at 05:54:31PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 24, 2026 at 06:10:26AM +0100, Salah Triki wrote:
> > ad4030_set_avg_frame_len() computes avg_log2 = ilog2(avg_val) before
> > validating avg_val. The existing check (avg_val < 0) allows avg_val == 0
> 
> Try to write the sentences straight to the point using plain English,
> Avoid using C language as substitute of plain English.
> 
> > to pass through, resulting in ilog2(0) being called with undefined/garbage
> > behavior.
> > 
> > Reject non-positive values (avg_val <= 0) before computing log2.
> > 
> > This issue was identified with assistance from Claude AI and manually
> > verified against the code.
> 
> > Changes since v1:
> >    - Added note stating the issue was identified with assistance from
> >    Claude AI and verified manually.
> 
> Assisted-by?
> 
> ...
> 
> >  static int ad4030_set_avg_frame_len(struct iio_dev *dev, int avg_val)
> >  {
> >  	struct ad4030_state *st = iio_priv(dev);
> > -	unsigned int avg_log2 = ilog2(avg_val);
> > +	unsigned int avg_log2;
> 
> Have you read my comments to the previous version?
> 
> >  	unsigned int last_avg_idx = ARRAY_SIZE(ad4030_average_modes) - 1;
> >  	int freq_hz;
> >  	int ret;
> >  
> > -	if (avg_val < 0 || avg_val > ad4030_average_modes[last_avg_idx])
> > +	if (avg_val <= 0 || avg_val > ad4030_average_modes[last_avg_idx])
> >  		return -EINVAL;
> 
> Ditto.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
