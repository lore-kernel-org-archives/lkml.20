Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784192;
	b=WxFdtgq4f4IxPG6xitGIILgzml+UDd8KaP5XtfoG+56pa7SJXdoR+HN2IaSJpZtY+p4k
	 pws96Zbx4oEPcfzfipYbdTRun2m/GxDW9bt58HPT1w07CfToAx2q2SnD1s5gQ5gFAtI38
	 Hc6DYS80i2M+e3rsEdX965w6TU20TwB0gQimmS4CVCb99QnbmWXveR9uiKGmXiqBuAbe8
	 GnPPAefWg10pc8YGwKjUdZdPM/IFPRZ+HmnLgI/a90fhex8IdvildgwZwQP6bJ5jaDreL
	 eR5SAWDHvDxwDLlOiK8ydmnQEXUXrmLwFdwNn8r2VfftD1Q6/IPswpmNyEvVBWKNU7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=l625WaYz05tuxkMPrYXEIl3wHIYIWGdZBEbzMzBv+3o=;
	b=C7Ba2JRcC4AbIzjqvgtq89289ih18dSj93eZKruHAiz2LpSb9fngm4JwKnBbWF7PCMgu
	 ii6n0a+AfGbPw3fUCMyq+KthF9DnSX1GNdRcludL16A5QF9iFezeb/0J4dnp1ZqDLyJY2
	 ruOUpZvS3xaBKkVDqqi/QWqGz3EacLgGCdNmlGWElFTY6Ky36iCKPfiEpUhYMKw28KR2b
	 3rhxMfiE+Dj0MGE0pwyyFp5aJc/NehBZ/RszT+W5StwOXkDNcEQbp9i6f4HUjmV96Cjp3
	 THV1yFW3U8Xf/5FEgtuuJNU/8T6uNy2RcVD+FsCH3agRZC/cypR1/aumTkWdGJiIVwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yv+WjofV;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD5606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CD5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yv+WjofV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-369f33df08eso800393eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784191; x=1794388991; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l625WaYz05tuxkMPrYXEIl3wHIYIWGdZBEbzMzBv+3o=;
        b=yv+WjofVIwN4wmr2CZdx/HBP0X/MSvtWEKfaF+4kXaJQRIB1/UpBXPGEnSwfksPIWh
         r2bE97GWyBUlwWCGYtuIOlnPwhWS83/M/53s0bNHkSS67iRu2L+yUOzesiBuSAkjiPMs
         RemmnlUQhpAnfPvNKz+35iLokaxjvvNBthxkCkS6YvIXXLvThAgf5EhgL7JZ0WLYfXWE
         ncF4V9K90+nzgPYQFw34l6xVLUAj/gOnAOXvrh6DP9VG/jMGwkG+VvQGHj8aD+uLH9dX
         iMSnTPCfcOfFrOQknpV2X4kRMKhKbbnS/x8LIMmR9Sv43aU9/Mb3dYd6A6hpVjbM60NX
         7XKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784191; x=1794388991;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l625WaYz05tuxkMPrYXEIl3wHIYIWGdZBEbzMzBv+3o=;
        b=hcRwvIAAsDA/HkwpjPsXcsu3i0D4WOe3maIoBSk7orxcyY9AT5NHGiFmrvzWDR3VM6
         O/Kf3aJA8RTiG+lq4qUzF5PMCnOanDYOMUcle8tr7+ahb5NbDAu3ceXoOgGSS9hdwZp4
         ULNy7dOr7EuW3jqVe2SAcEc4hg4u9YpkSWkZHvJE9w/JczEQ+NH5jwTjF4jETLwVQXcE
         HXV7kRQ89cty9+rKsxGNNUApjqCsbRwnDwSwymeX6XzEti7tnDwC4YNBYEW1fKTVXfAX
         VvDfGOmc8Ilad6b3NCMbq0byEXkVbWOFKsc4nxx6UvyBSpK15LB/FrHW/b9XmAs3g64U
         EtkA==
