Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FB4FD269
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743994; cv=none; b=ZSxxBm/J4TOx3Ai31iKDwgDLovoG6A7jKKjQ6WK2aYw89igTrfS2+rFI5xPubix/MyK/LC4R6SfCR21L3dVkjMeUqeiMoI+BH6M0A5WVA349fudUVnCayxB58Qm2onQkV9m8rgJYRwHsORv3Q3FAs0sRiUh+yyeeOL8KHe0mV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743994; c=relaxed/simple;
	bh=19iCNcCPJa6h7SqIFmaDcjUE7HtusVN2AYJvdBzM+C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/lGJktIGbVdeSxfklC03csahHY05FckGZ5vPCroRJAo5e9mDjxX4IpFJ2fDEZHoXiNlLiBNlBy9ltS3+ZKT25hPYfEWqQvF8t9gX+dK6UP8X5NtNgJKl0XD7iJKLuNRK1/CGOavX/XI9Caal965hHP5LQqRxz7Rl0t3V/vMyU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdKaoR9w; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdKaoR9w"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so10309445ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743992; x=1790348792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=TdKaoR9wKZcf/e9oYqSD87pj/2mLW/tmTNWrm9leCFwX/luD00VV95+plLzaKWnMhQ
         YCtlw+Dm1kt8DdhbGeNqJ+whe4DeBqUTQDpHkSDLMA2qSrXtZRen6knT8BQa4TtAjRw4
         BWW5PXnMdBfWJQRjcZKQIvcljii2EOC2a1nO7y24edxJX2NyRcoar8XZ+LAQLXRjjJJe
         3HyXHpphEoWps9I2yO4WNT+5fNmB3ix27uh2BDlaCS60zf93LwdTL8YYfi4Lwjn2a9AU
         /OWXQR5AfdLpj7CGKly4R2MyiOkNzmv8JLAPXfxES/BND3pgtW5dExh5IptfGlES+nNQ
         VrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743992; x=1790348792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=dg3INraUwoN9eRL4xIFxc8nH9s0FQvyjE6vV2UHYMqHwPt6dysobLjHlJWG3W1V4JC
         85XeVkW6mh0ZcVUprdjCVId9/ZyO7b73mLtR4qiZ8ZDjJuPJhzrGhWjGRpdnhjLbYGe7
         u7VvHUb1EL8qdcXSGYjv5tYuskzAZ4fuKwETZOOuIeuDyj5seKCIeBCQYGIB0pG2yCm0
         7J3afMlWDMB4mLbYPE6U3t3HzjjN8KIImzJXWC/w7/tzG8WAu7loHp7fCAW6/WACTINt
         MRWzxsdBBickBWWEvPg5q8K/oTAvnRU3wwakI1X/qXcAH2rAVij+hqjhzV6G65K1/0T0
         VmgA==
X-Forwarded-Encrypted: i=1; AKwUvBynsRGHT/0inv1x5TM+nHy0WQSP1L669OJI8bj4dV8WUHyIVHpasnzmvZKzs4VZvhOOoR8YqxRi4h6tqEU=@vger.kernel.org
X-Gm-Message-State: AFuF++nx+hBCdtjHXKYrimYnJlEnqW4FnSoCTzOH04cKIiTAi8MI84Zb
	dC/Z9YE6v+340RJy6SNpZkGbvvcditVo+KkWth2SGi0/4/USR+oaAgAK
X-Gm-Gg: AYBFou1vzGCYVf4FqWbuh5ZUZfjr/4qqNwvbg+W3Fwzy4KSdRvgO7nK6vQeGe6xFGJc
	eM1mJRDejv6lF7E13+pQVL+PIt0YlvDlFVMVateDd9CZjUA2dkzXZ2db5oOHjiQolEDwbI+qlfN
	51zcSC4t0hIiIMph5FPBex06bPonB5U+8RMOf3P9V2RsbtTEAkNYFUqRKmdKb1xNyKFSLJxVrxR
	0N6owsC1px/SGPNiKEjcEo6NhGDldEhG7fcJ+9j8j3USBQxw7U/jOstSeAOpwQ8jK0b18ohvXwe
	4KjVYClz0zkgc6n466DW40+NPfkuj+ro5qsNGrMhI0AkFABLNRillTbGdXdiF5OKF/l8u33jCjC
	HtRlwHjWnOVgWONComcVoJagvwQAEoO9NWSZU9tA7IRIl3uYTtjgLCHHTPSqjygMEcmerzNGqM7
	m1bWQpWj8OpKzgIzDR6VKgnwJdzag6YM4v2gA4hp0isd6UCqzBLlpNGBhCLQRPuo0Y0wJrWXkiA
	pzikeBHCEZZ5RRmHP1S0Ns=
X-Received: by 2002:a17:902:c947:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ddb1bca6e2mr61754635ad.27.1789743991725;
        Fri, 18 Sep 2026 08:06:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75819d7sm10071215ad.54.2026.09.18.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:06:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:06:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Message-ID: <2d9e2846-23a7-4580-a1e9-31b81eb74577@roeck-us.net>
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
