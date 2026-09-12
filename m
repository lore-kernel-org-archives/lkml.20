Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC233F5A7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222864; cv=none; b=Z7DGM0BOVaOS90GvROAvzseQsazKgXEoIkewXXTyrIl/6pHbHa4nLA6X2aCqGuuOXfjuJTdVr7s2RRTfB9L5jkwea30NqMCTPuvJ+gy3fu1l4UPEBzs7suJpnrtPlfUIM10CSxjXyp5fGtnjFSOjJerWZRQbGvcl5TN/deohuIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222864; c=relaxed/simple;
	bh=Uiy8nevCbQFi+tO7PRMHhK5e5/ieop6sXofJo9kMfiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDEYsScAjTRLNIrE+ocmw+EEv6TjXltWQnjceQZVrnnWwa90hgojodh/MWxDjPjD2Exee88t/gws3IGhIz4p+/CBxTI4i56vaafHwp0oWKJdyYmBcQacO4fbJACLyBvKLg8p2TmQOaaSDbSXQ9J2IaEkBA8rRiQEwer+Jwo0DMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4eW1a/W; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4eW1a/W"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2682072a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222863; x=1789827663; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHeNLogRQjCpZaDFq26lFx7YUh4OKGaTu/lrQFFabec=;
        b=S4eW1a/WJY0sJgpNhNHwz+iZxFN9+fQfwkTp+5w+SI9Jz1DZ/bgSz1PUpzGrdwh4n0
         39gFa2CbNbIs+iPErSwVki75FdeEfL5ljaoF4EYJcLLvo/NolOiX7t4adSSyeG6FvVQi
         XRYaVqrzmNC0fzpLBeKP1AqQD2O+uEaPSRg9knE6D71ABERtBBwA4ChfGdstUj/QwOcr
         RdVwEE3wrqWGzq5sDo9nei6OaESl272McGEKQX0zHSOmqhxsi6tRgM+cEdvjFkurmxML
         b14xXksmhv8pjJs7SVGXU2NJNsr/1n/L8tCDvbT7BHdAoWIzY/80V+ZcWj8uaFL1b5W+
         zPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222863; x=1789827663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHeNLogRQjCpZaDFq26lFx7YUh4OKGaTu/lrQFFabec=;
        b=OPxG/0GGfEMajriZfi3VZMyAbHspGp5WfVDRQn/MrAxGlkVt3zvkRkgSNvCRL76WrT
         hCjDTxVRLYgVPEEQbUhMDMVKwnPlmTbCyVxDogNXwyFJGtfxFPdM+SD0/fl33Cm41EcQ
         oXtICACYTQ/q32T1HYskludKVZ9IHJLiBiHtpv+g2tdo8jWRNINYVmNyeXFe5lgAbLXG
         gfBOR/mjLYHytvWmjOl/2JRS5IsqGb9gJNjkvGsJWgQwgyhG0H5/VZBMXZwwBC7IhbW4
         PM++galozo2iOrE31NBG4/jtEHYjOgk6B/ImN2AudWw0/TwpqwSPvlGp5UVSu+WYv47k
         qSBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQBKtQGGygWKussD3X1Gb5f61RA9nabiV9RQLbt2YRao8uBD2LJQVPB7Ajy5zA61Iqs/B31sP6esAt7vc=@vger.kernel.org
X-Gm-Message-State: AFuF++lGPLFsnigsZ0YBPcJ4yQ5B/Qqqkjwe+PaCrXxC8raMXFyDweKC
	k5uHLyYkalBNvPYuusWI6CJZN40bco53PzCMJ58ay80W0XglxKUDFoJD
X-Gm-Gg: AYBFou1Z9PxOJgOrYAq3HXJmVLEEz3IyPGqPDSmOaq249PyIqjjq9ZBLZE3gi6LU6KK
	y1NAyyxrfGPRM0Lx8nTOuCR1nzRBO0muX/gfbja3zTSjU+nmVrcBtpnbv++7KEZJ+jisptpuP/6
	c6Z1wedcspHdDuAgRLKfY79zYNHGeBRcornNiCP+WrM7kFs12OFYZgSFXp4uxyGCcK60P6HJ8vO
	eYntcNp/IETXBnyrFo/efwsTirnxHy26Ow0CU4rmipORkY+hSXhjo5fXwD6YTVfWG5eMSk45Z3b
	9mEnPNumgTtTNn8AmvOzdJ6fXScYLmn5U0ZOnBBhcNS9Ste0QfipL0sAzuQLc/WzQEJ73Nmph+X
	Edoz9XGyaj0ZNeUfc95WNHMP52cLxXGgBVAU8Y07BhGxmxKNiyszt55dfP/FEgwISMxxhfITBg8
	y69N6da+TQtMyOjhYZRt18YioL8wiOnuATZB85F9WBBP3Ak5ZKfH7A36XgEIVe6/KaZ8JwdK12P
	eQSr431NA2k
X-Received: by 2002:a17:90b:5823:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39d9c0aad8dmr16717402a91.16.1789222862658;
        Sat, 12 Sep 2026 07:21:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm10643910a91.17.2026.09.12.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:21:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:21:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <a4e0335f-7724-4bbe-b624-2aef0990dc8c@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:38PM +0100, Nuno Sá wrote:
> This is in preparation for adding support to a device which needs to
> use it's own read_block implementation.
> 
> The MAX20826 family is one such device. When not in PMBus page mode, each
> of its two rails sits at a different I2C address, so selecting the rail
> cannot be done through pmbus_set_page() and has to be handled by the
> driver.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
