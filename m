Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873811;
	b=RlA/JhLotwINME5z8ptaE9Clgcv+BfMzUl4h3iaUaUFXo3th3B96PGpLNC2qsPedNaV+
	 7hMs+XVuk2yCdImmbRU3O718TM+soRzbfGHure5SMLkUiVHS10MOQOKcc+jeVrRPVJnUg
	 HykvMETkyZ3KUatJh0I7D+peInSNjt8YOHhux41mC96X4zSoRqyNSIoR8a/Ig3SuIO/GH
	 R9UUQF4Vmi4iiXuRphqIHr4XuuWQjfDo/AldSKFExsv76DEdXeTzTP/CgMTuoWs7wMV78
	 c7h/ArAVdhuIFqeqZ0JFJf06MAHuVCmcYEj8M7EWANOQHSOXuwLe+pXpKNCGFzg3IVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873811;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=927lNsR4JfrRM6StnTic6/mHC7Xbf7bJRocywi8MrQY=;
	b=HPH5losz3wYW5ksODBS+sKHDM3hN5WxQXLLnaTA0f4IdJTIC09FhxNvkjMGQDmBPZ6WO
	 /GJrvG0sCUjWHWQ8GltK2pPSWUpF8DpT9LateAAh0ep+h6J5TlKGdJ3a6wkPqWm0xy/MH
	 O8CycUvHEltaEojlopron4Z9GSLnP4asPsYM10PEwCF+2Dzgw9gXXLJptLfIHSFgA1SYq
	 uDVHL/JDa4cA5X/k9+XyEWU16PbzEBQLk0oiUbxaGNjP4b/1Zsw7ARdAjEQfRBp1EdtJC
	 bKjfeBAGNW399cAOvqg+PMxNeZBY7oaH3e/icZGZ7MZu9IWmvDAXMsOGfoATLGIfnLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxtx.org;
	spf=pass smtp.mailfrom=linuxtx.org;
	dkim=pass header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=protonmail header.b="N17d/IrY";
	arc=none smtp.remote-ip=185.70.43.18
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490FA606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=protonmail header.b=N17d/IrY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxtx.org;
	s=protonmail; t=1792873807; x=1793133007;
	bh=927lNsR4JfrRM6StnTic6/mHC7Xbf7bJRocywi8MrQY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N17d/IrYU+4aHZVioxr2rndn49L8MvhODWPzbRFe5mzfZBoIEqkne/LaU0Pgsj+ag
	 NeoOYIihHo9UtElQD/VcQa/k6AFXe9YrirmnUGM+gUPnIRoMELXK1tn1PzwG221EJV
	 OhiRUL0aVgFHU/avdsSeR1SMGtKkGC631gnjmWVSpUCSpgxdqQqqMnVFVkXLPr/hRn
	 qFwU1I6zGKVvFdZytoUwvW2CD3aWtt8JCXhMzJZzZQB+6oTfjEgeBhKMYKsZxgsgsx
	 Q0pApo5hvUgReMliVRQNHW6AFDgZVFMoKkeJdESJt177k9tTf7LkVZZRSNmvk3LEJs
	 CiqX57FTMqesA==
Date: Sat, 24 Oct 2026 20:30:02 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Justin Forbes <jmforbes@linuxtx.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, sr@sladewatkins.com
Subject: Re: [PATCH 7.2 000/243] 7.2.13-rc2 review
Message-ID: <kPklqauDGec1Ky9bhwYavsbiIootLwLitPj_dGqt1dluwnevCz4O5He3Zyvv2TTOa13j0ViBuSRuyent7DXGTZS5BMrU-sYlVHNY7IL591I=@linuxtx.org>
In-Reply-To: <20261024064731.125251200@linuxfoundation.org>
References: <20261024064731.125251200@linuxfoundation.org>
Feedback-ID: 225434474:user:proton
X-Pm-Message-ID: 5d4c16cc7fef0c8f749acfbf93dc1c8557222f3d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





On Saturday, October 24th, 2026 at 1:00 AM, Greg Kroah-Hartman <gregkh@linu=
xfoundation.org> wrote:

> This is the start of the stable review cycle for the 7.2.13 release.
> There are 243 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Mon, 26 Oct 2026 06:46:54 +0000.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> =09https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.1=
3-rc2.gz
> or in the git tree and branch at:
> =09git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.g=
it linux-7.2.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h


Tested rc2 against the Fedora build system (aarch64, ppc64le, s390x,x86_64)=
, and boot tested x86_64. No regressions noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>

