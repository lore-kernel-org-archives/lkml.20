Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019433;
	b=1dPtXoYRiBuRIraz9eaQ7flzgmi9tTOGpkRxxCNTRzhui/ryKbIljHfkd3+LSnHu0DaD
	 RK1YMD0hdwnhPNFnX5FXzXzZ6N3TtAfMFgxT2tOc4bc4z4/5Wk40ZhZXP7ic3pOcftWky
	 8tTfkasX4S2bfpbwSgrg+Ziar55rlfiB/Tb43nGP+WHhsHHV5D2amvIiNlVSOn6jRxMOd
	 NfRC66hIWmCEKFxvoStzt3dHJk1W+pDKKYMRnKk3B2aWfG1/tD7YzANfKq5lGsRHr9IwF
	 ODUWmgPC0ZyboGFtJ1f05/3w6RdOjhWeAmUz7d576HdXFfROGh4THacOtRAeytReR8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=HMpLhaD5BcYLKQl7lpJj058Uv5YztYi1lTCdU27HcY4=;
	b=hzi3pJWopyKD4C9f/HC2jZZLq0zcYApEcvr4alYAiXs/z4P0zIfny0oc/fJCDny5LGx1
	 mKGQtdeAfhkK9yFjmdDYHLRTkjksjAnajnxSNw0qvNvOkY8BdHoY7IbFCF3xIpNEKwfVg
	 iF2twB1ZVpFWsL2PfPTN7iuQoTfceO3ABXiyXNwrT1nBnM+rFX8wFGSC93tWaVOA9/VyC
	 TdA2bQvZItD4giGs3OF15FYtM4KRXnthhAeVRTOkPDSjzWLHIgDWN8v5TJaallQwZdVX9
	 WH7JzOeQuW643eyOnKeXGEP4kUJKsd2uUvgWOsN/fx0zmTB+vWow3b0/1Sgc3iRQrzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OySLaZNF;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2A606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OySLaZNF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so1665995f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019431; x=1793624231; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HMpLhaD5BcYLKQl7lpJj058Uv5YztYi1lTCdU27HcY4=;
        b=OySLaZNFF81ia0rVA94JSJ0z0WWlnlSpQlXbPYNdoz2t/Nvpk6+ph3yDPXdpqVsIPM
         wlDP7Z4AIMnFkaFzfTP/ie024+qWkH3xCX/k2MygTiVPAHv2EwRAm2+g536+oaCHuvLF
         KUSANP7ZxtIEbwbx79hEVEUmF0XUQQQgg0TuLbwHHTsGA50mgIh3AsV19T/ttHs6D88u
         4QNMSqBoQ8eyMeXr/+QjpcCERneb+jyIcQ6CzY8Far/ic/F2lSlx2+jBHqRl0t4QTVv2
         zDvlAinx5/+hrJf6TpZifS9F83hNDfxL8wDuKOS885dochDajAMj/tOH33lR2H/sTbBK
         ytRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019431; x=1793624231;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMpLhaD5BcYLKQl7lpJj058Uv5YztYi1lTCdU27HcY4=;
        b=WczSvbMooe1enrH6N2W+fMYCZ+hmpsKBbdMM//B/uk8O3BATratQoizHBFTJt8tYG6
         uYmyRInvxWkZwI8TtnzfcH8ucDRrG4hJY6cnFtNGEMJXs6RT3CTxdey9YG9K8ephHABt
         GuE/Mgt6aoGNq1fqWtHBja1D+ItOupdhG/jY7w82ce7unzLuZShWAM+hFeNTpBMx7Fct
         iZRN+JJMPeds2LnQ9yUSyhp88i2A/FdRVJPJWjyYRBXt92MOvwas6bs0aJSECQwTGBZ4
         QHyGMLkk3totypKRrq0+38/kt1Du8Ns4nU4Ezarnx0u+4MmJZq8gmkvqHERBn0/DkM/3
         83zA==
X-Forwarded-Encrypted: i=1; AKwUvBzCFZRvrzJ222CR2qI24yI6dhuWvk88RcTSnk8mx7Gz2ZKCEKoYSp/DwUBcOQ/w+YNZ0OwQxLMlT5VlE3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5dgEO79jkPxAjHoy/SRcEUPeKy2kaae2V3N6lbxhtHcktnAbJ
	3UVOApy3/yVHJNwTC1eVkLxHQi6hwcT8ZAcHyrNN2uQCXXd0CM9TVfWl
