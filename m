Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760D33C53D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772617; cv=none; b=QDuZs+RxPmaPDG41HVEEN52Ofe5Ldc7WxMyd4auWoMeUWE92Y06cfwAHexRAiTVXZMHa1HwXsjcGiL6PxVduSYvCHhCoQBwKSxF6XMWbBBmVWJAGUgELWUNh8SsDVcY4uGR7GNcGgFP9zJD2dTKRF00hBzTHT6SiRd/zYc2CLvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772617; c=relaxed/simple;
	bh=Ag31WG301/ShadTpa5dRbVVnw+XUmrr8H7KNNlqSCqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auwHtVWw/sYthsgx1QQAJEjWilcjzLYlLSTWCABxX0fcrZZRVgY1X9LFDSwPdLiJmDZjykHhEnCnnfOV+cgRgybA1ZSn9dcMaHzFhOFoEKHagj/tfnl2vTalHq2xz8JBkC3l4p65kpo1Z0CBntg8hgpMKjtaK8iaeVXm4bMUNG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=LC3YmWzi; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="LC3YmWzi"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so1125049a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789772615; x=1790377415; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxr2TwzREjEnFDLvjUopvgMY8InQ0AKsNfK+3vVt0rM=;
        b=LC3YmWzinKLUMu8rw4lr3fXks4vCw8MD+IdhqxTYUvqFbKB2HQm86O8pCCFgFuDnbx
         KcVgdMz7HKQKNLv8B81auaYg+fcByzBs/Qz4Mm3ct7E43c72YsE9m76FAbWgKvH2BBT1
         0oxKA7D/vLchPNvFWna0xw3TjONKzxrqWjZXzQzZMBGPD2aE0/KGvw76iph9ag7s1E3X
         SiePLkLs/ZdRNCesfgNFSze1v7HiEo2vVWVbHqgsMgGUtVq7fSIAjXlpFYMgNAH6/NCU
         wBgyhqUVMUtl4OKJiWtr19ANXlyKHqNUmPzn4cyfHLNFzx+//8hppnKGb2XJnu8ssT6t
         7AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789772615; x=1790377415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxr2TwzREjEnFDLvjUopvgMY8InQ0AKsNfK+3vVt0rM=;
        b=YVSymb1kCtHGDOnqqkz0Pf7R7EBEIJ5jtHjZ/PC4lE4OmNvaTWQiuBca2yHetA6Qvy
         BF9iXb1GJEcIy8w34ySjsuerHwElAUaigzM52WNV9VXymtSSKF7lWLn9U++2ZYjZnJRj
         mHyjsBXMSHvX0yuXW8IDhAvZkaA0CzFY8dgEpJUrBMaLQ/x2VF5u7Rfg3UCCQ0unNO8s
         WenbsOlnY04Gi4gUrMPEULkEJUROGWuVUdedF4szCJMKg8ZFjKuyIGY8YdnfA5Dm+BWt
         ZEVN+QPYCwyyEy9eM5sqiV7HPJC1dmx/cTBUE+L3Lbhbco794GSeWKLpG6eRri7Eqfbb
         8iXw==
X-Forwarded-Encrypted: i=1; AKwUvBzwLqDoCTNEngvJj9AW0VYoM7cwrflfBdlj/rglZ9yvUy9G5TEwoZBBgeUAZ+JR89K9Uwen9cE6udkwi3U=@vger.kernel.org
X-Gm-Message-State: AFuF++lx3kOnp+RjbsLw9mGkFm89UpG7JmeYG/5C/eLGg/tQgd9OWdCt
	gaua8K4RztfrL5xa9yxf30mIQekrDxNHNAs45+iOZaq88AjQNZ0Tfwv4Q0g+Y1feo4o=
X-Gm-Gg: AYBFou2Q0qXACWVLlcfbRv6XkmDz5tkBhsl9pV48Vln62n97bbrE5YOvUEsDY2t0Adt
	aqfOtkfTmTzLBmPoSxF35BzmrAYy1l4MCe/6s0fPlp0CRnkhz9bBQEWGyRoTW+HXN3mcjXqrPJM
	Fq+jRT3V9YGUtQ3wnWPPW+7U1qgKtccvaxB+7IPUNd7UoCkGUK6CS47mHKtnf8XNKTnjT0F8f7S
	K8V8dnE3tnjbHXv8FkLuzaX+85ulUvFk3Uz7QbtKHpniYG3uiPb1d0S2jr52y1I5iJ5fkVRcf+H
	K1cLzcDbi5Mkgyxw7z8/gk/qCUSkutLojTN/7D/1e3QeSzgWKDYTqqln9FayTPsla2pHUTffQce
	eStW/9fYcFzSzOeId0dtYc+4StKp1ZDlRV8Zd6Ts5+81DTFRrt8+I07GPi3ove8wIaBPu9XbEM/
	6ORYgvkwg0bJKDoz4N7aFesIJq1DKb1GhLeXAh6cQYm7PHqeZ0C02U9Ha+U3Y05eg=
X-Received: by 2002:a17:90b:4b03:b0:39e:6c69:9b94 with SMTP id 98e67ed59e1d1-39e6c69b24cmr1436649a91.57.1789772615034;
        Fri, 18 Sep 2026 16:03:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb427casm1418570a91.17.2026.09.18.16.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 16:03:33 -0700 (PDT)
Date: Fri, 18 Sep 2026 16:03:32 -0700
From: Joe Damato <joe@dama.to>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Sashiko <netdev-bot+sashiko@kernel.org>
Subject: Re: [PATCH net v2] eth: fbnic: Avoid rounding zero ring sizes
Message-ID: <aq3DRKLjJW+8MmVa@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Sashiko <netdev-bot+sashiko@kernel.org>
References: <20260918114641.1281172-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918114641.1281172-1-bjorn@kernel.org>

On Fri, Sep 18, 2026 at 01:46:40PM +0200, Björn Töpel wrote:
> roundup_pow_of_two() is undefined for zero. ethtool permits a zero ring
> size to reach the driver, where the minimum-size check should reject it.
> 
> Leave zero unchanged while rounding nonzero ring sizes. The minimum-size
> check then rejects zero deterministically without changing the established
> behavior for other values.
> 
> Fixes: 6cbf18a05c06 ("eth: fbnic: support ring size configuration")
> Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
> Link: https://lore.kernel.org/netdev/178971206933.22033.236948278674126701@kernel.org/
> Suggested-by: Alexander Duyck <alexanderduyck@fb.com>
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> 
> ---
> v2:
> - Preserve rounding before minimum-size validation for nonzero values;
>   Sashiko found that v1 rejected values which previously rounded up to a
>   valid size.
> ---
>  drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
