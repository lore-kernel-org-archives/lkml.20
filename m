Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531547;
	b=FbzfTSPhaGH4QmVxWYBj2EHpN9qj7sYMq24/LVC0gmcMFsMAEAlknoeR3k/KnYFq/bil
	 ERsICrf6KHzkpSxirXlUkTT/qxBHr8CFNn9RkteHh+lmgQEn6svCmDXKP8FGEGwmxPFzs
	 xQx1oE2x/mAAZ73rR/id01ye4ciz7NTewcwEov8LlqTYlmL6hcQHjSW2pP5075M3azKSb
	 iL3fD3t2eXaJIzg4HeGSsaYiCJiIDFyJUGW+MZ9wpZAmx2GcqN7yEtTg0rw75rwymIhVC
	 O2Q46MnzdsyCEnSn/BZb9+sX+i3YeIu/MXpK4sy/L0obdWcjhTyRO986l+6Fx4kCc1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
	b=Oq4CxgL2VZ083vJT2t1yOiEKWlicKy3yFIP3ay3FKr29z86pTRbw8u5lGJkBS3YkUaWy
	 HNvMlRWHFmWpueQJzCvUc9npPSh4BimDP8HX1OzJi1pt/7GKlSEmCfpqHHtUVXFu8K3v8
	 K26iNgP9+sygtCv6q+2UIf8r7MoZ/VdX5BGCggjHYhofwH2Ovl4RUd8Gotyuq5JYTAh3B
	 FcDXFylieas9LZGhdfeKQq0EFtuTbNqcoHGLrxbeCOzWhq0ubWfZYGP+pGXf5sBzRfhLG
	 T/FDqpYAEFNgMsPS0ytYXoyoFo11pnIGBzN4sqimI9tHDJrR3H/t4un2Zc64bW8dn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D4606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809D4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2af4c8d00so38767c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531546; x=1795136346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=aXwA6C2X78/aErlxdCDVlDcBhkVNyzQp81N3HP+FcVhJ/FM8Ts6K3OTLEdrDTNlTZC
         PZlGbsKqFdepUhhUwf0PTM4/12NFZOmop3SMoBLlrEo2OKDYLM2AQ+eqSG4n7pA3N1pj
         r5tFkM5LxFCtgMVGCSfAjr7e5Ubz2hvSMv3cYF2jhO92/gHpAxYLlGhuvE8Oam0NBvBW
         3d/2C//L92CiXCNnqw6r0R+4t9XZfGZjwz1VoaqfrCxDktj2prFI3iKcjRF+UXFn16ap
         6K7zLI1kvvv7cxwwJV6+lExKlmTZf4DnCTPEVPaKT1VACLFTNEai51iOa/kMF+qrecyi
         rbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531546; x=1795136346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=Z9PtqC7K4mrMh5KXdAFdVg0PM9SMOVNzqrf+76/e9OpaDeoMnTCk8DatpeNeCq/412
         RTzcMXQcoAye6rrFfA0n78YGLHxPTYf5kFZTQK/6HFO2mu20c8iRz7FE3aZ9urstex/w
         Dq3YMtmchPhCy5z9r/wvlIb1NjLbPTNl0jJbD0DpCIslpenrdud7eS6KaMEBe3145MZm
         A5LG8owhniSyKL1cXaoCb3p5N64QY/zCGiC8J02U+EOP0RjDZ/cUF5T0g4CupNs5L0Nl
         9IlA+fBYyRf32en7Gzyo9q2gh2sBCiXyHWb5ADP5QKqHK+UsuzrnKP2FcU9/mJC4TSsB
         UjiA==
X-Forwarded-Encrypted: i=1; AL+hErHQHthiFFLz4wkkKRJtvcT50AESRxGhHNxBkrC4yv0m6Zi1LQ0nF3BWp9iiBz9lqv6OkkGJlDdBP+65Rrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IFpR1cJ/fkZuBmw4MxsaDHoY12CdAxf4bpuWvzcO+99wDmfZZ
	A0znffjJJICK0JwHkz/Tdfo2ur5L/KI9vg7jOv4WI1IrkVpNJfZBdtJV
X-Gm-Gg: AYBFou1wFQdFuTFVJGWqAQL7i5vYvnIP1lC1iUbgVOyuZ5alX8gmUABz9SQqMHBR+KP
	CusubccFvJgPC6Z6U39SQXHdHxNOv8PQPQwt5KxoztzUguih/NKNpGM6ZFDAZD5ppEpsu7/lU4i
	/T0CmD9WuDIlqntXL94dyd/xmCoC5gMKkxVBVUojZYTQCk1qo6SisLBhs9+Ie34NcRpxW3Hjdom
	pqqZMDuqDxlbhuxCMUvkMweaKnemSongIaDcs/g4aFdfvlGUeiuY1nGNBdpstJ2UD7O1JSsM6pz
	HCrN+3mFz9l+cx9AkayY8CeeA9mo46SQY5k1bHd5ILvk6nOA8goU5rTUVq1pplpTpQ8okcchKRo
	1jSmS/lzORtXAS+VgBMVYaI/NF+jG6h0GdrN2M9SSdBZOgRGR9axJ7Aybo3cWB6wuQ/z2DkU+f8
	V1cHtkFUVP/wknvPzjzy4kelzmQJ83vP1IrlnTUXWf8sc/Ozh66AkYHxJQcZgfOx8XFMbu72qG1
	/RKNQb09kmOFEGVPIPWASBFRbls1SuHZOCuasWSwHKv3eLc/+vDg9e+NV+CyIi+u3LfJaJHYhJo
	sw0LtrvZraPReE7+kwVGrdLZRO4p5IJLm9Osg+yDMWWS9W0eeuFHB4IK7ckzP8i21HlHsrY=
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr1197809c88.19.1794531546379;
        Thu, 12 Nov 2026 16:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm2760431c88.8.2026.11.12.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:59:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:59:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/11] dt-bindings: input: touchscreen: goodix: Add
 binding for GT970
Message-ID: <avZgzxJtnMceNQnJ@google.com>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>

On Thu, Nov 05, 2026 at 01:54:14PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> GT970 works with GT911 driver, document it to be
> used with GT911 compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied, thank you.

-- 
Dmitry
