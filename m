Received: from smtp1.iinet.com (smtp1.iinet.com [52.129.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100719644B;
	Sat, 29 Aug 2026 06:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787984011; cv=none; b=ato6ZwzHX13yjfGyT/BsnCJFVsyqOEPkEGhPuLXioiNI1jx3BIUm4uTi4DcIPs4QBIM2Z0PYlG1ITROPdYvJtaq/gTLE2U2NfMPAbkwMeXZs7SbnK0zpj017cpvMvL1tLR6KhM0iGYcnAjArC+KtrvVDj4IgBJBekk+prFkpI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787984011; c=relaxed/simple;
	bh=z3EOJ7BK6HuzPebK8ja00N+pje1KmNe9q7LMvt+3vTs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CdWej4hWnSc6RZyjWa9LGFm7twGb72vRSDsSnFGMeIZITum9juVuzRmvTqLTAKUibVWhuhsaq8QiYeDUcasFIBu9ouq+APzXVXF7bpFGhiwZ8RU0oiiWYDCX3TE8EKIPzCnYE7LA5QpjKDgynOB3pAyn7sLa/XtoTx+QgnB3Y38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=xkd414zc; arc=none smtp.client-ip=52.129.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="xkd414zc"
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp1.iinet.com (Postfix) with ESMTPSA id CF3F5C00543;
	Fri, 28 Aug 2026 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1787982997; bh=Mb5i5T5t5I+m6P+VOalWLEX2YVnQsHAJOmxUzoT2Oo8=;
	h=From:To:Cc:Subject:Date:From;
	b=xkd414zc/xPVN1Lz+okD1API8VwkB1ySAnW8frRLp7ONFLtmTHZflPQRbH9mFPuYH
	 LBVqrhMxNk2JBui0H/dp+LU+2i4taLDXJE06AdmFxL8coWM/ySCCzSHTptnqpf7nPT
	 cjZedqhuBNQcDY4b/a6AURV9RNTdfZBv2N2hVb8P7LLk1Zwix0qyreTpg4Eua15a7c
	 //TIHGHiMnLnQ9313ZATtRIhw4wgR2OHqmnd1VXypSN9Mv3+adMLaYZfGu5NTWOhcg
	 WThFuzJh5X4ZQCh8RI4F0zdDMFBeUv8dKRGnbnJGunvtnK1Z83C+SMz7+ZvxlrUQHd
	 +ho6tpeTMXEWA==
From: Kyle Farrell <kaf@nwlink.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [RESEND PATCH 0/2] usb: gadget: uac2: support explicit channel counts
Date: Fri, 28 Aug 2026 22:55:58 -0700
Message-Id: <20260829055600.1800565-1-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB Audio Class 2.0 permits up to 255 channels in an audio channel cluster,
with bNrChannels specified independently of the channel-location bitmap
(bmChannelConfig). A zero channel-location bitmap indicates that the
channels have no predefined spatial positions.

The UAC2 gadget driver currently derives bNrChannels from the number of set
bits in bmChannelConfig. Since the descriptor defines only 27
channel-location bits, this limits playback and capture streams to 27
channels.

This series removes that limitation while preserving existing userspace
behavior. Existing ConfigFS channel-mask configuration continues to work
unchanged, while optional playback and capture channel-count attributes
allow non-spatial channel clusters to be described.

The series is split so that the shared u_audio infrastructure is updated
first without changing behavior, followed by the UAC2 functional change.

Patch 1:
  Pass resolved playback and capture channel counts explicitly into
  the shared u_audio implementation instead of deriving them from
  channel masks.

Patch 2:
  Add ConfigFS playback/capture channel-count attributes to the UAC2
  function driver and use them when generating descriptors and stream
  configuration, allowing counts beyond the 27 predefined channel
  locations.

Testing

Testing was performed using a Raspberry Pi Zero 2 W configured as a USB
UAC2 gadget. Streaming and descriptor validation were performed against
both Linux and macOS hosts.  Windows hosts were not tested.

UAC1
  - Verified playback/capture operation via alsaloop.
  - No descriptor or behavioral changes observed.

UAC2
  - Verified legacy channel-mask configuration (1-27 channels).
  - Verified explicit channel-count mode with 2, 28, 61, 62, 96 channels.
  - Verified invalid channel-count/channel-mask combinations are rejected.
  - Verified Feature Unit descriptor size limits are enforced.
  - Verified descriptors including:
      * bNrChannels
      * bmChannelConfig
      * Feature Unit presence and bLength
      * AudioControl wTotalLength
      * endpoint wMaxPacketSize
  - Verified ALSA-reported playback and capture channel counts.
  - Verified streaming using alsaloop.


Kyle Farrell (2):
  usb: gadget: u_audio: pass channel counts explicitly
  usb: gadget: f_uac2: allow explicit channel counts

 .../ABI/testing/configfs-usb-gadget-uac2      | 18 ++++-
 Documentation/usb/gadget-testing.rst          | 18 ++++-
 drivers/usb/gadget/function/f_uac1.c          |  2 +
 drivers/usb/gadget/function/f_uac2.c          | 69 ++++++++++++++-----
 drivers/usb/gadget/function/u_audio.c         | 32 ++++-----
 drivers/usb/gadget/function/u_audio.h         |  2 +
 drivers/usb/gadget/function/u_uac2.h          |  4 ++
 7 files changed, 105 insertions(+), 40 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.34.1

