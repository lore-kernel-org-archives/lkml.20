Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169F9460
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231437; cv=none; b=CHUHUc3jXNfIDcuMlgbFL7B7UfFXZvEX7AnkwQN+J5Jkq5uWRnYjkn7izwXKznpPMGcgLMIqIkZX6PQy0DzWGKX+hfRsc6lnrQoQ/FKZh1uFMb3ipH9qzmX+CKUU8e7IlCjZrX4G+/KYOBI3A0wF3qG6LefXfjOldGbpJaI4gEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231437; c=relaxed/simple;
	bh=PSyh/HeHvk/7F6f70gDMunY5gYvNfc4K4B4wBP6/ojI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4VTUcgh4NwfwXUEZLS+EX0qlKBjsgKNesNjJYsIxUsl7EpruKmA6lmjplP/js5URTL9lUw3Q1R9jj3FGlZRIjv9PRLNxPFGeNXf9RO0H+jp+OtUnJc79tnGvz1ia+4bUh301aMTT+fQDD1IdWtmNtMWYBTHA1FA04wAmkgh1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqowJNyz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqowJNyz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso8327615e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231434; x=1792836234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVgSD0Xq5YBvEBtVW7e3rRpcg9mWVhgCoVE9HSYJhNk=;
        b=PqowJNyzpBR2FDzdx60N/uSto6wBiiR+emdK+WrE1RzaVVALzjNDFq/Vk0Q47BBEy4
         d+hayA0dp5MEMLoboA2iJ30zNGXjGyuM30TYUFmb9CpFzgWjJl9mDpSaLfhtNvrUlOMU
         Xv2vNzHfE+VSS1lp30QiGhD4ssY6GdEuw9Om6VuVhaZkHhPAJcqD8rjgbaYKZxPXXcvB
         G7c/c4SbTuM9a6ZJrkbZfBZ8m2uGCksxeMOGrmbVxEDBhfrfDyQzNtfJab/LiUqehRxT
         2K4tHAHGX3cRx3UYFmKvDAKxJPmghk7svMybL4V8NuH91SbtGbgdpJWFaapTtnS6HAo4
         aGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231434; x=1792836234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVgSD0Xq5YBvEBtVW7e3rRpcg9mWVhgCoVE9HSYJhNk=;
        b=CQcAPlN60g9/uQfNxSXYxSbNKkqCGaLXQxMfdIbEKaW3PeGM1eBbR595QGzbOHihg9
         Vse9CF+5xx/8e5FDpxiDPrW9sCZiRshrNe2QGepTNxEFRsEMG27/IIEffG12RjPjZLMZ
         YbuXfQ6CLt9YUDqy9emLJNpCRMXJCJz3dfat1lq0Xo9tVc/qMIUlDn/TLcAVe0kbHpDO
         eqQJdFLdXp0s/lLRKAXWX+Fky1H+03hnL7KdYulI347IxYPJUvrznnunK6Kyf8aeQNNC
         myomqLaLbucyMNUIdGu7X9czatJ/ws4fLk2Yev1KtmQy0yW3QnVcX46LZ9swKqyeOZHh
         XFYA==
X-Forwarded-Encrypted: i=1; AKwUvBwPCgyVJzvX+nbRh0l573tD/Z8BsUiZIDAAwxpD8fmjONH3ov6Vgo2hDtEhGp5Tms2Atlq6OOhMTD0sZo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdQ5GVBPSgJW5W2z9bOhkIuraK3VjE6wnRAd5mexDKYztNNUVC
	G5ll97d4iuPzfRUdF+EWAnPQ32It/Ez2rERY2Cfsucx3TjDskWc5Oq8cBWxfpAsQ788=
X-Gm-Gg: AYBFou1B+VVA6+NMzM1KCTYcZiYWPg8dHaz5ToOCQVQoKwfdsnxb3lpKl1W+8Dkdhee
	mlWEcPDo0oKeGEi4dVUsQBkAZbLYOebQMtdOLEIXYjlNyjTTRon2xmVnIVPZ98NELknPtM3i6gL
	XxbELcZ/aAeO3sdhFVzNYdpBwHE61An6C0Ma3GPcEy20tPQH1IKkN3U+Paei3sdOYJ663Mil2QD
	+hiuOFQWv9Q3elvhVOcF/TKugCMX81njxQivp+AwolBzc0/oEYndRQYAsfJIrKZeOQZATvpxbzE
	ZLTKxhQQuKevkAssmxSexlcfSuv21wG2FVOzhSYn1/5fRB5doO/N8wC91oKP8g2+ncFDg+f1TOe
	5Uor1qs8ISJX6DMZAfHa50e9zweR9K8ftLTSRzgxA2eyBvntuYYgGVRrhUC8+P3CdaSJQI8rH27
	me02I96UE0R8XUxQ442LYaeUEt5Pm9h/1+G8h07MN4Aqm2JTxgMzZp877MwUG1HwUb4qVoCQewm
	fIF74Hp8Bvof9qN6oEA/yoZJA==
X-Received: by 2002:a05:600c:1910:b0:4a1:7a1e:6910 with SMTP id 5b1f17b1804b1-4a1d75f2afbmr50724785e9.4.1792231434278;
        Sat, 17 Oct 2026 03:03:54 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm36984135e9.2.2026.10.17.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:03:53 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Val Packett <val@packett.cool>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
Date: Sat, 17 Oct 2026 13:03:24 +0300
Message-ID: <20261017100324.1104-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <bc2ed82d-0d91-4683-b9ae-cb4299636c2e@oss.qualcomm.com>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com> <1118d9c2-4efd-48fc-8a3e-c2cc3eddc940@packett.cool> <bc2ed82d-0d91-4683-b9ae-cb4299636c2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Akhil,

On Sun, 26 Jul 2026 21:35:35 +0530, Akhil P Oommen wrote:
> I didn't get a chance to revisit this series after my vacation. I am too
> not aware of any impact outside of those dmesg warnings. Any chance this
> recent rpmh related fix is helping with the deep sleep instead of this
> series:
>
> https://lore.kernel.org/lkml/20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com/

A data point from SM8750 (OnePlus Pad 3; the board DT is still local).
My tree is v7.3-rc5 plus board patches, so that fix is already in it
as d9108bfdb746 ("drm/msm/a6xx: Fix stale rpmh votes after suspend").
Without this series the clock controllers still wait for the GMU:

  gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d6c000.gmu
  gcc-sm8750 100000.clock-controller: sync_state() pending due to 3d6c000.gmu
  sm8750-gpucc 3d90000.clock-controller: sync_state() pending due to 3d6c000.gmu

With the series applied these lines are gone, adreno_gmu binds
3d6c000.gmu, the GMU firmware loads, and KWin runs with OpenGL
compositing. I saw no new adreno or GMU errors, including across two
s2idle cycles.

I can't say what the series alone does for suspend on this board: the
interconnect providers here are also held by 1dfa000.crypto (QCE is
BROKEN, the issue Konrad raised in the "crypto: qce - Remove driver"
thread), and I only measured with both resolved.

One note for v2: 5/5 did not apply to a6xx_gpu.c on v7.3-rc5, because
a6xx_gpu_init() there already holds the GMU node with
__free(device_node). I ported that hunk by hand and dropped the
of_node_put().

For the series:

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # sm8750-oneplus-erhai

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
