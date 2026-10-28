Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793214240;
	b=iFZ7nK0ryqFyiw+MQQtvJinxnBDvDpqqe+11c8wicEZ4EE1vey4zWf4w/QUxa9jg1pYz
	 xZVYXSYqgBQa4xuBXwTumYUOUg5C7ep4O21Mh8GUJczUcgpBilsnw8M1avvVdIdXBLMsr
	 KJBQ8DlpVm2EsH8UJsj/rtMmnF1yfmoY6wBYE6IdOE58Gsa/Aavp1pr1ct5ip2ppxL5C1
	 unxYMYv9UPahP+EP1AOAuTR201Xj6OYFpqqIKKT50o/1IPY1POIgCXYcggeQY4gH0LCNl
	 qndewiqydz66pektai+MkXrUxIx9R7RH0xE5KjtG1c5+y0SXh8khLRZKb7VA0nTPgjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gYV5Bfizpq8kTLjJP5sooyUCJxWfa7okNcqH8MZz4LM=;
	b=HYA0dyfn5Mdii6i50tH5Q/8O1n1IXqV4VOZ/tCGY7QalraKt26uVBumeh+d+ZY2mjE7r
	 +zbrX0+Q8ZqNhId3GKj6aedleOxbOfHVx5KXADBLbJqZ7SLZA2tmMGFxvMppjhzSz4GCo
	 LVEtHbOyHC01fjIIWICjwX9NSbdLcI8EVrXStC36na4u5Qfy16PrcelP9JH5/c3HgFbLk
	 5MKRHXgma7QhcL18WmfY/W3pLaUt9AR+Dd4bzaHuZ7oDsAMd4T5sBfyp0l1rhaNQ2PvDI
	 HpfYbFUHmqg2ARPmF8p1plPiuov6afGGtDNJL2+6t4gRa9MzrKN8165Dy7OJr3eGrFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmTJlIj9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1967E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmTJlIj9
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ab432273c5so13788487b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793214239; cv=none;
        d=google.com; s=arc-20260327;
        b=F9wIWO4iHijJskfpnxDR3eBmHJHNM4fKtePhFC+m8A0TpUXTTyJvwEOeG8DG6VKiyz
         gnLj5jW2B/xyDfCv45Pr8DWwxdQf3/if9m/0XtVdxkQt1C9jeA6giwB2vyRbOnccflkU
         PgN+UpYnoZ4vXy9OZ68VCIWzmmAogoLZ1iRDHkjltsy/CcZxkrCPJ/AmL9pXtBqNR11C
         GgetQuT9ZCuO4XiWONmx3KDll79+v3+qb01NaCVuzfER7YVs6gFXyCfoAGEO8QOSrCl8
         8VomJMk2o4jqKtDEFgABeMz6y0XHB2WyN6l509h5Z2Kd0i3mL6Xqa19cvHYKHqgnigQc
         SUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gYV5Bfizpq8kTLjJP5sooyUCJxWfa7okNcqH8MZz4LM=;
        fh=FQKwJUCPYlC/Umj+1vNuMRyfRIIs7SWGmxJrPT2tbbQ=;
        b=GekMtQcJcdQD0x0Y9ZXyahG4W+20p4HfUB066YwxmmY2h4EROlv/NN7S42iQI7pfAc
         qEYj9PdO9PDEKfQvvfYoVUtEnNljNqTJa6XxfF0Buchnh8Ze3CPOvx69gnHlhvZgDp3Q
         bqCTEQ4WwFmAnsq6V9eIokUMFUaMgpUEcaw+tpdnkAIgNkFN8Pp2lGrl0lhYAApZfTmV
         vG659UBOi/3Q5IhZiwjcjmoxo/3m5biXWzCQjWgR0YM8XU8Jb+mrFb/YO6Ecip7gTJMI
         ICPgFgcyeyotrUsA5VU9zwxj/m8AWJNkkESF+dc2SWbV6RIUgIcFNXb3aQyeu3KTfN4a
         3tGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793214239; x=1793819039; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYV5Bfizpq8kTLjJP5sooyUCJxWfa7okNcqH8MZz4LM=;
        b=PmTJlIj9BJE+hyWdYFmRhJ+3tw2R4WUGUDZVYILng+0oxJHUDaC9pvgOJiP+/g/GVW
         Jhv3CgGsVhdXnLp5zNe69oj87R+yWv+rh7zb7Y7JFFlsmzoaHUUcLELpNaSyTSWM+RM1
         CxOE7zT308P9cR7jJhSUPhFXrtf9VRYI1qzSrK8Erdbw1plM+UylP/yPlUnQ/iwNiDPS
         tMxkJB02aqb3L0+NIqZEMzTz4uh1g00BKOmZvi2KbGuZzsEFaRK9qrK1oyiJ6zvi/pV0
         qfRo9mnyvnaWsLQh5HGoviBGccm9j1jWwaedGCLja2JC/qO7HIz9SDEH6U+Fnwg/+d7+
         lscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214239; x=1793819039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gYV5Bfizpq8kTLjJP5sooyUCJxWfa7okNcqH8MZz4LM=;
        b=UVU4FIFzHLVkGZSmZfEojAEQIxHLBFoNzw0STIhS7AV7tqK4xWFECbsvam3Qxhu8GA
         QituVn5ZZKecn3vhvlTtFo+Y4xqAKYimnlzjov8ZGkN1FaWBu6Jzm7sT8bVXvUvtPkzi
         tpQEVUE9nwu052pzaHOBJly6JHdf2u/NGSdw6YNurtrSp/gO95bep8+0+Z37kdVh7fq6
         d+zLcaBzoGzxOAd8IIlWwuXPIss0v1GZHeBJFbCSRZYjYyirzeoZTE6bRfwgIRNCT7il
         qUBamO2I7QXX5bP26WAQ/BYVF/CxPLj82dd97zlKiPg5feeUa5mriE2oX6RNyWW9WRH8
         IVYg==
