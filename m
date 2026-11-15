Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794778152;
	b=In3LbiMZDw07ZIRuAwvQE3ipCVgxyWscl/GuGdFHlvhY3AZ62Mr6bCPtCBNE5kdBAQVV
	 RWaEgzVxnE5LfknGKjMmqufjTGieX5uWLuWuPIKyBsj9d1SMXb+ZPYEPU2etf4HrKa5vt
	 oIOakqA9z4VaVl+1iSUhpOB/xHI+IgT87VSVMvfVp7QfePs5NHRy7kNaT1vBYvrFmNHhZ
	 u5C0utSJ1lUvYwpdleBKXGBg2Bm5e70GR+TiDxtjMpb/c2rmDIQBbdsc+5d/GLziktdwj
	 KRk0iX2gs1D+tH54fJFjRnCTSw/6tsnxAjUtSJSpkyPdOJbievYcQeu8ez1+wvZitIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0KMb5NMrKDFmX8tPScWHInfJLWZ+dDIbMJtLLrwP3Jo=;
	b=fstf98Lx6KXv/QzV53sjubc9/Qcguuv3mJAyfiSgjinuFyPqnPn4aglLR9OhPTU5x0KN
	 hxqo7FxIq2sYbySwuhk2vk5NSxopFUiUE23jNFmTwWZ2gJVjG7YaaXPxo04blZdHiAPgO
	 NgibX67NnSSCVQUeeJYo4aNjgI4qkILQ/e6q4d2LVCPUwsp/GC8YBKjUQ4qzdyhSQHiuv
	 Fl1oCsqUPVAUMi4JOuuwCa7ALzNkKrq2U/zC7EzCnq/TtpKKRpkBlqFZQXmewUdyDMRga
	 5HMiQDJAEXS6EJ4H33FY5RMvalxAoT+XnOaXv+jIWPrkzTslSfMsXWSiCDxUPV/iNcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIOlbVLW;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952D606A338
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9952D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIOlbVLW
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so2854898a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794778151; x=1795382951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KMb5NMrKDFmX8tPScWHInfJLWZ+dDIbMJtLLrwP3Jo=;
        b=lIOlbVLW5uuuNr4X3b2qYsZRqyDUPplekMFVEq04kUcDGVTlYC5c/p2vlUSAnglBSj
         S/spiNFJw5jKqRXh7e7Cv6UuneoxdAxVxFYOkm12eN63ZcU8qmktbPtW6q32MRj3lhp1
         HdThnkNABJTVxmsgbt+oFQV1zFvK9bqk3H/EGY9hL0TqRfHvc1Pd0E9abpm2zwSBCSSe
         UlAsj3aUC2qH5oc0S7+uFa1JrDnIbG/Zs20cij7aSmSuXMhCy+q3KrmDAyVFcuj2miEy
         Srkc/QrodMGaX5Fe1sRTgh0pWdjgAFfygWuCxZDgB6014NE8XNiFCqw+ML+mAgAu/Ig7
         AAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778151; x=1795382951;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KMb5NMrKDFmX8tPScWHInfJLWZ+dDIbMJtLLrwP3Jo=;
        b=k+6xpv3kTz0Xd30CChao/+lJJ2khH726j7jowMdl22Q4TkUVlI0WmleQ4phNj4rbgX
         3hhQBHtivMYKSOxMC2Y/HF0lvhq7asccAdDEM/se10bqZST6oqXp1mKwayoc3AtYPYLq
         28UVRClg6NiZ/zx9r5XMteBHFzR/e3DajQk/n+WpyfFrx0MyZIhwfwAzuFTPVKS2ar2l
         856v+pWmxUUbzmfYNuE+2JLflvOwtF6nWyTIQ4hktGI0RXd1xq9Ww6TC81J17vXx4BpT
         hbcITq0Pp/QL59UYvMcfoAqh1Wbvlo487LFLX1DonCREMvQAyEu/1mKuocuAsXLgQe0+
         KC1w==
X-Forwarded-Encrypted: i=1; AL+hErEbtumgqJ00XzdBEOTu/tAq/3R46MlJh1mRzYZXn/LnEiYFUhRiVT5fM1YeZcI6sirzdDPgnkXBHrjkznw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zWax9EN/SmHae/fBlpC0j5tsiAqZpWc6iBr4wR8lZ2IVq3ddD
	L/SiNixDRrOHGSeRT4fAlpyk2baEzb3PQZW4bpopp4tFDLieNpM9mp5Q
