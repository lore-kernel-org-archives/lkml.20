Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197578;
	b=WRIkuiYT4DNZIkRuKBtZlH4YWJWfNES3YOR4F+VtFOHpBatacrA0xpRfOCVYNus0De16
	 K2WlfbCgq7FSHJP0sxoz6JBz6Qk9v+1PWZxjGQgYtXd7shYcrrwAVrVaKPbhYrEXB9NG0
	 m6ocIsR9bBan17j7qm5t77wLOiGv37ogkXI88Ll19bLo/R46fgKl6u+mH34ZsyASKZxpd
	 6qqs1p0B8zDj4jDZBBHB23bOcgt+O5tpx1EToNZWqVly96rGaKHVVSbwXeak3gKMigMk1
	 uAO2eZOCKw6iNk+pFtp/66pMT+zhUfnu1JRFz1xqbk7XIuq2s4mhYfF+Gn6CwLFdKiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6CnDrX+La+2Fu6jP7wM+lot0uCoQlPoWp1MsRc4XNYs=;
	b=DK+s/5j/Le3eut4v+R+rGiGvg7sA+LSOfL/8FNNRZRriZUFzE+i67aPXvWYPpzBujqm6
	 k3al/kWuTstS6iqQ3lAoIyclDCemnn9cyRSMY2To8QCrKmohieuOyvVrWXR5taQ+d7Ifr
	 /2fD1wpiPRY98nIP9UogfRMESIE2+4cUS0+nLyDdq8637tY1s60bkQcm0la4JWHYcHY7O
	 xrTlRWHYd8tJWg/K7jyi862+a45A953CliT1dT4aSiTSQbb2l9GFMIUkYQFjROSyIa0gr
	 WI+bCPJn3RZSTK7jeOGJZ59zG0zwrJWInf6VYPgGVr35JrVo6jkAZDp/+C8OyGnYluQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfRFAWrm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0278606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0278606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfRFAWrm
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b05bf699easo10252747b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197577; cv=none;
        d=google.com; s=arc-20260327;
        b=SY+TVbgk0MVwCrLkMVx7U0itth4WkJuuyez1BTqwMBE1uA2fsL+QabWr0THlSujWcq
         aoQeidrST4C04hZZ+sWUd59enzOcCdxQl6BYljWN2/xWAouynSROJ+HqUPDzkxEACQGv
         iyEkzJ/9R4QKjquMZMg/ME50oinQl2Li/jEYbcPrfyikikfAOs9RGIRzI4a2WMIHUYwm
         1B7c3yyMoCvJ8AkELYkXZvfY35EHvMHT7yLNRfi+DcoiQpP3t74RXHdEI7RLp9Mo7GIz
         trU3AEnQf7/P+PDaLekg3ARojLXXrW05IXZ3H56/txkUe+zipsiY58zqs+zOtB5Q48xT
         8D4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6CnDrX+La+2Fu6jP7wM+lot0uCoQlPoWp1MsRc4XNYs=;
        fh=1KD51n0DNYi/zlATeU1jXVz4VV354e8PAknTL7jKmsY=;
        b=lJISZ4Kvo2pfvs4y1B7kJAS1evmBnLMcGhPLImC/UKFgM3XuWK0/TTVhE+ZHFcT9q1
         gQvgKKry6SycFQD6Z8S/l0p/thjnOF+NU/VEOtyuVhgZjoHJi9q3pj0hQ02uEhccbFWt
         nPJMQiciJ7Y51G0ogeE0XFxz9UNDCXogyQd/8VPpuGsB9DiLlngmjmC9GvarpsHNNA9u
         iT3FpoUsUF8VxCXXIB2+5BXiX5SkraAb6HPL2uQCbtu232TGm+Eh+VWVr/sce1+H2KJw
         bHZ2dmutDSj3xpwUATwWdYriE2b0vTooUGAot/MriJYUoa1kK6vaPvguSlRt/Jo85KCE
         mFKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197577; x=1793802377; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CnDrX+La+2Fu6jP7wM+lot0uCoQlPoWp1MsRc4XNYs=;
        b=DfRFAWrmO+/Bj131K7+MGGvRusTiq7Cc5X579DXdy+WsyQOlHXS84rhXCmVmsKOZC1
         jfuHEhsyE6S5Hv/g/4Ce6BjpcZobIYAK7e7SRGOKE2sQnrptMyZ/rcfRlucg4dR4ESXM
         2gkEM+ETeUkrfFJD5xphI1XdRbsTnl/m+NHm4YrmXbfagBxPULfxYRHU88tAoNYxU0fD
         Sk8MihQlJ6G7wkMm9i9Z8l/r1iyrvuPMo1oPpQz0ZlNwKWJeP4IMCT2IjKSoAP5RqzaI
         HDHSC06lEs0YPSK/mdKu+B4W4LgKQdZyBezNe4ZWTbOgw79zb6SISHpGLp8kXM1lynRT
         +z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197577; x=1793802377;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6CnDrX+La+2Fu6jP7wM+lot0uCoQlPoWp1MsRc4XNYs=;
        b=UL2RGQhufpUTv+jSp9yGS66HWpmy8zMVxUQLi5YjrkrJtpBlmBffjCb8Uw4ZlOUoxK
         AforNmmGJm2VYWvwRlLV66J3vNmUukybRVrZlGqUOESBF9D866ebXcjq5ETdnC+ISIkG
         dBBBNagPw+xZ+TCSOaOkf4tcMxqtBPknS43VGkEsd01VQgZdv04+ixzdUzIroNtCDRrw
         TB0BBuMQGU9hI6XdhIqw5zHvgvlkILdkG6tMk0Mppcu7ilWob5sfiRaUtz8BDCmVCWSB
         T/dlX/mxj4lnunPeVVBpl/hOQEQe5GInS9S+GAaYL3/+ExvCUgi9QtozLY38JNn0kBYb
         1bcQ==
