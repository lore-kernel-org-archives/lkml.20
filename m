Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E8389115
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366175; cv=none; b=DVGZ1gVNvYwkW/xCbezPqqAfpdO4KKi8ScH2yM06FdktJj/KN5UUSenN6BfXY6Ylgs9R14NkAVEUxOSJCBDw9O50XXzjBtah8SdyrpWnC0pvO5w2ou0jTerTg2i4pnUVsg+8KUTWwDnPQfW/AoUp834MEoPr24nJEnhLkC58qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366175; c=relaxed/simple;
	bh=9EEW6wqK3vCcJrJXLIu9tx1ZDsToy82i3iCtIcTe7G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCWJk+FG9nUr8KpwV+S99zvSFxjcTrK8oNbx93UDSpI5/7hgDEg9QqumMTqKhQwW+juCJASa51CHQE/sf1K1+ckONNTa00QoV5uIty286rHrf2QZZZ2oUxUYQODOI7GkzwJijtU8PpPazg5Q4OUzDFZotq4TnoSbPi5W/i+yr+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmvpaU0g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmvpaU0g"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so14637035e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366165; x=1791970965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VC0vk1qF745ETaUgqPassgkX/eGjXH4AoTAhMiX0mjo=;
        b=BmvpaU0gPmIGWd5lsVmCmjLm+j6BMOK7yD70PIAlidjE7ESVm4uH0MjOBJiK08Sdxm
         aWF4SJtwcs1Xf2E7HLee2Tch1zexExXvf+65wScAFYdTywHaRDAlgbk9Axf/DOgh2ljk
         HY87sH6jbqg0yjH/T82TrLwlg9hMgNQT7G2jA9+ZNFYVy5e2NJtG5s+NDsR3XDIZIDG1
         +pU0Q5Sb9cQPhIPbkFwoSJpR0meqGkPJdMXgtGOYQeFu1z2XTXsbIMv73cmWwHL1S3gd
         20p9uBdpv9yHh5TrJ3FFPYLo/GvLf977bvx3tdGIbOmyXKHcn3wCL87wdWtXDZR+zCo5
         wRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366165; x=1791970965;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VC0vk1qF745ETaUgqPassgkX/eGjXH4AoTAhMiX0mjo=;
        b=xRXCPZjttXAotaoYzUEvRlOLmYXDvT2oRG/L8wvO/onxjaeZtr4J4lRN2WR/p2DCin
         AlebqBr1zvw3qQsE6th5IP9BuqKbbi72B7JO8MBHPD8hAnNLyyRSLOaeW6kb2VsxHPKV
         lspLwG7uEb/GiGHyFfbd6R/2f1I/v/CzyAbbPGXsGcxbyWlYP/tPlAxR1ZGqkIUdiwrL
         dsCxGxmiu6rbSvyQ543C4wIVzMcavoCum/4RZW0EkuED+htNFbUg9IAsMkPEuvwQdQIF
         1S10aQPHiENIQb+ZaVpCYSLM4Mi8/c2lWR7F4rmUELlSAmn5TT9/Bkke9b5PyhwXZD3b
         CpYQ==
X-Forwarded-Encrypted: i=1; AKwUvBykNBMDACIkwlys7BH00LsllpCS+NldpodgwgwsBPBcviHluuOrthklowI56kA4xmqnitjbCO7CyFJ4mMw=@vger.kernel.org
X-Gm-Message-State: AFuF++mcoHSGLcrQ2hfJoQqREvYsVWYEBEVPe8CqYwH9F5n6HfOolHh8
	WPucnimuAqb6xkRucGLGY2rVFzA/dJELTZJGyS2BtxqOPPyuXWLnkUHnJjfFiYvyyUg=
X-Gm-Gg: AYBFou2CasiqgHAqoZcXNnYbAFTQ4i8TcYCjSyqNvwq1tVlK1Zfovq59QnxMSj+HbuX
	cGN9HopNe6DnRxgIHOB5yzE4P+u0Mx0KdVAXEYonpuIWE3AU5mKQg8EbKjt/H/qS21/Ic3/Rx1P
	o5H4tGxxDqQhGQHlBcHGamagx8J4hxgcUYMhAWYE2RjFSj8BCRXIkJil4GdmsTg69JkCu2KAuQ4
	FZYOFYkzolKunb8IDQ6VFWhTHvCP/vnGIa+YHERmVOpX+JEiMgcuGFWZCwwR3dr2BrYmEfz0Ekl
	2b3MURCdovXgt1i0iPICUBW/XpbTJqu6vKO0MUdfgUHoK3w+icyGGrdxmXhjokiZZeiTAixluxy
	l70Zdo58mc4Q7PCy2iGEtsK71Bhhk7VFLlu6Z8s61OKZN1/ytThnaBFfZS3jAGIURuYQt4px7OB
	UmCbG8rF829mnny045iatzj9i7C5OF41TCEk7/Ay7Uu50f+WbViXOUAysTnYtFNBjcWETKrJZuK
	Ivz4SiLoNRA
X-Received: by 2002:a05:600c:4693:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a180084640mr23893555e9.0.1791366164625;
        Wed, 07 Oct 2026 02:42:44 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f48ab77sm60127955e9.1.2026.10.07.02.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:42:43 -0700 (PDT)
Message-ID: <c1cd9e24-b1a2-4c30-aa99-7c0cf6f19077@linaro.org>
Date: Wed, 7 Oct 2026 11:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/45] media: qcom: camss: add common IFE subdevice core
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Add the common IFE subdevice core. It manages routed streams and
> formats. It also handles buffers, hardware pipelines, and media
> entities.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |    1 +
>   drivers/media/platform/qcom/camss/camss-ife.c | 1617 +++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   46 +
>   3 files changed, 1664 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-ife.c
So, having a new IFE along side the existing IFE is not the right direction.

Please see my series on IFE for sm8650 Lanai - which rearchitects the 
driver to stop pretending write-master index and RDI are the right thing 
to be passing about - instead reformatting the existing code around 
lines and outputs - which is what the hardware spec itself discusses.

I'm very enthusiastic about the hardware enablement piece of this drop 
but having a whole new driver inside the existing driver is a workaround 
for the technical debt.

In fact the first and most basic thing to do is address the technical 
debt and _then_ add in hardware enablement.

I'll reup that series to V1 status - and lets look then about how to 
stack your hardware stuff for 480 on top, should be 1-4 patches extra at 
most.

---
bod
