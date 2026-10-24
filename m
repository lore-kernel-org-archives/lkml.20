Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792805634;
	b=daHhe7jusDPLMOxvD0Oh6OR3dpyRpL2zDt5RtlJ/dH5fxEFBqqX16sFxNPCcSmClL/kb
	 WAr2H3PLF2VkPmilJocC2uq7pyFcsPSkGYZ7QmjkNjIFJ9anZP/1vLyuzE96XYHo5DEgA
	 k1AjRlQwZVJCIBVcWW6TsjtxCBasClrMCftlZmmhxbWV9w5EGgK+Yn02ukw/7ysX0i3zn
	 WY2E9dVpSIWmq3boHI/gt6uBozaOcO1JmJ86UWybKf3AIuP/QN2j2hiutVq9MsrrMwviV
	 fYcEgIgwYkcKUe0LmA5sPBEc1Y3wqhkeGT2mZkL4qclVokftiXeQYbSFabfwvtK6luw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792805634;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=c5DHhzFtVYI0VDNuw0PcYgMp0bx+/sbaWrxAWif8Ntg=;
	b=1JCNGfRrdcXNnta34jw2mUok9clZlivIo9MogsWkmBtsrfKEvqeOE/ZqkLhIlA8BmOm2
	 cbds+f/2N0vU/9AwZ2gJ7ePrb04H4q34AF4VyHH6FiMDny8khhqIMd9gkd5QitmyBB0Dh
	 YvDshDSMfaALSLpPU6LmhE03VWwGwdOF2T9alKZ8gWrHq39VJ7UTsP5ekuAsLFOTBtufE
	 doFM8BBGydr+ws/0ygWVGa+mjVtJCkR6xa5f5PXAH9+J1n1RLIqlgsqfTlWfNp2VDH1Gw
	 LOFhTIB4U2GX65+2YGhkCG2pfPdc8ONaVAQRhtjflH9oiLkT/itj1Awk7GNiDY3UdaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=rYBo8cla;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72142606A333
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72142606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=rYBo8cla
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1792805632; x=1793064832;
	bh=c5DHhzFtVYI0VDNuw0PcYgMp0bx+/sbaWrxAWif8Ntg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rYBo8claf2lmAiAOKKYb3wwrphQAj21ecsxqNsFw8hDZiCJbEUTaxQzmG+o/Q2od6
	 lEG1RcXdjAyXYcrni9I+9PjpWz3qqKqfXo+ydM7hIaIvm6VqjxrP42m4BhW7oppv9i
	 ogrfpUvkW8TensYGHheGwAh8zcCcTXyDqF+Ve/1aBjx39NvsltI4w6oZysdc7LYUQ1
	 3RK1w3RyoAsSbR4/T+ae68Rm2naHqrFflW4mEWdJGQketGW1hST/h2MLBcQzAGBsrL
	 mZO0rzObO8/O1uMQhdTG1DW0VU42El4KBmLcdNFiSWgFEEjcZTtUe7m7wYO0pQBoXe
	 WAROg+8syCl7Q==
Date: Sat, 24 Oct 2026 01:33:49 +0000
To: Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, roman.li@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, chen-yu.chen@amd.com, ray.wu@amd.com
Subject: Re: [PATCH v2 1/4] drm/amd/display: keep custom brightness curve in userspace domain
Message-ID: <179280560760.1179989.11396695208074498725@empyreal.works>
In-Reply-To: <797bb933-adf3-41c6-8421-ffc3bd6948f9@amd.com>
References: <20260902-brightness-cover-abf809f2@empyreal.works> <cover.1788388049.git.arc@empyreal.works> <8ec5dc8922407924f771d353cb7f2dd1846553ae.1788388049.git.arc@empyreal.works> <797bb933-adf3-41c6-8421-ffc3bd6948f9@amd.com>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 127baa2e3b59a63e08b1254d5c5e4b051f4d8519
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

On 10/12/26 22:06, Mario Limonciello wrote:
> There has already been some competing changes for how the power module
> integration handling works in amd-staging-drm-next.
>
> I wanted to see how your series was on top of it, but it doesn't apply
> anymore. [1]  Can you please rebase your series and re-evaluate?
>
> If it still makes sense (in your view); please send out a v3.

Thanks for trying it. I rebased onto amd-staging-drm-next (77f548b12).

Patch 1 is still needed: convert_custom_brightness() still adds the
firmware minimum before convert_brightness_from_user() adds it again.
Since Ray's "drm/amd/display: map PWM brightness through custom
backlight curve" that only reaches AUX panels with a custom curve on
staging, plus PWM panels on stable kernels before the power module.
v3 has patches 1 and 2 only:
https://lore.kernel.org/r/cover.1792805565.git.arc@empyreal.works

Patches 3 and 4 overlap with Ray's change, so I'm dropping them. Two
things in the new PWM path look unintended, though. Numbers below are
from a ROG Flow Z13 (GZ302EA, Strix Halo) on 7.3.0, writing amdgpu_bl1
and reading amdgpu_target_backlight_pwm. ATIF reports min 12, max 255
and a 49-point curve (50% luminance at signal 98, 62% at 129).

- convert_brightness_to_millipercent() clamps the request to
  [min..max] before scaling it as [0..max]. Every request from 0 to
  3598, the bottom 5.5% of the range, gives PWM 3598, and the panel
  minimum of 3084 is never used.

- The request is mapped through the ATIF curve to a luminance
  percentage, and the power module maps that back to PWM through its
  LUT, built from the same points. The two steps cancel, so PWM follows
  the request one to one: 25% gives 16576, 50% gives 33153, 80% gives
  52428. By the panel's own curve that is 35%, 62% and 86% luminance.
  Passing the request straight through as millipercent would give 25%,
  50% and 80%. If sysfs values are meant to stay signal levels this is
  fine, but then the custom curve no longer shapes the response on
  these panels.

On AUX, brightness_mask is still ORed into the millinit value before
mod_power_set_backlight_nits(), which is an intermediate unit (the
Sashiko finding from v2).

If these aren't intended I can send a follow-up on top of Ray's patch,
or leave it to him if he prefers.

Thanks,
Andrei

