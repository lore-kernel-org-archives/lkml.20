Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7394E318BB8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126514; cv=none; b=OShzwtJgGU0fQT0q8a79C6DPoBUESBnykUkodHXze6qdt4fm02NqInxFHPlLwf4Y4pOyFY8uHzfdd57ORVqv8Ab2b8hBZSktiNRdoyPJk5jf7Tz9IVZZxtR2+2F+grhMeXmwvywl8E2zgLWmuCidPk5vDoETuj6CGWP7VMJa/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126514; c=relaxed/simple;
	bh=+5iE193CcANOKRFQzupZHipdESjlCYOhgkDtgw4LXK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psgwjN0xYjHwLMRSTeCJHuLGknP3YPMKXUiz2w2M1I09Id5MIXOsqaS1jFizTPNn5xbJ6WZ9Z07Fkaelwi9JmzzwP4BbVw5yhUs3ni54AuRMjTNgmf+thVUXC8FHsOvxXjnHdejVYUwz0YDbEcpkoll6DwR3X0Pk9xPXJ1Uwmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8EUfwo2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8EUfwo2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-486e8faff03so2595698f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792126512; x=1792731312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQWFKxuzzMgUKGL1MQJ4DQ3TQ8VWfkposnOCjkIVtBA=;
        b=I8EUfwo2IXv3yt4MoFiObtp5FwAQ2cv3I45ygrz/rXXPjGqQHEP4ThXOXo/xR6KvTi
         xqJ2/TsNG2g5esEzKWmENvbOYylvUwSXLRPoXqg8Io5+pHTz9RPeHQGJi11W+tYogpHX
         zSE8naTlPFxzMVieHMMQjRsuj0kjbrPXYrqiPAn5woiso3jN7Eh0xQqzTSj1APWBEKSZ
         0QQGljp2ykby/x1wQh623raILlSEkX0joJa/4P/AbwbUnwNPLePDELH5Ml29BGcVUbxK
         +lcwo8echCMv91JacgVIcUrNXUxTfi2qr4QPLX7C8DwdX3eGtMaLPBIYsN1agvNGaaA1
         jAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126512; x=1792731312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQWFKxuzzMgUKGL1MQJ4DQ3TQ8VWfkposnOCjkIVtBA=;
        b=khEJ7FhxI4KJsmY1qZkgjUP5OzmxfAiDYB3sFDMDzVZ3pEiiI552dx2brfz771vlgJ
         WxRCE7vFI39LvtmGz85hOFIuz15r6gbT23/8fgw06xf/9UZs6sxrf0+Gb/Xg9Iv5ltg/
         QlmXZQ4NCFh+Wntb+0F02EFMUW2Z9zlgCqnHQy6eYDz9hX0v1eOy5wjl4mDHovq5K2w6
         Y6SIyjE51EkfS9Pa377tHmVjZ7wBcUdrpt1cYSIV0jwB4+wcDtegBQN1wgcNLCvrD2My
         40FZsYzzovA9Cv9qXkDpmdEROlL94oeKd6Q10K3PwCqR7PW3rBGOUcjB/nXv9qwa2vzb
         aK8A==
X-Forwarded-Encrypted: i=1; AKwUvBwURWNb4RVnxekVyLNcMlMmGzSWwdwjWu7QgFeAIe1pvCH+MYAcAvzR3qbsIV7kjwjLTxqGN6IrBjcpsgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQfM3zsonpMeWlkTrPKnTZJERbuGsDbOsuserA7oD46QxJrind
	LZSn8ns5UWMSDjJxjnR14rUeKRiWxIiWXKJXDLuyIpMg6ywS46FsJPqS
X-Gm-Gg: AYBFou2YMBZ/t0T4A3awXFKTvWtwM3mXgxpVTEt6ugXZIx9fPozdqYVQiwO1fo7qF5R
	GnA1QzfjTFmk5nOChj/IW4qVDFv7GT6AHOtGUQLg3psAWSm1UB/Z1ikUozSquFrMLfZvU0+cnJa
	ila8ekc7Icg9P3TBVyaMsJbcYMiBdJSZEihWZ/8eBcUX3FqwLl+OAbOblfEZzhjSl6Cwjf78R5s
	PiRyNyRDESmdIqfWKJ+2mJqxme0JYA6E5QGvlBANYI3dUQekMJYPbqH1uQTb74KOxaXfX545lCH
	6FDbgcFdxTH7P8f5pSTJJODpBVTthjSwHnoBX1rPFC7zsGIW5nT0vsJqPATg/MsZywZvUUwe9/Q
	M3cSkMjc8/2tnb1YfBMBehx9Hbrmzg7MTDoT/jvBbUWcSv6mOUyNLvXfwr05LAMory2H+AXuyOU
	kF3kUKjTOhxIPo4MCExX2lkNMWeKP8MLJ6edzNE06C3ZhhYqaBtlj5lf5TEmqfD7I8Pbv1BTS26
	MsBUtCmfP+otCWQ3mWIrIokFBGGMZ7wrnugAkTVPMgtpzAJOgApEeMdAilGaK1RRtaNNVCtQiU6
	JeFXggGw4yic/js0sTeW8RsYZ6yETLz4b8wmXxrb02qFThc3tXBktELyJo+O1xru5rT25FP8ob1
	+yHOY7QFyQw==
X-Received: by 2002:a05:6000:4a07:b0:48d:f25f:5a14 with SMTP id ffacd0b85a97d-48df25f5ad3mr9567344f8f.49.1792126511382;
        Thu, 15 Oct 2026 21:55:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d080sm2455314f8f.53.2026.10.15.21.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:55:10 -0700 (PDT)
Date: Fri, 16 Oct 2026 06:55:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] udmabuf: respect the device's maximum segment size
Message-ID: <atGtwBE_zrIvU0ZF@gmail.com>
References: <20260929054835.94118-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929054835.94118-1-kmehltretter@gmail.com>

On Tue, Sep 29, 2026 at 07:48:35AM +0100, Karl Mehltretter wrote:
> get_sg_table() merges physically contiguous pages without accounting
> for the mapping device's maximum segment size. This affects both
> importer mappings and the udmabuf misc device mapping used for CPU
> access.
> 
> With DMA_API_DEBUG enabled, DMA_BUF_IOCTL_SYNC on a 64 MiB udmabuf
> reports:
> 
>   DMA-API: misc udmabuf: mapping sg segment longer than device claims to
>   support [len=65884160] [max=65536]
> 
> Use sg_alloc_table_from_pages_segment() with the mapping device's
> maximum segment size. Return -EINVAL if the limit is smaller than
> PAGE_SIZE because the page-based allocator cannot honor it.
> 
> Before commit 5bf888673e0d ("udmabuf: Do not create malformed
> scatterlists"), each entry covered one page.
> 
> Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on v2. It has Reviewed-by tags from Jason and Christian.

Thanks,
Karl
