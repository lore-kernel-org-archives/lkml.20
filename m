Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BB4BEE43
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222960; cv=none; b=QHQANiXmYA9UrirJELQpXI/xIjGGoNf1JDGUaoCf0rMbdHRZZRD5JP5tIlCS1dg9XS+96iucc5ysaaRafNiCZtVM5qDlka5vh0+yfx89fyTu4YL6qTtKd64qMUIJcT6zTHOvabwKwEL+kc9tEUlnPPO1h4/Ad87Y9kFQyoxqJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222960; c=relaxed/simple;
	bh=BW28mE94cI/hgrFj+e0ecUVL8i6tpWUZ63tepiAvA6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOLQxRaxSLJYpdsfCR8y5RYGxFqPdnhK4AaxfM3yQtmBo7Zq/HTPVeb/5/TTcbp3J4XtKNKHvHUJa+DcCGKhf39Yk94bulvXok14Q3chatsXGD9zSSxcoQ/JtxnzOyUgKK4EgKVc+C+yH8Er9ACmqJh6aJZLip5nO+MJy7S3kZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOwuqunN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOwuqunN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2783661a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222957; x=1789827757; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVt4uFTNHgLhaLqB7E8cbha4z4fxoHkYOO2KRoI60Y0=;
        b=WOwuqunNbHOx2sOl3QCvgT4c6DzpN5Ha3wI53ThQvlJ5YrBB8NCX4PDAm9d+4LhmQp
         XU3raH8AjEWDj1tzGNBFXB7hpWVqmNPyP35xqqkXKdBs+/wkfOTish8RANpGRJAoMCmd
         FtAa4GhsF7ADTVZz0qkvru7GUnm0DEwG3lOyU0+oPk/9Edlp3fyHrhkyVFMeSuy5SmoW
         fNKNo1A1BdOCu2zBfHbecjgaAU2t2/W0I5ft/yd4I/HhTQ1XxkF6vHRgD8qZfZCvZh9J
         xWbg1CtkHWI7M2f2QE2Oxaa0UsygIZHII/rKOpwm1khCYMwnR+gSzaLjeybIv/NF+p1W
         kFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222957; x=1789827757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVt4uFTNHgLhaLqB7E8cbha4z4fxoHkYOO2KRoI60Y0=;
        b=Gl/puJirGjMXhBBDhr/RlCywOQZd6kTaXhVQfeZZ3SzgpeXYmdkCW+7HxqCHQVgZbw
         2Y3ev0r6TlHewXe+M88LBvB29jRhVt1aQSOiyvsAQVmnDKWdHfqQ1qIFNURckL1ntayF
         w3MQf+5Xlj1AIE9NHCQJlzPRrj3YCAqtYhalFaEys1PIeXfxgBMQ+i1XlgHs85mhov+L
         7332kAJZTBiKpVjYQJFFiCQQj2nTBceQn7TzZpe5vG60uIcysa2fLnYV0JFMCYvlYmzp
         8sIt1ycc1z8tGec7v9JlpEdTvvBvHVYzWB5kyqx4ftbeKzff5UU/xIwFD+MjBJvzF37V
         rS4Q==
X-Forwarded-Encrypted: i=1; AKwUvBygVAUA4l8EKzrrO1WeajaDTWDW2hwDMdRgIr2Cn5IMaGI7s93u5K19SSK4MK70VsbRwH1GWqLXqI2jQlI=@vger.kernel.org
X-Gm-Message-State: AFuF++mb7amXSPs9+6YF2hXwNiiBSB1DOY4bv9FHyqXq9QwENO3Cy1gz
	8xIJsCptHQj/95zrqcbszxLXwXtjrLMS4kMdd1mi0OwZQbLx04VjFjgr
X-Gm-Gg: AYBFou3gAly0iH2t+mHww2/SyUyJAkF8ahKFFGMag4CzBWFv6MSDeJIJMM9OchjB4AO
	iuXfTSRlYk9QS4NQzrVOoI/ue2vpV2lU1MBVoguJnzJQ0ZuMIb5tPZnBDnadEoX4Vw/rJFBlYF0
	qF5d9ccZmdCm96VHIBhuuWgG4xBiAZylShxw6IDl28RJ4WkR1gEKmOfbPt7s57Ec+VGW4bR3RJK
	+luw3VcoYLwyopGJOW/FYI9Awlpw9mtHbfFPh4C4wZYKq6HkEHK/x1+f3TRApyBWxGStRa9fPTj
	YqUBscwdnpUoRWDf+tmun5Xu4LwthnDLEqghKAoYLq1KOuzsHygXbZQEEEOvnZ4WOvbGhrXSDa5
	a+XN5yHW/4RRrRhOVys+BiCx1b4F14X6NX4Rc2dQXW7NONAKN0ncmyMirLUHxNiIMnWl+tsKD40
	y9nQX9uJwDuunAUU5ofGrV8rbAsO8nl2eUiiF8ZWF0iJuOdZ6RUdOV9TyXAkqY9Rx+5O8Ut/ifb
	BX7ruRvPfTW
X-Received: by 2002:a17:90b:35d2:b0:39d:8d38:8b04 with SMTP id 98e67ed59e1d1-39d9bbea1d3mr16345801a91.1.1789222956866;
        Sat, 12 Sep 2026 07:22:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bb0119sm11167533a91.2.2026.09.12.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:22:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:22:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2 4/4] hwmon: (pmbus) add support for MAX20826 and
 similar devices
Message-ID: <4bc54f30-2a0f-4aef-bb43-b7305f623c74@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-4-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-4-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:40PM +0100, Nuno Sá wrote:
> The MAX20826 IC and similar provide a high-density, flexible and scalable
> dual-loop solution for high current cores for AI applications. These are
> dual loop solutions multiphase voltage regulators. Between Rails A and B,
> MAX20855B and MAX20908 supports up to 8 phases total configurable from
> 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
