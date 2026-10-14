Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6D2F12AB;
	Wed, 14 Oct 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955909; cv=none; b=Qh2z2maZZFpk6uLtzvSQt/Y9phshtVH3AUpLPwJAtamvSV2FIVbjnmgRCU2ck7KEp9FN6g+ME+tecnR0ZgwIwT83fX3KgWechhpXRLj59mx56BKyrvvq3HUMY/UVNbjvzE2Nm/MuHLxkAw/M3P6ESgf/v0gWVgGhhKQ1SMqJEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955909; c=relaxed/simple;
	bh=gjk/oKs96fB4Z2DaF7Revw2BoOQNm+6j+bWWoDSVQyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HV+lOvQ4czJQltgDRSv28SYgRhRXSGP/26Sq64sEIzoHFQ2Z4VQ0lO++sLNjryWJHuE6tLMr7ftqYcoVQpLhhAJ/qd7iJ6YRHWHMS9NQjXzjsJbUSjahlhRD/5hnFs0f+pDZ24Dll0S4Pgyv2HDD00W/YTKf4cWrtihldswwcIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=tmNuO4Fq; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="tmNuO4Fq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aL93h5H169V1YGksc6NSU0nrYwIciZ6QUOmK73uFp/4=; b=tmNuO4FqzYSrovEkTEg9G1GzTv
	PfcAY5HkmgQHjkJxJqggRod6LEeKj9w9XL1LQs5qphHQiYiTDNMhMeztoO8YotTa3FFUVNEw+Fl1j
	TnD7wJniXEkvMFke1sTW+aGQE7BngE+J/BR4rT6BSNfnAlDbo9z0eQOzz2VR4RxUSGaE=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xGraN-0000000Acx5-0z1U;
	Wed, 14 Oct 2026 08:31:32 +0300
Message-ID: <fd50b602-b0ca-46af-a04f-f7cf7adf6099@minlexx.ru>
Date: Wed, 14 Oct 2026 08:31:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a5xx: don't read the GPMU registers on GPUs
 without a GPMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.09.2026 14:08, Dmitry Baryshkov wrote:
> Only a530/a540 have a GPMU.  On the other a5xx parts, reading the
> 0xa800-0xac60 GPMU aperture during a crashdump resets the board -- on
> sda660 (a512) a GPU hang thus reboots the SoC instead of recovering.
> 
> Split the GPMU block into its own array and collect it only when a GPMU
> is present.
> 
> Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Nvm, I've managed to "catch" the GPU hang (even 2 times) and with this
patch I've seen GPU actually recover and kwin_wayland displaying popup
saying "desktop effects were restarted due to graphics reset" and the
device was usable again, which never happened before (before it was
completely hung). And after hangcheck recover some register dump
followed, which I also observed for the first time:

https://paste.sr.ht/~minlexx/20376296a7d95d2273dd2a64c2ce792d77954bce

FWIW,

Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

--
Regards,
Alexey Minnekhanov
