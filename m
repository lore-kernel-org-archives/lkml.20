Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D04052AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494836; cv=none; b=lqI/2OgnkcczxqkHXmD93ws4z6FKMJ5g2Si1o1ssHYjBukB6dKofP7PAFFpKFfcX0Ib3HnamJBdZNY/3RM4BLXlPfyscLfLhrFOB0W+72Rt+SDUc/AjpugZv5iXQxHlw6TN4pjb9F2/yAONT1HDROERXZktBYNITgGajvycp5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494836; c=relaxed/simple;
	bh=ZPw9lXjYo/re2jHD+iFfey94YnYwBpvO2yjlzKfJ5a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaWWlrX1SWM1+wu6FMsEAbs3KOUYIvV0Pr3BftLfIKJdLpmZQARhJgX7J2bcAz95sikWXmopmqdipIXcEtSt1Fid+Lwa/32A8PQW4oqQVqvfoCCi0jD6S8MpN7YL331W4PEtvtIaKcwlhZoZVkQ1Jh+L0jZAcvK7sXq8Mayj2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WofBKwCw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WofBKwCw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so1644473f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494833; x=1790099633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BybWH8gs7AYx6NYtOuIpbkPfpLYOJ4rtoku/c8ai57E=;
        b=WofBKwCwNSdMlTXmpRv1DikVuHubhNqSLE6T0xj93cizQ+zmGuG9iUqCLsokXd2IWK
         PAB1UNcb1WZ9rVyeYcyooz+GE1Ywpt//RmUi7lVEeZK+U6K09jT1abEkbMA114o2EB1Y
         7m02fkEaR4ZFPJqB/vQCCbNsv6jvMnw1+mLxUGPN4scVtVE26QMtGBTztzQKJSuhRgW0
         S0IXMdz8gTI5nucnRSPPXjUpGLZRbkRiLF4A+xQEES29IEOIo4YQUH9E9bLBKOFnyEFE
         j28pw23qzneooFneoO1J+A5h+wr2yHX0nWWJDPHvIEAC+Wa2x/0O52IjJBIM2AIsPDcm
         JtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494833; x=1790099633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BybWH8gs7AYx6NYtOuIpbkPfpLYOJ4rtoku/c8ai57E=;
        b=O1VwrkzWvwW5dEtavrayinGvnZsjvY6ZTNpfkKoCiDhtPnV73WC9aTAGDnO8kw8cv+
         YEFOWj1zVPv2xCQoRTpSMuvnE+tU3yRvaR7VTBzQchi6b1LCYummx2dxk40aLsBlk+Bd
         LiPvx1zIVA9R4qNhzqiTMB9/yi26xn66iOSJqK+dDE6pQaxP9+oLrMYO8553bjdKYNyy
         p5UZhwTTQFIhUrA9HxOBqOkAq4rPm4s42c5hkLMNtrLiWbUTj1Udfg9Ao7J577ewMIba
         Mauunurx5xqE5WI0S7c8S8V5VPBXTxPhVahboUOu9yT8moomiBQr6oxBqY20pks44YT8
         zKpA==
X-Forwarded-Encrypted: i=1; AKwUvBxAy6ZeDkRjtvQfCVPfDqyz0ysFZpcYlNU7ifjfD9lLT7+/EL8D3TJFFQxPQ/1IAfdgkVVCK1mInDnWr0M=@vger.kernel.org
X-Gm-Message-State: AFuF++kq/pshA6zsU9kG47fbc3oFZ2wBle70zmozu4xT9+b4RMAVsD66
	UKyL7enTOGn+UCoxMlsTsgomUs0uaMtECupBYrmLcWey5PeS0odL7+HB
X-Gm-Gg: AYBFou22k4DI0EJr5Ejqta9JKlkKsRSqqoqs6GVv8+MRO2v1BSdrT913JfrEZRN173X
	G8Kadid7Khv+nnskoGV6xga3FGzCgr3Ff3YQDtIQ5xJBeYijs6JVLPgtq4g53crpkbJj/j5mJFn
	baZbq0FgeyzOAFSA/FBNZbknBQK8CDyasqMKzElryYsSI38Tta2eUQ+MigsdKicp2U38YGH8uNi
	RI+Fz72I/XumeVIczPnh8P4ZESfhvzgYpYo/Nt1z6Hb4zi6TTXOlfVh+QQULfnHOJrjKZfzjAYD
	rOuu6alfbwWa8/DKI4BGRxd4+GXCOI5aowySvgbFw6a0v2rNNrAQsOUf0+Aqp/OeljAL46Oh4Df
	u+ac+0+yfw6sNYNS+5GOk9NWm+MKIeE7/6bP//2MwNddi4smfTYqGSwL3pZsswlRguDqLa7jmwk
	ABsdYu3z4C2cGad6zsxXqDpU0wKNoIWwmQbYLFmrFBNeQ4EZSNpVAABoeihlviOQ+rhh0=
X-Received: by 2002:a5d:5f46:0:b0:486:faa5:2165 with SMTP id ffacd0b85a97d-48702b379c8mr9832537f8f.54.1789494833029;
        Tue, 15 Sep 2026 10:53:53 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm672288f8f.25.2026.09.15.10.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:53:52 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:53:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <aqmGLBRaLwQ5GpXS@stanley.mountain>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>

On Tue, Sep 15, 2026 at 07:38:23PM +0300, Dan Carpenter wrote:
> Callers should test the return from of_clk_get_by_name() with IS_ERR().
> The function returns a valid clock on success and an error pointer on
> failure; NULL is not a valid return value.
> 
> Document this explicitly to prevent callers from treating NULL as a
> separate failure case.
> 
> Assisted-by: ChatGPT:gpt-5
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> There are a few other functions which look like they return NULL but
> never actually do.  This is one which has caused some confusion in
> the past.

Sashiko says that it looks like it can return NULL.
https://lore.kernel.org/all/20260915164913.597D51F000FF@smtp.kernel.org/
It does *look* that way, which is why I'm adding the documentation
to say that looks are confusing.

It's pretty normal for these types of functions to return an error pointer
for errors and NULL for not found, but the of_clk_get_by_name() returns
-ENOENT on error.  https://lkml.iu.edu/1810.1/06936.html

Also in commit 6a636d203cc8 ("clk: renesas: Use IS_ERR() for pointers
that cannot be NULL") there was a static checker warning because the
NULL return wasn't handled and we "fixed" it by saying that NULL was
impossible.

regards,
dan carpenter

