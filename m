Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DAD30E0F2;
	Sat,  3 Oct 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066167; cv=none; b=bVkns3XQRRSuF9yvkWUNCLC+aY8nwQ5IyvmwZtsB26bhXvSlddMz8HIt9XvyljwNbxv9LH/xO3eGzOZ0iZJDN6YtCcF49bO4a4YcR72CA6e64bK34WEa43o6D41CbXPwwdM/l+oVaaAjy8TalbcCpoq+Z/dMtfeml4jX9Y+Y33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066167; c=relaxed/simple;
	bh=oQF33sKvx1DFkJSokFCPDl6x2PDMP1sCQeVLd8jxR2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0Ao4NjLzUpdXt0VoZCMId7Bae3B8rH8V4gSWZNJHsvE1PnxjLk5R8VA5QWAvDVT2FGwVqNC5rtDpnA2XT5CDOyFQATJUhCLd+SLCrsz9/WXuETwyNYm+vxiG8eoN5Mu5zjnnKHayBKfzLokFh/CQN+pbTi/3yg2neVaWABUu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ivhz0IuQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sn0dHIzp; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ivhz0IuQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sn0dHIzp"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1791066150; bh=4RZK44GDmw2eYm7LjnqS0sK
	5640JPz8sEdBiZ0JUaVk=; b=Ivhz0IuQpZfq5GPRZ6mVZlJrOmjuKi1aF3+8HyG5voymmzr47F
	6cVz/GTZ6KGCTS17LrZMGczKf8QdwVrcDPkck4UuykOdTcWD4IW3sW8LKoWwvdErbWJz12E9Hip
	KoyGQNgOxDEzLouVkI8vyzZ3eQqp2kIUYDwukB92xPKuSbjio5Il5BIBRZA1y5o+gBCMDLz4hgZ
	r8dMSooo1HqBENw0ZYyASgkICZBEkdd39L59lAkCNJ2LJsuKDPpOzCvzaUElg9VCT+2NniVgs1V
	g3PPayNi2FHTiNO3rvgphIIrxxjeNMVUriPiB+CfGrEr94yETEeAS1yxR78X9ITGMLA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1791066150; bh=4RZK44GDmw2eYm7LjnqS0sK
	5640JPz8sEdBiZ0JUaVk=; b=sn0dHIzpl1+93+C9hNoPXhnYjd1HzqfZ9Ffoo2J7Pws2x+qoY3
	hY/KX57fzUNmNv+AzYLfpTC6IYXj2UXwc9AA==;
Message-ID: <a270c442-68ce-44a5-83bf-cd83ee68d138@mainlining.org>
Date: Sun, 4 Oct 2026 01:22:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/a5xx: Add hangcheck progress detection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, akhilpo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 jesszhan0024@gmail.com, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, marijn.suijten@somainline.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch
References: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
 <41bbbfda-de3c-4ecd-87f5-cc784fd6483a@mainlining.org>
 <ffjwlr4kc4rxb5rktabvuplrz4kh4zrpki7ctz6mrkdtyjvk5f@r4easyboav2s>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <ffjwlr4kc4rxb5rktabvuplrz4kh4zrpki7ctz6mrkdtyjvk5f@r4easyboav2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


04.10.2026 01:20, Dmitry Baryshkov wrote:
> On Sun, Oct 04, 2026 at 12:15:42AM +0300, Nickolay Goppen wrote:
>> Didn't solved hangs on sdm660, but I think that it isn't related to this.
>> However I've managed to get a command stream from hang_rd. How can I share
>> it?
> Open an issue at https://gitlab.freedesktop.org/mesa/mesa, tag robclark
> and lumag. Please note that for sdm660 you really need the patch at [1].

I've applied this patch, but I haven't triggered a fault to test it.

Got it, Will open an issue about it.

> There are also several known issues which affect SDM660, but they are
> mostly on the userspace side. I hope to submit and fix them one by one
> (e.g. on that chip there is an issue with the blitter programming).
>
>
> [1] https://patchwork.freedesktop.org/series/174541/
>
-- 
Best regards,
Nickolay

