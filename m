Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1191E1A3D;
	Fri,  9 Oct 2026 02:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512234; cv=none; b=mb2naHSyfxlSl4MQGjtdWi3hXHw8ZPArwtrjjcSEjZ9Q3ibc3P0UKJ9z76MMdVbHPOiMPhyL3iVzaST+fV25rkn+Bgt7GxVlOxbErTSBia34kiP4xq2lIMP4T+3zhdENrKnbxvL32hgelsKh8O0w/FHQgrmVbd87AgH43UnzD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512234; c=relaxed/simple;
	bh=Bu2Lgys5jNS+9UyAJtu3Q3ovtxDVAMP8wHCnbhA8Gm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuQYc+yUpM8wjYJF1GyLHmNsfEWAZiq3y+iMoAJBHbGwTIsO4uRyjNXjgyoqkZRrUqYANdYPhe/7Op9mGAKP4APgo4iE01L9WUK3OXWPRI1dsx4g6jPswWtvEOUJeczeJmAlMM7NEj7lc7MFGmO77XHHTpkqR+GP+aVFypLxuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=X9l/zzV5; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="X9l/zzV5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y9hVD3xvBEObWSy6ytyspWoTRQCrAHvmo/KoI3ARlD4=; b=X9l/zzV5ooVX/hm3juP8UxtH4Y
	HEuAnj5GQlpO7uRu2NwFUGJqyl7xy4rCaAzDRn6TeWjF+yHu9BRdOac1W1m3J0V2OcWnR5tOisV11
	eHMKJwVAhhYUXPfbq3PHbzyzHC6cZAwIO6eOZv18tf2YCPE43m+KNFI0ONptDL6kYR7c=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xF09T-00000009cH9-478w;
	Fri, 09 Oct 2026 05:16:05 +0300
Message-ID: <ad0e1019-9080-46e5-9a1a-92d976e8a50f@minlexx.ru>
Date: Fri, 9 Oct 2026 05:16:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on handle
 close
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
 <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.2026 11:48, Dmitry Baryshkov wrote:
> On targets (like A530 / MSM8996) without per-process pgtables
> msm_gpu_create_private_vm() uses the global VM, so all DRM files share
> one GPU address space.  msm_gem_close() unmaps the object from ctx->vm,
> which on those targets pulls the buffer out from under every other file
> that still has it open, and frees the iova for immediate reuse.
> 
> A dma-buf imported into a second file hits this as soon as the exporter
> closes its handle: the importer's texture keeps sampling the old
> address, which the next allocation has taken over.  On a530 this is
> every ext_image_dma_buf_import sampling test, reading back all zeros.
> 
> The VMA teardown a shared VM needs is the one already used for kms->vm
> -- defer it to the @vma_ref drop, when the last handle and dma_buf
> reference are gone.  That restores the pre-drm_gpuvm lifetime without
> reintroducing the reference loop, since a BO with a live vma_ref is held
> by userspace anyway.
> 
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_gem.c | 13 ++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.c |  4 +++-
>   drivers/gpu/drm/msm/msm_gpu.h |  3 +++
>   3 files changed, 18 insertions(+), 2 deletions(-)
>

Tested on device with a512, previously faults were easily reproducible,
like almost on every window/popup close.
They looked like

  gpu fault: ttbr0=0000000046fdf000 iova=0000000004635f00 dir=READ 
type=TRANSLATION source=1030001 (0,0,0,0)
  gpu fault: ttbr0=0000000046fdf000 iova=000000000462d700 dir=READ 
type=TRANSLATION source=2030001 (0,0,0,0)
  gpu fault: ttbr0=0000000046fdf000 iova=0000000004c6e380 dir=READ 
type=TRANSLATION source=4030001 (0,0,0,0)
  gpu fault: ttbr0=0000000046fdf000 iova=000000000497eb00 dir=READ 
type=TRANSLATION source=2030001 (0,0,0,0)

and now cannot be seen anymore with these series applied.

Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

--
Regards,
Alexey Minnekhanov