X-Forwarded-Encrypted: i=1; AKwUvBzeBosjfi0t3/SPm5TyLjJSI9HPiOUZRiXEDlNSCTDkCTF6+zOINyNA6IJ1WZhY+k5koxOjZdKC7ZdRibs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoBIdAuFRoHdO9AJhoBQnxFFHOJAuCpohPbeSU7nEmw7YAkONs
	dvuRPnIFyxVNLhzOmQ2hxVZPzQwp5vEorlaLL25cc/C17m+mW56gnH0YcgZohqnzMUv61ktYrrt
	TvSX9CcnEUKVo2W+g0oF8Wqyh/qmDwsw=
X-Gm-Gg: AYBFou0Vw/qIqGWBHxGZ2gj9pmQp6LV0v4X/EYiBmo98raUPR58Ovc9pVuQ8O8kGWJl
	pQc5HeeonKZtjDCYJeiL22PFsofvBq+UK0kvIbAlUQIVsB1jnNcXg7ayD0aaFHsdB01yPq9vUjN
	MiL3k8Q+b+7r2N+iIT6SiEpJoknghPLVv9+/XD9eR3BSWEQ+Yi3W34LkkkhLLJTpC6O/KaH/1pU
	9g0bZqsoxbyJUcXrEtHQPYO+WT9A5Uabd1Mi+c714kqcp5ooCyRRk13qbEIHad9b5jwH+9RXEDV
	X/Z/9a42tqd6snIGsYgWrvTrGKf05G/q+jdq0omRtsqY2ISU/+cC0FWoTvDk5rCrsDGzQsxFbki
	2EKAGA348zTTWLqz0tvlC9tavKEW/X8fzlzLmb7pdHc5ffpkvdS+rh83dnMMo9Q2sqA4ZFEc=