X-Gm-Gg: AYBFou0PAH8yL+FGeHRGTfpSyX0Xrr6/oI1WDMnrIM3aL4dx51+FbF/I/2lE+uvMJKI
	Pa8913MlIO+XVz3TFopR8ePw9c0GtA83G2O9tGJ055ogzY76eZZvz1JRmJaqAmWgeiCz/tqmnO9
	I1WWJW6MlIXBPd6JUBuPbv9O+4IVrBCQ/9n9br54abH9BGj5L/T3tVhs9y0SFirj+2auNQ2sx5h
	YMuXb7683+X/dMk4gMB3Lg089A0uMyAiqmaKzgKjjSqfHgPydBNesho9oYtv+pPta1gBs679lBh
	HcxfV04/u7DkrwPkWE+J6NIAGUEKeflKLStIu+pOEO3scqHD+d4DQXYgmOxbI7ySQMMpnxmOT7/
	RfjVcyyOsVeLJVUc/0B06rQb2BVUK6b7y2/yIU6ajaA81zS0Im4oHb3aXJjlwhDEh3X64VywXG+
	z8m1AdEhlImRW9MvR6gCn+7xbC2WDlN0P2U0A5ha+Rw+FZXBm3bmaU6Wi4/dUYHhFcE9O3VM9K5
	cv2UVu9NBBWA0HT0KYyp/h1GZvPq3qE5Bqe1nPHvANRylDJMiGHlWWwrkAfGqHhSeD6Z8aIxibO
	a/eCG3FOsl8GzUHu234/MSdnrYCbfWNifQ==
X-Received: by 2002:a05:6000:4a0a:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e3eac8e4bmr13027887f8f.0.1793019430839;
        Mon, 26 Oct 2026 05:57:10 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:d036:ae00:fa6b:a9a8:1f5a:6fcb? ([2a01:4b00:d036:ae00:fa6b:a9a8:1f5a:6fcb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm16561378f8f.1.2026.10.26.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:57:10 -0700 (PDT)
Message-ID: <5143896100674c9fd744c4d7d6ce12232910e789.camel@gmail.com>
Subject: Re: [PATCH RFC 1/4] ipe: add the .ipe policy keyring
From: luca.boccassi@gmail.com
To: Paul Moore <paul@paul-moore.com>, Christian Brauner <brauner@kernel.org>
Cc: Fan Wu <wufan@kernel.org>, Manuel Huber <manuelh@nvidia.com>, David
 Howells	 <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Andrew
 Halaney	 <andrew@amutable.com>, James Morris <jmorris@namei.org>, "Serge E.
 Hallyn"	 <serge@hallyn.com>, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 12:57:09 +0000
In-Reply-To: <CAHC9VhQ4sdCRvJ+YPZoiQzR_hgQN6-=84qvnTDDGPf=7=L9-jA@mail.gmail.com>
References: <20261019-b4-ipe-keyring-rfc-v1-0-156f0b93e843@nvidia.com>
	 <20261019-b4-ipe-keyring-rfc-v1-1-156f0b93e843@nvidia.com>
	 <702ade20-a2f3-4919-97e6-c72faa89399a@kernel.org>
	 <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
	 <CAHC9VhTHUU0h9k74CMT6wYhMwyY3YhbSSFwJoDTvoFRyTFVZwg@mail.gmail.com>
	 <20261022-hausbank-dozent-hurtig-9443f3777475@brauner>
	 <CAHC9VhQ4sdCRvJ+YPZoiQzR_hgQN6-=84qvnTDDGPf=7=L9-jA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-22 at 13:18 -0400, Paul Moore wrote:
> On Thu, Oct 22, 2026 at 6:19=E2=80=AFAM Christian Brauner
> <brauner@kernel.org> wrote:
> > On Wed, Oct 21, 2026 at 12:51:35PM -0400, Paul Moore wrote:
> >=20
>=20
> ...
>=20
> >=20
> > > Of course, fitting in with existing norms is important,
> > > but if it causes IPE or existing IPE uses a lot of pain, that can
> > > a
> > > good reason to diverge from those solutions.
> >=20
> > Which pain?
>=20
> As I said before, (emphasis now added for claification) "... *if* it
> causes IPE or existing IPE uses a lot of pain ...".=C2=A0 I intentionally
> did not make a claim either way.=C2=A0 Once again, I wanted to provide Fa=
n
> some support in case there was an issue and he found himself in a
> position where he had to push back to preserve IPE's model.

I think there is one issue with the design pattern where keyrings are
set up in userspace, that I have mentioned a few times already and I
got documented in
https://www.freedesktop.org/software/systemd/man/latest/systemd-system.conf=
.html#RestrictFileSystemAccess=3D
as well: they are trivially bypassable if the kernel has kexec enabled
and it is signed. The security model relies on the "good" userspace
running first, but if kexec is enabled, there's no guarantee that will
be the case, and as far as I can tell it gives root trivial capability
of overriding it and extending the trust chain as the attacker wishes.

IPE specifically was designed to avoid exactly that, and ensure
userspace could not execute untrusted code, even with root privileges.
With this enabled by default, userspace can just load the same signed
kernel image, passing in compromised initrd and command line, and gain
arbitrary code execution on the host, since only the kernel binary
itself is verified, and anything goes for the rest of the kexec
parameters.

This is of course not to say this new IPE keyring shouldn't be added.
But perhaps it would be nicer if the default build flag was mutually
exclusive with kexec being enabled? Not sure if that can be expressed
in Kconfig though? default: yes-if-kexec-off, no-if-kexec-on

At the very least IMHO this relationship should be documented
explicitly in the kconfig blurb, as it seems to me it's a major footgun
to leave laying around, and users might not necessarily be aware of it.
