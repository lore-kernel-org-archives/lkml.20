Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D4394797
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235064; cv=none; b=txI+pYKjWA7F+ADibqWSYWM+NxmgBAwrU0sERPn+C7R/nAV9brNjxNeObK8KIRwlwzXtS1lgyjW+S1qH0qtRtu3mbXIGnb+yTXmEMV5TjoXluI/tMUCaJUR66adoruEnqbUO88mgUIGqBRjXcC6JyDwu/QpsJhsgQFBkN/Mg/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235064; c=relaxed/simple;
	bh=2PkaU5TbFTI8MHj7BOso2/r4YBu8nhLgzXo03LSlapk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj/i9XoEyYjUl9HRSvA2jCmop/bZ4mBdOTyYSSYCoqrnkmJ0S/9t4WGT6JAVB2Yqeevhcp8RrFmuMsv1hvQ0eNoiKJvij2ddbVAXeMDWRdkF+nLRvu5wUM+tNZ4ayXcoYicukqORWvDhxDcN2eniyLzoknIHMufvMmeCEnpiuOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhWCS+R3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhWCS+R3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so4836525e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235062; x=1792839862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2G9ZJTSg0XhBrGZT3d3dKn6X4ZPYelm2j926k8i4T0=;
        b=fhWCS+R3a3DZerpE8ZguGARRbec+6hSsYIKlc0/zIgFrMTit2CsWuyfVlvqRQbA439
         WaheSpWC24nxznJ9vgEGlK4zND2yCoyHfT8yN48RQFHLPLkNAXAyZhO87MZD0MNYs3wo
         d5JkWmSqaFP5YUUEDYtWkH65j/Sgapg1wx0MNs7/aeJXH4A064JY4X7C4ClO3YwXuNlO
         pItka2ziX/uDnVEDCXJQLrEw2USw+OHNRJwkL8fSIk6DpQQPNBeXFeAS2Fm8mo8f4ZPm
         RM1Y/bURzjc/dyw9C8RtgdrySWy+0SIl93XCxjdDJReOEftWq2qFir9fXouOat9gdOTV
         NDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235062; x=1792839862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2G9ZJTSg0XhBrGZT3d3dKn6X4ZPYelm2j926k8i4T0=;
        b=oHDl1ekwuLaIqepBDNqBf2Cg5CgMJOTRbiEmgtCroyehFasIgY7SKxuiqh1RfE4SPE
         lIZpqZFWY6g8uEY0WleeYjQt6Q+xnO9MZnxPPR6hN2hn8+O79OQCLHehShhB68ITKFPi
         4s7bij2voZuwWXck9FMUCOAwQaDxlaYQGsPNQbEBOJ5rJRu1j/DBettqaOC3Pnwb8jtI
         D8a4VTGdT/Knz5ODqK4zRVHRhG2Y8oFrfe/dcrG5989T2MMW/9FSUcHnnbIBANVIbtDQ
         8FD8WWx1+hwlsaDcUfp0k5Son5BjXv/Jl+ihes1dFzuNybneSH5TEbeI7m8CAILwc3Ll
         YTEg==
X-Forwarded-Encrypted: i=1; AKwUvBzSamgBqZ6KsuVRYXkSiz/33Qw/igum4IYJrDSI82m14MifgBJRbsA5uzWC9xwIy7fXrtAvq06ymXK52sM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhHacJi3jfXGGjs1Xne2XgkR9sEgO/QYlqCn9cPsRrEBTHMpj+
	pze75wbK2eaZxioBPRr3TUGYEpPesaA/D2JlEFPYjCnOA79UKtOgKX5y
X-Gm-Gg: AYBFou2M7xgl7aRbLF6Qu5gHdmmQmzoqp9nKXvW1oN0bWFIwVik8M0ED2ZdW6wVetnV
	sB5fnsLFj5Pdv67vNipC6WSMUv0gQOzVSZXy/ISLaMHe/jFIyErTIRHlMv3JblsmmZcijn522lz
	dN0J/ybpLYe2DYTobLC2pPuwyMYhfEipAKm2I9ahF7+qnwZAraEbCN3bQzS5D3xKWst1Y6thO22
	37Z6GfcUccpv/8OSS5RG+abUEv4XeB1fa5yYDx9jWJ+amd1y2p9SAXqWaWgCy4CDMQxUloUyT0m
	jYpHCkVj7bN4Ouw2kZzLsf/GHWGYbP/sjTit+896ItWqqUlrpGp8R4Yh2y/GLa3OFj3j4LR2sbb
	82dcwSIvmntkuDVrfaYtX7F2TcwlhfvZ5UMbc31lyP0wkf1movpX6vGskZrqFeMhCr1molUJZsE
	Czq73X0Ef9ae8+Pfd8qnVYaSWd6wXOlXTGnud+bxsO7qMOtAnfmvImi/AaeMGPijgT6fAXOD/L9
	8C5Dg==
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1d75f987dmr67689495e9.12.1792235061513;
        Sat, 17 Oct 2026 04:04:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm245158245e9.1.2026.10.17.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:04:20 -0700 (PDT)
Date: Sat, 17 Oct 2026 14:04:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Feiyu Wang <wangfeiyu_mc_code@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove multiple blank lines
Message-ID: <atNWMLAznJJqABRA@stanley.mountain>
References: <20261007104610.128178-1-wangfeiyu_mc_code@163.com>
 <20261017103549.6555-1-wangfeiyu_mc_code@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017103549.6555-1-wangfeiyu_mc_code@163.com>

On Sat, Oct 17, 2026 at 06:35:45PM +0800, Feiyu Wang wrote:
> Hi Greg,
> 
> A gentle ping on this patch. Please let me know if there is
> anything that needs to be changed.
> 

Same driver.  It's still there in staging-next, I think, but it's gone
in linux-next.

regards,
dan carpenter
