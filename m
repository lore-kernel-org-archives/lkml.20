Received: from mail-lr2-f22.google.com (mail-lr2-f22.google.com [74.125.230.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD8491588
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056962; cv=none; b=kLKl9DyyTHb4TRdLw9TQsBDjTuLB5P3mDcuc5EflUA2MB0KogRx6AG2COCdHr6pO2eWzbC/9nmeAzcK/kt9uC+EYPN+VFzDJ6DVR3M0VSLa8WiAaAuH2tJ0zTj/v02nobVFelIScuQDrpZ8hq7xxYriWsM9MA1dAl9An3PNjYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056962; c=relaxed/simple;
	bh=Eff6vCn+phLOaigmyo7edToilcvWUJjQqErcl9hd4nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7pPUrTpm2Nii+Ev2x0F9ZSZ5+2lL3TpeHUwsreOXvCkrTfN+UVdILhaBnn19IFR29r7qnpMHjfVE7fNnT1ZdaRseARtE4enUYWTuuIWJYm53Vj/RScGEyK/hsVIwvippkb3ZekMec4wGoblHAs5pWuQ6zr0N5YlEYmg87+dtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk11riSP; arc=none smtp.client-ip=74.125.230.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk11riSP"
Received: by mail-lr2-f22.google.com with SMTP id 38308e7fff4ca-3a2ff04155bso32376801fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056959; x=1790661759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xt+5g6YJ+qiwuKUi20nhfo5k0N4aMIWmvgMhNUyOULU=;
        b=Vk11riSPh7mKFD7lFKVvzHwZH/kiFGDqyUWNO7SFoNK+M5V1Bd7xdcbwpyUh5MZOTM
         WvWJxd1qRTIljOnXWf3xYVV+QYf5Lja+1cMHrHmnGPcESK3dzhJxfYKQgvbY0TtkRgWZ
         Wtw6PwZsQNR1dm3c0zF9zwaIvs1plGsPt1m5tTPUS39QN/6jhQPTCBjbxpKjvbibz/SN
         BpxCuVblN+HY9k2uxtymqf9s93eRcJH+9k0R1gI3JM+p+LzrHanw0K63OYzaa5qvvnR7
         ymDBKEglu4p+GogHyFdYtoo3wfUpztb/AxXM54ZcTxX7xZLzEU7eHdXpNfdDRou2Ck9Q
         V1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056959; x=1790661759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xt+5g6YJ+qiwuKUi20nhfo5k0N4aMIWmvgMhNUyOULU=;
        b=jv5tH52uSo+6P8UHVEaIcvPxT+ETzHXnrsLPxaRTxRtKzGsJjl2Zy+Qh7Wnq6HUbMp
         99GX3Ac+lBzjvNa8cHcAQzQ2RqxzLcDMVbFwaZgk5+R/SyUjPzT1hi/ts0rMo0vgYVym
         DCrxBpuzWlkperDG1q6BL6NWpmeAvsib/M5AYYlRSzIVZYzrmAaBFkCgXLZPgX6SDAC9
         uo7lXgTPC32gjFeX4S/bNnW1T9XJboVpNHX3EwYv3PV3uXie5zAERfBKxGx42iun/1IL
         tvhRJWkcs59bIPGansKXZWVMNmMFpV+oXGEI8jljQmrgVP2sb3AnYEvhL1NWT3+y7wG2
         5WuQ==
X-Forwarded-Encrypted: i=1; AKwUvBypc0LsO8daH+f5LaauoQrzG+m/QuztsuY5bcnjUgunySv6W/VpDRPtWXdi4Y3roAwNSO4O+sMfZOiMF9M=@vger.kernel.org
X-Gm-Message-State: AFuF++mpUkA96/hhNVEN/I0O8yTtYl0oFW7FfIMl7GroDLHdVNgm1S1J
	Nlh+I2+rhSwXSs13SY6MKihb8aZ6jyw8h9ejKnICu+y3ZjofDMaJaTVL
X-Gm-Gg: AYBFou1U76299g6i0j0tjVLwro/Y4msR2PV33ghGePryc8EEnuHbcZ9VHv9yYdvt014
	U1s4oibHWsXJsq2zo78+GlSI/PajUK9rhyzAzGYnZaohtCBFwJYY313EjtucKjmao2anrAjG05o
	38zSzqgx8RnDs6Wznc2+d7SThe/LVhlmQ1IV+G2AAKzcFO2358tL885eN7CyweWUmEMC0HlSpSd
	D2hoTKk2NP3raoujosAczWk26TXnrmV6NQLVQsoXMcR+9vsgNHcjnjQlnIllNgIrcqgPTCUFbEd
	MW8Fr/VNf1TGkeoeIwu3bgtUD97cUjAYCU+Fxy70LzM26AZqluXFmM7ipWS3p+JXGxPEkccm4Z+
	IZeSSbCemHUjdLt0TbS2534BLxPTt2IdFXO/p1cvYhKP+HaMfzsY6YwdJXgOv5MjCDAULVL18TP
	dbKoWRTW1BWxZEfZ+an7a0RwRBw8bvBAR0pqS5p5A8Q5gVw53HOAkanceju4poMrsmkFT4zDDEf
	yMMeXVnzqnEgpaXgVQLR6teiTVdGDYETj7CRvOJsSOVVM6nv2oRPZw=
X-Received: by 2002:a2e:be8a:0:b0:3a3:462f:329a with SMTP id 38308e7fff4ca-3a5fc036a4bmr29953921fa.13.1790056958392;
        Mon, 21 Sep 2026 23:02:38 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a627d6b91dsm2501451fa.25.2026.09.21.23.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:02:37 -0700 (PDT)
Message-ID: <f20e2299-4dc1-4902-b7ec-80f11cee3745@gmail.com>
Date: Tue, 22 Sep 2026 09:02:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/6] power: Extend power_on_reason.h for upcoming
 PSCRR framework
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 avaneesh.dwivedi@oss.qualcomm.com,
 Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-1-a16290003b7c@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260921-pscrr-framework-v14-1-a16290003b7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2026 20:44, Faruque Ansari wrote:
> Prepare for the introduction of the Power State Change Reason Recorder
> (PSCRR) framework by expanding the power_on_reason.h header. This
> extension includes new power-on reasons:
> - POWER_ON_REASON_OVER_CURRENT for over-current conditions.
> - POWER_ON_REASON_REGULATOR_FAILURE for regulator failures.
> - POWER_ON_REASON_OVER_TEMPERATURE for over temperature situations.
> - POWER_ON_REASON_EC_PANIC for EC panics.
> - POWER_ON_REASON_EXTERNAL for an external reset source.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> changes v12:
> - add POWER_ON_REASON_EXTERNAL
> changes v10:
> - add Reviewed-by: Sebastian Reichel ...
> changes v6:
> - add POWER_ON_REASON_EC_PANIC
> - s/POWER_ON_REASON_OVERTEMPERATURE/POWER_ON_REASON_OVER_TEMPERATURE
> (cherry picked from commit a6fb08a81864e2ed17cebba9f249af3d44e42c3f)
> ---
>   include/linux/power/power_on_reason.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/power/power_on_reason.h b/include/linux/power/power_on_reason.h
> index 95a1ec0c403c..13e61ace14f5 100644
> --- a/include/linux/power/power_on_reason.h
> +++ b/include/linux/power/power_on_reason.h
> @@ -15,5 +15,10 @@
>   #define POWER_ON_REASON_XTAL_FAIL "crystal oscillator failure"
>   #define POWER_ON_REASON_BROWN_OUT "brown-out reset"
>   #define POWER_ON_REASON_UNKNOWN "unknown reason"
> +#define POWER_ON_REASON_OVER_CURRENT "over current"
> +#define POWER_ON_REASON_REGULATOR_FAILURE "regulator failure"
> +#define POWER_ON_REASON_OVER_TEMPERATURE "over temperature"
> +#define POWER_ON_REASON_EC_PANIC "EC panic"
> +#define POWER_ON_REASON_EXTERNAL "external reset"
>   
>   #endif /* POWER_ON_REASON_H */
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
