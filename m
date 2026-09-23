Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612A433E61
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155166; cv=pass; b=NH8ky+YpIPOPaFjC7HNhcVNaLFvCEXasTxlo0by/VQyANEf1ozYoVrhzwPjbQwobFIAcWeNcxaJtSlpp8Mrtgsme+F/bTDErepO2SDilaL3VHZqBFJwcsmzlAXjBs6rkbEaRuXJXUOnK55DrSj3hzePMA08TjjY2pKUigZjy5Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155166; c=relaxed/simple;
	bh=E7p8lZpe9yUss1JCyusAvCgXZuyW7BMmLd/S5jJ26Ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lclYM4G9NaeRBLqRXesyhlR7YUSZL85PFZzE9UEGFLVN0q8HO7pgZUqOCR8JMJL/zYa6C8i0mc6wmfk7/MBanq5tDX6BbCkbs7cTShGxuy0IQqduLp7YIFeeNNvT1PCH+c96N3e4G/zmqN54qRoydtLab52kQWTqDQDI2oM4JfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=l2nHTo32; arc=pass smtp.client-ip=74.125.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="l2nHTo32"
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so3988185ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790155164; cv=none;
        d=google.com; s=arc-20260327;
        b=Gx5pRjrDeVq0Vm/3UcTwdcgCwJjCzugEassv7wY1l2cBZcupx67mLu8ZjTD72F4OlM
         rGFlwgaTaE/F8bkN0UKrMpF/ddoSzXUSCB7EF6oAw4KDRdRXboeK9UCgdGmkz2j9dj6x
         ZdVlSlSS+Su923Ltw31vcwVxzPLKGJbXW0aQPMxJ8fvtXuCtIx0Ultm8ScgSxbP94FzH
         xUFzA7ndq3pniIB31KuDiLqctYa9Cjzydbe9HjL2aBZilMDTzhEBdSxcQB+BDkTmnr9s
         WZmp5DGzjicS19TlNAWha0DIX6Qe8aKia3M1h0J7lNaWZzcTCkzm6ZVdn+4wO56v28qd
         SGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E7p8lZpe9yUss1JCyusAvCgXZuyW7BMmLd/S5jJ26Ew=;
        fh=vXYefiIni89ggoZ7LscNDRCNZfnAHjsJNSIcVYxdok0=;
        b=SS7p1ndKmrgUsCmDYz/KzB+zgAmWa5bSrYiPLTjRksAVcl0JMTVWM3f+zm2CXyp4br
         fuGfKUrVRFRjCQrNIw4wt+XOc4HI5KCT2jEm2DN7HwSIZLC7yHecl0n9tnncY0hlNat/
         qR8NHhlDw+xgPtvfdZkaKIOfOW2BqHAzs++praLUE4wWp1sxh/JGXDC/tPvQAcKRhjt0
         zIortQ5xVRX+0GenUa6Y3T3+g0gKbp7EENCv73dp9P6rs9MF0qL51ugc96/JgItkwUXs
         L1/uy3yKH2DSCj3hRv9XI1wHZZAZhZhODYCkSYe65h6/xkvpi6wHHIGYbEuZzR+daaQt
         LE1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1790155164; x=1790759964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7p8lZpe9yUss1JCyusAvCgXZuyW7BMmLd/S5jJ26Ew=;
        b=l2nHTo32BPhtiedic38BVcm6T9XRBakvPqGqTU26C28efhDPYJb9l7h1w4FTlWzPrh
         svLqtvyy54afKdkXqGCzXdydRotrti2WhoAa7WJ/EuTyCsqLk5DkZSzWSKBq7nZQOBEE
         wB4iOSxXSY7pWmVBefDNP1sKEqrOSM+LVKWC5hb4m20zQcDproRkiQ0vjYppOiThKitb
         KyYZt8Pm+CFx0Z6jxwJS0ZppPODUkBdPlgaO4mba1jxLVrNG9mV9rEh7Kt4uoSebZaND
         XiFOhAu2HIQFqLCXbG8HNx5QOtXl9lKysL+lmMpdyEtLcYoC7yefK1+U651ijmT3CaVo
         i84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155164; x=1790759964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7p8lZpe9yUss1JCyusAvCgXZuyW7BMmLd/S5jJ26Ew=;
        b=NS07Pui741/GH80AJBnYA41NJ6Yon3CVxvdbGtTdlpftx8MgCroE8BdRJisbNPfWj2
         WKlwQHJqCR8k+ER4vGTBqBol5+UaY+1LGUU8Zv588KE8Sy2eRvScvAOY9j67Oi9vhuGx
         s4Etba87TIAaj8IQX8530PzVafZHFY76omfH0Chk6ehWzAfGkuCcC2mHRC8EQNUBRUIk
         lfkxltIe97GRs4NMDDVAfhzluxwalRMQMFto/bWJ6LC5CQmY85HcyJ0W5gFcTxgSYd+d
         WmoydjfDYhjBIIKwKWVzt9SiK7MoVAvXHyZraOMxi+LfoumFU9988Xikk3CIdopCA6YM
         qDSw==