X-Forwarded-Encrypted: i=1; AKwUvByPiymOIP8AKNz/4YrBi87z9X2lP/I59KeQiQOo1yLIOj0gvn0QCBcS3FyME8uRDky6iu2ZTtyRQNuth1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEnt1/u1QXpT9hTN8i+4FF7RKWyfmXFQm7+NuXUbxzGb+QWLYq
	tKQFNltkNbakzMiKkFscBVJqTx1K1SM9iW3IKRTeWjHsRYzls1mccQsQr2M30NmmThVeASvI1mR
	50KwOpFXFH8pyVTxu2xoQ2zZF2Llt8EI=
X-Gm-Gg: AYBFou1BuWKBh2XxNcB7w2dIgiugqDId6YjPLpPwa7uvIgY9h6itBhP/RZOBOpgAmuW
	58DWTOIPRqfg4VwaR5rQFUw/xKogOq+kjJmbXfk2aVssWHG4YdRnl0520/kOE143eKCrppAY7Bz
	z94M0LNiKQuUkYBi5SkG4BghLIDnP04Cnj7dDVVuosjHF5cWph2wWbjYSelOZ0LHO5Y9Te7BbsU
	VN9/fFzkIIFkESvZJBL/ZwetN/BxJ3anydVKU+RN2Vco1lzPZE8bt6+Wb8njROUpsXk5Mg6Ddu/
	qZOtroti5qPhM8ybq9qrdhazrlFFT7bwsNFtTdW89s0Bwjz1Jg38mduSyokO9kIEAjveqL0EZ8i
	HhojMPibC0k3FXEnUFE8JJrVfz8jN4iwCn0giC+6fX5ix4cvik4Cg6FX22dm9L4NfE9TNsLc=
X-Received: by 2002:a05:690c:e90d:b0:8b0:d42c:54e9 with SMTP id
 00721157ae682-8b1b5c9953bmr12024777b3.34.1793197576747; Wed, 28 Oct 2026
 07:26:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-ipe-keyring-rfc-v1-0-156f0b93e843@nvidia.com>
 <20261019-b4-ipe-keyring-rfc-v1-1-156f0b93e843@nvidia.com>
 <702ade20-a2f3-4919-97e6-c72faa89399a@kernel.org> <20261021-groll-donnerstag-erfuhren-ce34a0ed4e97@brauner>
 <CAHC9VhTHUU0h9k74CMT6wYhMwyY3YhbSSFwJoDTvoFRyTFVZwg@mail.gmail.com>
 <20261022-hausbank-dozent-hurtig-9443f3777475@brauner> <CAHC9VhQ4sdCRvJ+YPZoiQzR_hgQN6-=84qvnTDDGPf=7=L9-jA@mail.gmail.com>
 <5143896100674c9fd744c4d7d6ce12232910e789.camel@gmail.com>
 <CAMw=ZnR54hMBwGTps23t9Mm_VO1bAvmeX8uTf_VJ0rJsFNMLuw@mail.gmail.com> <37b653494cf282c6e428e2ae8fd781a0ea69bf3f.camel@HansenPartnership.com>