X-Forwarded-Encrypted: i=1; AKwUvBxLEKF1GYwmyiiSkXaZ8qv7ato/fZ5nUdY9PfayFez/tf9gjXBnipsvW+F0EsQtkvnDTinQ6yYeTiGNxRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nYCT0QJSgeRoIpvsljGc73PSe87hh35vviA1e/2ScM/SIceY9
	YqujXGi+7c74QtFYwQ8KyylC9gZahJeWvhuHla0sanrWwlBSlg9NQwpG
X-Gm-Gg: AYBFou2EZ+lgJ3olLiUl3wHzyMSA1Pbk6pmmMzNh9XBBa6iiJC4s5X3OkKOXXDJq4kX
	LlhBONCMZCjuY2OIraPStuJrQ7QPNHU+mI0s4BvXm55xTc2icHhOSHHJc2QAPCOI+XhEm72OUkk
	dxI50YfvyPXLyYLLG0eqyxJS/DKjpDJrTt3BjSrW5p+/GdaDFmMcobL/jmjtWD1SR2RwGxOrhJq
	dBJTrH1zfTn/2HFBmIJbJEaRVDAvQGUxCRXijA2vb2Q6ss9jsS/k3fKyDmHA9dCiPoqAi8/IDvM
	mbxB81s9Z1/0ZYvlPansQRNPe4sCwEATNpa+lRuVK7eWWhwDesTpOkPXMdrhhUD9bRcrBYbYCtO
	Vu2jXmYUflcHjWVoJCCWo+5jpY/KVNbUN6qnMy01hhxpQGB02l48ZMHI0sFGJQv38yG5rQ2/2n4
	qyARia6ekYPGNInvyuOQZQUyCN4ZzZ1S+baevanKKMpmemhrSITq/m+UTkDJQoXEBWl6enTmhZ5
	ThQGlts4NoZrpdwAe59/5Nf1MhxZqxiKEUsnC+EW+aCMkkFxjUMjeBy3ZJByTOBsS9xJi5q9g3i
	ahcuMHrvDASnGIGSFwXEj3RBe1MJMUoSl5ONSp8IPTq9HDS3xu8HNu2fT6EnknvMzOg=
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr23062656c88.11.1793784191353;
        Wed, 04 Nov 2026 01:23:11 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6796395c88.22.2026.11.04.01.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:23:10 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:22:55 +0800
Subject: [PATCH] usb: gadget: u_audio: read period size while holding stream
 lock
Message-ID: <179378417544.69464.16164899430939223277@gmail.com>
To: nkapron@google.com, gregkh@linuxfoundation.org
Cc: raoxu@uniontech.com, sonalipradhan@google.com, 121811682@qq.com,
 vladimir_zapolskiy@mentor.com, felipe.balbi@linux.intel.com,
 erosca@de.adit-jv.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

u_audio_iso_complete() reads the PCM runtime while holding the
substream lock, but calls snd_pcm_lib_period_bytes() after dropping
that lock. A concurrent close can detach and free the runtime in
between, causing a use-after-free when the completion callback reads
the period size.

Calculate the period size while the stream lock is held and use the
saved value after unlocking. This removes the unprotected second
runtime access without changing the period-notification condition.

KASAN reported the use-after-free in u_audio_iso_complete() on the
unmodified kernel. An injection-assisted test stopped the fixed
callback at the protected read while a concurrent close ran; no
use-after-free was reported under that test.

Fixes: 773e53d50e227 ("usb: gadget: u_audio: remove cached period bytes value")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc7..7f378858146a1 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -156,6 +156,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	unsigned int frames, p_pktsize;
+	unsigned int period_bytes;
 	unsigned long long pitched_rate_mil, p_pktsize_residue_mil,
 			residue_frames_mil, div_result;
 
@@ -267,9 +268,10 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	/* update hw_ptr after data is copied to memory */
 	prm->hw_ptr = (hw_ptr + req->actual) % runtime->dma_bytes;
 	hw_ptr = prm->hw_ptr;
+	period_bytes = snd_pcm_lib_period_bytes(substream);
 	snd_pcm_stream_unlock(substream);
 
-	if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
+	if ((hw_ptr % period_bytes) < req->actual)
 		snd_pcm_period_elapsed(substream);
 
 exit:
-- 
2.34.1

