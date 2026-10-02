Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1A3BBA0A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973770; cv=none; b=dF9iXppqDW/wofIFC1Tqz3ZX1z+J5ePhokqrBfq+Eou0iaiF5wFSyT3GHn7FG7DYuJd1DyHNOGXC0AyVRDBk4jbphLrNCurb67XgVM5h/j2ZbD1Gq5B3FWtD+rpKUzbl9kwizQjOUGK2mh9A+Sf0jS4R/A4q8c8V7ULExTNq9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973770; c=relaxed/simple;
	bh=dwtRjKhkCOURZox5r4dxPrPathbBrVq4ooD8VGaPU4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyMMrEs1ELU2L881Y7sFANCAAuZWg9iYdqkgIS829ITKrgT+ApCewIwtN74G1hA89zogV4DdTBULzv8gcNZFgup5jprYBfVdtG7idGZakPFzMjL29iDGCyyGo7irW7Jw5+HlwbBui3k/5vV2K8Zf48SrG+ra5w/ozoi2T1IGVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=h0YCIXag; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="h0YCIXag"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so235424a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790973768; x=1791578568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8zMcjeud7Qi3pjmuZ+bReUAhacHTxYCcXspTMMKof8=;
        b=h0YCIXagHWC87iDO8cJil/XKUZkQbcBmIUhAV0eBNgl4uS7RuHqQZgEZaUyqm9eF6U
         iqM9XoRCPV05nC6QV8VGqsoAvg/JS6ccSi4XP0eqqMTnUr347VkIYZWXOEYYJtpUCGAs
         P4wqKyGTUoiook+7F+baiceuFKw5gQz5gP3+dH22w7NT1rfY/RhARBJV9yjfrk0TIF91
         GNl5BUFcvfydv6C/pTVTwbC4SOxarf4LftOt2ICCEAS0L49EMp4mtTZ7XNjERgVO1tF0
         8tYJ4BN7jWb4gZVPXzDZhIIcWkJFnzNJTAuGy1ZV04l5FnotcP2sh5xIQH7mq3AdE9st
         cfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973768; x=1791578568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t8zMcjeud7Qi3pjmuZ+bReUAhacHTxYCcXspTMMKof8=;
        b=sUKhLSL3USab4uyqJKi4Fb0jrb3ir0nJCzqTmwAFyf6NEZJjrBCGfqD9+033156NK1
         2d+JwX1uz5Z0wVhImBpqUlaSlE9paGiLD3atOeiQw5hL96jNWMYJRZuAODARcJhuscSf
         AIa+9Ig1EXq3uKCVgdcbwiS12BLjF7SM3DBzbr2+0fklR1OybThTy6fzMeFUhJT6Xggr
         vlyoZVc+AfSC9HRXnoYHK5v4+juIB5NJPOaHw1UwW86GHdk6CzaLeDRcIytgIJoK6qA/
         9ILMVbJJSsJ9Ztxt75cDYLbIpASY2V+VYIc/cl5xBZTRzphtwQ6HMT5aYapMHvstIbgW
         Mz4A==
X-Forwarded-Encrypted: i=1; AKwUvBwJFSB1MEE6amKvcqlAB1qxxTLD4ay+UCOrkFT2V173thtr4sJZdj2L3STCHKMMJfvQl0CIP8XCwWOidrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcdelbyxqOLjxG03PPAOLjA785ZHHO3EdF0BmAX1QTUdl43jP+
	hJ6IukM7vljY6qWptlgMMtSaG2Zy8PU87DfKCZifBVWMuTgvcFwoEDP5Se4XqPXS+0I=
X-Gm-Gg: AYBFou1LHKtgL1efWckPso3itjN9MAnxthI3+0eRaKPkLDzekD1wEUaHvFcuWwRSj0U
	2XNv7OWxTMyAKfN+fFVkPTCdjLfAAnV2LmtG8X3VIln4xncGKSFn33+sUopybqzGSbyhsvXtap4
	8Yv6dgK6qw0jafLhjnnLWFMVZpwVYjylnDVLEHk+Gv/UqC09rlxKq3MlRY4R5h+GgFVe23VC/FQ
	E8JcbqfBt8iVZILuNKS9Xc+UKI08WD7FecI4RwswN1LShEsvjijJfok713JiO38dJ7UW4ByMC2O
	+a2dNWuczw7KO7R+z2ystqVO+lqXa0GsG1sJyQq0fTksP/EeK/jaKPjKkzM+8iDcoTtb6d20Dui
	zHDj5kNKejKhvq8gRKRIFVx1/QxMjFanKF4TxQRFTbyZUSANKb4cyXAqDS/P/AaoAqfMIGwiveH
	DGTZRGc090xnIO1uWj3xsYRYNA4SEYKFHsC7aHDf3jQkzIKI/oXoAlCSaif/qQueqrtqwSeXPan
	AwvbeHA8ck=
X-Received: by 2002:a17:90b:254c:b0:3a0:cd4d:5133 with SMTP id 98e67ed59e1d1-3a6ce3ba9f9mr2700696a91.2.1790973768501;
        Fri, 02 Oct 2026 13:42:48 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ac83dsm12018545ad.40.2026.10.02.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:42:47 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:42:47 -0700
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
Subject: Re: [PATCH net-next v2 5/5] eea: Use 2-argument strscpy()
Message-ID: <asAXR0eSlKPlT2Bd@devvm20253.cco0.facebook.com>
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
 <20261002100035.863275-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002100035.863275-6-andriy.shevchenko@linux.intel.com>

On Fri, Oct 02, 2026 at 11:59:23AM +0200, Andy Shevchenko wrote:
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Use 2-argument strscpy(), which is not only shorter but also provides
> an additional check that destination buffer is an array.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/ethernet/alibaba/eea/eea_adminq.c  | 4 ++--
>  drivers/net/ethernet/alibaba/eea/eea_ethtool.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
