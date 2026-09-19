Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD462BDC1C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789839938; cv=none; b=RrRI3ilw+ZDZoSl0f+AFsSUq932JuoEoXCcHZF1NH6eUaI7tQW2olZMGmgN320AKR/OFaZYzLBg+GwbYkLkbhyPELHR+H3gOSHU94LUo4ExWZKHvyW/nvBhreKxcJ2EeUSja/K1kuFBosYoMh1eTo7m0nciqYWninq3IzFjgS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789839938; c=relaxed/simple;
	bh=azESh/JV6Pb2f75p0EzGHpKKs0EkaTJ3JGj8Dfwaces=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUpVWmw5xBOfrDFDWzX3QHaAA8x2Ly/FIl3+3hkywKfEYARuSS/5iHpGJaFl4gjecihc0NJNgbUU3ZoeK6gD8OxPiVT8eY19LlI2pu0S/ZG5Gp9v7mHsIa31itRfnsMrbGfFtGpOR38D75ZZs8/Iassixt2HKuS09aMWcseeFGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbtBExr5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbtBExr5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so11855465e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839935; x=1790444735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ig1f3Zcw7CjBqDjG/O5PoGpNUpdsG5zg3iVGnS62sg=;
        b=HbtBExr5JdvhLdHD9NvWMHSsNkyNZeK+yI6iOm+4Jt+ZK0xtiaiEZkuQbudzT1a4t8
         hXYmLvRlt5yIeVkD9skxsQNTKsJ0MeOworFIwul+ttNdxFiuz5/mjJITJj/0MCFK6i+u
         tT9cQ+gEcLm0OMFJuaayNd2/4gpaepwEl0VbrUz6pKIyNDZzU42cjxbKrMiUoykLVtu5
         suxoJMrleIcdZLbGrIoStLWI8WKHWmLo+lRZXHMsqHSTJdjPGZdk15WBpYuNZ7911Hb5
         5h1lMOKMI6GF/aS1x3NZze1tlIbY6Hi0khI8eHp6B2OhERkeihSTZDCzrX+FTDj5o2UT
         TgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839935; x=1790444735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Ig1f3Zcw7CjBqDjG/O5PoGpNUpdsG5zg3iVGnS62sg=;
        b=0ol7F2ZgxO9AiiqtoaG9FnSth68jUu1yp4J2qAR/Q3TFupOwUuEVJ9cIkO6k6bAZI+
         EAK5cMghxTB2HtA062hTduvJ8srX88MeO0Yn/hHT2d4/fObXvKGKc8efIy2pcsUzx2ik
         5jvEzQ25pgnBW38iFyo4MxmrF0NAMy7RmGPdkuJm47/ou9i+/Hq6UoqrcHpXzJTR0DQe
         8KalFO66s2FnYKcK63zymzfh/3s0CrrBSltkBMqdg04vw4cRgwWEcz1nZxZo9e83Geav
         4ts7OtunP2P1qncyg9ThN06zGzV+vSXrXY6DlqhYnaqa51RKWUbhkhnbbKak8aSRYkQg
         aFxw==
X-Forwarded-Encrypted: i=1; AKwUvBy48dEKJOv06suEExL6PazHkp9d05hb4G3WDvyrCLYGRTXonDmU4wl/JobXZWBgoEAB3oynhZW2FHbkDq8=@vger.kernel.org
X-Gm-Message-State: AFuF++m718fB637LgDYc217rQo7y28ugM4KOYkGABovNmd3APzNFcTlf
	/pAmNcgafPZvHTW5RTwRWbAJQglTZwi5kTuKmEYNTxzKZe3rLI4AsqrImKRz/c2l
X-Gm-Gg: AYBFou23+9IoLHL/PfvZrvwz2HB66BUehYNZmgf/hFo+uo2MlaIc/DE6PDgNxckm4Bd
	+XrAeJpMhD7EKOfdbhZ/QKtNMtBoSxSq5ptO3Rx750L88mUJsx1Fwc7Hc3NzQqDwJiy1nyipMxY
	Il7n4VBFa0dbz6mR1mAeecAmsRGgPQJca4FMUJ/+Vd2D6ZTwQdMaduuWB2jL/+rFANMqEzt/qQI
	I1WyPDEGo4e4LR4y8qoCzknQ6RbqkgRaYoJA68MNMHeeqPGA3/yJhiiKmaV70kE0zrYhaAxM/Ul
	YrZxTfMm8jlA570ay7T/01VmiP4qyXONWL+Y38/zxi/x/7GxejlVI+wdNuwVRH4bDFAe6QEsH2T
	HEz9S7f751VQjKb41rGIeL1cOzVWiHFzor2vXWCiDy+FutKx4h/KJHeAag05X0LzoakoSRhKqGh
	Qvn3MeJB5Ww7xpYfS7pI+j/2/PYuhe1itpNFC3gIv/80nat48KZvOt8ssGloZA5xPKGamUE1xc/
	mrpG/xq7ppJ08IxR5WbDfl4aV+eGnt+LhkguU6KltuuAXgAtKkEmtnjy3D0EdhMT5Aljq09DESW
	rTo=
X-Received: by 2002:a05:600c:3e06:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49fc56daf07mr87954555e9.14.1789839935057;
        Sat, 19 Sep 2026 10:45:35 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm128776225e9.3.2026.09.19.10.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 10:45:34 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <ef365f19-afd2-4704-b900-847b24540a30@gmail.com>
Date: Sat, 19 Sep 2026 18:45:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] kconfig: tests: Provide defconfig outfile for
 savedefconfig
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-2-286e5c985244@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-2-286e5c985244@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 14:38, Nicolas Schier wrote:
> Let kconfig test framework's 'savedefconfig' forward the requested
> output 'defconfig' filename to 'conf'.
> 
> The original implementation was calling 'conf' with '--savedefconfig'
> but missed the mandatory filename for the defconfig output file.
> 
> While at it, honour the 'dot_config' argument which points to the input
> config file.
> 
> Fixes: 022a4bf6b59d ("kconfig: tests: add framework for Kconfig unit testing")
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>

Reviewed-by: Julian Braha <julianbraha@gmail.com>

> ---
>  scripts/kconfig/tests/conftest.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> index e92f0cf1421a..f2ad2ac2a661 100644
> --- a/scripts/kconfig/tests/conftest.py
> +++ b/scripts/kconfig/tests/conftest.py
> @@ -240,7 +240,8 @@ class Conf:
>          dot_config: .config file for input
>          returncode: exit status of the Kconfig executable
>          """
> -        return self._run_conf('--savedefconfig', out_file='defconfig')
> +        return self._run_conf('--savedefconfig={}'.format(out_file),
> +                              dot_config=dot_config, out_file='defconfig')
>  
>      def listnewconfig(self, dot_config=None):
>          """Run listnewconfig.
> 

Nice catch!

<nitpick> out_file here isn't actually defined until later, in patch 4.
But it seems this won't actually break anything if applied alone since
this savedefconfig function currently isn't called anywhere (until your
patch 4).

- Julian Braha
