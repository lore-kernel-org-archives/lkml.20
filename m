Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FE380FD7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199329; cv=none; b=ZDv6aZ1WFEuiSFwZDc8r7Q4g0eMxht/OOq3GRiMZXC9KbSLRgeVJ7I6FEaqgvMRcSoIpFyUW9mA/3cHi94rrkOi5AmpRyLzcgq7cRvC1ZUC2V9JlOmFEdaOA78VRKQu8y20hOzjZf8/7JJptBGpNxpo23ftkUcp2dhO/zdBjtPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199329; c=relaxed/simple;
	bh=/kc7PYWlypYVZP3WwE3BLRaLams28RAM1V7UJYCZVTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQWRIHPi4zaIsKAc8lsSVgV28FQXdR/XNCHj6R+uP/MDc/DumG1mSWOmj6v7hLuuHO2IrKYVLj9RWvDA6djkcM4g1fN7L3zRkiIK0wQ8+vcEbEIu+iwFtn0uOBUTiAa/mv7Sw85vGJ23/MiSBP4V4BUoFjgKyuqVGRGy7UEzCbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5rcCEH3; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5rcCEH3"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66e5d39cfe1so1655305d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199326; x=1788804126; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFhzGXcio2yqCPX9oQAAIfIvI6f1pTpkLcuZuvtREFY=;
        b=F5rcCEH3Vg88ikZ0pC1QF4fw+r833VIM+Dd9sXevExoHmo+bk69Y7oLrOceKyqQkGC
         UtHoKwqA7QBl2jvHo6t8pZ12gU6VWMHyW2opnfydOTyeN8+U30vvaYRSuMypJ/+fr8x5
         bR6t/2WI5/5tuWzGHedla/w2/+WWTIDq7TjDHwe9Nz3L6z3qP0084QYEdyddC9Yj9DS8
         jTYQRWCTUf5OnAlp4aRDAz9aY7onh9yS7wjJEpzYLgZ5RrrtJ5rBAsUt7o4Cr7gjyTSI
         8cmwadSJWoBkwHCMs9HTgPWm1+rN2ERmjsz4YepFwW7SHhYLGpD98zxOywSgXx8SPyht
         a8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199326; x=1788804126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qFhzGXcio2yqCPX9oQAAIfIvI6f1pTpkLcuZuvtREFY=;
        b=I/DJJ6ZGEJRq7mMtQl0t9dKG1un4QQehuuVFWGXeicjOZX0yFZsR1n35b2rwfa1KE1
         XFc6INktDFXLlq/F3NFx0niFehE1VPdy/a0pUAHWsjMslxWU2ridvzyZWcX9ht/Fg5p1
         voTDHdrNdzjujidI5h8daJexZxRdsuQigXPXEUo+S7Z6wfp5VqSYRFpIGfJvXci4GoCa
         Mq7axP0cW381ZKTbKXVLbXlZc7JZ1iH09sq7KzhctwMiXakWN+t6RTAGoR7HmEXr3Ca6
         pRZaMtGyQucCL+YXR1rQhbvTRDyiStzP1JqFsQiAo7Fm0x3l9F+UinvPy8qdkc37ugPQ
         R95A==
X-Forwarded-Encrypted: i=1; AKwUvBw9EeiQC1rG3ZIOAMyAES0GkcMIKGOsIEcDar5dv8FwC4/Jhlf1zFDUMaTSb1qt73a2c/2eK4tqrDi+P1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ljLUResKSoO+Q3PQg9AjoiXt1uBQCoaFijjInuRU+xNXrL5k1I
	HGDFlCL3wJiv9xmiT8lEJj1qlhZx345ptt6dq+sLhWYbJxbMA8AMmJ2e
X-Gm-Gg: AYBFou1BCWaFpOU8Oy6ipLQ/fXo4CHyR8uq5oOv73aiRwEnsRyQuHvWVwGvTbaEZLQC
	f7aBrnD+VLKO3/RMwIGscBKSPeFOIpPeDHaW1gXawdhWSnLkfe+qJKpsDC86griWCEep538vPKO
	MmgsJVSKIerEaL1a5A7f1VdaZZoTnt0y2kuZH5L717mR3z2RoIlCB2gWDCs8KGyd8kp9OFMreIo
	xWvxCxp56UT8cRmA5fEhppijdM87ihBQ5iS69PyvLWopvPsO5+z7uRqmOWX4+DurYr2S//S04ay
	0xb4VJxkhgwtTvgFN/iHFv9TDLyuQKaPlzU+LYBWIgjBmGODCXxYQ2IXaU/5E2SVi+oqeyJRRis
	ZROK/FnRc8hSKUpeZc6WvxcV4PLSt3R/dVML4DikeAMSI+UaQJb3DIwuj0DTnvPe4CH3AKPx3aF
	qfUNvctlYStCSrzLKnj7bcrmSNCa9iFCy07byetpNH9fzgvBLI9hzUgbAX0SbEAIcIOj0guE2gg
	KAcSWl8tlCMC9+r9dMr9EVRVds=
X-Received: by 2002:a05:690e:190c:b0:66f:7717:a700 with SMTP id 956f58d0204a3-66f7717adeemr3379779d50.21.1788199326215;
        Mon, 31 Aug 2026 11:02:06 -0700 (PDT)
Received: from hoboy.vegasvil.org ([172.58.167.166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ceb0a3a09sm73932946d6.16.2026.08.31.11.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:02:04 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:01:56 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	arnd@arndb.de, john.stultz@linaro.org, jacob.e.keller@intel.com,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net v1] ptp: fix NULL deref when adjtime/adjfine are
 missing
Message-ID: <apXBlBvh0vqSzhyi@hoboy.vegasvil.org>
References: <20260826101004.100979-1-xuanqiang.luo@linux.dev>
 <e9c97286-d121-40ca-b6f1-4c63641e7283@linux.dev>
 <ba8e71ce-42e2-4c92-b7c8-dd6ce900a5d4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba8e71ce-42e2-4c92-b7c8-dd6ce900a5d4@linux.dev>

On Thu, Aug 27, 2026 at 02:43:31PM +0800, Xuanqiang Luo wrote:

> However, the PTP hardware clock documentation explicitly states:
>     Clock drivers must implement all of the functions in the interface. If
>     a clock does not offer a particular ancillary feature, then the driver
>     should just return -EOPNOTSUPP from those functions.
> 
> Link: https://docs.kernel.org/driver-api/ptp.html#writing-clock-drivers
> 
> Therefore, iavf does not comply with this requirement, and fixing the
> issue in the iavf driver is more appropriate.

+1

Thanks,
Richard

