Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95B5221E7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806727; cv=none; b=CTv2CfeRo9du8Sh/jBP/0CiAf3/7F0EM/ZM0AtadNsyY4yJBuq4nHGmheEd5lGAj8iFfjhjlV/pvOvUGMOcQ21Jo4nY8fs6faqPy5P1cKBfwMoGgpcYiieUotKED9CttYq3uu0SeuAiEMlXQPxr3CoWcmspCYz3eQlZ/l2e8E0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806727; c=relaxed/simple;
	bh=MEIl3cnZEx9wSqrzI6g+3M1l8s9u76zrSgaouWKJgqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI9RcLP4g+2Y0QKkx66FIQWzDnLNnCJjO263mt7ARpJmtHjN7GMm/TJHnW1LnXkcTZV98v0PQq8KdarmuoJk3h9g3Lc8KZ2ix3AhjFdHSW46sx4d8Eo3kAJbSvdZPuu8wbzsRRu4chn7KWhqaC9kYJvU1ZQtFvA3GXhkL85U+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DrKiMHsj; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DrKiMHsj"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92f0b5ed131so463030485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788806714; x=1789411514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjn+XNWiK56tmINhkcWxojIKugJpXGM2NaDQl0J3MLw=;
        b=DrKiMHsjfM6Ur90m88K44F1686GiY3B/MM/xRptcDGiIykU3kMzDqsM63HzjR+fPWH
         QkashlcnM31jBXdXgzOIot26qjbrrTCJ2J0+4KnTdU0whfR/4KFswcEMUm+p/LcozLH1
         oROU8HwaacOEkpT0xOp+UUU58Ok6w/i3MTaVXD4fA2wrpuLrtrfjX+iaKtjoIsxxNMre
         S4YdKxy+Z1HRjeN7kxOzBB7Xpc/gnV7t1zuVwaaNUfxuOKX98qjH8ab/9VJlNFdd13YY
         x7aQHjVY3zwxa+2MtRD7p33gMOhzGRHcReNw0GLbe1tkl9iJmCR9fQ1V1asU4zp4YNMW
         Pumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806714; x=1789411514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjn+XNWiK56tmINhkcWxojIKugJpXGM2NaDQl0J3MLw=;
        b=mOrQCc6ica9Mt0jGc7y9LkIWmtA+pIdqyVq6Jzi2z1Dq/F2WL9FM5KGCXqSGpSN5g9
         R5YTphXFP2dmWQ7ij2coSEvKY9dFFY4gzb3iXfQLPrgNntRZLCBL9CDkeVH32btJVpcB
         1t/KeGbiT3QE+TqBX6dmlXOjhCpPRSbPfeDiv7kb32pKcGznzNbX8oYNAdkRhc8EeZ2s
         Qv2wYOBXPQBXJmmZFkOsrNnJ7DCx5Nr8omCXZbA/KVBQ3IjrbvhzSz3AxKSVwMDPLn3R
         1Cx7AzD2LuuoIo557okB37Th/tgs6LXIOeOzcHX/uMD52Wbo6he+MNNeOZQnpcG2MEZu
         3tFg==
X-Gm-Message-State: AFuF++kzQ/VDkULR+CO38OdYPYbJPekNF0X0pP6CPYUtM+HBwvajJOc5
	Xai5kMQZsy/1vyKg6oNq2zeVjfsb667mNtfXAE9jtmSVyvZ4oy+Jvt6dsygg0nUPqIfGLkENQSp
	sKTM6
X-Gm-Gg: AYBFou1zhUB2gjQyrrLTXssgKtWFY1tk6rtK5pPn87nePAlcb6TYhqcWuaYZVRlSzeN
	8gcqobMIITsDwSIPjlA8hD4ZbIR8ApTO8OYCIZdfQ7/uJGlOhohF2NNa3azxq7XPOI4CfnojeM2
	qt4/FWvv3pX70G4yK3iDdS7Lhl9JRr6lxCJOWq4DqmH7Q7419uzgL5EG+QBaGI+jey/cFNiqx2L
	aPNYW+R0Ig4q4YhC03c/OY97yVxaBc1h4MU/sBKyuvNfK/rTFF/5630d8xk0I3kdWTJSLXDvwbd
	TzHeY6MBhTa+hALgc0ijVoHMWqNyNGCmRrJEmV9+TxEVekQpHZh8aTETzrSpoOuZV1u9pcSImeN
	FWYmj9s8maQxYP7tfxjkTTNXXxBOAKekLgQjUjYW5AxlCQNf8ZmAMXDWPWxBlm8Uf+FR5/69YzE
	mhnIqDG+2GKvttJRkHnJ9e1c8Dt4gTXzvcPX79hYodwTi/HvfiOVb9BK+yabCI65bjL9euf/C3P
	iCo7OnlpcQtAyQFtMQkwZh0fJ+fEPDbOdpzhjXXDRakXeovm4aIlcwm
X-Received: by 2002:a05:620a:690e:b0:939:6de8:43de with SMTP id af79cd13be357-939804e9754mr2480105785a.50.1788806714194;
        Mon, 07 Sep 2026 11:45:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f151esm943101985a.6.2026.09.07.11.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:45:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3eLB-0000000BMS0-0MGY;
	Mon, 07 Sep 2026 15:45:13 -0300
Date: Mon, 7 Sep 2026 15:45:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jpb@kernel.org,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
Message-ID: <20260907184513.GA2543240@ziepe.ca>
References: <20260907154928.4012151-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907154928.4012151-1-smostafa@google.com>

On Mon, Sep 07, 2026 at 03:49:28PM +0000, Mostafa Saleh wrote:
> arm_smmu_sva_supported() have some residual checks for ASID from the
> original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")
> 
> As DVM was used for TLB invalidation and the ASID of the domain was shared
> with the CPU process.
> 
> However, the commit
> d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
> removed that support.
> 
> So matching the SMMU ASID space to the CPU is unnecessary and can be
> relaxed.
> 
> Remove the CPU ASID related code, and update the print for the SMMUv3.

It is OK, but maybe this could also be but under an if
ARM_SMMU_FEAT_BTM?  That is never enabled and is a placeholder to for
eventual BTM support.

Once we get the last part of the invs code the BTM support can come
back in.

Jasson
