Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8131C230BD5;
	Sat, 19 Sep 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831141; cv=none; b=i3QW9HV70q+Q1d56LoNb1Rr96/vKnn5x5bjEVVQewVGYLd2VfJauV1c0NSoFg73/rS1tjESNgBXW5q9tQ1VsT7/AY6VRsYclW9DNBN+b1A7vVIAIAnfBU27h8nB6f4Q/oXr8XyNZtk6hVeiFFAM/ED9TM8YviLPe8abYLyOaInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831141; c=relaxed/simple;
	bh=ADRZ2fOJfXlxldGMfngLbLZBTq68dfXPMmGBP4XmQRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEy5LHVytoixYWxuS6SU36D3tV7JnllAWTznY9ZsE3v+HJ5Vfw4zSNXr+n7vHngf3luib5fEE5+ozqgc797VhfeekuzjQY+IkVogpcRE4nv9lmptleuf2S44va0ZrXpaY0zDQjDv5jHBHfyc/bmIQIRQgR3IIC9Fk8sV4L3sdy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b=mbAzjmFL; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b="mbAzjmFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1789831132; x=1790435932; i=arc@gmx.li;
	bh=+2F0OTwnSdxIATpuxEHT0H8Q6UTQ2n4AgAU26+Ozcto=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mbAzjmFLp56M0oClJQfiUGzbQD3XDFHJyt62WEnuvwZ8AGfFE3L+BaRZMapTM6m+
	 QGNvv/w4wVni4V8M+wq4VNdhoVjUd1QQ7AZmHoFuCgUERx256OWi6aY8csItWcPmZ
	 NwJCf2zkO/VeZCm0sOHF3q4BYjD2LZVZm8KeFZw/Xl7Zyz5jNL6g3PQbdMDv8cuCI
	 MEof2LwcTVih48D5sgKOycyTbtVdGAZiwgRaov0/f/T4npMJDAr3NV6AJWmAw+2Lk
	 LiccRPU0dTQjzBCv2EggfecqJIDrkHD9aC1uvhafAie6ok78opz1yfJSXMGB36fQx
	 RiuSUsaiIwRVzjDt5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1wdIqb0IcL-00gHOQ; Sat, 19
 Sep 2026 17:18:52 +0200
From: Christian Ruppert <arc@gmx.li>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>,
	Peter Drabik <drabik.p@gmail.com>,
	Neil Andrews <neil@androos.io>
Subject: [PATCH 0/3] Add Audient EVO4 support
Date: Sat, 19 Sep 2026 17:18:37 +0200
Message-ID: <20260919151840.24371-1-arc@gmx.li>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M/8UOFu9a57ZJjzpjCwd/cnNd8u4WFBhV3Evh1V8v6Pbu7xH1Qm
 jE6DWL4Qin2C+7oxRY2hYP65yvzwu3Lvi2739yzb5q49Pn8DgcupuJGffn4+ydwOmL7j8R5
 m8weyM8/zgixcczshpWSCnQjVzL3k4ozE2Zzrmn3VFWBdUu4cUBWPac3nwDXXVbaqaadQW7
 4KX3GMoFhwP/LCNuozj7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tveFnmyqZj0=;vC62A3Ya/86axmyrA3x849qkUoh
 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

This patch set adds support for advanced mixer features of the Audient
EVO4 audio interface. The code is structured so that support for the
EVO8 (and potentially other Audient devices) should be trivial to add
but I don't have access to the hardware and no way of testing them so
they are not supported by this patch set.

The third patch in the series (Add Kconfig option for Audient EVO4 mixer
quirks) is optional. Other mixer quirks are compiled in by default and
don't provide Kconfig options but as this one adds a few hundred lines
of code I decided to provide this last patch as an option and leave the
choice if such an option should be added to the subsystem maintainers.

Christian Ruppert (3):
  Fix Audient EVO4 master playback control name
  Add Audient EVO4 mixer quirks
  Add Kconfig option for Audient EVO4 mixer quirks

 MAINTAINERS              |   7 +
 sound/usb/Kconfig        |  10 +
 sound/usb/Makefile       |   2 +
 sound/usb/mixer_evo.c    | 505 +++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_evo.h    |  12 +
 sound/usb/mixer_maps.c   |  13 +
 sound/usb/mixer_quirks.c |   9 +
 7 files changed, 558 insertions(+)
 create mode 100644 sound/usb/mixer_evo.c
 create mode 100644 sound/usb/mixer_evo.h

=2D-=20
2.55.0

