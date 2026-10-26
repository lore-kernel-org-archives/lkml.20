Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024812;
	b=nFIs9EzKYIX0Fi+IDwm31ghG1Q9l6tPI1w9H5IoTG8mqZqNq4wyOPF+bvYriCJ4bPFXs
	 al6M1iIMUhdHdw7+E71KCCFOmQow8jtQLbLqJzohBQGEuXsmGQp8VP8rEHenmvIhOGReT
	 DlPDCY5leHxhtYzXY9n86VTwxCZNuUA43yBpe+mCO7MU8b/ck3NMZ3pJBt41EQCZKKlaL
	 TJGXnbpFW6GWt1w2D3KBX8Nnff12cODwXCuVRlc3laznrw/LMNghCKcVwHzVz9h4jMVhI
	 uPBY6ydkSmsabwOyJFErk2hmScKBXMbg1xhmza5QqXV6Zr3Kdr2JhAx65L5XitWDtUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kPxtDvfkw7gzZMJAYGqqIUZcM0lgL/y+Nw/mPWUHCmE=;
	b=Dwmn7Zuw2MQFMDi0Wl+GzCNsmsqYxmqZCJtjwXuyyji19ycL1drQC09oJzUx8qY4N0s7
	 NzuNl3pNTT2WnPZz2w7TmFzIlZ2352UTtbb3YanB0E5S/HVgKNDSJubhMSrA6b0Wg/mIE
	 q1xYPEMpllyRjmKp1rYqfm9z4OpDIRRubP2+yCP15P80RJRYTtTt5Ym9bILN/ogMRipqc
	 f0fxv+2nb1sLih97433ed7cZCyOPwH1j99VwUpf9hbEr5k6UsezW7+fOy+7pDqhXLldFY
	 gW3xX6x4vSiuiVH5FLCqnnU5MvGQPELRk9o1zf8XSECUNn9VEqLM1T9OWZOePJ1usuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bGAy0Muu;
	arc=none smtp.remote-ip=74.125.225.72
Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D60F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bGAy0Muu
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48df34cd790so116738f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793024810; x=1793629610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPxtDvfkw7gzZMJAYGqqIUZcM0lgL/y+Nw/mPWUHCmE=;
        b=bGAy0MuuMLpX3wD9gYnGXXtWKNJc1pSI9tTxcKuH2vKd069FO90Sy8OjEn3ukfvmX5
         G5gYFhQBJ2OSrPJAE05TbNNDoEDdKYs9kqxIbDdMPZ4kEpia1tmqbZQa3qnGeC8puJvs
         N3q/bVNR2w2Cw3pIBJE9q7HM40+4MRJ3lHS05dDYx/Ri4nKX88YhI46H5UdCuRRK3YFE
         5TfRPhvbetLdEq5pPsGltVt1j/5C44BWN8XvJq4IX+0r25NLSFw87HpPIZMf1EBY54Z6
         wqdXrGRKeI3z4L6mwaqKbjESDFJCgmYVHJqu3QPn3J9+sjn6fLlpAGhwTNaEketwkonh
         7bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024810; x=1793629610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPxtDvfkw7gzZMJAYGqqIUZcM0lgL/y+Nw/mPWUHCmE=;
        b=YwmvRE+JN+XTdmIoXf70jrRZM2STCB7CSi8pYauTPZX6kP5Hqq+J4EDZ2SKg43pJYC
         Gb9BP0pvZ5hSjqtJIOLNiCRMZaK5qq/T0DxR9qqtzspFoSpxQNwzJHj9KRSTyBo8RF84
         eU6Ao6WIhwW4J3YldI8a53o2V1P4IjWs+Xw8b05ooGkzXehzdOInWaPX+QjzYcw/h9T+
         lGb3wZvpwgruf3kNkweGARen9PR67SDfOyOJ4M19fEApu/eUQw+tZPC8qoSXuNqkoiTK
         qntzjsI/Vl5qTHMn+cD0Y/4zPvM9xZzuqCDjVqo4WRnyrWdcA8Smh4EMh34Oe1DxX1BR
         z9EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJQTNQVyIJuEeG3xEzWCgPmzrnsJdEiFuuk/JbEjpE51ot/vKjg1/B4oh4WFzCVI4PxydaLASEhOB8TCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1Y1RXgxbV/ZKHnGb1KkxRTdW+/8tnc7/AWToGgkJIOzXsuOHV
	sQuEGPWHhBrk1g3fis/kwkiFnvGuiGWWm33qBJDKpr13uNyqBiplCNcj6kUjJk1qjKE=
