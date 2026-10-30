Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336341;
	b=Wx+9TnZFMBhM620+LOWfEWODW8t1ABhEkKyfKf2kEAgSWIh+Te3Yo7H/soxcy3RJoOQw
	 tcvccetuxvU0zyW5H55iTUjP8NlOb3LQEO/dNZTlP9zxigeq66O6U+yrMSS4nOQvU+HQR
	 dRO5xguwD3E7vDNfAIEL7w04/yOxf2r7VczgJdU/LUzjbo32lXHfwF71KrBnnpKCejKQI
	 mqBvvZJrLEekXTXnIiT2XS1+fnHv8iJDHoRsOUbPy38iL7fDoitaBann4K4YQaKGrRvrZ
	 OlT+9V82vHxjmSX38qs80Mz8o6bMn+P4GG6Teoo5ZfwEcXLj3DGVD1LzpofQwtNZHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uNwpVqDjROJGkszbWCt3hcbKnoADzVRF7vj0i9CDHdk=;
	b=YbzntNffap8KgFjB1ef59XtQagTDxwnd/J0s6CVkGbEwzryLYRPTTh0WkXG2Vz6ptgSB
	 /JEdpkcBuwLLsJNaXUyhCP44xtOsTNa+Z/UQTncUGiTwsZ+5taurQ7WlHIHD/1Psaprpf
	 rCB3TfoAukKoMr4H4vFmHViop+AmKTRTlswUEqaTiSevsWPZcvg4VlLkXnq5oUah2Wiu4
	 rECexDcv5a2c7t+T3lcElJWyahmD4iviTJLTKmqAbykw4LyRsFuIY1z2PFmv9oUCnmnTV
	 x9ivZjfcBb6B4/aRN4mZNlcZqzIozCd6LmpV9w0WLUNveikWiTKOfNixSlxFMdoxPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VvQmqhyj;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83FD606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83FD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VvQmqhyj
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so378600c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336340; x=1793941140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNwpVqDjROJGkszbWCt3hcbKnoADzVRF7vj0i9CDHdk=;
        b=VvQmqhyjoEfPElLInA0okpFRj8JJVpHzoDW7YpvlerOqYiY38kQKJgoIhcWf02E3vl
         +gmwDB7w2YZ+mUDUNLSYg6IlRdw+WxDPyiX6Y0EtxHtQeblklMDsnBl0mM/b9qH7cZfq
         X5qD+dgjfhZhWOil8lhpKmBCt9G/+qd9JIzKUY1YulKatrn3nQnJwIeqH8GFAq9b2ERy
         G0R7cvaldz3pSckXRcQYYWu/ww6vGToCTb/rVG67QkL/TohkYGUSkenl1VvTzmsn+lWg
         Fq2wx2T6Cl6hOdgHfC4M5sjrvHxK9+SFE0wPTF2pIO2FlURVj9m3GQVDWlv1Vxyp4/hU
         NmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336340; x=1793941140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNwpVqDjROJGkszbWCt3hcbKnoADzVRF7vj0i9CDHdk=;
        b=owmMnlgHEWzDSLLqJ7TeOfDAzYl2BF6n/mCuCSQvrMKI3+9caSbrHPayDOYBqtcHSM
         2rmp1TJRkYTO1Ue7xWLKZPt3UqhvPJZwkcQz8gg3pBXrG9Gj9ru22Kx7Tu0YCJPy4Lrr
         fJfdLF8W8+9qOKq7MBCGmc0Hg6Dk+GH2ht7YB1fot4CygR9NTzRn9DtDew1q/q/Y6d2l
         1oJr/yGgx+Gumiqi5vo1zgPShbsez8FU1LLB4ugWk6JV9iGG6qXrdchApDoiVeGQ8NaG
         b5WE9Ex15g3sXW5bzxnwqbLFXo7SDyUeLapWH1wcLG+reVbQihgjUGlNApZeWekzkSfT
         Eemw==
X-Forwarded-Encrypted: i=1; AKwUvBzAzN11DgRvdkmkRagyt+2q58Lc3wrQ5OEhj84NOGCwVzytvhzNOUbQFgoRJOf+rt8X52tfgyM7sgYC8D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMgTAgq3Z0idiy61XlAogYxZ27NxUE6WpveKUvguuBy8cfazzi
	OILI3N6sQx9FrMGoSwidPIiMMYsp1/uym8Zlt+4NFmtuo3qM/y+PyAv7
