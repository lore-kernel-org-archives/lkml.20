Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338625;
	b=yNt4OXpqN5vHkLiA5puVKK2r21PPcuPWy15gZFV9mmkzZiwfFR3eTtrJLI7IvOm8ssyY
	 OSwkNr8eSiQjjwooTArqpgWuxrep6RSLLM5AkkjFr97QjYDccqJ4xVeCJLMuQqzDnRw4x
	 xJp1UpLgQIwCLkuK6XQ31oofH94PfV+Yse/1rn4gCgxTQYpRf0DspCznyqNMNCKen+7py
	 Amddvo022s9JyR8OfIuuZ4mHwzKp5DORxwmQHTKtmDYbHrGwyowhKdHA06o24SCtsRmVl
	 TPH/ItRCO7KI1QEVrN8mBaO0ZQ9K4b/788ecf17Fn33shFoNQ21t5ooWZN9LVCmqj6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VhSwB8C2Atai4f63OWY2MkRGEM/VR9CghwTRTwW7K+s=;
	b=BwbEUVofhWaFSTn0Gn6+ELJKTd+PNnU+TbyWp9lMJMTeM7YYIcxWnHk0D/56wI/eD2Pq
	 x9ATP7BQcCWDuM3tAxk+rc5aVqwSFKahmAAGdDr7zx55faLSsXCC2bCaS3aiiit0c9v2M
	 eASX+ZbsOxEzqgeqIV8MMKhrweCaqv6xGXbS5TgFez0ZN9Yt7p3pQvZ5md3y+g2FSoW2B
	 ACObaMWKc3DOLU8xL8YGtZiK2Z9MrFfEQ5VmQDMX63f8juB6HMCclSyXRzq6Z0xBI7IEi
	 IPvKYvc63Sx4Hg7N4aSmLtaoBmYpXmf28N4mZ4BeX1tGPUo9uAjxMcfNeKUncGp3fUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=metarealtyinc.ca;
	spf=pass smtp.mailfrom=metarealtyinc.ca;
	dkim=pass header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=fLEPEzDY;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC90F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=fLEPEzDY
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc53938a8fso1595632137.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc.ca; s=google; t=1794338624; x=1794943424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhSwB8C2Atai4f63OWY2MkRGEM/VR9CghwTRTwW7K+s=;
        b=fLEPEzDYbIYtk1YbU6ZmQpN6irlYIbBy0+uzUm1tcfWI8thnbfx8ctYWTRONw5iGRx
         gVXevkQWwdbO4mlY6VdPaAcs+HVyvM6rYEke+zrR2L8ush8he8JnmAEi54U7DYZH2SiJ
         B1iAmBwLBsrh8rPez3XkG3JHR+opkleBp7yBHkh3lBocaod9L4mAliH5xqyuniESCdL2
         b6dJB38qeeN6byO1kfjjVy2BGQmfvrreIeRjuxVfhbqlRX60+QC3YuJUw9xVDkjvbMKZ
         r5+v4CdYoC074M1C5bokgLsqlXv3cq1dFcyfr0yD+HEdRVg2A1+HDodmXmqgiuRdZYiO
         4F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338624; x=1794943424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhSwB8C2Atai4f63OWY2MkRGEM/VR9CghwTRTwW7K+s=;
        b=oOmNyvmJV+p1VVjAEmEuI83XoNeLA3+ldPLmAHtvWm8bw/dkmgDgjc6z9zXb6UdYjI
         x3raHggc2JtqH5Sty8fj2aXx/u27CbjjtdTiViJjG2rUqGV/O+oed81DBy4uEriwqO4f
         08kUFuCUJ/Yw/qq49CKLeRBOwpUsdOnpvwOWEFzCCtp+N0nmrE6f/Wb3jM6kXWPBd02b
         /IX+0Y/7NuiUeT+zSrbpBrttw0OXxMYF+CPXwHpu7zw4yEgxxvEG5leWBrxm3opjROJ0
         5ptda47c9D9qLvrbB7lu8WYNo0jzWGYAKP5fS+sb/CTL7AsB3U4hVcTdHA9OCRZdjREC
         fLoA==
