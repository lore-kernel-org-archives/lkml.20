Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C7137FF75
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584501; cv=none; b=EWd5yg92ZsdRadczXM6ZYk86di6A+n2T43J9E4GtMOCS+XsQHPgS1XlIKSVXrW5G9AilUb3mooInTzOdI6mlwGX9Er1fI8LrKE0yl8UOz2qVBYxNsYvczl2SHvUWJTNBHYwTnWRipkDUJoQfP71Oe801HB3qHXZzJtOrag7uI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584501; c=relaxed/simple;
	bh=VUwixvVe2ZNKQ0Cvr2pfIQfr/RuEy7shwKZwOabTpBY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=lGPTjOZJhaC6x51M08SWt36kFkiPH30zGTD9H0ke33W5uZAi2CcA1QgMZZOrhNDj9T9zzWoxCX37fwC49DLNc4DkhPsInuUmMXk+1vPZppl3a7ozkBeCJFf1222O3HxLeIBXuE/U6gpXsnKU2DwsW2mSevgujrSusBNCvup/OF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QloJRstr; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QloJRstr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VUwixvVe2ZNKQ0Cvr2pfIQfr/RuEy7shwKZwOabTpBY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790584496; v=1; x=1791189296;
 b=QloJRstr32NGxKs1wSf1W7sq0IHWKtdewExFaybCsFKgnhUozIdPD7CYA0l4n9x1kZw//ubD
 YjL0g/ljlvkNz9+UHn6MmswmC0hKvAaMECUpo6IHwH9F5Kw9MVW3yL7jDDfKZNqd8mMm8084BOV
 dF07yiGDcTtNJ0827ounmcXc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 40995b2d68ea4a14;
	Mon, 28 Sep 2026 08:34:46 +0000
X-Mizu-Trace-ID: 40995b2d68ea4a14
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
Date: Mon, 28 Sep 2026 14:04:33 +0530
Message-Id: <F9EEFFBD-A749-4374-9FF4-75917ED2D204@linux.dev>
References: <20260926-fix-err-msg-appletbdrm-v1-1-bb578a7dbdda@gmail.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Atharva Tiwari <evepolonium@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Adam Azuddin <azuddinadam@gmail.com>
In-Reply-To: <20260926-fix-err-msg-appletbdrm-v1-1-bb578a7dbdda@gmail.com>
To: azuddinadam@gmail.com
X-Mailer: iPad Mail (24A437)



> On 26 Sep 2026, at 6:49=E2=80=AFPM, Adam Azuddin via B4 Relay <devnull+azu=
ddinadam.gmail.com@kernel.org> wrote:
>=20
> =EF=BB=BFFrom: Adam Azuddin <azuddinadam@gmail.com>
>=20
> drm_connector_attach_encoder() replaced an earlier call to
> drm_simple_display_pipe_init() during review, but the error message
> logged on failure was not updated to match and still refers to the
> old call.
>=20
> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Mac=
s")
> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>

Reviewed-by: Aditya Garg <aditya.garg@linux.dev>=
