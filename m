Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9B471271
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146138; cv=none; b=fJBEQS0e76hSHrcxtgDQ/4cTkLIvhUdJ/8EQj6ybbQMI3MhG9b/PSB3BXzJyf3wDMVRU5lG9+uaCbjkaj1OK7+eUkVnUcO3WlH8g7U9apHYvTjs1IKSFBWZ4iBIxTUB8qeV/pZb5WxvODXPMn/I4vehyITdRFmeMR7KbkvQsYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146138; c=relaxed/simple;
	bh=+DbsR2QGNazTX5aTT3V2iqIn/ew54sS/4tG7fp2Z4sM=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=R1ZbHnzmQEdEdmxHi670qPwz8o/rSw/dxuRbg8XeD72asWRrO5FlZahsqZA6cZdkQ9e5p0/W+IIWRj01FUNy9PKswdCTbZi5wDANqlGM8tc2lF08zxxYfi1iZSXyWW8HxjKoasnpZlI/6NWqNo6lLzk2gTfRQEItY9zoR+YrDbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OYB3Rxi0; arc=none smtp.client-ip=95.215.58.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OYB3Rxi0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+DbsR2QGNazTX5aTT3V2iqIn/ew54sS/4tG7fp2Z4sM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792146130; v=1; x=1792750930;
 b=OYB3Rxi0Gm7I3aQGHIGn9D/gztQw5/PgJmfzdUGm14jh0kqK/NRGzogG/0xImNxeUKb5xvrs
 E28wPgB31vQmsEAeBxDadGpmtxrf6CAJeiVCgvbxFNBRk0Nd57VdihJ463S3epJ0Sps2+gG9sgC
 7QH7WUrHufwCT8Tw0sVkqw34=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 236b526ee2bc9499;
	Fri, 16 Oct 2026 10:22:10 +0000
X-Mizu-Trace-ID: 236b526ee2bc9499
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] drm/appletbdrm: Fix incorrect error message on encoder attach failure
Date: Fri, 16 Oct 2026 15:51:56 +0530
Message-Id: <7FF6CD32-8BFE-4DF9-8FB7-53BD9A5190F1@linux.dev>
References: <F9EEFFBD-A749-4374-9FF4-75917ED2D204@linux.dev>
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Atharva Tiwari <evepolonium@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Adam Azuddin <azuddinadam@gmail.com>,
 Lukas Wunner <lukas@wunner.de>
In-Reply-To: <F9EEFFBD-A749-4374-9FF4-75917ED2D204@linux.dev>
To: azuddinadam@gmail.com
X-Mailer: iPad Mail (24A446)



> On 28 Sep 2026, at 2:04=E2=80=AFPM, Aditya Garg <aditya.garg@linux.dev> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> On 26 Sep 2026, at 6:49=E2=80=AFPM, Adam Azuddin via B4 Relay <devnull+az=
uddinadam.gmail.com@kernel.org> wrote:
>>=20
>> =EF=BB=BFFrom: Adam Azuddin <azuddinadam@gmail.com>
>>=20
>> drm_connector_attach_encoder() replaced an earlier call to
>> drm_simple_display_pipe_init() during review, but the error message
>> logged on failure was not updated to match and still refers to the
>> old call.
>>=20
>> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Ma=
cs")
>> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
>=20
> Reviewed-by: Aditya Garg <aditya.garg@linux.dev>

Lukas since you seem to be having write access to DRM tree, pls merge this t=
oo. Thanks.=