X-Received: by 2002:a05:690c:dd4:b0:8b1:60a1:cd3b with SMTP id
 00721157ae682-8b1b5c17da0mr25103967b3.24.1793214239135; Wed, 28 Oct 2026
 12:03:59 -0700 (PDT)
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
 <CAMw=ZnR54hMBwGTps23t9Mm_VO1bAvmeX8uTf_VJ0rJsFNMLuw@mail.gmail.com>
 <37b653494cf282c6e428e2ae8fd781a0ea69bf3f.camel@HansenPartnership.com>
 <CAMw=ZnQU0PRSn5gh-QNT+GuKroQaRsRUUMDB=rM=LSX+=h-JkQ@mail.gmail.com> <ac7d9af1336f86baf2dfbe417944298a3ff6edbb.camel@HansenPartnership.com>
In-Reply-To: <ac7d9af1336f86baf2dfbe417944298a3ff6edbb.camel@HansenPartnership.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 28 Oct 2026 19:03:47 +0000
X-Gm-Features: AclHuK_dsl-iiTAA_RkgI0lW_me3PKlvDAD9Xjk5WqhnflULesXoa7TLNE1dmyA
Message-ID: <CAMw=ZnQA8nZnF-khYkKfY9L4dtB2hmmbzHyKQrf_Vf1scVNM8A@mail.gmail.com>
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

On Wed, 28 Oct 2026 at 16:14, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2026-10-28 at 14:26 +0000, Luca Boccassi wrote:
> > On Wed, 28 Oct 2026 at 12:42, James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > >
> > > On Tue, 2026-10-27 at 11:07 +0000, Luca Boccassi wrote:
> > > > On Mon, 26 Oct 2026 at 12:57, <luca.boccassi@gmail.com> wrote:
> > > > > I think there is one issue with the design pattern where
> > > > > keyrings are set up in userspace, that I have mentioned a few
> > > > > times already and I got documented in
> > > > > https://www.freedesktop.org/software/systemd/man/latest/systemd-system.conf.html#RestrictFileSystemAccess=
> > > > > as well: they are trivially bypassable if the kernel has kexec
> > > > > enabled and it is signed. The security model relies on the
> > > > > "good" userspace running first, but if kexec is enabled,
> > > > > there's no guarantee that will be the case, and as far as I can
> > > > > tell it gives root trivial capability of overriding it and
> > > > > extending the trust chain as the attacker wishes.
> > >
> > > The attack sounds doable, but it also seems to be exploiting a gap
> > > in kexec policy: kexec is supposed to behave like a warm reboot so
> > > if boot policy requires UKI only then so should kexec and that
> > > sounds like the thing that should be fixed.
> >
> > I don't think that's the case though, even before KHO/LUO existed,
> > kexec has never really behaved like a warm reboot, as for example
> > boot services do not run again, so various chains of trusts are not
> > reset  (eg: a bootloader might now be blocked so warm reboot would
> > not work, but kexec would). And since KHO now exists, the difference
> > is even greater, as more and more state is retained across the
> > boundary.
>
> But still, a lot of people are using it for servicing reboots so it
> does sound as if it needs policy control.

And what policy would that be, given there are dozens of different
ways to boot a system, each with their own particular methods of
establishing trust? Even the most common one (UKI) was tried several
times over the years to be tied into kexec, but to the best of my
knowledge nothing was ever actually merged, as in practice it's really
difficult to do, there are dozens of ways of doing it and no apparent
agreement on which way to go, and so on and so forth.

> > > What's the mechanism boot uses to ensure UKI only? So we can see if
> > > it can be adopted to kexec.
> >
> > There isn't one, and I don't think there is correlation, as booting a
> > UKI is not the only way to boot a system. Eg: this problem applies
> > just as well to booting an arm system on uboot. So I really would not
> > tie this to UKI or UEFI specifics, it's more generic.
>
> Well here's the problem: I agree root could kexec to their own initrd,
> but it looks like they could also properly install and reboot to it, so
> it doesn't make that much sense to plug one hole without the other (and
> when they both get plugged it does make sense to use a similar
> mechanism).

That depends on the firmware and bootloaders involved. It is true in
some cases, but not in others (again, setups using uboot for example),
and in the latter cases the hole exists only at kexec time.
