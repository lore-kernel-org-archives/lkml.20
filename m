Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068BD51AEEA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030312; cv=none; b=ccSmdDJQFUB4p+KMQJHu7kbHJPt2EKHV5DMttH3RfgqPjV5vrz0U5R2FyUCJ6VaSzYmCkcDy5S6ehd46+Jk+gIIGv0gwLb1hTUuZkrqKDUX4od+AEOeVbm+FH6TkqSY8FUojfijyknAucR05KteCEkElWMDCLAM5Fo8R+OjpdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030312; c=relaxed/simple;
	bh=mOQNoWihYctjpxdQH48HyT4KWIblkBqVwxM/GXKEWzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jO8ml7llLijAKaYaYsQe9AmlfkHGXHoVAkVxHOaKx9h4FDOOMdT/fmRmlAr119z5rz1ZvV/ZSh5Gtu9ZlHaYEAdbp4mjRLBac3M3WfkVmsN84NkedYlDU790zXmaHt2wwlmH9NzNJyP+b3YIiEukSg1pJhKJwKrAHh9EL+E89J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8CUJt3k; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8CUJt3k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so20066305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790030308; x=1790635108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WR9u9hdOpvtnCt6+L75TQKXE1s0GE81hQtqkVYv36Q=;
        b=g8CUJt3kCrs7nzF8jOMn5XPAoHjGgratNqv8pVk7l3A57tJ0jOV0KDQ2ioBJ5/xsnd
         ODxUpUajlA8Ydg8QlB/pdu5uB5OmD9LsOU3XNCCc4LQlFXiMsfDJh8r0/3b02eHAxYgD
         g3MigMJhLSyQz0bhZGHC32zfofU2VqNG4xeNs69DHfbgo3IR40SCd/3gM1qpf5y1H8eg
         C5piDzC9upmXxBG/GSmxxP7jKPWwHcTF7iL4j39MauAJkWp3rLo+HLg+ub8a33ZotQSz
         wkBg0SSs3T/g9bG0oF64GM54krSdQHDmaFWCV2CHB2stgwaUUJrx/WhvI0UzI604ex5j
         4P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790030308; x=1790635108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WR9u9hdOpvtnCt6+L75TQKXE1s0GE81hQtqkVYv36Q=;
        b=nZgFQkMo1kHDdBAiaX5bDq4WOEy7+JPGn0X2DiS7W483N/WPOzsxsByFEQEk3ilkvE
         Wl51mHzGly1fDbSrVb4IFYdbIeiB6eO5PzIUygiybsZYgAUlVMOHCmwmgeU2YTGTy8Zw
         0xQlRv5rg8ls5QOF9gNVCjUhxOeE6JLoLz2D4c/c+LQRmcZlEFES/0vCYqVL/tB14UjS
         a0MiD+kiiDgNrUfB6Mmc8SKXPWtGHJAE8vmuCEobxkC7hrFwMTExEWcHT0hHLOTh47ZE
         xLSLHy/i2x4v5R5GgHXXR9kO8hW0GPtnYp1yxix9/4UJmCnwiCN6wtVTn8EWQqRfKuRi
         EUfg==
X-Forwarded-Encrypted: i=1; AKwUvBxowgZyRL5iXFDSzBOlrCDp7bnz+7n0YTK1vTZdDtJMp5o/9ST/q3eWuRLLbpUiNW534QeRzslzY9rP51Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mApruyRBgABdhdneYbdxWYXROBO84X/jDRjSvYY9axKBSjy2Xg
	aTVZXiueI+pVo6jCwpOixwZQUGt17bkdOqJerbt98u/iT9f9kPRFxWnk
X-Gm-Gg: AYBFou2CcdhQqGOaKfXYbVWjiapE2SDYU41NdIpEUx2dolMhCg4nnQnLH6tYy/2IRfQ
	zzzZhhYT3TqVeymW3GyT5TtWFkGyiuyGFoiIU4XK2JT0Dvhz1Uv1/F/LLSjkoVOqfU2LQwpc0Bn
	XaEaFVTc3Ulr1YBxWnymkSn1yYxViLkpB2C0D3vQZha34Z6SZSKqKnX/U8C+zDGrm8SFCfncVQs
	ixtleyEspmxsMhY4felszsMeC5Y1XCGqxIwB48rVYKO9SSj6Dvj34lnbYFxdD6aLQGW7Uu4JviU
	q3sIFjbm+gFDdh86rm0qDaeCTNgCh7njmrteJLPZnOpTF6XVhwMtOpMGVc2lotA15Qn8pGZ9Tlj
	0KmYPvW/VKcTM7rmTf3pB1u70WQ/Rxt76pTuAGUmrM8KlZLMEEmEhl/BsUMJ7rJ5OcebJRnyUaB
	Pckenhzi7C5+frUXj1wfG+l6MRkMvPujBUMK6Dr6l2ROnR6KQsKBbD51x6ehDvwnOPHEZjwCrGa
	Hix/y3VTFo6OUHUQfsi9Uml8IBAJBbu3bKbP5yyfGmPvJzi
X-Received: by 2002:a05:600c:4ecb:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49fc5754e06mr171586715e9.26.1790030308003;
        Mon, 21 Sep 2026 15:38:28 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862255db4sm713166f8f.16.2026.09.21.15.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:38:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 00:38:24 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Cross <ccross@android.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] pstore: reject persistent RAM zones too small for
 the buffer header
Message-ID: <arGxxfzuU2Fl-c59@andreayoga.localdomain>
References: <20260921202317.70595-1-parri.andrea@gmail.com>
 <20260921202317.70595-3-parri.andrea@gmail.com>
 <202609211431.11176F76@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609211431.11176F76@keescook>

(Dropped anton.vorontsov@linaro.org and john.stultz@linaro.org from Cc,
both bounced.)

> I wonder if it should return ENOSPC instead, though?

Fair point: nothing branches on the specific errno, but ENOSPC matches
the "doesn't fit" convention used elsewhere in ram.c, while EINVAL is
otherwise reserved for malformed config values.  I'll send a one-line
patch on top of 1b30df8662ac switching it, unless you'd rather fold it
in yourself.

Thanks!

Andrea
