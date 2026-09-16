Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5585AA673
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577598; cv=none; b=juEINtuYovKbzA72WtN75wRNTfgQ8OJanN5Lgppij6XzdbE0GgJ1DbzlwczVIagi8ekMyZX5+lCHmq2Ut+SxeAEpOYXB2SVqbhY3ArBL66tLWkcL6HTSD1qudek9E9EGfZcjQ9ILJ1HjoGP5Ikp+57TYb5FqjML9tlq65xvUpQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577598; c=relaxed/simple;
	bh=YkK6RJEJPunD8g8tcyzACJifZmbP0xrMRJxM/ELtzTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QS3CYD7OXUy4rcZYlWme7ZL+3WPdH9JxmVggebylitbAEl+A8zbTnDbOAJvBEADZB3DIz+hQK0nRb8H8Lf8qEKyB5rIKYQzM/UmkuAch/J8uNALX1T6NJxQEU2LcEL8ne7bBUkJQCu6mYzNgADHyGIRoZsYm8OWGo8tJj0/Zvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBhNrtoV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBhNrtoV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so887909a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577585; x=1790182385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=;
        b=gBhNrtoVx8lRC7+z4PbrlBJCws988YibryeVyWl+ZnuXKEJk+0/PfLMZJW+DnH9mwI
         W/cYmYik0ifMZyt8Xz5zWT5ktIXpkR9xEJg/0L837pyxDluDYb7+qUN4Co50i0luf3ul
         fRDevmfutC3d9kYBSfJb+8+zr+VMMikihb+vFQ4hNCx6Kxi3eYk0PDqsNGCAc8vQE9A2
         39UbBhljcq6tvjxPOV5rC07IDODjYdyUYlLxM0IbzjJF3ZhuREC2jT/4SyCeBhFHGkLV
         enSR8LUTt4EOXUyJTbXyyRvBJOeErUFkO6qBtWRx/1ThntF+bRjKHIEh8wMF2y33yEuM
         5r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577585; x=1790182385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=;
        b=CQ07zEW6JlZbAZd96bWR9EUB7J18IG6dXrP7krOAPAd1NMG+/Z8KbIcefQuHQ0txnI
         WJRwoulbfAY8962ybT5IxImnnO4ueasJTreCx1YOV76UAyxDBBd9B33GJibgc2TIqTHZ
         4FWM+g7SFPre+q5KH/+gYQeo1Nqa2AN4jaooRmb+QIYmihBvLc8iz3a6MvEDzBlyeuGb
         IrPO0DEXVStZW0Rm3GKRsg4nEKH5iG2aH5FrlBcsn/QzMr+FHn9VIk8ubF2jSKVz4K62
         3DLB6QmZHQSV027zGBUUM1VR9ANRKHxGE7o2c9z2/xvg7G9N1EqS9pfY9eVLJH4AfTnN
         Vkww==
X-Forwarded-Encrypted: i=1; AKwUvBy1S+FPVXXSEaAfyKPp8CdgTJsGUhfwbhQ259PdE1uNY1aCEO//3xEVQ9XlC1Eal5eRQctFE4TzXIdwm0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mSuN/jtKaBnfc6HleOUqz+FJMQkx4JjhGMWto9RVzBWDL2Yhpf
	gzcFEIR+23D6LeU2o7OXaCOagn5LhA2eLgWRfkaradm9rkeG7Kg59bj/WwOGE56H
X-Gm-Gg: AYBFou0YrXXmA/TzcYeb0GveOyhxcG96BGbdShQgmFtzFQbuVAhgRUr4cImETopP2K8
	9HfcFxQTn7ORz/2MFOeqAhg7U2hemh9QYZ0rylw/RqXEvuBuB4Gvp4A2TSUM7qculxF1Gk5vZWa
	cRUi/xEpdx95gZdkg3kNyXlGhJhzK3K27GG7+o+d8KZXnM2JQnmCz4nLyDFmrk16sjlKhxYU5bO
	K/+aqUs760A78Iustd2JWJfTAVPNt9HXm25xVqMqP2gWhiC5VBxaNGppVffeHOLzQMvo70g0j46
	+abqtPSYtPdI/6lsGd9s8z7p9p+EYJpRnwO70YAPSe/07+J2V7JzF7Q/jSlJXy9m9rXCPd376Bi
	YnlArkCaIxDabvCDFOO/Kq+NHFsYCMIycYMAPJrfhssbpJdCE7MoA8Tgyj2jS2PLi7xiSxv0f6X
	KctV3JIz8/vkBsA2s1kvHBevL8pebVgQop4o73fT5gq1gtQlvUie2jcdQ1TGYsDqMKGtKPMmEen
	jWDm828vqjN4M5UYOj9xHpY/ZJOaSddelRqUNGFuhp17bqqZygK9fzUFa28
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr7684849a91.3.1789577584902;
        Wed, 16 Sep 2026 09:53:04 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c2c5d86sm2168471a91.4.2026.09.16.09.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:53:04 -0700 (PDT)
Message-ID: <7d7f33ee-1f07-4170-9d0b-cf5d986ab19b@gmail.com>
Date: Wed, 16 Sep 2026 22:22:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] cpuidle: psci: Move initialization a bit earlier
 in the boot sequence
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
 <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14-09-2026 20:31, Ulf Hansson wrote:
> When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
> it's of great benefit to attach the CPU devices to their CPU PM domains as
> soon as possible, as other non-CPU devices sharing the same PM domains
> depends on it to allow their devices to be probed.
> 
> Let's therefore move to a subsys_initcall, which should be soon enough
> after the cpuidle-psci-domain have initialized the PM domain topology.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---


Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> 
> Changes in v4:
> 	- None.
> Changes in v3:
> 	- None.
> Changes in v2:
> 	- New patch.
> 
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index b250d0dde760..0187d6a9096a 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
>  
>  	return 0;
>  }
> -device_initcall(psci_idle_init);
> +subsys_initcall(psci_idle_init);

