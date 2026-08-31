Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358BE3A545E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213858; cv=none; b=cpHKNNUpdhdgA3jYO8W9nar3TdxiN00tk8Ffo0oPgOguozCAKSA1TRN+QlzylVhqR1CD9RNHTL+N4lVSgBWZkmwKUNn2kzTjHn2ua9TlqVSLbgW2ZLsfYTwNgTugbu82cpvtJ6kA+AmwTwfwgOjcCE+DzOWJtiOcCJzql/hCFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213858; c=relaxed/simple;
	bh=q3/IZd+/JxIUPjQPoy9G/4IfyxeAweQqyqRpHrTqC6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBoAqgfmaWv4CrJBRp0VjGzbu+O6E3xVKr2aw11t3SghI6TVXSV48jdeWfif7DIbTLQ5rt5dnjtZ9giz0VzBEvu3iAQlk/dwxJTcdM7BLxFY+jaSGOGdUDPAKfABdQfNIfIDuulGpKs1DveW5jhH4KjeptJVdLDQSJNFNebN4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=XZ0+iI9N; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XZ0+iI9N"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso46413185e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788213855; x=1788818655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mooxD0aCQesBxEXQA4gtk4sJ8/K9RVjHZXiEh/ZaNBs=;
        b=XZ0+iI9NAWN32orderSIy99yITVWDYuFfyOfa5LOl6fAlyjia9MhoLMZf5wsA8+iAh
         CgPM8HusxHbzAE5ZWxu6zijw4VZFiSLm5TDGPsR0ZxZ1QKj2s750uLlpSs/8KH1FRZfA
         XZHEvSb7ODEGTayrDuh0FvGUl60dw75DSzIfxqpl31EQFSvIXSc6WJOj/heFPNSCr1Hj
         vnX+P51PMvmAtf/9BaEGzHDm5f/lVgWAgq5gxLxV47JE+3x11icrRB6V9lxekfMVt2bS
         YT1mkUC07LQ+TwGvlOqk9vwM8S2SkHw+GCyG9IUl5LlXcrRsPBQH5pY/0Gc0dNKXz5oT
         FsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213855; x=1788818655;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mooxD0aCQesBxEXQA4gtk4sJ8/K9RVjHZXiEh/ZaNBs=;
        b=coDedr+0ckSEDSqpy9LPSzOOuui4wxzznYsm6luVfTyLjE4JEhIdYeJkxlOwbNOMZu
         T9XKcPJ+y89jJ3/FFEa+vUNkpO9pvwcTL/o7hX/q+iwjoFinhrgCGLXYgrDPXWRppJEt
         VOEF0DZg1t5LA1BR55sihCMoQn+j4tUDwg+Qk32rsvZDEOAsk1rxjqcQfz32Hcy58Hp+
         D1JprjaN8DtOJxxJDp4cNbfg9C45yLCoGVQjS1cbzW9jRordsJXRYbO9iV9hn7HaUGaH
         IdyWmLivNdOs54l18zfBklL44WbpdYcydnrYm7Dn1iRBsfJJKOEgFAb6OeHnIYBuDO7W
         vFZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyB+uQm0rw25wxNm8PV6UfX0QKb6Lk3tIN7TWx5to7v6nejjn6+jSdwIkw3MiIZ5FQHdFpy58z4GybotM=@vger.kernel.org
X-Gm-Message-State: AFuF++nYue42DWLCxPA6N3Eo75KGJgro3A72BtYsCnMhptvvNNRtMPmW
	rJwcPfu+zN1JFDDiyNQzhafCQP3eylP6ojEQqgKFrEEzZ2N1UviT96g=
X-Gm-Gg: AR+sD134jwuhbBJCWHbc8Ku/TBQ7ObGBPDyMcwDuz2CWYDwT/zIPgfLjjpX3sWkQ1h3
	+ODBakyC6FwKRzzXf7i2VhoRj6IYsGNIjpHXxI6CaBIej0Av+DhXa72yQWWvvSzea75vO/zvBLE
	Lcx7lYwvZ72mCghqLsrZTkpF6UWGsyb22ECk+mPsVzjEjC42UKy98EVir1ltrWCc6FeMq6s5zgK
	c8Ul2pPccGaA9TvOKuiex9YBYdNxZkiCBwSdgBb5tcMn8X/B7n1SH/Sl+uCPjJ423G5MMT7l5+r
	3RJ/0tTOruMmp/n9KtE0q7hxBl6JfQD6ry9S9pKGwn7fW1EYHKd2A0SAYXR8Jjj8ZgjGJd9HE9D
	V6hhxZKkoendxfqjItc/tPrkJV0HiVTII94mdxscNFt4mXhaH9P9eQuouVvz4G/uglZOwUXRv0g
	bCw0Mxbq5UlJns89z+c7V8RDw5Xq3xV7h2RnTj5jw/U3Eg8iEmlZzJExxeBKLqoHbyslF1x0xR/
	c8MczxiY/0FMFX2yNnuGud0YezLW1HaAcA8Pr4MxB4rXl746g==
X-Received: by 2002:a05:600c:6207:b0:49c:d28f:2cd6 with SMTP id 5b1f17b1804b1-49cd28f2e19mr272370085e9.12.1788213854790;
        Mon, 31 Aug 2026 15:04:14 -0700 (PDT)
Received: from [192.168.1.3] (p5b057bfe.dip0.t-ipconnect.de. [91.5.123.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm21966125e9.1.2026.08.31.15.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 15:04:14 -0700 (PDT)
Message-ID: <8bbc48ab-d0bc-4deb-9018-d8c22abfcb85@googlemail.com>
Date: Tue, 1 Sep 2026 00:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 00/99] 6.12.108-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.740409777@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260831133359.740409777@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.08.2026 um 15:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.108 release.
> There are 99 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
