Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992A51CF4C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765020; cv=none; b=Lrvsv8FO1I12l/TFP5vmKfQRPEST+E6tuQwp4EnwcpoQxa/X0l0Y6konAZZJ4OWBn4w1559y50VTvTZ4L6Ur32V3BR5UKiAKuLbBAJKnlm7bcnlHYsaKT4qcETHsGmTM/cHy8LDXUP2vyeKlDVh693UXi5go3WuZngsbax2yfGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765020; c=relaxed/simple;
	bh=HSptCIBExwtcqPFuzpkLkpMIALhmv4dX8nFOYFbtYTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8DmxwMINUls4cDZIAmbmr2EPeTMYd1xYbGPlt/vazLjvjyb4ktwyh5yUDlan23gI28HZP0PEoSf4YY1qF4/wKXMKdS3Oerix0EN290oRWyIeqUntO97BS3FVl+/qlE1si/SrjVTTf1bluNGr29bylZ6uQEWxHufraj47k4sWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZPTLOd8V; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZPTLOd8V"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7f64ea07036so295557a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765018; x=1790369818;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Is2lUlBqSGMkpOZkUx2pau6e4D6+5AaH4X9SJHq0Dc=;
        b=c5ZpUXovs2IIpTPohdjccsasJFKny2aLRVqTGtXElF/e01litNWZWI0bT/ES/cYZwO
         0v3OyOeMry8KgujZkjDwieLWadBe99ZelFhdTo8a7OcKepuc6EGkCJOU/+//213ow5wt
         WzTICbp8t9Lhf6XQdAR1Xk4cuXupq8l3z21KdDEUZAEnXiiIop/S53wl/J8GslROJUGO
         olgn1xq8+m0eUP8+NCRhKZ/hDU0dVeG5GWi/aVf1jORCYa+o44wm+OtprP93BrPMERZW
         cGDz/ke7oHzDW8saHcXbyCdQZokmgytb7/RVV1+Gf1FA/e4gtoXoyBjEQw+/LI3o90rE
         o1JQ==
X-Forwarded-Encrypted: i=1; AKwUvBz41kbOjKLSHnW9kkqh5MvYnncR2sG356ChLKhtDlLjfoGByDyTiCDiPaT3xEAJTztznXT3Bjk1aLkiKV4=@vger.kernel.org
X-Gm-Message-State: AFuF++lg86e4cO1OWh5sedTC136mCZtsBT+f2I9ZJYeQxR2pSyKOCZR4
	XTXh3u9IggPzPRwIqTqShxd0ZjqYm2+CFssUz9dM6sogdtsGe5l+5YO0CaGRMiXW0FNvu+HavkH
	WY63W2weOucADZWPol9mUEtNmc/b146fgxSUz5r585WJuWJwlccpX2uXzB1bbv5Z+1sS+XAjxaq
	SWShegCtyjjC+tzQN4iCl1MJM34juLP9olWBV0xPqEoNAcOt1IoWDBcTQTvfnHbHuvpnbjAioJN
	39m+w6MSVnm4m4au2TB8UzL
X-Gm-Gg: AYBFou3k2ztOKeQJIAn3eEy7WXlPokHJk7W27z5zQyKxIEKxQC1Uhpg1JFekRaoJgk4
	T/Jx46Fq7Us4kUlu0NxnaccLxiR+SeQ51ksl+r3xwdSiXrDrzvxYguwiJpjX7siZTuqvGiEMOan
	9zhwQiAkdeXLtSwFYaH4rjMseXpAI9hSmJbCGrQJHiPqwfQO5JNnUIQTF2zKhZ8C/NYX66gPiAe
	Z+7ceR6ivEvKB+8fvQJqOU8FeN4tCFVJDlJK1sivHZhNk2tg4geOUoNklx7ABV6Gg7SPQ/EXeKH
	h5/b7zoHu4w8wt7RL/lfUPSdtymK7IkXJEDG6hsy6V1tw6XI6GYyz7jqhHyHzXi8F9z0jWqx8Ys
	/vz4Q2/JjYrdTxcqqgdaBty1+TXXKcyxCWAPY/9WOc+uV8zagEkEyDSJbyEZhjIYQ8BaJHOaFYD
	oPkxw9kCd3gaB5dRVuFnydstITgx7DswaBeyYDQiX/
X-Received: by 2002:a05:6830:2b0a:b0:805:98ae:214d with SMTP id 46e09a7af769-80de33ecd00mr3909824a34.23.1789765017712;
        Fri, 18 Sep 2026 13:56:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-8107e28b8d2sm272255a34.8.2026.09.18.13.56.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:56:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so22777065ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789765016; x=1790369816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Is2lUlBqSGMkpOZkUx2pau6e4D6+5AaH4X9SJHq0Dc=;
        b=ZPTLOd8VBt3krpavX0TpqAApx88I+N8iYVNHCT/zhyS6wpS/33LMJDiXvffvUuQ5o6
         xloN4v/HdcvRZPeAwsRHgdrlJDf7Zew1toTVN0HKe9HZhyk0Q5qjq1WnNFu94kwjuJh9
         h+lTKSZT+FGyECXbUpkU5rEIwM96566HDyiwQ=
X-Forwarded-Encrypted: i=1; AKwUvBx4w44Yp1/JrwiMJ+d1wS4x9qRODg2iYU4Zg0opMLLhFJh4a2r2pY3rpEatfJ8lIHJ6CV/dlC5ILRpu1mU=@vger.kernel.org
X-Received: by 2002:a17:90a:da8d:b0:39e:6a81:5a92 with SMTP id 98e67ed59e1d1-39e6a815df2mr1513937a91.38.1789765016289;
        Fri, 18 Sep 2026 13:56:56 -0700 (PDT)
X-Received: by 2002:a17:90a:da8d:b0:39e:6a81:5a92 with SMTP id 98e67ed59e1d1-39e6a815df2mr1513914a91.38.1789765015849;
        Fri, 18 Sep 2026 13:56:55 -0700 (PDT)
Received: from [10.211.247.235] ([216.221.25.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54b248dsm1235932c88.1.2026.09.18.13.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:56:55 -0700 (PDT)
Message-ID: <ac19e380-e93d-470d-841c-7bd3f2b0b86a@broadcom.com>
Date: Fri, 18 Sep 2026 13:56:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
To: Claire DuSoleil <claire.m.dusoleil@gmail.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,
This looks llm generated, can you disclose the llm that you have used?

As for the patch itself, it is too overly verbose for human review.
Could you just describe the issue you were facing and what is the fix you have done?
Describing the current behaviour and the overly narrative style is not necessary.

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