X-Gm-Gg: AYBFou1OSjFi7F02/3YavIs+bTY2cM4GL0pDSqhZaQ2bd05GL7pr2ha6LgMLcdf8iOy
	nXnMvE4L3NK+4zoXFwBUtjhwuHY8jgnVIU/CHxZtpUrsIKKP6Pw4Y4bat+XJPbgNe4xMOAlOcNz
	wFrKbrW7BwB7BkHSdswlOd2b7jbfnZTLPras6Y3Fbm8iYeTmdwy3H6MOj4yitGdIE6pq5VIaTl7
	q14kgp2t8Bdrdnrg/4SK+B4i4ZiaI+/Oee5kRpziK+6axoHAmkv8e5Fj/7tG0VEIThaD7LXGR58
	nLzIz2l/4X0ZsgIUZEUhXhlhRXmTDudzLphqEu8fekkT8yBUUzZ08nNyIJjrL0tTZK4GoQODEQJ
	7cb01/WKRYWsMk9wxX0omShcEJeSXK6wLxpvZYP/jHHIkn9FmFyRa7H31PaxFeD/IRkqw3MBbQU
	95rpTe9ESZNUpH64rGd/N5o0nVAI++58N1jUg70/e5omAH2JHV8IPtUisGfJg4LQSEpZ84LfsDa
	eMmg8ztHFZJi39TwGkbGZ2u+IqoePt7aJPfr7xv6p/9o6dNQw7fji8IpbIg5k7PPNTVjHiDc1EI
	1hwzKXkwON3iXW+Jn81/i9x3n8LcdrKFOGLjUG+5OBj31B2fp9LkOXHA6ClO+lyjtYI=
X-Received: by 2002:a05:7022:3a03:b0:155:7721:3a4c with SMTP id a92af1059eb24-1ac5f18175fmr1949054c88.35.1793336339593;
        Thu, 29 Oct 2026 21:58:59 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm3433152c88.8.2026.10.29.21.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:58:59 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v4 0/2] tty: sysrq: fix the reset sequence kept per input device
Date: Fri, 30 Oct 2026 12:58:52 +0800
Message-ID: <20261030045854.153556-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

v3 1/2 was wrong and is dropped.  It stopped a truncated parse from being
cached, but the parse still reached sysrq_detect_reset_sequence() in the
same call and could complete a reset.  param_array() publishes every
intermediate sequence with a fresh version, so no reader-side check can
tell them from the final one; 1/2 now parses the whole parameter in one
callback and replaces it under a seqlock.  2/2 is the same fix adapted to
the new 1/2, and depends on it.

Both fix bugs from the same 2013 commit and apply to every stable tree,
but 1/2 is over the 100-line limit in stable-kernel-rules.rst, so I left
the stable tags out.  The two have to go together.

Tested in QEMU with a uinput keyboard, one device per scenario so the
per-device state survives the parameter writes:

                                           before       after
  hold the full sequence                   reboots      reboots
  hold one key of two                      no           no
  hold the old sequence after a rewrite    no           no
  0x3b,0x3c                                reboots      reboots
  hold the new sequence after a rewrite    no           reboots
  release a stale key, then hold the new   no           reboots
  press key 1 while the write is mid-way   reboots      no

The last row needs a 500 ms delay to widen the window, in
sysrq_reset_seq_param_set() before the series and inside the seqlock
section after it.  Without 2/2's timer_delete() the armed reset survives
the replacement and fires.  Rejected input is the same apart from the
two cases listed in 1/2, and reset_seq reads back the same.

Changes in v4:
 - Dropped v3 1/2 and replaced it with the seqlock patch (Sashiko flagged
   the window on v3 1/2).
 - Reject KEY_RESERVED in the parameter instead of storing it.
 - Dropped the stable tags.
 - Tested in QEMU rather than by inspection only.

Changes in v3:
 - Added a first patch so that a truncated parse no longer sticks
   (Sashiko).
 - Added Fixes: to both patches.

Changes in v2:
 - Retitled from "Input:" to "tty: sysrq:" (Greg Kroah-Hartman).
 - Delete keyreset_timer, otherwise an already armed reset survives the
   reparse (Sashiko).

v3: https://lore.kernel.org/all/20261021022007.1717207-1-zhanxusheng1024@gmail.com/
v2: https://lore.kernel.org/all/20261016070636.2559899-1-zhanxusheng@xiaomi.com/
v1: https://lore.kernel.org/all/20261016032732.2328852-1-zhanxusheng@xiaomi.com/

Zhan Xusheng (2):
  tty: sysrq: don't expose a partially written reset_seq
  tty: sysrq: reset the per-device key state when reparsing reset_seq

 drivers/tty/sysrq.c | 142 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 107 insertions(+), 35 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

