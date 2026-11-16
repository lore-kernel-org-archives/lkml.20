Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814924;
	b=1zgCqogvBuHOwIHhzN9kWxzetfwGEyVdkhOmPxLLTAb6ZOzw01AUMzrLgAqbTehnqaZw
	 UyzamUzySvM+1sHFo4xiMdKvK7zX8ldgquVrY/M+GhPAmQV25nv3MisJJkTqFnpeas7l7
	 s6W1EJV0H7kwYnz+GpJxOGO0tXe8+raEVECTuwr7pAsCJlGU8Ytj96+dOnjQ6gmxY7CBW
	 +zUnRw/7gZ/1W6nyRHqoE15GynSmNasF1oqWPyJJqplHNQcjWlF9uUZHNlKVrlh36FYxX
	 u8FcIIL+GSe736hwNmx1eyITa0GoMEwKREWyWSfcsj6syDPI3l0oDzmZniMge/4lcdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814924;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=qIDsiUunXw6VSn40zaoZ5/wzgW+MLm0EvYZKYSv28Ac=;
	b=CU1ftnn0cAp2xiQZIBhzC8IcMzsC4iWVwE1XAxK41fBMH91oUDIEJ6VxlmIcZZbu7XvY
	 36h78v6nHI7Sg0WJ3PIgms8AxJxFNbAM1dj/m+Z2dyfb0i0nOl8FW2WA8Ge2keWvWFH88
	 KNVT6ujxXGRstjxX4c1d11lJt8Vo3IkDIAjIymZzAAIH+exGAjmUrqPajWqpyXDCid4Jp
	 LwYZ2CcxsY5gGO8fVT94fnp8VqoqQKjeX+CRhqQqDPpEAw8MjYDrqTDQvH/ZjX2Wup9gl
	 fDWoCkMRWhwzIWQ08kI1EZw37HThRi0F8Q4L2xj8iojyevOnKa4n9Be41WUefAn7TJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=odi2wuKZ;
	arc=none smtp.remote-ip=95.215.58.166
Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E97B606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E97B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=odi2wuKZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J6P+SDzlyU/fh2AKrJ8vgmbOJ1hL9+YmuQ0XsXd3yOI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794814921; v=1; x=1795419721;
 b=odi2wuKZTXuKzYdJTex+ea0nKIfiWg0ZIclUp83TN0GKyWzT1BaZCxQC4HJiQUhv1foVpQzd
 nkgA+nWAqLRi+uWi6tVIysi9oPDG17Iswz0/RgNIXH+FQRGxHUdDTOLev8UwU1oEQMGYooZqc6z
 bS6gItE872IEAHvUHBaQ5PrY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0e17c37dcd4d9ef9;
	Mon, 16 Nov 2026 07:42:01 +0000
X-Mizu-Trace-ID: 0e17c37dcd4d9ef9
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 07:42:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Jackie Liu" <liu.yun@linux.dev>
Message-ID: <eecbc1d7670554d2c11273331b6af9855d58d79d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] drm/amd/display: Fix logger leak on perf trace
 allocation failure
To: "Markus Elfring" <Markus.Elfring@web.de>, "Jackie Liu"
 <liuyun01@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Alex Deucher"
 <alexander.deucher@amd.com>, "=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?="
 <christian.koenig@amd.com>, "Harry Wentland" <harry.wentland@amd.com>,
 "Leo Li" <sunpeng.li@amd.com>, "Wayne Lin" <Wayne.Lin@amd.com>
Cc: "LKML" <linux-kernel@vger.kernel.org>
In-Reply-To: <ae04eef3-ec99-4728-be84-8a71e16c0b4e@web.de>
References: <20261026111047.97178-1-liu.yun@linux.dev>
 <ae04eef3-ec99-4728-be84-8a71e16c0b4e@web.de>

2026=E5=B9=B411=E6=9C=8816=E6=97=A5 14:57, "Markus Elfring" <Markus.Elfri=
ng@web.de mailto:Markus.Elfring@web.de?to=3D%22Markus%20Elfring%22%20%3CM=
arkus.Elfring%40web.de%3E > =E5=86=99=E5=88=B0:


>=20
>=20=E2=80=A6
>=20
>=20>=20
>=20> Free the logger before discarding dc_ctx and clear dc->dml.logger t=
o avoid
> >  leaving a dangling alias after the failed construction.
> >=20
>=20Would there be a need to complete the exception handling also after a=
 failed
> link_create_link_service() call in the implementation of the function =
=E2=80=9Cdc_construct_ctx=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/gpu/drm/amd/di=
splay/dc/core/dc.c#L990-L1037

Hi Markus,

Thanks for taking a look.

The link_create_link_service() failure is already covered by the
caller's cleanup. dc->ctx is assigned before that call. On failure,
both the normal and virtual hardware paths reach the destruct_dc
label in dc_create(), where dc_destruct() releases the logger,
perf_trace, and context.

The perf_trace allocation failure happens before dc->ctx is assigned,
so dc_destruct() cannot reach the logger in that case. That is the
leak this patch addresses.

Using common cleanup labels for the early failure paths would be a
reasonable separate cleanup. For this stable-targeted fix, I would
prefer to keep the change limited to the missing logger cleanup.

Best regards,
Jackie

>=20
>=20How do you think about to avoid duplicate source code another bit?
>=20
>=20Regards,
> Markus
>
