Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594563E6DC9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826025; cv=none; b=K3Gd0h16YrokYCQ5D63fI9usfb/WIY5En7hh+8+Fq0MAgP6OqwcEcTejKJVQ2W7MkKunDMaWa+z9u3qWOwRe43Xs3gWMMMCe3bbMJSFKiPSmaFnbHtHx/Z95SMcQzGdFSbZwSnReNU8iyu7G6JNXlHfhxXEsdcf8k8+BHysgOgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826025; c=relaxed/simple;
	bh=uyj41NdzjqFdtF1mTXfNgjv5XKkpGGT0Dwj633J6MNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICBFr12Rz+D7O8QJjAqYkTGV9rISOc/AThtFcP1vuK9UYgoBKZzCSo15+Oos508ypLWNiX4pye47wvTAhgVrGUGB+dtu2BYUX6s7brgr4jXM6a8wFmnP2IeTzbJchqoKBkkJhylwiNCyHT/QEMgKM8vM0im0VU8PclCteVjemSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Anu4Cx1G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Anu4Cx1G"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so10917325ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787826017; x=1788430817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHN2hwBNs5IN9u9eTuIPZ9+qk+rdBpKl5uG/PvdzHEc=;
        b=Anu4Cx1GFWAkzLncVqwej/h0Y9runcde1Lce6ERC/v5hvQkR9j6I1rNyMnSPt3XcFq
         wHGH+JRW39UlbcyLm9OrfgFWWiexeWzMC271v78SZd+8ErSnwtJ9IqhyPttkhJ58kD+J
         lv6KypesyOlnmln3lvAl1fDqx80QLwTGXKOOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826017; x=1788430817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHN2hwBNs5IN9u9eTuIPZ9+qk+rdBpKl5uG/PvdzHEc=;
        b=OjEG7zthMALa8ePkG0XzfIk71fwbdl3fEEUogEZg0OvuxDe3jDsElYkn9XZeKjpuPP
         2m7UioS7brV1IuOIgqdHf84fX6dLHzEhPDAkhvgKMltVAbrgoNYYtJ+dBfFWprt2gRM0
         IszeW50YG9sVOVgtvYS7Bf+bkhhbJrM7jYH3nZyNTNA8xnx6LagIgwSpk8F8B9KW78ZL
         QDCNnqgQKneQ3mk6hdruyfVO6azLIqxU0+YlCBjATuBZb4TIUa4CAhc5CS6OC4TpI+0w
         tF7Khk5laXQ5lIl7nfZNFvXblv5zgGTpIukCBIZyAogOsqMZ2SosZnOJMvPivmB9X4N8
         FF6w==
X-Forwarded-Encrypted: i=1; AHgh+RofAk8NAH3YT6TZOPMXfjjkxUV+VWH66oVYnELTuSTSr4iF86B2bkpSF1MfkyZMZEfRW/3SWmmYQN1oNcg=@vger.kernel.org
X-Gm-Message-State: AFuF++kQeJWObtrjdP/LAxyeuWdhibM8CBYScnvFDhAcFgVMsPe53Jml
	2M0DdhNLxFhhaN/6HcCXOoDq6+Ez29zn41Fmmqi4ZDf21bYijEzw5MgsDFDhXaEyWw==
X-Gm-Gg: AR+sD12byh6HQiha5UWldBj/afAz5kLqiIYmn8XCvd+DE57Av3RMVes+rYucSbMfHU4
	wSvCd0Gm7+VUvss0I18C9C+WoN7Wpv9k5Cqd2JyCEpW1ejo2c9DLe3qrvlLOYF1tCavVXx4vh6h
	9njX1YJxvXRZODZ7RyPuyXzg4pxyzV03eYMDpxzTDH5wxX3F3ig1+wvOri1GDGgn+IGhOd481xZ
	Vd2F9XK9F0OOBEsu+MzQ7QoEPwBUR495huThxYQrXR4LBXzSWdDwgis54Pprxrpz2W7VUhFc6WQ
	jOBocNaPK5mYd7lmdYJip8UVmcQ9TybjwAL6SRWndsvtvvS5rRNAhA+lQvbuuU/6PiHZVqnHxG/
	FY+tPnGcFvBYVa9JQt8S68bDmlL3WAyRJtFrzl2wVMN9W5872jjZotZrgymbVHdFE+WyF2j6K0N
	xDxFUYIdYoGz4swMpfkFMm31EZUMjjpzet/Wd2IsCz3FZIe+NKF9KDlqvhuUeQIwEY7E/XaK0Oa
	QTf/YnMeiwiyBZrHPkvqbqBABY=
X-Received: by 2002:a17:902:ebc7:b0:2d7:3c80:aa02 with SMTP id d9443c01a7336-2d73c80ac0fmr57449955ad.10.1787826017452;
        Thu, 27 Aug 2026 03:20:17 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70493f729sm15576855ad.2.2026.08.27.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:20:16 -0700 (PDT)
Date: Thu, 27 Aug 2026 19:20:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] perf/x86/intel: downgrade alloc_bts_buffer() WARN()
 to pr_err()
Message-ID: <apAPNE709y7724hb@google.com>
References: <20260827065529.3835720-1-senozhatsky@chromium.org>
 <ao_gFsBR99s0sUBT@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao_gFsBR99s0sUBT@google.com>

On (26/08/27 15:59), Sergey Senozhatsky wrote:
> On (26/08/27 15:55), Sergey Senozhatsky wrote:
> > diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
> > index 8940f0292229..29c24b2925a7 100644
> > --- a/arch/x86/events/intel/ds.c
> > +++ b/arch/x86/events/intel/ds.c
> > @@ -918,7 +918,7 @@ static int alloc_bts_buffer(int cpu)
> >  
> >  	buffer = dsalloc_pages(BTS_BUFFER_SIZE, GFP_KERNEL | __GFP_NOWARN, cpu);
> >  	if (unlikely(!buffer)) {
> > -		WARN_ONCE(1, "%s: BTS buffer allocation failure\n", __func__);
> > +		pr_err_once(1, "%s: BTS buffer allocation failure\n", __func__);

I guess also can just remove it altogether.
