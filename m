Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715898;
	b=TkUgvAHkCyvwj9IgzJkyQdYTMKyTWrQGLYaAG63nLboOYygUkdGU36vb9a4hzWHHKdd7
	 vD0u9BgbcShPuvsZQQCWc1t6U+m1VrGG8G0ZG1SIFM/LhyYrArdVDZukYpzH83GUBSJBU
	 lb1fDsGGpmK2puSCr5Ht6ArBrdQCf6ng4tV/akmNUCBHamtUDxIUAR3rthIRXMiUKUxF1
	 vLmEGs2TmfVOIARf+iQ+l/gp1QCJGRbk/NueFKGogpXipPi6AAsVItufnD69otGqoGIAa
	 r+jWhlT3FMyeHAYYWvH0sjXVpybgnqDMnJHYpRE2cKx1o+VM+zqIbwr5N7j3y69Aegg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4TONlcxqo54iN78pAMzbzkX6q3qNAFO1iKV1Ffm2IVw=;
	b=Xv4Fadsq5mlsooXV4084cjWHFC97S6tG2WweLd802cDQbKpjVlLfwGrg0v+Dx6biTafK
	 uGmSjwT37IP6ys63tMNerOGEuVjKjoodpkqpJCPRUYuWsPGfi74BqIQkjXgDGpPFF+nOP
	 uY+In2pgwuIaoIX1OrGY0kqJsrVnOsTB01/kTdDef/sIz5b2cRcIo348O57Wt4oGYmIXc
	 YES9RpfVAMWIpJcSJKIYeNh0NNlX1Qa/pCNWPar4pR+VhmMAyZbHjKliSX8sFLb8JhbGb
	 bTTBmmYVAGqNLa1j6b9J2rkILj+pzJfKor1UxE62cTusXfQiAa/XXyEdFKefDwBZcqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WASXR6+Q;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE0606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEE0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WASXR6+Q
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso553690a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715896; x=1794320696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4TONlcxqo54iN78pAMzbzkX6q3qNAFO1iKV1Ffm2IVw=;
        b=WASXR6+QktALwIYfvUJyNOjQf/PDBB3cfp4FNeNRntcgkgHY2WV8cpY/gy9Tky+24W
         h/Fu1zs47zL3h/6r0HU8EDrdl3bHqsLtoVKX7ZB0GiUVaTLcJzCJiZbxfbYdMHzJxUQD
         eW7ys3sawcM2gzqiimc/NvByfzXzuh/A+DU9yJSYLkrLSiDjBQE+NSkCyM+7qQOXykjq
         vuGjc8gVsM0b2SzrnRo4AaZJJ4s0p74K3DvVwe7bZNtmy7LzojLqan7rjcP9xWVsR0y1
         O83geE5VrUxa05PIonQsJudInSBSxQaXdo5gkuHjEpsx7mNmUe6+/qfv4d0HhqPS3/Yb
         a1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715896; x=1794320696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TONlcxqo54iN78pAMzbzkX6q3qNAFO1iKV1Ffm2IVw=;
        b=y41P/7DqqnLAx5ioTbLjGF+t1yiX/ToYatIhrCYrtzvKYZLrVaFSjNYlPiB31odNP5
         CbvXhV3UHudAiUatiKDO9vpyDFZ3wSsawpWvwy0r45eu6LMWC1RasGShIxyrZjyX3xiq
         Sc6FxnY9VnYGGgf3HDLJxvMHJOyzzAJf0ttSx/vMzVg0Kvk7kahE/YNID8UXbiJvz31t
         UFygl9VN5hKuzWuI3NTG+oZmCh1Xa+6eGpQ7pXR5lY8u6QELxVh1sA6L0hOrBkPBbcXl
         YtrJMoFT5HYQogm6BgOKGIBvmA9N0Lan+3aUlCkCX7wKSo6oDin1XXjCMHMRDyQ9fJYc
         RCMA==
X-Forwarded-Encrypted: i=1; AKwUvByhvLfT8TnOQKEX0sZlQIA6SwPT88pLqO0fLBnLo64waIQ7IhKnHHKe+0RTBBLWIk05Ga735zfGht8JsjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ht38+D1pXBYm/gFsqZV3k1w7vmKvt8LR1QjU0aiSjAdyhKDWY
	EzrS4qyN5S19BmZSbsaCQdRSLs4hgMj0TodLNQoyltmOPDycoVi0nE8=
