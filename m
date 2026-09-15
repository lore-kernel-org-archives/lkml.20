Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF93ACEFF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459602; cv=none; b=AmTBxmA+KvohkJk036hCY8GljKa+38QK7eZkIi8JKfPIxrty6e8hZ8SP1T2OZXrluIAZX4TV4t3E1InDWluW16uPZ5a2X96BvW/CVl6rGdolFxZcgpDoR6lX7wHL+hzwAvTujushi3DrxJVmDD/4sdMCJSnFogmbpDB8KmpJ9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459602; c=relaxed/simple;
	bh=heCFy2bFPAFPDyeCf8OpyG8vFQyBTqauqjXZX0i22bg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BUnu/HGZknNkBcD9rjrTVKvekYiJE6jEhpmYzO6kBukjinlLqueb8ZhwTrbELIoKSrmVLJHbmZS9uBO2b+kSifl0wr6vyZWvLh4roLC0j376K+wRJocj/9zzdcr5eDaMCY6sMGKgKSzj/fXsthElonXmRbLKikYHDdOmrK38+Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WXx1KQmd; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WXx1KQmd"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6a9dfe4dfc0so3191050a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789459599; x=1790064399; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=heCFy2bFPAFPDyeCf8OpyG8vFQyBTqauqjXZX0i22bg=;
        b=WXx1KQmdnlWnDaFGOTOy9pYGdWvh+3Cb0IrnAqrjYMzI5GBEkgU93wW4hIRwBjODlD
         aT4QqCyf5V2jlMjmN1l+NALCkyBKjlMta7gpL/ZeMRDB3vigWtK45lKwt5OnzkEP5KI4
         +LrH+CiPYcpqd+yrK2camCGNXIGJfEts5jRCr63yVMX8Wd8/i9YOiFjUwOzVePneJMB9
         ajnd4JTCaaefZzx/7WOkWjBTKNDgpfdCYbW2Mil58TE+HPbLpAWaYMEDW9VWHzw/l1t3
         lsibGxrg99sap8ezFqv5Qu/RqvVgDegwlzNxCfGv5DYunPN5ahff9D1CH0FGt3oqe3zi
         QB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459599; x=1790064399;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heCFy2bFPAFPDyeCf8OpyG8vFQyBTqauqjXZX0i22bg=;
        b=ukOd4IQp2ytBVNqxQaIoW4EazgZupTs072vfa7WiTSR/hlFyFQ2li3IWDBT6LSzAgx
         XwYLwQM90elU4JF1attz17vUjZavrfHTd8pC4dIl6aaHf5TLoTuIK6Rp+gomB4Dp+jXF
         GJwu4mrqkDDbQWfD0SvBcj9CBYtftvgVUXw09GRD/3rkVj3KZIv22k4l+Xr79NuC9wmj
         iyQb9nM4/4z/rlPmz62XWWIugAA2mX+t+xQy0dEDlBsdhllU3qNMgI971B4Gp6PZccNg
         gyezttyABwh0ybdc7owECQzb3orb82pvDt65bfnjnaXk7QzTYKhJjJ1yXklmMo0GCWWa
         aEGw==
X-Forwarded-Encrypted: i=1; AKwUvBxctfY4pesWOB/BuGBhRVdTUcuBCO/wV/IvlANEZoDCA4r4Ckta7x3R5W3RTIhjBuTWY2j7sXE8Y99h+WY=@vger.kernel.org
X-Gm-Message-State: AFuF++kfysdTMUBjK2MHslxgKnpehD7oJEr7iPuGx8jHPiOh9NYhvyIN
	Xds94JXDX9WjoIsrqZRnZU3CNsflIMZZhAOrs9WdRXEUK6+sS2VeGVxMCHy6ZUeuwqY=
X-Gm-Gg: AYBFou024LSIcbX9uF/jDOgG9yToYk+lQddj+tj0eN6S3NfvQUDMM4xdSV9jbbf7kwN
	mSx3KeiZEaXcgm7faBeA0LvZcwSeSVCVRIfBHFR02Qy38RUjEpeGRJTbPaGFBYDLokn+y3orBs9
	FbztxCR4mCXDHZncU96wKaCLnmBGiDX8FG7YFHgLLMSLSth7giaGjrlJl3XFH4pjorcjQjcclRa
	MgKWJAVksVsdFTcnUK2TATxPLCRfOWdRwPHSHDqCVm6RPPN82VACbPyergUVQEuE3PiQXl0KPLk
	n822mBiK5NzD2/xTs+AuRLJTXSo+UG344ywVTkHuU3Y716K91qhPfEX9xSvH/v1Fx8Mqw3oewfX
	2gfr2JzPyO/VPUJsCGCfNSt3emop/nskKquuZE36LgByRYTfvztF0zhWI2bByyWVlxnBCKksdaC
	nDbMuaMEX5qo2qD6UbfVhXXYZRWWAGRuJkro7CL1M8Sn4aFxCypzxK3MZFtotwti6t884kGKC0w
	WE=
X-Received: by 2002:a05:6402:4510:b0:6a9:9cd3:a07a with SMTP id 4fb4d7f45d1cf-6a9f626e2f0mr4077380a12.20.1789459598660;
        Tue, 15 Sep 2026 01:06:38 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5831187sm5396669a12.1.2026.09.15.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:06:38 -0700 (PDT)
Message-ID: <321bcc9b1752d7fd2e1488270cb8bf4bf2cb5224.camel@linaro.org>
Subject: Re: [PATCH v3 0/2] drm/drm_crtc: dma_fence_ops fixes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>, Sean Paul
 <seanpaul@chromium.org>, Gustavo Padovan	 <gustavo.padovan@collabora.co.uk>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com, Simona Vetter
 <simona.vetter@ffwll.ch>, 	stable@vger.kernel.org
Date: Tue, 15 Sep 2026 09:07:58 +0100
In-Reply-To: <20260721-linux-drm_crtc_fix2-v3-0-afa8c71506e6@linaro.org>
References: <20260721-linux-drm_crtc_fix2-v3-0-afa8c71506e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-07-21 at 09:21 +0100, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> These patches fix two issues in the drm/drm_crtc driver. Initially I
> was hitting the BUG_ON() in a scenario as explained in the commit
> message of what is now the second patch in this series.
>=20
> After posting, sashiko.dev noticed another issue, that was previously
> masked by the now-removed BUG_ON(). Since we can't have a loud BUG() be
> replaced with silent data corruption or worse, I've also added a patch
> to address this issue highlighted by sashiko.dev. I believe its
> observation and analysis to be correct.
>=20
> Cheers,
> Andre'

Friendly ping on this series.

Cheers,
Andre'
