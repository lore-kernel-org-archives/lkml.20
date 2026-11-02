Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586428;
	b=MxmAzRpm3oc8zUkpztZ+niPxN4nKDSv4Xhc4N9mESrxUY8eeYpQdEmMrnt2oi8KNpBsP
	 OlZd56SVADD11yE6RJN+vW/DPJ8DF8cKNSoB+rTj4xhMCD79K4aZjbwu28Bl7JwJd/qhk
	 +Jj8LFDiDuwK7ASE+Dwt4WR0xSTtyH4Iu2xa+h7ExeDXlhnNNIqCJR+K01oaMi42kyYqH
	 pqN60AXZeHYiR4gdn7GZQ84f1F0ipPv2HKfLUWO95Pt9NSemlCbmVQOLbJSBx97bm/e9K
	 0MpxUFKW9HKdEaZja59Q+fX7xCg+eQsD1TtfS7v8qgb+rMHdo2XVkpqNd9dDk56OR4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GZEW/MmY82jQQYdO3E3Xfw7aPj7RpvhSNTPlFqAChjs=;
	b=da7BxC7K/7b9gAWtZPjO46cE2gTo8M7wqiJ22CXCdhQ7iYZua92F+ZYSTV+C5N7NakNn
	 aXbeKCWApBSCRvAb0MDYwmjATLku4J5Rx7Q8RWjZVRghisDaMMdIr401/HuTFwCkgNdij
	 Ki2ZRTUqTjqDoGXRo3T8GfQOgiyOcE5kfCIG8rDh1swORx/bGvt1IAo5qgxE1BjwTnlnF
	 uT9ZQS2axlV9VGrS3kkkkfZNMnqrqKYGTO8zhtr9NpeCfIe6L+Y4YpJuF8IyXfCuQ4hdJ
	 4VMSoUmIh7XFJuFjzd1gXFmBVRpPy4hLFKC/xwsWhH1sU0/+1aP7CN01GVBu6Uh2P2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqpmrxFh;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BA9606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BA9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqpmrxFh
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ea0efd636dso23053415ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586427; x=1794191227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZEW/MmY82jQQYdO3E3Xfw7aPj7RpvhSNTPlFqAChjs=;
        b=eqpmrxFh5fkChLzNWZQS1veije0e4rlHljA6UhV6PYnc95OjyAVS6xm5LJ+5S4Eo80
         tDlMR5m+xYm1kbAbz+KwPMdK7M+xyJohJ5XefVZOegpKSJ2V9hHZ1kl4qElLRHaXf0kd
         8pjOPWHpSxYZwBuXfhZKclK2fOu/+cJYWLuAztxONmd8xFMLw8qifkawkh9xfqkA2WhV
         jsZ56isTwKkJuXF9gAoYTpYKkYFZ1rD7dYIaL6cgA6JFNoRH05UUY0QBlMAQJ4DBwRqX
         FpBchyp1eshIo5gniChmkrcO/mPGrnUh8TJ/ipUa+xE5sayahW9vskMlEaUw1oKmCGLQ
         dQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586427; x=1794191227;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZEW/MmY82jQQYdO3E3Xfw7aPj7RpvhSNTPlFqAChjs=;
        b=hZmQ1cecI9P3n+SLxCwkmIbI2Eo/UuJctUpRtn4qJjW/JxJG5r5dob9GOfJOKZSQ14
         /zJJXD+VoMCu15ETNdNCCmIYXoZoRhiKFIrDEIff9kNU0OkbEKdPPpoPxwiNfUxxSIw9
         ByIIqlHxMrvn2ns5bnv8Ztv9iUvMmRCVFVzaow7AeviGgy0y5yLF4qqoEUh4UTRL0Y0B
         /NyurlAD0NYA0dMBSuNk+A6ToblDD7xcKi54Hh6qQLXbdvkhWdNerKziSotjron3c1N0
         4xUrdrD85tCHS2VEGdyfMw2QVczLY8lvHb51XtY3Py5iDrGf5PUP122KzPvXIl4/ckIm
         jxRw==
