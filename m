Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B555D877
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083727; cv=none; b=Jgi4shdzrEtLk2KnGeyrjseMmIrgGUF0xtT7JmAMBhCxletd2Vf1LekEEjgdm9oC79Vz0LPrJTvb7zgldf1ZFFSh9iwkBoc4JtCyS0TzNcqM8yyVt/Vy8ZXkDGYiBaRsRwkSC3CSZ0aU14rTafbGdXfDn/Vh5uoTqTJ4yQBgYRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083727; c=relaxed/simple;
	bh=b3ykcdzu5139p8lLJR0aJjrtvtqRBGOs4S9A4CZdy80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl47TSUCcZ4KOl0F5h0zeBvnpBcEPZHz7ZSTjnXwQzDq+/xbVwbkHquYld9YN3+z4J1X9NiHPsnM9SSvz7VCuznC95v/QFJkgbUiiUn5Ce5QURZfqkT0D8VfN7f5eDtDf45pOgzS2yBn7mEuzzkSAmjxc6Kos0b6esHAgnKbF7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxq+FRxQ; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxq+FRxQ"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so3463229b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083725; x=1790688525; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6eUa3MEmKBKqWKJ7eHJvPbt6Q+Vwkf3VRBTTs/7k78=;
        b=lxq+FRxQVS15moXqWve64Z/vTsn+U+UMWsGUGQOZBIxeWtyg+uhCVQEHUQezCrlNzM
         tkkzt32uqw26bvfWblQ2tElEZ4+K9pQAIF9cIcqNCBvVRfGCmGBYKT2ovt8pE5kr60W5
         Vh4Z+3ybb1qoiIk3pqTI+rBuWJEhbd2Uvt7sMtW3UqZwUhPj8DchDEQT1EVOZrtmDTK0
         dAH8eBZfrAqSauy4XdpeGoN7ofHbDDuYNeWZg+8KD5GRgNnbKbu96IFGNrchuern5YCe
         ih6uxZgfqHd0ezDc9OUal8M9M5B57PluwftMxzHyhiACc8LAol7u8i93G6CrbM5ZMk2c
         1Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083725; x=1790688525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6eUa3MEmKBKqWKJ7eHJvPbt6Q+Vwkf3VRBTTs/7k78=;
        b=ai8APcAJhSLMPTQPSz0jct9OFsAmxYY7BbXkaE7w2ZRMMyHx6Ei150Blc5pPusbQX6
         rI2J6d7u1Tki2l7HjK7SRn7AE9GTDZKpYrgc6Huca7koP3b6B5ER9pmtjzsbsEFA/poa
         jOwCefKemWQaxdtUGZ7QGNSk8yVeosZTfaw/iA+r7XI82TkokMxNYP0bqUmjE2vXHwv5
         JCO4lqh59UPND1xE49AgNfpnKzB3fsAziOw2BsEyIu2d4FFPSsE4CwGGVSSV/HI8H1My
         8+TxhG63GiB1EeOefaN5CCalgGIWoQZTrbHivvczW7/DUtscKFu4IBLAOkN04pnfb7Du
         Q2BQ==
X-Forwarded-Encrypted: i=1; AKwUvByCFMR9ZClUpfF+/oM3ASh4hM8YeEmwlcuwrd1YXsNMlZZ429H7WejGcMkOlREfgE1US896ZPkZoZG7BMI=@vger.kernel.org
X-Gm-Message-State: AFuF++ng5Se2Bm1YAI2zho8VRFSJvpQyo69YlToFNaQxLAVDd3kaTWSB
	nf6SMsWDe0KB/Yfqu6BmWxX/gZ0Ur5G73ZKm0pdQWyGUsVaUtkcdKgI9
X-Gm-Gg: AYBFou0GzQDFx0hriTWf5pi36WwF5IdgMR+qsM7fqUxxD8bMtr/gCKf1cWatCpdoGru
	AdfKcLpYe8tcmPqRSc5ehems97RslSFVvNSNL0CT++cpO5tTC8+L10kTmHRXzus6IXpMxBWn5hf
	LG3VVWGt0VFA3a3rbFDfPLmPa/lhGAsLNA9FbUq0n7n+Auzt9miDFiUFCoEcOJdX/j+5xxPdWv6
	m2IQZwPaKr7v94fTMJ0SLswi662YRmyli3drBreqdDSDjN+yLU5hNPWxL5AtjwIjefQMdqsiK6x
	R/vjqNq7TdZLJQZHqs87uhbq866hOgzT88i2CcWePhzuPM8/v6vu54Ui2DsS8pVjDH+vhj8cMhN
	UoOtK3qEam6hBHws1hl2ho/YEjCdfbzkSiaOEiQDBx4vKPZ0ULKcHDqA1y5rq0te1u+mmywitye
	Vcx8XFkz6SG5811wQI1UrU8RA5s6NGdLK8FYKPVNTNGPtIO8wCm19HKJfgOxwMyvqnnhlVLkZ/+
	oYKEZ4ENoHz
X-Received: by 2002:a05:6a00:a115:b0:879:ffd9:1286 with SMTP id d2e1a72fcca58-87c81ebbbacmr1272041b3a.8.1790083724286;
        Tue, 22 Sep 2026 06:28:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c32fa89absm852763b3a.46.2026.09.22.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:28:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 06:28:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?utf-8?B?5p6X5r+s5ZOy?= <m18667909625@163.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] watchdog: use kstrtouint to parse
 softlockup_panic=
Message-ID: <e5bc7dc4-3faa-491f-9c8d-62afe0be0bbd@roeck-us.net>
References: <20260921064143.81420-1-m18667909625@163.com>
 <7b91e8cb-d068-484c-9a9f-2c19cb37f5ba@roeck-us.net>
 <20260922060000.10086.1-m18667909625@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922060000.10086.1-m18667909625@163.com>

On Tue, Sep 22, 2026 at 01:50:40PM +0800, 林濬哲 wrote:
> 
> simple_strtoul() is deprecated. Replace it with kstrtouint(). A bad
> value now leaves the variable unchanged and produces a warning,
> instead of being silently clamped.
> 
> __setup() handlers return whether they handled the option; there is
> no way to propagate parse errors, so the handler simply returns 1.
> 
> v2: warn on a bad value and return 1 instead of returning the parse
>     error, which __setup() handlers cannot do (Guenter Roeck).
> 
> Signed-off-by: Lin Junzhe <m18667909625@163.com>
> Assisted-by: AI coding assistant (disclosed per kernel AI guidelines)
> ---
>  kernel/watchdog.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index e5134ad7b663..7f8c904554a9 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -17,6 +17,7 @@
>  #include <linux/irq.h>
>  #include <linux/irqdesc.h>
>  #include <linux/kernel_stat.h>
> +#include <linux/kstrtox.h>
>  #include <linux/kvm_para.h>
>  #include <linux/math64.h>
>  #include <linux/mm.h>
> @@ -422,7 +423,11 @@ static unsigned long soft_lockup_nmi_warn;
>  
>  static int __init softlockup_panic_setup(char *str)
>  {
> -	softlockup_panic = simple_strtoul(str, NULL, 0);
> +	int ret;
> +
> +	ret = kstrtouint(str, 0, &softlockup_panic);
> +	if (ret)
> +		pr_warn("softlockup_panic: bad option string '%s'\n", str);

Hardly any other __setup function warns here, and I do not see the point
adding it here.

Guenter

>  	return 1;
>  }
>  __setup("softlockup_panic=", softlockup_panic_setup);
> -- 
> 2.54.0.windows.1
> 
> 
