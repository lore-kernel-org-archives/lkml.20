Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB13D0938
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345089; cv=none; b=ARB42VFQC8J2NlwUewFhDsXq5pMx8O7jxoEfJ2em7d1SKkvNnYHpS94EE1w5MwvIqLayGopa3YfD9rE04uFQeJmr/Rs15tsFe24QPLTXdivWMaFSoygkMqDItv2HV2yM+2lHFt6g8blzjUF9NLhbAn3FHLuN114mrxPEC2BXUZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345089; c=relaxed/simple;
	bh=bbmOrdULgI/qG6m5ZYiQCPi7tLPM/ObVmBPDGixfQGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRK4pwAs2zZ4nFceWUj2WiESxY9p03FJOTC3v6uBzvFFsFYqM+q9OlFXPQ7AxoHHdMtxq4XcfNzfbOH4HQbo9t+d2Osb0CPOGOE3bcsl0KRRQJutLs1BHjiTcM/ERPDaTdK5MnyT0z0ZtD/BtjLZkbTjJr4ZSDyCvRCX+X/zyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bse5lbuq; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bse5lbuq"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so335323a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345087; x=1790949887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ovT80gQ2vK9hf0kYJwc2d02kOlcxj5fWOcjSmSVAXmQ=;
        b=bse5lbuq0gvMgc7TpvEmOoh8qKL22WNqcNpNIb+9sweumah+jqJod2zjEtJZjsMM3o
         huuG9V4aMgpuHXYYymjk0BdPWhfQShJ70wGOmsoSrSvp4D5hsZwsA/IQhkPe2w0jYUbH
         3Zc4oXF8o6/9K2av+z5o5pg9d9wxnPbXrX1yt2EFxTTsHtqWW2W3sn+2+v4ZkpfPWetQ
         o6QJKR4LNC4vVsIqz6UEn02+KhgQEdMAcSLdXM7drHM4lg0JY7VbMH2OMmNqxzM5Ezy8
         T904O4v6kL2Sb9z5kAxhynxfnYoS0eOvCrNomIRPDXMxqRan45P7EWx01DC0nVzlcu4L
         es/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345088; x=1790949888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovT80gQ2vK9hf0kYJwc2d02kOlcxj5fWOcjSmSVAXmQ=;
        b=2C7qSKb0P9QDiCw0pYVKG3u7B0+u14R1mj1NPFrW0EDXhJKdaqukRcj4jjS5CEc7Ye
         GZr43v2UDlCgOjavAOPfsOCrA8rvKjkr99yS4AwrP58ypBciuL9fasVCy104/sGGpj/f
         jdI3wzUjPNRPRy2Bv5UXHsnkknLe8ni+JC+UNrBD8yQBUsB7QT8C8mwFdv6nCvFHTGFW
         WH7xyra3VIj8oPTcMRBJJsFBbnCznIj2XUtZyfLrvJtesUw1UfoHm19uVfh8mCZ6xQU7
         VL2JihQZVxgK/jyZih7bNc7N/Rcd7a5OSJwcII9LbRo6CsnPmX6Bu6OMYcLPZ9MKodow
         CAHw==
X-Forwarded-Encrypted: i=1; AKwUvBw0HFPtXb85OoRO87ZVqxHtSkgRx0P9B+A6HOiw7m0S7cPggJh7vO4Aoid3jE5TwIqUbyaijjUcdcaFVRw=@vger.kernel.org
X-Gm-Message-State: AFuF++kaGoB1gj6e51UnmTmr62zxmAydJ1PxIV/M78rZjfa40lWdu7tn
	3yl2JtuIVCxc8M5JS+3lfU1BEqKelDwSOCPWAfODqcWCoJsO6vfIxTH9
X-Gm-Gg: AYBFou1CRidfovxYo0r0lRnVGX0Imz6vZhpt177nhBKeSwGLgJ2eGXnyAEZEyn5zpn0
	JiKSdU0HpMWLSi9LibRBuHH8Mhk4WsugGfzyI5JGoVVPTJ/j/vw0R3W6rO2f4H5H+Xwi8vmU6Fr
	eP00cUWoqb/FZSYAAtz2oEVFlF/ZntiQZ3Lf2FQJE1Ch24Udw0fM0U9ILG8WFkEO3+zlrs2XLY3
	MLrp5BrBZi7MV7Zf/pXVDr2NAkal2KSeQp3ziPOr1To/QwIko/vAnmNxjbtbV4QTYy0GQKE3y2Z
	qmyCtShuhomGUxLqLhg/01HNHu0LnfFKQWAWcxMAKqMws3afBOXwu6omG6+z/rvZDGcb3ZMONSV
	IEF9EjScnlZQ9e1cun6EKn3enK2AW0JxkgsAIE4GtjoqZjlLDQ2V0ym6cBRgnT30A7ceVWAcUKt
	LayAxgUxgtQOJ8uj5pc45ZTlWrxyvPozHSBW4C7tOHr52gM+gttak3MPxu9RO4NzoiGm0QQndxJ
	hq6a6qWm0aLZKuT8+jpeMQ=
X-Received: by 2002:a17:90b:3908:b0:3a0:c276:1ecb with SMTP id 98e67ed59e1d1-3a0c276224amr1313125a91.15.1790345087406;
        Fri, 25 Sep 2026 07:04:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm10983338a91.17.2026.09.25.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:04:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:04:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 2/3] hwmon: (coretemp) Read TjMax only when refreshing
 the temperature
Message-ID: <94dc8122-d6d7-40b0-adde-5e0cd7b645e9@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>

On Thu, Sep 24, 2026 at 07:33:21PM -0700, Ricardo Neri wrote:
> show_temp() reads TjMax before checking whether the cached temperature is
> still fresh, but consumes it only when recomputing that temperature. On a
> cache hit the value is discarded.
> 
> Discarding it is not free. On CPUs that report TjMax in
> MSR_IA32_TEMPERATURE_TARGET, get_tjmax() returns the value it just read
> without storing it in tdata->tjmax, so every call reads the MSR again.
> That is a cross-CPU call whenever the CPU owning the sensor is not the
> current one, and it is made while holding tdata->update_lock.
> 
> Read TjMax where it is used. The value cannot go stale in the meantime:
> bits 23:16 of MSR_IA32_TEMPERATURE_TARGET are read-only, and the register
> is package-scoped, so every CPU of the package reads the same value.
> 
> The temperature reported to userspace does not change.
> 
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Applied. No need to resend this or the previous patch.

Thanks,
Guenter
