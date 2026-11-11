Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382817;
	b=T/YK9djNJ1FjfX2XV7czsZFLcOG1dUrKXfftIriSIB3EurUYDoGTfrw4PcGoZVM0Raus
	 lo5seUFv+HwpvzWyDFy7stqVmBgX9S/6Xcx8LP17KaFTrk+mOWAmyQV8b9TFgd1Ogr73W
	 OzgPVNwjBHdN5let9PAuO3a1y/MPxMxtSF6xkqc2ZapMiNJcCRUDfUExtNHxX02fkURv2
	 pmqBE1oOVFMud5Eg8nXJ4pXQE76UEPcbkb7lpHeaZ34q5/pMWGHKRRYO7WblL1Tbe47OH
	 zDaJNtMbNsMBDXpBqLn5Hyu5kPoTx3EJF/A+v+l+yOAKBQrEXcaxGX+4AU2oGVzaQ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5sA/bJ7zlvzB4PjwB/BzIEOEcwq2h4lfsdHKluSnl6M=;
	b=PLzQk2DUJQvzwRR+rWoqu2ul4DjBi9IRB2tVEAQOYxFNozSUblU3peGNAZsQnljvrhbj
	 jjJU81ntzQPmCYAujILhieEaNH4yaeYrnL7iCE8g3zGx5FJs7IxV08RgcAPmVALHoxePi
	 NKARnkBUg7sq+u+FiqOih3mInddsVXW1k9si+zMlzNKppeAysKT96Yu3qmdcMsHVqZT4v
	 Uk2x9qSn9dyOhK93qjIvrCpPzgmA9P97YUlsIHydLm1wDjPaNUUrwJq3PRWTLYVU5qrjN
	 Ra1vKf+21XOPBoGKjn8SddZvRHMjfC3lNM7j62dEVfk8NfBVPa3wxllNeYqS+sPgl0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RshPZ4Ni;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6069606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6069606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RshPZ4Ni
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cd6b195dd0cso750252a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382816; x=1794987616; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sA/bJ7zlvzB4PjwB/BzIEOEcwq2h4lfsdHKluSnl6M=;
        b=RshPZ4NiZ3yyINW4tEcVjyvremNrPP0ZAsQXV6Slh3WDu0fI6Bfxv5vH9S2S6zksDQ
         PB/TpcB8s5qifEhzKZ+/rA8tJBr6eOcZPnuy3AcwnB5qwLvOgg06jliCu5PqRroc6DFv
         gM5ZzMkUWfhp1kivGjKjaUyKB7Blwnk9IeRVt1QwQ/LQjFq2fgj/V5MfABBARa1iMLR2
         7J6lS2KljnM3f5tH/ka9kfloyLOnK6cGO9fMQfwCfKq3ibQigdpsLiouz1vXXUgdqCaZ
         iyPFC289FZsHf5jkmMp95GL0mBZcl8+jsxzAv7mkk6J2XYs6tmv7hzT2U9tYUHiY4h1v
         rcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382816; x=1794987616;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sA/bJ7zlvzB4PjwB/BzIEOEcwq2h4lfsdHKluSnl6M=;
        b=rRFpDRczkH6j4q0DGRjXRVXkY9AWuNNw8Q7el8u7BjYG6Kck52u9xF7VLneNWPe5V5
         DQ1Cff6US0d4hbG07gSSPEylOg1WuKRxdw6tR7+4pIc36ZbBLlphpUodZbuPlfpa6ogf
         v9HHZJSEWfntoGhrB+T8FpIWhK6viW4Ta146bcg3cTOWflJ38owd5Ql7fJrC769JC6gL
         zukyr3q1w6UEx2XvFtSg3pHIR8g/YmdH9d/vCQikO7sLhqqzqBVg2bl8uHg/XLcD1faP
         dh+yiAh9wriBhn2ax/Ff6vnC5x91ulFE41kc4siznxQmMG1+uuLINMRVB/Pm2Yg7kkAQ
         cp3g==
