Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4FC538D7A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170230; cv=none; b=HEUrKEuIsWr1VyQQXlTwWjia9Iw7PiHX1w5Nvz9a/xMd2xkZF7wI3yCmXb97LZEtpHXj0Be09uIpV0/lyeaEWHUUb2rjro4myAQHUpLgrwQcsRQZ8+fZgrfIrOhasumgy1ypjSyCfF+fMktfSdGtIiIz2APsrO+xfU/vvg3c9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170230; c=relaxed/simple;
	bh=EFCs/t5NZCKL85wyMYHIYg1c+baJsqxbMSrz9KygYjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDQNRzs4RmstfGeA6Zo8TKv6g7q41ViMSe9rmbMxCuRunxIm1Bawj5QKsLvq+fPlymHZ0UE/JZ5fwTzXynoIrX/vJ/fUnNJiHjaUWbLwIbAuxJZ9JyBFmpvx+V+kqPpSzObV2ZffcU9gLI2BsvBQWdvhsn2yuVQCqTliZ5w5eDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXQKRn7m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXQKRn7m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1546685e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170225; x=1792775025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=;
        b=GXQKRn7mk/+sRKiJm4MLPZY4jflJ5VVE9tCA8pdF77HIg68iYxmO7X+hO2O2SLoBI/
         zC5K1YNSrOr8r3/NK1uEdqTeQfM1qmKbpY47e083AcnBoHX4jUTt3skZxuLI80hc1UDP
         LW8T9NcAirgRRoUbMujwjsAgkdIfQTImIEKWoYfAjZjDQ/dVfZAizAgAbEhS2TsLzyfr
         eVKBJfLtL+h6h/GYmBbobDLaxOCS1qERkFPJIUxvIXd6URpWH1dSAsiCV2uwD6HqcBrF
         SW6R/GCcuaZ+FvFOI/z/QZBaVEt2/a2BXTl5pOD6YaF0QBTyqP1helMdBwd9S5206HHv
         nrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170225; x=1792775025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=;
        b=lMNHhUSCVRQt/iPfYTtWx3RoEoBIHXIfzH/9PeTKn3uILB+qlD9s1RpOSSifKPgs9g
         3gxDEsY9zWUhAHx6padvjxodbz4P8KW0PGP9vWmfXLsGVyrBIYAfgcrhTcDKnFwtbDZa
         bS+qbee+ipziJgUTnmV++ay/UM0VaFTrVjwaXKx8gbedeI7NCZsfulnCRKSccTmeezcy
         F9JdpgMxgrhVF+Hh779DQ47Y59r8B2KOSrqhC03pYBWntyIMypRIaBIC3yGGhVXA++Tq
         kwJXUTE26MP4zOcs4e49798CjJIy18mAtfUE1XicOlKk+gTWzVpJxnA3QXAsJzez7aIt
         RZrQ==
X-Forwarded-Encrypted: i=1; AKwUvBylO9zirR11Qg56hEyTFDyE4o1Xjb2r/8tez84HtGy2vFHLTVkq/LspXfFdGGOyvdWgAzu3mOvOYKSPNX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDCqCwOrWGLf6+pk7WBTCXsrPKpKg3gO6AVKhDTvT98cjYUsqw
	DKXe+yr7NCj4FhR5xSPm77B6fVRsdZrrDIMH1jfbbIh8YpZfL3FMvLnw
X-Gm-Gg: AYBFou0PDc2VSv4YMOVdj5EqKUEDvUSzm/kGsxpjr3DtBGysFCTZGEqCM/0C8ZPCWjg
	5xJqW4T8HSfMup1RN4Co74qEw2OPJcsW4ITmTz9GTUisbqAxu3KEBgrD7FtVUlN1pi64Ote18qR
	zSU2D8MujaklMojNq3Wl1lbhgyO+pDelAds9zLK8xSQK1oFJCUPMRXaxmVT1ynGowBz0t/rl/zG
	GVfYN/Jt1Pw2PNPsTiZW3DlfKOmhaUiYYbnyQ55jljNdoAcckatvOgvLvspDkhHrKl9bE4PdJZb
	DhRuYAXTUYGtkTaylIQSYSbPhS8rC+z/0KYNbthGW9SXRsmXlw8AMAq08NCuace8L1UEWB0FsO7
	fl7PFfS0oVQpZx26vgMKkMc4+4XVPNOlq6aPYqPHSC0K6wMWhuJbti2g/5pGoRMF5SwZ0NVYQv0
	u/zD6mV+eY2XTYqGCRaVDHGb1Ci0g6ZA2N5SM43KW7esPC2tOQhshha4zhRdu1PRp6rEZlcp/ve
	zDXg1pyt+ovOCM2S/k9dLUTN/xwTME2GtEBpNP3CL13GOJktJiqjekGiUESPOtfWtb09Pbf/Xa9
	PcdUMVr5MgAjUIz0MztKdDGpuQPb6g==
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr10105175e9.0.1792170220437;
        Fri, 16 Oct 2026 10:03:40 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm186598225e9.10.2026.10.16.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:03:39 -0700 (PDT)
Date: Fri, 16 Oct 2026 19:03:36 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atJY6DzjmAeq7U8q@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEci_KwxUdvAekv@SMW015318>

On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add support for the OV5640 camera connected to the Sonata carrier
> > board's first MIPI CSI port.
> 
> Does this board only support ov5640 camera? Suppose ov5640 module also use
> for other boards.
> 
> Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> to define connectors?
> 
> Frank
> 

Hi Frank,

Thanks for your feedback! I looked at the Toradex approach you linked.

In our case, the same connector can also accommodate Basler cameras and
potentially other camera modules in the future, while some of our other
carrier boards use different connectors.

Given these differences, I would prefer to keep the classic approach proposed
in this patch, describing the camera directly in the carrier board DTS.
Do you think we should still use connector bindings in our case?
If so, how would you suggest handling these differences?

Thanks,
Best Regards,
Stefano