X-Forwarded-Encrypted: i=1; AKwUvByFIhdsW6mz/VQfpsPUCvLzPBy9rDJp0YeZWGzUQ/dqvq6+A+iuby/tOL6wdwXPpjz0Y8sR2iDANG3rpJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z96x40M28j3B7LqoAzTYZPRwm3gbXtsSfYq1M3EkIaOrock4o71
	JokCy0PDLl4iQA9W4vKlW2gLGHk8THRa88rTlWhFLp6wFXBszXLkUONN
X-Gm-Gg: AYBFou3yZSErGtJT1APa3FL0E4sdlkmVL+zjtuxwCmJYQEdrs6JAad9zPQNpY/RxP2C
	ENPvm/LhUFK7Z+yDjRJMDujadwceD0Hbs3GqwXhSVQIrOEeGNdqwad7ab0pRusRzY9fKwKIwlhl
	rotBiXVAjhroO+nJP9KwFfsyMFL3SoW+OBLup0cbquPRow+rf5UVd2FrUe4mXUU2f2MH3pX6UiC
	OOSCogQCFLMEBcAx/yMiT7EOeGNXya/vn815zEhTu6tDiZeCfcZKCh720oG1As9LKba4O/y5iBu
	wj4tqlMUU3417r82R9ha1HkeEUwJwWa7msH/rbS0wbHvxO/5t/vym6xFp18g8kIWHoTwXb7U9+m
	9s2lOJJKcPpShRfHYmGDl2SoOj2mpj1rUNfeXKalsdZS+bMggW3tSqU53dHWteC9OMnnaBKwjKt
	TnKLiJqg4fVCTd6lUoGZgwVDTf/kE9Qx3z9iErm+8AbRKmgPJZE3MvSEXXopzq9q068FfxPxU/y
	fZZO/nNJmsXHoyGNWV7ExY4FHsClN56+Uipj2hkpGmuexyP4ZwP+/ipv8z/yenB1PPJwM/DUozf
	73MaYLnin9UO4ulfWueCH+8sdMq5vDnd6vt4UgfgiAtc2Eg=
X-Received: by 2002:a17:903:1b0e:b0:2e9:3dd0:c8d with SMTP id d9443c01a7336-2eb36493f7dmr89884315ad.14.1793586427266;
        Sun, 01 Nov 2026 18:27:07 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm20759805ad.6.2026.11.01.18.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:27:06 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	BeaCox <0xbeac@gmail.com>
Subject: Re: [RFC PATCH] mmc: dw_mmc: disable bh_work and stop timers on remove
Date: Mon,  2 Nov 2026 10:26:44 +0800
Message-ID: <20261102022644.49510-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e206aa41-fc3c-45fd-8653-b9a65cffe0ad@rock-chips.com>
References: <20261101063719.88570-1-0xbeac@gmail.com> <e206aa41-fc3c-45fd-8653-b9a65cffe0ad@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shawn,

Thanks for the review and for checking the history.  You are right on
both points.

dw_mci_remove() never called tasklet_kill(), so the race goes back to
the original driver (f95f3850f7a9); 921c87ba3893 only replaced
tasklet_schedule() with queue_work().  I have replaced the Fixes tag
accordingly.

I have also split the fix in two, since the two parts have different
lifetimes:

  1/2 drains bh_work.  This is the long-standing race and the patch
      applies to 6.11 and later, where the bh_work form exists; it is
      marked Cc: stable # 6.11+.
  2/2 cancels the watchdog timer.  That code is new in 7.4
      (ce0043b9a302), so there is nothing to backport it to.

The code is otherwise unchanged.  v2 follows shortly.

If you would rather keep it as a single patch without the stable tag,
just let me know and I will squash them.

Thanks,
BeaCox
