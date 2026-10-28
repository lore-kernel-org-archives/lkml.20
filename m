Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199434;
	b=VRHPaT/3660wJHe/RnAEeKn45bHhWyYkUsqR4q5FYEhenLzw2f0KexOARQMZVff6ryoK
	 60sieNxdQ/3Nnf8cxdTWkJJ7qx7qrxC7tCB294q/rfgpke/vdriknNYye8CTGiuTGAeFX
	 3KVGkJNuusbCWez1quMdixJmxLQGNSlZzFOxiWSeR64m3LmukZqBr4Be5bYjjg5DJxYgS
	 M+V1rFgL8jtbJ2yrndyXO+LkrWeR53m6XyZuoz/OkrkajyUmyt3J6jjVWiyo4wSGC/ufq
	 Do2D0/Vx61H86VIk09WoMiSWd7l21L2nDF+fIwObRCI7tpQb3FrMacuWQbAbtKqVu+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199434;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=CoPZ9bZ1JfxYkZSWgqFP1SNfY/PR7Bkxfv9+CJFVndE=;
	b=CqIJlXj3KmZVZFffzY9LXcFsC00v2qYAKHy3czCtqnTMgF3cbkmmldi+NdB5Wr4b+jE9
	 WrpdOR6NgKpKu8UhSG1QWax6i3I44Gq/pwaw1X2luKgewz16Dfpo5k3WEA5gGPqJXee/R
	 ZIGyc0EM6jz5gG3YOhfgkMpe3gsTFWMIpha6Q+QtRwXMPJwc6T1QChF5+8Cbi4dTpDDXl
	 30IPOGcRKrlhpzbZ072UrviYjB6bEYLO7owl1W59YIkcBnjyGcTneIZkanQ2xjqRRm7G7
	 EDsLtvOJubIve63HiZNh3j/MD2bcX693+Tc2j9LvAORG34Opw/jrXTYSVKSojBvDwSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ly7btzAc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C56606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ly7btzAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9791F01829
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199434;
	bh=CoPZ9bZ1JfxYkZSWgqFP1SNfY/PR7Bkxfv9+CJFVndE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ly7btzAcgI8DSYXiri5X1CFDQGPjvpCFhks2uprh/Q7PSzBqDkFvR1dK8uOQizpfL
	 Tu3G6D3UFfIiUF2r1EM4nWbCvYd4Gi1NlGNamAoeFtqJTyKkHEM8Q6rwoTg7leuusV
	 HRpF6fu0eIGoZSfxTkVToQdBdcbTsyIP1ldj51mHTPBBZWNDO13pYIo+Xl/GQ37xL8
	 1jZ1WJ6Izhtt35Pa2AoA4tDcYPvMvN6uAeoexnkqkztHNFE4eeDx166qtdKCvHoEo5
	 XFjU/kHJu74S30cjZOm8APZjDSx0DrCBGsvrZt13Nylh8vI4S0r6nLI6LRdTgYepad
	 18G7VLH6mfxJg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3aca0bf7fd0so3770321fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYXiUdb0M3j7MrqIXyZ08i61qh/7ULMArl6NiBVQGyZE7M62Ccf3j15rK8nJ06DtVD1TKrvsLQQJOiEMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg2HLxgNDiWJQYELBobinsQc+6X8kXPqAWRWcvwm2ZV68TRiYA
	Pe7vf39hqvJphvmiewFAeUfHXL5/Dm8A4Ilcu+xm/4wXl/RWjo9n2e4Y7nqf/TKrWIW+C3tD2D4
	6JBuMhQcZaOe5ZK5jRKiU8qsE9zMNgcPACHcujBqD/Q==
X-Received: by 2002:a05:651c:545:b0:3ac:41ca:1104 with SMTP id
 38308e7fff4ca-3ac9cd18eb6mr6038071fa.0.1793199432903; Wed, 28 Oct 2026
 07:57:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 09:57:11 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 09:57:11 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <179319850512.1175157.6497185322070247884@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082549.662885-1-dmanresa@gmail.com> <179319850512.1175157.6497185322070247884@gmail.com>
Date: Wed, 28 Oct 2026 09:57:11 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me+YxMji7N2o3iksh-1ZC_ruBsQpxh_xktbHFkeZBxDqg@mail.gmail.com>
X-Gm-Features: AclHuK_0nUuHwOQ1NO522yTX8cvpHIe2hJ_RPxWSJ1He1R9EGj-tAd3Drrug8pY
Message-ID: <CAMRc=Me+YxMji7N2o3iksh-1ZC_ruBsQpxh_xktbHFkeZBxDqg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse
 the software nodes on rebind
