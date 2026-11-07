Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019006;
	b=ZCqmaWi9DrHQrzzZ6zdYwEEIYwE9sijJMeulvWQa1Q3pY1OFD2V5/1sCfVuOkyS6mrcN
	 G/kIxPVkBoKPKkaoTFZ9ip95oZKmxXoevh3hKRuqObKLJLl/RfS6Kz0obkWi6IVp/ekQm
	 Hoah+4uB3oayE7pVTirwqTeCgX5+0ksAbb6yd3PWrzX4qYx5NIX7ItUYE1eLY4sQVjYHY
	 P/NrT4Q5CgWx02Kpd8upsdgI1mT8h5NqLijP7C6EJKFQgF3b3ASD9qOP1K/FF6F6pFxRF
	 zBcaH9um5j3H5yU3JzHM2KF2D5LDJcOLfM2xKWn6P8UoaNVxk1pWVeMd7ue3mcITUNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
	b=oh+4E+dt3hG+xLcTzapl+3jHQcAACTn9hFTExraHBOO5XoQyqWliDnWfFhBaYuPt72of
	 Qo3iaZPkivGw+L4EFQGSgluCaS9ZIzeck4C/2aFxhUt2DwDfYhDcuj6warhMQ36qQ4eti
	 kwVvzEGPX6xS3sic3uODDdxfTYDe8fHzsB/uNpuCMytPcbjFde1aUs4dQ/OzlQClXhbYP
	 0qobDKBCZ3EWfI6asZ4pC8HJCCvgNbSeBlGaHb0oRLN6/xBJUGTpuL+TT5hlArwKUX/9y
	 YPqQOUTfaruhh63/TR+S/GRZ63f8uS3iDdn9lP9brGWudfduTihEO0T/t2fGBhiArAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JkscqRq+;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D1606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JkscqRq+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2054931eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019005; x=1794623805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=JkscqRq++B+ptNom9a+L3m4CpRfjH6yEuM7WWVpDw0YRYMkSl78OdWOLv8mfU2y98L
         52LmMy5Dy5XuXc64jwh540/dpl2ydJeie+ubyx7da7xcB8m1Y7nkdechckpqrqWw9Q2l
         o9k8yxCMFzhuIlzGc8lCG7zzknmVDAQmVEYnVSOu9or68qsXVSCRTIi4Cr5d1Rx/a+O/
         aWEVheAe+0yT2Z/r5cFzPt1BEn9cN1MuDIv+xiqdTeVhYz0/RpOyJos/pZCqQbeNKCD4
         TNIPN0OOsMA0QaG/R9juiSMHAC8ie4bUIeEnKn0lHS1xgH3XZuMIN8L4DZNZWuegBmnZ
         e5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019005; x=1794623805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=XG5wbssC7JGb1x/G1cQDk1A9nJa3m3R0PlSHfJ5HxZUNTMad9r4n7gmjLNIhw3Xkks
         0uBeNwHiB0otTiePqOZS/K3AykZvCzpX/1svwzGHGJkkLfcKsQzvHHgnlKJ0abCZPCES
         Ffp+wOQmPxzQUCL1N8RhnHI7Sw6uQK5JbCcDrXYmfzpMS1JD3G+0d7nw+l556wBRjYHS
         eqgSa5zzvTIJj4Nq8ltMuGkcZ4qNOTxmNQ4nZWQb8S9a0H/Ynq5d3u6QT553hN7bFJET
         T6YMypvrwvtrptM64V461/gAssozGWHWxSrhOJvPQw1oin3G+dO566/fXXG7EA3yBsBP
         Xzog==
X-Forwarded-Encrypted: i=1; AL+hErHTfNJIMg0ywoIVyTZz18mrVywNErSQtB8Ws5ZWkLxHGKmcBkPsfANRQH9gG8Ev0hfDlry+VmDEOSCPJNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kjYLn3mpW88dkW8JfClGhLB97OYon8qSgJbiGnhyqYVrr4ZUb
	VzHz2gA5PTDe9ee47sb4XzMEnB2mdnSs7dCE5ElBHBmL2I1F436B+nU3VzxTBwr/tw==
X-Gm-Gg: AYBFou2/w1KyBv4rUtVgcJyN0ZZhA9XMDHoV+XhZQOB0SphozubT5q0F+Dn4dERsR2T
	uAs5aAI194LlUJaP145v+givT2sWEVQuGsO7vhFlBJek7Trbf6PhSuRRJw5AHEdyWucaN8+8qzj
	SXQZ8u6aE122/YNH9xblleIvi0Cooe6NuJEUZvS7SJoI/gqWbcRjukSTBl6nP0NwXJe64x+3vkm
	XfCM12rQcHbVUOuKu9R6dR+31DUmTYNQ+dJTJU0Y64ya/tLfXQQvSr3AiEiq6SeuR2i2LyYqyvN
	TyFkL2qpMP4IxA+MZn/78ByY/qgF6vTZmrxC3QdRinP7jPN9e9/M9ISWGCs3vdDbOaoEJbbp0fE
	AwATw2+OYu7QHMKmveb3k2sgvirQaD/Hs9dNs4ToRuxR/tz/Go0h2ZsLXAAxCTg4YogNunXnGU4
	oUHtb3sb4Du7LFe6wudSXrGys2bxqOBiI7SG3tliw/Bi5xE5UJGzPW2gOSF4xWAMKg/uB9wAW3E
	DOCxbKaWVH+C1AHG6rRBGS0njhAH+Xs1PZ7p+qfT7hPRPGUjRxgmS7BpUmtnTzsDmBHVv2XDkOc
	emBx3BJZYs6L01QREwuyJf22s/1v7B/Wk3fSS4BTfDsOILO6HVPfBspMUUNRPTMEl9k/Ki93XTl
	3Ab76G6J3wm7lxw9Wk/8=
X-Received: by 2002:a05:7300:4fa6:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-36fb6a9164dmr5030384eec.19.1794019004825;
        Fri, 06 Nov 2026 18:36:44 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:43 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:36 +0700
Message-ID: <cover.1794018128.git.jjc@jclark.com>
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

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

Following Johan Hovold's suggestion [1], patch 1 exports the generic
driver's operations, and patch 2 changes onboard_usb_dev to call them
itself instead of setting generic_subclass, so that it can defer probing
before the device is configured.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.
With the peer-hub property removed from one hub's node, that hub binds
to the generic driver.

I used an LLM coding assistant to help prepare this series.

Changes in v5:
- Patch 1: added Alan's Acked-by
- Patch 2: stopped matching a device that has no platform device, so
  that the generic driver binds it (Sashiko)
- Link to v4: https://lore.kernel.org/all/cover.1793941292.git.jjc@jclark.com/

Changes in v4:
- Switched to calling the generic driver's operations from
  onboard_usb_dev, instead of adding pre_probe to the USB core
- Link to v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/

Changes in v3:
- Added a patch fixing existing problems in usb_probe_device() (Alan)
- Link to v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/

Changes in v2:
- Switched to adding a pre_probe callback to the USB core (Johan)
- Link to v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++
 drivers/usb/core/usb.h             |  6 ---
 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 include/linux/usb.h                | 10 ++++-
 4 files changed, 61 insertions(+), 26 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

