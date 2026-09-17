Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C4314A9E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604881; cv=none; b=UlaDdrZgrhqCqHkV+h/zbakDjIII6DRiw6mj9JYTbfzJoasQ3wsSDpOe4jX/UK48DnsWFsL5qrgKG5MkCov0+MRDf6oLqtAAAlMumycuaka/AYPmUoaQQJSzkZ4wBpuxuisbz4cmJWBv6jw8xvsvBQW+z1h/d2oCq+TA+1kHLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604881; c=relaxed/simple;
	bh=9FgMLbEt/sXyQcNribkC7l0KNZOAkXosmxtmyUflEYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bhcjg1Tkp8yWedbp16bEZORDOovxK6Pm7DoGgxNgTuXyHttgAeMwI8O1bbHbbC3bdEPGX8+Qmzqm5s+EAR7MKd06wrmKXG8NxZVpCEvqw4XyHB2MtWxI28VJl46NVsTmUXM0letDvvB6wq8y75LWv4rio+I0QeZkYCoU52qu/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJgeciLe; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJgeciLe"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso220983a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604879; x=1790209679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tmkJQLUc+UOHMTg0w7B4y5XSpy6y1Yvw1LbiiPABaEo=;
        b=LJgeciLe213JjUYHt1ofecbn/A0QICj3sI4Xcr76xpr9KnAA9yGD2ZY4LgytAmHF5T
         E0sWivnTFtWTDIjoQy5Qm70xJH4BPaFVVXGd5knukxtVw2ClRfrd2TAloLhOmSAR4TJ8
         0Jae5x0nZ67xscwzRQnUS39//zS7JD9agVjEYWvRVSVxq8gox5RZ6KuHiKUtvyGcGRT1
         dIWleeQzt+q88bwFTanW6v8QOzrARjHe16QfuV/6j4pT4TqywMZg8STcswFDtRudkOnL
         0jbMuWOBCSDYwr4xdX9cPgp+9oS/STjsvbIIOcTS74FILHAnARO0DP1wNmOauVsrYou1
         W24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604879; x=1790209679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmkJQLUc+UOHMTg0w7B4y5XSpy6y1Yvw1LbiiPABaEo=;
        b=27MkCjDBtpk2N3fiBGkT2FGaTl5Bif5J2d290PnWmAGeYN6/aMOl8/X4sZAb+JhKUg
         sb21mHWvN5vuOOB287WBV7t71fb44nSHl6Ak32Y8Xcw3RR4HesgQByVzjp7W2eAEC8pb
         SkX6j05hWSRENJXOqkaTKUD7I8nVcXPGm9OZIGg4JUt3QVapCToSlKAb5HsgaJlYk4/O
         qz15QDzyluir/m7I+klog69/qPgyOMY5ibkExmgNXWdGD4/riwzc2uTek9nqMeZ6Rp4V
         VxNtdAz9NKXcatzM4QCt9XZ/8yzO7kuxz0WJpdKSwHyHrXDHIlSRfpl41CbFX2Z9BAyD
         QBVQ==
X-Forwarded-Encrypted: i=1; AKwUvByduvDAdjJN4r+N6KeMS084caZO9uo62yu9OYzpN7V9Y54ahtJqnXCSoZzyhNC4saOCPyJS/IBb01f3Z9k=@vger.kernel.org
X-Gm-Message-State: AFuF++lWrO4QLchCHzN25EUVenpLvWBtXt0gWhBRuiPCkCFFjM6Qje5V
	zcyLtru7cVK/qNeL7wSI0355ASGW39Rm/b/+MyvmayfYsbS9xGHD41xJ
X-Gm-Gg: AYBFou3ww2kUlfdpsLraiAI5Tk6VDA7QB3qgJX2wua0WNIMz4rhMwjs0rVxM1LTelMl
	MLY/udsYjB3AYDPVHbIREo8KB5WCDcz9dvgsUcEdDjewSD1anHyGBz5EcyXvIkkgY5lXDy/Wbww
	rT8K1aXEz+cmD7L5Ye3IviF9pSTWa+rBUydnvZoBjFugqxi2UFa8nwSWze0au3PHDsrCsMn4jhl
	mqVyUsJWzABXBVcwpHu0tKbHkHQApmiYli6zuy/WSx4KkDU/dHYmZQ+KhANGr377wdtjy7/6diF
	dq/7/tLKJl0CnceQjkzh4pGH+jlqoYBtWUzuUvdaWYUqzszP4Y/zFhubmc9qVHxph5ej62lGb9M
	8wZYhs8sT43B3jU7E6Y7tvMk+XoSvATIuMeLJMZt0hCteLvhAOiifRuseO6pkayd/0NTFvaXqi1
	gQAqb4hYGu1jfuZmenzdeHJ76sKzJXGdwvmYzQbc9SubIOymDZtIAT+0/GS5nwE7vk+pBFEvWSZ
	5X6Y2RX2houtkj/DTrdyLYc
X-Received: by 2002:a17:90b:3842:b0:39e:3ce1:d22f with SMTP id 98e67ed59e1d1-39e3ce1d970mr721394a91.16.1789604879311;
        Wed, 16 Sep 2026 17:27:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm1948689a91.9.2026.09.16.17.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:27:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:27:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Baruch Siach <baruch@tkos.co.il>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: rtd119x: Avoid division by zero
Message-ID: <dc85b026-c81f-4b41-98a6-e6ef842c20eb@roeck-us.net>
References: <20260913064851.8239-1-tzungbi@kernel.org>
 <20260913064851.8239-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913064851.8239-3-tzungbi@kernel.org>

On Sun, Sep 13, 2026 at 02:48:50PM +0800, Tzung-Bi Shih wrote:
> clk_get_rate() could return 0.  Avoid a division by zero panic.
> 
> Fixes: 2bdf6acbfead ("watchdog: Add Realtek RTD1295")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