X-Gm-Gg: AYBFou1s8wt1oH4X8wEDLzc6uwkOQJP8m4P8ca/ngZrl8n2VxrYFgk4R8h7wCjMkK5h
	8vcREKiXo782zFZ0861/pGGWl0dKOCf/ZdnTw0xzpNBXqopMmzW+UBZvBpkXypEu0SUrG44+R1e
	c7L9eoYuaU0eCR6tROucWAkYHPXiT+xHZCXSVfE14js50QXJk/t5wQa9Ekzo1j1a1aFjg7P8ZIL
	DRryJSAIztNXxg+JST1HFVv0bEKKmJcdz/w4nB9/E6XZsNkJf9H3p/yZnk1DWj4Wr2zMWquK9OG
	5SrorGVGNOSAlK4XeqCqK0XTD6sm4M0rzZdj3GOPq49Uv1U9BDu28wjtTAst0E5W3GjxaxosSCC
	Ndf1mt2TJjD1qd8GGj+o4CO5HmOP1ek4DUyxWJuVmKFGMR5Ck3f0NyyOECF47BIW/ke6msLxTRd
	sc2In55SV/fSIgD7Sm6yLzHLsziUspZ7/ZaKfBJVGpdWKmptRQqR4OprxF+s7sC4Xyh+3I47qTw
	sGCA5ZhUPXNGfUIlECK9fGX+8ZrDwSbqp9bOewgtoxbo0Zl0b8WFfzZwusQc3OZKfj16dzd4GTD
	2Et6eDoYpjkz3gdUX2X0SuqOLR2uSrM3o99+98xiNv0AetRfxy/bS3zZCuCk8V3G0hZJBgbanQ=
	=
X-Received: by 2002:a05:6000:104b:b0:48d:fb3d:bf28 with SMTP id ffacd0b85a97d-48e3eb6f93emr9742954f8f.3.1793024810341;
        Mon, 26 Oct 2026 07:26:50 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm16400703f8f.4.2026.10.26.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:26:49 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Input: synaptics - enable SMBus for ThinkPad P14s Gen 2i (LEN2072)
Date: Mon, 26 Oct 2026 15:26:45 +0100
Message-ID: <20261026142648.2567233-1-dmitry@kernelgen.org>
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

The ThinkPad P14s Gen 2i touchpad (Synaptics TM3471-030, LEN2072) is
not on the SMBus passlist and runs in PS/2 mode. Forcing RMI4 alone
does not help: the F12 attention handler reads the whole 79-byte data
packet over SMBus on every frame, which caps the report rate at about
43 Hz and loses fast swipes.

Patch 1 fixes the size passed to rmi_f12_process_objects(), which
counted from the start of the data packet instead of from Data1.
Patch 2 makes F12 read only the registers up to and including Data1,
raising the report rate to about 65 Hz on this machine. Patch 3 then
adds LEN2072 to smbus_pnp_ids and should not be applied without
patch 2.

Tested on a ThinkPad P14s Gen 2i (20VX) on 7.2.9, including s2idle
suspend/resume and the TrackPoint on the RMI4 pass-through port. On
this device Data1 is the first data register, so patch 1 does not
change its behavior.

Changes in v2:
- New patch 1. Sashiko pointed out that with patch 2 alone, on devices
  where Data1 is not at offset 0, rmi_f12_process_objects() could parse
  bytes past the end of what was read. The underlying off-by-
  data1_offset bound predates this series, so it is fixed separately
  with a Fixes: tag.
- No changes to patches 2 and 3.

v1: https://lore.kernel.org/all/20261026093118.2312302-1-dmitry@kernelgen.org/

Dmitry Mikushin (3):
  Input: synaptics-rmi4 - f12: pass Data1-relative size to
    process_objects
  Input: synaptics-rmi4 - f12: read only the object data on attention
  Input: synaptics - add LEN2072 to smbus_pnp_ids for ThinkPad P14s Gen
    2i

 drivers/input/mouse/synaptics.c |  1 +
 drivers/input/rmi4/rmi_f12.c    | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.56.0

