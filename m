Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763535;
	b=1TqU4NdUziDTVTaL8nGYe3b2iodvXKqTAzHGgEbKHRGq7gsTvvb+QNrZY1sh3dETNugC
	 wSzRNxnFCoQr1XoiHSq4dSiBFd3sfysUiV9zGs5XaqxenfKE3fri4K+disOTKi6Qy3CBa
	 3uu4fLA2kyv78GycdvTzqqNQmHhRDyVLl+0ucq5fU0YsYgnZR2hWdcQfAsp78XMgMEWpj
	 RpIowIpeKKiFgwy6aP02KSpR4oIwsrOhk7iCQl2k03EUw3s3GluBgpS80Y/MFUYzFxfgW
	 3MfHF6p5VmvqNk3vemhW8B5wHoccQZojDAowLoEOh1Wh7HDFzHoOdCgk83OhEL7o5xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=rvyyEItMjhpjcCiR5G2iyawMRAc8IGNvunoyBM1eU1k=;
	b=nep7k72tx6c3Fx0BA0X8gPjGUgy+EW/tTQ4pibqNueQ7BIPD258fLHWT7XTODbdDo50V
	 9NlH/X/LI5r+3c1sVLTYxB1ZcpMGSJyEhJ38lxvJa51p6P0BYukWDTc9OzwATz5bOEW24
	 lK9YBYTztIys7y5ZzdxRvWfemN3tDkh/PN8qUWaC3jQgP3ltJk5ycNvy4x/9Uy2fqMLQz
	 AIsQ/F4f1qQJvLtl4zbt26QTB7kmWH9xlCm4js9BmlcDYfxQVIpV/PmLRQu6opdrcuAqX
	 Jjy5oR5uNX501fiXB6MJHF+fuj7QKYb0OegFQSaDQTBMnaRddcE3UMbRR4bRVcDNLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IMnGGHbZ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298C606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2298C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IMnGGHbZ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36c9a93a1abso167071eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763534; x=1794368334; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvyyEItMjhpjcCiR5G2iyawMRAc8IGNvunoyBM1eU1k=;
        b=IMnGGHbZfzS4ZMXl77G8FzBSzJN04aU4eLBtXEhq2+SM14tDfaYWKhh4FUKDjtRN1m
         8pUDfwsP/9AEG+JbxPf7bWMErkI8kLMWHa6yJqshjWAjwwoOkWajG5XMDxrXrs1xbF3r
         dgcH9WRjJ+Ls85cyHl8GjtuQw+we8F0IOvFL67s/MVpuRJ5Tq7QwYJ6GWKzGTYYBrnh2
         QpL+mk1HCYGFhnhPXf3sPUWhs/FbqLyVStAk4oGTEyfH2DMGI7KrFY4BHXscStSUB5P5
         2sFhgObS9Qru4z9ZkapYnlJo1FaEmHXb36SAUivo6oEGOWOrIB/vE0HVinok4jg5WfXW
         62vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763534; x=1794368334;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rvyyEItMjhpjcCiR5G2iyawMRAc8IGNvunoyBM1eU1k=;
        b=I7Q9iYHvv7b6cLTg8qyO97adtIkBa7KbVqpyW8hcUrb/jnh7cQixazvMZ4f/bccpuD
         ikS6SLJv2l12I4knqUqafBe9zbXjAl/tiRjQtw6dZ3yWxC7hnDCUylzyBMTKqt81soRI
         38d8T3oxj9lOfsHT+YvOiqUm7sEbfA5zd1vsPt9ZGvzjnJIbAVHaExRbZ+9ZQ+/6pgw6
         kBqJB+IPZZ+KPdBvxVx+mpGOkHoKgQyb2sM3mU/OAXIUOVQvRmK2JfciQazHkffHK8MB
         SItuqRdBp9Rg9IwtpTpF0KE83W1K3lZO2XKyrnujwmrEb1QFKa+/3kVC4Aozt1VCwX9u
         UKAQ==
X-Forwarded-Encrypted: i=1; AKwUvBybOloSvwRHpJQ3haiwiOhFu8NMql1rMuzDS1KbtS5Qx+3ey5LK/53nn5dA8ZMGRDgBhIuqlYUq6GOPCY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kmuLKMpq0QWvC0HmJYF11HMSGdrFTh02VZ6RMOogC0K+izcn9
	G0FnGKKD2H2+apn4EwxIqUmi10NhNxVYjKGfjfbLUTjBwbjhFVallyvO
