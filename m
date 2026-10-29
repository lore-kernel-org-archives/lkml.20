Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309778;
	b=CpBKDLkRuO5v74bszjjySnCIp4H+uptyYH/+T+uZ8p/m6PetVfKYjD8jwcBZuR8wk1TL
	 gBMeTiTP+MfshEAkUHOUHczfLyPbJhuggL5iPsALQcL3xnc4OQkrQGcYBpKdGWnhkHXgy
	 4J6+SqqndyqGJSFoLu2MLO6YRS57yWo+4Mz9rfjiHj+RJOZrlnnMlZ1g5ybehR8ud0eGc
	 8r/EXCiqzhj5U6UV5wvzYt+UZsdF3LJxjyIVyKXiVPQcZ1/Ig0Yi7w3C1BDMpA76VvoLh
	 RzRDSwhlpxkTVCMSFdvZ5HstvX59U9pTWWvvEpm/0OQMooc3BsFb2Kadb23Eu0CqunA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309778;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=f7WfxrRogWkC2VbFyxZ98k7BXu/Nz4K5mmRfBODJm7c=;
	b=C/MzxGiKi87R+HE8GkITSEK+BhhEfVOlFQIyah917GIFPa+tkSQoldCJEE2iaa1v8jZ3
	 HMEeUrjKETFeCDa16TZj//3kvGxQPSBlaOq4lFC0ZemRcXP7AH9FbTJgS8HlTlVF0dPXb
	 wPGaWkm/jT+HUJ01ug7f6ZNHisq12VnyRABuF41ZNTw5edbgSa8SIFw4JyggsbJKr2cWr
	 o6tCO95JRnP+t7IDXlGTg3d6y5LWrpiid8OnvWUkXFo5EG9Xvn11ztlYvD9DJ1x6DiyVj
	 BBHB0gRAQDg7poHHrDnCaxrkJuUQ20QFmnjQg79gQn0ixAcluFmHveUD5ss/FPfzpvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RGRz4RjZ;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RGRz4RjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793309775; x=1793568975;
	bh=f7WfxrRogWkC2VbFyxZ98k7BXu/Nz4K5mmRfBODJm7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RGRz4RjZPwzVZeGbBToJdHMo+OaHTQts6Ik/SS/fwmTkeCTMcz1zWKqsm+x/ZxADT
	 T2KPKeEexN+gI9XqMVz5uiXc63XmcSLbiWl8Gu9xKGVrxrhJw8Sldj172bZSN0gOIo
	 Zq639wiNLAqct5bc30Dl1hTZoMmzAPcd2hxeec7PkX1PCy5tuJ48m0QKLl9oeTIj6O
	 sTMcx7QkgxhwurPmLt2HwObYE/eJbsnDnrMmAccWVgvYM4y1ss9ucCgsHvTTxWWSDi
	 ngklTpKdgiZW/PSlrpu7Hd+44uL+WltWW7Vja+LswLtJzMXTy1HCMBKTE0UAMeMhXT
	 1csCluPlIsP3Q==
Date: Thu, 29 Oct 2026 21:36:09 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Jie Zhang <jie.zhang@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 00/16] drm/msm/a8xx: GPU state capture support
Message-ID: <VVkrFTcMMRB3AjgGdwPgywO5nl0lDonm4QscNx9WTaYDTcuVQAHLgWxxkr7ool-1L7F4AHzjDKYAaq__MogbXROR7130sNTIzaHqPTyE_EE=@pm.me>
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 743194d165c51664fa7869c239141108936401d4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, October 29th, 2026 at 4:17 PM, Rob Clark <robin.clark@oss.qual=
comm.com> wrote:

> This series introduces gen8 devcoredump support.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a=
)
