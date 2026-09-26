Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DF43DC4AE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416141; cv=none; b=jDy0N8fMkmvOSbm9ZIwLnRK4kFGFttiEtbBPEY/JfxrNSazwTt38+uTiOOPvmifQo6mekzAg6/cEP6R74PkRPvWcPlOXREQPCFsUEG1QKfbS+gG9WVgow6aCx8V7Xmhcw+zTaScT9ebXWEZhluSpu3wRZWGdXtKiGbHHWwY+xpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416141; c=relaxed/simple;
	bh=v/V8ct7TOae2Ur01kAqamHgQFG4Ncm169q/vVbvSBT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa7hulqJx3ixStQQQboHnmOQWvn8CkKscHsAwMOY+h8UAs6U0VDRA8RI2waiJylhPJyOdilrwgF4dE5hy/SlMDqE7E/cLI/P1a/rKavCPMbUA+QeW/m5oSFQZ9klcIP3AollnVQE1YthjtGc9wBs7QSPqy3ur7WKp4X/irLNhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j28rcUog; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j28rcUog"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso2912405e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790416138; x=1791020938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/m7H+YAcykbCH5LdCzTmsHgpKE8tCQEwcEavkDXZfU=;
        b=j28rcUoghxg90ewTNM8oGB4t1Ey5IyWEHC5+vI0eHtlRwIKYaKpvdBUrIOASeCSpeN
         Z7FjHcctV1adj1RAR+hJ2W/Kmrnwf3VfQAVdQ+QpLnCug6y279C8lAsmPFeEY5b/R6/z
         ldtuG5DFskV6ebN8SjTOifEpDZXUP10wnZi6AfYINs14iZzSCjHS6yLrNc+1xHJNI+nY
         frk7QSL3EkZSHaUKatX31/7H0Oug5xCgwx77QFYAVhSGs3gFRX4tsV+mB7bKbz+G6/mu
         v6mhoKZw2D0xW8JmYJzftV5hQhUyuyYp8gsfbh5NWs70otpD4uDgs4Be4BH1Jc7bGX/D
         YH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416138; x=1791020938;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/m7H+YAcykbCH5LdCzTmsHgpKE8tCQEwcEavkDXZfU=;
        b=vh7v/qt1BfBJPYeC+7t8/vQALANomtOyZEbAvuKUvhxgktdnkneKvECSIng5ee8iXl
         IJ4ciBorALhHtDIyubl+CWoUyaBZYKCmA9q9/Yv1+uOA3SaQOH1LPPZIjiHhGAPbioKU
         2zwhmHJ7/R7Hbgo6PxOE+xjZKC/o1Pq8SKsrubBkYxqUkTW8Pn/rTNA+0rfy6tbftxu8
         gbhuJggglsMtUyKM5u1lpDBW3VQVn3/Q/AAKiFsiNUzmX3iMa1vSVTTL6Yv/Gsla8/eK
         ZaVO6KIdyhcdwycN1Hg2HbiS6Q/PmKgzJKNyC0MuwgFZ+PzuVd2Y4/ngmFgBPYCepShg
         k27g==
X-Forwarded-Encrypted: i=1; AKwUvByBBFx4sM2ENmeDOY5Hwc0sUB5Pa2f7YUKxaR973wZGCYR4c0WjGOYOR1gCDXPqZUI/yn4OJGKCd6U/0Pw=@vger.kernel.org
X-Gm-Message-State: AFuF++k5xlNTd+vrxWy62loNpaHL/HNpdYYS1Fd9FdekjNj3ZUM7BM4u
	F0xb754B8KpCR2BxcvdiSouImqRHUBUShqhfverUO7LExQmJAY6wEXzLv9VZhp2QdEo=
X-Gm-Gg: AYBFou0kihuw0h9kTxBmfnB3gIpYMbo+e0Rnn7KxyN56XETERD0etabff+ikKx7icd3
	5+JB9yefYQlux2hqZiF8kGIiNcYJxZ6nZz1TFku2MwP9zFUcq4/eZoOyT6TKydtizOY16dafupz
	4b0YCt7rpJ7ELmPb5OH9JBSFvQNtQPUHz50dl3w5b8fxAj3Vu16Uz0ueme+HUX/pvwi9EWUoqw6
	BzpsTzIdS83mLeEu8lJpGzzoPMMjCTDCpIMN/P2YFddUN8fc0LmSwBuNMdhgTCxlVk/kP0pQTYI
	2qc4wVGlnoLm8r9fOkvixx5IbYFZZ8GGQnIM5tI32JNd8jcXotvt/2E+S0TazrR3YFiyrf8g23M
	+ItqNxG+shaPFH1o/cz5pg7S2nNsmK6JeJVA2EXB7ZX+rFuq6hEUg/czfiHmDPeR7n+GIRiuonm
	2YDQpmq9wTrLIIycmfuDTQ7UwddsQvAN8g6dFbVHM4YyeHDQ6c5qHc+aIKg9NuTC7tIrKBL0MJt
	rRvxpQo5tQ=
X-Received: by 2002:a05:600c:4f42:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fe66f5ddemr180741955e9.22.1790416137942;
        Sat, 26 Sep 2026 02:48:57 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm13800799f8f.15.2026.09.26.02.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 02:48:57 -0700 (PDT)
Message-ID: <88f8d5ec-5e3d-4867-bb7e-0f242250f4dc@linaro.org>
Date: Sat, 26 Sep 2026 10:48:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] media: qcom: camss: fixes for several cameras
 behind a CSI-2 bridge
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260915121557.20910-1-hitesh@ebytelogic.com>
 <20260925114511.2228661-1-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260925114511.2228661-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2026 12:45, Hitesh Patel wrote:
> Hi all,
> 
> Patchwork has just moved all five patches of this series from Under
> Review to Superseded, but there is no newer version: v2 is the latest
> one I sent, and I have not posted a v3.
> 
> I re-checked the series against next-20260924 today:
> 
>    - git am applies all five cleanly, no fuzz and no 3-way fallback
>    - each patch builds on its own with W=1 (arm64 defconfig +
>      CONFIG_VIDEO_QCOM_CAMSS=m), so the series is bisectable
>    - checkpatch --strict is clean on all five
> 
> so as far as I can tell the series is still current. 5/5 carries
> Bryan's Reviewed-by; 1/5 to 4/5 have not been reviewed yet.
> 
> Was the state change intentional? If you would like a resend rebased on
> current media master I will send a v3 right away; otherwise, could the
> patches be put back to Under Review so they stay in the queue?
> 
> Thanks,
> Hitesh

OK, sending a series as a response to an existing series is not clear 
what is the intent - particularly when the other series about 
multi-stream had inline patch responses to Gjorgi's patches.

If you intend for this to be evalulated as a series, send it as a series 
not as a response to an existing series.

Too confusing.

---
bod
