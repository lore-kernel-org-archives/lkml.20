Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBA50EC11
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747631; cv=none; b=EPmewjfQiOX4D/5kNLsS3bttbPjTQX0L+SVZRBh+3ArykNkAHA89K/abXfYc0KHjMO60cT0LXFkZJTtxYVClwZIdgoM/JzdxAl7UGV6pF5DPVwQLPhPHLb+cMSjIB3CFfJe7zo/7FD06KJcZW+J4lWl4II/k4bbgHmGApTMLrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747631; c=relaxed/simple;
	bh=+fXFt1wmuGm36I/6m2mLaabGRHYph3PCUFE2O+zRlTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxQ/3hU9/O1u5CZpmMGfYUpPOBS3KP9sVod8kWS9j4TjR7VTXtvxLljUCwP/ivDRofLt5efirBsTMrubEfJdpoWDwKhjsVBt9oFfvHVVcPcypKHAjoAbZztKPe/SvRaQ1Go+L6TlBnGBSu2m8WvArE3dL/x9+7iUx4wevXKb+dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMz9yvFz; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMz9yvFz"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso1017934a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747630; x=1790352430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=oMz9yvFzVJohjoZAp+3wAr4UODJZWG7XDCY6QTsLxsQMUPcI6fb5KI6L508ICcRQEY
         wEAOxHpqxQrDEoNX5pYCniZ3pEp8tkQ5kbMBTtlRBFbj4gdGD0K7Punxoq5Og2DlLKBQ
         WhzGR7PP7FOy/OOqTMoUCsklyCtN261Tcchk0rtquY5REReuy6OSQ4g7cnkc0yjH2ton
         hiI5KrRfQxToUfYWlZ68BQVah39K0TFbAi2NdG9ty7scEd1b4yqeQ4Q604hVi5XGqV6F
         n5PFEePLChw1MFUb9CHiVdzPcBVbHLwrIN3CBZiIXE9ORpFbQMSP3XFgxxT8RuNFfhwY
         a80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747630; x=1790352430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+a91oW+XEpT6uwd1XGhqfpSXASpWO0V95HM9oxBjsHU=;
        b=2fg1MclKGl1BDUiSMenl10EGsFFAthIdQIJaPqveA7tWyVZX14ICBMzjXx2ZnXMXMv
         NU9gscs8bYL4mvfY4dD5Yx+aWs2WZ7Kb4ktH9ADXL1Lr6f74H/seGUxJyVPWJfLEufZz
         rBRJMydVO0JbBGBmjM5M+kAbx+ZkF7SpTboj+ggfAwjLZXXfmQFD1Yy2edzoeKa83jhH
         a9UXhuWcaYexM4e2V4CDkWc06GhCNqW9K1mfO3wRDeh05hWhB3oTIkT6QA7Pm9cS0A1M
         0bx/8B1dxkPA/TPvlvlVFxQmil/ZR6BP0KOU5GiBL67yVm3zVUiBaP5rMklIEIkn09NB
         5/qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxDhPVnim4wk2tvP7DggUxpoA+y9M7TDStyzF7Fibd9NfiBTkQfpO6pIMr2h1N6U6/qjQcH5iLufGrBVc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDU7T6RY+Nh2hgFm7M5GpLhS/GovTvsPiKWdFOEDGFi+Kw3mRU
	7MDMYezUAAG/eBRp5RUMy8wq8LPMTKaxd7ryRSkuzeL8h0cLlFXUPybI
X-Gm-Gg: AYBFou0RP2bsx52QS+PduGtajMVmQVvFOe5Q8KKHHM9CXYfZDXJGep40BW8aot9eyFN
	9QKjdfNm3Q+XM2wD5snIy2BDDNNvHvNFUg8Pv0bjjIsz9UnzlNsPzVOMqzri+AMc0DaVvm2o0wR
	kbMs9JjFsFBfMZWURCW/JCOg0QaZZfkqW7PazMudVMxAFwe0P5Dj/t47kFZTOtZiRRidA+XzEGX
	C/brIUtvXHjTpOSQhTnPBgoeadutnhFLvxraB3dk723vOqgileJwMD2YA6DxjW5AHXHZQd9z74/
	e8s749JXCvbUPiFXP2g88Tuht8ooSgPQF2XfRyDydRe3Kt4lyjNXMgB54RnnMvJTT5tG8Za/8CG
	bfwWpxKSOnN9bNZzPkS0ENoa92B6hbF0kWkGAqDhPq66HJJDgnpzllnvIvE70AZpIujksGdy9P6
	yrMUP10KgmlHPI3mKx8BZT8TtD3mp+wfyi0RKpcCKoFptGmElvzu4ni7AoFsLl/qiAVhC44tmU2
	q7YhU68r0ld
X-Received: by 2002:a17:90b:28c6:b0:39e:6a82:afd2 with SMTP id 98e67ed59e1d1-39e6a82bbccmr686160a91.36.1789747629623;
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm39043eec.0.2026.09.18.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:07:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 09:07:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at
 the schema
Message-ID: <93b9a44c-d595-4ba3-afc6-eb6abf0c17c2@roeck-us.net>
References: <20260917115818.540344-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115818.540344-1-quchaosheng000406@163.com>

On Thu, Sep 17, 2026 at 07:58:17PM +0800, Quchaosheng wrote:
> Documentation/hwmon/vexpress.rst points at
> Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
> binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.
> 
> That file only restates the compatibles and the label property, which the
> arm/vexpress-config.yaml schema describes now. Point the reference there.
> 
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Applied.

Thanks,
Guenter
