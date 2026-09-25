Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1560402B9E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371433; cv=none; b=X90w61d+tBMPv14I8xWATxufHrH1UbqMhu7mAwpAsQdvKHcCmV+V32kUKHMF8TJMZdQFsfE+TRy9SCdB1sz/oT3EzQMdLI241m9sbT3AvOG1xSHoh8JZUt1hsn7Fn2Aa87QmV9C4opLZzjHMLoODq0v+AnHkx4XrB8YyJfdDhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371433; c=relaxed/simple;
	bh=mq3RWoA/hcd32dCL//3OXdHccnRftC6Ctz2XilEVcCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9o8AJ4lS0Lpf8r+DGsjL3Ilrr4RFC8VHS3sVU2gIvAFQ7nmn4IMQthc/cBNxKORnfwLMKk5TIOcoF6sw6s8zfU3KDHjniV60rKpDG7K3yDvkSZLYCObn6kOjF06Dl4DpZUjbGkKML7bxmbFZtKDJZSqhL7joz9x0ABbiWU7i8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIR7bkoT; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIR7bkoT"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc794a06e5fso425332a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371431; x=1790976231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5oelsYzBnav4hrJavpxK0ZTVgzSWbj7lSOhSINx8zCc=;
        b=EIR7bkoTQzM99n4jBSXUx6EWBeqX8kEMqLh3baDLwI3gmyv6Soy7T+zvQjAurh4Q80
         5FqjDDTFQeBWGuy+lHfikc9Cr2PzJaL1E3BPZcC5577GJCLBjKdgNvYTxis7G8/+ZA8U
         2z4M3yVRI1ZlnNydDA6u1dtLRfY2JPJtdu6204Rsb3gwKNus6MTRM+8e5GSDYu2cxaMN
         KvsGjDLUztnBmlZdI0rB/v/QpLcqSVVDoZeOIUH2qleqjNNxNuwawgJdopkXX1g4eZB4
         6zowUfD5SUePoOU6Vd9JsheWPL06G41WuoxoL9A42Tm2JruNCazUEAGgz2IX4FMsgLG8
         zpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371431; x=1790976231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5oelsYzBnav4hrJavpxK0ZTVgzSWbj7lSOhSINx8zCc=;
        b=uRBfltwkjlayyT0mxChaQ60CxnjfNsv1i9oAip/4j7LOcqIkpQU4TGZaND1CtYiZUt
         qO7QNw6ecGQXtVK5XEDlhjPxcMkpsfH4YkECvZe16MTWod97jj/UYnHIctdk9rwSQ1nV
         D2JP7eVud79UuT2APeDdQ37rt3D8QNSbq61fkvQrrXqPqpl7JrEJ6E+mWgzl2wbsH8lA
         o0d1j7VhogcL/mxo8/zhxyqc8cpXvRuUAVvY2Dui6JAU2lItxsuZNf9VVT0Lxt8YBAab
         dYvZA5KW9cOUG1ZmzWGkrly+pRvWOGHn5zCX9RmXEyMxMeij2zlYT1MMX44WE/SkEywL
         7glA==
X-Forwarded-Encrypted: i=1; AKwUvBxSrxUlFyolBMow++jg0KnYizs09YZ6ike/aQvMCfs7hOTgLyDpa7kvm4eNTksOaxn1YiXiq4lQYpPzq0w=@vger.kernel.org
X-Gm-Message-State: AFuF++n7wNT1uZbVsIum9RlsLLIk3m6Pc27j4Cme1nofTrRlJRapM7GY
	MHK5NRF3YKLruEHYQh3ntqXBmNIVCJd4nFkAf3VDGcsVsG/gQ2/DLiwU
