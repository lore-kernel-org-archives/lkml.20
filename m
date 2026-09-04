Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A1E468C1B;
	Fri,  4 Sep 2026 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542665; cv=none; b=HXZ9vAad5XWmw3qQfB9tJhkS1FvkVNbv6UBx6Y+ywvOy0wn2olrZY9lKWTDxeB5ho5rLoXmiNQxGVIedPDmwIpNYBydVqbTOjmJ0r1TREYI4bcW+ngo5tSpYLuJBt8bSQENezV68fdevm413SD0KrY9yGBj353eChzc4r4HEx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542665; c=relaxed/simple;
	bh=aHRrwqVmsjy8g0VpNAWWWsqE6EEnUadxJ7SP0R6D1kQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=XrnS8fLczkCdApe1Sdxl/ZPsrWI5f9ULcVZp0pRkfdeaIBzrliZU6XJMiwM0lfYiXXWWsuK2Jn6VOsQeI4jEwBkX9XsvYsrZ8PVqhl7jYxdgnrNCJ4rp2YbO1pP575OH7+o2wIxzf0ITbBYLSDm5qn1jEtd23nnHtlAEkmg/tL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nickpegg.com; spf=pass smtp.mailfrom=nickpegg.com; dkim=pass (2048-bit key) header.d=nickpegg.com header.i=@nickpegg.com header.b=qEEul7dr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OqTpno2x; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nickpegg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nickpegg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nickpegg.com header.i=@nickpegg.com header.b="qEEul7dr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OqTpno2x"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C841140013E;
	Fri,  4 Sep 2026 13:24:18 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-04.internal (MEProxy); Fri, 04 Sep 2026 13:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nickpegg.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1788542658; x=1788629058; bh=eA
	Wr6LHPi4LLwO2tVfuAs28v+80IHXqcFgQC2kjU5m4=; b=qEEul7dr0ktGXC5qxe
	j7kjy9DaNu3u3xPrLXeIRa4B6GZn9omWLw/FqLyQy2t9ZZ0RJWocnFmYxHblsvLq
	7+RrrS4mYM3Lc8xoB9f6OL5mgSuvFT9IydWXzAQN/YN8K5+kEC5+fxzSLJhg0X6F
	pNBLuJXleB3H+LkNv5wr/LR2LACwUhmllSonv+dfElwzhyxq9xU+GXwmIidBIN3A
	Jv5ARdOStAhWsd21UM52Csn8uJF8arVNayd5jenqcENOlaZNSonDd4nuyS9kOxgY
	NCmKj7sCHgFrmb3IOuGYwJXAi+cZRE+XtPWekVSIqfCdIm/MQOwWwYb09MkwUYOX
	bcag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788542658; x=1788629058; bh=eAWr6LHPi4LLwO2tVfuAs28v+80I
	HXqcFgQC2kjU5m4=; b=OqTpno2x+HVFBBuhoLqbkXbu993IcE/I83ULrvSJ8KSc
	draQkedyJRqp8U+LAHKGqZon0AULL6L+/hwlAnTRZHlBTSsboDzzWp5BHLZP4kGd
	7HyJkZIRg8TicaDD1Un0eiQCvzOdN/ml6eS5eyK8m/PLncg2X0qKv06vB27jlc6M
	qLi4t+mdObhvpwZU6zUDSA0bDyplYFp1oSBQYeD26leOCaBzEC21ivStpBnX4BVs
	vWSbX4n0QaJebXb9e4xhjc0C6ZbyfISrQ/Nq6fkXwTDnKXjWYTyoctodVH7BQEGY
	wEBQXu5VNC09R+Mio55Fgz2yD2XH1y+52tcs17/VpA==
X-ME-Sender: <xms:wf6aalFPura3RXlOdUJzcf85l28y9KyUY3XiUKpGWuPW__sVpPbL6A>
    <xme:wf6aalJf0WjkJlLgei8gPP6nR1yR7__Pi3yRe4wqTO3Z17AxB6BtkuMMs3O6GM3OK
    W3w6wmrxhdbumnzIVv2DE2QusKBm5SPhrn5LMHuFBRfLyr_0iFn87am>
