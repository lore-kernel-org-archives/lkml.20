Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46F26C385
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138328; cv=none; b=Usvp1jkLH/R/97JzmeBy6Pr6VG9yrftU+9xuqz/XDjrraQTwyG5dwV3KGAKnBAFod9YoC/TzYKFNW6m8qaR/vWs6F4IVxZMT9sVlepWgbTsSiKhPuzeSPrurwmF7p0ud5WLTzpYNI4XqKE+FP0IaG+h3sKehSlrcn/WDcWhNRDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138328; c=relaxed/simple;
	bh=4jk+j9YNuu/5rZ6mDSj5zkzgKBVWnJ0lqMSB5k2Ri4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJGx0ntO87N1ODzKMnJc7LHdAQxt6QSGzbY/oWRKrCFYOlYRajlaeZKz8/7p8k93/UyKyjwCHytDhvm+l2N6vkW0lGT2c5v5MDTHnYPvVkKPvnsK7mODrbOgAZgdEbSjXuJDqmJ9V9084c7n26VYrqLFV9Mm0nPqK8lgHML98Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIGZYquP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIGZYquP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso25483835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138324; x=1792743124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=coNAFChQpDjBCCj96hHJcqUiTEEavSTGgtqRHjd5Zp4=;
        b=RIGZYquPhDI0Yw3r3DTgy1rrRV8pghRH+3I8y+Jhwp1YhTT/lWwJFS350iTkZaLLX2
         iYyk2V9mqJ9k6x6NXYh5noWSkc8S/pWcEAdIfGoHiSg4dLhTS3WR41Ln4+weUVaYmRBd
         mYtJ3373IUD4N1ORZ/SF01pFmfqXKnzrN9/4vZxGA0DnbK+4UKQTF2eFcyXc9x+wy2iK
         +9MQ8AEaxtwXK7fppdRi8jxb8rVGK0kEJ7W61PwtyXlcFopzOF5eEcE+RgirH/eELEPW
         Z3tZI+Job2zXh+SsRojm8spVPv4jtRiv7kJnegXtfX2bfgSC3kYcJ7OE9MJeJPZYQ0gn
         LVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138324; x=1792743124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coNAFChQpDjBCCj96hHJcqUiTEEavSTGgtqRHjd5Zp4=;
        b=LLvVsrzKksBuh2AZvSLZdF8RAWEH6WroWzEfkCPtHJfTkht0U8AegGGOnCBqCwtdsG
         G0TvpIntPGDbb9Y9JIbSpBc7mKSpKvxjlFdlyps2T/3qFwr/nRMTi2emlYOAgd0wvLd+
         Jlm7l28otkJmk5YnSbwu7y2FJmVLI4bu+bNA57p2wP13wl9DqO6cf07pY4Am1avFue2L
         WHiw3/SWJujpuZL8vzDZVF9tfSkIXS/GgVPtsigxpM+LQIsp9pqIMpw0goR2hIxic1Ph
         e5LB7ZxmWpAxivOPu9a0TGiiYLKMqrJXGyRF5xew4IUwpUKi/eVOaLtC0rImjGuqki0d
         0oRA==
X-Forwarded-Encrypted: i=1; AKwUvBx/GqhJ+i2nE4PfH9qIjiLSOt6VhdEDf6i9rCp4/ri4tJqfIrlc6ZAiCemxNpYhWYf68JZ+bzMUB4f3hTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwAW5aKQ4GrHUsaE3EGwWHhqYoBEB9ECYylAVxCXQXKrqc7kA8
	Wlp86SA9l9ChWX4TRcF6ypuN+A+qeg81H2fPt89TI46JCZMxmwgEsRyE
X-Gm-Gg: AYBFou3V0ZIC3bq3AeWnwn8vhv9C67fxgSTiVB2AxEMJNUG3IwGC3VKG493VMw0Qsf8
	RPJYEcGrh/UDyAqfqLn8GrSsBzlHtdQs949bNu9+eXZ5pf3yu7mEdAc7tN5jbwAoFIJkAesZPYC
	IcmaZv/LahNZHG6H8KTEEMc8XAiyM12GTHNN7XbnELrz2Qkk5wKgmRMJfqEmf8T6xzvoYwBepJB
	9KclnTAqTR3aw5a+Smj/2EkjC8sO7bBzWZIV6hkiT64Bjb2GhuNtR4c9zy51VIL2n8SA8nySC4F
	c52ZvWSbS8UuhSZGmh7uZw2VwjaLgXncptA9HvuaryAEmUZH5TDkppyMSaqDQVu7++F5WA+UwHO
	87uFqtVKwdZ9DlCfqa7vJlwePb6Oxq8RF/6y8Ef6iuYR9up3pW/osUiw3q3xm8bHfWarPzGzh0X
	qmI6l5Bdq5/6hPGKUbMawEA0r4V/n7v1Ud/GBzwsDvbD8Hb/41teyX534osbg64QQjZoo=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr421665075e9.8.1792138324082;
        Fri, 16 Oct 2026 01:12:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdeb18f8sm2892143f8f.20.2026.10.16.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:12:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:11:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	dennylin0707@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atHcT5GG8zzoH7kk@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <atEtUV5q9MHRSTJb@stanley.mountain>
 <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
 <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>

Ah...  I didn't realize this patch was applied to a different tree.
#Unexpected.

https://lore.kernel.org/all/7e53bd59b7b146caabebeca4347674c7@realtek.com/

That's a mistake.  Staging patches should go through the staging tree
or atleast they should be Acked by the staging maintainer.

So, yes, that's always going to lead to merge issues.  Not a super big
deal because the conflicts are simple to resolve.

regards,
dan carpenter
