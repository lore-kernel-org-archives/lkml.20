Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810941;
	b=q/OPAOpfbJMaEQTbF8zyG1jTQuog/jt4Ig/CDUAZUK0LGjger7rPsg+ta/mOOtdu5cjb
	 bFrzYbtSsQHDRwQcl32ExX55AohTq/r24QHz84DWc7h2ZG7ZaX4lSCpX0KIA+3MzO4/iR
	 VZL3PoAiGueQrb+oE1BC5ioUytwJ3r2Z8Q+Oo9WjVpMjYFIKIPqO6xLRQyZJ3Gy0psyeK
	 mRexLLNaqg0WgNPQPNsi7yIr1ZQuNh7OQ+OwTKxsxFTxP2Fby8cKb3HP9ufjuFYVeDftH
	 chtoMLCdf/EeE4JjVGtxRILiQSMxPlRJw3HqrmVubnPspi4Lvij8L4v8Na/5djN/l6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
	b=yz4msX19Ulh1ohsOJTJW4gIbNok/nypyOnGpB5PauEEyZpYhCYb8W3rZYvymLndovPSp
	 QBb0K/NHeAh3GYKmJ5reCX26OWumPAZ/qrxuVsc59EMk3TLqpMWgLob/dOFUohq8Df/gL
	 HLdKWq25b8ZxdjRNhHpuB0KPYAIZgkNutS5mUq8LGeZyD6sYP61a3ygkbaeCnKdNnauAk
	 8abX63IzyQVf29W2g9sfrVGhxpG/UYDEsvNkjLe6J9PbTUVCbNOi+EfdzudyVujAxqd6Y
	 HgwktLfc/p73htgk2hkG+0xvndp+eiG4ENvF+MZDw0kGXB7nPH1BeaAvaEUUd4yDjWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VsVaqSr3;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E4606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632E4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VsVaqSr3
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6d68de53053so785547eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810940; x=1793415740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
        b=VsVaqSr3vGYJqCiG8HH+ooZMO7LUI7VGxBsEItKVkG05zStzwyGmdpRrdKdn0hx43j
         +uCERXXm4lFEsKIN1dNdRFxQnHfFfeXMBv2nIkzgIM5k5rToGUvQlluXHFiaCOemeDQZ
         YujB2EUS/lNt6wX5DTB4kdRhe93wr3TQxEqJWHYazFKgQIQH5XOFuYYFmfpS/NTTyu4T
         pHSLwkrUVQZMJHlJzEO39FCSbg7I8036iwOG81NLnspYQPb9pB5JKNONsaXNRkOAq1CJ
         ZzuyS0jIULVX4YQzirAQMaJ4mwepgIdYoI/02o70hoHBtaNN7TojH9QSk/HC+22z1E9n
         xn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810940; x=1793415740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUo+XtntZbYcqPV2ScMpM1XRucfaL+Ekp6Xynts5zkc=;
        b=GJYX4nD//kHRY1K+O7CydrK/OePjesCsLl5S3xyP8op6C0Pg0YNHAB6qYl4bLBtrpc
         q3mVHhgvV5eiHJIpi/ut5fcq2Ns+edVSH0X4u63m0izVceUTEn4P5/K9Bbq5DkOOUQvr
         f2wRx2JZx4nilZreb5PpIe56/M6RoV6KFyPNfSNRdm5TMIDjOOP1/GOWv3m7y9dwkl01
         0e6Fw51H+KIHLxwKfDXjJz5R3nEow4ruNE2uI5U7aAedWVmi6yTBSwm2APVZybcVGXKH
         pKm4hu2QfH8wPr7qgee9uP7q3L6hbN3yQc18BBgVBkKbE3jBmfcvUcVH+RI2rTu6fFjU
         inAQ==
X-Forwarded-Encrypted: i=1; AKwUvByF2ve1Bq238r+ctN6u1Pcv7jVTjy+idTW3cVp9rRseAzj8GblHMHJMhRRNi5BuZnHX+SLOZQiyqJtdylA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk9btRTFQuwNxVckKL1lcVvoKJCflK0I4T4fS41FRFYM1dKWLY
	ZXKUAVtf6RPbBVFnLjWD15kmnJ/pzSTtdwkVSSvKEUbyKMyPMrFF9TEp
X-Gm-Gg: AYBFou3IFeAQd4ukLlcxQZpI0Lo9BMurWM3tLVKIDY/3Hte1a80EfprbWrLtakkiDQo
	ENA/wVaE49vH5cDJ5Rf9tW/dKNlrDG56FNfIHbSsDzQTCSBYcIMQun1T2qTaMbC71+hIWldtMuh
	Ln2MjA0walYBe+OLBL95iNCwmaytTjw8COOPXzkjLW5fe/AZYsaz9KCcA6AvL+1rto84c7NfYz6
	tCettnIhjloKN/8F5wahpsaII9hfOcyuoKLgATur1uFdQzu6TLINZR/mq0+MRZSlQ8FVica2q3f
	Ps8XIeNdnuRZ0/fyZgxOKuogups/0NcfJpo3pXPAq+NOFYI2t2CQOi5h4PHZidE4g7pCfwc0dvl
	6AEOpl6tTLV931gqo5QVNrEFVcFYtzLqpa1OidjZZk/4EdMyWOzBKIkvrEXyVa4+/Z6k7slTsbb
	oAOUrqY6T7M48U24LBU/C7YyOFa1tQIx+Z5IIuqbCaTCP8MXtnKluc02pEH6ERa0nVF5ZGQxOeM
	JfVZKEHFwbOJrl5RL2gDO9AS3iYhrcHug/e9AQyMSok5Of4rfivLlCJUJemEeVh1ISQiDedYWUU
	0gF8
X-Received: by 2002:a05:6820:1344:b0:6dd:1d22:8573 with SMTP id 006d021491bc7-70ba0f02572mr353232eaf.67.1792810940397;
        Fri, 23 Oct 2026 20:02:20 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:19 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Date: Fri, 23 Oct 2026 22:01:25 -0500
Message-ID: <20261024030142.13643-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 02:44:36 +0530, Akhil P Oommen wrote:
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> [...]

With this and patch 3, the GPU and GMU probe and render correctly on the
HP OmniBook X 16 (X2 Elite, Mahua).

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
