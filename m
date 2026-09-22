Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE54F5DE1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110337; cv=none; b=nF4hK21SnkcqpOv7zlKW419pbXtACW1NUldLtpDNadrfw0O5IKqFHWsjem+4VdBaSYaeujXSpVYLX8DCZhVOrbAgRGKrGskP6OrPHRN10oKZuIoCOsluBRf9wilLO3ykIMlSuHqosMmODrq1Kq9MwLJZXICJnCFZpY6Ii1qoKpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110337; c=relaxed/simple;
	bh=3h7mHOameIoi2QgF0fHWnYb2LmLJUJCfP/tMiTq5a6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyC+DNjHcRKDpOzSE7mRlVu/xZjiYrCFkLoFZmV5ARHSKMfswsdatfsBi+3p63VMvZTsF7hrgtqoTsS69QhtnRrz1Z4mLERDMQYQyad6D8b0DKReDb17R9fn32eFYOcb6kKFCzkIkNO1ntligbgZFq3N8Jz09c3ZT7lPszHZAvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0E/YnmX; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0E/YnmX"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so42200566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790110310; x=1790715110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHGFgcODsPMbkSrmYbc3O6srVnG6fm23/lscBsfkk7o=;
        b=c0E/YnmXDXnA0W3TY21R/IkeyKdJM2PpgPM/9UWIoPip44XcT37DiRU56ajGfXQreh
         XbtA98MmU003IP6aVE4vo0e7CFyewR+OJ6jlfYpHYkyBd6EtaQIYyWn1hiueZsvbu0M8
         EXoMuH1p32WWhWL+KxL+ztT3EUV77T8v6fUfmRpjNfhwRjryLLsNB8U3ACckWJayzkCn
         tu6km0rP8tjoDF9kCDSbh8AReDVGATgSGvziAE5cjurIpws64KF6b9ezV0Br8sB8esxO
         TsLzrDM8RVugeqCt3GH3kPPLaFoCYbRrHtgMGl+cdl526gxQp0Gr8XJXS59TD1pgFWW3
         Viww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110310; x=1790715110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHGFgcODsPMbkSrmYbc3O6srVnG6fm23/lscBsfkk7o=;
        b=VztEbPARNvduuaYhFepuDt/ah1hyWzbKncQVw+eka9tD4HGW3oOgXT2lcqer+yij2F
         /9fIJrcqHYL1nCJiS3UN0MUKwYRg+gYVrohs2cP9IK3dHz5Ct/GUHEIkP9GtZoQDc+OL
         suhs7Jg3AoB/EjyC9pjdHe86+eMX1oUQm8NImnP0/nQPJvF8FrKB114UCjCm+SiWmK6l
         /O/8+CZ3WAS3MgMWqoNKrBLIfeqojEKH/2a5H8AmdvLd4zs/Pk/XiIm2HAFPsxK60oPF
         28sdig93LPrNLCWP9YY8tF4bwFmD//ypjMwGivJPu08bVzgtCqF8c/DZmPsPNYCvTRZd
         ZbGg==
X-Forwarded-Encrypted: i=1; AKwUvBzqwF9l4epfAjwtCCjXHfWIHx2AWnL5Sar0xFpX06v9Re64W3wbXjD+Nr4nWnsTTzfnj4Nu1f/dkxdR06I=@vger.kernel.org
X-Gm-Message-State: AFuF++nSUbJK7rlEaz0t7KawdooJusmSFoQfCIgrsK0mCo9V15kHDdgF
	KuFB2TUq7L4Btu9e44YR+ngwFowjcJzcBseGnttTFnSpReliebzdeOUj27ujeCqK4Z0=
X-Gm-Gg: AYBFou3tFGVG20EibKrKwDK4qfdGpXTBToUpoqhFjBQUmqEN1mwH5E3eYUDhTmvNI77
	2XUYLd5nuXYZySer34mOUjfyuFFEFIvuR2cvl9NnJLrLbIaeUXcMGJYlnZu/McmMXAftmcH90Dx
	nIPhjo+6769VGk0vIP1SMuogLDGvX7mpBFATGsYyz668NVil6j5JOXpM1x4JS0RNpioIh786f2O
	S/dCcMTer8C0JLafGLVNbtGeubSXMO4s7lqzji2yljqhlSMXKi7Ij8l1ASo/dlwLrwElorEV1uc
	8mQAfsX6HriZdZraKH6MYC3qisXkj+ioyfPeNKiTuz3SQzuqK3cEa5G/MJiJotegRIvQyR0RTOO
	Gx0uNMg83t6y7s3R6lU9xySnxksrD76kJvD9r+XfHMLnap/3PtsH5mQxTv68U9n9rOyNuPn6mTb
	nqKJ+gorzyF+sdj9q697FQxZbtnkWwJa7X+Q9sYC6Y//i/zNH7eRDn+XIamANYx6XKZXaz7eNQb
	+MLNNrfqMjP
X-Received: by 2002:a17:906:7309:b0:c26:227f:5f7 with SMTP id a640c23a62f3a-c2aae1202f3mr32384666b.46.1790110310034;
        Tue, 22 Sep 2026 13:51:50 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.71.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae61aa6bsm12294566b.30.2026.09.22.13.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 13:51:49 -0700 (PDT)
Message-ID: <1eb43e3c-268e-43a0-8eb5-b3671bc85a8a@linaro.org>
Date: Tue, 22 Sep 2026 21:51:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <xj8gcJD42EUlaYqevxWqTohqhMOfEkOw9HpA3v6Sz5tHhGNi-JzG49H7eV8bKDlC5PhXlgSllU9Vho0Ht-GW9w==@protonmail.internalid>
 <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 04:24, Wangao Wang wrote:
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>

For future reference

Drop the \n between the fixes and the Signed off
Add Cc: stable@vger.kernel.org

Please

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
