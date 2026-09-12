Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A11FBEA6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230915; cv=none; b=GL8z/qw6B5h9jCVd4W1uAtQm5+FiCcjOZrAJeCVxFqajSTWliJX5aa0HMEfIVQr6QsTo/qD0zoZmsoxJYK7aKNMRSyycdrlqkvKiBC/K3ljgvHaLVrITc6nOOgb+rRbdbDULgbEZZHpwa6gqfDgrNZcvsS56YCVMlHO8I5RHHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230915; c=relaxed/simple;
	bh=/UkmLIKvxg7NPpJFYsnzEJkxXFF+3MH9bf98JmAddXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly+Sq212oWZHYm97gb9TovBp6jOFjmaZpIMFOOsOiCTslm9DcASSKiqfENojv9SoU05RLXBnCISFSm1Ao/ETtnMwLa5IZVuBdQJnjtiXm40mXAIMpvsyc7gCWk54pD2ZCw3fGDZFT1SIPntVJocnSiLWBNvCdM7ovYL3wUpyAug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAJ03NXA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAJ03NXA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso5533965e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230912; x=1789835712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lyDyzwXLDdcuGlMTGZyNhCieQRVuG7gzmR1vCWknrTU=;
        b=GAJ03NXAHbz90vhYFb2Fg2y5NhIgW3LE8NrlxntdWejWxjtTYwQKMQXtP8CO+KsaAH
         HGJUR7iqjkWlqaG/XthxdSR4dkI3oc7cV7/rNLt1I1Gi22IzQaCS6FdqkM3hg3rN6k/p
         nDidTgE62kQ17ZV0lvO9F2QJKBIsLwqXFlY//UlqTY8EwKjJB0gFEoDe9NfMZPZv2Y1i
         9AF60NgpUnujbTFYWElixKc9dOgA/rp54TLJRPVHYh2sEFL1CjFDoEXwXMV4NpkmDBt/
         GSldcOXHesTWDW8KskC0KOCNbCeQ7omDHd7IT8rYD97vi71XsTQZ4Vy9sZOVWcdB9g8B
         QbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230912; x=1789835712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyDyzwXLDdcuGlMTGZyNhCieQRVuG7gzmR1vCWknrTU=;
        b=Qg+YR2V1QvkcDVwIE3f9IQ2Esz/16HmkAHJPnIoX+EywN97c94/Mkuw05sqNbpUAXq
         f6YaGHXcTx6zck5wa3XJ/fQPWoYlUKi/IFZhpc39vUS4lcrHdP8yzmaQ8qN/2J9ckpye
         9wSQdU6zoiFlbPswLXd32DNty1NBVz6/nHTOID4QaI4pWQvRQku5SIxdI+sMnvNX3Qj7
         wNQVMTGis2YHSuGQjEcmsHwf4uadMaIpIh7SbYvPV70t/KDnkOCoxzJXN9PKy6hL4cZn
         xWias37ehuMKO8EvYb0Lx0/NJjPWI21u6YrovgxJuAM/dXK+tj8kSeYSAxIRKijEW507
         VcNg==
X-Forwarded-Encrypted: i=1; AKwUvBy3HqQ8kIlC2ofwpUKJ+m6L0/JBH4l412iqZt2vkJ2WpuEL0Y2irrCiG/qhVtkcc1y2CGrUbj31bbwqhro=@vger.kernel.org
X-Gm-Message-State: AFuF++kcYWXWCgqkUj+Ljofzi3fSrvGbvmaXJgIlVLWLh2iPHYbqYUJE
	mpK/UhMT7vPhdoqIB56p4z2eEgckWi8yagZl9wXOf8ZAlcz1NyjUYqh4
X-Gm-Gg: AYBFou01zd7DbD0fqsgT+HNfjuMtlN6QthhjyV2bvK/dHD64o9vHnaNpOHbWkPUaQtt
	DEFFGAnXo4W+sLdQBEN/jHmV9Pq2TasEqcmPZyk1FTt6p0fpm6iIWJWEumB7AJOVPOnZMzCAnCs
	PDXMIJas5dHXpwODvsQB/AzqRjpaSMTL719wbw6yshntRfUzcUBnkno3olmH8VD1EMnSiiHaEFa
	WJs+IeHB1J2M1KaExoTRlux9ZV2aZ2BAH5Hrf3Q8ZsqlvF6mfjHmDvKs+dnmyK6fNANM4JQPXlg
	jAT02XFUr2OtM4VgAi7nqvXSrhf5tAPoF7Lz8UhaXho4xI0XHwqbeHndcpVULxeNx5LSNMrzDYM
	1xET93jJbQc/4+iwrUEGFykxbkn5xK4kDHQJpQgCrfVk7sEVEdhge7BSRxNgSs8ftwXyRG1JJv1
	fKdvkRlCK1VVR3MPS3TLdoylZvma4FCcQya+aDFnhIMMmy2ihO5SIKXPvNNZMGpN69W6U2jyQB3
	rS4ijGHnT1nQbZiti+cOBOGATVa9vumXi8X7qYwmoSTZhtHQ/d7PFWJhByqICx2SnF0n2j1+fIb
	KJ1rMYoDS10wmmSLJa/16miCLwQCkmSYmkNHGulc/0yo25ud9b9nl9/xDgFjaNZH5GFCdMq3iEk
	=
X-Received: by 2002:a05:6000:384:b0:486:e708:2e57 with SMTP id ffacd0b85a97d-486f6d4b39amr3108656f8f.39.1789230911707;
        Sat, 12 Sep 2026 09:35:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm13986020f8f.25.2026.09.12.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:35:11 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, 
	Danilo Krummrich <dakr@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gem-dma: Correct GEM object wrapper documentation
Message-ID: <aqV-2xxp3Zy5IWqL@gmail.com>
References: <20260912063258.43169-1-kmehltretter@gmail.com>
 <20260912162516.GA1892234@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912162516.GA1892234@killaraus.ideasonboard.com>

On Sat, Sep 12, 2026 at 07:25:16PM +0100, Laurent Pinchart wrote:
> > Fixes: e580ea25c08d ("drm/cma-helper: Pass GEM CMA object in public interfaces")
> > Fixes: 05b1de51df07 ("drm/cma-helper: Export dedicated wrappers for GEM object functions")
> > Assisted-by: LLM
> 
> Throwing LLMs at this kind of things is neither a good use of computing
> resources nor a good use of maintainer time. Please refrain from doing
> so in the future.
> 

I view it differently but respect your wish for drm.

Thanks,
Karl
