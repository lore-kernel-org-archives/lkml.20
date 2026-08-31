Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540141B8F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199886; cv=none; b=cVx9UBsH0npi7AO+upAKyujQ3urOqNuilGGUp5/HDUm9unhRy2g1nR8DP+KG86yRX66oaISmj3lyUnWaGzPKfjaPpL+Q65NzsP8qJu7qAegoDJPy4xXeckNt6XeY4gBJdnu2FhtSsYpTZtnocwTvxMilL8A26/RCAPGZBucVrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199886; c=relaxed/simple;
	bh=fqYrrNpGh2ZJW4WjzQHxVJrJGSwNCRN5qjhjUVjTS6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SlYjp9T1iEF+dcEwQ+izDHk+m3Man7r8hcdQFVc0Q+Au03DdZ7dN8c8GbvArEWhLY29nCkh4TWGVjaqXCsIj2TXEjRELHqWS3oCKWHT8zEiEKE7h34Ld/4O0DxFXAmWgC47erKNXFtXj46AH4DkjoLMKpap4XbQ1xAhM0WEPxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hVJXPuzt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hVJXPuzt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e27035206so3779150b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199884; x=1788804684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0COa3gwYNjuFphklOyEy628vclsQHkS7aHlFcluzm2w=;
        b=hVJXPuzt5XjDm3RFBE52f1B0PYRMQGCPGyUxXgenn3niVG4ypvDc02xz5JsG1laV+n
         xHojciVZgQ9TxSfEeA+JSH2rSf4CojWyYQ4XnY74x7wu5uxsIR6SZf6ArWYdNnFJRdfL
         SnqeSTGK34iM4ItletiG3IK3LKf9a45GXuJibveIy0kIW6PKzpw09eBkj+4Tz3wSVMQS
         7h/G3GHoeOvcd9KjaIPDm4eRUA/IcdqSfEbpD+/7+S6e1UYi8NFLvoFX2rKSmLB6z+zB
         RpBJpHPhpw1CkVCj9OQOs7MhTG9AFiwtQyoJWIbFHGjuaeu0du6+QXd1SKeWLSDTB0H2
         nLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199884; x=1788804684;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0COa3gwYNjuFphklOyEy628vclsQHkS7aHlFcluzm2w=;
        b=haEPYTLv6n4M2O3HFQo/hjjqh6pFGfO60ujJDxuS5Nm59vATYbj4Jx9CB6FQ3xT8IZ
         SKpkrebJSk9XWUvzOctCrsTV5FdnjlurUDBOSNpkDqfKRLQfzZMkqs2f+tZ0exYgb9FU
         MKZRkjJjrEbyx/mpr7vH7SKMeqACD8NN4KkvVxNoxYAcAZjUFJjvsDdn7xepgoxRFEXg
         t5UjVKMtonjxR03GmwErc3qtKk//0W8eUpj2VOtUFvQBUnqbP/39MGz+SwMEUwupyz9H
         D7OMbuagIwVhpBJC7zSAL9n13Uhax1Zq1W0rRlOGcjBCYzGjReTKHcMqkZ5Kq8medXVP
         q+Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrJXORNhu0McK/vx5XiERDQ8ixpy3/Oakg75QTFYvt1DWc4Z07MI43oaSKJOCoGyELK4GMMpPuRk6l18+w=@vger.kernel.org
X-Gm-Message-State: AFuF++n4ORkwAZXNfd7EWn+ZiJPkQV3vxyzqoxxz2dHdmzKkKPcfhPGW
	ME53PtYIqXgmWPyfEDhMRSe0HRgSD73Gzbj+OrrpzdeGIms/8cZdAYCfn7rLtGMysclpvtVpT3K
	HcKdS
X-Gm-Gg: AR+sD13tgFSh8iS2f2eBT0aa5sQBi8zEDkeX4vdugcQ1WRuxA8lbOlTI0NMpCoYXocR
	MzlB+iUpcgKqSQ4icStK9sPnfxQl+w/oY6ZIfejkAjBNSHQ/Eieyh/Zc/heOvZuI3CDqRqBIRP2
	wvsm8cZdbcP4Fxo3eXfNSA2q1Q8n6AbBDnoPlWVHcgqNa3cNjF0tx7OLxuWxz0wpcaUMD29bkrX
	KjewCjiEQfiJKoZkxWysS/3c4BGZrDwQq/HN5cdyiNMlib1z1bcS4CRL+YTlepsdgEfXCbfSgZ3
	AxIxbqzpUGPGEgoVCTdcQKdHFfNwQMH/Rr71tuIxEwgKzPcQV294k5ZHAI8pjWruiVJO7yXdAti
	VQjyGvaK9qeejLEV8xVa46Ncyn0eZ8vsx7yTJIVolg3JaE7vHY5tgQnSL5LbBV3xbjoz+l5c4KH
	u1OPcDkefd56AErDJGtzTRGazPe84ja0MGqwSztLMCHHPi1lAwoNZx9IwoZQ==
X-Received: by 2002:a05:6a00:3001:b0:84e:9257:d0c2 with SMTP id d2e1a72fcca58-85b59c6e775mr4223738b3a.9.1788199884202;
        Mon, 31 Aug 2026 11:11:24 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8569f49ed61sm4357798b3a.1.2026.08.31.11.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Thomas Huth <thuth@redhat.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260821081356.165038-1-thuth@redhat.com>
References: <20260821081356.165038-1-thuth@redhat.com>
Subject: Re: [PATCH] ARM: OMAP2+: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-Id: <178819988345.2869653.13752991641389128437.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Fri, 21 Aug 2026 10:13:56 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: Replace __ASSEMBLY__ with __ASSEMBLER__
      commit: 9d458ad3ec1552cd99ca1316ea30c4901e4fd4dd

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