X-Gm-Gg: AYBFou2oC0VxcsvUpuWhNvnx7+ELr4vOVMhp1AvMbLqldIs+oRdOqCdpE3wXXh8WEIX
	9W3N9g5/loK9VxOaRZ/ZYVTuBfFgC+puJEyA7AJFNNEo2rb/s38sov1kWDcMkur4B1EKrLzmDKK
	lLZUH/iNBD6BfVLMttz2fCfPrhkSZBLanjPRw8guvIBxA6cIFWCgnemT9ewoyJdDA43Ge5q02yR
	ZH1KMH037FD6jlt87dU/BqQ2F2Uunq8Zb5PvXpt5jdiU82ePZFdiefVPCiT11CCeuYxmrAQiF2D
	HI/EhF+3q0r9YknJcG46BE9hVq5mP2LYL0h03cPSOz3BcwBVUMosWmqKgMoSnqJvUYjPBkrJn7X
	Eszc9DDgStxoR7f/dKIOStyuCO97QGY8ZXxw7bDBfSOmmljiUkO4yC+fyC/rSo+NTJIH9d6oZjG
	+BIMx/EsCFFgmpHTHAZ6nuLh5qniO5oBxyd2TDOHgwRkV3oMGawyctCvRzSJz2AHWqB/3eHwppB
	tgkZhV6ODEnqt0HEece3fyDEEkn6DoKEfxDIoOnNqKh4+VWNJW0LTQAojvk/Q6z+Z+WwCaE4FUl
	xryKWuidC80PXw4hG8GDmZAxzcG0FPTwmYos9bRxtcL2zRk/pbSW/uwdGAWu6KLs7Zq/
X-Received: by 2002:a05:7300:f80e:b0:36c:98e5:a6c1 with SMTP id 5a478bee46e88-36c98e5ad0dmr4158661eec.19.1793763534132;
        Tue, 03 Nov 2026 19:38:54 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm3310812eec.24.2026.11.03.19.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:38:53 -0800 (PST)
Date: Tue, 03 Nov 2026 19:38:52 -0800
Message-ID: <8063a24bb9f75bb9096c947d8ffa7123@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: joydev - avoid signed overflow in the broken-axis correction
In-Reply-To: <20261103085514.431010-1-zhugl3@xiaopeng.com>
References: <20261103084135.426629-2-zhugl3@xiaopeng.com> <20261103085514.431010-1-zhugl3@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Guanglei,

On Tue, Nov 03, 2026 at 04:55:14PM +0800, Guanglei Zhu wrote:
> The JS_CORR_BROKEN correction multiplies two user-controlled 32-bit
> values before shifting and clamping the result:
...
> -	case JS_CORR_BROKEN:
> -		value = value > corr->coef[0] ? (value < corr->coef[1] ? 0 :
> -			((corr->coef[3] * (value - corr->coef[1])) >> 14)) :
> -			((corr->coef[2] * (value - corr->coef[0])) >> 14);
> +	case JS_CORR_BROKEN: {
> +		s64 tmp = value > corr->coef[0] ?
> +			(value < corr->coef[1] ? 0 :
> +			 (s64)corr->coef[3] * ((s64)value - corr->coef[1])) :
> +			(s64)corr->coef[2] * ((s64)value - corr->coef[0]);
> +
> +		value = clamp_t(s64, tmp >> 14, -32767, 32767);
>  		break;
> +	}

Assigning to value and breaking out of the switch causes value to be
clamped a second time at the end of joydev_correct(). Also, pre-converting
value to s64 and replacing the nested ternary with if/else statements
avoids all the explicit (s64) casts and returns 0 immediately when the
input is in the deadzone:

static int joydev_correct(int value, struct js_corr *corr)
{
	s64 v64;

	switch (corr->type) {
	case JS_CORR_NONE:
		return clamp(value, -32767, 32767);

	case JS_CORR_BROKEN:
		v64 = value;
		if (value < corr->coef[0])
			v64 = (v64 - corr->coef[0]) * corr->coef[2];
		else if (value > corr->coef[0] && value > corr->coef[1])
			v64 = (v64 - corr->coef[1]) * corr->coef[3];
		else
			return 0;

		return clamp_val(v64 >> 14, -32767, 32767);

	default:
		return 0;
	}
}

Also, please note that the kernel builds with -fno-strict-overflow, so
signed overflow is defined as two's-complement wraparound rather than
compiler undefined behavior, and please drop Fixes and Cc: stable as
this only affects synthetic coefficients passed via JSIOCSCORR.

Thanks.

-- 
Dmitry
