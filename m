Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657495;
	b=G+m6vzqxe5ACkpnzyqBnNF3q97+YEnDTWtpl8W5P90T0kau9kpqOO5QF6NVhocsSVCn7
	 FEAXt7o4ESxHi6g/bJWS0LoGnJknnpjZdc3hH/GIxTSRG0YfRr/NVnkjsvjPPqlGk2nSS
	 Hbok6eocketU5rm+1DD5qPJW6zpbLt6ZUTC0ymY4SULYgt/YtHmmn+PFB4SX2+FAbIm27
	 K+Jt3Ys8AFjIWWqO8jcz9eZ41mIq/YGI6APizzczqANZD0pQ38d8kFIHFX565Iz1qea1j
	 iENoZST/El4EBV29v5Nfrh9QDn0jlFGPgas0k51zn4MaqcgwBnoktXq9Mcs10izjSzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Vd7izru+6/lgo99qhm4hOGTqXdwgysuGRl6/uCpNmY=;
	b=kfRY9EA7+XjuObzRHEKeNvppTUXNhBevE717kgrUJMkvS6h969kmik0swhgY9xzng930
	 ThpHDDug82awT7bXMgWhq4H1Z5ZbWfBTR3e7daXfWllIVoAUub4oITPaql32AE8V32t+B
	 JYPUmwo9Hy2600b23hIu/smOfuSG525AdyDtrxFTcxLmSr8BbK7e7hyluTaMKWDlQvbFz
	 T6c6eD8pxErRAP1qke7cHMT5At/xQ9NRg6WvW0jvZKhHLUqY+J31TsDXjrXOSol5VlhvW
	 depbXTQ/WQRbonLOZYrGa18+Qb69q/s9YdlnwZ+hNYtzpwB5hIyOtWDYFWcYMugxs3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DOxI3ENA;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BFF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DOxI3ENA
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2747278eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792657494; x=1793262294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Vd7izru+6/lgo99qhm4hOGTqXdwgysuGRl6/uCpNmY=;
        b=DOxI3ENAEcruVbjOOf7E0Qad3+/ETA7XsNDIyoy3589tZRxR13X/NC4KdDSavH4l9p
         gcQdhBsQ/xONblFurjSzQ5nxZ6iElRdi7WdOIFRbFxB4hakLCyaANjRsPD2Pyr5+Vmsc
         A3V41YGqCscZ72pPMjw0WQOcYnSHXAqB6sjZ4nPwj2MSdf31gCppjoMCOgwTGRh1PV0D
         nzY8h+Of2ZmA4AnLxA94J8rXQTKAQoBG6m5OIsqhh6eVpIExEPjV+KzcyUABVAjOr4i9
         VpCe5c3sySW78+EEPQi3RpOY/9nhL7223tWCh7RVkn091wtKrroExSJoc6UqrmUdrLCe
         eq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657494; x=1793262294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Vd7izru+6/lgo99qhm4hOGTqXdwgysuGRl6/uCpNmY=;
        b=T9uuPmvX6uQsFVFqDLrx5mJns7elovMX0kRZtA/CVADC7M2uQuYHUgPvrQJjI2nOyl
         IVD7l6Sz8MvyOS7kQqU8BAl2bwV0I0WpFBnvVoo7Q1/i/5DwIbvjELDi2mG8sshenSoG
         h4paACiIjb+gik/eDTwJZDfrEo7hPxvRtFtxYhOd01lv4aptRWf1Bey7AONOzRkF2ayN
         zH/57L//oXThO/1OSNefiKL8o6GFmAPH52NEToAtVX2HzeXQlWked+/zJCyMP9vJMQ9r
         OGarfM3640XNlO4Of6JTJrYsYpipyJDPBySKTMgQI8TO7Oq8GwZeVIqMjK2PboWt3gKR
         M9ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZZp4jOEIJvV9EZMbtbHuTnMUcJwGmfWiR9AuCidwsMYpdY0CNy7TvaQlv3RZcBAU6rxqdwdbJkpWpnQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYISDqYP0E/f0k6Gr9ye47ZWyA8UB4zPsiJmkCk6Z35k6hBuydkY
	PWQFT++Llb4DUxjNEWznY6yT2DkOXnTA7L6dKdG4axubfHGAhrKyOa5/Bma7ebo3
