Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75D030C177
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162365; cv=none; b=F9WKsErNnJtpytDQbpyY1dSs70qbmq2xmaPM/iQ8/V5PdLPxvsquG/umrFAI5ii40lS6eQXBLGcljWGgdX6lefpg4d0+pyxAYQLgN9oq59FJ2bP0YQQYxgBLs8mfSWcl9snfRcmaGeN5MKCbwxe2fPqDEHWjOJthiYJP5BoeYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162365; c=relaxed/simple;
	bh=wyiMk4hONwFxYLA7nMuP0zItich67IsNA/CfSKVmG0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmNDdujNKAOoILnnHPufwrb2JIe68h1iW7q+zX9+xc/IM0ndj0/PIII2p0ZFymiNBkL0hzOO+ghbvzn/LZBF/D610BQ5QNVnxKomb4zeigvfxlBuhsPlVY2UZo13WTLVAOTldYZzL4h5twl/R/EcauD9JLqaTAp66WhVYMHlqZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjJ/fB9d; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjJ/fB9d"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso65279a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792162362; x=1792767162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TE/6RzGv7jJq9CwfLCuEzYgVfWFh4QPtLCq+jerO/7I=;
        b=zjJ/fB9dxeR/PAntykLId6rysjdfqDPYdt79k9Wk0f2mpGN7cqNJVoFewwjTMBx0K0
         qcUQBtatNhVRmhhB1Z/OY5jyDd3FO4FrRbImbvYq0A/GMhZVOPd2bL/NjdMhBCCFohAv
         ydNttxOYaElFTSHVPDdvXODCpDg4XlwUN1aEYXI6X40XAsQumeVtxyHPO9CcoWUV13gl
         hj50XGmo9Lw+ARYDxiBfdLDBuMFg1yy7n9pLCvHvfRaRa2UfUgrVlz2koEd4ep7DBqJ9
         1HjYHyzAESMZbReQpmbW4LJE5XBG2QO/tK2sRKYCb1B2b7sV7NvGfCTG92ZyW5cmfnP7
         N6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162362; x=1792767162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TE/6RzGv7jJq9CwfLCuEzYgVfWFh4QPtLCq+jerO/7I=;
        b=q44oTZTyoPYphgUg3fWHp/lVKTYwCjsTwxdNTTo/TxXL5D0qrUEs7IlyUKoDMZY281
         sQ/DzV8uR3Le+oTWafECZZ1Y8LgIcQSvU1EaT57O+vF4xhkZj3FiPncihbO3OCN8eXWa
         KM+IClyvVDUtPhUxhWkVLuv0onbW19XybDAM5JM9/TiZO81ZKzcbGn7tY3i5s22hGMPS
         NZ83whZTKa3MJ16CPASVejFKXwtKQdppfQ0gMTp0vKVBtDVPKukbLvitMoFb866vjWLf
         5uMAewkNtzKAfn81TsmaDjCtj00eSX2iVlaxkKoqfyvfTataF6+gRtYM8cGFu+ykScOq
         prqw==
X-Forwarded-Encrypted: i=1; AKwUvBxOTtWhjN7BxdBvLFMZ86GeXXgZgMWgL2hs9jYv+EpmjQq7P7f1Ndt0sV6eFYAyip7zHNBZee76Yjx5Uc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdPEfpXtMmGzdd4v0/7GTUxSlSJEZzYr5XRkZYQAm6MYyzJCfQ
	wZOakdK1xNBnrFo2v6Zul0OlhQv+paeAWPsVIqsu1/AskWm4LVrL5ltS6Hk12d7xzqs=
X-Gm-Gg: AYBFou3DulwuuEK0JagMM06j+5JRkl/GnIl/m+qfEg28v5c2PXlodOTt/1m3+w8OBwo
	oljvmFQcul8uC6+pYOD/+ZtO+1iEUN+CoeysB74/xVnU6XmHjx2cPI74RLmjTYC+loLpLkMIdUs
	4pMAR9PcmS4hjeMPkoxiqIVZHxk6S5chA1DpbuJrHhem5B1xgyr0Ecskixr9fBzCJkFYobf2rJO
	NBWslSkBE5mr1LQjoL1jryStUEXIUDMAyVk8U7MKAnH+MpICXeD3GsFZIxLmXory+MwIVZs7oNh
	vT09PcyL291UQfPPO1q/GBOiVAAuoyxHtiXcg9/iRb7sXsIHTpTnMnSBHhONOvDSRBKFWEER4ms
	1Lkr6YVXZT1vWYT8nTH7Cl5uGghv+Bnp1H8T137a//CLFn92/RnEg1N5oZk1qsfw+WuzRIqyCSs
	s/4iPsWgLCe+DaTfQv6wF028nM6ZoguDwUoMZZuPDNzQg2ASt4GzG+94lKkSj75ewKx++/JnJNy
	w==
X-Received: by 2002:a17:90b:2688:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3acef13e5a4mr57248a91.23.1792162361887;
        Fri, 16 Oct 2026 07:52:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm9514599a91.12.2026.10.16.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:52:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:52:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: fix da_to_va() bounds checks
Message-ID: <atI6NxHI6zgTb3-s@p14s>
References: <cover.1791198233.git.atul.akella@gmail.com>
 <20261015151938.1331-1-atul.akella@gmail.com>
 <atI5VLH_CiIBu0tq@p14s>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atI5VLH_CiIBu0tq@p14s>

On Fri, Oct 16, 2026 at 08:48:52AM -0600, Mathieu Poirier wrote:
> On Thu, Oct 15, 2026 at 08:49:38PM +0530, Atul Akella wrote:
> > Hi,
> > 
> > Just following up on this series. Both patches are compile-tested only (arm64 defconfig, W=1).
> > I haven't tested them on actual mt8183/mt8192 hardware, but I'd be happy to help with hardware testing if someone has access to a suitable board. I'm also open to addressing any review feedback.
> >
> 
> That patchset did not show up on my radar because it did not include the people
> listed by "get_maintainer.pl".  Please resend with the correct recipient list.

I just noticed that individual patches had the right recipients but not the
cover letter.  Next time, please use the same recipient list for the cover
letter.  I will add your work to my review queue.

>  
> > Thanks,
> > Atul
