Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101473;
	b=C484mm5quk2HEMaKTI38BNfWJ0WJVCE/DOfytdMLHeNgwBvbjj0siz7Gy+5+uISUAJsZ
	 Y2x3IgQ6BgkXJmAFjYMBdu136210UT48tByjtPdyV8FihMAsMWQPNWFAlvk7woC2iIuGP
	 vta5m4PU1VSAVKAF2KRABff+uingAAW+VKBjZyBy10j1aOzz/b5jjVtIIReRIKlJOuTqe
	 +tSP2Tg3FsTKON+9YFseMf9isqyTisUX8c63fsc1ypBk+vLj2bnfvefd0fNGOI9//xHmM
	 PbfpNkGA6eLXUde/XUpOHM1gkl3nJT2ZXam9xMMqVwcSs4KC7BG+0bNkS63MFU5MRAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101473;
	h=DMARC-Filter:DKIM-Signature:List-Unsubscribe:X-Mailin-EID:Date:
	 Subject:X-sib-id:Cc:List-Unsubscribe-Post:Feedback-ID:From:
	 X-CSA-Complaints:To:Message-Id:Origin-messageId:X-Mailer:Mime-Version:
	 Content-Transfer-Encoding;
	bh=aZoT8Rsgv6ZRpZog2Yv8ZExkygxeRKZGgV/LAEavvwk=;
	b=u2aS7246QT4YbbnaTOg5DHjJxSrmAYqMwZixXnBUWvyU7WLWHOj+nWGJDVEp6j3XiyK+
	 TdGI+jEnmANG3Q5LZMef/7jM8F8XOIAvROxrAiZPNlm/yiyznK/40MWp5OSYlgLUJk1zV
	 SbRtMGOJN8/6Z5EkJDa9VqwF81bmzNu2FH14mp+wRMqNwuNs0XRXoDV5bEdzJ24MmSouR
	 giMrOd6UARb41wc99GMf+No3zDVlOoTpzmedFADZKSX4/K0qTg8FLo3ExN4aPCZTFv7QT
	 MZFaK3FOi2ojNxPjWcaJ7AYZb5THXaCXE13bP49vBto86PPmCUD+ViOaRYSnJnsJ/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gy.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=CcFYoaW+;
	arc=none smtp.remote-ip=77.32.148.25
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FC606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=CcFYoaW+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=aZoT8Rsgv6ZRpZog2Yv8ZExkygxeRKZGgV/LAEavvwk=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=CcFYoaW+eY9ZzEkm5gRfVsZLLlFDpttb0gqYlNbek1P117GEAZii1j2hQEdUANjc+Hj6MmVKLJOJ
        FeAuSo2RELNVkTa4f68de/pBJ6YXLk2uK/yWtoT3LH7v/iK7d5pYCIx6VGZrjQyrlL+vedpelnjU
        1hdKD0nLOT4KyxXSLhePiAhbGGMGWg23MlyEsxglPC56dVK64U+eG1SGUDCTOj9L7OXVPeDuBqU2
        b54Nt96C2CxjUqs+r88q2cAAksZ30iC1sPao62NsqUPXQ6g498P4C9Z9+WwKlpdlvqJhWOWB02PS
        0vPJ7pxVDoBaLcPEHZXRlk23TLvqmwqPMSqirQ==
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYxMTA4MDEzMTA2LjExNjIzNDYtMS1EZWxheVN5c3RlbUB0dWJvdC5sYXQ%2Bfmd5LmQuc2VuZGVyLXNpYi5jb20%3D
Date: Sat,  7 Nov 2026 17:31:06 -0800
Subject: What should bridge drivers use instead of __v4l2_subdev_state_alloc()?
X-sib-id: WTpt27AtIWNK979gJMuyWc59mWQ46UsvjtK4R3zhT1CWXJ9scF9IdaGbPGYQ6uabuqA47izbUIfIhp_CWdLTC60lGiC1OnrqWPi8OMCd-XpwOBJ0AOt82WNHLkhalpNxUZyL7kP_WHk33QhTiHeV0R9GKuoGDBL8UKyow0--rlbjklIbM2GPTAaCdQ
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>,  "Sakari Ailus" <sakari.ailus@linux.intel.com>,  "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,  "Hans Verkuil" <hverkuil+cisco@kernel.org>,  "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>,  "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,  <linux-kernel@vger.kernel.org>,  "DelaySystem" <delaysystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.25:11287567_-1:11287567:Sendinblue
From: "DelaySystem" <DelaySystem@tubot.lat>
X-CSA-Complaints: csa-complaints@eco.de
To: <linux-media@vger.kernel.org>
Message-Id: <20261108013106.1162346-1-DelaySystem@tubot.lat>
Origin-messageId: <20261108013106.1162346-1-DelaySystem@tubot.lat>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hello,

While working on drivers/staging/media/tegra-video I ran into the FIXME
above __tegra_channel_try_format() in vi.c (added by commit 40aaab9d773b
in 2022):

	/* FIXME: Drop this call, drivers are not supposed to use
	 * __v4l2_subdev_state_alloc(). */

The driver needs a scratch TRY state to negotiate formats with the remote
sensor subdev from video-node ioctl context, where no subdev file handle
exists. I looked for the intended replacement, but:

- there is no non-dunder allocator in drivers/media or include/media;
- v4l2_subdev_call_state_try() is documented for legacy non-MC drivers
  only, has no in-tree users, and allocates one state per call, while the
  driver needs one state across enum_frame_size + set_fmt + get_crop;
- the active-state APIs have the wrong semantics here, since try_fmt must
  not disturb ACTIVE state;
- the same FIXME is still present in mainline vsp1 and staging atomisp,
  and mainline stm32-dcmi still calls the dunder directly, with (as far
  as I can tell) zero conversions since the 2022 rename.

So my question: is a new core helper the intended direction for the
bridge-driver scratch-TRY-state case, and if so, is there any guidance
on the shape it should take? Or is there an existing pattern I missed?

If a new helper is the answer, I am happy to implement it and convert
the in-tree users.

Thank you,
DelaySystem

