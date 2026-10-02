Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012394BEE4B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963253; cv=none; b=FyhRuiJAAdmKRzlkdqj8PbKIpp+N6gdFsk5gq1bUmJX45eMXKqkdUzUKFIC9tp5Q5ZrBIxS8ihNpyRfo+JJgLrmZXarF/vykdb1ZmUb1leP4xUwVLb0t6ldEYLJQQyaqgM4ji/PPVU9MdU2aZX8rUn+ZnwonoMkV7aGA0pCesaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963253; c=relaxed/simple;
	bh=Cd2QE3iYz63jTSegzxUdKqxdpgigqksvpDvPJ3x44Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlVL7g0eUrNmPFTtESi1UTiTZIVHw5oS9Czx1Pwgvx0Y5kpEiqfxZrPOGUYZWP+kJB5FMeWRZhrxl2+UMd/yeUzkgPCFfQubO0VHS5w3MqdyIZw3SxQB1auXpfdLm8gpuukyRxvtRs9UYlDi6O83E+GnhBzkYzYJfUB/rV6kvNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZcYJnWF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZcYJnWF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so624465e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790963240; x=1791568040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekbcB0Q6K0Df7evy98c+D1I4IxidAbimqgNUlWNjtzw=;
        b=jZcYJnWF5DIyzw+p/6dQtK18vAtNqCgzmrHtmXucQHlSTvJoza+T75F9ztLaJPZt/l
         +rTSzWbttIayzqQXY+MMzOxFmeark7mKwn8zs2b2OGSy/SkivRXT7T99WhRxPWOXNVCw
         xh50aWBkJ4LhXDeAM3+a9c1zYcAbiEt8msDhFxj1eGtptfzYNtaaCPd44UcGRNvwEa4G
         MLw53vNULzcLA9UqECsWqYj3yeYA6d7bzay8VMN8Q9uPXUY7ngK/tRvIleijJOVZXtqW
         dI0vVl5g4ok5bcjRhogNGArol9cHJyh8lrJZlJTqIqO9hP5kBmElAirPkVihzKbc7gij
         rSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963240; x=1791568040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekbcB0Q6K0Df7evy98c+D1I4IxidAbimqgNUlWNjtzw=;
        b=cwXreix6H+VJjCJzVqgtvTDGmpGUqtt5rDJmrtc6In8ISd6FSC9CdWOqnA5KAEf3SO
         kUe+eNSaZslADJsUHF0sFFNCXIJ8qvEfckTeo+5KTNqw5bJmwlNHiJktt886UKJSmeTr
         o8GhseNqad8tYVd4xq+CqAaf3PSDS3pwB26/G9dsHDnuAjZyHZXHyHp2l85TkDhrGeU/
         2v+rI5AmTv/VMGdsZdIQtmTQ6ETvGlwyAIktc78B9cOqLDg+PDj9lmtDEfYFtP2dm9R2
         Qb015Pv7BfzSyv7p2anEWq6MbdBtb7HWP5Cyb/kVFhWpxr2vKGKpY0dKQiXSx1zakLYN
         +jMA==
X-Forwarded-Encrypted: i=1; AKwUvBz2MBWt/XoNfvThAqY2pFcAlldX8UVnGfOfFGneZeEjBrowBYKpAPxCETYdtBd74F+Q6wk0nxQzKgvPbt8=@vger.kernel.org
X-Gm-Message-State: AFuF++nG3x9EskwkFlLewrlqW4mGVRaV67sfCwH0g4q85CA70/PNTtge
	HY9Mwfx0EujqNX/0pstHtEF+FFUOH9fwp15dVdf79TbE0pnwluWrts44
X-Gm-Gg: AYBFou3ninK0A6+SSjB5kH1Pq6/qmMvT/KtDS6nSry9t7H+KRDUh3oQ7CQnBc1JoCls
	3at2c6fkZjMuV877vTtcDwC0eYXRxq8BI9GDhbkTm1FabQhF2yHMgD0OnumWQIJFzXirh85I+YK
	0sUoftLi+HGQ7tlaHAVIKLNZqmxTAap8g3FgRCS0/yvGwhruBW83VNk/JMts1z/xLNeCdcgr5Y1
	VQONNVprNQ9Y0jb5o9jYeR71RdSxzAEQSIHOKT5gAo1frXx0ReepqiSFEwcX8kyLtR3o/RqaBCC
	bxTfwa0Sv6D0qDpteSUJ2lD4ycbEHkN/hO5VomukAxD2CziOypd5T2ovdvhNwaHmh6277le65ly
	7gDYYAW2+w9PgJfHoP0ccuQ380AH/6IM5h0F8QZvU0/aMBSOF8tkXIdQh2AXFayqoDW/kuJdj6u
	DuvE6yA2EC1RI1PwHKFO9/Zkwk6A/YoKWN7knO+lMUjmdQcIIQqwSHs/2zynULsg8EM0CfYvoba
	YugpZ6efvJni2XH
X-Received: by 2002:a05:600c:a012:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-4a1680e76dcmr2993815e9.5.1790963240043;
        Fri, 02 Oct 2026 10:47:20 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b382f9ae1sm7515541f8f.39.2026.10.02.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:47:19 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Fri,  2 Oct 2026 19:47:10 +0200
Message-ID: <179096320161.1973.2852858792260211089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ar_AuRr1eaZzOfw9@baldur>
References: <ar_AuRr1eaZzOfw9@baldur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
firmware v5.2.38:

[    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu hw init failed: -110
[    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110

Compositor fails on the first start and works on the second.

Reverting this patch fixes it here as well.

Oleg
