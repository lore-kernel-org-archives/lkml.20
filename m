Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316844;
	b=2Nxv+U7SYDDduiZli6Sa1+XSEskAJec8Um8qvkEA/LtRt+a1RzAiJO2unOQVENkeTDX1
	 vDF8aisS8MNvEgYho/2q5LWqIbG6xJMJRmZioMnnFd6L6T+HrmQQAX/3QhlGaBwCMdW7q
	 HsoPLuVBP6W07miRtxiXyk/Go4B9dMTC12cPo6dnIxwJzxhCCHtNO/a6PiGRmutcr+ujn
	 OcSbyLmgLzd8vkiC4HOsbS0TJWTldV4ZMz+EDVosmdQTo29aKPTAcQNjd1V418JSPrtTl
	 seftiAWvXEI/5xkuVsVqW53xMA3xqVkPy17FyR/0jWsdnZ0uCRBYQOasMUWeWidYCuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HgEZ6R3QT14xsrDbsdojkQHFi4Tt+tUPqMpmTREpgRs=;
	b=L7Cz2/8n0Nyjy8mn2HJChOzzHVBR9yuspUmntU03ZGI14uXcicnOxdQE+eQKrLoXvprC
	 TPHXibrvJqqeI2PAX/NfOZM1RbQnI7mPLZnbIW+RYjn0hhidmHjY0rvv3jsjXnTnY8o1z
	 SBR7ig7Al/enhmES/RG2yeKqHeHCPwyC/1iMWt1ECebi8FEJ0GaRc96dCJPQ5kUwDNIWc
	 ZBHJqFJgOnTCS3R8zykmMnnJB8isH8cIATFiBHlYZX/iRqXWlcFnfDUSDj4s5aqkfofx5
	 cAkCLsHwQ+/iH5xbV+l+C1c3eK327KdVP2IOqATGikZ4Xjkpu9gR2VpcxXvtwPp5jew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="VHpMP4/j";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11BB60798AF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A11BB60798AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VHpMP4/j
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so17061395e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794316842; x=1794921642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HgEZ6R3QT14xsrDbsdojkQHFi4Tt+tUPqMpmTREpgRs=;
        b=VHpMP4/j4sBE/3GTsWVQXCxciymuJ7C3nxN5+Dp/83CDvcD79g8DhfK8zTD7Ivmg6i
         67lH3Ulh4eABXI9QypW6gyGJdhevQT3cUO0D4gsxOrSN2TBJAGFjTCmosGKAmsbezZQP
         2I1iFT+TIbq8d6EYGfEwV104xY1K3Hbt8xJ2SwGtblNfbti+36u7nsX9oq8qeor8/K+v
         uaF059Jff6l639HK4RXNTwRqNy98Vxu2z6afcpsQUqh+LKG5NWFFuHaQOrhTa5uz3XrP
         g6WsjwyjfzjhzaGseTGgYPYMkKmZFLmQZbul1cUcIhtMOK2/LBA2BYRyDQ1gkhRh0APK
         t9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316842; x=1794921642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgEZ6R3QT14xsrDbsdojkQHFi4Tt+tUPqMpmTREpgRs=;
        b=To07htfRzbNR0Lg0MnaAyH1lRR4g5KKb/lz/E3CZdfjwPrZHO5f7wOvwkNsdkV2NSy
         XnCXQ2TvsaV9JPeIH7reTWGpVyhapBIR+bfjz5g0pM+JkkbrHNTvk0Io8uDjdRO1mQvT
         sio1yp+5AS7iPWOJFehZmrEoBD3C4NNynFm94gxs63bE3E8Sw2E7GhdM+IrHAR9KNY39
         xrNPR5uqamtuuZUTk9UF+YVQnj6bswR7BWwsV0nWtJzzuLu4UCD4lEl+glq2cbXND7lF
         mX1V/Yuh8s0ManjUUMLRfwS8qUe6jvEvELAkdDAosq6k7vuJNQw+qoDUAKQ2qE1zduYT
         StPA==
