Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92B48A2DD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048324; cv=none; b=BDEcj8f7rzolGHI5cuHH7cG3m/xt5fNZ+DAE8xeCInh6xJ5SmH8FN8xbby4/S7W+ntEcrdEImvFNsQSLZjbp1DAxndhHXJIr8z4NYP6tGofV+3L7JUMkgcczgWFvypI4SMsuJT6Qa2ZfEdazC8IUMKmZ3JNV/8TEPAUwRmL4mCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048324; c=relaxed/simple;
	bh=QlSh0lMba9S7x+7oC4iH2LRXRIl+WzSV8mlor0TBLPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJbLam0/D3jMoUV3xUibu7HcD/7g4amAjc3v2mqblsV93Xi2JBAGnwglhZFhYUkz+6ws3eZm2C9F5S6M20Pmwew3nQzJuHTNQ+pg+mjmVFuesV9kqQ1t+66AOII3tiOzo4mdoWlrjpBJbF1a875FSBVBjNZzjwPyKBZZfZB5kd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=dwiyo1qr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="dwiyo1qr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso1513440e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1789048319; x=1789653119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M1fkFxR9UHjQTFsOht+nEf8zm2sZ01COQeC9Wr8GY5w=;
        b=dwiyo1qrsnbmeLpdDV09K33CI2i5Aj4QPQ0QjdLhtWZIhqRKRbO8lSUlg32AL3njf5
         9hHSVjuytV11cgxmT5H9to6fucFMY3s9AFoG7QKdHfk40wykuqJJzeNOhAlGiRLjJrx0
         ULCcY+KuRZuL1xu2a81jlR4QmAKFRl3cRbFA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048319; x=1789653119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1fkFxR9UHjQTFsOht+nEf8zm2sZ01COQeC9Wr8GY5w=;
        b=p4TAQ7uOdHUR5aaA6kIDbpPHLXpnH+6pocD5uRdYxeg9lzgaferGhAVtG+uN9/W0+m
         SKnGYXaZqey66EQCz0PhPik3g5MDPoDYFgKwEEW8x27VWwwHGmT9DEWzvl7TlxianWd0
         U0a4m8hjfNwRHW6ZQWlMkpvirJLfXHnJl7go4PvM73LjBVLYDtxlw1Mi7vCHse6du6nE
         EE/QGTHkN0q7/Z+QDeX84y4s3fCZvKinQGMzr7tIJrg9jlknGXH2iPA3TDUrnqEFJYsP
         vzFyR/5yA6NnEV6iDtPXuDRgxP71zVAKqSqIyRnAnd1qX89DD1t0EThuic1MotlyyL+n
         0vFw==
X-Forwarded-Encrypted: i=1; AKwUvBxFcTTQfOICkg08QyE49Wkvr85aIjHjdHTou1uqDqzt8lC1VPMH2bhnPtjO0qCK/l5ffP76c/AObDfrQYk=@vger.kernel.org
X-Gm-Message-State: AFuF++ndmZ/ExYQCIXnkVKhDEqN3lPOAyOZkyyLLpdhTxoQ5ZiF0gb7k
	SFoASB0IgUA83jCBIKkAyWDd1cqVamGICa0sEzi7XBZHRm4HSLzJ9STfzzimRtgGxQ==
X-Gm-Gg: AYBFou2G+FXRbYxsiDVP5W/730gjnNeWgBQpa7OqWBBzvv04wZQwt7FgkO5cfAi48oz
	qSxp4pr4GOWLDTDDh+6ZRpm55Gu0ZxI5xSX4IjpGLVdFDZ+v7e927Bh0k9qZ3ViDSpEprRyrS3D
	4Uhx7J4hEkKFfYVq6F3/snV3lH2rDuClbhkz+NCrgTDyKOi4VSzz3FMMvBuqhRMlaEP0K5JpmRR
	Q8of1qX/V2zGcBex4atOgYvOAVxIzo2Qo927H97h/gFkEPy+wxkQoRHRmkCBNhDHj40zBGw9+FF
	+zdK6d35eqeOGS0nnBfeP0PDDWpL8pnWuQw7bJUVBQLJKHnrsBWJfsYHoUhtZt4KuQ3oKzsqaPx
	N/BFWQWrNBMkV1JwrZptX4C26kxs7mNT4C/V/9nTFvD9LyhPCY27RA8CvbOCLrTHG3t5zKM0Ho/
	1aZOZgSsvuJfOGWCQHBOMXB91OF6S0QgI6DDq293AUSb8XCnD84ro6+LDQKs/G6Qm1eEGADok6l
	PMMMYn1fRMNbpecM1rxhYINM54=
X-Received: by 2002:a05:6512:b9c:b0:5b6:1a7c:fd87 with SMTP id 2adb3069b0e04-5b61a7cfe93mr6974483e87.45.1789048318560;
        Thu, 10 Sep 2026 06:51:58 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.105.164])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6167027dcsm4473627e87.58.2026.09.10.06.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:51:57 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Thu, 10 Sep 2026 07:51:51 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org,
	pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	sr@sladewatkins.com
Subject: Re: [PATCH 7.2 000/556] 7.2.5-rc1 review
Message-ID: <aqK19316rNBHIHg7@fedora64.linuxtx.org>
References: <20260909134230.441546314@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909134230.441546314@linuxfoundation.org>

On Wed, Sep 09, 2026 at 03:34:40PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.5 release.
> There are 556 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.5-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested rc1 against the Fedora build system (aarch64, ppc64le, s390x,
x86_64), and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
