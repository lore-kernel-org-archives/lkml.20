Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2C74A2E20
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399628; cv=none; b=bMzPc+7siZjmMJw/ymwClnVfjyKhQIDMFNXMrLPmN9lvCz5S3v8dP7j3pmmjRG0Mspt13JNY1vThREjZtwwEsbUrCyWxqyKuAlyExJ9/XLypcYhlKV6KF5gpcyHSAIyT83MInszMcDVyxCRL64dJqa/AOAmQJHJuMXoJ/zBFszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399628; c=relaxed/simple;
	bh=VzeJEVXSydd4pMUvk9yqOjcNxVq4nwrj6o3Y3f+o2kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToRU8xH1JF6ucPB9jh4r3294/5obfyZuJaTk0iC2eky0aqrXzimLPqTwd+hiO/Qp8402Um8cuHEgzO/DyCLFuDT+7alVOcuHNgWYm8YdpblYFCliXAICNMQH+46pdbkhvdH39ld6OYcCDyM9S3AxKKJhKAG10GT5XIJ+vFjBF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKmjJgsY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKmjJgsY"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f6so14169155ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399626; x=1790004426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=oKmjJgsYAj5S+Yp+SBg9vNCgkVaENatjOEuHEvv0VwlTi9wgFXrLcv4pTT1N4KEYPD
         0IUmh3kI7uvYkLF58abHh/EYlrro9L21HPJeOcjKN4oz8G/Xz29d6lQ/L1Y8IW96HKeX
         fl/8Vw1PRwfT4q57qc8T8NU2n5Y04tasuT3tYJsWvcpoxk3nb1aA5pyi48EjkI+395SA
         sfOi2JXSF5O8yfqnqN8ghtfJB5HWMs5J6sWgfbbQgzDJAOIUtDKb7sBaC1wMNfU0PcTX
         IfN1ZHLDFCJZzB1LG2D/O3ILYk6pQFgmW3qalP/sqRsQU8GfSKA+OeLKs+Rut0Xv44fP
         wg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399626; x=1790004426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=sAJXw0/sXJVlkWa53R8di4c0umBJpmJlNTC/WMu/lZPcn4E8fKw2BJzzm8L26R81FL
         Qdk5KfwTV+RpKACQ5ASTWkDRw6QfQ0IyXhX9VTITXoocklezBA07jyH+gP+jop1dYAca
         IE9fFuS65w7CT+Mv/bUeZFVs8bUtpi2FcUx2adZ9lwHG6r3jp20dcA0aeniuB+N0LDjx
         HAstJz5lwrLSPgqrKjJrExwl2I6joC77r4O4hjKJVU38TBhgiywr6dNI7vekmlNkclY9
         yV1MZcL6RPbeJvizGxz+bbv9kLj5sp/yOJjiR+opgZIF2ZZ0yL1gpzLhssB6tPiDHtXr
         khqw==
X-Forwarded-Encrypted: i=1; AKwUvBxA2jW90TC83uGf4NsWaGTDLzlNWecF9acUX7Mwh5Gax4GDnQew3OOd4waga0C8YfLI05qoPN4q7erwZxE=@vger.kernel.org
X-Gm-Message-State: AFuF++njL4SHh46RW8fTclF4BvagFwNKAOZ2OpZeZLATqVIiclvpbPkH
	JYvGZsfeWo1IiK8qWP/lxg/X0W9rhXaM9RnFfHM/0eSXKO4GZYEMaacW
X-Gm-Gg: AYBFou3A7wrRjlf2RYPsZf1YsVcBIPD3VAbwPDfOYfwC7Dfi6Nms3m9iuWWVunsNtUy
	f8MkneuTA4KAN5MYCrqRZI1tAr+cCnmljKO84m5vrcGhNfJH4RL+sv5a+8tYqBOQCCeLNJfQ+ft
	eZQWIOFCftaRTSHXl8R+2P1lfTdxsCn8lctOooOc+dZML0eL/ULTmLO3+wPGH2lodfxxSOJHQ0h
	yrEg8A59dvoohLKccBn0SQgfUpHj5/rFOzo/6xmiSkQtKW0S8/rfYqzGercXN7kxqgDzTgc3/Un
	fILrMOqtk2XoJXW7jF0K7ssjR40gOmlPfz0k3/qZHcUoUJJnr1QGGfYPaqSoo+/qvpFxNmQ34BT
	6yHEHnu9Tn/k31EkSs0VQ38ExtpSRCZapkd6Ol1gKFIQX+yIbRGTv5vIKp0LiRHZlpYma0Y0tzp
	NhB/bDrbf3wrGBlyBdY8KDetMrbPrVP02mssONbDiC6QdvMsX8L1adv82Blr8emRO6+vHR2byog
	vk2iQpHGfYM
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr77776255ad.16.1789399625921;
        Mon, 14 Sep 2026 08:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm51774945ad.54.2026.09.14.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:27:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Message-ID: <f9a4679b-52f3-45ea-b451-26c27dbebf1e@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:54PM +0800, Troy Mitchell wrote:
> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
