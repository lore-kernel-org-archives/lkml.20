Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793919591;
	b=Eqglr/YKuhAR437eEuSxTFaA0PGfu8KDjuotbQnN+EkzN1IGK8CujK2QxefxMZwihDNB
	 zw1Ec1qinAPsXBbCAYGPFXNZd755zg8mKbGRi/mEWfiG4AMIHoQegSYBUglxzgIaQKxst
	 ustFzXmBVYFcoQPyZTA0A95bLMstVCURZSzc2xYakznlATSshhsemOhuZAH2XJNoY9VPc
	 mqCaM0lr/JfcTei+jHLnNSRsPI5LhqETa5zhQ6lSRISZu/QONn4F54cI2OoDRLRlBuA3l
	 Pvy4DCyQpdYD3Q9qCHHZJJXdKeMNC/MUDxy37qU0NrloUZIyWKDwkNAAUy7y7iFmOEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
	b=BrmTyf2I3RafPVLlVHZs5i4ukttwoUeh2oWg5L+gMYSQq0e/vL1cj0twMVxIptMcaCj7
	 /OiPZQmMNA0bK2pbI+3zjwVnMXY3wOlT9QhrY5XMHkyV0TyNwWvH6VaYZvz/CNTZgWAs/
	 EJ3jsMX6XEUtzOCcbmILGdfIPF6B7/+1ho0xWNTmLo1hXfroLeIVPorS7giE/aaw92coy
	 BQ5U1LQN+NQ6WYVV7jx//ATSLNsZXJCifTzuEqX17iT4XXuWECPKGj2WukvFYJgwxibUN
	 5t6B8WVd7zsK7cn03JiOpwXfctbyR9nJTecBfbRUlhw3ZLe6ElrEKhGnmUuR2UZEU8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWQOh8dC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB3606D806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDB3606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWQOh8dC
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so41947e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:59:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793919589; cv=none;
        d=google.com; s=arc-20260327;
        b=g3b9Drh5gUC2V/Ws3+TAo16wP8as55WQvmcnxKiHufqoIcF5toBxl9qdsD9SeQXt68
         MEjgXEdaHpQHUmwluZ4Uu4RVZnon6Ot4xZNtp7o2n77XpDuENZoVm8dy/4P0Pcoct9ZP
         37ME1rcQ+byeskBzdyNSOyO/NAETWdxnYC6ja+VhkWxf1JKCGozbZBitA6PslmqSzSEO
         1TMSPhFeOY3H2oOc4i+CipmWzvJcMWzq2NWfn7efKwO9dsuUoadUc4Vli9DyxcmUZonW
         qrFc+kLSN6EetXxpiE7c0hA6xyO3lAdKtG7Y6h5rBTP0yMGweib2405Rf98gvoekkYjz
         REcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
        fh=EsQF6GDFXviC8efKJHT/1zUJU8rMg0zVfX9IGNTd228=;
        b=Bl0+A8F22Qsov3UNrkjVQ9gV+Vn25kkarNIH/T0MZIfz8Uzxgj2P13JK/jafhq2dek
         tIBY0EItxeB7bi7jf+LMCgWRLqs/KRd+xIPI+W5ZGGocQ/pt0e9z6TWBuFxE+hlSk7E3
         JQ1FNzGsTz/b3iYE2NckjgVAHxWq7V8qMCR+AqLBL8YbHJqs3xQMCpL6+Jet053DHkVM
         Ufz36IyRWP/Jm7eVkYgQ6Hxdbe1+Bak9Xsu20BNuksgRHJ2s9vvE8urDDmhBx5yD3exX
         03AOK93iFlxjyr/DO9n3dTLGbsmGLW/nVPziXmdMrpSdtPGefXCm8+YeImP/3UsLGfcb
         Unow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919589; x=1794524389; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
        b=YWQOh8dCM8gvON6hVDpStq7yHj2s6IWgWnB/nxtN6C8wgL0M20bsbcxa9HLr0sPjc3
         /E1jD8ECQKDHCXpS6s1+ajdYlCRx4SxTio0M77qhW0SenZ9/9K5LshPugByWuu9M2mck
         sJG1cNfhn+lb80HOdE3w5CyXcHmxZZa7Cvka37UZqZa/aStW942SFOQRVDSgbufnPzLt
         MkM7TpvsiKsUkLywIaccFh1Hlf7HOqQlnxivlVVAXho3NmU4XUB1AC0Nzsbm7KYvOWwd
         +sYAQwnyhttjSWdf0pTuvRS3a+/sUgM8Al9OdAhlvYQzVVW6sw/Iv1vI2zx40RBTDGWK
         vsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919589; x=1794524389;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RrHtlwl+AEhIC5xfPPlTatk3kWQjUPqvdwoLzmNPK+8=;
        b=EtgG7V71c/IZq4H9oR7e7doI0UzgsvJWXpDxss58KpJxHLtwuOg3IUtPXNZU47hATi
         gnUOQGKsUt5jNt/V8YbBTycBDbMkt61NgkRQjrhoQd+ZepZh/Kks0LSI9Dsa6iEOxZB6
         MLDD6+HtLXGH7JAO23ojSzpwkFtHZ/dgUmPYOXgvaVgJmgvDrFHi71ezf50ldOycP/Cw
         YvMgOOjq/vc0Boi3qKXSHKnYMjSDxsOOFgcfwB6bliphlkAiCKli3LOHADLIFFxgDMbc
         g9SyP+q75kZj8oMu7/qknN2+rjiurTh0/+mCGaFddLrgzXCq0zGkySdzdOQqaURmmthZ
         s+4A==