X-ME-Proxy-Cause: dmFkZTGbbKRuRpgkEZIKdvGyFi4NcEwTalIXYOIrzXGVZW/qIvDSa8WiF/NkB+DgnqGX5s
    ZEWG66klrOp0LE/eoR329c5/loVt6ySxhtCO33D+uVANbYPMQPNQzcAfZRtf60jVkFQRMX
    ZJEuqluNvpsetrGOvPyr0lckmSfBnYfvVJSxtpirTbrsPMInkCT7JXkJp9dF9HbWsJLMZP
    QpmyUM7JozJRAn6K/tu5UWqMGqZtgul+nyAac6JSOt4CS3GGvKIEB20IkKGtWrkK9jAt6q
    mU4aUIasGKXNGVcN8Evb/LA/QIAxb6hq9jhikn5jTuG9RL7L++pX21kTQggAo+JuVDklqt
    Yn/JTBiqlBAuP736Hi2M0UQoW5BTKW81xX5q6clua1lm/lKI3MO/AW/6L66sFRmdypF4ip
    BmemPNT5zBp2NNk13b3kD83kHh5ZFLyT/IpAnhuoD3i0TFX1/CnNR0AhMFMv1bPBGMeLGn
    +fmApUmmtQDfuz8fm69YpUBLEviaheuUutWkmDzlwVKvVuFGj2xRZlQ5qU4D9mbz3Cl4r0
    37j2BlJO/RRa/FYZJCeJ0u49zvfMu9tG3y4Q7BSmupxdYnJK743WdZEc9QSoygH8vIspun
    O1WpZtkH8BL1/UDESD3oyxxTBvl2byA4A5KS3Eo31M9/yGFv3EE1GDwRE6ug
X-ME-Proxy: <xmx:wf6aasNr635iADqlD6H9tIM5oM8JaHxDPA3qUXf3i_vuVRK5YVOEMQ>
    <xmx:wf6aauZhaE3woHMZynjGj6kkjFiJe91ZNBnOKUZAQmryGIyCusH46g>
    <xmx:wf6aamxmWfm0mGdlRGEonGPuiyJhvCYcQHJ2izosJFG7waHdX-vTLQ>
    <xmx:wf6aapKK0qutPBS0DL0lw5b7CQR88tfsvXAOdjKTeIy4fNKQzhfYOw>
    <xmx:wv6aaiEZ2RXKX5n6U8OcZn48klPaJLnBO8kjyLA7drTTzvdVCFBt0AeG>
Feedback-ID: i95c946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F25018E006C; Fri,  4 Sep 2026 13:24:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 04 Sep 2026 10:23:15 -0700
From: "Nick Pegg" <nick@nickpegg.com>
To: perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <42486ae6-a634-4897-ae70-338dfca68bd9@app.fastmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk flags for Behringer UV1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The Behringer UV1 is a microphone audio processor with a USB audio
interface, which experiences periodic stutters unless implicit_fb is used.

This seems to be a similar device to the Behringer UMC series, so I
copied the quirks from those. I've confirmed that my own UV1 works great
with these flags set.

Signed-off-by: Nick Pegg <nick@nickpegg.com>
---
sound/usb/quirks.c | 2 ++
1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4d2957e62fbd..5b27659d3eb7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2388,6 +2388,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
                   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
        DEVICE_FLG(0x1397, 0x050c, /* Behringer Flow 8 */
                   QUIRK_FLAG_IFB_SILENCE_ON_EMPTY),
+       DEVICE_FLG(0x1397, 0x0510, /* Behringer UV1 */
+                  QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
        DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
                   QUIRK_FLAG_IGNORE_CTL_ERROR),
        DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
--
2.55.0
