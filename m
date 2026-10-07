Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED053BE64C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378985; cv=none; b=jYp2/kxYCAjVlUoyo1gdzRzdDnc++CdwlYlqWUfKQRC8CPC4JSF72LHhb1fko5rvGh/s09hW7bUezgMez/lxwfQhP2KkNe/bAomw7gWCDaiUZJVEX6p8t8Fhiay5zfKvYbRPGNWm1tUvaSVq8vhMNM/Wmki4UKt9DrjSIQCptvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378985; c=relaxed/simple;
	bh=TXXW5n3a0Ki9BYV30DPXfzeFhBoYd+H9eTT70dASRRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZzbjx6qyH/8X5Rs8fiLAwDlMfepqRnD9Col8fP/o+lnLgUnmE7HZ4j5VojoouUo/FeBkH6XbYROOcdOCu0SRuHMeDsEhmmhFT5RHER2KqojuV4tEj4h6N3loH0a1vGgj9g18hDoN2v3IzL1Dudg+MnlJamgEHYyCLUxyuFgZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cz0meRht; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cz0meRht"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-892be220682so1238b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378977; x=1791983777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/dj6Lb2IvVTeq+ptx1rfH6bD+cptgUsmqXSt2Gyxeg=;
        b=Cz0meRhtEhojw5viwOezkSaV86kQz9M0J04sfvk5RAM9VYoVsKAkyEBTHx7B3l8yc/
         xVF5X5g35VeE5WinuVcPhGNdemupZ96cBhmEmTUNVI25QBcEbWim0lLjbdpiWKaJXrk8
         ECLwNIAqY3C2sP9LwaVE41UJVqfiJ9wvdvqWnqOfi5fJsZT0p/lC8jh1SrQ5e21S0W6k
         zrSIncOTkhsiIBeKrCZfLp+/4lW9eicyMSUNjblQ8Z3rvRclBAf759eGOXtGyUFlHJ10
         5atpIKF4DXUoZJZUeKw1jy9KLb+clVuAa6A9mmDogZ9gSorIrxA8VcIJ7mA3ZA9FN+k4
         03mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378977; x=1791983777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/dj6Lb2IvVTeq+ptx1rfH6bD+cptgUsmqXSt2Gyxeg=;
        b=yOiTbFnRM1psNJN7IDzWTgCVK0HZFJw33q9VjlF5dH+JBulmReYu46XJITg10cw96s
         UOG0k272Y38Gvhd9LX7n5g8kHgZh9fZr8BDAw9uhuUA+RNe+8JGBgkvJo6vUM6C6O5FD
         j9PhC+/MZ4ZUsI52iiw70Ec57FCZOX1s+DW+INp/1FagxWVHrgL7L26w7PimULq6l7yf
         19hSkv+LfBm73zMPRAxLkqW4yiqS4JMmzeboCX1Po0s0sII5ZABI8g+geEeAQtbo5luJ
         hgrQo8YZUb9/rsIa4G36eKz/IkejF5Wbf5rRC/PNLHxO54bSClgyTBi2saCaS5fxO0mp
         qFrA==
X-Forwarded-Encrypted: i=1; AKwUvBw2UT5R2Nkvouvnlsryk5C4l71I/XwNEd9v2NyBrTxcCxyETaEnv5e2jHkwoLEc55KisQ+L3WMRZZRwS+0=@vger.kernel.org
X-Gm-Message-State: AFuF++n+jIqD2AECgHHv8qSS6eQWas1BZNelNIOqtaHn55BvazQ0SZD5
	zv4ljr+hVQlNplA4vAtQC0c/ozpNuuQ3gdggZVZ96Cw5GHvUeDk6/8Se
X-Gm-Gg: AYBFou3MJ5MBGWtsdBGC0Eu7XYkwLCr5fbFXmXN4/dWIudzTDzFhlZgk2wKYGxC377H
	GERXXduOXsNGEHRpNy+IUk/sagdemBnpMEruReFHN+S0eS0KV9szthBvUz/zsMcY58Z4BoQVXup
	CZeJ4hPQ7EJutuIM4mlDFOeZkjvWOs5gBDTdojw/8LloYVbF+56pE4WsMSGy0b79+9X714i9RUl
	FoStCXE9q0lOU9KSvYBmeiP1RwtAMzO4cz1yv4T2N08Qm+d340KLI2BG//qBEBvbGM72QlpsTbJ
	PUUMeDImAsTNzprI/NmSC8TPTkWcVRYHuooAULMSQxtKhnedVZf1sDME7RwmwgApMilW/7ylwSX
	ci0AcvEfVYx0dUQMTGDnRq8q/SEM5HpMYRro0H/Q3RXBIctwQ9adVJ3E/xMrlXurJbF+6me1K1K
	Fw6xbXHP8+Y0k954HzWzYGjhYnfJUe2Y4driZQNzKczfBE34hR5Qg3xNpMWaVt1NazIEdWe8ksD
	nQGCZ1QdaGnAQ==
X-Received: by 2002:a05:6a00:4803:b0:888:400:7fcf with SMTP id d2e1a72fcca58-891b3b4c652mr1740386b3a.3.1791378977074;
        Wed, 07 Oct 2026 06:16:17 -0700 (PDT)
Received: from jfliu-sfa1411.. ([240e:36d:b09:1810:7fff:6550:13f4:b6f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bba97a22sm80118b3a.49.2026.10.07.06.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:16:15 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: abelvesa@kernel.org,
	abhinav.kumar@linux.dev,
	acelan.kao@canonical.com,
	airlied@gmail.com,
	akuchynski@chromium.org,
	bleung@chromium.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	jesszhan0024@gmail.com,
	johan@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	liujianfeng1994@gmail.com,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	pooja.katiyar@intel.com,
	sean@poorly.run,
	simona@ffwll.ch,
	yuanhsinte@chromium.org
Subject: Re: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
Date: Wed,  7 Oct 2026 21:15:43 +0800
Message-ID: <20261007131543.7634-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

On Tue, Oct 6, 2026 at 6:09 AM Rob Clark wrote:
> With DMABUF_DEBUG=y, the page information is stripped from the sgt that
> we get for an externally allocated buffer that is dma-buf imported (as
> opposed to an exported GEM buffer that is re-imported). [...]

Tested on the machine that originally reported the breakage - this
exercises exactly the externally-allocated-buffer case from your cover
letter:

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer
  SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y

Hardware video decode in chromium (V4L2 decoder capture buffers from
videobuf2-dma-contig imported into msm and rendered by the GPU)
displays correctly, with zero arm-smmu faults and zero io-pgtable
WARNs.  For comparison, on plain v7.3-rc5 with DMABUF_DEBUG=y the
same workload logs UCHE translation faults and a __arm_lpae_unmap()
WARN storm (~470 traces per minute of playback).

This is also much cleaner than the translation-based approach in the
follow-up series I withdrew - mapping from the DMA addresses is where
I should have ended up in the first place.

One small suggestion for __do_map(): panthor treats "map_pages()
mapped nothing" as an error (panthor_mmu.c):

        /* If nothing was mapped, consider it an ENOMEM. */
        if (!ret && !mapped)
                ret = -ENOMEM;

With the DMA fields now populated on both paths this should not
trigger in practice, but it would turn any future regression back
into a loud failure instead of a silent empty mapping - which is
the failure mode this whole series fixes.

Happy to run more (heap-exported dmabuf import test, kmssink scanout
of V4L2 frames) on any revision.

BR,
Jianfeng
