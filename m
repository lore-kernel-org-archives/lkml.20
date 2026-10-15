Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1D214A619
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025467; cv=pass; b=MX+6gB0w331Dgd0kzIx8v/bF2c+S2cH0wRVZnMHZ8Qwlc69+gXSw/7lJ1jNploXCpo+uPnDuC1TFCCNohFafkf2pq2W+Mbzj7WdPx0BCpWe3EGEio3v77okBg411dDFpQLvykEWYoSZp4EUlwvhI8843dlaJt6MNBHXt+VIIA6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025467; c=relaxed/simple;
	bh=rUkvizF94O7wbkK+B9hI74UD1HRMZ0AGrNVXGILC+RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBqmLNQIXlYpaacDCGQsVuqT/bFQ+Hl4op9+159RDbeSwBWeZluoeZ1u8+mB/l82NtoqX1T87ErSp4nr57MxDA3dJGxQPLKimbF4F30m6a+sqceWyxJ29wqZuV3twqKtUTgFKYXKkq0J2QGXsoECAfLahIYNtV2hmFMtPn0CQJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqe3u7F1; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqe3u7F1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so1474163a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792025464; cv=none;
        d=google.com; s=arc-20260327;
        b=jlE35ucHLgGFdE7w/ZGrhquECOuo3igmU7KqrZEoBFA1ZZSob24+7YX70L5SSs0exA
         y4Tp7dR0aNA6fx7KGsbQGj5xvSJK1CGKPdVJqVZG4G9EbauMwQ1WfiWFRUs5IZBe4ZrT
         4wPss/N5fmUprciB/0nPmU+MwTbaNUozX4FIMmX+Yg1VQZzbZWqlE83UC36UUDAEr3kL
         R7il/D+AzIkgWLWrkDVY/Ewro6mMfJGi9b3s6HYiTVvLc4UTubZVO+yx9LL56vQaPOTr
         TbkB9eDHhbNpLMivz1N19b4rNyQofq/6dzOGz1ojyT4RMZSu8etVgOAo87LDlAI3gvuX
         GAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rUkvizF94O7wbkK+B9hI74UD1HRMZ0AGrNVXGILC+RA=;
        fh=0rs7SMRBnc1+bZ2IPGXqvgLd1iLZMximhO5ZDFM5cq8=;
        b=PlDaPza0fpvz2T4XRSU07PCmuecZ8R/EIAxa8RoHc6X6F3i/DyJdTTsJAQ4kthFycW
         ogspWp/WrgipiK+EPhRrQdS1lljouiHhhYRA5OdlaYMRLJ8vQDWdXR4Uinn2hlIyltfU
         5V8OwVhPBmz/pqgj4HV5l9XUzS9Zz4qig7RZs/ZLs0akIdyd/A9JThgRt1XFQnasb2Mh
         EWtMJ8Rg2FU3/gQHDpZxsMEaQt3ZCG3t1jSWHyvP+V2NjjQ6hYE86jliIkrlLLylvTdO
         OJ0FY6/+crmdcAsdp4C1tVoIpkgZCX+NQalMLdeFWkXP4j/fPkY653zzRE3L10kQU4uY
         mDXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792025464; x=1792630264; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUkvizF94O7wbkK+B9hI74UD1HRMZ0AGrNVXGILC+RA=;
        b=kqe3u7F1CV6N529svEOlto8w8CMrL3ZdH6WPeHe0XSmtomVlV6N1Ps3qCeBMWTaTAp
         jcqyRPIAf6VkxX36zZ77fdFs6Scum1Ae7Kyxzc4hkFsyUc2W7ENxPKx3v2EipYVb8xzK
         Us2xlg6QdAQ7ektYAd6zmguPktr1YwwUCIa/HZI+q1/V41Kf84dsbPYETJvUipwB0eG5
         pOU8ffjWOAw46Q0Uwf+blUFvUpdF3TIr0qT26lJYC/AWFOoD9nz+uEtsvjLN2IUZNh0i
         5RNm5yniz9Btej0bQLeMUWf01j3GCTASHc5P5kOj8AOCWfJJ9VlCC995EIXzMCGEulPf
         3dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025464; x=1792630264;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rUkvizF94O7wbkK+B9hI74UD1HRMZ0AGrNVXGILC+RA=;
        b=BV+7uOi2OAXhHwjOEcqpyEoyDPVOTTgJeRmWDaZpEjORqA/HooGTGj7ClUl0Rludmc
         OkIXVPg3+JkfsWZFJbLDDiLDgyQf7OyX8OdMzHu7v0RTZiaWPfhSQERgatJ2mqSqLfyG
         lT6W9Rvb1FqE3VUx9AX8EqP3SEYH4NzzGQX2jANF1UeALekgdNhThSHj67rZ2hI/Kpza
         2FMw6dJjIygPbUD1XDhQ3E45kT5AXcNT1hRfQqV0sy6DI6nb8vN4XvbBlmYjd7mW1q7H
         gr1vv+jqranhmT25CCLld+jlbef04Y8iDZ1dUJw6GGIZgOraLiJLwMQ3m3MycKx1zwOZ
         9Ovg==
