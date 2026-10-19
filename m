Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC44DA9AE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405248; cv=pass; b=jktK4jOsNtbIPuVFDbYjAkanZGXQUvVk7BrWbgr9iAxzDteu0zZLvsq5wcq3S8M4ND5YyOo2IduyiqLXvsvztxOcDaucy19ciHDFhitxAtM9kB5fJW6/Lz6ovHw9+LzgbRG7CqaVsO0wQy9qRWdAfm3iwFsQH5xJ1edipgvxPEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405248; c=relaxed/simple;
	bh=R9GKKyHyrEzYJ8lOebrsrQB5EWDn1ZlGynlJDG0M8VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzY8ym1Ti0dq2l67oEb43R8K/WvAzt9vUFNbEfUQP6KLjhfHcVyblh36J0akdJ6se6yTexK4/AjJZYict1Hn1H2Cpqgb1CqI8hDEPsSA7mgyALvHxKTAPJ+87yFERmC6gIDEjthr/r6ytvEz7pGxEDVC5iSaJajrwqZ+lhvqOpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lk7p0PwW; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk7p0PwW"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48e9476e26aso487494fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792405247; cv=none;
        d=google.com; s=arc-20260327;
        b=eF5KqXcxRaNdrTpJsG28WW2KEHGvWtn+MK2O0R7MnZoY5WI4UXRghcHZo2LRWVxBds
         LzK9ZNx8Lhn0LNqmpTxokRfe5hENUajB58rbDqhbKgVEakRgKClckEH6iIsSksoyOu7v
         0z6AsDVWvn/fYqY/vE1U38/5DwUuKfizjScYGnCyBSLpb6oFMpTtM383B9Yi46wtwxR9
         +d9Y3ITbfc5Uei2ujUR+ij/5ehj80IcIZlwuoq5bJVTQl9s+wc5R3C3gcjFOFgsAwNDL
         cZVPJML0Ymx3nAnTHKv8A0M7+Dbn1eScShDKEKx7uUZwCRgskcnYOJnDdlWTm25pjlBp
         Mc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R9GKKyHyrEzYJ8lOebrsrQB5EWDn1ZlGynlJDG0M8VY=;
        fh=BtN8RmUGNedH+GoqMIOHGhCpq8jdcMt0/BtN++1/tL0=;
        b=KKcpZxe3XsAJANRfnm8XSRjwO50gfZZz74XHxDzEt91osNIjXG+d7kiHVKhSp6XyXK
         QqmQwWcXLAQkWGXYCRpN8zAIatgd9BJRLaV8+9AsxnCnA2mk4RfPzU36C91LN/6Pg+ou
         5vrnlo+cH2EbxiKZCfoQn1rD0u2bKZ5KYhQFAJlppNnI54PKBq8dN6RowCr6L8DOjIwk
         WdYVaHA4917IDE7x7dlJfdpU/mkV3MCOyDXb84bFNqtI7CLsqMGzU9IFthyHJlxJUF0o
         XvY9ex5kYqH9F+Ob8HPTVXGztAmdUo03Lm7Xlu2wXz/RglkTQp53wKsoIycEPnxKLny3
         8UlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405247; x=1793010047; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9GKKyHyrEzYJ8lOebrsrQB5EWDn1ZlGynlJDG0M8VY=;
        b=Lk7p0PwWsY0/aBbpzkmJDgOihuRjPSpon03h1M/0uRq9TvxUrfve2r9IugLM8XrBOV
         YMR80n+DMTTB+Kipotcp3ynb1KxCho9IYNTUsI3F5BbbtrAjLzng2SUYHe4QMXpPTXtw
         nTS8daJioIDDf6Yb0GYxqOB7BRmj5woEKKCdhhhnUiYpwkVkrEkQU8NEvRBXfZ0yIQ0Y
         aDNskbjbCYHg0P01oYeHKbG+srWV9bjf9qLLa5ywqc58pcxkm4Jz7Mcq3sAjJPOK5LQq
         giaGBHS12XNxb1i/qkhm5Yhhc9P54ZlVSpIbNn7lwtmLP1Gl1MHZZ7grp/RoYKk5+IPe
         U0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405247; x=1793010047;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9GKKyHyrEzYJ8lOebrsrQB5EWDn1ZlGynlJDG0M8VY=;
        b=YhyrvKbMTabNIDOxCrOqgMWjoxdybqtnliGNvTeeZgvAHrMu7mt1t6iL6VPBy6Hczl
         U7jppJFm3+EUSxUysVr4B0d36EPdUf/dziUUybHHXPlGfEKDv+Did2v0ebBVOm2flv75
         icVEirtZ3COI2EKHDDNdQXncoBmfHDHVDiiYMoE2q4tSgSaxCxL9topnThSR8NoM/WIu
         7D2PjnV285/183JJLxZEcD11/nnea3LdYem9F28/kOPBz2HVmmP7wF04MXuCkHCYI8HB
         HFPFUKKcXVwQ+z100ci0J3hCE44ro2DZtA7+FTaqMSHx25oqbpKF7EKqiQkqwRtT8t+c
         QWDg==