X-Gm-Gg: AYBFou3jF3aCWJWBWdBHGjAkj8gzBb6Gu8Um+29LOMbCo16NfA+DvIHT9jBdXpbQiti
	rUDGGvK+b5DktBuqX0EVAufUWZ98EL0lypUDdichOyR6NJAWW1KPKrieHTTbU3SgQNCM15soB+N
	GLG78o1IQ0wS6poSky1cxwfO7gAU6e5eF71UMxN7GEbVHK5+ku/QCgZ0okuQ82IiuWXwq0SArTJ
	p94XEprj59Peu0qD03o0TO1duCsnhWxrtbTylLoGBqPyC8W5XMVJdSbV/ZG+BLoUBshlT9f0zjv
	6HTleShSzyjV8BQCo+FFY5mnChnliMznc3B6CfRVxyKY8YtrpNbcufo9UQ6gRZu6+SDRjbors/S
	eB9a5Fot+V2fei3rTeajLjuL02pbLbAI/B14sV0jY0vhCb7RfwGRaI/NoOvKBJbyxQ5v2TdrVpt
	DNFeutagfq0de/ceBJ5U+ndfy1oBSGpI1fMFI7gNHzxsRu7YAbaVV81ZfXuY6Gi3vf85UBaFEZz
	ML1T+u8Vls7GaCU4fLroCMc2NSiaeAApldLebmQkVDc+3PJ6b9TOBbZqTfPZsYeHcX15HHoom6t
	OIcOBPx3Ihf2zgeIodPq463FE/BY7CPlsYpmJdXluiNFuRu9cPNeLElXuLJxCKwTWENskjsc/yR
	Hrpgv7u0b
X-Received: by 2002:a17:906:7309:b0:c46:645f:cedd with SMTP id a640c23a62f3a-c4ca7a18e93mr1175687766b.8.1793715896002;
        Tue, 03 Nov 2026 06:24:56 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3cadbsm90903766b.50.2026.11.03.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:24:55 -0800 (PST)
Message-ID: <d4b18854-0e02-4fce-b168-d4e80035aaa8@gmail.com>
Date: Tue, 3 Nov 2026 15:24:53 +0100
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
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
 <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
 <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 2:58 PM, Rob Clark wrote:
> On Tue, Nov 3, 2026 at 3:28 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 11/2/26 8:00 PM, Rob Clark wrote:
>>> We need to move the gpu lock around a bit for the next patch.  Use
>>> scoped_guard/etc so we don't have to make the error path handling more
>>> complicated.
>>>
>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
>>>   1 file changed, 12 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
>>> index f12701e286ec..aa59b28a3392 100644
>>> --- a/drivers/gpu/drm/msm/msm_debugfs.c
>>> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
>>> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>>>        struct drm_device *dev = inode->i_private;
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct msm_gpu *gpu = priv->gpu;
>>> -     struct msm_gpu_show_priv *show_priv;
>>>        int ret;
>>>
>>>        if (!gpu || !gpu->funcs->gpu_state_get)
>>>                return -ENODEV;
>>>
>>> -     show_priv = kmalloc_obj(*show_priv);
>>> +     struct msm_gpu_show_priv *show_priv __free(kfree)
>>> +             = kmalloc_obj(*show_priv);
>>>        if (!show_priv)
>>>                return -ENOMEM;
>>>
>>> -     ret = mutex_lock_interruptible(&gpu->lock);
>>> -     if (ret)
>>> -             goto free_priv;
>>> -
>>> -     pm_runtime_get_sync(&gpu->pdev->dev);
>>> -     msm_gpu_hw_init(gpu);
>>> -     show_priv->state = gpu->funcs->gpu_state_get(gpu);
>>> -     pm_runtime_put_sync(&gpu->pdev->dev);
>>> -
>>> -     mutex_unlock(&gpu->lock);
>>> +     scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
>>> +             scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
>>> +                     msm_gpu_hw_init(gpu);
>>> +                     show_priv->state = gpu->funcs->gpu_state_get(gpu);
>>> +             }
>> My clanker tells me we can't grab the PM reference before a mutex,
>> as the recovery mechanism depends on the rpm count being appropriate
>> to let it drop it (and kill gx this way)
> Yeah, but we also can't do it in the other order, or more specifically
> disabling ifpc needs to come before gpu lock or it can deadlock with
> recovery.. but ifpc disable needs to be after runpm get.
>
> Re-working that ordering was the whole of introducing cleanup.h, to
> avoid the error path with mutex_lock_interruptible() after taking
> runpm
>
> I guess if you are hammering on debugfs while crashing the gpu, maybe
> the first recovery fails, and then a subsequent one eventually
> succeeds.
I guess it leads to a sort of deadlock scenario because the recovery 
path waits
for power to collapse, though it timeouts after one second.

After that hangcheck will have to trigger again so I guess the delay 
introduced
would be significant.

I really wish there was some better way of doing recovery that didn't 
rely on
the counbter having a known value.

>
> BR,
> -R


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

