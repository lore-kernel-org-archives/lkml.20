Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4D56261B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930430; cv=none; b=dYMTu0i1sTlAecLa60lpwG/LkmPUsaxlaOYkbX7mHk4goXQylGw1PeLmjc2mPPcI34GNphPzLac05EJegiq4xvE5V+tP8ME19VOvowiEMFBMC1D+7KCEjccROKrkGhLQv0ODceRBQBrG6GGawOzIns1JxKel2bfH7kxKXPGLGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930430; c=relaxed/simple;
	bh=T1NSf2MNr7yY5v6FmworM5XrTcAJ/g6Wc19lr7YWcBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb6QuBin06Z1op/BMXbvQ4wDIs6uQwTiRr0W4ndV8JeJN2c5CaO3iL/3cQzgSkvhd3Vfjy47iHambMggHOu9eta9YDKNtOqIv9GC7KakHcf8u9JdVnUJR29RRKu1uJT7zDccWEKiyvCf97WRxAxEG5e4QeFB6bYbOiXZgZvrgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Iam/ncMY; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Iam/ncMY"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91986c5cb75so43788856d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1791930426; x=1792535226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RMXzZganarlsailXkTlaGadOuYOoIKZ53AhRSXcitJk=;
        b=Iam/ncMYTXZW/58ie4mDkpCl1KLlBAgYa/GvSK5FOilMbyAdragopzJ0mz1CNfR/of
         OVO+K6d4ZmavDcLwQSvYITgRhxteoyzipvpmN54Nf1sWqooKxL89K8rl8e0YlT8WczHD
         yd626XjHfHagDmf9ODDved9OrwS2bvJQE7Cfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930426; x=1792535226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMXzZganarlsailXkTlaGadOuYOoIKZ53AhRSXcitJk=;
        b=rqnrzySj6aMDEL5QeEVPvWhqnOSUGAf/VJb++hO1uHt4tKYtZVWZkhZ3FoSZjEZpCS
         ks5nLRnEOzsUMO1g5VdwTw6GjMfIX08G5kzcbC7lKjoXAwxVKmeqTsE7Lh1t+9oqot3e
         h0Fz3fQnE8hQhdE2MIzaEq4IkL7kgmvHkJUGyfXuaeUNOjm9lXadCCnWm3AkDztp6B2L
         h65v9qlGesjoY5CGABbJ5KlSZdkSSh8Y/FWjkPdrJHK/6/7R93nskwh+oeR/dL0qrK7z
         L70MCx3dARzBb8S4wpCY+/8wpkTBb+3fdFOua7V0WLR5evWLriU6FvUFaAaARsEoRfcf
         ZxWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7AHOfG8nrdXx8AEcU0AIUcoB97Htb2Ho/fMbsLtKDwbEjQuOotQbhWihXmoPExVY7Iq2E3btzt11D3u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN7KvH3/54cKS8k/MmUmKcLEk0tXKWRbsCdLCDvCPuAe80feZj
	DGBiPy3TcsdQlq6WZwPLUS3BjEs8grFOuYTIe/KvS9G1ex145gyBCQsAjylgooROeA==
X-Gm-Gg: AYBFou3p+oQghfs2zB+Hg+Erj8H0thg4zhXjAVWqCSiUv/BlIyTAC+W7oSDvzstP7UY
	1Cl7uEvQ3GXcpsHFJmcMA+2DMKrtct3N0jwJV5kz675WZv2NkpRHyeJ6tZofX93d6HQeRSq4f0a
	iO8Fjpy34Xy3ZM3ufm+zqXhULNzVzvz0O+1TmCQJu20QuYbk78mlOgjmGzHIAC6aY2sJ/Nkvm7F
	kvRoyuy/FgcqUlWgcveebvNDMyL0AMAMy3F/Z+BnJ7Yk7xyCW5kHFnoKyrrEM9SW4W3Lb5j005j
	x9737AO/hHc4t6iqS3O2jVLs2pChRd3thdRRsgwDa1xczAYRGNF9l/UaZLrcW/X7Ab2dc/eX7F4
	A521tPgHSTBpaxUs07KPczXtEGjjqmSBYNsU8fDK2fLm5DqMFzrSI53/w9biy9qzxElKmpHfNnd
	VSwAHHQAwrj9EXvpVqybdz3Syot22sxRPdpnTBHYYfUGk0whZ9Uk7cc6ZA8iX+Wl0Cg29uxD6lH
	SFfNY+SRxvxI2E=
X-Received: by 2002:a05:6214:4906:b0:917:8b9f:d62 with SMTP id 6a1803df08f44-91b554f1babmr266315986d6.18.1791930425999;
        Tue, 13 Oct 2026 15:27:05 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.1.126])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b62240sm36637126d6.23.2026.10.13.15.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:27:05 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Tue, 13 Oct 2026 16:27:02 -0600
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
Subject: Re: [PATCH 7.2 000/281] 7.2.11-rc1 review
Message-ID: <as6wNjHH7u-zmUBN@fedora64.linuxtx.org>
References: <20261013112855.045212108@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013112855.045212108@linuxfoundation.org>

On Tue, Oct 13, 2026 at 01:35:16PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 281 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.11-rc1.gz
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
