Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC374252C9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823817; cv=none; b=bIXJE1E/Sw3iOmMeSZygLtIXOmJkIr3dW9sJdd7HCHObWth6Nd3+nEFPWZ5j1Zi7+jLCN2JrSMa2IqREdckXxRWGMKNX2+V3uVYlXRaei6XVpPkHIS3zfCKEyIkcS9oxJL3HZ+iqm2v43heGFNBIquMSDdPGoZ0miK25XqaqTMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823817; c=relaxed/simple;
	bh=nAFD+3K5tJyDsA5OQxUN3fnA9raIXptCyzTjFd5xq2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHBpin/O+yk5wf8RsOgVafBCNv+IhW7JN9cxF0cAHivU2sHO3aFy3vTrn6wGgD34xcjiMeCfyQew9EmIuoH8w1LnyyHYlGQEFwsDUaFGkNppRmUZ8IisDj6X8MPMQXzbJMbOWRUmTec0wAlVED2fN7IRPSdKdLNZdUHx37DtNGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlDstutI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlDstutI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848761b5897so165447b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787823810; x=1788428610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HKJ3tAW7wa6wdeNZbsdvg5DDct+7sFZSSnnEf99jqQ=;
        b=GlDstutIPquRUYYvswGP75U2MIHJe/4k2MwbeeRC6+i0Zi6aoEZmGgH3YTyE4zC5Bl
         Iyb3B6pywpgLE46DjUQIK6OhnFH7kL5wgI+ktVD4Zi4PWG8lDhbfeRNk2/3Syx0fNNsK
         xpDAGkdg6fdRaaE26PAOMHzobYXj0hTe3AtAEAfJguh5t+o/07MHxqWj5d0qzkiWLQ0r
         avl93LTiLfN1bLVFUV6I2f/ORup9b2NAYf4Uv+cBzfJWBjki/xtipTeiPDmQyotmahHm
         lufG+q0Q3n0DZ1Fgr/v5rSzyPLNjBmM7w9A7ZyFBW8WuzLg2fcBacV1lCct45xlnkK0I
         IBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823810; x=1788428610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HKJ3tAW7wa6wdeNZbsdvg5DDct+7sFZSSnnEf99jqQ=;
        b=SqxvFUQeZqukwegjhu+DQEKi0A+r1JGwqeW73xlLVLneXeC8CTwVbSSRSoAL5ERLJX
         E13aEn0Ee1af0xBu7TfIWa7HvOoxuaeD6AMIB41SwatshROkeyrnbFCRCry5F4hHYI6y
         1menoHnXYd5XM4B+2LhWk/9J73Mi7hgxovE9LwHNM8G0s9zz3j2JlvjpRz5JbYSgMnvM
         +D9CT1LnjwiQHxtEQEpqfKYDy3AdJPYRkiCqRVXWozWDaioV909E+oGkDmPpi9LR0V95
         KS5OctqBZqUZXsfkcvWWHtsr4cNug/mzTycyCJ7KnYnGBDTD9H4CVqQW9oZpaewkFVoG
         z+nA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5tmVbJF17cN5JPEhPNZ/KD7d01OvND2go6zNyoSFOAaOAGSwYE3kMcEAcMmFeY+Rm811UXVqxi0CZHjA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+FJ0oUmMTVm0iSOevJSvtpQTykM5flb9Po63imAGaCvHB3HTp
	HPrATtboDq3o01im0d4HJ2HPf1lHnwZ0gIbebNwHErpfzPYlWSbm0Fv3
X-Gm-Gg: AR+sD12IEXkzlbgsDR22yiIpwP3BQU8EJD9jE8I45IKho9+PLAj2ElUbWPte3VfOrK9
	2+0QU7FjjvIdGpHraWCH8a5lfB87SiauXL4BfvXWxdf5XN6tmySEPi2COmExZNHsGNAsivKAKXi
	9DGn1rRq+aHBEGdhGd+H+Jwpb9grqebWPODRxWSPqel0V+zJSHzN2B33lZuYuoGzTFDs6ZUBc9Y
	E+ZUINGDyhQETlcJwf1H+ffR2TYReRcF1octlDSULGpZwj0z9xFYt5rjNLFld/GT4pwiHkgqnyG
	4olupbbFZ0ZMDrSxLVWluwfdjiKO6mh+Ayb3nUMGIeU2Odah6iqxR+R4nKILBlYL+vbamTkHA7j
	UQg2mbaqahr7mOr7ARbGYER27F/EHo809d1N7kDR+Y2yopcA4Zhb0h7ZArXH0rU2neB9aPgomzb
	Q8YFQB/P3DdQKeC5hRoKw9llViVsHvxqW03Etk6tcP/FcIg/A7+dr2dEl709Mrhhkn71CdofBpe
	D0HQ9Q+LlPGoBDbWc8TYPfBzm4H46iG8We85jRR6I9uYg==
X-Received: by 2002:a05:6a00:349a:b0:848:42d0:bc91 with SMTP id d2e1a72fcca58-853750ce0a3mr26520732b3a.12.1787823809790;
        Thu, 27 Aug 2026 02:43:29 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85359cdfeebsm1819566b3a.4.2026.08.27.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:43:29 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:43:24 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	nphamcs@gmail.com, baoquan.he@linux.dev, youngjun.park@lge.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Luiz Capitulino <luizcap@redhat.com>
Subject: Re: [PATCH v2 2/4] mm, swap: Move setup_swap_clusters_info() after
 SWP_SOLIDSTATE initialization
Message-ID: <apAGe5g99mHeIzlI@KASONG-MC4>
References: <20260820115505.20027-1-shikemeng@huaweicloud.com>
 <20260820115505.20027-3-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820115505.20027-3-shikemeng@huaweicloud.com>

On Thu, Aug 20, 2026 at 07:55:03PM +0800, Kemeng Shi wrote:
> In setup_swap_clusters_info(), SWP_SOLIDSTATE is used to decide
> global_cluster allocation. Move setup_swap_clusters_info() after
> SWP_SOLIDSTATE initialization to avoid unneeded global_cluster
> allocation.
> 
> Fixes: 451c6326105b2 ("mm, swap: clean up swapon process and locking")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

Thanks!

Acked-by: Kairui Song <kasong@tencent.com>
