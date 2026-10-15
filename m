Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF87E56E048
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094394; cv=none; b=p9BoTvJleamwduRbTArclcBq0Djn21TOAbumHWjBpFiNfLbdoE1iQFSePZt2PzitKdoxJzbL5/sBvLzzti1JG9HWpxpZ2igb+KqkjVpG6TA/tLKhXxcz4syPD7H4TDo9D+ZD7h9dFHeSf8qeUOL7nMnRjr55tHA2rR6rjXaFYVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094394; c=relaxed/simple;
	bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4uQOtqFkGmGEv33aVxVjO9dacQsR/6r/wZso5OA71jHsw+PdrW3Tfsza6bgoejz5n5UyBcGn/CIMDnuolrK1EJYH3vME/6ZblONTIsB0wOdAgyAzNJy/WZK67K++ZwIMwy9Tpqf/JwYOp2M2GCkma0I6pQld6LAcxOLo9aCpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX5e+2oL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX5e+2oL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so53910935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792094387; x=1792699187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
        b=bX5e+2oLLGmnDT4eygYVPI+WL2vPablSu3iY745nbvNTQcTZfpyKUn2s/lE/9mNvxx
         YsnC9Qgry6IR+OHWr38KGEKYK4kbVuOszCQfQ70lcb1nmZ7PMGrmDLbN9pOj0IpHhmDF
         BUYZNR4x1vPu+/I7aQvzRwYQ8sRGeUlMEf20iO/exmXC5Py/YgMB51/Zi6irvyqCp34B
         tb6vhHr1fwrMQ3Ocyi/dk6i0L0kF/jG2S6/jETxBMmmrm6B96RdUmj6YS2V0KrwO77Ku
         t0SP1drj8qORB51cF3+mXj5Psfds433rID/RTBz4XhC5SxL68dR8Ku4QQK3YVEx415Jf
         Z3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094387; x=1792699187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
        b=Cg1Oq1n0A8K4a+7Bz6MiJCY6Yt2eBHyGy9ESyJ2OTvNG2DfXocCdLWCJUTWRBrU0K0
         z6Fkb0UdZXUhzW3QELB1BaiMQTGMGxKWeZxJnkDKh6F75t51cANViVfNtUZo3Tpcd+JM
         jVznx3jn5vdlP9k2nXyf+oSq2YPVdR6dxjfl/5kI0iJrfxi3DnEaFK7N4vnTUiyDsW73
         sfXifzMTYBkcDSTF9eFnHnpNBt165FbLJVBsv/Lr8c/Fn8UmUp8/iyGsRumHQIjjAKXj
         V3mM4SSSoXPyntf/pTsXmTDHkfKXgz+4WuuIWA7DNzpLtNHleBJInZwmramq/aJBT2B/
         PnLA==
X-Forwarded-Encrypted: i=1; AKwUvByLb8HbWFOtWG3ZDba6tJ/vB9rY3jjNlX/1QHs4yJT/KrS5MVe+9qV6RegJvstG4YkrTwNruiIzwUFIEEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoHogRXjNg2UTy4oJkx6RbLWKgQxV5cjbbSN3fvSYCPMLUvug7
	UIS44p8BAbIeof4o4MmNI+MP7VD09z/krYZUCCRmvfG4dxOKoWB4iqch
X-Gm-Gg: AYBFou2O/4Pv5omAesvC2mvR/B9+2kju9b7eeuw+5BIy0WBKijbN6H7E3Q6utW2udvp
	JKRNoqsBMIbs2K151dDYbkeR1rqz6jOH9KEOqgPyv2hc9dAwRffWCY0vFJX8AZd6W4GnbX1CxkO
	XVz00LX2Vs5Rn8OJK/zU4T0Yw6KEVuYWcmPoax5P8XO7stlhB/YkwRrDC5k9JJh7Yr7WOQfz/fv
	8myvjkSphKED8OXx1ZCsbihe6NwmSXaVdc8qsvE/jyDm1tdi/QzTRFsQr5UXyhd9OVMDuMFo8kV
	raM3XAr2c3fS2ifF2h9kOPS7dz8xHNzq04XPcHb25J5CU4En9UT/98/J2Lin5Tk+ZUFjg2XB/SI
	/xOJKXZK15IaZ0m3gnWXI2Hsl6tj6sXJCW8W4cVf/gM2SqrgEXQCmr6T5CYCPjWEROd7G2+ZuX8
	7ApTuEftVq9Oayv3BCm8I+qiLSdVXPKK14UtLQHaFFy9zVLy6nRVGF9ImrOVxiW7u+6AimwQa4W
	4n/vHARBb5g3cnbu2we/H4=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr205111165e9.26.1792094386716;
        Thu, 15 Oct 2026 12:59:46 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm202635f8f.1.2026.10.15.12.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:59:46 -0700 (PDT)
Message-ID: <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
Date: Thu, 15 Oct 2026 21:59:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Language: pl-PL, en-US
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/08/2026 22:15, Dmitry Baryshkov wrote:

> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1

Hi Dmitry,

sorry to barge in but I just wanted to let you know that I 
gave this series a try on the Motorola Moto X 2014 (victara,
MSM8974PRO-AC, PM8941 + PM8841) on top of v7.3-rc7 with the
msm8974-mainline patches and "clk: qcom: mmcc-msm8974: add
GENPD_FLAG_NO_STAY_ON".

Display (command mode panel) works through the MDP IOMMU. The GPU
works too: the Sailfish OS compositor renders on freedreno (Mesa
25.1.8) through the GPU IOMMU, and I don't see the reboot reported
on FP2. I tried 3D acceleration, and it works without issues.

Hope that helps!

Thanks,
Michał