X-Gm-Gg: AYBFou1NY1P/fdtXfz2xlRaD4Wy5+9d5kc1e/2596nyYtuYyzJ3yrayP/3KFPzchXIP
	XAB8z3Cx1UiHSdFchwNSaNGuOmLlfvRgaq5DUM37sJ4p2inPiuX1uQr8X37H8AKCJRtNc7wgH/4
	Ej7Faf1R8iai4vLURurVipUIALcQsHS64p1GTTHM8d+/7dbhaj23ZMEy2Ks1uQeLenzcZWQ2o54
	1ehUVpLKW9HM+7JFNoZ1j4oSQ2E7QZW5A3ArvF6s29bQH9gzGH04/vFG61KrOp4UYuKnn8ogCEy
	BZllmUEHv+gdqaxZvfx/IZXVIpwyoq62Oqo3KDoxjw8bkLBTkgqLCENEgu3laGBcCXLaLSmSAK2
	/DJu+0juqHMqgOhLyP/HhTDynmmTEGDneBxaawOiu5MlUbNGSHcgNcXr1tDeok50uhYS2UcXtQd
	2IdxIjYc/TGcajfLRn1mFY7p3djrMR6fc8c38oWavT5iXimfB9Rd+NXu0m56M8G9evdJNuz54J0
	3vZP+ANPDId
X-Received: by 2002:a05:6a20:d70b:b0:3dd:a196:69e2 with SMTP id adf61e73a8af0-3de26f2927emr3172381637.61.1790371430957;
        Fri, 25 Sep 2026 14:23:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796c314sm1850422a12.29.2026.09.25.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:23:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 14:23:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 0/3] hwmon: (coretemp) Report unreliable temperature
 readings
Message-ID: <254a2bdb-c759-469d-a1bb-c10f476cebe0@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <46f9f319-de71-412f-a424-6cb801478456@roeck-us.net>
 <20260925182158.GA27122@ranerica-svr.sc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925182158.GA27122@ranerica-svr.sc.intel.com>

On Fri, Sep 25, 2026 at 11:21:58AM -0700, Ricardo Neri wrote:
> On Thu, Sep 24, 2026 at 07:37:18PM -0700, Guenter Roeck wrote:
> > On Thu, Sep 24, 2026 at 07:33:19PM -0700, Ricardo Neri wrote:
> > > Hi,
> > > 
> > > Intel CPUs indicate in IA32_[PACKAGE]_THERM_STATUS whether the digital
> > > thermal readout they expose is valid. coretemp deliberately ignores that
> > > indication, for the reason given in commit bf6ea084ebb5 ("hwmon:
> > > (coretemp) Do not return -EAGAIN for low temperatures"): some CPUs clear
> > > it while the temperature is too low to be measured, and the value reported
> > > in that state is more useful to userspace than an error would be.
> > > 
> > > The consequence is that userspace cannot distinguish a genuinely low
> > > temperature from one the CPU could not measure. This series exposes the
> > > indication through the standard hwmon temp%d_fault attribute, leaving
> > > temp%d_input exactly as it is.
> > > 
> > > One user-visible effect is worth mentioning: sensors(1) prints FAULT in
> > > place of the temperature when temp%d_fault reads 1. On a CPU that clears
> > > the valid bit at low temperature, that core stops showing a number in the
> > > default output, although sensors -u and -j still report it, as does
> > > anything that reads temp%d_input from sysfs directly. A driver-custom
> > > attribute name would avoid this, but would be invisible to generic tools.
> > > Reporting the condition through the documented attribute looks like a
> > > better option, but please say if you prefer otherwise.
> > 
> > I think it would be _much_ better to return -ENODATA for invalid readings.
> > This isn't really a fault, after all. The sensor is not defective,
> > it just can not provide valid data.
> > 
> > With -ENODATA the sensors command reports N/A for the temperature
> > measurement, which I also think would be better than reporting FAULT.
> 
> Thank you for your feedback and for applying the other two patches!
> 
> Thank you for your feedback anf for applying the first two patches!
> 
> Userspace has seen a number in temp%d_input for over 12 years, and with
> this change it would get an error on CPUs that clear the valid bit. I can
> certainly implement returning -ENODATA; I just want to confirm you don't
> see this as an issue for userspace.
> 

Userspace should be able to handle error returns. That is not an ABI change.
Even if the fault attribute was implemented, trying to read the temperature
should still return an error.

On the other side, claiming that the sensor is faulty is, in my opinion,
just wrong. It is not faulty, it just does not return valid data.

Guenter
