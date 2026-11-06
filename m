Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984282;
	b=BOvyKK8xEr7e3/9shODJ/h2vqXJTKLVr365nebVZFze3svSZoX8YUI+42wdakCw6XpbG
	 43cS7HkjBwolV8DtwapPKg2EhfuzLTz2Z9P8kuYBv9st2XDHYpL1tAQxGh4mAoc8a0+M1
	 Q7kpBEmdGGvw548F17UFYrPlqV2hJnyL5YN5ZJCEc4fWKHCfYeHXr/aYBmSFXpuYwGg4N
	 l2oAFaZNYADynrDGbd6oob3CxnA7Iem4WYKqbPGh92l1nLdjv6GJ9h+h/5xtfl3iGZoWs
	 Hwdv3GGfBcgSZh33s3piVc6CFvL2FDwSOZMgDZaU/SiMMR6VuMcWOzHZlrKVZfvtr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984282;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aapcxwLu2g1WrQp7s+HjqvVRyAq/ZI+SBlLC9jFvL6k=;
	b=gb7diu8OOMl44uoLIBjhHnUZa24eiMaZuo4e+yMgUkl9QDmxLCKplkYW3uC+Z6BiG27C
	 IXn4oH94neKVdP6U31gHpaBkK5acvsXPdSmoSlbXs5Ix5M8pAOSOOrIfgbuAvfr+nH3aS
	 jxwfWU7Bpxv/Ii0hvok0DG8hTAdMLgEEPZ7dVUwGLFqItD2RWNA+fhA3dGOwa7qku1ffn
	 fLYQUqSr4S43/8y7qGKcyZeirihy/94+sDnQsV/YoS1EwOkd9EI24HP5W55mZ9SRc8klc
	 JdNgnppaRuCR24lCjH+BEjCInJMWMvZwO0n1Nnmx3tSEwRj8x47VIXU4BtaSe3UAXyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cz29no5d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cz29no5d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C9C1F008A5
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984282;
	bh=aapcxwLu2g1WrQp7s+HjqvVRyAq/ZI+SBlLC9jFvL6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cz29no5dD8JqRMxH+gjr48QKoSbORUNivGHRgf2jb3ac0pYoJTIbrM0CQk4JsIZfr
	 WZBUybCsFHPjz8qKOxMis9cn9Y6RSBnbzdjB3aqLkXlttBBvPXXz+VH2F0lqhR46DL
	 Y+n32Fu9LzeM1ET3+uhSR6eHeKnJQRESALqnqLt3HDOZhp39Om+OpJk4EdYp/XZCkp
	 EgawQfKfYNQaJLLHvQyaEzydAbwArJWSroM61WJ2E03/4tdQ9Espwy5ViJTq3zWzI0
	 rimulrD/pAhWFfQvgpG7OEnupITH2coIZJtHK+UPmINMMvoZycVPcc8dtcex3BuFKm
	 TDhyFEPwVyu+w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso791338e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEnVcrLm9K9Yqo0O8gAv6WeRZwiNDulBzTbCxmWwVqnsnfYH2aXtalogguAT1mtRcJsZXx95fkPk983PMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99/amaW3PyioFJ62apuFIPdySW6A3Ol7OtDblH3lOl4jtKeF4i
	Z4fJ7yaTSAqwx4PfnDkXjmqPt8rIsBgqKifHSVuBue6lqkz3biybrOde5bWCsQZ2tQD1RlbFul+
	+ojL2fANorYnelzsPmiuffiCLxtBw8UM=
X-Received: by 2002:a05:6512:12d6:b0:5bf:ddd7:8897 with SMTP id
 2adb3069b0e04-5c003ac9e96mr980574e87.23.1793984280585; Fri, 06 Nov 2026
 08:58:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-superm1-s4-at-s5-v1-0-313e0012dd39@kernel.org>