X-Gm-Gg: AYBFou0MZzWhBsKWdRtODc/ENxeX6zZma2homQodvrwdxMPeT+lPihI4nrU/YX2sRvY
	OW6XJhHBjkYREd5DkORI/rPEFjY7vAYHta1rmaIF0KB2IGBjc0pb0JnkhdtDFV79++7WMJTMF3e
	IWIQqozm/L6xcM1aRKZ4j5k/45PWx3cgf3e+mJB4MAMPhAuLx8jzh1kVOkcWwS2siRRZMCr5em/
	Sw+TW2CYr38NxHrTG3cAI5HUTVOOGKJ2ySELxM5W5QBqKFQilUMWzdjQSfz8Ai8bHcrWfO54nBb
	V5P7i7ZTDu+7pGSlYLSadWJbU7LsxsXUoPsOVdk9+CcrVwpr27uLZJ2A08S/AopmsudJD+hTVSJ
	GrL1V87gI4/GlrJhdC+YBkDCBmaZLuECCzv4tyry2zUU/m5ZNgtSHYmKsBRKHoPG4HuLa8YwwRj
	fiAhMTjfCTQPA0dTnmIMVstxZXRxO6EZh0Of7NJik82aBCeUKfgcncKcZvYmjn6V9ngsnEGRdw7
	br9bG9d2SmP8aUueOg9wHYYxGx6kldbl2LqBTC05/ywpsaSwCEzy11YPpg8ZL1qGeBprtUUIQ3h
	E29JoIWTNlVW02GzO/2o7n/7GuEk0Ex4rWj0NfRtMmcYPxekILIwu6yf9aJ/laSrWihIiNbofY6
	TJhXQUz33nS8=
X-Received: by 2002:a05:7300:fe46:b0:350:869:d106 with SMTP id 5a478bee46e88-3674ea39d18mr5791998eec.34.1792657494222;
        Thu, 22 Oct 2026 01:24:54 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm14857858eec.10.2026.10.22.01.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:24:53 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org,
	rodrigo.alencar@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: core: fix signed integer overflow in
Date: Thu, 22 Oct 2026 13:54:48 +0530
Message-ID: <20261022082448.275582-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atm2WhX9KDkbUIPk@ashevche-desk.local>
References: <20261021225306.623361-1-kapoorarnav43@gmail.com> <atm2WhX9KDkbUIPk@ashevche-desk.local>
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

(Resending with the list Cc'd, sorry for the duplicate, Andy.)

On Thu, Oct 22, 2026 at 10:08:10AM +0300, Andy Shevchenko wrote:
> This needs a Fixes tag, otherwise it probably won't needed as Rodrigo working
> towards tons of improvements in this area.

Will add:

Fixes: 6807d7211327 ("iio: Factor out fixed point number parsing into its own function")

> OTOH, Rodrigo's test cases might be good as part of this fix as well.

As far as I can see, Rodrigo's tests in the E notation RFC exercise
kstrtodec64() in lib/test-kstrtox.c, so they won't cover the current
parser. I'd rather keep the fix small for backporting and send KUnit
cases for iio_str_to_fixpoint() as a separate patch, if that's OK.

> Wow, what's wrong with INT_MIN?

Nothing, it was just clumsy. In v2 the sign is applied while
accumulating, so INT_MIN falls out naturally and the limit goes away.

> What's the point in changing this line?
> Why do you need explicit castings?

None, both dropped.

> Do you know about APIs in overflow.h? I think you wanted to use something
> from there.

Yes, v2 uses check_mul_overflow() and check_add_overflow() and keeps
the variables as int, so the s64 and the declaration reordering are
gone too.

I'll send v2 shortly.

Thanks,
Arnav
