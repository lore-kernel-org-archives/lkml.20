Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789570;
	b=CLnegGF4ddBnEng53a6XJaANrsA/gy5IYBAlLtrRdMXWrYOzgD6fKPMQ555JSs03DmnO
	 OUNuXYLsSTzTV5ux3UyoPpFNBaSp2h8JvRt7qa7RD+XWvvTdD6W5gDMXRqU+AhDdZhc3h
	 Pwu5GBBrFA0Z0+6OPGwHU0iSgV+IHF5LOeMNNOL3DLuXF7KQTaW59MMrDmrsBb/PmlzwF
	 rS+ihZs6K+pNWqsbZQfHn65ad0Cqpm3rUEECsf9BXrzsrqWJUdMITim9COJ/p+MNowRcX
	 PEyrqapxqBnt+0/jREh3gp6GqtVLZcTxheF3Ox3DWfsKZ35h028HykM8NqFH9mOdlQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789570;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IPt0gBxb7l+Vy0w1e9vCOp0V3bKeG3Odkj9W9iVOLMg=;
	b=4CrB+n0hKVBPkYBge8turi4YqPSLWJLLXGcrl4tL+d3r5TZjXqOPu7DdkyvfXqMPzTq0
	 vVBSMkCA8LcAQJOt6mNOpR0US4J2gBlMo6GNVk7jHIZS5r/wEHQLHFYXHsgtD0+vXdG1U
	 JtzOG7X6mnIn+q9Q5zqnfXn9fhGBNZS5q2XUb41HKzXCeaitIjCGW99wIqhkYNWxtxl17
	 OVhaNTWgPr569sDFg+QcLeTHPYEkaYwCy7cqChrWKFnoFrEbZdzHDlrsGXS/PCT0Jo4Tm
	 sFymxifKStLT3/m3mD62jHHhdjoZc7hZU5AEEdntHuZGBkzuMZFRL7Le25Gw2V+6XOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QIa+SUhp;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED62606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED62606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QIa+SUhp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793789567; x=1794048767;
	bh=IPt0gBxb7l+Vy0w1e9vCOp0V3bKeG3Odkj9W9iVOLMg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QIa+SUhpxugIQDEqEAZEYDKw5JDQ16MwKnSd7RACnw0HH+sbxIgr52JTyDM34XsBh
	 pjWVhGVoDNf0EsMHOVQ+UbLXY/Khtce3epIvCG1felhnL5idvDY2b+wiUt3UoPzTJu
	 YFhDRTjSgWCckb3AlRgeJPx8+sEHdwcVqas+kfkJUH4exSLLShXKmeufuV4erzPdg2
	 gkN5FHPjiP8Mr8SKTyi1wD1S0ZtHgmbhqrbQGnjjkfKmbtxC9otYTrUYlekFuWtcyW
	 mQd4CXBoNV61Cl5zxq8fORZjWPaDORbrz1ZuVCgJVS+qAHTB+0KusOVq8MUNRGYY6r
	 un5tF+kfWQJIA==
Date: Wed, 04 Nov 2026 10:52:44 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: [PATCH v3 0/2] ALSA: usx2y: Bound the PCM buffer by the URB size
Message-ID: <20261104105228.1124-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: f0a5a04fac2eb909b59c1b910faec6338c6c87f2
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

v3 of the usx2y buffer fix, split in two after the review of v2.

Patch 1 replaces the two-packet BUFFER_BYTES bound of v2 with a
two-URB BUFFER_SIZE bound in frames that does not read the endpoint,
and keeps the capture drop guard. Patch 2 adds guards in the playback
prepare path for a URB larger than the buffer and a packet larger than
the playback endpoint's maxpacksize, both pre-existing and unchecked.

Tested on 7.3-rc7 with a USB/IP device presenting the US-122 interface
layout. The playback case of patch 2 reproduces on the unpatched driver
with ordinary 48-frame packets and a 100-frame buffer, which the stock
constraints allow. With both patches, buffers below the bound are
refused at hw_params and 400-frame buffers stream in both directions
with no KASAN report, for S16_LE and, on capture, S24_3LE. The results
are in the patch messages.

Sinan Turunc (2):
  ALSA: usx2y: Require a buffer of two URBs
  ALSA: usx2y: Guard the playback copy

 sound/usb/usx2y/usbusx2yaudio.c | 34 ++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

