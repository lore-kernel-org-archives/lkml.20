Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A53CB2FD;
	Thu,  8 Oct 2026 23:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503954; cv=none; b=C7QvQLuEGXWBSYqSmoBa0NTk4MiYQsdmPjIm4Vl2njDPtT1F5ytspVYSMwH/FatftOz406thtIT2JWfXYEvxgimnutiWMeHbYeC1h4euBmv0LKiWRDP9PdlKsEdmSv/2UNnAvpdIkGVAGGV29V5uPgq6mul9hx0BglcrYgmFqQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503954; c=relaxed/simple;
	bh=NW+Fs0NCbeVpGvwDsXQaHUdW8kdPw+04YHZ6vzx8BGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjycFe17fJkyCQ7f/wVThFd5u9MAzyEPlCE2RUxRJZ3MOkr1GLOP4jVOQNndhkOqTI1NMKZIQ+4Q+q6T54mWoALhehxRlyAsdCDNdOuTG/TRq/GU/WxbiZNnMHYAEGWg9uyXf8K7acUteERyxr3Y/1+8QwFhBumuu2USH31LFBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=dJpN6+Vz; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="dJpN6+Vz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xRu+OVReHZZZ8Gs1E5fRPJgegCzlBaNiCuBPOFT1DMo=; b=dJpN6+Vzg8XO4DVzDCsNVlbFQI
	3PiwuHmIxIt+ZpPck7wqrPE8QQ1/n4PlhL4UH+bYCb2p7JpVarHZCzo0EjxdKhYeuu54XGXOURcqH
	CIO4yNlmbk8/Q9Ir8DmCq2ea3mmednCifzfI1Zstov6vfj0+R2VDVEHhSZNGOMcdwErM=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xEy0m-00000008axC-353x;
	Fri, 09 Oct 2026 02:58:57 +0300
Message-ID: <5380b2cd-48f1-4e4e-8a11-9e303c366e47@minlexx.ru>
Date: Fri, 9 Oct 2026 02:58:55 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.10.2026 16:13, Arpit Saini wrote:
> pm_clk_suspend()/resume() only call clk_disable()/clk_enable() for the
> AHB ("iface") clock, never clk_unprepare(), so prepare_count never
> reaches 0. The clock (and its source) stays reported as enabled
> through s2idle suspend even though the display stack is fully
> suspended:
> 
>    disp_cc_mdss_ahb_clk [19200000] ->
>      disp_cc_mdss_ahb_clk_src [19200000] ->
>      bi_tcxo [19200000] -> xo-board [76800000]
>    disp_cc_mdss_ahb_clk_src [19200000] ->
>      bi_tcxo [19200000] -> xo-board [76800000]
> 
> Calling clk_prepare_enable()/clk_disable_unprepare() directly from the
> PHY's runtime_suspend/runtime_resume is not safe either, since it can
> deadlock against the PHY's own PLL clocks taking the global CCF
> prepare_lock during clk_prepare()/clk_unprepare().
> 
> Fix this by moving clk_prepare()/clk_unprepare() out of the runtime PM
> path. clk_enable()/clk_disable() (spinlock only) stay in
> runtime_suspend/runtime_resume. clk_prepare()/clk_unprepare() move to
> suspend_late/resume_early, avoiding the prepare_lock collision and
> actually dropping prepare_count to 0. DPM_FLAG_NO_DIRECT_COMPLETE
> ensures these hooks always run on sleep.
> 
> Fixes: 0b3ccb76b95b ("drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue")
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 132 +++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |   4 ++
>   2 files changed, 127 insertions(+), 9 deletions(-)
> 

Hi,

is this supposed to fix the message: "mdss_ahb_clk status stuck at 'on'"
during suspending?

--
Regards,
Alexey Minnekhanov