X-Forwarded-Encrypted: i=1; AKwUvBx4LDVwHqTaa15LVdpmqwl5dC+ENp7lCL2xgkjLxAaW/i+RONaZyGhAZBl5X27scd/HErICxwQFiw0X/aQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUclzNlMiaqQr9Vsv6NxF1Ol4NNp619okLxXIfisBwFx/P/RWo
	VzfhwofZWHb0vsXaqLMZhN2VDwYwxTO4fxPJh5+1kI3GDCMEDaXfrpzGfnuiTk7Yp8cLpti0cAf
	QGE0Bvyj8tR2d5dWRtKYNA+ZxWJFybGQ=
X-Gm-Gg: AYBFou2oTuqxmOqyKFObI01DLUMv1bmV5/iLyGryTBOfj3hVzW2s9fMFnMiSOaWMSUa
	BIeWhUO2kepJg3M1lBe3aVSNyCwB0oGGvxJTFtgih/cKoBNZnv2C7ZnJhr3H0JTNsLslZKCuApc
	OSFflJnQyRBdPelUrFaWCgzrDMYS6KYfNDHzN4lxPRSjYTkf2fbvuZAS8HWsQ4L0VkF6ePB+aOp
	l2w7sdLj7ooSFHqM0T/sgX/e00uzCaUHFmc6iopD6fW+pvl9RAWppmIUuMt0+OuO761PCBroaGN
	9i53ATiiIXMTJdp3rBj2Zvdbn0CYNKGttXoQf61LOLpmDSI/suKl5kcnCl94bvNT5XJj7bxNM0P
	jgGNnJDZ2sWjY
X-Received: by 2002:a05:6402:455a:b0:6b1:e8b3:c3b5 with SMTP id
 4fb4d7f45d1cf-6b1e8b3c65amr4467054a12.6.1792025464368; Wed, 14 Oct 2026
 17:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013165814.3092559-1-samarth.colleges@gmail.com> <20261015003412.GA13920@nvidia.com>
In-Reply-To: <20261015003412.GA13920@nvidia.com>
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Wed, 14 Oct 2026 20:50:53 -0400
X-Gm-Features: AclHuK9892uYyXNXapLy9aok7YxBXJNaRdpJfdG1a3-YNrgC35sKsdI5-DIcB0g
Message-ID: <CAAbz3fSE3cnjRXcdQkx9EPuQwarhH+XasQdaEvh6X8eCg+osQQ@mail.gmail.com>
Subject: Re: [PATCH] iommupt: report the whole contiguous group in read_and_clear_dirty
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Jason, that makes sense. If it helps, I am also happy to send a
v2 of both patches along those lines.
Best,
Samarth
