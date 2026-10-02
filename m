Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C22F9D82
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973228; cv=none; b=kfu9tunDZ92JsTUgL8NTjEzwI+lRreKWjQujpsy3p/FiGvjR1apnsAQTIDkjz1TydkC5cAI8aUnkb0V0DVGgDJQnh3GlxSMIKlHUzRKInExIZiMBmIbPLoZqqLJYnhQzOPmQYbISYEPR1U9vMfst8QHjCMGbgSrkECf7+2JciSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973228; c=relaxed/simple;
	bh=u034o5ljXz5CJToLKeVCwXtqDGV74CDcIcp4GPXFAwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4LXXroie6JFSxF+gtN3YJZTiYMeRIimMsXNUbYcQTDOc16hMVTBlaM6RTpNAW4U2R2ULt6fO1fX6Y0Jl6X16aISgilbAvhYX3WZ4KmkxN3hAHt6tgdifPr+URKaPHraeU7Aa7kEqlcyaeMWhKdq+Ni6lBE5I4EY+xwEXa1RZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=rBydKLru; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="rBydKLru"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39d654f02baso186318a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790973226; x=1791578026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0lo09yz30+6G0Y3ATt3g2hzJILuJM31qXCKjPdHWfs=;
        b=rBydKLrunRF09vY1woEoY9pRijncB4yEl2/h0tQxaueqmhOQNkwTI37WoiY3mm5q1j
         KAJPvnNoWX96HONTpqoLOKqO9C5fSiHRD2Q0YjLbFaROZStMgrl36+mn+I5uBS4GBdhh
         zFXWtDQER+ml7vuBMjZt8dCueqKiGgdKEfOQiPVdRUD42tbdhNMey7M0EVJ6ikhvM0Pu
         aYi6sgaayFirxjB/tIUp/arwcZQU3Xn1b73Yy2J2uOUOI2f8XxjhHJR19gRjPF2yMFJ/
         jtBnTYCDouHO6E3oFEHQd3exTmA2vw1T6XNa+JITBxN3aqdGqyH1LRu1n6JkkaM494sX
         Y5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973226; x=1791578026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H0lo09yz30+6G0Y3ATt3g2hzJILuJM31qXCKjPdHWfs=;
        b=RHqneHphnR3wC62DM1Wsyzry2Hy/RN6ga4uGOENjC28PSZAuv8F4HEn+usM+AbLo77
         4ejCwKM5n/xsGzBLP3o9p/2/XsbAS7dpr0n3YrzTTj4xGxVeHclvX1D4gYRN4Tocv4h5
         EATtcAZddvxVDqr4VKwERVlsYDepWr5FDbZLtGW51kSc5KHyHQWaPaURDx+l7KQrJvHl
         4e22sX2PmDyJlGDCD6T9QIROOew/8djFS8ufZtWxQlB7aVqmTUFZfplKJXCkLN8vBk0R
         Mu/RPCgekt414MNUnxff/wrM+/j7Emz8mN6wHxw5jxzx+UoirV18WexRyrcJf+yTASWq
         AIjQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8KF7c0G6iNScnp6fTTK1VXbmaVe2fw3ttLuCQvbxGq/NCJkjXLK6oGm5TXIWyQclAPhMNnmuLl/Az4HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJGxJQJsULeoYMn0Syi+Nd2AbW85yL8NorteDb5OaiHWMb+Dow
	aNZEtMyy8/On8XXEmGPq/zo9xJfVmuCsBTUVDqR9SXY+w68D05qeHMY51711MeSJ2G8=
X-Gm-Gg: AYBFou0jMvL1BxrqQyAa1wmnhK3OcwUBkgbhJ8VUbZSLpZswymH9RyC3VPvJhRgGP4d
	FWRG8cKJxSouugiQmdn+S4x+ikzYYmXPK3D4E8tZvQwaEqh9ybOfx4TKXgNxu1+vxSeKR5v7oVJ
	0LgzkTX2kaXUEIHJ01h/ilj0Ty2GbCmTzOZEz8o1yoaahqN4fFFKkJbT/YczYdvfC0jXMNI3oq6
	OW31HY9uoxGTdOnx993XF31yFYW55s1X35AuIwKDHBkl4mlrbBHnlkjxLpfqef9HuIvgVvFtGpr
	kI+Sq2lRozrfunvv25KoBE4SKU9Y456ExSS7wY1Siz86jc2HzQsUq/2TcbSLpJvTcaJjOldLjho
	IcED9wCX4FvoyD75A55NbHTbOjyG+quJTuXd2cow3C24LDjvvQTfw3WVtq8PwRsFAS2SB4uAr28
	MphOWIrIXzeRFFyEszHPexvOF0kaKWrN55ai7M5tU5zuqKsN/hL4d47ou26U/bGpxJHkxDk8o35
	jcvL9v5Ciad
X-Received: by 2002:a17:90b:2648:b0:3a7:8350:3f7d with SMTP id 98e67ed59e1d1-3a7835042d5mr285148a91.34.1790973225601;
        Fri, 02 Oct 2026 13:33:45 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm10111101a91.17.2026.10.02.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:33:44 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:33:44 -0700
From: Joe Damato <joe@dama.to>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>,
	Philo Lu <lulie@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 2/5] eea: Remove unneeded assignment
Message-ID: <asAVKJ7YgvVMQSzV@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wen Gu <guwen@linux.alibaba.com>,
	Philo Lu <lulie@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20261002100035.863275-1-andriy.shevchenko@linux.intel.com>
 <20261002100035.863275-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002100035.863275-3-andriy.shevchenko@linux.intel.com>

On Fri, Oct 02, 2026 at 11:59:20AM +0200, Andy Shevchenko wrote:
> The initial err is not used anywhere, drop the unneeded assignment.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/ethernet/alibaba/eea/eea_adminq.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
