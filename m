Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814818;
	b=Lxcx0ga+3kBWavU1sk3a4ME5J3QVMlnRNLLTvDnOS1F81oR3xDnJUiOeUExKPCulZc8I
	 BhAnQIASy/7W2vD92PNo+/UJpDTBsihb7ZcN11olYekI/dAPlX+OwJMqbZp4aJHTYHchU
	 EPtNuBRHajI8LK1t2XCnvtYxwHuPS6eS/Q0dudoweOq9I7t5UkUlLDDRtlYjvwot3t0lE
	 uTIbpL59UbZ9AlvSrkjai07vuJSUM+tXvUUfY++U162+vjW32YIDVFGW3cN3t7oHwJDvp
	 Cia6CrD28dPVV29bGBZ0vmkjN2gMhVFqDoDPRh+73bYaPrhLI9MCyHMb4oHkNi6SGrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NqqPkO6TP9CP+I+rGLVpJtch/uB+AU8T9QDkOfxCb7M=;
	b=iP7ULACsRAyGVyeGIe3xuaApjEx+MV2B55bCiDywlI8Mg4OY+hEO7Dx7HG4+vVwIcyxQ
	 xYE8Rva5FOh4jtd4M4Y1JmpwolXyL8HxzRYUp5KeC+trbXdQVvS1U52SvApEJ4ny3vWMB
	 iRbX4ep/lOG7V6VTsIyr8ufkLIw44kOT8XrsMdXjbZp68tFZZxeE2LDsfSS6DPBcHYmUt
	 rfPtB2lj6aQZKIKaegx0+bPVIuss1BafDoW4iyUrOE+w3m7y5zHAbh4ly6hFo9kxD26h3
	 EknG76Zas7QIFiG37xpEw9C6r9EMtsChm7pInfxnKLzyGEZPj0tYN9vKslVglYQ5TQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G06NtBSj;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E1D606F1BB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E1D606F1BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G06NtBSj
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so17396985e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814817; x=1795419617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqqPkO6TP9CP+I+rGLVpJtch/uB+AU8T9QDkOfxCb7M=;
        b=G06NtBSjoTjhJShTRkcPAR6AQMurGbI3UCOUAedyls4HuNZ/+Vjwf+roHnovmdZPJ4
         uRMPnMdqk3fsmDfXq4kxeJVjqrqwkNOQsn1i5fWmH0862jJ5MVtfN9/ZFNc3Vq9mcmKF
         8w7lpDh/4W8YDreTFWVhK5AXxtWIX/3tYmOpOpqTEw+TmL0dy39kg4lxKU5rhKrZdzsx
         R7Fl6YQ5nKyJ6TFg+L32zCK+AhFbWvD0LGEFuV8Prp5X4VI+dgyI54jLUnu4bIPbSgpF
         YFU4LNR3H+T5fGCAJX06AAhGTZggLbgkeWWK5YYf9T98C3wDff22tGH0Bg2pSJOoHNPw
         9WVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814817; x=1795419617;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqqPkO6TP9CP+I+rGLVpJtch/uB+AU8T9QDkOfxCb7M=;
        b=jVA68th7QntDkUJ5LMp4URwgemIl5uZIwGzy8GHqgF/1myXUERm2bG3e/8tziRyQwT
         plEX08WQgyxcJYwYZccXZalUY/kS/j7NoZuwttw+Jy5/Ut/z2ishJmV17xk0Bmoj02dI
         JwDBPU191UNOErm6mGXHiWJWsmXXwsr7mwAG4yR2rSXhcFCbgMTW2b/pDpH4MuQQNQZT
         x96bQKlSQVIhMAnzz1Hni2KmE64lv7drivVQ9pyfLVdAHmwkX3MpdKKZmzy9Qwlst6bH
         y3Igmazm/paogZOMZhErhrOKsEyaqHo37LsSF1B1cH2HxDHnKxZ8q/qn7F8CoR+RmAmB
         CkXA==
X-Forwarded-Encrypted: i=1; AL+hErGqGV9jLxmCy0gfc5m4O0p3wLUJsHcU9ss/JGFqbaZh4qpZwgAbi78HZPdpipijnncTGYc4mkampCq1+NY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WPal2dMyOFinGkbIbhgrkAzEeQ1NNVX6+iU/UEkLi3pDs4S8n
	ZYODILCBIMT0WLr9hZtdJwmiM4MTznGRQ3ZNd1QMbdIWOLV374/HqlCA
X-Gm-Gg: AYBFou25IrDKYr9Eo23scMHPvNZjeGwvsLGtYtF6nVYwmBs4xYWr+OHPeepXUVQWN8h
	COSeHGowWX95WUz1sETm2IeJObh4tzOKAO+IFOjLB35Q85ftxUDOT4mP4P764eLP1SUiPxVTP4Z
	DW9wWHzLNLA/gzLoU0W16a+v1QQnVb0pXn+Q36GI2JosZrAwraOD7Pt1Y252DYax9AFC5x3NJAf
	xXm24DU00GFXMuHXlBZNVPwqnj9VSImhxJJgNYW5BB4j48GhH/G4FLBtQg0Nf0mh2rkgndMP4iD
	X4fNUAFFaHbawEDAjMnKYwUQFv19gY4ms3Zzh4YfpTmByAYs5Sc4CjFuYv/F3MF8Xou3g6nVsIq
	kvy54CZshviz/gykTi8JHELwE/ZdtbAFs3SCu5a2J3+YAjwBrzBOq5mge+nRFUSOVdwsViVvWCC
	4R9gtTM3okOg7SyelE1f+kAm+gwBriqNLZNSJlEsZvdvN4WfLc8SvhwycLC4hP5fTeGnHH4TRYN
	16oYlx4PEnWUJRlq760SOcPf9VqeMyP7+TX1b11sIffhkpZMZB6WvUGkYDD3DTk045oSvymFepO
	+x0vSaKMKDVd
X-Received: by 2002:a05:600c:83ca:b0:4bb:53e4:a7cc with SMTP id 5b1f17b1804b1-4bb55a74c2emr200060065e9.30.1794814816575;
        Sun, 15 Nov 2026 23:40:16 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm259712705e9.2.2026.11.15.23.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:16 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 0/2] iio: proximity: add Imagis ISG5320A (Samsung Galaxy XCover5)
Date: Mon, 16 Nov 2026 10:40:11 +0300
Message-ID: <20261116074013.355363-1-tadilhusrev@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds an IIO driver and its binding for the Imagis ISG5320A
capacitive SAR/grip proximity sensor, as fitted on the Samsung Galaxy
XCover5 (Exynos850).

  1  dt-bindings: add imagis,isg5320a
  2  the IIO proximity driver

The driver exposes one IIO_PROXIMITY channel (the B-channel signal minus
its baseline) and a rising/falling threshold event. Tested on an XCover5:
it probes, registers the IIO device and reads a stable baseline value.

Based on v7.4-rc1.

Tool usage
----------
Derived from the Samsung vendor driver during XCover5 mainline bring-up
with an AI coding assistant (Claude Code, Anthropic), which drafted the
mainline IIO driver and the binding. I reviewed every line and tested
probe and read-back on hardware. Review comments are welcome and I will
answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: iio: proximity: add Imagis ISG5320A
  iio: proximity: add Imagis ISG5320A SAR sensor driver

 .../iio/proximity/imagis,isg5320a.yaml        |  56 ++
 drivers/iio/proximity/Kconfig                 |  11 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/isg5320a.c              | 857 ++++++++++++++++++
 4 files changed, 925 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
 create mode 100644 drivers/iio/proximity/isg5320a.c

-- 
2.53.0

