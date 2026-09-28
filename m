Received: from mail-dl2-f39.google.com (mail-dl2-f39.google.com [74.125.229.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DCC499F39
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593321; cv=none; b=gQitCc6r1ekSui5wa71NW2qQe06R0dXL1+AaMRkY1LOK4mV6cNHlI936OF0w9OpzDRS7OgO3CTD8HAAY0d+D2zlZcZ+mbRl6nKWdEMKhcdjnKigOmN1Ua8oxpucQUj3Zm8VxG/pKwhQjdKibHW/deII/EoT8wx1A0+pmtCfL/hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593321; c=relaxed/simple;
	bh=EpHly9E+981C+c1vtA6w2BON8lZnsBvam2ID0GFcMTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvaJzpunTzwFypqWTpTxr2i24+uG+OWfy5ul3Ka2eu5PGQ8lB7xOiuZp4uP6v9BLGM6uWG1mAwLvLfTiKkA+yjMXEgmOesuO5+ygAcK2N3YNkiJo3ppDKHLmvPrVlcI6BHq17gFZ+ibKuihSNKUFQWbYDq3PAksOr5otPOAV1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhjlPv18; arc=none smtp.client-ip=74.125.229.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhjlPv18"
Received: by mail-dl2-f39.google.com with SMTP id a92af1059eb24-1438cb9b3a3so1602055c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593318; x=1791198118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FHMblOjdLg2pAMWuThXs7bWGqQzPDk/K7b2Wyi6dfA=;
        b=dhjlPv18zuJQrl6O8wlQ7Lkam0/ZehwC4E/YK4dMHSkMcAAcZKF7vI153twizcKeqk
         UtXgbJRCHwz8HQdZlrzVmQ2DkhlefwJqV9IQ1tMkEwczEeNmsS4IaFy7lsF71DOzhdGf
         lAVq2iCAM6DXFByvdMirZRjlonLvUh0yXQyEvgaocgimSWHd0DUQELNxOaYXbBPaZRwL
         tAwMC0hAqQ3aBOZBxcdruELHAELqbF2LaOCpKdN1VtUtyv6C7G1O3X8ziUawkvxojlH+
         BlY7SkQXc3A3rjNTEPin31xERXn+CBz2DDM366sseNKiVGQlCeU0EnQxK5fLkAcx4fbh
         QzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593318; x=1791198118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FHMblOjdLg2pAMWuThXs7bWGqQzPDk/K7b2Wyi6dfA=;
        b=y7wSIW5VxHzzU9Il32yR2XR2AxUSomSegdxkXoi/eDXxi9Us05oLjyA2s3pEAxObnv
         TGIyPylFgIsbNzcpo1wCk8wOb0UEyc//eGKbwlFe5C8iZDG04GO/SjjGFGzLXaXQKil+
         gNw0VCjbVUFqSJXvbSDbD8B7YQMfTj4WZwPFSV01+pikO3vgIybn/bi7PEBy5BQ3mDgt
         LWQ94K/YqbIf3h3h1CDwuJ5d7uI5wz8JEdlbu2s1Zs636IcIoPil7Edke8LKXmD2ySgq
         G8ipmfyeP9qsQwvFq83B1quxDlC5cRZaD+BUXLzjiMrgGis1Pwe+xG1159G1NbC/Cu/9
         HQyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxryKLUD4Ka7DOHSB0Tw7Q9lbJWETM/pg52VkJ7Up0cLjROx59r1sSSiBw5zLVwxNWmlI+aYgpBgIptVME=@vger.kernel.org
X-Gm-Message-State: AFuF++lNa7ZSIh1GuHiIjjsckHyqxgugH6uNy41s/SfsrOhnN7/omAp1
	dEYtKV0GRe0Al+/PrRmd8egRRMEZb3FcNAmRy+GfVbotayX27Bg3jfgq
X-Gm-Gg: AYBFou03PKIbWSQtpPW1xHTIIXYdhstQTj77hIsUhJPk5PyV+zIy9I1mzY1wz0LDsfz
	DCRTxuYw2RDZecUARPQ4bu1fdJe2/WU/On73OHYfJB3FRgyO53YSW+ymkbh+7jIPUPcUYqZ5FMY
	PA0CYUXwvmZLk4nkNgZWpg2Ppv/evSmynnRhPX1xro4xydX9WkIzYXMMk8KbEACqPfnjZUmolCJ
	pLdn11Xv33dj5buNv65IoYOU8q6ysftDGXXm8BiiVUPwGT9pIPWDycp4J9FSrO/61Q6/cB7KAqT
	xe93BM1JwEIN176GgtfP040g5UJByC6CksGSmHMayXG63yjL6Qb1cvHZ8rcmjo2yMF2qpX7P0Hv
	LmEKyBWbnEbLV9M/b+w73VHPdjZFJUmRI1B0NmbckHZbhzPozdbTdLROXnbt6qmYO8jFA5b7lsP
	ykSRUYdaCctQezktGZEfmEIXMjIL8M3fZc3fdzY6qCq7JIROBl8xZXv0KzwgvEad5akES/fMBrn
	X+8nrrAGvKf
X-Received: by 2002:a05:7022:7e85:b0:143:3242:6301 with SMTP id a92af1059eb24-146ce29fde5mr10480380c88.4.1790593317720;
        Mon, 28 Sep 2026 04:01:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm28443669c88.6.2026.09.28.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:01:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 04:01:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 0/3] hwmon: (coretemp) Report unreliable temperature
 readings
Message-ID: <30a8cb63-c99d-42be-a313-12c33793504a@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <46f9f319-de71-412f-a424-6cb801478456@roeck-us.net>
 <20260925182158.GA27122@ranerica-svr.sc.intel.com>
 <254a2bdb-c759-469d-a1bb-c10f476cebe0@roeck-us.net>
 <20260926035819.GA27616@ranerica-svr.sc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926035819.GA27616@ranerica-svr.sc.intel.com>

On Fri, Sep 25, 2026 at 08:58:19PM -0700, Ricardo Neri wrote:
> On Fri, Sep 25, 2026 at 02:23:49PM -0700, Guenter Roeck wrote:
> > On Fri, Sep 25, 2026 at 11:21:58AM -0700, Ricardo Neri wrote:
> > > On Thu, Sep 24, 2026 at 07:37:18PM -0700, Guenter Roeck wrote:
> > > > On Thu, Sep 24, 2026 at 07:33:19PM -0700, Ricardo Neri wrote:
> > > > > Hi,
> > > > > 
> > > > > Intel CPUs indicate in IA32_[PACKAGE]_THERM_STATUS whether the digital
> > > > > thermal readout they expose is valid. coretemp deliberately ignores that
> > > > > indication, for the reason given in commit bf6ea084ebb5 ("hwmon:
> > > > > (coretemp) Do not return -EAGAIN for low temperatures"): some CPUs clear
> > > > > it while the temperature is too low to be measured, and the value reported
> > > > > in that state is more useful to userspace than an error would be.
> > > > > 
> > > > > The consequence is that userspace cannot distinguish a genuinely low
> > > > > temperature from one the CPU could not measure. This series exposes the
> > > > > indication through the standard hwmon temp%d_fault attribute, leaving
> > > > > temp%d_input exactly as it is.
> > > > > 
> > > > > One user-visible effect is worth mentioning: sensors(1) prints FAULT in
> > > > > place of the temperature when temp%d_fault reads 1. On a CPU that clears
> > > > > the valid bit at low temperature, that core stops showing a number in the
> > > > > default output, although sensors -u and -j still report it, as does
> > > > > anything that reads temp%d_input from sysfs directly. A driver-custom
> > > > > attribute name would avoid this, but would be invisible to generic tools.
> > > > > Reporting the condition through the documented attribute looks like a
> > > > > better option, but please say if you prefer otherwise.
> > > > 
> > > > I think it would be _much_ better to return -ENODATA for invalid readings.
> > > > This isn't really a fault, after all. The sensor is not defective,
> > > > it just can not provide valid data.
> > > > 
> > > > With -ENODATA the sensors command reports N/A for the temperature
> > > > measurement, which I also think would be better than reporting FAULT.
> > > 
> > > Thank you for your feedback and for applying the other two patches!
> > > 
> > > Thank you for your feedback anf for applying the first two patches!
> > > 
> > > Userspace has seen a number in temp%d_input for over 12 years, and with
> > > this change it would get an error on CPUs that clear the valid bit. I can
> > > certainly implement returning -ENODATA; I just want to confirm you don't
> > > see this as an issue for userspace.
> > > 
> > 
> > Userspace should be able to handle error returns. That is not an ABI change.
> > Even if the fault attribute was implemented, trying to read the temperature
> > should still return an error.
> 
> Then it seems that the fault attribute is redundant.
> 
It is not just redundant, it is wrong. unless the chip somehow reports
a real fault (defect).

> > 
> > On the other side, claiming that the sensor is faulty is, in my opinion,
> > just wrong. It is not faulty, it just does not return valid data.
> 
> I see. I will implement returning -ENODATA and drop the temp%d_fault.
> 
Sounds good.

Thanks,
Guenter
