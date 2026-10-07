Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815A42B324
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382929; cv=none; b=aTVvfn6PqgACx7m6dqcbvJ6oWQQHuKNwtZsT9YF91jFasMhNJg4kekd2nLAMUwMVsHE4bi8OgULQqjtmWmghfPsLAjeI32Y9lSq7LVWiZfgi0sbDSEKuV6CxOwLKOZbL9FnKR0Uvc3jNpM+s6xNnBqItdOgtRV0yLlfZYCBOE3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382929; c=relaxed/simple;
	bh=WRUDCI6omUSsIZ8s+gMFBUC/otSE4gNpcSilBRiqh3E=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=A1fo6A9l/rtU9WJtA5u1gXsYFrwlwJdQ5+Ur3AS6rge7px0LdttOvVAPfPTPhiJA/Z+IXZSR8eNjr5eiwubdakgH+q4RCj6K9LIotqaD/CEV6JvbdDTQ32tSP5H/D6lyCdn3kcmGFIgDiBHa7LIQA7pF+05pqlhxv3bI0rKm8RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YBWQT89o; arc=none smtp.client-ip=95.215.58.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YBWQT89o"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WRUDCI6omUSsIZ8s+gMFBUC/otSE4gNpcSilBRiqh3E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791382909; v=1; x=1791987709;
 b=YBWQT89oNvAitDwWR1p7tnjuBdf1NCc+vMkatqBjxzZH1YSptnwU2h/f6CHJYQkfV0ibRh0R
 8uiSABIAImjwZgzxuM8Wuv9nW6XLXT4/BPswPCOhilNAbs41Owjh7MCM8HFeMATJ4+0gnimHpVE
 W2pvnAgaO/sIs2hBSrMyjmU4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8aed19a99e5f9cba;
	Wed, 07 Oct 2026 14:21:49 +0000
X-Mizu-Trace-ID: 8aed19a99e5f9cba
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
Message-Id: <7737F93E-AAAA-44EE-88EB-B4C3F48ED798@linux.dev>
Date: Wed, 7 Oct 2026 19:51:38 +0530
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Atharva Tiwari <evepolonium@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Adam Azuddin <azuddinadam@gmail.com>
To: azuddinadam@gmail.com
X-Mailer: iPad Mail (24A446)

=EF=BB=BF

> On 28 Sep 2026, at 2:04=E2=80=AFPM, Aditya Garg <aditya.garg@linux.dev> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> On 26 Sep 2026, at 6:49=E2=80=AFPM, Adam Azuddin via B4 Relay <devnull+az=
uddinadam.gmail.com@kernel.org> wrote:
>> =EF=BB=BFFrom: Adam Azuddin <azuddinadam@gmail.com>
>> drm_connector_attach_encoder() replaced an earlier call to
>> drm_simple_display_pipe_init() during review, but the error message
>> logged on failure was not updated to match and still refers to the
>> old call.
>> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Ma=
cs")
>> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
>=20
> Reviewed-by: Aditya Garg <aditya.garg@linux.dev>

Could anyone please merge this? Thanks.=