In-Reply-To: <20261102-superm1-s4-at-s5-v1-0-313e0012dd39@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 6 Nov 2026 17:57:47 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i07G06GDGX76f3-ppumfNUFD0nTB-Wz8k4PS=Ra13CsA@mail.gmail.com>
X-Gm-Features: AclHuK-nGOJX3yYmWbdI-i74p7cGw89wKvjKOaX_tvZvRUMd-zE7Ztxg-_gdiaU
Message-ID: <CAJZ5v0i07G06GDGX76f3-ppumfNUFD0nTB-Wz8k4PS=Ra13CsA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Use hibernate callbacks when shutting down the system
To: Mario Limonciello <superm1@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Denis Benato <benato.denis96@gmail.com>, AceLan Kao <acelan.kao@canonical.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	=?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, Eric Naim <dnaim@cachyos.org>, 
	Bartu Alev <bartualev@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Driver Core Devel <driver-core@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:54=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
> OEM systems that ship with Linux preloaded need to go through energy
> certifications that match regulatory bodies in the regions that they
> will ship.
>
> If any of those certifications don't pass then OEMs might not be able
> to ship systems preloaded in applicable regions.
>
> Multiple models of systems are reported to fail in Linux but pass
> for Windows on the exact same hardware.
>
> By looking at a breakdown of power consumption across devices the
> issue is that some devices aren't turned off when user puts the
> system into S5 (shutdown).
>
> A few years ago when I first root caused this I submitted patches
> to PCI core to change the PCI policy at shutdown [1].
>
> But through various iterations I've come up with a better approach.
> Instead of changing policy in each subsystem we can instead
> change our shutdown command to run hibernate callbacks for all hardware.
>
> In order to accomplish that the last 17 kernel cycles I've been slowly
> drippping changes into the hibernate code paths of all subsystems to make
> sure they behave as intended.
>
> Those are all merged as of kernel 7.4-rc1, and thus I am now ready to
> start using the hibernate codepath at shutdown. This series adds that
> support.
>
> I'm not na=C3=AFve; there is definitely risk involved with this change as=
 it
> will essentially affect anything running Linux that gets turned off.
>
> To that I will say that I have been running, rebasing and iterating this
> series on my personal development tree ever since December 2023.
> Various rolling distro community members have also been testing iteration=
s
> of these patches in their hardware and distros.
>
> I've also put a few guard rails in place:
>
> 1. Don't mandate hibernate support. If not compiled with it, just use
>    previous shutdown paths.
> 2. If hibernate callback fail, emit a `pr_emerg()` message but fallback
>    to previous shutdown paths.
> 3. Offer a kernel command line option `shutdown=3Dlegacy` that any affect=
ed
>    user could use to roll back to previous behavior while we root cause
>    any issues.
>
> I did split out the kernel command line option to a second commit.  If we
> later decide that we want to keep this behavior but drop the rollback kno=
b
> we can revert that commit.
>
> Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limon=
ciello@amd.com/#t

I have a couple of concerns regarding this, after looking at the patches.

First off, dpm_suspend_start() seems to be called during shutdown
while user space is running.  That is risky because at least some
things in the power-off code path assume that user space has been
frozen.  I think that freezing tasks, along the lines of what system
suspend does, before running dpm_suspend_start(), is requisite or you
will get into trouble with people who run fuzzers across shutdown or
similar.

The other concern is that the "legacy" shutdown should be the default
or people will get confused.  Arguably, it is not even necessary to
try to change that in many cases.

Of course, this means that the new shutdown arrangement will not be
used to start with, so there needs to be a plan to migrate users to
this new order and I would start with the systems where it actually is
an improvement.

I would try to add the shutdown=3D option upfront in the first patch and
make it take one of two options, "classic" (the regular shutdown
callbacks) or "pm-aware" (hibernation callbacks etc) with the first
one being the default at least to start with.

Then, you can add a DMI quirk table or similar with a list of systems
where "pm-aware" works better than "classic" and expand its use going
forward.  My expectation would be that, at one point in time, the
majority of x86 platforms using ACPI would be better off with
"pm-aware" than with "classic", but I'm not sure that this point in
time is today.  Beyond that, it is really hard to say how cards will
fall.