X-Forwarded-Encrypted: i=1; AL+hErEQuRsNfk5XUtUZAMcMrXddzkJv5BGQLqgIeZ5JvnkGSrvJQUurd2Yg8PgR/L3WxjbqZ657NTYWznpmALs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CjqmkbeyXeD3KYrgSPBO3GIz6x61cDkOLNns4fj7ZMEwMmznE
	OLVwxfIhOHDEqGQ955naWvzrsqSQQnsNkuZkeCJRfQuYoOgnWfR6dzJKFN6ndYwgAZE=
X-Gm-Gg: AYBFou2tpXlHY4aRRmlsi6UAzny4gbqYCiFPVfB3sBz2aqQsfOUwnWysklhq99ZvzI1
	6S+VQiA/TBwOIbzbk/8UacAKgBG0ezOFYMT5TNkhZIv+36vxNt6ut04NuBI9yZLDFX5TRmIvDNV
	RjfODD1F1wiRz9wVWTeTos2z0W+pnYbwpVWLHQfW3xS/obSv2ZyvOlrY3DBt5m9Qw9vYtUm6mlc
	3q+vIFqMzW3IXC7goVRzPMN/+reZNTeVL5HhKPW1HQaUzsWdFRYhYLBotYdbYFkvWzPbfcHhxuH
	wSR3j/m/EyHfGYgIkgTs6y4dFWrWtihaDU/ahuppouFpUCPJw8jfBTbUaCrivXlWyYUdeDc65V0
	GA1AfPa1iKpPB/7qt9BiHg+cUTGza+771FU/UIL/d3pfFr8Ftadp7hLsxw2rUfzLWIcEqJoaEvJ
	ckspvY4V3tUhj6AYZvVfJMM+P3Hdf8LlfeZkYnSBuanwweWquRM047Nf6Y8y8h/+8G/fDmC+MdY
	eIVIR2y55pC20dQgc7+lF73D/S6nFdStrZSTgBLE78FyGK8EzJ1WDcHq1DYEtJ0+zhRr3dOGox9
	4XZvEnBDoR2xxUKr7/ZhhSCYXO9mN9DAvmXEUNsev8iSUqAs6vP/uswAkPbBV/1mc7o=
X-Received: by 2002:a05:600c:6089:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4ba0234f9efmr39939615e9.30.1794316841996;
        Tue, 10 Nov 2026 05:20:41 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm5435036f8f.53.2026.11.10.05.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:38 -0800 (PST)
Date: Tue, 10 Nov 2026 14:20:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: rostedt@goodmis.org, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, senozhatsky@chromium.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	keithrteeple@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] lib/vsprintf: Preserve the sign of seconds in %ptSp
Message-ID: <avMaIj0DGI9yei5O@pathway.suse.cz>
References: <20261109215445.43419-1-dennylin0707@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261109215445.43419-1-dennylin0707@gmail.com>

On Mon 2026-11-09 21:54:45, Hungyu Lin wrote:
> The documentation defines %ptSp as equivalent to %lld.%09ld, but
> timespec64_str() formats tv_sec with default_dec_spec, which does not
> have SIGN set. Negative seconds are therefore printed as unsigned
> values: {-1, 0} produces "18446744073709551615.000000000" instead of
> "-1.000000000".
> 
> Negative values can arise from time differences, for example in
> fnic_get_stats_data() after the realtime clock steps backwards.
> 
> Use a signed decimal printf_spec for the seconds and add printf KUnit
> coverage for zero, negative seconds and the signed limits.
> 
> Fixes: bccd5937447f ("lib/vsprintf: Add specifier for printing struct timespec64")
> Cc: stable@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Keith Teeple <keithrteeple@gmail.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

The patch looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>

I am going to queue it for 7.5.

I am sorry that it me so long to get to it and missing 7.4 merge
window. My TODO list somehow exploded around the Plumbers conference
and I am still catching up with it.

Best Regards,
Petr