X-Forwarded-Encrypted: i=1; AL+hErFbKV2coVjuKmZ9CAF3iTmEalpU6sJ7vjWfSIiG/mtdhaezUI3aINU0GgFPPoQ+BNrvKhImAHzHF/FA8CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RGsENEQ9dRZRdzIpaZuRqU3PCPYnNXLCtzi3444RGm7Xx3F9A
	EcdsS95tiin6mcxykMwraqdnmwQO4CAVM35Nj/z0kf7kdD4PsGdtKy3L0yVlmWKi3XCKQQ==
X-Gm-Gg: AYBFou3qo25dEfRPgdy9sWzNJAKO5+KP1hnl1h8ykuxg56MyxYHpqjInqRiECI6AsRn
	QlGaDGCvKt8BRCA36iYYp/HkyL1WeqGdIdkUhcPZg5kjBFZ9loKwnY42IubRR9sdfnqwcpD57N+
	7bU26+uHRPL53Rx2+vnB9badBkR/1dsBNAqQ/j1FI1vMPJGqZoa9xvuYJQLqKAsMPHmCOCpVm/9
	CdBeIsVHA9V2jQEfjdGNULbq2dJS3uU5i8ePDwEjWGjeDSWnOhmXAuEp49JnqQIBeX5S5ebfv8Q
	7RNtQGx8/q7kKWzcfSjL6wv6IYCgXzkrdH1iAgeVfo1fCzHcc4zdKtnJIasvF2Jh0fxk5gQLyMG
	jlHYDMaW4kZnL8Lkfyf1CEJOPfHrfoP5TApOTz2zgzFYEjDW4SrqOtCfQFa7E7VFu61UA3YNhIk
	LLIN1lJgiGdlucwXoPb4ZQQ190Uc3tvqr7fm6Hmi9ISeAayeg7WmbXu/QVygnbnzU7WELDd8oYY
	gI3a2aNBzqXp/Y2HQxOqxe1G32LdZbKxBQ6S7aF0GarOGPAOgCFYndWC8lCzZPo0YCPSvPSeA9M
	Xdtx3i2LqVytCjB/4nZ9xWl8hl8HM3Fwuxp9GuiO4WYcHNfe4sbmfoIHUoBG6iUnd7mZ36+O+9/
	YczrPJpDRDI37SJ592cjBRjyJwA==
X-Received: by 2002:a05:6a00:813:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8bc1c59482dmr1963449b3a.9.1794382816055;
        Tue, 10 Nov 2026 23:40:16 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm1781918b3a.36.2026.11.10.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:40:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v0] Docs/mm/damon/design: document data attributes
 report infra design (beyond page table accessed-bit milestone 2)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 11 Nov 2026 18:35:52 +1100
Message-Id: <179438255225.3134195.10613668244848761847.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261017195747.89961-1-sj@kernel.org>
References: <20261017195747.89961-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 17 Oct 2026 12:57:45 -0700 SJ Park wrote:

> +The data attribute probe supports the reports.  The probes can be configured to
> +hit for a given memory region depending on the existence of specific types of
> +reports that associated with the memory region in given report buffers.

I'm wondering how this would interact with the region size.  If each
page of a region is reported with probability q, a region of s pages
would hit with probability 1 - (1 - q)^s, so a large region may hit
more often than a small region of the same access density.  The page
table accessed-bit check samples one page per region, so its hit rate
doesn't depend on the region size in the same way.

A quick replay of the crediting rule of Ravi's RFC v4 [1] on synthetic
traces showed a similar trend.  The adaptive regions adjustment would
mitigate this to some extent, but large cold-only regions still kept
high hit rates after split and merge in the replay.  I'm not sure how
much it matters on real workloads, though.

Would crediting the hits relative to the region size, e.g., reported
bytes / region bytes, make sense to you?  It would need probe_hits
wider than u8, so it is not free.  If you think it is worth exploring,
I may run more experiments and share the results.

[1] https://lore.kernel.org/all/20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com/

Thanks,
Aveline Noir
