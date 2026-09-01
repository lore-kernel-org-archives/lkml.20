Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F54248CE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287078; cv=none; b=BYzRaFTEriwCyH4Kmrt/ocWPEdb8/jm6MhZey1jz7wudU/xOn/P00tVa6Y6QHcxb4z8tF5LxHEt7xcqIJqgbIL30rBxSLinEupV37/GIaJy0p0l+zDacpLtkGNg5IXxnmtwk02hEzrNhva8E7tqS1vd/3fVn/J4gBoeRFFXy1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287078; c=relaxed/simple;
	bh=yXAnKgy/VQxxLilrfdZGXb6jNNTn/HTqT6aUBDy7mCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsHJg2+uIRIpAF97VcJxmpTBAbhx6PuzYsT9p4tZ14iI7KQJA3C9EQRpasXSCwEsGfGyMTuKOhH1ofVMl4QO0kulkuWZM3zZ8yKa8Xccbl2Fct7yG3sSe3wE9zK8Ftu/GBy+anlT/rzqyIwtHZO39t3mA/ZLG99D13ydehaqjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0hvvoKI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0hvvoKI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9b60c652aso1090115ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287077; x=1788891877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1E8LfafWTIBOtDduMtXuT8/asiWqzqJ0nzvHLKzE9w=;
        b=G0hvvoKIPVvuw1L+f5tNDGd7NBRb2bGfnpTeZjuIMaADs9rkzofl4xUw459GrgUl+d
         OcmAyPEHonlTO7i66pP0C2K+0ro9QJ7Tk1065emYgiez9MITprC8sIzr90lH8256KQfn
         /YOT3ZMFwWdId8e8ViFqDUe19sGsehfMqSc9GfshncMdQXqdKriqPNfWmbaxGX/SX2cD
         3IXU4F/2PafCsBt9i74wTOdEwQPx6LFDA6Nrl6eaPoG+ijaj/HoiLM/hLTk7c8Zrldw3
         31Bo26BrRk0nkxMt0QDNBt4RTd6caL7riRG02o/eDhB3UEuHx8hFnQCwmZ/yeujYkHcJ
         ZFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287077; x=1788891877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1E8LfafWTIBOtDduMtXuT8/asiWqzqJ0nzvHLKzE9w=;
        b=iBZ21SQVbDaBt/rpj4OjZr/C2foQAuI2XF7vru3zy9hIvSbsRdu/QfahSFoN8ud4xD
         BH8GtVxhF+UmUR9YrSi+zBEFUdmNhu5SA7IJbl86ZYxsF9WOPVX9GSeniGz38Q265ZEZ
         rCxK2CZLZsFbt6aXIC7qDIMOCIOTtqtAGl3Jlunxupvct1iPD7zbrCw8qE6Bc0g+3KeD
         oPv5eCZKZS6oQfr85gCyRT0GPwZdfFft2B5Fh8xv6e8lJY/94RgVLtRG8I1W7Op5HnEd
         Hel/MExCDj1AwSCIIFA7dAYPztMPhC6OzWp5rH0XXHk7m2SrvBDTFTdidruTC6I5zaOd
         u10g==
X-Forwarded-Encrypted: i=1; AKwUvBy7ZzuN2u+sBjZSKbYuZp78svmG5Q/1LwCdC7lxBQm9hICyluLxMp3G04tgErjd3o7mUUrEoDvm3UoVJVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m/s/6Z0wwTKQDgL66r1XmvJw9ZXFLgtBcKw4V3u7AL23EmXgUa
	AfbA34gUTnOcwYH+GPjjsVLgUeOhFEGUG+kW4u0QeqOCSkNm3sp2702n
X-Gm-Gg: AYBFou2JgzFlhQtaxd3yqGV8gL9/9S7tSsHEbKzxyGlaZm3Mrz+wjX9KaY8djSAFklc
	3FYgDxTwdvooEzlPneWlG8f38c78Zd0cLiB3MZE5Mak3Q9Nwx4rtTPM0i2QFCG4FdhD1LiL50JJ
	Z3jL/PdtDYdOQWeLsyf1EdOwg8rMWpY44ON5Fs6iwKHEHVl0A4EVeWKuGvBHmLPdpvrfd1vhdjF
	iNokTyykEphQVtdqWcj3VwYyJftgTwbBpjYjtWvIhPZtVTZZ+JX9W2eLDETCnuEX71MPWq8oT/X
	yQ0/pFTpNfU0cvT1WFDxI3Yqki+susTeyVltUJcGyqS1s6XzvarX8U80sHUh1g1avnvkFcv07xi
	jLHC2RSGJO9n8CUIrttX2vZxj0UuOZAdihwiO/3hD/RidMSQf0fmQPKlzqbIFuseZ/qMODoMtdA
	jYLSLvG+9h+HNrnZseWT2kiOFz59ZAiviX3GpaW12RQshhidVm2M121q76DMgHiGY9BM1UZydzT
	w==
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr157073085ad.17.1788287076609;
        Tue, 01 Sep 2026 11:24:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4a8504sm2259945ad.62.2026.09.01.11.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:24:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:24:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, pp12313124124@gmail.com
Subject: Re: [PATCH 2/2] hwmon: (dell-smm) Add Latitude 5420 to fan control
 whitelist
Message-ID: <3a6a3bdc-713b-40e3-8865-671d52af1fda@roeck-us.net>
References: <20260901181849.241776-1-W_Armin@gmx.de>
 <20260901181849.241776-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901181849.241776-2-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 08:18:49PM +0200, Armin Wolf wrote:
> A user reported that the Dell Latitude 5420 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Reported-by: pp12313124124@gmail.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221935
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
