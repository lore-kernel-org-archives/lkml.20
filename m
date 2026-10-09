Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE4352C3F;
	Fri,  9 Oct 2026 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512662; cv=none; b=ZQ/0KS4Hd6aC6wrW43nD2mezR47IWsGdL/8M4ie9S7837N5MFvMvjIy9e7IaeM9P5LhOqS53Gv1UjFcXmhSryhN0zIRMvUnIJPmoOeVyPE1XBwN25xgP1EAfTayMXQ5cDj2tlUfcd2BUI+EgmZJcziiulnUp6jsO3/VxZdSrD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512662; c=relaxed/simple;
	bh=hbA3/KxWC7/fdIyctQuujVIv3zW/ZIBH2bnaUDC4N9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCLNyUCpa87rnhZ+0i4fvuQsqHFpcaEkG4wos1kllxFqZ9Gn7shd5pQUF8dF7f49LPCSI/nTWN272av3jEFgOQQcON8LA3iqS7PUq7MhEYqadDFsGjE50fOqnT7Womo4Fg3BEi5JYuE9lgondO2n0lbBKBPVgtbuxGYlfBnAgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=Qm7pxs5W; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="Qm7pxs5W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tmQUlKSl1ibZ32PPgjX+DY+ll9OplHMlhC0QUlgcg18=; b=Qm7pxs5WkOZ9Nl2K/orzA8VZkT
	P6cfAFNupXMXLpZQRwupMqG1N0nnN09XuQXCurk5L1JB3bn0lO5TDHWR4xcONao639gI7MjMqX2+N
	PPZ2nPoQzUlvqGLxk3pglrt9lQoDxqU1VVX6jmHkZ9/0rGFEUKbgGz0PizkYEH3sT+08=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xF0HN-00000009ePZ-1WrX;
	Fri, 09 Oct 2026 05:24:14 +0300
Message-ID: <970f6a87-6481-4b41-9ee8-37a3885f11e8@minlexx.ru>
Date: Fri, 9 Oct 2026 05:24:12 +0300
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
> 

Hi, thanks for this! I've definitely seen device with a512 completely
hang after having GPU hang, so previously I had to comment out crashdump
collecting routines to keep device usable and not dying completely on
every fault. I suspected something like this is the reason - something
working only on a530/540 because something exists only on a530, but not
on lower end a512.

Is there way to try to force crashdump to test that this now works?

--
Regards,
Alexey Minnekhanov
