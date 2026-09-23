Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53347668E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199125; cv=none; b=TfBj1oLvREfMhvfOEX/f1uvhDyHbTQAii1jUdhbSAp+Wa1pCoF0TZ+xYVdb8mzDiaZ1i6PEyo5aaZnrMvF47emPzCVlKegzkwLBauuJPmTDg565gdg8Y0bGZt5uOeA3kyoCcZt65C9yEb2duhJU6oib3Lq8aXZ3gvnEK5Gj1wWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199125; c=relaxed/simple;
	bh=yqwWpK4N9YeYAJC00jfG/KN04unxyF4L4b45axRv0cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lch3p0Bj0dURdzAOItlUeL8IY+1x2cn8LzwhKp8nE8MCqr2W1+rhZvby4B0t02mTtGavAqb3XhrKGezEUKrjiFE2JQxZqtcuq86tQ9wGZf3bzEmxZdoj8J5EFutaqtPz2i+RdOs38pA4YkGU3Kcw8XOEL5TyPywhLSk5kDfPTTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rS/+wDoP; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rS/+wDoP"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac8d1dso16942657b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790199120; x=1790803920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDp63aNNvlo+CbPC5AYf50weUXwD55oicYAOt2YPLqw=;
        b=rS/+wDoPYolig2FICJsL6XwXIlKtMB5Lunw4Hx6BWlj0fmGdUF4Rr3dj09iX2IZRL3
         J0rKAB930jc6NPDnpFIUKCYXIOn5kzKwi2wpSBWcmGa8iTGY9zmvjD6+YueUktxbZDHI
         usbT+MDVDJfJdWVkh3ZK94GqQ/odGH+G2D2/gskt1sEGc0ByD1Pl0hmlBqUZLVJ8YElt
         gf6nmO9n8C5eTdkTjiZd2jVd9i1XdAMVXX3pt0dO65R58xp1VndkhjaYJj3/txSaMgYf
         07hu5Bv2nmoX8gyTinaqcUecDDJ4ulYErQxFrUyp20KI7IKUk8mNscb2ftmfByaYLNPS
         yhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199120; x=1790803920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YDp63aNNvlo+CbPC5AYf50weUXwD55oicYAOt2YPLqw=;
        b=HKp0i9yjxxkifucuWojyTLJGrZNBQf3rbVCREcAMwCE8J2xZDRFHKpuvK5wQXnlvIm
         1c2Vv3khq9vRbEqCShQnr24BOVbk/pR0j0SbGRgevwqjHKaLUfOa1V7VGJtbBRnpoYnX
         0ZeKjtL7PEVhwD9TXb3qWzAA0b/kgjmNsuA1IjMn1KBkLPpmywUw/La6LPc0TRbmd0e9
         0AvGpw9ELK27L4dR61psg1d2HrrsuhcgxlhchlBddMnchH+IFM+XTAyLjF9S8EddomkW
         5R5uRxSxGImup17MPn279H3lKAt8Ej6ekd0/n6hGDVqg/8ilT+RSQos2egI7A+pjNpNn
         UY2w==
X-Forwarded-Encrypted: i=1; AKwUvBx9NNhbsL1ugq0hPopD2TFD2Z72D0MDOmOgvFNG8c1TxMwIKEOmwKe+Yah6bXhggzMMcDPg/42CYLJ/sDE=@vger.kernel.org
X-Gm-Message-State: AFuF++m3mOmL1mtd1o+rfLRKFFEHc66j7tQ8OvgTK+W//UsR0Df2ZTfU
	700gHUh+yE7D7WgplJVtnB286wys3W5aAEgrnDlT9AILDtXZtRpbrDIZgTo21qBKftA=
X-Gm-Gg: AYBFou1DpPXJ53deYYwLdY7l6svfgwaFfGdMzzt0JsrH+vWzs1j6QKbDJ6t8vzgdtbB
	QTbflEkkHw1oRZLnxzFoiSUuukXdxEiwVDIoj/QZJKXgXvMwMtlv9L3AcEIOs34WhHndZxOvF/R
	TfxoVhXtPU3so6cTVY/JjVIJW/+cux94x4Ce3Xv32DaPtOv0Q/jGvVyb6Qx2vyKHQqqzBD7u/mW
	4TVMhgGkmxzzQX4poBvQyxRHy9O3zY0pgo/uGJmMRDPEpcIcMS9aZ+cqbJJmgaABEuVnXyuV6NL
	BgyZxK6cTi2DFOB1njc/0MzEhEAOlH8KNPr6xzrqcG4qBdGb/PMZEScV3AHYWtaRsnUuCXhBVk9
	jjHcNtNDcchXOigxRVAj0Ds00gKNAlfsGk3n6n0KYm4gobpEZF9z1+KIIZ1BzQKvj+/9wNG5u3u
	wyUuvV/svVXDJ26xW8rPnGfEQO2k8gbGHEGiWkT8kZartLzyDEEeaajghtvw3J0k1oeq63ug8zF
	/ENlPSR+dfuND2xMep5msyDTZhF40SIhHDxY1x0rdnqk4KNjyI6lEAEWAR81tKihA==
X-Received: by 2002:a05:690c:c507:b0:87f:c20c:67a5 with SMTP id 00721157ae682-8a649d6750bmr4124377b3.29.1790199120690;
        Wed, 23 Sep 2026 14:32:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2474fbb3sm319077785a.6.2026.09.23.14.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:32:00 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:31:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Message-ID: <arRFEKD8hmzTKFNC@gourry-fedora-PF4VCD3F>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
 <20260923-fix_khugepagd_fail-v3-1-b387e92fe1a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923-fix_khugepagd_fail-v3-1-b387e92fe1a9@arm.com>

On Wed, Sep 23, 2026 at 04:29:51PM +0100, Yeoreum Yun wrote:
> Although the child process in collapse_fork*() or collapse_max_ptes_shared()
> reports `KSFT_FAIL`, the result is ignored because the test only checks
> whether the parent’s page was collapsed into a huge page.
> 
> As a result, the test is considered successful whenever the parent’s page
> is a huge page, even if the child test fails, as shown below:
> 
>   #
>   # Run test: collapse_max_ptes_shared (khugepaged:anon)
>   # Allocate huge page... OK
>   # Share huge page over fork()... OK
>   # Trigger CoW on page 1023 of 2048... OK
>   # Maybe collapse with max_ptes_shared exceeded.... OK
>   # Trigger CoW on page 1024 of 2048... Fail
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 23)
>   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
>   # Check if parent still has huge page... OK              // parent hpage success
>   ok 24 collapse_max_ptes_shared                           // considered as success
>   ...
>   # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> To address this, propagate the child’s failure and skip the subsequent
> check in the parent.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

