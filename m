Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913203;
	b=OFRkswqWreg2UZI9L0O+CvlTGJGgOuHLAm3er/gpaSX3OBqm+5vOEhD69VpmkVxgCIuF
	 xrBZWNcm6jtY1Cdlvv6cLKv0+RXVqo6lVkKbgaYabDYh6GBub3PsX40kXUWTQN5k64MVe
	 MpzTKuLw+I3PI3C2vX4wjjG1jZFK3JUkaN8WqbSDJrTSHvhetnrpGexvldJpR9OilJvWS
	 JXpAkbXKRmsPHOiKMvsdSZBJlc3a9f662fnnSzjcERV729ivda421oBU4HU4yrJpbrl2b
	 9PChfiYvIgVr6P2zjJEoMWMPmzJiGrLCy02xXkaMl3uWFvmU1k+h13v0XD/yU0IpNRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PdT8ZE88YJfKr/XAStKlIa6UtKYnZ1PbUIlLFpxm4oQ=;
	b=sROtHNXhEWxH05yFjnmgH07TW/3b6fSZtZGAWyi9rIth2MUUF/7YxeUAp6JVJrfLwitM
	 XEG825X+q4V2UD/Cww8+JwwFOOoSmatSx6S1n91Q6MlhegPYTLlLnlsiiK2dAx4hW8Cao
	 VCRD0iXzPuBv9//4ESw+RQAwhtrBWItdu0lQybnuXiUq41Wscfx6C8P88B68XJdQSOwI6
	 2NFucVg2dM13kzduCs6lEEX9/b9NKZ0ONaO8MCY9Pc6Zx8RFz+DkSkkKcio2c/y2NGHvF
	 5oxD6ub+dBGdqi14PnTI0MtSE3mHY0erPmnMhe4p7liwbr7+jBzdR+Q2Jtw8XLihxig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUfSuOwF;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24576606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24576606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUfSuOwF
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so3364058eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913202; x=1795518002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdT8ZE88YJfKr/XAStKlIa6UtKYnZ1PbUIlLFpxm4oQ=;
        b=UUfSuOwFzUSHdZPpJHoGq3eMtd8BK3Fn26oGLg82UdTlqkK/0SUNncE/I0ad8KX7eh
         MBzqfBmSdq3OovX7KHSulciPjJolwWpWf+38q1kDy02hH5+6SHi5HY/cn/4aE6Tmfs72
         2S1oyukidneUm22DCz60HjKG7tk/8JoehDifFJLpB56nbaT6Cd1T4x5uYC4N6OEGMN++
         rXQb80Q2YWH5dZXwEyKee3vLpdCgPnHXFo9i9C4snnfSnp/83rkOq8er+ATsJME4Pmv1
         9wOFXac+xLD65kCut1IBSRP7VhIOVICezOarBGyt1s7Ps8Y1MIm9w4faUHPVreJId5ze
         i15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913202; x=1795518002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdT8ZE88YJfKr/XAStKlIa6UtKYnZ1PbUIlLFpxm4oQ=;
        b=SiSqyXOc/ZMgMPUFywNStOL+7vKV6KBQJ3hwfwrt2IdJXNLkgwWkDGOPoe/wl0W4v6
         qrvOx/4mAL9SZ/wx7VYcLn0BI8BiY2dEBqyHXiCCnH48vIfON0IbyQgHIoKfgQ5IpFCP
         tUQO/+NFfH1VijVRReWEmzYiU/IqJ0eTQl2Pr8z/gzHzKH8G5kSGsu7+V5Fbc7ilADf1
         qOwR6MExvtIK1bQbnFJjBMrxoVuYhTXR+t1SE1ql3KZQC/t2ZdL2nEZmQ7Lxr6uL3YtW
         hZ5ynuPkHQm5uC+GNXXqrtRSE2CImy6GVsF7JOeP781PYrFPwIMAVcYPnuEHF1JByou5
         McLA==
X-Forwarded-Encrypted: i=1; AL+hErGL2VmgxJ3ESaUzAyphc30cmZZSLuI3gw24RrLGTTJJJOiIK/zHghivAlzUA9aUsVo5wsFn5NFDgE00K7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CgEMTo86CSeLctkq70bsmKdP2qlLLisAB0ykWRhKZAjDTSGa/
	Hvigw4v5SLqMtmgTA6AkZi6yJ8dbd1674GJMJYreEdXVx+ctKNrUnkDC