X-Forwarded-Encrypted: i=1; AL+hErHNXAWpMHuAQQhATqJBEiz9Ih60emi8sssHpLBPibP6jGazgEG3r+3q3csm/WIlxqCEiojSQLjmsnG1BHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sgVOjGPFfPxtMlTDHHVg7/GtCsIes/tHkOpYfh6w4Q5tBrtb6
	oTGTOGr/AxAypEyrYyZCyKXOzOgupub7ZgK4Cfl2tFZJ1C4X0gt4k1tsLrp8i9DxbyY=
X-Gm-Gg: AYBFou09C2kYBzi4iUiUnJuxuoT5CxQ2ZY6LzOWzuAh+OTVqimlIgZf8ysDdaerWhRF
	ilHI3jSMacwjwO5g9TsGn8F3gtGiwh+a+jIsoR5sd2HLCzmnL61XXtM6+U+0dPSq0ZDFJFnqF9V
	yTw/6DruacJ3lvSPisBa/r8v0D4p9jXVEvy3wBI1AmPqZEPGkiHTu9U3iC2bD2nv5IKJVW25cZX
	1YRl/lHIjA9lgIEJL0rrGbxth+P6nMXevUDF4iz5SVUENGXxn2wCrOCen8UU9jh/cfypMTUaQWz
	eDmvGClmUpsbFjmF51slHi42P5i2DHLr9bm5EMbyTL4tuGgOwjL0MlvSQnW2Y4O/C/pNarP7+Wu
	2IlgLts1W5jrMC3LLZBVJ9MWqfFBfsq2gBnYEnMShF8gQfmsnUqCDpQ0tQ7Q+pTPOBMYEcCKjMf
	o6Lpbia2it2mTq/gM/lrEveC+HF/7CTEl6jRYFCVOjAz3JtBMqDFmUhoqv7Lk4bBJ715aIvhbwR
	BadmHIg8lcRGMw3JFarRyCLoNvt8MFXGc4td+9865k+Ny1/MTM1/89uCq3pgPXOcpqGkN7/OoRq
	6CZaiIv8ZBS/n6iR0ga/SELWy7WDcvJ42XmsenlK5LplcsTWy1ruDFhrh4V1IIg3OqeRB77ddSL
	KOIP/u8UlWCHi7L8rrr+6ELD7awGhCLo9jFCgy3Zt/XJbvDZt16CPsD1uSFvjJy4ZMOVR64exrI
	FlRypdikmupmAZthrpzpGwte8LcugiqlaW7o8/PCsKXH6Pq34Iz052L02qk7XUkIdH
X-Received: by 2002:a05:6102:510f:b0:7cc:80ba:5e5c with SMTP id ada2fe7eead31-7d301b91214mr1618345137.6.1794338623819;
        Tue, 10 Nov 2026 11:23:43 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::879a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aed1csm2368632137.10.2026.11.10.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:23:43 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	antti.laakso@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Don't stop or close a stream that failed to start
Date: Tue, 10 Nov 2026 14:23:41 -0500
Message-ID: <20261110192341.1305587-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <avLwlhbOg-9EJo7g@kekkonen.localdomain>
References: <20261106121905.42571-1-j@metarealtyinc.ca> <avLwlhbOg-9EJo7g@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Tue, Nov 10, 2026 at 12:23:18PM +0200, Sakari Ailus wrote:
> Please be careful with git send-email arguments in the future.

Sorry, that was a quoting mistake in my Cc list. It's fixed for future
sends.

> I wonder if any firmware communication failure, a timeout or other error
> should trigger the IPU reset (once the users are gone). The functions
> communicating with the firmware should also probably check that condition.
> I just sent a PR on IPU reset changes, they probably don't address this
> problem though.

Agreed. This patch also applies cleanly on top of your ipu6 branch. With
"media: ipu6: Return errors from stream stop and close" there, a failed
start already marks need_reset in ipu6_isys_start_stream_firmware(), and
this patch only skips the stop and close calls that can't succeed.

One thing I've seen on Panther Lake: the PSYS is a child of the ISYS, and
as far as I can tell the ISYS isn't runtime suspended while the PSYS is in
use. So need_reset can stay set until the last PSYS user goes away, which
in practice means restarting PipeWire.

"media: ipu6: Don't mark need_reset based on returned buffers" covers the
IPU7 case from my need_reset RFC, so please drop that one. I'll test your
ipu6 branch on Panther Lake and report back.

Jake
