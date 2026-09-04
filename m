Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF41D4A3D57
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529608; cv=none; b=Fotf9iVGgI5d9fDs7sEnZtoWKhm4t6DvSjYvDzZIKfmQXkZy7Hy1DzjoXRDf90z1Uu7r0I9IHD3sV3Go9eGgp811M9EVFdEApV5CLcsAZjtsZFtiLu39JEyegztdHx39RvZcr+wZChPHPPWD7CFq1N/azBQJ78JvN0iSKtfsxLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529608; c=relaxed/simple;
	bh=VcKuCeSMQ4I5yw0ljiiq4L1snVizmWQm18XxRE0uO/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOLixvlirD9R68ZLNoMGKe5EkJ7and3Cun/7qtk3Gn79pgvq1sITv21ttzp3rWuceQA8vJmWH4/6bMdSI3u14C2wX7BsgYe/fjsNgtj9eMF7FfGLcFWEGqZk6BHGtuLACf1kxxuSQmZ1joKeQAL1q4R1TZwEPO75Hfa3ZqAoLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2IKQTFc; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2IKQTFc"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f4cc6797b7so638875a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529605; x=1789134405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=e2IKQTFc3YbZN3ypwX5yUCc+DsU03AvtA4towAyv1iY7augKUcyGpi7zcej+n0gH/W
         YlKp0xM7ph4DcCy4t6ngtLpCXzKtxdoTMHVfgF6voqG43XDO6wRJM3LsWYyZpsTiGqT4
         RAN5Ydx02OQJ4YqPRZgYahO2LuNoSaSFRysLwn8STC8lEap+t64mKmgiyeC0uqL5kokT
         4JUvv05WFRn5DptkYllwqBn5utqH3zuhuhp40osprNWxNympUw1AjEsHCvIDO4o/dbQg
         8phcTYJLtsheIpLOizcR44HtHc4w/X6s2Uu/yh9lHSmrkRBYyYaeT6hAVNfUnrqf+T92
         cYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529605; x=1789134405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZTXMZGnnVv6fSvtGBrE1wHaAf9xygy4G9N0vOtIQdo=;
        b=tO0Huad/WyArihkJtrQcap5GbmkIUkf3b/36e8U+0uXZlR8/Y9WA5KEfay8CGKTRyq
         /3hXisEX/f+Xr39aIytuX0YzTgDISAOmEjJ4fkWONW29WCD87rU4gDdIDa4vDn0vANBf
         ls/E1hSn+Rs2eOrCqnA0SHg0ZxMRYkOvhFFYiI+dVpGAbRmBCLq5yLYJsvkOADGbgFs2
         Uh1BGnGPi1/UqxLFJKQljPCfzdBrUkhmEo5/ZXvFqs5+HwFXseIAKmDFnrRBO7vPynf5
         jcc/WtK+j6xj4NZof1MBzrcnjAJBCEy4HX6l/WMicG5sFmuJ6Px3PUZ5a7SsDhT149uB
         GBfg==
X-Forwarded-Encrypted: i=1; AKwUvBzYASu2N/+DeS3SoQY16eQXl7Mi8DFyqz/ZCc30f9h/bjQ8+DF9TO4tsIVYXD9YRwm6CJhrzwk5/QUAsU8=@vger.kernel.org
X-Gm-Message-State: AFuF++lglYarWLFN8w70y5wT539XGQNh+ZW6YeDJqcNktql43Mc7vg96
	Xv3oPpc4RIRVgcqUhCDFRuA6ApjbginH+l9A+BMkmTuoKPxpuLaXRV0+
X-Gm-Gg: AYBFou0P8DPs8hegzUh+9zwgoBOiZO/G5PXRU5xqPbck3rLypYhAqDpYvcTDlCpSQNe
	wt/WEk9R8dlbtig7EFj1AjmlXKCTGVZIcj+zGJkZRhcWbLzEOYBbYL7Jzuz1jvmd/kmMjh0KVOk
	27TQb3QY0lqO9KZasR9N8puoc0lxwwjoDDItSlreqrwmU5Ljr/Yn45FqUyUfKgmn30WHElBJc0I
	WZMqxHME3U3a51FrWjazeYcT0qj4cnqv9hZSuUUOGrLgCjWbISw3m2vPwOs8K2tP+wKCUodl8Xz
	ko0rGOlRMA4VeHAo9dNEF84p9XCsmdFUWZanWdSpd+aKknZldthdINhBAfr6ASLYgNEwK6ixysh
	NZYSGcJ6TEfVQ+DnHtRZR35JLg05S1EY+7j6lGIXhjBr4kzkkrRBe8K8Kl8wSthuyTr2S2u/c9K
	tsSxMna9l17LC+04xwZWk93w3fYypegfr1TDdKB282Y8z+mMNUyRuS6siBZhQDsX8HcQZ+txWSh
	iOu0yf4JkWEBc23ASrYYqByWQlW
X-Received: by 2002:a05:6820:c86:b0:6b7:46e9:96f7 with SMTP id 006d021491bc7-6b746e9a200mr2294144eaf.39.1788529605201;
        Fri, 04 Sep 2026 06:46:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3ed6:cbf9:9a8:24d0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm7174899eec.5.2026.09.04.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:44 -0700 (PDT)
Date: Fri, 4 Sep 2026 06:46:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Message-ID: <aprLYn4VzSTnZWuw@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
 <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>

On Fri, Sep 04, 2026 at 03:41:21PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2026 04:12, Dmitry Torokhov wrote:
> > Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> > data. This is useful for non-DT/non-ACPI platforms that want to
> > associate device properties (like DVS GPIOs) with the regulator devices
> > using software nodes.
> > 
> > We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
> > have the MFD core assign these software nodes to the buckv cells.
> > 
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
> >  include/linux/mfd/wm831x/pdata.h |  2 ++
> >  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> I still need Ack for this from Lee... and the problem is that you did
> not Cc him.

Hmm, indeed. not sure wheat happened...

> 
> Please resend everything or spin v4 with MFD maintainers included for
> acking.

Maybe you could take patches 1-6 now and then I'll continue with the
rest of cleanups?

Thanks.

-- 
Dmitry
