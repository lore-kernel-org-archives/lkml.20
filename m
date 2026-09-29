Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F72F3D9DBF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652525; cv=none; b=l+QPA5XNfwWaDIukGnMuOLIl68jbMERIft1zeyq/4n68APMuwAdlJzqKdV5oxI2zFnI6hJMoOeXUYpsHu95Pq5A1bYfSoYJs2eRymwJOS/qTeOSQKw6wdVqsEEpNk3J/ASTAy4Aww8JYEj2C2DZRcAV+XUBFzy4HZtI07EYg3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652525; c=relaxed/simple;
	bh=Ppa/5bvyDHu70Z7WWJJ5TYTAyJSoEiJO45Y9vEXZ7Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X9EUpMunfkjs65HwK7Iz0tG82UOQHMF7BCZs38i4fMy98WD2pJxxU7I7wMYAmhNmhTRecDeHnTWK+KO+/T/R186WtcS3exPdRwQsguNHiY6shELKHfo9aRJW+UVmvzK3wJt97nqLZFV0aZI8kEuOnqrezVJQQ1bm8FYwez2scY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhNNCmXl; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhNNCmXl"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a496aea5dcso86086a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790652524; x=1791257324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ppa/5bvyDHu70Z7WWJJ5TYTAyJSoEiJO45Y9vEXZ7Jg=;
        b=qhNNCmXlqQmL5zuuX0SACJUz/rgCDcvpOpVhm45QmziTU6MuSIgDB5m2T+RMNcgHKy
         VQzZkqFg6CmkKWbYJ9iOjURAk1l8rE+mCsklsiGRRbl0WDbHaghw5dYe+YPsxZRCbr4A
         MwLOKKAad1BPCY+o5jwKBXqIFCg61chija4eqUagyCX2TDE04CnbqSgR07qqeLasFz71
         iw+qBoBtzFWJDra+dYQMfpZP0vzgstv7SkvXUAvjfIPJOAoer3V5k4fWl4RJEJcWXNhu
         5s1Yc9Vb82IL7y0QRMy/FTapUIoYTD3Ai1LKDmh8AUfJ9kQ3CU17m0P9cx8K+5JTZBSe
         jG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790652524; x=1791257324;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ppa/5bvyDHu70Z7WWJJ5TYTAyJSoEiJO45Y9vEXZ7Jg=;
        b=BOfjQQ+YfnifJHElbcXjHRwiO+Eb5DBGKkz7bP6iEHZFsb4wcCn0HvrFsxkG+qLvlH
         bV+jsxeXf9GFW5QQefUs+jS4OleeOYwKxKEIaAZeVhYjjPJf7QltT8Q2UBJ6jxRbDmUU
         ShfRkPPyU9kTjoifnmdLkI+C4TpiZkGmk9GQnEhLzFr+9mEmlAQySkrgcGEo5NV5ZVRU
         Pdi/DI2SGgHQAjN8fHcHFFtkmwk0YNsNAQ05GHlq04eGkT1KolZ0AdmK6U8SRgoQP/Li
         QRcENUuxBlrLS7ojZ/+lALh1/OmrHbQp0KX2/mvy4NNuGbTwHyjnYoQ0/9+RoSMaWW9K
         2xVA==
X-Forwarded-Encrypted: i=1; AKwUvBxTse2F4AZfhDq00/A5eAdEbRu0VYoKEqEMDc7Sr4frrDVnSaTnxMs0nZzv86J6WTweptQHy9AkVhWNVi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ89XYJlTfQNGRxVLGeoMxX2ZtqhAFhq0ulmUZa6aa22az3ydgR
	Pe3UkQdYAi0ES9Mq0Xvqy4cvwPMmh9ydxkWR/3FbkVBNtOPWPlvItsZg
X-Gm-Gg: AYBFou36pJcKhKRT9sav2IkPhxLS1YkoA+ZVH4b9T1Xuv873UesgS17ZM4EWCcRZmyH
	BNcIFa+p1Idf0i5ZV562Lcz/LDvhyXav/b5i9QjwdQGs27j/F151A3bl7jrGtK+yeekzNmFO2VR
	zqw2YCCPyP35INwAjju55nwcKOEWlD9gOt43Gv0KkHPb7tawlTNzSqp+uq0rsY6UwSVIV11XV4p
	cXdrcQiAoXVvIK4Ovf2tYoQzY+z2sudsN2csQfN4wy20bkzpbqWody2u4nLqA1cj0RZM6xyW9LZ
	pOdwKtvqUDzJbUyRXqRTtz9SOQTPfAFEqicaqrR8ymm39yIzp7jYgaqzO3d45aCr09AL6ukGS2G
	rlwuKAckZFOsvEo7YoWkIGXpzOyC+HF7JQPWLHn/K+by9a7PWojvkEpCw3AxeJ+htPTeluckXnd
	MfzEunkOp/24Jlk3MFBX2XCz7zzKBW29pHlgHKdepGdDy9N5e276dVmFM1THzsAIB/hLaTow5W2
	enu0AvGxSn0Xak=
X-Received: by 2002:a17:90b:3c4e:b0:3a4:88c2:32b8 with SMTP id 98e67ed59e1d1-3a488c245e0mr4141496a91.1.1790652523654;
        Mon, 28 Sep 2026 20:28:43 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986e9656sm934089a91.0.2026.09.28.20.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:28:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iommu: export iommu_get_dma_domain()
Date: Tue, 29 Sep 2026 11:28:35 +0800
Message-ID: <20260929032836.37312-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <47bf9a4c-2a47-4e93-bcdf-8d953c9a5ab8@arm.com>
References: <20260928053901.7270-1-liujianfeng1994@gmail.com> <20260928053901.7270-2-liujianfeng1994@gmail.com> <47bf9a4c-2a47-4e93-bcdf-8d953c9a5ab8@arm.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robin,

On Mon, Sep 28, 2026 at 12:26 PM Robin Murphy wrote:
> NAK. Read the comment - this is an internal helper for iommu-dma
> (currently the only IOMMU_DOMAIN_DMA implementation) and is definitely
> not for random drivers to abuse. In fact it should really move to
> iommu-priv.h now that we have that.
>
> If you want to do sketchy things with your device's DMA domain then use
> the public iommu_get_domain_for_dev() interface like everyone else.

Fair enough - I'll drop the export.

For the record, if the msm side of the series goes anywhere, the plan
is to capture iommu_get_domain_for_dev(drm->dev) before msm takes the
device over with iommu_attach_device() - at that point the device's
current domain is still the DMA domain, so no new export is needed.
(Christian is pushing back on the msm patch itself, so that may end up
moot either way.)

Thanks for the pointer,
Jianfeng
