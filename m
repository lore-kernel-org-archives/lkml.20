Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA2D4AB3AA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685713; cv=none; b=HjccezmbTgKdlDOmQ8H7LwaNlXokH2FqHIJe3fAuqhcFlL2uYajyC1peft9+m1v6CEuvxSRt1aEQvb7FQ+bMf1scpIAeu16vrtWYTaETs3yLXggXGV7Nn3QSHIMgmJofz3o3CmaJBWmMROcsvHumj3Gp9hvXJ7kGBPrw8lJY8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685713; c=relaxed/simple;
	bh=x8dJutPCFqdfkx8N765ADRUz9RAxSutdjnlXtXVNKjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOyLCjvxSR+0UFkKTCrwjJxXfVENnBT2x+S28xTXUfdNS+1bP6EeyhKE6WGA/Yfi+1qqOOkzakU6BgqF8HEEb/j5wGs2o+PcLUz5sUX54NzHjVjb4/xPwFTXb6PgGht+VBt3VHgyUxNIcpdZDQovB70iyOhDfCoVRmIBArK0iVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Bzd83PbU; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Bzd83PbU"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 25B143F480
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:55:04 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 5B4583F8C0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:55:03 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 13A3A200577
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:55:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1789685702;
	bh=x8dJutPCFqdfkx8N765ADRUz9RAxSutdjnlXtXVNKjQ=;
	h=Received:From:Subject:To;
	b=Bzd83PbUDy55g5Q3EXGRA93oTEwbDvv92fRUsqn85Y2O9QAEUfI6DjMN7iPeljS5f
	 73RUhR6vKoOyhLPKMosU2brjr8IPSbb8PY/3wHjOzE9yOuE0RHQ7dcfln2BLRV1Sob
	 xhDf4+w75X/EQ1pjMRzO9j3Zdhn6i8pSAUlfrnfVujQoN0naBikepc2dnCmAOKkVfn
	 YLFAz9FeTFGvfFsLySh0lXAWI6lE3xzYmx2dMjQgnFpLzvbXT1V++C+8L3oVaww2u7
	 JOkUggJaa5pk+DaRwivLTbcacDv58ZY6GkAefd31SO9iS38G1TWQ+yZhMRufzq/z/n
	 ZgtD6NJsAbuHw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.230.204) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-qk2-f12.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-5309a20a55bso875591cf.1
        for <linux-kernel@vger.kernel.org>;
 Thu, 17 Sep 2026 15:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxvrNqQmLeC1NSoH0fnCvP7Ut30yxLVT3qfr3ntj3HLm/5aQUsK7IT5GcLx5kXsTLmqy/jg0PBXtuIpdGU=@vger.kernel.org
X-Gm-Message-State: AFuF++kBCjlh3x4EctaId6Q4Bs2GanijjINTzGU/8KXbiL/4Ko8fkU+N
	7Cux/23Rsvv3qRlYtBHXMrhk9mYqfGUXDWGsqh3AVaj2HsnkREbd0XQKODh+1dwFMk8lvyZBcdS
	A08F02H5kfujD/cYIiv/LiOhcxd4lGG4=
X-Received: by 2002:a05:622a:4d0f:b0:532:9adc:63bb with SMTP id
 d75a77b69052e-5329e54b1demr12161021cf.76.1789685700622; Thu, 17 Sep 2026
 15:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwEkgP9-VwhW81=WEvJOac5iD+PFO4tA4eVrFP_qDVaiWA@mail.gmail.com>
 <20260917222327.63999-1-hello@matias.me>
In-Reply-To: <20260917222327.63999-1-hello@matias.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 18 Sep 2026 00:54:47 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGykWJFovoT3wEaTn54tpW-5Fo=Dym=RxtTg_Vk+DJgYg@mail.gmail.com>
X-Gm-Features: AcwNN1VlQ546YbCygXwHhHsOnspKTvi6jbSQJqY6vuSHmUt0pgiHTXxpe-6M698
Message-ID: 
 <CAGwozwGykWJFovoT3wEaTn54tpW-5Fo=Dym=RxtTg_Vk+DJgYg@mail.gmail.com>
Subject: Re: [PATCH v3] HID: ayaneo: Add AYANEO 3 detachable controller driver
To: =?UTF-8?B?TWF0w61hcyBNYXJ0w61uZXo=?= <hello@matias.me>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <178968570268.329066.4034476748916102990@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 18 Sept 2026 at 00:23, Mat=C3=ADas Mart=C3=ADnez <hello@matias.me> =
wrote:
>
> On Thu, 17 Sept 2026 at 23:48, Antheas Kapenekakis <lkml@antheas.dev> wro=
te:
>
> Hi Antheas,
>
> Thanks for going through v3, and for all the help along the way. This
> driver exists because of your protocol work in Handheld Daemon and
> your reviews of every revision here.
>
> > After you submitted your patch series to the lore, why didn't the
> > review take place here and take place downstream?
>
> Sequencing rather than intent. The OGC kernel folks wanted the driver
> submitted and tested in their tree first, and their maintainer's
> review landed on the already-merged downstream PR after v1 and v2
> were on the list. I folded it into v3 rather than ignoring it. Agreed
> that from here on review belongs on the list.
>
> > The rby Denis should not be added by you. It should be added by
> > denis by replying to the mailing list and then you carry it forward
> > on future revisions (for provenance).
>
> Understood, I carried it over from his downstream review round.
> Denis, if you are still fine with the driver as of v3, could you
> confirm your Reviewed-by here? Otherwise I will drop the tag in v4.

As I said, none of this is your responsibility.

> > Consider exploring similar ABIs in e.g., Legion Go S hid and
> > mirroring their ABI. Then remove this file. This is not the only
> > breathing device. Moreover, delta_t values are ignored and you are
> > introducing an ABI for them?
>
> The delta_t point is fair: hw_pattern accepts timing values this
> firmware cannot honor, and the sc27xx precedent does use them. For
> context, hw_pattern was my reading of your v1 suggestion to find an
> accepted ABI for the pulsing mode, and the downstream review
> preferred the generic trigger ABI over adding a custom effect
> attribute, so the two reviews point in opposite directions here.
> hid-lenovo-go-s documents its effect/effect_index attributes in its
> own ABI file, so a doc file exists on that path too, though shared
> with a second driver it could become a common one. I am happy to
> switch to effect/effect_index mirroring hid-lenovo-go-s (values
> monocolor and breathe) if that is the preferred direction. Jiri,
> Benjamin, a preference either way would settle this.

If there is an existing ABI, you shouldnt add a new sysfs doc file.

https://github.com/torvalds/linux/blob/b5a051f6b840d48f159166ef073d3021989b=
fb50/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go#L1-L13

There is an existing class of device in the same space with a new ABI
that does exactly what this device needs. I am really not sure why you
were guided on a LED PWM interface by the author of that ABI.

You need to modify that sysfs file in a separate patch to make it
generic by removing go.

> > I am not sure of the struct naming or whether a struct is needed in
> > this case. if you do not use most of the report, consider
> > documenting it somewhere else and doing direct accesses to the
> > appropriate bytes.
>
> The packed structs came from the downstream review, mirroring
> hid-lenovo-go; they replaced a set of byte-offset defines and the
> static_asserts pin the wire sizes. I would mildly prefer to keep
> them, but I am fine either way if the maintainers have a preference.

I am also fine either way. I'd prefer what is simpler.

> > If you set vibration, you need to expose it to userspace. Otherwise
> > this driver degrades functionality over userspace implementations.
>
> Agreed. v4 adds an attribute for the vibration level (the firmware
> takes three) plus an index listing the options, instead of writing a
> hardcoded default.
>
> > Prefer removing semicolons; they have a particular smell ;)
>
> Will reword the comment.

All occurances.

Thanks,
Antheas

> > Consider dropping the hid_device ... check block unless it is
> > necessary. it seems like a premature test that can go wrong and you
> > touch the device. Particularly, hid_device_io_start is a bit
> > unconventional.
>
> Agreed, v4 drops the probe-time status check and with it the
> hid_device_io_start call. Every sysfs read already talks to the
> device live, so the check adds nothing, and without it the driver
> generates no traffic unless userspace asks, which also keeps it inert
> next to userspace implementations like yours.
>
> > I'd suggest waiting a week before the next revision and up to two
> > weeks for jiri/Benjamin to reply with some comments as I think I
> > was the only one that reviewed the previous revision.
>
> Will do. v4 waits for Jiri and Benjamin, and goes out as a fresh
> thread.
>
> Thanks again,
> Mat=C3=ADas
>

