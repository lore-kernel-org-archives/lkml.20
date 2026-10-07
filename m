Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA084A5ED4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382911; cv=none; b=hUbpMwwji6L5wQ3/xAFipILjZVDdl1gBm3FNCGZebIoBV/fdWTUiheMF6a2SOYDp5S6HJmj4Pm2AClJw9PpbBOyQYMt1BmChtXWMwyOpwEvzHchmZ8Oar2CakzCJkr4hBpeZ1eXCUWax79zt8HNsyM8v2wo2mtjXgvmOfTAMzpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382911; c=relaxed/simple;
	bh=UUIoMs93rODwFtQnIT3OzAP7gYQZke3OsGqiubGoUz4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=nFz2im93KHw0zHghyudbZPNjZQ7gzfXLn3QqWmb6yqV5NU6e3Cwzj1sfJQn9IBZ/M8wttcwRDgjPYCZCs+qZYPAL1+5om0Mv4TWceboKhjtftXd/t0yuzLc/zAIF0NNsQax3PekS6Gc4eSaF0zxhunvScdyW5g8U7T5hLAxjgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a23dhS7l; arc=none smtp.client-ip=95.215.58.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a23dhS7l"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UUIoMs93rODwFtQnIT3OzAP7gYQZke3OsGqiubGoUz4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791382901; v=1; x=1791987701;
 b=a23dhS7lE78kaW4F+Z9RDN8ub1/Sx0bAFDbO1ty4OOQIe1wxvIsTacTzf5l0WCY5UDlQDO5f
 O/ENC1IH2LWT+etuSmyaETPcPIyL14deKd2Mnw3logRJicnSotxQP4gpwASJEtyZ+2cGQZJtMJ4
 gcG8Y7psJBzPAPtyhmdNZscA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 27bc66e47057acb3;
	Wed, 07 Oct 2026 14:21:41 +0000
X-Mizu-Trace-ID: 27bc66e47057acb3
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
Date: Wed, 7 Oct 2026 19:51:12 +0530
Message-Id: <6EAF4657-AAF7-447E-8434-D0E0D647B691@linux.dev>
References: <F9EEFFBD-A749-4374-9FF4-75917ED2D204@linux.dev>
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Atharva Tiwari <evepolonium@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Adam Azuddin <azuddinadam@gmail.com>
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

Could anyone please merge this? Thanks.=
