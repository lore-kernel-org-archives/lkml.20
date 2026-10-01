Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172743CE51
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833420; cv=none; b=qZGhoOwZ0oCMiFS/zsn4mjD+zvC1sL9xcj9IHGnwpHo/wNpjaQ8OVfBnNtL5F+JUVDOClwSf1ejBUkEhFMy4BKCiuXb5Q+MMQ3HZbYHBdgE5Njl7exFpn/s2vM1QAnprcC0+G9A7RESccZl9NYdKOoipdSTx96l4yRDUvyqDg6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833420; c=relaxed/simple;
	bh=rcxUxarvckFEbzwc+77lGqnMQwy+i+2zfogoe1pGPuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DesbyWaLhsQ+qKOKr4ISq4y5XJAuQ9sNCpHTG46/rA+9TM1KRAONhIzUJSfqBNxvDq+ZNPtEJv/A5DgIhIT2pPSRYBqtv5Qnxc7lO8NnCOiw4WD45xxUbIECZa+ZLjx2HwyIbR8ftXEoNV8ha91JUUaURXsuC6b6aYCqPoYsyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ih0YrXAC; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ih0YrXAC"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so9201115ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790833418; x=1791438218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgvrIEOpw88VrEORT9HbHbyuQrZfBbC4ttbFKpwgFuw=;
        b=ih0YrXAClCgFBCn9SASE45n0KaQdTZ8sJoUMQOnUf8WH3BD1LIfrruRykCRU1vYoeO
         +JIpWL81LBuL/fJHeNPsCvUMiL+CyjIGo2FipCNL00ln5x9BKDkDNI67yglabz31gfAG
         13ut3ETxcZHXx2pJII9NFqw7+srZD48spPcXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833418; x=1791438218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgvrIEOpw88VrEORT9HbHbyuQrZfBbC4ttbFKpwgFuw=;
        b=NWMiYSkaB5y4t/GIcouuXzMFBbDuRQP1dtOx2pU+Zz+OSYjzrUmIFPYtLp7Y5qMyI3
         e9aMbC6XotPoxvosaAn59IN0QobiHXdfSTm1aSx1edCu4owaBhdShZaSZ+tj7Tv9/317
         9OVPCUfXTvruq6gfCmEx44kcg9Oqsyvis+pF2G2MfiHwtr5zeA0565gvlNCqKX6kDP/U
         BXoQYY9bCZXZJrmkaPNvhypsBfjNJldSbMIpiwR41o5n+wFqK3MiCR5G+vgtxwhBi34X
         EPhrow5fLORX1h5V1q1Q0W1VnOb5BwPhzNkjcfeDrKjtxFblMOKmB9jX1Y9bLBtXhWgt
         h02g==
X-Forwarded-Encrypted: i=1; AKwUvBz+89JvPqfmkDnQMRcC7s5QEXA5jcidAdZkjZKJLPske03SuruvIwKbUW+FcYcpBvE7T03X/VU0e8xMfxc=@vger.kernel.org
X-Gm-Message-State: AFuF++noNX2pCZZuZE5uDSOjtRZdZDmk3KjRjj6aRPrYXWTl5hGUbD2B
	M+zyJoiiRMNE3evh4EEYdta+d9/+dLJNKhjJh7hvBf8VDZKDwHGz4yGdfSWCHNqydg==
X-Gm-Gg: AYBFou1gze+fZm+XgvCatBMHMsXiAOyF4vxsSwt3wqqO1OcYz5V9IczM3eeO2sjHhlh
	TRRPCQwIGI+xEUzJSXWcTAdDN3bhIRbzct4FA9TRvwSdpEPPtGlB675CiOFNSI38dHs/NB7RxhF
	v5/7WlLn5WR89FsNmrOgpRYsRaMKebPxv7B9DcmD5oWPG+mk6B0a/oDphQx5QbLROyf7kskGvaK
	g5lS1vlUmwDNW0KwhHXhv8a9gmIVqMF3ctreBQIWzV59cDC/Kcz6mv7mTuP53RuqR8cioZFKPum
	uMmsWCNhV4vJ+koBogr1XI9jqhGteYIXqTpIUpswZcb+ODDbSqrnK33Uyf4/OgHv2LrTkeJ1Sdx
	xa4BJi2YWm42UnlIFn9D1ecKDkyob7N6mbj9HF6TXizz2U/xgX7igORMNo+79QBCPk/3KcnRlb6
	aq7FtTpSQq+BbvsPLPbR+dEuY2jkhY0UdFbdJrEhFTJ9iQblmbQjSY0TqufMyyuu7c99TdzdMGu
	EshTGYOy3pZ/3fyys79dK0OBV7Z0MkUEfUNq8VaCt9iMGavxA==
X-Received: by 2002:a17:903:3503:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e2e499e1c7mr26745355ad.21.1790833418058;
        Wed, 30 Sep 2026 22:43:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d042:b5fa:ebeb:ace6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30cc14cbbsm1942765ad.37.2026.09.30.22.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:43:37 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:43:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, minchan@kernel.org, 
	senozhatsky@chromium.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ar3yt8Kl3WUV93lP@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>

On (26/09/30 07:52), Georgi Djakov wrote:
[..]
> @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
>  
>  	while (backends[i]) {
>  		if (sysfs_streq(comp, backends[i]->name))
> -			break;
> +			return backends[i];
>  		i++;
>  	}
> -	return backends[i];
> +	return NULL;
>  }

This hunk looks unrelated to the patch in question.