To: "D. Manresa" <dmanresa@gmail.com>
Cc: linux-media@vger.kernel.org, Eduardo Ruiz Duarte <toorandom@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans de Goede <johannesgoede@oss.qualcomm.com>, Dan Scally <danscally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Fernando Rimoli <fernandorimoli11@gmail.com>, 
	Sergey Lebedev <lsauz@pm.me>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 15:41:45 +0100, "D. Manresa" <dmanresa@gmail.com> said:
> Hello,
>
> Eduardo, Andy, Bart: an apology, and a caveat on this series that comes
> out of your thread.
>
> The cover letter above says that the asymmetry underneath 2/2 is in
> drivers/base rather than in the bridge, and ends by offering to send a
> fix for software_node_notify() "if it should be balanced there instead".
> I wrote that without noticing that Eduardo had already reported exactly
> this on 11 October, with a reproducer and a splat:
>
>   https://lore.kernel.org/linux-media/20261011131518.48838-1-toorandom@gmail.com/
>
> that Andy had pointed it at the core two days later, and that Bart had
> answered on the 15th that it looks like a bug in swnode.c and that he
> would send a fix proposal. That was on the list I was posting to, eleven
> days before I posted. I should have cited it instead of presenting the
> observation as mine, and the offer at the end of my cover was redundant
> with Bart's. Sorry for the noise.
>
> The analysis in that thread still holds on current mainline, for what it
> is worth: the code it quotes predates c393ef0741d4 ("software node:
> provide wrappers around kobject_get/put()"), so the calls now read
> swnode_get()/swnode_put(), but both are plain passthroughs to
> kobject_get()/kobject_put() and nothing else moved. The put in
> software_node_notify_remove() is still outside the "if (swnode->managed)"
> block, and dev_to_swnode() still resolves dev_fwnode(dev) and then its
> ->secondary, which is what makes the two sides unbalanced: at device_add()
> time a device that has no secondary fwnode yet gives NULL and
> software_node_notify() returns before its swnode_get(), while at
> device_del() the secondary is set, dev_to_swnode() resolves, and the
> swnode_put() runs.
>
> Now the caveat, which is the part that actually matters for this series.
>
> 2/2 depends on that imbalance on purpose. The reuse path keeps the
> reference that software_node_find_by_name() returns, instead of dropping
> it, precisely so that there is something for the unmatched swnode_put()
> to consume on the next device_del(). That is what makes the count flat
> across a PCI remove/rescan cycle (4 -> 3 on remove, back to 4 on bind,
> over 16 cycles) rather than losing one per cycle.
>
> So if the core put becomes balanced, 2/2 as posted leaks one reference
> per remove/rescan cycle and the IPU node is never freed. Eduardo's patch
> is in the same position for the same reason: its fwnode_handle_get()
> before set_secondary_fwnode() has no counterpart once the core stops
> putting what it never got. Both are compensations for one core bug, at
> two different sites, and whichever core fix lands should take both of
> them with it.
>
> They do not collide textually: Eduardo's hunk is in
> ipu_bridge_instantiate_ivsc(), on the mei-csi device, and mine is in
> ipu_bridge_init(), on the IPU PCI device.
>
> Sakari, Hans: given the above, I would rather you did not apply 2/2 as
> it stands. 1/2 is independent of all this and can go on its own. I am
> happy to rework 2/2 on top of whatever lands in swnode.c, or to drop it
> if the core fix makes it unnecessary.
>
> Bart, if you have a proposal in a tree somewhere I can run it on the
> Surface Pro 7+ that produced the numbers above: three sensors on IPU6
> across PCI remove/rescan cycles, with a module that reads the node's
> kobject reference count directly. The machine is being given away in a
> few days, so that offer has a short fuse; after that I have no IPU6
> hardware and someone else would have to.

Yes, I've sent a series[1]. So far no reviews but please leave your Tested-by
under this thread if you could.

And yes: with the driver core change merged, the code in media should not be
changed as it will lead to a reference leak instead.

>
> Assisted-by: LLM
>

Does this mean you had an agent write this email? This would explain why it's
way too long for what it needs to say. :( I have nothing against using LLMs
for writing code and reviews but would appreciate it if we could keep human
interaction, well... human.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com/