X-Forwarded-Encrypted: i=1; AKwUvByo5UHGGrlQcUn8APXan/H+CMpWKWkBxJTFs4iQ6EV8pzxZLafyb4FdyTYpJsZSUqNoG0afRLTzz1lBlpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4KcKkf2v1e/w5TaymmlJED6pxk10gVBmJfiqvuRpq37zYf/KA
	0usZfRI19UirMFFdKAG0LoZ6Vynu+Kb/boS8DnEl8RKlxcXA3WnqRPZ0IO+jUFJXMM0F/9RYLcq
	KkODthI/VTVbhi6OIMgk/WSFOLPpsRV0=
X-Gm-Gg: AYBFou2ejfJqSxUganpRwOHTgtxLvH9qSv1Rs3ywjKUqEi4BRgUNJsVBI3Z9CT/rT7/
	kWLrR/M5cR/STAIM6GArm3JLN6Qa//rCQoojt324Zd9ETlyAJTP9D0ijgZvbnPT8/xvtAa2ws8e
	AsZEiQ4Kz7E3zW1AjocDOtmVJBSWbSmg7swsTfKAh5JQ6BXo474Y5CQbzaxSyK7XEFIqsKI88WQ
	5rnJHZgFv83Mev3tcbGi/WPFINkEVbpsMbny5ywUTXtfimowZ3kbk1M40sdS8DpwQpVlNDwtZ9o
	fnLBjcQm056+PR2PZTGBeTZSOKX0KsaTeZwNyeZn49noTXvGg52suxNzew==
X-Received: by 2002:a05:6871:54b:b0:49e:402e:68c5 with SMTP id
 586e51a60fabf-4a757beacd3mr6077913fac.59.1792405246754; Mon, 19 Oct 2026
 03:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018143108.14750-1-abdelnasserhussein11@gmail.com>
 <20261019040919.0381d31f@jic23-hlaptop> <atXkD3WIgaeamrh9@ashevche-desk.local>
In-Reply-To: <atXkD3WIgaeamrh9@ashevche-desk.local>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Mon, 19 Oct 2026 13:20:35 +0300
X-Gm-Features: AclHuK_ug4XLdkqieHOH7DEcJfHZ7qFB7S3j8b3XoXuD1UpBYHVkyu4T6Ha4JrA
Message-ID: <CANpqX3Y8Cf+ogOBeL9A+qMuHRbaAQ5Bvegt7SgkWd6pay3h0Cw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: iio: adt7316: use kstrtobool() for sysfs
 boolean parsing
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Ok, I will do it. But let me check with Jonathan first since he
already applied the patch, just to avoid any confusion.

Best regards,
Abdelnasser
