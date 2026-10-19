Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441137;
	b=nzNICFxv20lyRbsS1VMIYnXlfDgrnK++71n/Ax4QvmFZklSOTLuptOMPxgKtLr7VeL2M
	 GCcgPs4oNQbrxvQlHVrac2SdsMLDqfOZ/PsPK/S55ma0+sEbwtLMdxfnyIVuKKwbSnE+b
	 kkbagH0S1imFOGIBd+QhWVbk6t4Pehb7x7MGq8JPLoToHQFtQDiL44QfbtEydZHuv/hRj
	 DNvZp+ka6JQKOiv6jDOGLdzg5Di+3mhyyNJEaxnhvhHlW+LTe2Q1Pd4iMMQT4f4RzC3qv
	 PsYjkdRgjA8qrCk4XxHvhIzjVwmnCPs7UfvLaU33sjakZJ5GOCfnAsbOUXOWCoPAlJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441137;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=LzRKCjOsexYDsp+fOhPyrCDvEmMCsC42ZBzmehEXEQM=;
	b=MLhC2JxaMKiPDYsq3q0YupyTCl1Lx7P9a147ldU+s2mO03jJhNe/dEuG6F1CHlfcNAr7
	 Jy4Y1dNql7haT0LrsXrHB/uiAa50tN8b51WJaBCybYbCuwnqLN1lQKN3iyZNf05dkwKl5
	 gHKEbZ0EP87Kb68CSfaxatFIXoBk7gO4iRhGigAbj3DO5tsfD20YivXsUii0kcrgU77rh
	 +BXZO1oqeg/QONYp+3hkHaMjc7aqo5teXS2pmoS/QrqRjH2HdKs1ZB1EuBqI52+4txRFA
	 yX2QEY+lnDEKDN6jD4ps7o+A3FqT6QtAdM3WUfvlvlTE11tskaXY4qijl+5/jAHkL6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=H8TWauOx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B093606A319;
	Mon, 19 Oct 2026 20:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B093606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=H8TWauOx
ARC-Seal: i=1; a=rsa-sha256; t=1792441121; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bc8t96fsyJAUx4Lc9pz/QDLTRC2SP/S0trakckomNg46M1TImY2FNv65ZfN7Shh9f7MPT2B4ZidPKwrh8Ek2Hfw4HBgSSptrxMVixrw/ZoMod3tpKiuVDQNvoBqXYy9q50hBPHtNN+KDHlDS0p/aTC4drKmcfmCpGtAzgNm85Dw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792441121; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LzRKCjOsexYDsp+fOhPyrCDvEmMCsC42ZBzmehEXEQM=; 
	b=HrA1wnp74oJ4OdQ+TZMwanyp9duKHXFUuZly0HvpEzuiP/ot8IQtg+pXy8V0072DIpmL6eN8vZ8b9HEAHnGJPvXV2lX5n7nuKMi61ZSueVRNRE6R5iY/fNguzrbxeJGh/b1JSuPmYm9diC4T0jLI4BaVQRUWuNT3g+9ui43dNWs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792441121;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=LzRKCjOsexYDsp+fOhPyrCDvEmMCsC42ZBzmehEXEQM=;
	b=H8TWauOxGOwOlVABio4pRZoiWmWV9BZi5syNCGiM8of8nGNnJTaj/bL6lHAKDr5u
	jLmaVeUPwjEny6HP1GzLZUySy87gpMg8sW/tPgbCccTaDYRjtGXYiAqxNCSXOLDnYL+
	8eeE/OYlu1XB8paTqCs6Y50qqpdox83WWhGe7FBHwk7zQm4HFv6U5o2pkRh2BTW0ivF
	+YKotQpQhAIc+oErt8IxqMQpskpTgtdZcGIG573OeQcmONRfnxeEhci71TU5Jz9uR04
	mg7GKv7UFSupKCLkmbBGr8//WkvoWWBr+SAs5e9LvplQIzKd0qmJT0b0LbCTBP6gTpc
	xFhB7QfbAQ==
Received: by smtp.zohomail.com with SMTPS id 1792441118149350.0196879165301;
	Mon, 19 Oct 2026 13:18:38 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/4] ALSA: usb-audio: Add dB scale quirks for AB13X and
 Xiaomi Speaker Mini
Date: Tue, 20 Oct 2026 04:18:21 +0800
Message-Id: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EMBCA4VeROZuERmyzryIOYzrW7AFpVYh4d
 8XxO/z/AUG8SoBvdoCXVYNOY0KZZ8ADjT9BdclgP46sqR12FUZi3AkpOp1QLBeVKYkM95Cq2Uu
 v23Ns2tchdn/h5d7AeV71MA7bcwAAAA==
X-Change-ID: 87da826d-b4-uac-ya-audio-e8c0421aa2cf
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

I recently got two devices with insane volume control, so I tried to
measure their volume mapping and add dB scale quirks for them.

PATCH 1 collects the code snippets for dB scale override into a helper
function, with unified info and warning messages, and also deconflicts
playback dB scale quirks of DragonFly.

PATCH 2 applies the MV-SILICON linear volume quirk only to the affected
mixers, instead of the whole device.

PATCH 3 adds dB scale quirk for an AB13X variant.

PATCH 4 adds dB scale quirk for the Xiaomi Speaker Mini.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (4):
      ALSA: usb-audio: Unify dB scale override
      ALSA: usb-audio: Apply MV-SILICON linear volume quirk per mixer
      ALSA: usb-audio: Add dB scale quirk for an AB13X variant
      ALSA: usb-audio: Add dB scale quirk for Xiaomi Speaker Mini

 sound/usb/mixer_quirks.c | 285 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 245 insertions(+), 40 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 87da826d-b4-uac-ya-audio-e8c0421aa2cf

Thanks,
Rong

