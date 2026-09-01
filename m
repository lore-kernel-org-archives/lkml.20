Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1238F258
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252420; cv=none; b=WXfM2YCe2cxaVHVuyMMmpOOevqb5Yqa+6W1p976ArR+LY02fAOMnDZcf+LvUiSRpwTLj3AaguKVAUN8LwB1scbM9sdehm+WQZP4T08MdKj1F87LwgAMT91TGzclHCXJ4gjeJ1ZVlR0z/NKcbAci2yETRKT2gavnt42OBdCbmjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252420; c=relaxed/simple;
	bh=/8E37Xnx9YJaDh/U9Njjem3qyhhQUgKVn/5BMkzr+EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOnnkUXtCi0SXS2/6rDqOrINEQ0YO7x7Lp8CIBvWFyGvFa6/ekBdne3fiISXzPBPcnEeysymXR968A8ngcizHc2GOQawMmAeWGSMQKTGb1Wfo8SaKjnxLPvuNltUO98gEqJe66F/Nf3XpOCll2L5P8MVfgEi8FyC/VRDWVhtLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rP7mZBfk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rP7mZBfk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so44843375e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252417; x=1788857217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQKFjfjuFL+0WhYIMnVIEjkhiF4ZkpnIVufK+2MKp5o=;
        b=rP7mZBfkGza1vuXoFxFuEweNBGCTyGw1HdghBO7cVP1VHy7IT+mXHiOzcbvP25wirf
         bncMjOHSdrPVybxdwo0+fU8cd/OqxauxT1udv0KXmIeiDifIOFx1sea6pShGS7qYeCdf
         ZeudnB0GOLZQsdPGCzEg2PCoBQKaKYnUQjtfF0pYmh4NZ70Y+kaHXHnU2OQH/51DLPxj
         6FE/V2QXOuT5jSnI4wG5FWF5r8rx19oMRY3YtSELck4FlE1BZIUrN/Fs55Gfhf4ZAtJI
         cG+alw/f3apx+sOaJ562JfovPWJEHIfuVUbScFUCGHxrs9q+ciUu+2AFrImamvH4CaC1
         NpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252417; x=1788857217;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQKFjfjuFL+0WhYIMnVIEjkhiF4ZkpnIVufK+2MKp5o=;
        b=gTTkG2BZxNYL/S48KfRIANS8wrEhhLFMtRwgUZQkJqX/5quhSv7cT0K6y9bgLV+DKr
         9kyy8+4inXZ7rTxRx0nyIz0kxpNdminWjDWKSM/xadS0EVwm4Hv2buxB8rg6Y322nUw+
         5DcvPdemdgMEV7SvZBS8TjXlJGpiIG8YxJzIGNretwbJRobr4HheIdbO7B6U+BQxavZZ
         1LMGyv3/C4gI7eHDtPtJcQH9lW7t3u1Dq2ZOT71NLJrzqkvH4gabhC2GsviKAMbXuIlI
         4QCMDZ/wi/tA5LNQ1ZDNtOhDbTowXGMWye06rFG8QOk18IuH6oHWwJhd2eELwrWhgRz0
         cFAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4OMD6wpcBYFO70zz6BYbu59uihi747HtGjF0oBJcviJ9iTAswe60AoPtM4EiuXbqlNFvt13az2ZA2xHw=@vger.kernel.org
X-Gm-Message-State: AFuF++kyH8av+pjsAfEUJfJfryChAncMnSXrAn6BxhCNQ8NTL7fl2VnA
	mFSjsQPKxSdYYDuLLPwaAlEKmCfojBoeHO8fDyLEqgEgszkOcIhcLW1y
X-Gm-Gg: AR+sD12hQuqMxZPZqB9tcRo+vGddw0wDnrshzyMSNO9EVPbLjzQzltc1MCXKRS/d8na
	IIuT/UP5MsTS2WQ9XHoT8z96GLjPhxWZiguwjrg9+oRDXpifFV/XgGfYnHDUbJH5xZjlLOiQ7aK
	X0AD6h13zSeVl6G3RXtKmhkQaNw0yAtEt5U5d6GzgulLxxZcvMjQLvBfEGJmxftsHBd/H5A/7cT
	wPxctYhIxwFREiD4LEf7mYcjqq/kC6yQFFjh0QmpphLKHKsdnTwPugiJTXaGyOCI8DAF2hrllku
	/0HeHwYs8nO8hb3yWJM27Lvv1RpZEN3aJZEJRfp2tQZmbKxUPNCgd+YGjlfPnSet8MJDX6UCvSj
	AqRMl04fbuD7DbHS5NzFDc7AO6i/24jmkDf7Rf0vFEdd/zrWZRMK9JWlGO+MBTNdfzqfDSU4dYJ
	EeYvJBtBj8qLap1xTKoWX5L9Hri1WwIz6dwFzoliQQqPnm0JI0LT0qiK2Wm8GGyYD9mxhgdQJ8k
	rfumK43nl0yWdZCD23iInTCDXx9X8kvlp+IS8g6KFdo+x9WjTu3QBLsUtN/S/VEoLxSmbSLJolM
	+04sVF9o312DjSxQvNyUqhUOdT3ExEH5dYIlfEcySUSZaFrGa/2fnzNEavedvLirZub0
X-Received: by 2002:a05:600c:3f10:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cd01972c9mr332759145e9.0.1788252416362;
        Tue, 01 Sep 2026 01:46:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm727447725e9.2.2026.09.01.01.46.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 01:46:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 0/2] ALSA: aloop: fix trigger/close UAFs
Date: Tue,  1 Sep 2026 10:46:35 +0200
Message-Id: <20260901084637.66106-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026050445-detention-cussed-a8c0@gregkh>
References: <2026050445-detention-cussed-a8c0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport the two ordered aloop fixes for the trigger/close peer-runtime
races. Both carry Cc: stable and each fixes a separate syzbot-reported
UAF, but neither reached this tree.

826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") covers the
peer lookup and state checks with cable->lock. e5c33cdc6f40 ("ALSA:
aloop: Fix peer runtime UAF during format-change stop") pins an in-flight
peer stop across snd_pcm_stop(), which still runs after that lock is
dropped, so it applies only on top of the first.

The failed-apply report for this branch named only the second fix.

The series applies to v6.6.155 and v6.6.156-rc1. Patch 1 omits
access-mode support absent from this tree; patch 2 matches the 6.12.y
backport by patch-id. The identical 6.1.y backport is submitted
separately. 6.12.y and newer already contain both fixes.

KASAN/QEMU functional A/B tests passed: 4096 captured frames matched
byte-for-byte; control notifications, mismatch handling, and 32
open/close iterations passed; no KASAN, Oops, or WARNING was reported.
As upstream, a prepared-but-idle capture remains PREPARED when
mismatched playback starts instead of being forced to DRAINING.

Cássio Gabriel (1):
  ALSA: aloop: Fix peer runtime UAF during format-change stop

Takashi Iwai (1):
  ALSA: aloop: Fix racy access at PCM trigger

 sound/drivers/aloop.c | 98 +++++++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 36 deletions(-)

-- 
2.53.0
