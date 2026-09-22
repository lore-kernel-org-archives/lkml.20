Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CE4A2076
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104665; cv=none; b=WMAuQUY0rFb32YoGTz9N+Qr5PLEVsaEiS6FSzO48aFu4lVvP/YFVYs5NQMRW4mH77T8hPhWEOIWgiu+CXwitNYYo1uwje7sdNdHqQuqkxU2Se+SVRvOKXKryUDnNWPAk/xJFB8mgjKLX+Bb5e+Ff2DgR+A3e4JQ9BwuQGqpvRGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104665; c=relaxed/simple;
	bh=RyLnrS9SAXAv4y18ulSi2r0oj+zePJC1xXw+bd1cTMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxxpXs/LkopdZOwt7qUfgOEQhbyLvKJ9t8zzUU1/npTnC3F0R+ocyiZANbtSAB3y/DRkR1tzQjlOa4Plx3ZFHKIPlF5zYUadTeCQ0MY35zTH8oqc0eq5GrG9fMgd+HIFRGjOiGN75Mxsy7UCF3UG8Rcwl9jekXM4EhNHzilfzEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUCBzBiR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUCBzBiR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1087505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104662; x=1790709462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmpGFufBK8IPX2EkK5YOeqXtFJPDgkBV3StdAfG8PLs=;
        b=MUCBzBiRiHbTZhpudlnRD4bIOihb2FW+BIR3UecLn8Mf3Gd6FVSKTZRNtzf5fF4o7i
         FXMIA4uRutWWyg+UQTbnunaYUMqLwGN0ZSKODWpzfg6cTcJtnM/zNQEJarGOcBDeo/nn
         6xsNgpxS8aVuHeZo01MsQoAe0xPLcTZpABEQRyCwCqIlFXp5wOFwDhbGKU3XJxKU1SAt
         dJCUHYrkhZKMqovhl1W3FdSc6YvMjM+x1wSEsyqXuWrm+oqVsxCllGZNd/sNyk/h02MB
         mWQl5BVN9yj1kMfib2WvVNUcKsjuo8RzSxIa+AqLmlfPOTqOQRwMSaoW5BqFFXpzGm3V
         FmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104662; x=1790709462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmpGFufBK8IPX2EkK5YOeqXtFJPDgkBV3StdAfG8PLs=;
        b=qvInvXepnlbhHR+QWErcJ2AK8q+srIzf6aCeUd2/eenCNYiz6AOIcslvbgiVVfNG65
         i2uIvj3htO7MP276WtWBkdV/0m9JQ0rS0ODtLkVI6+elcp63aP4tGwz7XSx/hbUu7PhO
         6e8eQlvJNsehOFWADpT1eWiFrLwGm6Qn6IQfK1wz/qphJpRXpd3pox8waEvGX8dTnOXj
         3bg885BYvxmVLM2wiLOK7yJzjdGw5pfUoIYiFojQRYlzLyECzX7KFl2EAWXGasQzhk+u
         CK0WYOJZVsZP/j26rK48gKtByT4GzXX3AOSgRAUavJaaZclWaTAahJM+LuDKDpI7+Zl4
         xLlQ==
X-Forwarded-Encrypted: i=1; AKwUvByLcbj9P5t2vknqdKST3+c/Q7Xc6G+p28r6RA4+Ie9mqdfjfjM8oFYUik+2FLeHLxjkts1Isp1GhPfxgxc=@vger.kernel.org
X-Gm-Message-State: AFuF++n2+78AjBSrjUZghiQdqzaz3qCqJGRuJTqh1M2rmwcVcKNwc2CR
	DH6aAzbMTHgC1HyXQBEk01bhi9UVQCtzL5usmBLXiYi86RCwjGEsgNJe
X-Gm-Gg: AYBFou3uqf3OCcHtlhboX2HwyHbalLq7mJZNWFF7TckOVRdUiKZw/ZZG+DnbWsXVZzK
	0cZSHsRwC9wgZDZalM0GNd36PrGDq3OkppZo+1pdJUZdO8r7pGh24Mc6diE2DSLMiVGPoLBjK6H
	fMZ5ST7srQupTEG6JcSoecpXBayo7Jj3kUvKcyi9no8SkKSBdx7SGWjLUCIw9syaCxogx7zLagA
	22fIMu9yVFXP3jeqOfzeeFHOI3PsDwwtptzQCw06YGupeT5cRl/V3unm2pOXCQAfCjbkc3Nhgs3
	7BkPXIZ4p6YsCMtlz4vj7rCwh7Zj1F496PCyoKwhJpXT/QUEEYJjghReP3iSxDaOnqQpZ7KFLK2
	GRWZRfV5r/L3RlzVKwqH4uYgaBmZE7X5P+yzAvYRKPgjqd+tOruTZeKpqUVjOk+9mWmRr72VZ5u
	/QrKa39sbUlEe77nrQnwSsp5FS6Nsi2kUe+w9X9h3853Ljh04N7zu5ZuBAq+MtQlzyVC8byX9Ii
	/zTBvMyvxnnbWCe5GOjivBqTbIwKX4QfROE88p5Fg+4FkFTBCKJr6SScXN7WvSMEcDNwufCamjz
	AW3nPhRsM7FqWAFmLPFAve8/STbMdQO1wXo9JcX03N17eXlCXYWxjr3AKVktYNH+tkFaG0cgL95
	tU2Ac
X-Received: by 2002:a05:600c:8a0a:20b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49fdf13b2f2mr1580215e9.26.1790104661479;
        Tue, 22 Sep 2026 12:17:41 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a5e6-3401-f8e1-409a-a02d-633a.310.pool.telefonica.de. [2a02:3100:a5e6:3401:f8e1:409a:a02d:633a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf979895sm2092885e9.1.2026.09.22.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:17:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:17:40 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization
 kernel-doc
Message-ID: <arLTj9qVIE0Yz4vH@gmail.com>
References: <20260919163721.89044-1-kmehltretter@gmail.com>
 <20260919163721.89044-2-kmehltretter@gmail.com>
 <6cf8cc99-c2d2-43cf-bcaa-bd9cfc8679d3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cf8cc99-c2d2-43cf-bcaa-bd9cfc8679d3@ti.com>

On Tue, Sep 22, 2026 at 09:34:49PM +0100, Kumar, Udit wrote:
> > + * @num_rings: Number of forward/completion ring pairs
> 
> Sorry from where you got above definition of num_rings

Hi Udit,

It was inferred from the code. Is the description
inaccurate? What wording would you suggest?

Thanks,
Karl
