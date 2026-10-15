Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810114A4EE5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792047839; cv=none; b=tx9CGNSCnf7X7BkSopjCN4/tpyfiHlNxyrv0L4NNkgOPxWz6etUTDAM1i76JExaxFkOiOufH+VRJXkywGZ++rLFVa0Tmh7h3lGExmmQ/TqX2BW3Zx1NzmcXqgcY46BVlFqWtF/LTtknFjjYJaRGdi54M2ZSKLLtcc9dXSBq7mQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792047839; c=relaxed/simple;
	bh=YH+ljlbj+7YXt8V/106ea4EkaH6+7QTpER8ynX/uKVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBMEr2Uoy4BWZiUs7JHYYljw1++RrBZszPriChC5SepvD23blYuj85JscNX+f8WNxr15nw/yuaEVmJJJFSMkk0+EDnBV/KIa5sLQyWyBh3ULJ0HKKL/vL6+0Ksns7tNBOEqTutqLWyjpM+FJDHxqliv2U4axMgiy66kKj/YrFao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spKdn0e0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spKdn0e0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a17baef589so15081425e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792047829; x=1792652629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRc1d4pt3qQo/WdkDK7cDhZYT5ZdWLtpTnmXMIrJlP4=;
        b=spKdn0e0uG/N550Z4RIZg/YsgMqHf2RWuTc2FoZoJXOIQrdTW51uUzrXS6bQnqoK5r
         WXLOfB7Z1cRcvyI6q+QprmeTQ+wOhP59B7Fmspvcv8sk50ge4O4FlJbUIMbKZgVZClQ0
         bTTDwwMsgHblIP3ydPHD4ViQucc9uFeDhYDb1dJrjEaDruJeW/fDjrqzUO2MD6ZB477w
         i+oE6f/iayQkQhx/KlM9zvqJcHtUHLONT8hF/jC51GW8Ko6mULdEVSFE+Obn6OPoRdhQ
         CupdlgjQxNH7P/U8S53OisBiBs4D9RI6PIikG4dNsGwkPieDCkPAjiAs61xnCa5iDL9+
         iKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792047829; x=1792652629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRc1d4pt3qQo/WdkDK7cDhZYT5ZdWLtpTnmXMIrJlP4=;
        b=Q4jMoNXkxVLXUFNWC9egNtePZzuJpXpRpXMyLjokN4D0Thu5V61Na1jNdhkL3BG9FF
         cHd/9W/9XEDWIamrai9TDxbpqRNQr7mmM6IjCtlbcl1qL1CajXQiKILCWnlEvNvNwnnZ
         xbBoMMmoImAnwVCzONAY6pCOyenEoLOc9oz2ywpPoS24NNRAvNgmn1jBCjfKezQGRllS
         ISDXQ3jcxWke0iKAVaw+c30oB9cqRg37SWluucQiFpPAm6UI5HBBwnhnyfoM+sQLgKmV
         M32dJIXhljs5ac5l8UoIth8TkrtCbqmABPzF53x3rtLog5DRMtEd14DrtDnqsWehFI+T
         yL7w==
X-Forwarded-Encrypted: i=1; AKwUvBxu1wSJSPGHQCPWEt2625HppzeffCOuMqz5P1nwArUUu8fGKfWGncJdQVdiNWSNUgxNhg9kPS/JrHLTZbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9WWM+oUr083Gd96xTBOR5YlEct44rQFB8zFKeBCF8Z11BEjqe
	HwMQ8H3GBohGp5RqRZ6lRUpDhSZhlIDNkZefpfJqvpHDvwAFE69f0bdM
X-Gm-Gg: AYBFou33r/ugtR8b/MuO1VJV7HqbOEKUIgD6fygtJtPWQzCmkfwWI19J7/KAKNpQOLI
	1327QzccN1Qx7kXyQObfq1QCsQ5QE8tzOdCVBUdVBTwgPDD4daLQ9p93bRBiY3vgwTJETxJRpG4
	ahvgwTMKXaaiJCnv3UYwEkbAPNTBkogvVo0qQuhGMbHU8oG/DLHCk3QEFgGh1pj6lmbiOEj/fsw
	/Mc2MMaY3cUEWxeVEt80iBQXxjkQ69lP7h+6PwTQJ1gNY323FbHgLUgS5PnmoEFelQjkRdAyphx
	x7XPxhfvfT8MmnPHS0uF9vUQM2rlydm6B36ZcmfafqnjW9DrUS6Vs3ZUZvjjFLoGi5f48KFQx/o
	ffI3ow3bYCJzFwyEWuJoIC6OFYp1CzBUtdwdaejHjIcbasUpsUDOlei03Dd5eeHRSmFZ0ev1+xd
	PJ6omdKnnh8oM4RbTO/Jty3G9ztEmLdcTNL9tLDYNWkJ4ErQIaGNoV++UnVgiHncHCmGtrGlzMh
	vvS94iUCj90to7snqICABPqlRCR/TaeSEua3CtJxZOjgwa/3B6Ke8AgIOZZfHTW2xut0atrgi8+
	Wkapn0GWr9/HseVCBYhlaElsv0P8M+j0V4428JvUW0MxkDyP1wDnbO9P50wD5o8peKEeXeK8Rhg
	=
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr404160705e9.17.1792047828269;
        Thu, 15 Oct 2026 00:03:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm48374825e9.4.2026.10.15.00.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:03:47 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:03:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
Message-ID: <atB0hpxP2UwKCUF4@gmail.com>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
 <8733u8w6p4.fsf@trenco.lwn.net>
 <20261014233956.605e0960@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014233956.605e0960@foz.lan>

On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:
> e.g. the ones found on distros up to Fedora 42 and the latest version
> on that time.
> 
> to be really sure, use "-f" to test all possible versions.
> 
> (*) even with the simplified version checks, ti runs for quite a while: 
> some versions take ~20 mins to build docs.
> 

Thanks. To be really sure, I am running the full A/B matrix from
tools/docs/test_doc_build.py -f, also newer Sphinx versions and the
Sphinx 9.1.0/Docutils 0.21.2 combination mentioned earlier.

The endpoint tests have passed:

  - Sphinx 3.4.3 / Docutils 0.16
  - Sphinx 9.1.0 / Docutils 0.22.4

Both builds complete successfully. There are no unexpected diagnostic or
output differences. Changes are limited to the intended heading
restoration and warning removal.

The remaining matrix is running. I will report the full results.

Karl
