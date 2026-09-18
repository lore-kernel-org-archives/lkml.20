Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DEC4FC8FD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743947; cv=none; b=aUPfiRfsrQAmTKXdOox/41bgp/0NmTiTjlh6cJ7drJo+dN6Y0rIGAIwXYb+clH+GVJXjndAEBp3TKhHfIXZSXiXypgU7FvaOL9jDYIuAi5beA3EVZFY265HRTTlk1mulhN9Ss46lsapBClS/TYwbsrk0gRJu3DKJiq6TFmbe6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743947; c=relaxed/simple;
	bh=19iCNcCPJa6h7SqIFmaDcjUE7HtusVN2AYJvdBzM+C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8fkKOF1dUge+0/FCA3+aRHzaFXCirX1gxoyCCLPDB6zOtfwy0GyMZh54fyVStaRAHnQ4g5SO8XFUircNKc3j0LUFHJsWrWn0kw0RnuKSTt8WPdZv3nVHjMgE1T91GKFlvSX8uMv6bDzUxiDefrJHGxuR3Wk5P6rQUlshHW0r6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuBPlzUB; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuBPlzUB"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso665128a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743945; x=1790348745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=fuBPlzUBwM7bob/ph3CPEw2jAKn7xgA7/bGDSFjo2SazIHVM/TXZjDcjv+uAkoDp+N
         xelSnxhgiEkgNgXMsSBEdnBj9oL/woSfcRAiE+qV5Dwy0jJ+YMqWTvWP0IKyoxOpD7U1
         f4BTF4QWdYLs0RBrmdUIPmEJgLK3X+EGX40hcS/p8J4iw70XRHInZ5V3AytSLcWy2p1E
         nzgYOzTBSY4GcNTDUw7bNWIbR60YODl0Cy18bmTi7Ugfz5aF+uVafctmCw+OqGN7UaI8
         9nQUhK46m1nL0ZuV8ZHBUABdd5dkMwEOLXH9zt2njpdD1UtBZnpEU1mop6/dZdE20ZTb
         OJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743945; x=1790348745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=x2uiz3jnv3t6Wnl74lPwx3Ry8lwT3AZKJRuWWd/W5I7+qp0VKNZXkOyry0vZKyFxkz
         uaZHsVOIPzx4Sc3ICsdtGBE99SeTQ7UlMQ9SM8zEKdnufC1mhXMOOsWsPKg3P+SfAv8S
         9RXEHovY/Zz9nF06xxrL8nyH4gtF3fPcfgQc8NQ/QqfwMfcIVjLGIzm6AGRJKwjCmwBD
         v/oPKYanzpwf3iy2WZlX+R5k0oNZyWrqOliyL4dQBJV+SKCAnqpUXJFHJquzR5dSIzO8
         FBAUwT+rkV9fp1ZswRYa8ac5TabSOUGrPt2qGE93mBnT9Gvw+iebA704NsE4IbeBjA1w
         PbnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrPbub7tsAqNW79ADu1RnsaEzJG5ko6ehACnHTGWyJ0wHC+ltpZfWRRcYWYzPYSWoZesUOKVS0Is4xjxY=@vger.kernel.org
X-Gm-Message-State: AFuF++lBNhKdV9mJf4r3Ch2/zorWEbxPlyujtv3lQf6sp3t7QPFSiowT
	ciiSGYRdjO6Bs0y+ms+LgQ/q9sg9fR0WTQYtvmNPuuz2UBXimaYaF+Yc
X-Gm-Gg: AYBFou2VukYkSDHdYVpEAl8fUVntHeMsqcWNQ/UWyfgrhYqxaOWyO7QVqy1fKVtrOTZ
	QxQvSECreOufzPf8e8aY3ZvNn3HNObtL3lFGPwDLcWmdR6QCkghRnbaZT7obf3TNmSxij5sGycW
	MZJMwyukCHIdovN+omIH76T2Qr0Rv37UnL2ESTNBUOSay8NEqQ14aBRH0VGTMV9aS6mQ9GdizjE
	Bl8D7WNktHbn6gm8HuoDM2vHJ2JV2H703lnx4DlNk2d0ibdaJXNKe2im9r1qnHGwCcwhKAYwLU6
	AuDKDKSoOMqpQ2dfLeVtY85QyfxIsUJDDGpwHesqijRKR3nEX+pMvUmAdK1FANC/QJU2USHoDR2
	IktggHm45ee/Dl2oS4+l70qZTFakMDbdFXWta3hchrX3NNoagwynRjZgSNHmgmnazCESbr5UvCY
	wKekhLxTWK10SQZpalsabpkiivK0BmzND7Jx2h9vNJC+6Kv65ciOb+ToO8F/5SvzDNmGOrX4tan
	oSc8JiiVHae
X-Received: by 2002:a17:90a:1050:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-39e6b0213b1mr199530a91.13.1789743944523;
        Fri, 18 Sep 2026 08:05:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13570529a91.9.2026.09.18.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:05:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:05:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Message-ID: <030736c4-ffa4-476e-beba-8dea4359cfba@roeck-us.net>
References: <20260917211344.i.911-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211344.i.911-kees@kernel.org>

On Thu, Sep 17, 2026 at 02:13:45PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "scmi_sensors->info[type]" is
> "const struct scmi_sensor_info **", but the converted allocation type
> would be "const struct scmi_sensor_info ***", as the size was taken from
> "*scmi_sensors->info", which is one level of indirection too many.
> Luckily both element types are pointers of the same size. Take the size
> from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/scmi-hwmon.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter
