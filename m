Received: from mta0.migadu.com (out-221.mta0.migadu.com [91.218.175.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9553A4F4A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273881; cv=none; b=DwdT+OCzFcMkiryVFMTvxuWHXKyoo0OWT+1v1xV3gQvTekvFvb6epOB7pC6uOLa0Ze/kidxXgj6QforhmFI/afanNFvFYzkw37oVJHIJ3RMM5+DgAnPUMggDMAkj/gA0Sm18FK4nOcBahkcQhzrxrghZbO3+lT5O4vMTpD1QPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273881; c=relaxed/simple;
	bh=8AhvBjG7HuXqA4N9ExrRQYOsSpS2IM4/UU/7cUM6Thw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5ETFFu6THYxpvkDFV/DA7d6zG+NlVfIIlkBu/opn/c6j/r61RCK2JM+flANRJEd2apUjFmNG+iA3ecR9PAUzs1tFolvr7Rr03wv/P7apjSj/XinOdmapbwTHFUvCT4iVeZfNCx0LWSTkP4LBQNuA9pMZdA7v5inOflV3T3xoa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=u52TLMY9; arc=none smtp.client-ip=91.218.175.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="u52TLMY9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8AhvBjG7HuXqA4N9ExrRQYOsSpS2IM4/UU/7cUM6Thw=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792273877; v=1; x=1792878677;
 b=u52TLMY9AOh4q1pD8o6hKpo18LXx8su7DuzCH9ti6s0pvC2sxFA7P4rf6YZxFChhE9GaiRbQ
 kfuNfzBSHTMxPdZy5ojEU77z9Xq0Ymtu+bCId3m11Kp1YgrjqMRk4LhsGpnRjQMrsyYWnP+3Mhv
 r68UwQqHHPfKwOFvf6feMEuZG6Rj0AmasWB2pqH5PVOF5zp6FBHYJZtFVG6lt0nbJHYu2sBcBdT
 oGYk/zTzOg+iPIm5nPzv1K7oZ9pMlgLCTtr3rKki13TbuGmhoszZ4xo/JbiwVFjpYHHgHvIyLMM
 gaIWtVZIU+t47EcxDKdDza22xBj6BBoCtjkN+wZ1M/+Xg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c017e02178789539;
	Sat, 17 Oct 2026 21:51:16 +0000
X-Mizu-Trace-ID: c017e02178789539
X-Migadu-Flow: FLOW_OUT
Message-ID: <ce5a17da-7202-4903-8101-97f012a67055@packett.cool>
Date: Sat, 17 Oct 2026 18:51:10 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <1118d9c2-4efd-48fc-8a3e-c2cc3eddc940@packett.cool>
 <bc2ed82d-0d91-4683-b9ae-cb4299636c2e@oss.qualcomm.com>
 <20261017100324.1104-1-tvlad744@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261017100324.1104-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/17/26 7:03 AM, Vladyslav Tymoshchuk wrote:
> Hi Akhil,
>
> On Sun, 26 Jul 2026 21:35:35 +0530, Akhil P Oommen wrote:
>> I didn't get a chance to revisit this series after my vacation. I am too
>> not aware of any impact outside of those dmesg warnings. Any chance this
>> recent rpmh related fix is helping with the deep sleep instead of this
>> series:
>>
>> https://lore.kernel.org/lkml/20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com/

Update: the "deep" suspend bounce back was a red herring, it's actually 
related to EL2 timer nonsense btw.

In terms of actually reaching AOSD/CXSD states though, new community 
research has been happening recently (on hamoa laptops), and some people 
have gotten to CXSD buuuuut, with CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT=y 
(aka fw_devlink.sync_state=timeout at cmdline).

It's not good to require timeouts, there should not be any sync_state 
warnings. With QCE solved now in the "Fix crypto self-test failures" 
series, the *only* sync_state timeouts are the GMU (on gcc and gpucc) 
and CoreSight stuff (on qcom_aoss_qmp). These can, and should, be resolved!


Thanks,
~val

