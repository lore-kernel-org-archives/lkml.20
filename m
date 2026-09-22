Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F29529408
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068333; cv=none; b=Y7xyDzCanaobjhs6xEc1wT3WYsXj2W8vVB6I05W1heTIbGwx6AzzyE69o3iecx35xnnTPkg6sZ1+9Sftu1CZkT+IUeRqHjZ8zJIkhzL10dn/aH6ZwadsN/MRG4WSfmG8omGndlquS+S9eulV+ok1EBVe8IhhEpevWkitzad8raY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068333; c=relaxed/simple;
	bh=fQgPBD9Kek9DVD06+pbQVN0+3t7b55JwSdnBbCBPOqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+vViu5bAsWalauni8w2xc+k0pUkc6FDkwqCJ1b3CiNhkdtSvVFHoATpc1PHjyxtU3GrEzbmYVVOl5aX7pyG9i8Vqz9ZoQijTmTZsIRZrsC4xNc+81SljxucBdD35zvEo5P3sS8oPTASfehYTaUWkaEH46YK+nXMfMbIz6NcVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4j9lA3g; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4j9lA3g"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so3464785e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068327; x=1790673127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDbclgIWO4R8bDcAGU87sYhseS50l+4Py8e7acKbvhM=;
        b=E4j9lA3g9VPS++0abWvJpBp0IoJMXr0rOF0+gYV3lm2L5K+o6m5tw6nHr+RfgRVbWv
         BpWsyxOfl9eDvlbWWmbh/bsO5L6kf9yQUyV2IOx8KPVKZQgKStJmMptaNRitzsaUQhnk
         NHXMUJPdQoNWy6PXT1aJfXTATeIiYKFmWUT6iDjQWincbnWhQKVHh+XPiiwE9k82Jnef
         pwV0DgWEqUHU4qKs6lDmCoI4nUj6nn7dbphI9k0JO7vxlBzyzNCipQa5+sm8RPN23e1Y
         ZLUzxLhyAXUm4OLAXOj5uTvTfnrItiJd+U8Kn5KCflv/n5LWw1OnaQeAvrM+6rSTEuSA
         EGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068327; x=1790673127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDbclgIWO4R8bDcAGU87sYhseS50l+4Py8e7acKbvhM=;
        b=UAKVvSebi+aN7fApklcTaM/W+FvimuNoLn1H44xqUGgCTpf5JdLZcgICPlxsTt0lCy
         pUgiOfXi+QWoX4XqqFljW0Az5dxplGRo+g/dnWuSamct3PVE84hZ0g9uvgZdVXR9Aaid
         y8xLMRn2P21CF6y+xLuTYxfMFVWRwArZoikGFChQ6LdzrjVVbbXxEtB+SzQpNByF/tp2
         mpfzdQtlo8bF3QKqtTNh3qMtTsW9iv3AK7mUnRNK/5jEdiMAF7GGwrH5T3IIx3IXtsxF
         gxWX8zGnogdbC3s6y6j1h+nHqAFh01s7nV0CRdIXTTH9eJwIWNkPy5xonj0vNPCasOYd
         adaw==
X-Forwarded-Encrypted: i=1; AKwUvBxCc5zsOWJ4FW4nQwPr975tibzP7/uniSKpVuR5lPJRkKV1hUK2v50dyHGEUE15iiC5BNn7uAGWZxZSNZk=@vger.kernel.org
X-Gm-Message-State: AFuF++kAntVAow4jDZ2k+o+u53thk4sN0C+ekekL9RDi4KlAA2UAMhQM
	clPI8KqaWp89az5AtTT9emjzyFfNoiYmM+xk2rIq+LygCEuvSfHn9SXt
X-Gm-Gg: AYBFou33PjrC/HOVIpJM3gjSAwdbRKU2scbXQVynHm/ywXtzQ94TbXNKGl2NmHLce23
	yMs7/0Xfgaxe05CO3aOinYwfrkDSWO3c97ojxsdDOx251FXsZwvsYSoWtBkOeYoAwCVIVw30moX
	xe/Uxz0tDu72t/VKdIpRqQY2mzon4hzVW385XzggWmiPOq5D3U6ERP1kXUsjp3FEXSy7wTEWixj
	Ooo8iq8zjzfqlBOvwEHQv+k9ygxyDjZkN65a5JAl+MUq5aCaz7RrQE4MC+Yh3SjFKr4ZNztTwth
	/l5dsvXrlmj10jU7RNWe3j/s7yB0dXUfvt2vrz2gWi8d/R0BqHAeCvtcfyehOuqUAS1gMO8ZREa
	rSr685lAtYLD9a5yp1smoeALcXeqDrirQGUbAdr+vwqal4AjlkxmADHa0ajp2AILxwbxOESeCyg
	l4BVF3UubeV8iryy4z7g8HJAXn7e1gopezBSOOE0kcnroHbkK/F7yuXOIVN7QGWVwdRNowPwi1+
	BlEnVS6sVvIOJoZ3M4fauf92mI0ViiU/1og6sw4iJhVu1ZthKYrkPE=
X-Received: by 2002:a05:6512:3ca0:b0:5b6:423:9fa7 with SMTP id 2adb3069b0e04-5b8c1845600mr4360136e87.31.1790068326297;
        Tue, 22 Sep 2026 02:12:06 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d1e0esm317726e87.20.2026.09.22.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:12:05 -0700 (PDT)
Message-ID: <822bdb90-185d-4b2c-962e-5f487c112b27@gmail.com>
Date: Tue, 22 Sep 2026 12:12:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/6] Documentation: Add sysfs documentation for PSCRR
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
 Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-6-a16290003b7c@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260921-pscrr-framework-v14-6-a16290003b7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2026 20:44, Faruque Ansari wrote:
> Document the Power State Change Reasons Recording (PSCRR) sysfs interface
> under /sys/kernel/pscrr/: the per-provider directories and their name,
> device, reason, caps, supported_reasons and record_policy attributes,
> including the stable reason token values.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

Good stuff.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