In-Reply-To: <37b653494cf282c6e428e2ae8fd781a0ea69bf3f.camel@HansenPartnership.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 28 Oct 2026 14:26:05 +0000
X-Gm-Features: AclHuK_2pDead4oUBgww1V4NOQP7FrJJqtxPGmwYbVPNkoSmhvEEW-kSQFaRSpM
Message-ID: <CAMw=ZnQU0PRSn5gh-QNT+GuKroQaRsRUUMDB=rM=LSX+=h-JkQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] ipe: add the .ipe policy keyring
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Paul Moore <paul@paul-moore.com>, Christian Brauner <brauner@kernel.org>, Fan Wu <wufan@kernel.org>, 
	Manuel Huber <manuelh@nvidia.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Andrew Halaney <andrew@amutable.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 12:42, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2026-10-27 at 11:07 +0000, Luca Boccassi wrote:
> > On Mon, 26 Oct 2026 at 12:57, <luca.boccassi@gmail.com> wrote:
> > > I think there is one issue with the design pattern where keyrings
> > > are set up in userspace, that I have mentioned a few times already
> > > and I got documented in
> > > https://www.freedesktop.org/software/systemd/man/latest/systemd-system.conf.html#RestrictFileSystemAccess=
> > > as well: they are trivially bypassable if the kernel has kexec
> > > enabled and it is signed. The security model relies on the "good"
> > > userspace running first, but if kexec is enabled, there's no
> > > guarantee that will be the case, and as far as I can tell it gives
> > > root trivial capability of overriding it and extending the trust
> > > chain as the attacker wishes.
>
> The attack sounds doable, but it also seems to be exploiting a gap in
> kexec policy: kexec is supposed to behave like a warm reboot so if boot
> policy requires UKI only then so should kexec and that sounds like the
> thing that should be fixed.

I don't think that's the case though, even before KHO/LUO existed,
kexec has never really behaved like a warm reboot, as for example boot
services do not run again, so various chains of trusts are not reset
(eg: a bootloader might now be blocked so warm reboot would not work,
but kexec would). And since KHO now exists, the difference is even
greater, as more and more state is retained across the boundary.

> What's the mechanism boot uses to ensure UKI only? So we can see if it
> can be adopted to kexec.

There isn't one, and I don't think there is correlation, as booting a
UKI is not the only way to boot a system. Eg: this problem applies
just as well to booting an arm system on uboot. So I really would not
tie this to UKI or UEFI specifics, it's more generic.

> > > This is of course not to say this new IPE keyring shouldn't be
> > > added. But perhaps it would be nicer if the default build flag was
> > > mutually exclusive with kexec being enabled? Not sure if that can
> > > be expressed in Kconfig though? default: yes-if-kexec-off, no-if-
> > > kexec-on
>
> I wouldn't do this because a) I don't think it's an IPE problem, I
> think it's a kexec one and b) distros get very tetchy about hard to
> solve feature anti dependencies.

Note that I wasn't suggesting an explicit conflict, but merely to
model the default values of the kconfigs with such a relationship,
allowing manually setting any combination the user wants. But it was
just an idea, maybe it's not worth it, dunno.

> > > At the very least IMHO this relationship should be documented
> > > explicitly in the kconfig blurb, as it seems to me it's a major
> > > footgun to leave laying around, and users might not necessarily be
> > > aware of it.
>
> I'd document the need for trusted userspace on kexec if it was a boot
> requirement, yes.
>
> > KHO/keyring folks, what would you think about preserving sealed
> > keyrings across kexec via KHO so that the chain of trust can't be
> > reset by userspace? Good idea/bad idea/yes send patches/no go
> > away/etc?
>
> Well, yes, we do have a similar problem with the trusted keyrings.
> They're actually initialized from the shim created ..RT variables
> (which are volatile, but don't die on kexec).  On first boot they're
> initialized before user space, so we know they came from shim (or
> another trusted component in the boot chain) but if root uses UEFI RT
> services to add to a ..RT keyring, the added key will appear trusted
> after kexec.

If it is possible to overwrite the RT variables then yeah it sounds
like we want to preserve the machine/platform keyrings too via KHO.