X-Forwarded-Encrypted: i=1; AKwUvBwdOSXvwM4hjc6SmjlK7THRwqQ9QC14BtDVOKsr24yEiw3oClWKA+vgev6SQpANQZrhb+IE79/RpQtK454=@vger.kernel.org
X-Gm-Message-State: AFuF++kKvyqc9f/l1UrvLh4GC5kPs08hGiT9D7JktBewBllmGpcUOPpe
	8n1mHpyHfZhEuP1m9bcaAOCtw+e/8txZQrRcyxEhQmTOYHHvrptgoog2O5Jd9uzdcIGz36hEn2g
	XwTUv6jHgqgjegvv6b1LuUw6GOGH9IiGLiteVd7Jh9g==
X-Gm-Gg: AYBFou32hc9xCiHo3VkwFf15LHwF5Sh+T6qwUnZbmRtw34pwf6LD3hwobd7rUkrvi7A
	C3YigYjYcKz+t6x1NQIAxTwL69G3pwsnKGA6TnpMtFL5ywVDc1ezYZ5WrQyDyDxngyI0bZwzCcr
	c84pz3Mv2G9mMi4WZa/kVOgFdqEAFtIv/Oeq2NcqCd/AusLEpsu+gW3CZQfKkwRRkEQqrwAbKlZ
	2ghBpWsGdSwTvcqqgK29FtwTFyc6emrzzLImB73cdtbHfnmIkH3P3gkgyL4kEjZUhxf2PxsFN8K
	+FS6rbFIB9rJEwKRAoORMHFFQjWBneP0B0KlsdvJflfiOzl9r7Tt
X-Received: by 2002:a17:903:3c28:b0:2dd:c053:9c72 with SMTP id
 d9443c01a7336-2df69dce3f1mr16258365ad.40.1790155163811; Wed, 23 Sep 2026
 02:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org> <20260918-drm-reset-state-flag-v4-9-5ad106370f05@kernel.org>
In-Reply-To: <20260918-drm-reset-state-flag-v4-9-5ad106370f05@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Sep 2026 10:19:11 +0100
X-Gm-Features: AcwNN1WcrMpUMY7WrxQBLpWPrZ8BZzqWRprFtRJhz4ki4ZfJwZKD54zFU1R2wsY
Message-ID: <CAPj87rMT5vnYMJ-MVk2z_etH+zHK+poac17TD+Yz4SnMZFbsBA@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] drm/atomic: Add drm_atomic_implements_create_state()
 helper
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, 
	Melissa Wen <melissa.srw@gmail.com>, Daniel Stone <daniels@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	=?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Simon Ser <contact@emersion.fr>, Victoria Brekenfeld <victoria@system76.com>, 
	Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Fri, 18 Sept 2026 at 15:18, Maxime Ripard <mripard@kernel.org> wrote:
> +bool drm_atomic_can_create_state(struct drm_device *dev);

This is misnamed here, and fixed up in the next commit.

Cheers,
Daniel
