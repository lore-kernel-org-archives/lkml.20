Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F73E49D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973457; cv=none; b=GBkEAxbLP8QRZyBKGKtC7g44T8AcI33VeKe+EIQyqQgGDp63oUg8P763qO24+hXXl8yKhsgJ56AamZ8WfAH+EGlNijvoP+AcFotOO+hYUuRcAseBNsdEadkkiY3Pu/6y1/t9k1Ad6zvPH8Vv8oXpksrWY5Ltjlvs+0xfBGQO2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973457; c=relaxed/simple;
	bh=piBmNj5rI0lM/5KZNljbCn4piFmadLH1W4LnMRaT9oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+1SO1KJeovZ36TGs8PschN6+4tLj+vJXUZHrpUwWizqHUoie1Cr1XKiclrD6xq7XMmiDbAbHyCTSYHj9yuzdr/wDmzKR0fTiwoKNCY47yLCd8lbssYKXwOlhhi3H3Or4bfur7pGpwEdgEI6XV6Vrakmd30aveip+j3e9XfIwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=JJvJTmfw; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="JJvJTmfw"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso307607a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790973453; x=1791578253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWyIbgtdG1xO//+PcoG5gcw5NnsZw/9pPTdZ/soZ+kY=;
        b=JJvJTmfwCOBoROLaOoVmvtNI4bL5OqXBzjEP/wTV7iqquU2SdUYy6Fe3kDvViOnUk0
         NpdBoT3f9FsPp56h7YhOyPqUW7U65jgtjvL5h0AKdlXrAn66gFGML8Lu9IkEUYneMK1+
         LZFv4wuY1PZNdOhM3Ni8ohiGWjJQP3Oe5F803+2LWyX1MYzJH+5Xy0cNx2fF33aOY2zk
         qKJTM75W0TgLw2xAjbWgpYjwQyjIfiU/jIsH9QlBg8MF/vcQkZxbRnw3TBXgUQQIsp69
         a77wY9gmaJdU/Lboed42W6GFYxfYHv3fSzFDBIR/N93YPltVAn8TXnK5s3tbwRMLUK1v
         3/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973453; x=1791578253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZWyIbgtdG1xO//+PcoG5gcw5NnsZw/9pPTdZ/soZ+kY=;
        b=wlRInGgepG/Ra3f4m11g/NvgSrStXUCG8dT981fUvONRc1ZH2Z/MwbwXPl7NCooixB
         xSzM4La5J/eqijmYlB1z860q8QLvUqJqG5fybZQrz0ctYUm7rvlQgUecHjJxi00MMcdi
         j2iUQC80bz+4dF9fj/EHIm2XcGPQn7bnXmxeA4oa5CbuTj0Q2EwYmM5+/qgAW2LqcnHF
         +0C11XejsS2v1c4Y0ojTq+riOFdRPq3vXAGKUxGH8qzRxO6M+TY7lDQSzuamJyxz/ptA
         e0g8PlC5l/5OCq3WKNlqBoZrj5aFqj+Z0xTlgPBYMIaHmhuxAZ0+Mh2TAnpBQiwpCo+I
         6Yvg==
X-Forwarded-Encrypted: i=1; AKwUvByX0dL4KeHfWDDMb814VF6s4aUzrUfD00mUSzxaipgRpEEptm4idXV/LAZlN599vDswU1GGweE+8CrNx/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWJrMsnotQLAjXx7xdjlxOmEqjVWu0/yI0+6vaLqqPldICi9PT
	bNsIad9egfyDDzWPaJXZkKkUpYTAfmV/zX+nDDVzsFd+vn2jITQ9WEcJAl86VrocQ3Q=
X-Gm-Gg: AYBFou0i4k/lODppwrcCno230Eih2+d/mS0YVXa9RfbWSpafANF9Oka23mYFoAkL+3d
	MR9RE46avm6mEMqsuTA58k66ZIX4WUbbeF49VKV1ebuxU8Rhh4EKrSR3uhUaMmWf6HRq6jNtkr3
	5xn+YVx/Xxevur8D07OoWJBlFKlIGG2LckFvNJFKh9tVVzn2yNSoSAuZTJkRxVY/5g3P1Sp/gMV
	oQLLiQgC/W+r0ytfSgXL14mRZqeR4fDfptMBWg2M1vJDwKCzcW75POeyp1A53IE/o1u7M0wCizT
	65GKqSZH66PzYAWNJwUp3HMJGqoHALU4VeBYNkGsZqVMJPvycr73sB9BweMJcrRGsUtNw7mkBR1
	KUwbq8u5wjF2gH7ZkfmYek5ADjlg34F+Pl369v5GQ/4PeujSNYUM1p4TAiXSbws2/RmtGObBlYV
	P5q+pGmZrMDeEA2NJeAP1bGb6wh6nQ5l9iaQizESPcnkAoDM+ra7mzrA0AmofYYdUICi4hg3zwG
	A4soYaxX6QD
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr1664206a91.23.1790973453013;
        Fri, 02 Oct 2026 13:37:33 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d183206sm51091a91.0.2026.10.02.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:37:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:37:31 -0700
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
Subject: Re: [PATCH net-next v2 3/5] eea: Refactor error handling in
 eea_adminq_config_host_info()
Message-ID: <asAWC3KzE9rzIYNp@devvm20253.cco0.facebook.com>
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
 <20261002100035.863275-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002100035.863275-4-andriy.shevchenko@linux.intel.com>

On Fri, Oct 02, 2026 at 11:59:21AM +0200, Andy Shevchenko wrote:
> Use traditional pattern to check for error first in
> eea_adminq_config_host_info().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/ethernet/alibaba/eea/eea_adminq.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
