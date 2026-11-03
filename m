Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801750;
	b=J9O1hhSbaTqbDSOdZLaHF/Ns72yv/vxmQGwxnJJagLCPtiO3l9Xf2U7gQCZY91q1El1q
	 CzumaBzwZmd4CdVGujB5n1VIHfOLIiVs8iXi7nEeABgXMV10KukWMS8ykfZ/tUPp6sa+W
	 LV/PjwvPWxE3TRNWvl4tsCBi2HI8rmXomba90kBdUfn71l7O878+cIu47CRm5mQ6hnuPA
	 oGJbFevb5RQqWNIQiYOMfXFdhw2DIJ8spHl3QGrmMAfhSLq488WqgNB1rQfXzMsVJzI6E
	 x2h10nhJ443g7uNSfEnc8nDM+7+xCAemUnNx1xlNfSxwHVlNQMs1bg+Q0Fku3ojqTvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801750;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=Np1A/Bb9TzjHwdcPoBlBfdvQEliYOOVrjpPeCFhEzDo=;
	b=jP2rZzjAZdPonZVOqa6cixbTGRgD0c3+AJQg/WVosHF/wETgdjM68ClgWRzORBJildc9
	 0R8fiCGzRgTR5fvj3Ja+zc3QSy4WHMmQ48k5mfyCFmGgno83uPrjcTtQ3jokcY2KZjx7S
	 doEE97mD967OzWQ56w7RGXQb7okIl6U2pTHE+5L9nDJbIBGFMrHaCN44YW3i+ubKUOnga
	 gFPtbHOgM/PV6vcL+zEuTPCBuj532J4RLx7+ZACOW/vDcFeLv3usmVa0353N4+p7Bfzuj
	 3XuvTD893PtZ+N44nb3Fq+mVeWRKJa3qFWlluEdfG+rMG/vql7SQv5fzreXmxCzfgCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b="ZK2B5Be/";
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFEE606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFEE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=ZK2B5Be/
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jKSCP3nH0zMm4C;
	Wed, 04 Nov 2026 15:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793801745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Np1A/Bb9TzjHwdcPoBlBfdvQEliYOOVrjpPeCFhEzDo=;
	b=ZK2B5Be/HTcXbJywzS7p1kGqklpc0Qs/5CwmzUqNk9VF1nIHs0CyoJMk3EchrQswIoCwc8
	YLtmr/RGRl9AvxUxb7n6TrAK2nHx/mZ2aWwIl4jxSv9KeZ12E9WYmooV/yGHdl2KL8flj/
	FyBvPU1fmd4KTOLAy1jaVEViKfRYkuR7Fo2jQ/I/9gMVlGl6XdijEh0/OGPma3ywSHR80c
	FnERCREPRiq9STVnfELdytxERLnN2mJUnXE/ZXmHUXaPwjaNznD55rhq+PtTY2BoP6K/B5
	koDfVxT/drtvMlcbmQ8pk9frUHtt8ezp0eHgoAhEbOcojEFaHJrwA54Fuwx+bg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
Subject: [PATCH RFT 0/3] drm/amd/display: Fix the doubled AUX backlight
 minimum on the custom curve
Date: Tue,  3 Nov 2026 13:15:56 +0000
Message-Id: <20261103-amdgpu-aux-curve-min-v1-0-62119efdcc6d@hsal.es>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBQFryJv7QeTitAeoAco7qSLmHztL5hKY
 kQQ727aLmdgZkfkIBxxK3YEXiXKx2dQZQH7Mn5kEpcZutKNUpUmM7lxTmTSRjaFlWkST5eh6bV
 R9upqRk7nwINsv22Hx73F8y9j6t9sl+8Qx3EC+dtRY30AAAA=
X-Change-ID: 20261102-amdgpu-aux-curve-min-3f6b2a1c9d4e
To: alexander.deucher@amd.com, siqueira@igalia.com, harry.wentland@amd.com, 
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com
Cc: Hugo Sales <hugo@hsal.es>, alex.hung@amd.com, roman.li@amd.com, 
 mario.limonciello@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 linux-kernel@vger.kernel.org, bhawanpreet.lakha@amd.com, 
 dri-devel@lists.freedesktop.org, ray.wu@amd.com, simona@ffwll.ch
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198; i=hugo@hsal.es;
 h=from:subject:message-id; bh=EotL7zGrVuTJ2BGeh5m18PxE5BZRro4hOkV4v+5E1KM=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl7ea7rlJdqwL3tTrvcX9oqkm9rzcqL/X+l5LfIsU
 3KiaEbv1LUdpSwMYlwMsmKKLLo3PBlYJk6emVP0fAnMHFYmkCEMXJwCMJH0YIb/aRYd2zrt267L
 O0zNEFHPCjp4U6rF86Cw2ZIXj+Z+DEh9yMjwJefA3N//7XrZ39zhubjj8jPxDb+4Gzf9ODthx/K
 A4ntreQBqzVAe
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Rspamd-Queue-Id: 4jKSCP3nH0zMm4C

With an ATIF custom brightness curve, convert_brightness_from_user()
adds the minimum brightness of an AUX backlight panel twice, so a
request for 0 lands well above the minimum. Patch 1 fixes that, patch 2
drops the argument the fix leaves unused, and patch 3 adds a KUnit test

I'm preparing a separate series that stops rounding the backlight level
to 8 bits and the luminance to a whole percent, and removes
convert_custom_brightness() along the way. This series stays minimal so
it can go in on its own first. If you'd rather take it all at once, I
can fold this fix into that series instead

PWM went through the same code until commit d422a66847a9
("drm/amd/display: map PWM brightness through custom backlight curve"),
which is how I found it. My laptop drives its panel over PWM, so I
tested this with KUnit and with the amdgpu_dm_brightness trace on 7.2.9,
before that commit. A Tested-by from someone with an AUX backlight panel
and an ATIF curve would help: brightness 0 should give the panel's
minimum

I also wonder whether the ATIF curve is meant for AUX at all. My
understanding is that on PWM the curve is meant to linearize the panel's
response to the PWM signal, and that an AUX panel gets a target in nits
and drives its own backlight to reach it. So it seems odd to me that AUX
gets the curve too. Is it meant for AUX, or is there a different curve
for AUX panels? This series keeps applying it on AUX, as the code does
today

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Hugo Sales (3):
      drm/amd/display: Add the AUX backlight minimum once on the custom curve
      drm/amd/display: Drop the unused min argument of convert_custom_brightness()
      drm/amd/display: Add a KUnit test for the custom curve minimum

 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    | 14 ++---
 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.h    |  3 +-
 .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     | 70 +++++++++++++++++-----
 3 files changed, 62 insertions(+), 25 deletions(-)
---
base-commit: ba496bb837882eb1af58f41572fc289e46c77b8c
change-id: 20261102-amdgpu-aux-curve-min-3f6b2a1c9d4e

Best regards,
--  
Hugo Sales <hugo@hsal.es>

