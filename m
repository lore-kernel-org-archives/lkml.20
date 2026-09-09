Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC65A0ABB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989105; cv=none; b=pPQEvx4G3BXiIyVTl5xyWYJAjF7sw14QHDLr5/+0j+SvBgHEL68H9q0PnwomS6+vu+7ZdhcPrOiRxLW/Dr0XEDXZzHibfnRHSZqhCfCK1uQnXq1e8XvWk4HVQybksvL1GYI7GhjrFTEKrEdQ186DonWNfJySmIhK07lcQvIRU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989105; c=relaxed/simple;
	bh=j/apqNvWLw9XnsOroqXyRHw69VQZFc9ZzUz7CVKUVzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWXbGS6+SE065CYEINvl/3PcN/D4XyLp/5l9diEHXHK286+jfSYuDN8adCqaBL3xhBnS3VYdMTv1Ig64HAhcMhoxOFNi+nRyyQ0kt1Tt/9oQG/a41nKWi5S21aIE9Okk9Ln1Wp7bGrz3JWKJ1v2DTZDIj9nQmx5p/EDdG6eiK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4/Ex2KY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4/Ex2KY"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc149372c14so3340081a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989093; x=1789593893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=j4/Ex2KY4pCB/q6pnQ9V9zQDExHQuB7MCiBkMgO0TF/UZ6/ycuXEnRBzYJi7VC1ijK
         uIYTZvODvtKqPhxBOyZRBi63qay5BiljBU3m4F2KMDtH0N5str0FzrRCQpHYl5pIh9xq
         phhKb49l8LwAZhnsXR+M8/Eu3wLFAdsqd0/g8rT+Z0HBi1iePhPFSK+gw5MzvamBi+Ph
         aMAyPiNUYh/IW8sWUeHAJEKN65HL/39b0XbDI6BmZ+FXK9DYbMfItNaZ/hVILLyiJjjG
         PPrI+sKKjQ4kZiJkJs4IaOlsAObH+urZVB0nKaYvQ3EIvUyTg6+in7ggMWcIvU2dDgOr
         i97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989093; x=1789593893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=e05tAH6Az7m9YRo/UOo3ksHDpqD9LrfRFxnigIHPXs8l5ihbsVso7mwH60xJwoVayO
         z+8INcB3ys5EzjAI2hsJaAY89mWzF9y9HBmha3CCQdoe4vTwSaU9fTmanfDGLR1aMjMf
         Gu8OyhEwB+aLkzU/XHOJ6bPImnqaWQAWrx7N/k+kEWMqtnLKIcTdcTtMqtBmrPAxTjPc
         92VG/zsYnMo6HipNC3fd/HYron2Wh9w+Hxdsm4zCtqKAqQyJGwcCODgSE+BKTdS0soAH
         /m4gbOxbL0Gag2iOXoYbLN7g2q8yZfkJJ0u2Zm5g2rc3TrHGZHYamYXGR8ekUOR521F+
         uQZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOqxaJOOmht+OmLXUDdahnMAO3QE5uCEi7oT+jn1eh95TinKSJ7GFdeDcpHTMrP8ova88smhqdEZcMM9w=@vger.kernel.org
X-Gm-Message-State: AFuF++lnTZomZWUDfSXQS2Ms695F1NFaptYXk0B5ikg15PYIcUCIVZdS
	+9zkhlR1wuB1/JgCHDpE/Dj/X70QF741OQ3S2hHmJzv/gLU3VM/XmHln
X-Gm-Gg: AYBFou1549OKgcue8/AYAZIldHhfX8fqYrhDjaACa549xo6XlLDuP5XileEKSVM9SUO
	mEVPcpTkdVO4lXZjUPErNagpKCR81QWJtGYOHHdRupFGmMT72rtMx0+U0RUEtikHbFf9vHA6+ol
	MG5JVkku/W1FG7o58vcmhTpohrxv9TWxy5//dB4oZ4Vw/3oeZNHm9aPT5PJ49KarVXn6fWRkLT/
	oJYO2OG/0yHt3J1FJi3p2G6YVEfyXeG0r6DxEZKXV+DkYbSwvfQ2ejaCO1YKXZ57ntZFe53jzKj
	jvclzWzsa1gfSIp5+WtpicVvPtTJ1axFXx3PgRrGRWfeA4gcqn8Y4uVgKAom1gSsAqTRkOQCfUT
	pPx9PW+1znDwhQApzEe2W7X9kj7bbUf+nTwvKTBj1AojzGdVIO7qRmyPwiCyV43w4RLw65/Imk8
	rvcn3YdSYYXztqs02R/U2oqYnRhRIGtLWwdNn3QE7R3Sgi+tqfnQIALf/4kYPy1YTCctjbT9J/p
	RiQlufIA5wH
X-Received: by 2002:a17:90b:1c0a:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39b2614e099mr53418423a91.3.1788989093027;
        Wed, 09 Sep 2026 14:24:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm6506a91.16.2026.09.09.14.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:24:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:24:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for
 mt6589
Message-ID: <b01b65d3-9ff5-4bfb-9917-5ab287535078@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-2-l.scorcia@gmail.com>

On Tue, Sep 08, 2026 at 07:38:28PM +0200, Luca Leonardo Scorcia wrote:
> According to Android sources, mt6589 has 12 reset bits in the
> WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
> in device trees of the many compatible devices.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter
