Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C83C9885;
	Tue, 13 Oct 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899258; cv=none; b=WAl9jntT5BUA34t9KrIZRhkK290qw6gG0btPne0krHYawnfBhA9RcGMMyfh36RJOxQjz8HRvbpr6IYtdLASAyMzvHHuQjz5nIobMhi+44PbuQ7uvRscLwhTC7+6j5Ke6QlPcFLl3CFMQ5emG8PsGsGESd7+yhLhg89Hbb8FkWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899258; c=relaxed/simple;
	bh=/QTI9ocIwxDrICmupBcnt6yYBFq9ABOE/kC6kYQ+y2E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Plk8m00cRA3YwtV9T2kmkvOD6NZzAJ7FREXNsfaOgAZSBQycx6cWHAQqVxWOuWIEtHDczXwsvgIU/MPT4tiGuGhjT/mh30EsPhW4q1Ncrkmfrq/5jW1irWB14zRDEOIZKGur0gHtmG9pytT/lm9G5Hop/eIwk56jqkBDwkKjYyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j8LPKNmu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j8LPKNmu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E41DC653ED;
	Tue, 13 Oct 2026 13:48:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C31006075C;
	Tue, 13 Oct 2026 13:47:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A46D11D7152C;
	Tue, 13 Oct 2026 15:47:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791899247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/QTI9ocIwxDrICmupBcnt6yYBFq9ABOE/kC6kYQ+y2E=;
	b=j8LPKNmuWjOc89bbqryTjh2mFaBVGvdBpmvsGoiXlDg1um4sn42m7kEfgMClmS0f7Bt86E
	MvSjq0cPpdez22kyAdV9Bv4x5J9ZT3Ir/oYbPMttE2832nsIs9rQd+/NcULu8wpu8voXPT
	2IrCQQvmo5hGtJx17gW5UCUa7/xVDubkcdFG50u4s1RGqRKQ7lg6+CJ6SiEnmpjI47Vrv1
	0eGyawMZnXNcikNX66tH1pOJwvkduqVKEq3NDizn2POjLf/px3Yk7L3foZUhwjrDnCkE2K
	CGcVP2PkT9KmAeBMddz6oMXwzWvkTj7R0HCIWdV/3g5zKLj1MhRlFw3PMquFEA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 15:47:15 +0200
Message-Id: <DM3R9KIGS2XF.35DX6I83JKPYO@bootlin.com>
Subject: Re: [PATCH RFC 0/9] drm/panel: add atomic state
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Val Packett" <val@packett.cool>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
 <asyAObcpbFy3OeE2@houat>
 <7pptulwzceqg7xozps5boncgcpd5fpw2pdabcslp4den34ixjn@rzgkoe36itwm>
 <as3sI-N3VeG_pL0U@houat>
 <lm7u5tcnccbtbxqeyyqzzvmmhpy2dfhgnyz3giqtt5toejy7pj@7bwixidtqxfz>
In-Reply-To: <lm7u5tcnccbtbxqeyyqzzvmmhpy2dfhgnyz3giqtt5toejy7pj@7bwixidtqxfz>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 13, 2026 at 1:57 PM CEST, Dmitry Baryshkov wrote:
> On Tue, Oct 13, 2026 at 10:37:19AM +0200, Maxime Ripard wrote:
>> On Tue, Oct 13, 2026 at 10:51:38AM +0300, Dmitry Baryshkov wrote:
>> > On Mon, Oct 12, 2026 at 08:40:33AM +0200, Maxime Ripard wrote:
>> > > On Thu, Oct 08, 2026 at 04:14:22PM +0300, Dmitry Baryshkov wrote:
>> > > > Panel drivers don't have an atomic state and so they can't handle
>> > > > additional data to be stored at the atomic_check time or to be ret=
rieved
>> > > > at the enable/disable time. For example, it prevents panel drivers=
 from
>> > > > supporting multiple display modes or making DSC being optional in =
a
>> > > > clean way. Drivers like panel-novatek-nt35950, save the connector
>> > > > pointer in get_modes() and later dereference
>> > > > connector->state->crtc->state from prepare() without holding any l=
ocks.
>> > > > The panels also have no way to reject the configuration they cann'=
t
>> > > > handle, as it doesn't take part in the atomic check.
>> > > >
>> > > > The panel already embeds a drm_bridge, and the bridge has an atomi=
c
>> > > > state which is property handled. Subclass it to provide atomic sta=
te for
>> > > > the panels. The callbacks can find the state of the other related
>> > > > objects (e.g. CRTC state to get the display mode).
>> > > >
>> > > > The atomic state is opt-in. A panel that doesn't implement the sta=
te
>> > > > callbacks keeps working exactly as before, with the plain bridge s=
tate,
>> > > > so there is no need to touch the existing drivers. The panels whic=
h do
>> > > > implement them can only be driven through the embedded bridge, sin=
ce
>> > > > there is no commit to hand over when the host calls drm_panel_prep=
are()
>> > > > and friends directly. Those entry points warn and refuse to handle=
 such
>> > > > panels. There are still a dozen of display drivers calling these
>> > > > functions, and the panels used with them can not be converted unti=
l the
>> > > > hosts are switched to the panel bridge.
>> > >
>> > > I really don't think we should extend the panel API. All panels are
>> > > bridges now, consumers only care about bridges as well, and the brid=
ges
>> > > API provides what you want already.
>> > >
>> > > Why not simply turn the panel drivers we want into bridges, possibly
>> > > with a bunch of specialized helpers to manage a panel state, and cal=
l it
>> > > a day?
>> >
>> > I think that panels provide good abstraction on top of the drm_bridge.
>> > For example, bridges don't have orientation, panels do.
>>
>> That's easy to add.
>
> What would it mean for the bridge? I was thinking about pulling
> orientation from the per-panel code to a generic code path, including
> reading and handling it. I'm not sure if it should be done in the
> drm_bridge code if we declare drm_panel deprecated.
>
>> > Also panels have followers, while bridges do not.
>>
>> Ditto
>>
>> > I don't think that either of those APIs make sense for bridge.
>>
>> Why not? In a world where we have bridge hotplug for example, it would
>> make total sense to me to have bridge followers. I think Luca even had
>> that at some point in his series (and still might?).

There's a simple notifier mechanism: see core [0] (with currently psoposed
events [1]) and users [2][3].

The events [1] and their semantics are not well defined as of now, so we
are still on time to decide from the beginning whether it should be very
bridge-hotplug-specific or have a wider scope.

[0] https://lore.kernel.org/lkml/20261001-drm-bridge-hotplug-v2-14-8e34986d=
cb68@bootlin.com/
[1] https://lore.kernel.org/lkml/20261001-drm-bridge-hotplug-v2-14-8e34986d=
cb68@bootlin.com/#Z31include:drm:drm_event_notifier.h
[2] https://lore.kernel.org/lkml/20261001-drm-bridge-hotplug-v2-15-8e34986d=
cb68@bootlin.com/
[3] https://lore.kernel.org/lkml/20261001-drm-bridge-hotplug-v2-16-8e34986d=
cb68@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
