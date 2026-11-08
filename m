Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143048;
	b=fI+mGIzYdjHn7ALEmPN45Ef8taHcrDMWtysHqnL+jFN6O4WliYeUEb+coZZRGZugl24b
	 dp15Y5C8Teste6xo//LcXI8OyMcwev4fA1EPnNoOPpuIuN4k2v/BMgl1kMJtLDjT1aak7
	 fNKOqzA3kc13qCfAb0VcFO31dpX1lo7D+JlPKKBDXXY85X+VWvFuMNW5tu3YZ4NfradCt
	 RBwPcyXboaaSgab9FLqRZh/AUpYq7GWqB9sa0TzPThpnEBCU9NC2Q0tAcoIv49JOkzjg3
	 pGrITUIVAcWGD4VH2P9bcpwu+4BLwPcbMeZ2ByuKz1sNx9R6m2B0/T/bJizTxH65ESw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZapCdoqGqWMAQgXzjcWNscud2Aunl0QfBTjahqyvzOU=;
	b=fGCHxHR5hia8OV9jMlOgSE4CX2LffAdzGGQ/+kULpS2Noku8+G286OVdLDQFO8e9IIhG
	 JikMTHzIVbT8RIjUy1H2qyxH9L+XCMdjI3o/yDcA0+LwZDTrI4gr+173Ob2d2+YNtMxbw
	 pbP/9nfUvmVZhE2YA9gU3NZKtqnOBKyAHfmRiecR3yTLQIlrhTH8UEsbtGZ/B6a7JsLiq
	 LEronBgfBrq4RA6u2+KHnIYOpkK1XBNMoX53osoQD7NaRTqxdJaY4eVcIFklYoVJRWi2y
	 GHQLqr7rqoHdd4j0v7qysdXMPyeWCq8ucTNA9InABFblqz9nUDZPHcIQXxCm2kipdbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LoOB//3I";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD90606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LoOB//3I
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2af4c8d00so188238c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794143047; x=1794747847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZapCdoqGqWMAQgXzjcWNscud2Aunl0QfBTjahqyvzOU=;
        b=LoOB//3IGLSlepYjPgNYVN2vu2ngY+G0YepOIG+Bh5vgAs9ssOeNJaHpebeEpjltZ4
         4429wQwagcOC1i228bWCxL3YIsymBg2gKCO5rm4QcWjCspktALrb2rK/T/uNynewjkn4
         Ry+5WeHjkdFXZBmQg8Jh1CVfAgbk6db4/SGXij0XbmyvMTiDTLS69MqaKCszrtffMLKF
         rjG5rKH0aCbqXKOKYL8BJhEoRusIPNpNqVrOopMvnAq6rnX612M7eXXDwNJM9cATfUKn
         33QBz4TQbgahKchkXqHT7DHpVnrHhyowREt+uZWa9oSNKp80Ubr+8qu2tLIpfJydH5f9
         x4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143047; x=1794747847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZapCdoqGqWMAQgXzjcWNscud2Aunl0QfBTjahqyvzOU=;
        b=ZJoGcbC/waCBRT2KgzzJvZF/TRx8RSp5dCFDiStdBAksSmGR/j9uQwP+Qa9FROrnDd
         FjG4UfglI61J2u66mVPcLb8KD4dQWt1Y1BDN+YFpaZ4piC+vqeDAbNxcqGkQBdFcpk16
         Tpt4d7EVh24oMJurDaCn0OP4vf9h4Su6iZAVvltsnINLa9gKEl099PF58PJIYQinZ8he
         1wlo6jVbZQfY6RYHrZG4vPGpcNEKOzKHGN9WAxiN+relVgTBQAkc2ZV3jv2f6zxoC69A
         NK/Umam5ixYQJ0JJ6Vwu+UW8uI1H/PmFjWkURP/howyRMmsg2RG5HC4PtKhmYwA7sQEx
         CrOw==
X-Forwarded-Encrypted: i=1; AL+hErE7IM3AQQ7X0XNSgFTknNs4q8Uy0gPDtZA8gCBtEd1OeJnLPs59J1GkdP8M/xdvnLpsOzURILIpv0LIVIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/57/CAVnFiBj2/NSr3/O6xX/1FjCaNa3Gl82zNkQfGkTnNtWTN
	nfQVow6PZC47bmfJOB/mLFaJ6WvTtdjbALSYGnbmBNQcC76IXGb+MuBD
X-Gm-Gg: AYBFou1v6Xm0pdOcFkiFW9Aiyr6/YbvJ79TJIIdaS0wSMKkDcVb8R1WEM9UWXe6bSh9
	ydIR+XNyIIs8u6wMBvy29DKHg2rfrLP8cbbmmFy9FcQ0nox7QVF4DkBe0vTcHx7rFch27rsDFbN
	c4+XTDv5INxbOIv3mH+8PazX/F19/5iAZn25muQrhPt/Eo/XfFqptYumx66iBg1kAQVDiCNwR08
	qF2aGuydDXDBssbWhN/FDlYkb9lOqlrxiHJaWepnGm3T46RRn+ZHh2kpNHTjHcieVGBUK1iTEsj
	HyPOfBVavYLilXDIAJDsMvbts1Z+IXeHACUZBfzUZfsMoxfja6T4FbkidTFmkP4wm9BR9eLL6/t
	MUsRS1B3j8uR7d6BJRb6bdrieEKLK/TA9VBx89vDj/M/9L9Lq8OMHMBVj92bw8gq1eLOtdgB6Nl
	mKJ71ttJ8gSZwYRJZYM57a8SaOHvTfR5/IhreamIiG6Lx6iXtjc5Di4yTASTQcVgBIPlDQd+Wej
	XTjHrXHCeE0uUAp9LvWh1pO8kTphs8akRtJvvtYakkFJVxArZxsI2XsYyWa0r53G+1zSfpfBhN0
	saZbzDiJr2MTvp/9GcnsqKnHAVilQa5BTWfkWj7WYZef2lrNdkwNjb4=
X-Received: by 2002:a05:7022:2209:b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b39ff060a8mr3158032c88.40.1794143046735;
        Sun, 08 Nov 2026 05:04:06 -0800 (PST)
Received: from prts ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm6603194c88.6.2026.11.08.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:04:06 -0800 (PST)
From: Xinyu Wei <xinyuwei1024@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Xinyu Wei <xinyuwei1024@gmail.com>
Subject: [PATCH 0/2] ALSA: usb-audio: second configuration of the Steinberg UR22C
Date: Sun,  8 Nov 2026 21:03:01 +0800
Message-ID: <20261108130303.387288-1-xinyuwei1024@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Steinberg UR22C exposes two USB configurations: configuration 1 is
class-compliant (2 playback / 4 capture channels), while configuration 2
is UAC2 behind bInterfaceClass 0xFF (6 playback / 8 capture channels and
two MIDI interfaces).  Selecting configuration 2 on a stock kernel leaves
interfaces 0-2 unbound and registers no PCM.

Patch 1 adds a composite quirk entry for configuration 2's vendor-class
interfaces.  Patch 2 fixes a bogus bmFormats (0xffffffff) in
configuration 2's capture descriptor so opening capture as FLOAT_LE does
not lock out playback via implicit feedback sync.

Xinyu Wei (2):
  ALSA: usb-audio: name the interfaces of the Steinberg UR22C
  ALSA: usb-audio: fix the format bits of the Steinberg UR22C

 sound/usb/format.c       |  5 +++++
 sound/usb/quirks-table.h | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.56.0

