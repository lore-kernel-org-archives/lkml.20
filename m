Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A42489899
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865807; cv=none; b=Wy3AUg3lSvIIY8EFNjCm/y6qcUx0HQjGYUH220uV7XxR59HiOrvSaNeaabOua1+DuDO7OqaGW+RwSIz07l1jY5byDyIg0O7lFlWmc5d0TO6dcmMKPWbMhg3ZvXj4L1L0+Kt6a+lYwZj4fNdocgdEMy1ZryZH1ONu7Cfojc68I7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865807; c=relaxed/simple;
	bh=CJ410Hnuw7HxUN1V6vTAjlcL9lvaHvFeCOJ1Ey0FcDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J2h3zqcDa9pxzIzB2GjgkPqyPj7dh+RIJB5NnBp968ZJjGX0dgj46Awa7e4kS8Q8ojd9dvWINKtk2Dsc2wn0Bql1kDrkiiLrj6bmHxa6DtrOo8xVfEhbT06Wah43vGFR8D4cvLR2nlGl8iqkPbN+ED8wAy7m7/PpNApu4pSyGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=UEG0Df7I; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="UEG0Df7I"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dedadaa6dso766249fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790865803; x=1791470603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lw+Zx3Ctji2MKAhZ1Qo8iu3S4OiHZVAXCS35rHrty8=;
        b=UEG0Df7IWlrbq1QmAq8rbT6UOXeeR5gp6ulSqm1bOjdOJDUhPnqFZa9GdUXgb9hKsf
         uBsBgfk3Rt8ned53uqKeJyyMVkJVfBPfK7JU8sLCX5mmfLLvG1wiek9oCfpHuUhFht56
         Vqr974Aqy99KYFHW3UpZ6HYwPmCv9rcvVKm1Rj4pxtVnJlIenPsarkQnV8ce1v13JiDX
         X0C9fV1bsxgGloLzwe2uDx2ZXziGbH6EiG8sjAVvK4Gaj5Usx0UwlbPmKfUOFEYYgQmO
         4RXNYMO3VRlgCVuZLsaNVI3qYqi9b3OnoOl+r+T5pCX2fKeVRej+FHsk9A7bSooAKrRu
         lsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865803; x=1791470603;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lw+Zx3Ctji2MKAhZ1Qo8iu3S4OiHZVAXCS35rHrty8=;
        b=FWrCV3p5bUxpljBlcZuKlMrE1Kej8FsCX9N4HEgTTO1fUy4vgm0GZ477CKdLHUowor
         ryJIBhILWMuw1v7RnbP3xVhswSKmHt2HuxWtitrDhQlj3W9Fl03NOoYDGibHhCX+pVgx
         6TJxP8lDtZumY+7+44P5+boCPW9LkD8eP9wjJGHg2zaEg73vSlHD4/Ixe/iUMCpKwSi9
         I8i5dR5UuxAIvzdzsM6CsAHvaJ9+7KFYU4G/HRqle5pGHHUOyjlO0wWvWjHLDIlqpJFP
         jRXUC7e8u4xp7L056E9ASl2t09CU38hVPYX3eHauqmGdL6ZFkh/PtRQdXtGSVon5JBHw
         qYQw==
X-Forwarded-Encrypted: i=1; AKwUvBxktwBpfOo/eMFKc/PSSkKdeVQppVwmKIZRipqKKy74VZz2mCzPTVqQ+28tsGhu29fcRrCJOfkO8EKLbwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/aee7CTh/ZYXg/Cu/Xjz1LoHPS3hbHaT9+ktWPaDl3STe5p9m
	c3KRyvehVN5xt+YVCsGxyieF0t3AWO04YXyO+zcVi0Y8pil5vL8tklTpIYHCe6Mi4fE=
X-Gm-Gg: AYBFou3wisIu33uHcDQY6GDuTn3qhVdu/cZW0RE6171cQydsviR2I+rEWzEVY+NZHh8
	R7SHVDRZb29aD92mslnHyX6/iSWK32NxoyOaLmZjm5Z0DquS2XK8MME50oJvJOKU3tvE8JOd1Br
	dc4117TJ6H1ez3piecKbrV+pxHJyg+eNHPYW/oWtTG7zWmfWWU0y7q02m8ztpQ8VVtHA9zlGcAO
	JW2sN2sPNDoEbiS0OdsGi9FROkjmXTspVEZem2CuImi2L8gwCZ5PiV7uSNTpPkh4e2dnC/C18eF
	fXMXKIKwm2bZtNypTFH/ImLfHahI7tVuQ+A0BIlpdRRsdccNRrXg9RVjWFWFQ+9ab/WNgpm0loq
	5LOlLqT8sHpDBl6WuDl+FZFOTQCSCkHTm1o5G16XzAbErktJ1H2hT/OVj0fugej2MVJH7N3p7Kj
	PPPVoJ4ig539DHfjNxj0NHrieEsz7Kg9mcNHXK2+xV/0lirqESREx6PUjr2dIY/AP+SO+yEQA4o
	Vx0SDKcTGJ+t9up40Dp3Fzofc7LSZtKqnazh9Gk9cWEbEJiPxL3IFE=
X-Received: by 2002:a05:6870:e121:b0:48f:fd06:76c7 with SMTP id 586e51a60fabf-49ddd510ac4mr4912248fac.9.1790865803330;
        Thu, 01 Oct 2026 07:43:23 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded14d8a0sm2638009fac.5.2026.10.01.07.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:43:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20260930065951.2932739-1-runyu.xiao@seu.edu.cn>
References: <20260930065951.2932739-1-runyu.xiao@seu.edu.cn>
Subject: Re: [PATCH] block: amiflop: synchronize flush timer before track
 flush
Message-Id: <179086580223.1687323.6325589264595491998.b4-ty@b4>
Date: Thu, 01 Oct 2026 08:43:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 30 Sep 2026 14:59:51 +0800, Runyu Xiao wrote:
> The amiflop track buffer is shared with the timer callback. timer_delete()
> does not wait for an in-flight callback, and that callback can rearm itself
> when it cannot acquire the floppy controller. A synchronous track flush can
> therefore race with the callback.
> 
> Stop the timer before synchronous track writes and use timer_delete_sync()
> to wait for any callback already running. Keep callback rearming disabled
> until the write is complete. Apply this to the FDFMTTRK path as well.
> 
> [...]

Applied, thanks!

[1/1] block: amiflop: synchronize flush timer before track flush
      commit: 9690943353cec1690a715e000ba6a74e5139f530

Best regards,
-- 
Jens Axboe



