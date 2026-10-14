Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744931E84F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013203; cv=none; b=oNHjaIj+bxTn9IGZhs8I33uKW9y7VBm3n8YvzPWxQ835sRVfD4KjEIAzEoaLq9Dpm+YUy01G1wR42GkwFwm7KICiA2GBYWKMuTyamPVytT3a2Ldwy2idyMg4XHIsbIG1dfCqBFmBZsX6NwX0YBBMI9KFVpHkPMDfNCbAnZmcdjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013203; c=relaxed/simple;
	bh=+tmS02gDA463BcaTtTeQCviX6MTFBVXJ76TXlGdnOMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhFgY/xZvoH5JuTFij3XPDcIXJ8X/F7/PjzyPTGLn7MJ5ar6zGwm5evvc/2NeNymGkuOf9xwTh6cQRPFxdZ++UEplZP0nn4B6tTjW7G6OfciLMd0AkTRcm4rw561krJ3UNdusoksATe0qAJz4TkWjQtSdX0j8mvjF1omwvwF0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eDUVeyO3; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eDUVeyO3"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b834592afso35578556d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792013201; x=1792618001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgefoZU/7a8w/FLm1udAZKNsvens6D/F+qkIP8OB5hQ=;
        b=eDUVeyO3s9Qc5qzmBBBtDyb7LXpY4L5s0xbNXEnMuoyEIcbTp+Eqs6shtp6K/sOngZ
         jUdEXS449bMwREPxD8bsNOYRUaDOoFXX6WPoVNgkPRwZ5JYgyeDSDYUOuwsMsu1uIdSM
         my/UgugHixpUY8vKsG+R4bYmmKw6OHOYOylYD8NfajpuaMNHLwb3wC/8fsBWyuxz1lgD
         0tY1IeCnMn3aMEEWuhwlO7HaiEnJODENfo9yE+Ihm5c25y0KtT0FoYoTV0BQiHj+Q5JJ
         4yRNxI3ff22Bdm+tG6rXyT6nJnuqzG7n3SnLmbaJTOnHpQAusvasrB1ZauQjT+E0u0VI
         QrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013201; x=1792618001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgefoZU/7a8w/FLm1udAZKNsvens6D/F+qkIP8OB5hQ=;
        b=vh4fCWBn1RI7Z/puJZR4kIPW+Tq5vSB6jvgT+ByRqHWgI1Y+S/fCiwujic1HMDwXCk
         6X27tl4WXT+JbEY8cHODFsTaT/wE7n9m33mwG5enUbDOtJXKNPIJ8bLizomUqjETe17k
         8YoIQXe/GjYDYEJCYoJVNknF10V4HOSU7WDiDxrq8Xa6apaWOT0bEaoMGqnUCR7zqQLy
         6J1WQs2l50uYLOeSKLl98qBC0lgBRqjH/CdYExKjxr797AaSAgAfaLNtZSinlRSxKEZK
         q1VhT7/4FD/NX2p8c9zJQCj6Me13qaH+ONc+ALdK2tc3Kr/8JF1mgSGi3gjDAV3Czkzt
         VFFw==
X-Gm-Message-State: AFq9FYJ9L76GpJVQayTAOymbTayBGBsa+qxrpt6p5Ph58kq1JqsjZTiq
	R8HSHNglAdEQbuhdeCMH2Fqmh6jjHnm1iptGTRsOMucHQfY1y0oUTT2yCfJVjENcOP5wJ5ZVlCU
	Y/ni92VQ=
X-Gm-Gg: AYBFou0Sung3xApJKt9VVXDuojU6KhmShiP8LBekA3YNNiudXT0JV2hLRzQp3lphNIb
	+bCpUuKxdwHPHz8u7vQxHwHXScDjrHHRiXFP9lGQZeargcEFdTBNx4JYqiuXQLrxoEbsxt5Rves
	NJW1jiJeYooKU26ENtPFJK1YuEb13Wf2kRgLcDEt6ryGlQpvnEVByj8vzVSndaO9sBw3jy8EdCl
	VJdtRmlrcUcYglqMrqX8HxpImXl02M50RdTJWtVYRzItxsxkTPngoXH/CRhNDXwQ02R16FZ/aGN
	KhzBGAoz0yGChoNwerBu95iyimk7lmwhW6edS79UUxKs4xNS9oLpBCcOK6Tnm1tYZFZ/cFYu4hT
	rs2mWOMXQSSsGLrXg0Nu2s/0XFtNuM+b62zZnywx74x92uyD+IwUiD57b5vjy1Tuwcq2bY/UrUh
	kOMW0UiRX0LBXV/0ExIcm4sdRiwm2ouV54+rAwb7dH4c8JG0JVCv1OzC+QTZcgYoxpebnGjPeFS
	FKQD3m63OS3cW0GDoNDh/91VsfDvKWN0jNuVHU4utw9cpE0Q4Ls2Ik=
X-Received: by 2002:a05:620a:40d2:b0:93e:4d07:14db with SMTP id af79cd13be357-93ebd1e0133mr2853002885a.24.1792013200873;
        Wed, 14 Oct 2026 14:26:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm62808216d6.32.2026.10.14.14.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:26:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:26:38 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org
Subject: Re: [PATCH 8/8] selftests/mm: check that unauthorized MADV_PAGEOUT
 skips large file folios
Message-ID: <as_yViNexNHzdD7l@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-9-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014175756.2035176-9-gourry@gourry.net>

On Wed, Oct 14, 2026 at 01:57:56PM -0400, Gregory Price (Meta) wrote:
> A caller that neither owns nor may write a file may page out the COW pages
> of a private mapping of it, but not its file pages. When the advised range
> only partly covers a large file folio, the folio must be filtered out
> before it is split or reclaimed, on separate paths for PMD- and PTE-mapped
> folios.
> 
> Check that partial MADV_PAGEOUT by such a caller leaves every page of a
> PMD-sized shmem folio resident, both when a PMD maps it and when a mapping
> of half of it maps it with PTEs.
>
... snip ...
> +	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_PAGEOUT), 0);
> +	for (offset = 0; offset < pmd_size; offset += page_size)
> +		ASSERT_TRUE(page_is_present(self->pagemap_fd,
> +					    mapping + offset));
> +	assert_filled(_metadata, mapping, pmd_size);

Sashiko reported:

  The commit message states that the folio must be filtered out before it is
  split or reclaimed. Since page_is_present() only confirms the pages were not
  reclaimed, should this test also verify that the underlying folio was not
  split by the partial-range madvise?

I'm fairly sure this is a false-positive. Splitting a file folio unmaps it
entirely, so the page_is_present assert would fail.

~Gregory
