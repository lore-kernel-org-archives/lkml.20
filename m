Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F403339B41
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582531; cv=none; b=CJhaDNh3BR4JuW86RRBQpOD42xrGYAsZQ36afj4C59+8X+dqzCWkbwP/bcm8+SaYZMsrOyfjBK1bmHHaVE/W/13ap+I8i7Gq6+e/xJ5bVnyYsNUdgwGT/jp67jFOaD5BVotW3g1qfhOhKQltRQgrvTek6jN4es5tV7gcvi8+abE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582531; c=relaxed/simple;
	bh=nhLyzFLbeYwxkREFnGh9PJAu9SCFWSJxG53+Un2C+Xs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=aWIo58yYPz+WytHReR3P9hyDs9wgU9McgqaWOYS+4/T8kuEWIRkkhrbD3w49mCClVkxvUb1L+ziI1lABAy6wuyciuAyr76GnS1lFXkKcMhhWDfi/dpXja0VCY2+JP3g0oVFW+N6jrvztBq1Pdq4+bBciyTJOqdWmmmLeDZ/weR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frc3MO0o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frc3MO0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0827A1F000FF;
	Fri,  9 Oct 2026 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582530;
	bh=nhLyzFLbeYwxkREFnGh9PJAu9SCFWSJxG53+Un2C+Xs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=frc3MO0oLwoW78KYn9WR2TYojNVZyRylZGUJvnECnSjMLbzA9ex6iqrviOc0mk+p7
	 RNSblRdShqysDtvAJgj2HjufYQ+5RSpbV0Em1490xs8Bq0rWS125mUAceqGZZx0NN3
	 1Q8oCLnt/zw/JFdleVZp7gY/t4fbefTiYa+lgbK7K/q8aUY7NEau5lYgHbWlRwZeKA
	 Wmu5/nGXWS0hvoys/dXmStdNptC0Xv4jiTqu5gQVvV2DXbS6Lx3wXqTxnuai+PBf4i
	 wbhzHoquWJoqn9dmgIrFGRczQKiBoiRO06CFIt4P6bpmqAXV1zRQ2FsyijEdbqMvMH
	 W7CYwke/YM3YA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:48:46 +0200
Message-Id: <DM0N02GT1YII.Z30F7OBT9XKX@kernel.org>
Cc: <jim.cromie@gmail.com>, "Lyude Paul" <lyude@redhat.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dave
 Airlie" <airlied@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Campos Ramos" <Capitain_Jack@yahoo.com>
To: "Jim Cromie via B4 Relay" <devnull+jim.cromie.gmail.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/3] nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
 <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>

On Fri Oct 9, 2026 at 7:44 PM CEST, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>
> When graphics engine firmware fails to load or initialization aborts
> early, nvxx_gr(drm) returns NULL. Calling DRM_IOCTL_NOUVEAU_GET_ZCULL_INF=
O
> causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at offset
> 0xf0 without checking for NULL, triggering a kernel page fault.
>
> Validate that gr is non-NULL before inspecting gr->has_zcull_info.
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Please add a Fixes: tag and CC stable.
