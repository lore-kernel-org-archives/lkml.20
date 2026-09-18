Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62714FD79A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744031; cv=none; b=uNh0K7cB9lhs7jjLJTFuFq8t3QquZ+QXVkgrQavVquWwCGUKhdinvnYThk9+lzdXbqXLzieQGVnYKFNqJ4/kDyC5NbaZLdCkEom672EMMppTEKRMeIdmucaoYixHlBGYqfucljrJvDfJAlzpP3gXsMWjXFmQV5/i6nHeJd1gm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744031; c=relaxed/simple;
	bh=a7eTtXiS/q7LlugYciz5G8PiIuR+f8uq9HU01tqbC2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwnRTewJuEFoYXsDFvoCJTUK5bBdyV35NQq4EqSrWBvUhbZImRE0sQzDggCiKksv4wYJcUdMSlI/tj/rXVTSPq7JXU+lcj/p0ID2I6cxbscldQT/3CxMUL+HLJsjW3oL1ZmFGD8B7Y60rA4zc94DVhpz4IM/MxK6A9AGDcZvqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8ohN56+; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8ohN56+"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so861801b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789744029; x=1790348829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bHx2U37kDFvOVrCeKn2UjyvlHYn8iui3rKI+sYLDn70=;
        b=n8ohN56+wrUVPgMsFgzXQk99BvNRBhtmXd0mac18mdFLYuWCUpA+Vdgv2bTwgRxIi0
         lfaXB4T10hd4j0PJREKRnlQmk2nOYh7HMw7U6WjPKXF2L72MujPqO0FE97y89l8sYnXM
         46oEEDnZ28bQ0e0+c9P1iVKzT+mz7AqocwWtqRasureMAmzIxtI7zeTZ/YmIZtX0bM2Q
         uK709w9ZSjlHRysJ8ln6Ow2rs90eOYg/xZXWTe0jMDUIdgJur4pbZGtFAShVMJvTj3Jw
         nICuugoAEKQ/BUy79bexD0v3i39DRHOCU5XIChl8c/MNi5VkOI397ihLAo9UTZrKDFS0
         pNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744029; x=1790348829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHx2U37kDFvOVrCeKn2UjyvlHYn8iui3rKI+sYLDn70=;
        b=iKJ1w8YIL/RnrV+OR/7ZBJPtvc0eQZdL5z4G1QPNoO9nFe3/58YjwnDK67Afa7cv1S
         t71bZY+OyOk0dWlbp0TeQhVC9eI5bKgS9p4Ua7geULdiRlIkJhMfQNFH299SCoQ0oxrD
         r23DGhs9LppUAstSPGOoRtRvPnMk4V0/5wScfvr1X3CuhFARx+QZfpzNtMLzXXpNYOfb
         lPm9R8JHqoh0r4nIfCfjqY9BqFhbLRBx+5hfHUhjiQY1impp6Oq+xgZ9ANu2OHkfIO22
         IkrpqfGzWvwxu3JhuoUeASt0WWA37OI1GUj12of/sHDzlgJoZ9JBK3/wmjp292zG7qxj
         arCg==
X-Forwarded-Encrypted: i=1; AKwUvBx8OGrfIgFY6R47vhkqugU8Rr4Xo8DF9TqdhjbCw37IdJUvyVxiW8RxSA7o1V+v4stKtxmMUqXM3Jicks4=@vger.kernel.org
X-Gm-Message-State: AFuF++l/0A/Qgu+KYCK2iWPcdL3kn+63+HC49g6hlf6BJdSl+G1QmVbq
	Mc6U/wYitTYghZPxACXOelFj7o1A1RmldLHC3zoQymoAkmHj2BdbyJlm
X-Gm-Gg: AYBFou2lla4VomEiQ9i5crhfxDRYYm+E40QWIk9SXLbGYSxkDAuSBc5+yNdU5XrR1Ok
	w3JycZ2x2InkUsJbpGe81jg6b/FGFF3PK6UBsbawgwzYbt7y9nOSNwHyR2Ixp6prQ9vZE/Q+O5j
	R71vMQ38Xk1qQgeMxmPH1D9w19XOHc9Q/1K/vXUov0+ciG77n6XZV7UcRCHAAUj9EEc52SnA7e/
	hpCXbFNez6v3VrtWBUk/FPfyg6XPt02vlAbzCmbjPXFVTvy4OW+EMxSAFjA/9aB/gDCFRGdnO6i
	RYraPYhMhOVdpui01PkTbSzlU7NDLWrs6C26JqE9lm1b95SyErKj0mbzjbqBWgwJeDGcOlRktGU
	EjcM9HUpJpC8PGLqmewGNcXeoFGRsaVJ1w4VeF+VZBFO+9/ZQFCKcAEk4tUQrHoxYbFM8nuIcJG
	smyri13UPhLZY/i6RCMTek1J+byG45O58xutkzIYr6v7mD7Yl3unfk7twmbFpu9qqlVCdIqTJgW
	xR31Ujg+NnV
X-Received: by 2002:a05:6a20:2586:b0:3dd:85a8:4c66 with SMTP id adf61e73a8af0-3dd8c5db1e1mr5341641637.45.1789744028669;
        Fri, 18 Sep 2026 08:07:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bfbb4db4sm1217526a12.8.2026.09.18.08.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:07:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:07:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: James Seo <james@equiv.tech>, Kees Cook <kees+treewide@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: hp-wmi-sensors: Fix info_map[] allocation type
Message-ID: <0f4f9d77-24b8-4e01-99fd-a0a3e98a0658@roeck-us.net>
References: <20260917211338.i.682-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211338.i.682-kees@kernel.org>

On Thu, Sep 17, 2026 at 02:13:39PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "info_map[type]" is "struct hp_wmi_info **", but
> the converted allocation type would be "struct hp_wmi_info ***", as the
> size was taken from "*info_map", which is one level of indirection too
> many. Luckily both element types are pointers of the same size. Take the
> size from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/hp-wmi-sensors.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> Acked-by: James Seo <james@equiv.tech>

Applied.

Thanks,
Guenter
