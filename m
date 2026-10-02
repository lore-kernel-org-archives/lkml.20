Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E045476CCA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932589; cv=none; b=ZwzW4ffm2tU//Uz0OAiGewxmsgEVHF2FvHvSm9TteOLCQWqxNoxB8H/p2gTtitMRMynx6ytWCRL+cpFHu6V3a61+fIsxSDa6nixbSQ+waSGrBAulj22EfU/8tKOVbDHmekJmqln3oWayXj4XMUV5M+9ipL9mBXViOyuhNx+4W+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932589; c=relaxed/simple;
	bh=+Cjqan0UhL1zIl4DaATvPw3kt1jOA0SALwcrYAHG9sg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pAFRPR4EE8rzr7TLWmf+Mzn25B+gTp+LupiGyhUEVM8vTxXbyZscDS7P/ksQUw7rz4L2R8EscDbbKaQh9+1o+KhrBKRgy6tFRe3wOb1rwsRt4k2XEEFtpLi53qG2nBmjNcES9X5ML3Ff8uFgBWhX1KCC4XiXHGGH6cVBAPbOEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XlnCn74I; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlnCn74I"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so35547605e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932586; x=1791537386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr7I0+vQOmc6Ij+iLFlXS1o57hbrTzBsvp6FilJQ4Ns=;
        b=XlnCn74IfnKY1bouIiBpKcReA4DCMYdvwNQtT9jEEwNFjui9ZEM8CiveLMRhr4imV8
         6MmCZOWNj4EN+jIOxzTF1ARDSJ58IuMKXPPIAPTSLh8dtld5YDDnwLI+iO1Dpjlb186d
         Ro/pCNcdw/8YG04AC8YXu5FrcB/dO0snnPuQT+eXyRvTcnDIN9P82rMABIl0hznhlsEf
         CovIdw2th61pyqZ5MxQmxjUnR9K8Nks73Ia1Ywi7W2G+UIh3/DsopSUKkUnnnnMDkYG6
         M+zLvKCrSdQrGgIrz+1rM6Zxi8eMB0eDz9Bfv+TtxwXUqtu6n9Cy2UpXgLlO1GHFMo12
         pB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932586; x=1791537386;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nr7I0+vQOmc6Ij+iLFlXS1o57hbrTzBsvp6FilJQ4Ns=;
        b=I6QZ4/zwcV84m+4rkbpKTkxiW7q/neKCnBK6bz+kDTWpXkx9F62dSA2lIxPInkggHk
         1Q3ZlbvdOLo6jgI4voaMiD7hWjCC2zwwZQ63zD7vVGwWlR6re/0CkSj1LNxNcN36dY8t
         vupXvrrQmt4/wm4rl7aYFegyGOYoWePg4/LA3ShAEIz/VtiWzIO8NLwK4r31Xr1enNd5
         8mWXeg0eG3vB0xWWm6sF7+X66K9WIzgDRZtFrdXXNn+2vJreRQ+8vhQFBe+Dg91aDcVL
         31EtzSA8aC2TQt3bEonvUuc3+UJ4KUPF17fiMZ7uhBjR88x+ccvteYMSXCVzWz5zjCOJ
         bdQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXkCSRgE2ojUf1nGBa/d+mOtBNbAsqWcR2JnKyBLA5nXRC6b0VoDlGGyiKPM6hPKzMP9THYspks3skOC0=@vger.kernel.org
X-Gm-Message-State: AFuF++mhAUc6Vyf1o3twB1vDtean800ytKvpr4+dvEQhdPotMY+fldq4
	jXxKpN8/V+DF9GNbJgJLgP/fJZlGqrwgGg6KguuXZVfxXinN5St6Nh+M3kWT7WrEf7E=
X-Gm-Gg: AYBFou0+8w0NQSJNjhkvij6WyaXoF6ofCq1olb1DTqxtxtTyEcizhTJRNfrJcY/KsOx
	fu+k6J49EJl0upsahE39zHmsMFLG3FaoXMmyjtL6MKOt2XqB24M9xBxhVVG+PegW/Zupd72qjA+
	HKyaHMYRiw66t89y9YoEW5WKwtiRI4qeR8FQNo2Qyy5e0vlycNmDNouY8PQDnUaQ2aVrbtSWKrg
	G0u4yoQ+bdud4/jmoGLDy1rQnjqN948ag8wilN+5GR7aas4eqfBZqTYPj6Pdcn1nOO6+vkhTtUN
	zvkYeK/jwpjl/tZDWFeO7/C1jx1IplcZyHrubgV8vJuwaMJ64oZcm3vCGRxT9pdYZ3xcVS7qo3+
	Ok22tL+G5eHiaH45YM3+Gd7ZVDWC15JHDpXkFHD1TNhWAqIVsrFxx8cen/hdzlgd3+8GSkq1+Hy
	/hIbUtZ+7w/7uH6wXE0uc6E3LI5jI9WhjU4MWI+3J8QdXwxPkSouUtpaXcFXpcEP7wOXfFBzCvS
	QX9LVcW1O5qQE9eMCpTBO/kLdC8dQ==
X-Received: by 2002:a05:600c:1908:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a0275681d2mr34221915e9.23.1790932586191;
        Fri, 02 Oct 2026 02:16:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, Svyatoslav Ryhel <clamor95@gmail.com>, 
 Julian Braha <julianbraha@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Teguh Sobirin <teguh@sobir.in>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925130125.3897046-1-arnd@kernel.org>
References: <20260925130125.3897046-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/panel: fix novatek-nt36536 dependencies
Message-Id: <179093258520.2282096.8889396128849638818.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Fri, 25 Sep 2026 15:01:00 +0200, Arnd Bergmann wrote:
> The recently added driver requires access to DSC helper code
> and fails to link without that:
> 
> ld.lld: error: undefined symbol: drm_dsc_pps_payload_pack
> >>> referenced by panel-novatek-nt36536.c:109 (/home/arnd/arm-soc/drivers/gpu/drm/panel/panel-novatek-nt36536.c:109)
> >>>               drivers/gpu/drm/panel/panel-novatek-nt36536.o:(novatek_prepare) in archive vmlinux.a
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: fix novatek-nt36536 dependencies
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f11277810402d0e2f3f8e64618cdb5af2ade8d3f

-- 
Neil