X-Gm-Gg: AYBFou0MaQUbpfoKznklqjQIVwhrgF3reFe/KM63HzwIK9nbyoOpwwgIqdrLkC3Uy/s
	Ym+YdZk1I7J5lS3GKyZ4Ly9Tzdl4ND1VlQ+3co53/xtj0vju/kTaS/YGscr04+vCT0wjkqOx4L/
	nU61MQkVFFvmLUlbWXmP69Upow6mTCoARRahzqw6KQ4zGceLbZzACxit1BVqYEFmIhPRl8J0MPH
	7pQL5iXhCS/6b+ptYW9RFXfbpY9AbLB2PBDeXGrA7jl/TcmlfBn9SBEzKbd1RUdNQU1680aUVTk
	0KCdfjtvOOBMfuHBqN4YPVLOEk5A4iIE98HfsXPGkAfmFoHbrj+/G7P6RA76RBRkcsT1QDAlow5
	9Er5q4xS4tsgdPylcVb6bD2yOkzkI7EyH8IOm7FXbOZdu5EVSk2Gh3aIyyEpzLPBcja0BYijuVY
	ZqnjrsxiR/YGCrAWsDcyFDozTPOFq14QpOiyz2WrvKWxcNcd7bevxEJynVhMHak6F8+dNHMVKUg
	kOFnDUF4p6/Gg1qq94VsRk30Cne4ZNZAuMU1Uyv2l3mk1fU/iij5nur41+AdFxxmUf5ilmG50Po
	GPMWGv7naT49gNp41wV/iAEhJFZK20bWk3RTdQ7KwRTB6cmdF1F6z/bzdqALvR3gwKQr
X-Received: by 2002:a17:90b:2d85:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b1b0ca53bdmr8704447a91.37.1794778150825;
        Sun, 15 Nov 2026 13:29:10 -0800 (PST)
Received: from [192.168.35.214] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm18846067a91.9.2026.11.15.13.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:29:10 -0800 (PST)
Message-ID: <d8ba1575-f5b3-4794-8b63-f139897074e0@gmail.com>
Date: Mon, 16 Nov 2026 06:29:07 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2] PM / devfreq: userspace: Fix memory leak in
 userspace_init()
Content-Language: ko
To: Malaya Kumar Rout <malayarout91@gmail.com>, zhanjie9@hisilicon.com,
 linux-pm@vger.kernel.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, kant@allwinnertech.com
Cc: skhan@linuxfoundation.org, me@brighamcampbell.com,
 linux-kernel@vger.kernel.org
References: <511c7f13-3344-44bf-a960-044fc2401789@hisilicon.com>
 <20260729133523.357383-1-malayarout91@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260729133523.357383-1-malayarout91@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/2026 10:35 PM, Malaya Kumar Rout wrote:
> Fix a memory leak in the userspace_init() function where allocated
> memory is not freed when sysfs_create_group() fails.
> 
> When sysfs_create_group() fails, the function returns without freeing
> the memory allocated for 'data', leading to a memory leak. This patch
> adds proper error handling to free the allocated memory and reset
> governor_data to NULL on failure.
> 
> v2:
> - Removed redundant 'out:' goto label and returned -ENOMEM directly
>   on allocation failure.
> 
> Fixes: 5fdded844892 ("PM/devfreq: governor: Add a private governor_data for governor")
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
> ---
>  drivers/devfreq/governor_userspace.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 3906ebedbae8..8211aadb81f0 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -89,15 +89,18 @@ static int userspace_init(struct devfreq *devfreq)
>  	int err = 0;
>  	struct userspace_data *data = kzalloc_obj(struct userspace_data);
>  
> -	if (!data) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> +	if (!data)
> +		return -ENOMEM;
> +
>  	data->valid = false;
>  	devfreq->governor_data = data;
>  
>  	err = sysfs_create_group(&devfreq->dev.kobj, &dev_attr_group);
> -out:
> +	if (err) {
> +		kfree(data);
> +		devfreq->governor_data = NULL;
> +	}
> +
>  	return err;
>  }
>  

Applied it.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