X-Gm-Gg: AZFdTZcvqV77Bzbj8Aj9tBoQaLMDjUXRJLagQ+VDCHX1OGfxAyCFEzwdeEJwh1u7OWc
	DOcMofsdLKDWOJKiKZErk3NAZwiJqZzH49899H20UkEenKJMviHETKVZSRojbASLz/n1dgKHwvl
	R/AONxWzQ3PlyGGL7+7NetVajEmoTl79XtM4Ngq52+VQ8NRm1viJZsmhwN8W1tgaJS8Mmi4KsjD
	xUhGkSsSrvZqE5MwslOtHBzeSJ54aVsnq/X1lnOM9woV4oFe74fOXK7LxNFzF0T7olRXcKxPCc9
	+pdjlrmyqyZxdjdbePFZVhfECw4ycUxFDQpRQ9G9O63ECkV3TWx6AvRwvLAunGv24hPT+M8Q4qo
	irr6u1FZCkPXvD5l1Xx7dGdX358v4RwxkfgRE9J3CnlsAOQyndWjfkdQPt2RhxFNRNuBqewNsST
	Z/5W/4frZGuGnsW+MC0URmDcOb59cFW5q6iAcfaVvgSsqxXwGTiu5oQCytmlcqRhAgJbIa72+9G
	lcEG+NFQTHHVMKXonTXWMfeRpBsG+OKckH6zj8Xrr2zMuhWGqzQClZI8zB9Mm2QjFIsBSoeTPcW
	8RazmrDVu7d8kpvhVfrVGReXPyV7en6J/5TZREECEGQdDEMQdVYcRntGfDBSBTSHizaBM44uf4V
	hp+eInM4xl7H6qsjiaDme7soBDnS2/TAPLfy4c3ZoHbsW3JF53+F/pPqi1Qa/9lLTL82Ul4fhqQ
	CqJMg/cidDbjNx6NU+7H8S3Q7DmASkYchGbbGTBK4u8A==
X-Received: by 2002:a05:7300:e9c8:20b0:379:8c67:9b47 with SMTP id 5a478bee46e88-3798c679e38mr15032808eec.7.1794913202189;
        Tue, 17 Nov 2026 03:00:02 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.02.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:01 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 0/4] ASoC: SOF: control: fix volume, switch and enum value handling
Date: Tue, 17 Nov 2026 16:29:46 +0530
Message-ID: <20261117105953.188645-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALSA mixer-test selftest fails on the SOF controls of a Lenovo V14
G2 ITL (Tiger Lake, sof-hda-generic-2ch.tplg). The HDA codec controls on
the same card pass. These patches fix what it found, plus one case it
doesn't catch:

1: a negative volume sets the control to its maximum, because
   mixer_to_ipc() takes an unsigned int and clamps.
2: a switch accepts and stores values other than 0 and 1.
3: writing back the volume that was just read generates a change
   event, because put() compares linear gains while get() reports
   table steps, and the 0 dB default is not a table entry.
4: an enum accepts item indexes past its last item (IPC4 topology
   only has one, "Dmic0 Capture TDFB angle set enum").

Patches 1, 2 and 4 are in the IPC-independent control.c; patch 3
touches the IPC3 and IPC4 volume_put() ops.

Tested on that laptop (7.0.14 kernel, snd-sof rebuilt with these
patches) with mixer-test:
- IPC3 (sof-tgl.ri, sof-hda-generic-2ch.tplg):
  287 pass / 8 fail before, 295 pass / 0 fail after
- IPC4 (sof-ipc4/tgl, sof-ipc4-tplg/sof-hda-generic-2ch.tplg):
  287 pass / 12 fail before, 296 pass / 3 fail after
The three remaining IPC4 failures are control names in the topology
(boolean controls named "... switch" instead of "... Switch").

I also wrote out-of-range values to every control with plain alsa-lib
calls (amixer clamps them before they reach the kernel). Before the
series every SOF volume and switch accepted them with IPC3; after it
every SOF volume, switch and enum rejects them with -EINVAL, with both
IPC3 and IPC4. pcm-test results are the same with and without the
patches.

Arnav Kapoor (4):
  ASoC: SOF: control: reject out-of-range volume values
  ASoC: SOF: control: reject invalid switch values
  ASoC: SOF: report volume changes in mixer steps
  ASoC: SOF: control: reject out-of-range enum values

 sound/soc/sof/control.c      | 26 ++++++++++++++++++++++++++
 sound/soc/sof/ipc3-control.c |  4 +++-
 sound/soc/sof/ipc4-control.c |  4 +++-
 3 files changed, 32 insertions(+), 2 deletions(-)


base-commit: 7cd6b1fd8f9c1fcb1da1b761d502649f50b9800f
-- 
2.53.0

