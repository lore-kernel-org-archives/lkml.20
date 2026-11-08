Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181512;
	b=q4usbxb4lLg8EUWcMIEUebLknT48AMLoUz9o+lO//Zrpb4d09mtVgcW9o0c6u7+aYcrL
	 p561G6g9jlq/add3jnSBzr7YUgttROIxSsRlvZDl/biIsDuiGZTsh74wuiM2m0sfmwlyG
	 0dRM0i5Q5+AqssWn4Z5mi43YxscPdk0ID/xCf6H9/3MFByPUKa8pFW8kKm9/AbM+4EBYi
	 i04XdnMu7B2mKvvkfQnMHqKvBr1cdxi4ASRbyonD6nEXXzMVZ1QNElB1k0w0q2C7tcLGi
	 JLzzwszISChwXj/ckDLvBUpl4mI8EE0hx1tZfTpM7TZRDLvDG1qahwTqQWp6sO039gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181512;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=VikSRRRNpdKJE0WF6UFdQBJodvSbYqajLrXcSX/fVls=;
	b=Ai+qj1c9K+Or7qm+x8F01wubz41+d6hQ6ul2vfKOsySkC3pARilqN0lICSZrzNE8oB/u
	 +P4Ah1qEJvPFPvG8c/aOfgrio7bKAfjgDqOuqbAi7ERpuhGR3PIix+I5WjucZZdCzFIlZ
	 xUjiskQAlvzPEzzmpw1b7LdISv4gWbkNDY5kbYEM3+21e+ERbA1mo2z6VUOQyIWQPP1wk
	 dpqVCveMzggYwFsAKNTv19D7MTAWvrtNK6n44v0kVd0HlQfpsh9emkFC7kPul9xC6fLx5
	 kmwEVqentNmvGngbyc9xkzcTfDG4ZN2QfDUvnQAx6+S+Rj/NHlfat2QMwzPcgmfGo/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxtx.org;
	spf=pass smtp.mailfrom=linuxtx.org;
	dkim=pass header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=protonmail header.b="o0zIiT/t";
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D2E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=protonmail header.b=o0zIiT/t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxtx.org;
	s=protonmail; t=1794181507; x=1794440707;
	bh=VikSRRRNpdKJE0WF6UFdQBJodvSbYqajLrXcSX/fVls=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o0zIiT/tiBwjSHE7zGKqqHB6XIuIsQSY3I1aU6HJmdyW8KD1Czpcev33me2g9BD0E
	 zLGmcUOqUTrZiq11hrBzYbGQyqGDzGBF8321xmCfkla/nfwfpejz1zjb8df6nn2Wo0
	 dk278k1osBlJ/nxNCTdz8axmy2FkXaY8TVeiJ1ewVVVuDP7XZaJACASU4pl3zKqzle
	 i9cHBYY0/BCJyvK3M9Rr2iBPRi/VCvy9OhQA4NHTs66t6M1UZImjo74u5qkB1QsBQA
	 edMn3Fc2Sf3qerL/Vjru8HNGLYmofAWoZ3OjAcUiaGwiRMDjMJLCEm+o/IAF4D5xkT
	 XPZLlsFaMp8gw==
Date: Sun, 08 Nov 2026 23:44:58 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Justin Forbes <jmforbes@linuxtx.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, sr@sladewatkins.com
Subject: Re: [PATCH 7.3 0000/1257] 7.3.4-rc1 review
Message-ID: <l47r12UjQ37KpnSfiFLGWoj3CmSMXtXpMu6w_v110bmVBq_CvgmiSZcW-ORmp53F8G8U6dklhzsqXZEIV5O_BNubJnIl30AqXxpL7hiLqWg=@linuxtx.org>
In-Reply-To: <20261107134939.434104957@linuxfoundation.org>
References: <20261107134939.434104957@linuxfoundation.org>
Feedback-ID: 225434474:user:proton
X-Pm-Message-ID: af00ea36dc055098ae50b0bf4e714589887acbfd
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

On Saturday, November 7th, 2026 at 7:01 AM, Greg Kroah-Hartman <gregkh@linu=
xfoundation.org> wrote:

> This is the start of the stable review cycle for the 7.3.4 release.
> There are 1257 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>=20
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
>=20
> The whole patch series can be found in one patch at:
> =09https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.4=
-rc1.gz
> or in the git tree and branch at:
> =09git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.g=
it linux-7.3.y
> and the diffstat can be found below.
>=20
> thanks,
>=20
> greg k-h

Tested rc1 (with the reverted problematic patch) against the Fedora build s=
ystem (aarch64, ppc64le, s390x,x86_64), and boot tested x86_64. No regressi=
ons noted.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
