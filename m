Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9C44D37AF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793553; cv=none; b=oiRfHuDpKkBLt/lOhlHoBH+sLkXg9UrQoo5WSmnIH37cOlOPi27RRrUhx3puYsOT9pbR4Cz6uVlrM93+l1MbHEjTfxeWEVkfidLAc9MMd8Y+R58eJbvO/Rbi2rf/wWdpMQDJU1PWOatsvXpd7TNo8WIzYPmCEvTrEsaCLxcZkRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793553; c=relaxed/simple;
	bh=kFAHzsauXPIyCr3E+dyQQ6Cgg9yLC/fJTOD1fB8VlVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZxSNtPKQ74cJ92K+94IiOeRsRJt1eXfs1S5TdUaLgwyMw8asr7uueQxmQsixmijdSuFaLDSvusN4TLITRg1FxMeBvZHchwGXDb5nAMZ+/97WJX5RY+gO1dg94/4VPWX7FuVXsHMJpwqCPFTwBkDGG9rKvL4B/O7JwWFltlPIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Poq8gseG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Poq8gseG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so3291297a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793552; x=1791398352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFAHzsauXPIyCr3E+dyQQ6Cgg9yLC/fJTOD1fB8VlVE=;
        b=Poq8gseGD8LaGij0nigS9Y9IHqBWyEZ4F30dzELv7igsqx24OqcINSBUy3F3jACavz
         OHFnvTkS7vmGF/t0AZMZIueGqFNux23GZWE7LCi/7ALwBMkN74TWPoEBZNAy1m+z4H/v
         0QaYi4oT52vMetNmNfADenbxpMZDXAVmR5dowevZ34s3hvX+I1WSSslpzyXAqVzIpkFD
         5+kMRs5FQjNFFxvyYRSHlYajMITtRFJOTPzH02e6+YKVOTMeNXep4aJE/iuu8FDF1/zw
         pEU/0ARNlA0OzyzHVEYcTIZ/WMWVJm8M5iVeA0LWAa77MLqKa1nvtmlLwlDWYs8aDMnA
         beMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793552; x=1791398352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFAHzsauXPIyCr3E+dyQQ6Cgg9yLC/fJTOD1fB8VlVE=;
        b=uIhwJZxPUMcGOqhhujOuAK4AhCiaCN8cCycC4p1u230rsf9temHEOIcQKGRl1Uae56
         hzx3kJzL1vC2zsL1VAse0IAUFVDpZii48CtkuiRZR+/WSinhFvzY34OqDeMY+sXx9kOQ
         Y9jOZCPR3yFFWl6N2RBWBSmG9NTCLEqgkU1uWSxXfuVyVXfzVpKrm74lFp0tDoWNKtAV
         jZIf1S3RU1e1UD3LA3gNlkpj0FKxAMPl82mt/Fhu06GoGaxnM1NjEE1Clwr74R7JVn/g
         HTXhDPutZ1oAcNNw8OenIZXG0R50P3VUrsKFjeCslW1oNh1FyOSDvbS7a2LBizonnYf8
         2sIg==
X-Forwarded-Encrypted: i=1; AKwUvByVM/0MW2/WwaysrR3dw54GAgZ9TuZabKgmHtspoJ7wzMdsvs/P+GOYcPvntpuMjhoB9UBa0Ay7IbuzRu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6p0zHMfXOSgHMrDtcx851ViwgwPgJ5iesIVE1Q5UYoOs/sAJZ
	O86NtZOTg3qJtsLvL3x0Ol1bOZT/z+wtUyx2IfN99Echg27S3Da8gxN1
X-Gm-Gg: AYBFou2UFARfIgM6V5as3PUeiaRfYmct5dJGqU64t1t6AX/VYNLKp48xt1U2w1uDr6J
	G5oKSvaLtFEf3iYDbH9uE6mNAHJow14BBvyo8EL1W3yZRwVJppxPM7TPymFZT/73yhwl0X/e6Vy
	s7Bn/DlM6CX+ViIBT6faMK7TaqOWeKuhINkheet+vluT0CiFfaYZ3A0e94csyKo1w8graYIqnFJ
	93kRevR/TaJXJNwM4yvNzpYP84sxJDXrjppaBI7P3H5RXNFnvWXOmilgTB0H0RuIFbuVccA4Vsy
	8RDZRuZTrpeTw+Dz9KIFYLxfVNo7QmaoA21vKDLDC/Yn2HDdQGmf4+uYP29MtPlGRwvlb4On+UE
	dfHR4fffhkbofCaJPqbSsfmLdB5TG2zS45xeUWVfqOczszkO7xHtAl05lofcRAWfw3HNw3MDmTs
	HEokzZu8E6XGWS6zylryi2GTRUV7Qywphi6g2SpYi4jlv+tprNQwtV3/6CjS/XLSEqcozKp4Bor
	HT+qvzHVCd6buY6odWnG5MiT5tXVPmsBk/R7TpSzmMFh6o+6YeyvLXBOLgE90s+DLrPlQAVo+P0
	lI/tYikEKqS1XAgbhVq/mcbdL9knxWe4mvdq
X-Received: by 2002:a17:90b:48cc:b0:3a4:c18c:b894 with SMTP id 98e67ed59e1d1-3a4d18f52d7mr1859734a91.52.1790793551779;
        Wed, 30 Sep 2026 11:39:11 -0700 (PDT)
Received: from rahuls-x2elite ([157.51.37.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4419ff9sm532916a91.9.2026.09.30.11.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:11 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Date: Thu,  1 Oct 2026 00:08:54 +0530
Message-ID: <20260930183855.1184-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com> <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/25/2026 2:44 AM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout.

Tested with this patch and patch 5 on an HP OmniBook 5 16 (Snapdragon
X2 Elite X2E-84-100): the GPU comes up as chip ID 0x44060030 with
15.75 MB of GMEM and the GMU firmware loaded, and with Mesa main GNOME
Shell and glmark2 render on the GPU without corruption.

On qcom-next the a8xx_gpu.c hunk needs a one-line rebase:
a8xx_set_hwcg() there also checks adreno_is_a830().

Tested-by: Rahul Pon <theflyingrahul@gmail.com> # HP OmniBook 5 16 (X2E-84-100)

Thanks,
Rahul
