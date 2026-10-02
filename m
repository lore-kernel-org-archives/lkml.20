Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E17374A0E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965773; cv=none; b=u6rGmYyQO2Fw7hK0Q+ItLMOm691CY+xXUJyTJAlBrk5M2UqPa2Uudge5M88fIGBdNRf8kltZPkNjZIgLgl64IffOySckEvVjmZSufkdeUAAg4xc2YConAQ0SnFLa9ijv5TlBxlTesxgVsAENSNrr7yTg+13cXhw/SD1pvIqed3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965773; c=relaxed/simple;
	bh=Bz7Rk/lH17pY7d2mlfdx6a9jInPz+be05f+OXOKbwMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aoXGe2EXx39IGoGgjAGp4UslavqMqXCr5/NjZMUwhkfeLjZbty1wQW7ivkd7chon/ZMpLqoReRh047g+uX9x5E1Gpw0rjKjFflDnB4976D+nLTWqZSyUj3v+mK0pTE0hoGYEyHdSN2UETPVpHSgfhBdjZxDX42FZTI9zGMtKes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtUoSA51; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtUoSA51"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso112404f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790965768; x=1791570568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rrH8jPIjco9vZfHT3xe2ptHn3BuOpvxKbC3e4I9zuk=;
        b=LtUoSA51/Tk/Zy69EwLZOtx7fgDLk1iq6VfKi06BMkbJgo6wJlSd/QsjUo/JJZRQbl
         2AsH9QdS9UJ20K3yRL0pt0TXUY+jFLOhjQ8Nqt/Lew9h1B4asmb/MzID25mt5H5pY56c
         PVQjKTgiIJmjAoBkTR/tW+oBSFVns/wUdJT709oFUfZ58bh/SFNksTtpV7TQYMb/KINE
         AxtEhvK49lM4PgPDFRnn8+fGic8wkgfnNPUbOH4KN8DPX/CEKQL4cNYkA1kJ7MSHp4uJ
         wGnHdDl/qOFkzqI+uQuTmHi10OsbRgutO8TAgPC3XXQXFdEqGaMgqBe/AvEVjhRNPA4W
         Ldcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965768; x=1791570568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rrH8jPIjco9vZfHT3xe2ptHn3BuOpvxKbC3e4I9zuk=;
        b=z6nZbPPQIeEDr7lImOK5BsJDZuSxplTxH8g568GpzT7+QD89uFVDj29pVVcObWPtHf
         /2NH7XKzRWT4/hURRKUw6i1tw4hqDFyte25i3FKKNjgwfLUWoseCDGqivZrIM5sdfvBW
         NoVSQ/fNjxDJeHRsHsHOSi85kO6hBYHc8CpuIr6uROZOElJIsUCxB1J3jizH2we2xsfJ
         cU3Zz54DwMCv7J+BWT7vISz+ZA7HmBpJrOwr1gm4RgBAopfodtT5TU+97VR9d0pBNkEA
         Xvr/tV1/0BQ5IBdoDwgudCWCVb94BBHTzLP8aOHwBocdlhWoNTaCMn0bOdboJPOaEsYr
         TImw==
X-Forwarded-Encrypted: i=1; AKwUvBwyP37A2B9hLrz8mixa7Qu3LxbxeH4sI1S28url7moDhFs3wdbDBOsQKYduShfXziKMLRaGmiGs2uY6Nvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlKpISQYtEHNMysoS/LiJ3Jks2PkM2j/gGChREuuxh5KowTrbo
	+Su8wlcYz7S1/fA0fdQbIM3W5knL8YQy9fN2wssU1ODsJJR+cEvkoXQc
X-Gm-Gg: AYBFou0OZbJbO2SXtMFOh/qTwDu3sSGGbgyl5teD/TYWpwsjsvHik4+LgszUrNy8cji
	jlDh9s5MpuCrGbpQJr9V/3ZYpLKN9aycSVBXJ1ekqrZxOkwVpt/BwAWFjjc5akO3xDJEzZdXrLZ
	FoEF5Mx6rTesc1HNEWNcIOEif5QUkoMJ0s/G0HO73Ninu+nCE+d2E6uPxGCim42jeDjm2NgMPv9
	/U4Xoe2Rf5hVmqyPFLdwykmOkoPnYMD9cYo2CUg9IxIpIg/m9OJHZN2pB1AvZedWIcfkRNoB4TO
	YYCo8Fp7AwPEooQFZxytEIsyjUVrG6vt3+ZGGdENgaX8ChP0UOg8xaZUMbeFpliras5arXBzTGt
	C1AsJCI/coZa3Il93k64tmOCLB6dFnwh+Mg2Hbd1L6lA+ler0PWuG01UXbHgSfFEAmF5DAc7JPX
	AQhDhSJtRnMKyhYV5Hv/TG8sqWG8aBDKwAPQWmNR+gKhsOCDd5rpTzrggQ8JqNIm2AXcqda2+++
	F9ehQ==
X-Received: by 2002:a5d:64e2:0:b0:48b:508:1cb9 with SMTP id ffacd0b85a97d-48b126f1568mr6613899f8f.4.1790965768312;
        Fri, 02 Oct 2026 11:29:28 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380faaf9sm7429656f8f.22.2026.10.02.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:29:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Date: Fri,  2 Oct 2026 20:29:18 +0200
Message-ID: <179096555582.4050.16689195326008531646@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
References: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026, Rob Clark wrote:
> Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
> so gpu is initialized later, I guess when the compositor starts.

Here it is. The kernel is built without modules and with the firmware
built in, so the GPU is brought up right at boot. The GMU firmware is
gen80100_gmu.bin from linux-firmware (v5.2.38).

[    0.620358] msm_dpu ae01000.display-controller: [drm] Using Transparent Hugepage
[    0.621120] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0xc0020000
[    0.625910] [drm] Initialized msm 1.13.0 for ae01000.display-controller on minor 0
[    0.626015] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/gen80100_sqe.fw from new location
[    0.626115] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/gen80100_gmu.bin from new location
[    0.626994] [drm] Loaded GMU firmware v5.2.38
[    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu hw init failed: -110
[    1.652389] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.652401] platform 3d6c000.gmu: [drm:a6xx_hfi_stop] *ERROR* HFI queue 2 is not empty
[    1.858322] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb frame buffer device
[    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110
[    8.187443] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.187650] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110

Oleg
