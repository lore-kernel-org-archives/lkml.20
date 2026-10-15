Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF1F30498E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034656; cv=none; b=KmbkjJMiXXcAuOPPAh1mt/yoUn5JHOLPlz/MMG80C3N43WNy1gjWnVzN6m6tqueyM81jzLLUehpoLEb8GzciL7Kts59iagk4nG17cXLQg7BlLRHeCdCRL06OiHqCE4X9t9k4WH+jr0c76AIFRjsP8e+CoddsjeOyXue/It1ScmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034656; c=relaxed/simple;
	bh=JOwG0J0Pxa0giw+pSldljXOspqL7h3Tsw0YcmIbRJks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWQXcLd7tac7Xhh13CEtdxiXADAsWbxL4kw8bNEHOBlqcqflycKdy34+j0rx0YzOf7+JlncOWW16NcbxEQChNKs9ksV9nMhh6NmwtgUITKqaFDtlXn6/MZvYiiXCGOg/TUxmSAKWw4E7BfmdYGIp1LLSkI+V5Sv1rEI22vPLxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oSJF5zfZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oSJF5zfZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88b7d853b11so583542b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792034654; x=1792639454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RAKj7MN73RI8tJkT02x1VHOxQPPjvpRldJHyl+Kj5I=;
        b=oSJF5zfZgi2K3+RYrUEVBu77Tzi2qD0UMYeTr/6vugevVzr/lH9Oud7UIOmI5Fgovm
         dxGLdzsf21ZICkmTFyfiEDK5NKtl5aC/IfDN+PexYvfDkDBNdjPKsIQH/7vwPnfqpdeN
         WlKn9PX8hW7cUw8EdpW65GwCMc7ixVfsnZbbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034654; x=1792639454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RAKj7MN73RI8tJkT02x1VHOxQPPjvpRldJHyl+Kj5I=;
        b=sop5PrZ3xRDBOCo6AGBazU5czSOLwhU41oDDu+kmpPv0qFIexP5vx7Nb3R6/kaSNf2
         pwDiIb9PPw0BFW16gIz2hFziExC5a1y0CWobgay+ndOnR/8VQJCVTlUOqb1ale6DbPnX
         haHxnheQnd45hcGT42syAjontGzpHKntLS1l8+ITtHsxDSEVK10+Nyjk0oQZqQhiTbKc
         vJspfjW7HN+sraDnd75+Hnkxjh9kQQxDi4Ki4VTnmGE93EJXrG5Y4CI2J2tXfCsdpchr
         mE3y+Jt0IWx/4NRYOYDnLcfwY6rA2gp6ApP7oLD9G5VYJabiDDhlOLNUAFolySbGU+gj
         hUvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR81NDGDM6cXuiJpt5qbd+QlqpHnLBeIiGY0fRPEPMgXBfaknc1KB0K/Z0PAp4JoFHND0Jr73r147uyGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ/b1WqAGAo/P1lIjjdv1buz+b2OB2hNZuQYuU/GAYGLtfkAD8
	WB+RKKL573jwv9yrovZ8jWBtg5sMbkCiatWP4Sti4AtumUUyjWtMcwenu407ktLSMg==
X-Gm-Gg: AYBFou0bOhT+RfyXgC1swOg4a539gotRihMi/Bjzhk70iBaiReIyh0piey492ayO/oD
	cG0x/vcsoWoIZhuf/1duGChtEzu3kxQf1cx2M9E+f0IilXRsbjAMNV0GcsmoMLgcmB8LeklCNaG
	FN3BVtN6hnjKzSxLxpRZRVdE6rstdu5nmw4Ek17sLb5WN3dntACTGiWgSa51ykaPlAVTFd+yEOn
	JFALs7xJnOS3OEf5nuwAK9e7qiaJOD6tfEqzDzStztbVpU5aAufWhzyEQp+3uYTMhYm1sKsKGkk
	S/l3zPv+dB/ngUuPO7BmX2N7T2gzNabFAw4UDJHhAcdeLadalP+nTaBQbvkW2DPNltTZhiy7uZq
	XdAzrJCF6Lj7qP6IJ0/gDUW7SecEuno/NfzXNV1pVEZjYBVKGxs29RkcrFqLyJmudbMdY4/VfxX
	sXlT/Xkp1KXz7stTqIHEkEBN3o3VBdE1Ae9zMcg6Qd5JD1B3AraeXvvgTxTmOORbnSRPSEbpdCg
	u+o47ZGuBo509ujrsgKRKD52zAa2MPEJ5Z8ju6t
X-Received: by 2002:a05:6a00:7615:b0:897:dda6:ad35 with SMTP id d2e1a72fcca58-897dda6b684mr11707767b3a.41.1792034653406;
        Wed, 14 Oct 2026 20:24:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:8455:7899:5a2e:26f8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51ff63sm1700395b3a.5.2026.10.14.20.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:24:12 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:24:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: baohua@kernel.org, senozhatsky@chromium.org, akpm@linux-foundation.org, 
	bgeffon@google.com, minchan@kernel.org, richardycc@google.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Message-ID: <atBHDEBCVL6Ae0hT@google.com>
References: <CAGsJ_4wuPCPR0DnbrLp7ebdO=Oih6K_yP4XxwETKQ+3U+THVjg@mail.gmail.com>
 <20261015031940.1410875-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015031940.1410875-1-zhangbo56@xiaomi.com>

On (26/10/15 11:19), Bo Zhang wrote:
> I'll also apply Sergey's vm_map_ram() patch (with the memalloc_noio
> fixup) and re-run on-device. Note this only helps the cross-page part
> of our exclusive reads on a stateless backend like lzo-rle; it won't
> change zstd/deflate, which stay exclusive regardless because of
> create_dctx. Will report the numbers separately.

Thanks.  I just sent another patch.  vm_map_ram() is a little of a
hard sell, I guess, because of TLBs.  kmalloc() patch doesn't seem
to be much worse (if worse at all).
