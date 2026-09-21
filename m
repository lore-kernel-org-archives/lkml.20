Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC3471CFB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033944; cv=none; b=dHjS7VpgEZzjCNEfP0xFuLlbLHW26hmQsdY7JwzPOxLWjUWa2gI/3i3uAkxwRqnOz+hisJWSPI2x8V/+fN1eXPZje6B+gfBa1tZhJm1eGJPLctbb6ZCnHOTd7Emk3iXSAqxAZ5thBj4O903taM5yCstJ9YYvUX2grinFHUE5n6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033944; c=relaxed/simple;
	bh=Vi0byBQ6eTPn8Hm3DwBTt1QuqWUnBnxfF9vYCnJkVaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uagV8xTiZBslH7fnacnqXy5iL7S9SbXA189V8mti2mH/s3c1HdajopXiAYwg3oNIsfjkX0WQnQ2ZtO6/K0sqf8gI+Z4ddayb6B68lqI0M5+ofI4Lau1AaYSFJjxkwRgpRvn/5YiMGZl4QK4qH9QCCopI5BJunSXYkHTA5iMuwqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dq9i+0yx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dq9i+0yx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8facae850so33105ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790033943; x=1790638743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYSc9TZJl70xsfiMBgdeHeiAhwqgPx8+5Bf/0PtU6RE=;
        b=dq9i+0yx4OjldeB0529SwpiRmpsSiXuJn0XMzfU8hPS0n8mTZI0d3EhPzuy5yjtk+D
         1bbf11wNsuKl4N0ZDZcYjkXry7OldA+Q3mIx+ZVwOqZe+ET/4p7ZlF/A12gL1HsStuuR
         jfpyoCKDpLO7W4Z4T6UgwVY0Z/Irs9mcNyvvPG6p92UPeqU3KJiS0g6yy+TPQCdjlv36
         eo9dHh5tIcgt6iocGVaKRwrOPeqimjr0Ddal2Diuh5EfzFsD2uQXlYt1MF7pkxZSFO8x
         voGBe3XSy/NuksrU4jyK0jdPN9phD2Ddf6ejWJFZEb43kKIXqLN3P/Q6bTnuGaoF36w1
         7e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790033943; x=1790638743;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYSc9TZJl70xsfiMBgdeHeiAhwqgPx8+5Bf/0PtU6RE=;
        b=gNG/ILDKy8RaLmf0Fb8Yog6jDVfAWyvbn34Q15iustc4vBbxVZKwad7R/cGiUQRWky
         kA1iE1BFb9ln1suC9Y89eoo82foGz/rrZf1p/1yx6cPYH3KEB2mwdcGFHFv4NgYG/s63
         B+AqA0VWH8U8Gm+bS1jXiJSlpe43SsuBcTmxAu/kbQme45pmtgeznGg8vClxoDG5UMGP
         w1HF5m6WpcMxSebxIfXg+bCcxBHpZayYLlIgzS+kYHsvd0C/THzdNUMVdnBhbybKPoEN
         sU+/0/0rWA//wG4+I0S+gcRHHA/PqqU3LIYrPqZyA3fiP83n7OcPnT1+O3+Bk2yw1gb9
         BXug==
X-Forwarded-Encrypted: i=1; AKwUvBxajI4lnakFusJevnrcU663mXW7ZzSnDPy16AiNq5L68nymeouUIrxsDMAqS88TPPB0tap1BbUi3ABXfgo=@vger.kernel.org
X-Gm-Message-State: AFuF++lYJIAezUxJwucV+nviyhEXsUophRADzwqNfQeqiMPhN7V/vSjt
	VUOrcaZKsZFW39sKFn7cF+xkCMIQlzXvmH2x1Y5UoPCnpy8xC+OBq2RHSWp7571gcg==
X-Gm-Gg: AYBFou2BHmzoaxW/jUciu8lS/GZ+KXSFeNsIcdzmp90fvdp4lEON2njsRxGJacHD9fg
	8eyFbcQG6h2xjTQX4wc8JyHRAuYGu2Gfm1UihXmpw+bFWg1rX5qvRM2HbVI/xA4hmw1EpJkPXt+
	k+AjsUXZDmdGkYNcgpFCTKNHOhnDJT1iUzNKvZT7kgHBPpwOXVIoYs2DE64bMwQaezyCl1c8g72
	AaqDYeaqe/Oi9Ba5exRBhmtHDzb9mVEHRTNkCfKaHQnp4/Bf99njcqaM0WOjpaqEkACa2wOjy/R
	irPLm785SVxxa40PZa+TKDHfq/wmiwczltQ1dufbjpPpUJqIA1pxA0G6tqCJWb6E2YOSK5GQALp
	EMA7W5UOsMk2JGr4cmstev/d7ClGgmoVthaRiYMxgbJshogq4rxmRt5c2mQFtP9G6QvC+h2beIP
	01bSgYs4k0qwqCO9F9HWQLQ/k54cgYrUjLheJ6heKlnl+c9brJexxPswaux1LVEjsiqSu76RyIJ
	sUHOMmHYPAhx1cBGzIqWJpOmrUDXBBZ2yjElm39KQ7b2UCz7s1iGQJ8AUNLCR8HfVD00LcykQOc
	CCIsrL7O70uXJxfiKbfLXSUEqlfJ6grJ7AzUqWgkrK4A9Z0=
X-Received: by 2002:a17:902:fc8d:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2df5b83635bmr2369315ad.15.1790033942078;
        Mon, 21 Sep 2026 16:39:02 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0691fe5ddsm1049674a91.3.2026.09.21.16.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:39:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:38:56 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] binder: use irrefutable let patterns
Message-ID: <arHAEA0JT7T1v1GR@google.com>
References: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>

On Mon, Sep 21, 2026 at 12:49:28AM +0900, Alexandre Courbot wrote:
> Replace matches on infallible results with irrefutable let patterns,
> which are available since Rust 1.82.
> 
> This removes boilerplate for handling impossible error variants.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Thanks for the cleanup Alexandre.

Acked-by: Carlos Llamas <cmllamas@google.com>
