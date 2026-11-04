Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787485;
	b=mTjrN6C8Btbtg9fyfac3ljnHJ51jAoEdytbdKlnrGYFZdI7xIeC13CTfg/s4pniQNMes
	 uswhAsGLd7waIoyRMeZoWib4GuKxRdO3RDK7Obkm6p1qnBCyuKJO9FCnRiPwICnY44EZm
	 9Wqv1W+KwaVJ+BxjDlhp28W225EwXeCDvN7ApmdqGLIZU9yj/7Z8jZXIgRcyt0arr0uSc
	 77ambv3rZ38R3+V8sJLkaSJc8mfBXZc9Bn0HIZZuNRvh+Ppb9fIXf915Cr0KCTTgD6N0M
	 Vq+1jileQfec6aZ5k0MC+AhSntlxqyGkGq6pNSb7c6EzP/zsWSJPHw5T/pK7XJNmqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787485;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-Client:X-Rspamd-Queue-Id;
	bh=ahcLqPrwDsT3dBHCK0FvpIZpXfGZsfQEGodgh6kS1Fw=;
	b=ozHYRv+LslYBQUcwAg+pv9CF76/tj+ehstGYjp4eW9TYSRlh5dvDnOT0TNEophIlVquf
	 7xtLpI0g054O8BMKNvTnkkffFfEKfMbMHPPK1yFRdmDVy7OgQk40keedKYyKKNOe8jYTN
	 MdbAlBoX5RtESjXt2kQaFUEXmXuogLkQhR7sPjSOby+Kid7SNQJoUJE4fRret0dnxlxOF
	 gPSy4z0GwWEQg0OxAu6cfTeRn6lo7kf24G19Q/bliHU2NtlYg20iTOU5aSP351HMDPoWi
	 UCvoZFb+KrNULgY9YXKPyLYi+wy4hfPP5RSpYbiNeTm4lcjz3zBd8u8LvtMXelAANrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=PLzhmqUp;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD70D606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD70D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=PLzhmqUp
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKLx16fRczMlxP;
	Wed, 04 Nov 2026 11:17:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793787477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahcLqPrwDsT3dBHCK0FvpIZpXfGZsfQEGodgh6kS1Fw=;
	b=PLzhmqUpc1bQ68RX9N4qnsJ1xP+qC+a+Nf1jhuXEi16b118CxaG57iZHDdWJVPm6Rnux73
	+qu1YXaujJrs/ROniT8hc873Y77Llp8A0R5mPYUmfYAOvErBPNwJd3yiQX+wTYwnG9xifI
	XkqVn4oibUhlMbyDptzYAGN5HSdUCh5lNVIL+0we5siVa6XXYRqCpY6aGUsSHgvqNqe8iz
	cFxAqqek6+6bhhP2Y5bKYF7xW/KEL3Asu4vPGUx9ft9wF3lX/R8F/RUXHm6cIqHKps1Hbg
	lioK12btWZB/V/4Ut93FSfETP4wtp0giYjQoB7onZ307sSwO6ZQQeB33bUG8Cw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Wed, 4 Nov 2026 10:17:56 +0000 (WET)
From: Hugo Sales <hugo@hsal.es>
To: Ray Wu <ray.wu@amd.com>, Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Chenyu Chen <chen-yu.chen@amd.com>, Alex Hung <alex.hung@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Message-ID: <313360626.451345.1793787476448@app.mailbox.org>
In-Reply-To: <3f79f22f-a8e9-4fd4-ab78-2403d38b1292@amd.com>
References: <20261029171219.2842014-1-hugo@hsal.es>
 <3f79f22f-a8e9-4fd4-ab78-2403d38b1292@amd.com>
Subject: Re: [PATCH] drm/amd/display: Don't require DMUB PSR caps before DCN
 3.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.53.348
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4jKLx16fRczMlxP

On 11/04/2026 9:31 AM WET Ray Wu <ray.wu@amd.com> wrote:
> We already have a similar fix internally that is planned for an upcoming DC release:
>
> commit: drm/amd/display: Allow DC_PSR_MASK to enable PSR without DMUB PSR cap
>
> Could you give it a try and see if it resolves the issue?

Hi Ray,

Happy to test it, but I can't find that commit. It isn't on amd-gfx and
it isn't in amd-staging-drm-next yet. Could you post it to the list, or
send it to me directly?

I'll try it on my ROG Flow X13 (DCN 2.1) with PSR. Since my patch reported the same problem, could the commit also carry a 
Reported-by/Tested-by for me?

Thanks,
Hugo
