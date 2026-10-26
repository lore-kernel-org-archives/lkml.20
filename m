Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056522;
	b=axs70BX2A4p9RVw7/tnLdAUNc2SQ9Z9u8/7UBsA18BK/c3R/7Qqjjdo7svQW0tDX94AE
	 x7/i+xvtx8XFZPUKYs2mjcZxpsQiST/aYOOfKhrHcJi4fgDX6iEB7Oh+uBKcpkSp4MyDL
	 A9tNPSclbNwXaxAAQOnhQ8sAj+x/2iNu0jIPkVAOfj0CnGgbw6j5+7f8bWA1KhRKrffnn
	 LLpeGibftAxlvoHfAiOz1EE9jJHRUsOZdJCzIIVQd2d1fw36OmMjati3zyGvjvx4nyHEp
	 myYsiWVq2+O1vGiBbOAIw/cuCYleDsfsZeLEPQjZqd1LTdn4dMYw0yDMdY2OzoTTVBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056522;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+DHdAyNizA7TjiMqewTGxuz3iGliKiTpW9uFJ0Zu3bk=;
	b=Aclly274pquSEA83vihxMZp9UBttn7YCr20ygcF6hjG3v0BdO4+qKlwtlskSTO3gCATf
	 InjNtosgrkwMrkkjPo3mgCgqmr+iajshO4uUnv1rm6BMCYLH6PbcD1/DYFAVdFBMgpYyh
	 9x8LYaHQsRk/nSEa0VZLo5sQBxiI7i4N2auhkrnKSMeCMVN6XnzPENQ1tDRkblrkNheI/
	 27+OfJCMaOUGsYjElprfowPDz2kAw8rCSDpPjuA9FhKDtVPLQqDYO+yE5ZVet/hRE5uAs
	 EKCC7sFwKCr1atGVaS10ZyGvCke+xIfzFZ1LO0kcCYCgDwFUb+BvnP7vQ+SOT2DVZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=u0XoBYa3;
	arc=none smtp.remote-ip=91.218.175.169
Received: from mta0.migadu.com (out-169.mta0.migadu.com [91.218.175.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8ED606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8ED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=u0XoBYa3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5+C9eGmNHsPXaGlsuMgVqJCe2uE/aRlsxhqFVlOWH7I=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793056519; v=1; x=1793661319;
 b=u0XoBYa3aA61he84UmWCUH+fuKXAUYCkxz6gOmRJjFqjx6K9hZN+QHn3vdSyQLSluMTw2YDI
 2Lw7+LMtTdt5KOLheTyc50v6x7qOlxcBEHAlNyzDvQoqqdxEwyRt803YjRGg0ueAjpa8lIjHVx5
 EttuDLWg4marQvmlRChO7eWNfEemUnKnUPb+TlXku7w93FHKbOlXAaqGnbmvZ//SPNjLAjql4Qg
 lDMPkuFobL1j/D9KoeG4LmkeZe/MfBspbuShmTTYdFyCFFvPD95mvFbfJtI5dxW8kI0n9RIqNJE
 /t4r7vaypgDjeXuomQ/4xkWMYDyV8yC+s/fRddOMdhV9Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05c349e6dd1b2b4b;
	Mon, 26 Oct 2026 23:15:15 +0000
X-Mizu-Trace-ID: 05c349e6dd1b2b4b
X-Migadu-Flow: FLOW_OUT
Message-ID: <cb719558-3f7e-4332-beff-b81fa31cb73d@packett.cool>
Date: Mon, 26 Oct 2026 20:15:10 -0300
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
Subject: Re: [PATCH v2 5/6] drm/msm: force mode_changed on color_mgmt_changed,
 not just ctm
To: Xi Zhang <xz.ca.cn@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
 <20261026-msm-dpu-res-clean-v2-5-3d864435186e@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261026-msm-dpu-res-clean-v2-5-3d864435186e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 5:25 PM, Xi Zhang wrote:
> dpu_crtc_atomic_check calls dpu_crtc_assign_resources when
> color_mgmt_changed is set, which is unsafe outside of full modeset.
>
> Set allow_modeset and mode_changed when color_mgmt_changed is set,
> not just when ctm is changed.
>
> Also would fix
> commit 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
> which was reverted.
>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/work_items/102
>
> Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index a8babf1dbe0d..6f0f30b0728a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -195,8 +195,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
>   	 */
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
>   				      new_crtc_state, i) {
> -		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
> -		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
> +		if (new_crtc_state->color_mgmt_changed) {
>   			new_crtc_state->mode_changed = true;
>   			state->allow_modeset = true;
>   		}

This is also handled by patch 9 "drm/msm/dpu: only reassign resources 
when the encoder is reprogrammed" of the smmu fault series:

https://lore.kernel.org/all/20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com/


Thanks,
~val

