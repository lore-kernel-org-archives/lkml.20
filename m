Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.105.120.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702662;
	b=aN+qFvmPUxUQMvyO5/tcgpzjKlGST+A3mMqzhfaLpgtpjz7GkRXqDfRNi3U6Kh2voUzw
	 biw4rrLDCUVsp67pG/6mbycRR+vgtPI03Clks2XAAyWF7J816QLdMg4Zx2U2J4/7Drkyt
	 iftKxjt9cJYmK1KYkTqRgMX7a4WxFvLGqzBmcBNWoTDHQL9dipcXm5IoCwfSbINf0xNQF
	 KmVfsRTc4mzVQX9PQ67aPBniPZgD7WTvOZ4MbxRjaFJIJk2vinvcJHT7lM7sPHIlzvTVr
	 RCj7rjoos4/LQmq1+AMpl+A2DirkJAyUtiYwa+cLkwPbIgf08J78YN31IxX7EZJsasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702662;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ze6EOFcXEpU3d6Cb1v5A2+n80G7X0r1R6lw8zooxcg4=;
	b=0nQl7orhVQjFbqWv4sU+8bKUNipCHR0zXZq7VaAKunw34wckGAfYAwO5PLEeQ5Qe3ysi
	 UjR24vxm3BPbfEkWVyNz41o/khb0eLkJBNSk/qKYKj2gBHuCXewcoev8MNpBP+iE5K4N9
	 e3cPd6hw0pU11QxQYs3Qi953NO9TVlwf0tH3EvUKsZTGMLME5CKvIVxv7xiajETN+fE0c
	 DWSpE2s5jYNzk8CxIxV0RSODJeh3BOSiXukS5EgOkzKVaIsNkcwNj0sqqaLQthmITHiEP
	 mFOq4Ki1bGw3G4qWUxotaHK/XQNnqhRoTu9Ak9Yjj3vsM7HJdjroCshuicS6l8Y3E/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lankhorst.se;
	spf=pass smtp.mailfrom=lankhorst.se;
	dkim=pass header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=lAvy7fRJ;
	arc=none smtp.remote-ip=141.105.120.124
Received: from lankhorst.se (unknown [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A98606BF97
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A98606BF97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=lAvy7fRJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
	s=default; t=1793702652;
	bh=OpaMivqe7d52iZ6lcLVckz/GCFD53etTQkNAD34bc3Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lAvy7fRJQZnPLS+Zr0eLEK2EhRjwIRQSLMqAuApIDK9LLU4oxAQCVFAnZcEApRmem
	 WEVMoGhKjBx1u6vahgm8LYOWb+UceXTsjW4YsEeQH+iTVNQYUFE0qG+WVCRjPkXhTM
	 EAyFhfcwsmsBYeXiTpWlLYjqSCGxKyp/DirExcAK1qM70CjHUA8lNWFR27ayHPU93L
	 4Gokx+rasSYRPQtITskOheVxbq1Jb881G0oIMmSb7dwc3Dgv8qdPLXxKEYmStqwi9T
	 SXKM4HEwTFt0EWRnYWcRjsU70u2kRR095CqTlQuW/8q0ObhGcam2Ft0nKgGskNWf6V
	 JLkzP8hw/4JkA==
Message-ID: <65fae402-e053-4a4f-ba55-6b5b51690eba@lankhorst.se>
Date: Tue, 3 Nov 2026 11:45:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/display: Skip initial plane allocation from
 stolen memory on RT
To: Junxiao Chang <junxiao.chang@intel.com>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20261104032732.30681-1-junxiao.chang@intel.com>
 <20261104032732.30681-2-junxiao.chang@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20261104032732.30681-2-junxiao.chang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey,

Is a single performance hit during boot allowed?
If so, this is a better solution, as it helps on !PREEMPT_RT as well:

https://patchwork.freedesktop.org/series/170759/

The first patch in that series is a better solution than unconditionally disabling
stolen memory, as I from what I understand the problem only exists when media gt is enabled.

If not, we should probably unconditionally disable stolen framebuffer all the time.

But with the series, we preserve the initial framebuffer contents and ensure a smooth
handover, even without stolen.

The warning in 2/2 is probably fine.

Kind regards,
~Maarten Lankhorst

On 11/4/26 04:27, Junxiao Chang wrote:
> CPU access to stolen memory ranges can introduce latency spikes that
> compromise real-time (RT) guarantees on PREEMPT_RT kernels.
> 
> On PREEMPT_RT configurations, bypass retrieving the initial plane's
> framebuffer from stolen memory. This forces the driver to fall back to
> standard allocations, preventing RT latency degradation at the expense
> of seamless boot display takeover.
> 
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index 0f86b73036d03..fd0e2962412dd 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -87,6 +87,12 @@ initial_plane_bo(struct xe_device *xe,
>  		struct ttm_resource_manager *stolen;
>  		u64 pte;
>  
> +		if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +			drm_dbg_kms(&xe->drm,
> +				    "Skipping FB allocation from stolen mem due to PREEMPT_RT\n");
> +			return NULL;
> +		}
> +
>  		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>  		if (!stolen) {
>  			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");