X-Forwarded-Encrypted: i=1; AKwUvBw9fqAV3o7dJdaNhu6ZK323/TpF1uo171JKm63Xj/aOQ+WaS4XTSsC7eftobZALfiDxTMziJtISe4WhuhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HEqqtyZOL1nbK6YUYGsDHxC9601hOQzr+chvm2mA5Hk9FYLLY
	m70/T3f9Txbkcv+JztqphHNF0Cf5nVcAK3RuGkFga4fY0mx4MJv85l+cD6gQmQG0pLAXp6B9Pyw
	d7RR4bdnB8/ok1HBVV0fuU5UV9az3gqQ=
X-Gm-Gg: AYBFou2iGY0hwAXivFyfifSAJZezLwOBZuUXbxfBqyGeGF+fX/Lw1fWux76uY8/OuM6
	HOKsx5oTxlAJqpX85+ra4KE0oi8kdu9gkXWeh3RhTGM5nzIIsoJFVj95rVE4LUldkGIjaLhir31
	EJNiTQ4FhXuho5/UJnouMc+e6qlyXp9AsBYiMEpoaOAwEYgwsHh8mofFELvxlcL5rZRrSHJJ/gs
	4/AEwE4ZZmlPOBPpNbqlnJzUEZQJvt8uikGuRXJopNl1UNribgrqBQ5EXMlVYysNv+5r5Zqx/Zc
	JJKXaSK42zww3thql+g4ZW66BBgrISNhUbzVs7MxNaAmMwdtqnRW7x7zO18ZqJ66ZL4H0Z87OgI
	GhnOWV5TAh59bpsRtOoxjoXvFnoj9OPWP254jaG++ky+h6Z7g9l/ApNeMKTvZ
X-Received: by 2002:a05:6512:1192:b0:5be:4a09:cda5 with SMTP id
 2adb3069b0e04-5c003af7714mr125332e87.58.1793919589269; Thu, 05 Nov 2026
 14:59:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com> <bd3b073b-cae5-4ea8-8ed4-063db0aa5e64@oss.qualcomm.com>
In-Reply-To: <bd3b073b-cae5-4ea8-8ed4-063db0aa5e64@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Thu, 5 Nov 2026 19:59:10 -0300
X-Gm-Features: AclHuK-50e5PrDAf3J21VAWq1T9hcSqfrAmJp671654qb1dhNNUctHumFE4UGmM
Message-ID: <CANxzQdFZL0_KbNHfQ3DWyMfp-SuEyomRCdYi9tAFMkGkcoTatQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Paul Sajna <sajattack@postmarketos.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On 10/23/2026 3:29 AM, Akhil P Oommen wrote:
> On 10/20/2026 7:35 AM, Fabricio Akio via B4 Relay wrote:
>> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
>> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
>
> This is incorrect. There is no Adreno GPU where SMMU is powered by GX. I looked
> at the DT of SDM630 and I don't understand it. Seems like a creative workaround
> to vote different power domains.
>
> Please reword GX -> CX here. Adreno SMMU is powered by CX GDSC in every chipset.
> In some chipsets, the core GPU blocks are also powered via CX GDSC. So it
> makes sense to do a SW RESET in case CX didn't collapse due to a vote from the
> SMMU driver or something.

Ok, the SMMU is on CX. It is the DT that gives it GX, as Konrad also
pointed out, and v3 will say so.

The message keeps GX, though: with a test DT putting the SMMU on CX
alone and the GPU on GX, the CP lost its ring state on all 4 resumes
with the SMMU held awake; with the current DT it kept it on all 3.

So v3's first sentence becomes:

  On SDM630, SDM660 and MSM8998 the device tree attaches the GPU's GX
  power domain to its SMMU, whose own domain is CX, so GX switches off
  only once the SMMU suspends as well.

> Instead of a new API, we can just move msm_devfreq_resume() here. That will align
> with the A6xx sequence.

I take that to mean removing the call from msm_gpu_pm_resume(). That
reaches A3xx and A4xx as well, so v3 does it in a patch of its own
before this one: a4xx_pm_resume() and a new a3xx_pm_resume() wrapper
call it right after msm_gpu_pm_resume(), where it ran before, and
a5xx_pm_resume() then moves it after the reset. A2xx has no gpu_busy
callback, so it has no devfreq. I can only test on A508, so A3xx and
A4xx are untested.
