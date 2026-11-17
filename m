Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936817;
	b=qYUtfptdHQyBo5SEcl63+8rL9Xg+aSHrYzezbtmM0zjYo3mEuKL7CkTFLIuOORfDx5PI
	 u8KGOkT1kJJX8wy/Ce6QkjRrWf4d6PzgOErKSG70ytCXztev7twBWfk9ypEiWllvgJB2V
	 09QS8B4vjQi19Thp66ee08hPwIxdoAcrvP7VgIdBWP6+ODHk3+Py9DInZXDFbejo/zR6Z
	 qYB9p2ieMZYanuUdb50m5tCw/u2UJ+0TwHV/ioT3YiVqA8/Ti0G4ZX0R6MB2vsxj+k7as
	 iUNrm7VWip+lQULfrsG/D6ytO2jtYL1eQEaEA1daID1SupJ9K8HaP6gfwUWQY31ihNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BrMcWd7pvu75CincI1DxjIJtK+iHHZhWACFR9OMESAw=;
	b=smCv0t1ZkSHFjTL3XX51QtS/uLCc6N54hrzGbIL0KGScqD35r6UABj2/CJRCNbp1QkKY
	 pDQliHDgWIvnZ+85RKLmwjgqaFp2wKYSis0bDwqGgRoN4kecm+BjzWFg2qzkZZdbjOfZO
	 lTOjzjRaA3rRClu483krZtBTFmZC992XeLxuH592UV4Hrq3Z0a1cNgAjqy0eX6wfwM18j
	 QJ7UJgui2Y/BhtYU0+VgLchxUHYqqN9UTFlq4cqtPhpaatMoVaODKeLBYchU5/oohTqw2
	 JP4ryO//GvM7GebCRA3kPXnITvpoYilIPcGakTAyetS0QOEsgww1A7HHvuMjEXn3VSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qq9cWzZj;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A580606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A580606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qq9cWzZj
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso7712f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936815; x=1795541615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrMcWd7pvu75CincI1DxjIJtK+iHHZhWACFR9OMESAw=;
        b=Qq9cWzZjrgVRuhct9Bs3XWPLq2gc4ngF99znVrHxGFg29CgIdyg5bdv1KU+5GCR47Z
         W/1CNTm0RFuyhIpOtfdFSDIYysMReXu9u5BkGqEZl1RqmCPbOIpv5apywR/27GszE4xG
         sl08M+PNPYGAaFy52pn8LZWsyjKd17q0jvIWtgJXTmK7bvHJfJz86Ijb2NIXSk61GxXR
         zBKdUn0p+UXoSd7HduOaTpXCQJXHXjJJ6Nw66bDPKeK3vhAgokzBUMH1YIrff1SLlMp7
         NQ5jTq/wn1Mn4jvL+AluffZnEGf9Wm+FP/G/j+Inm9WVYi4S4dABC0428Tgjx2HmggXu
         m7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936815; x=1795541615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrMcWd7pvu75CincI1DxjIJtK+iHHZhWACFR9OMESAw=;
        b=p6NGmex5y30BbG8e0FF1KBWaasfdYTFc9st3Vx7r+QAzR8O4p/pr++nivEqSDQft7V
         jrtU/Jfq/z6i7G87i7All5dJblTZed8qSZ+DT62i2QBh7KDoFN4CyjTt0Cus2lYIC33q
         IzN2PVkQuyk5aIEU/vEDjQzGKwMNSnni5C78e8LrbguG+/6FAgdkx0u876YuKWJEL1Pr
         49ODedf0TaAPnBAGFbT8MkRmp10sKs/rHvh1RkbY769K4zeON/7ONYaoplkxw1+r31Fl
         Kqn4bG7fGguirs72ETakE+rVljqoeyyGuCupiuBz4JSYf8E7HD3zdS9O3ZWXxlTc8i8p
         BCYw==
X-Forwarded-Encrypted: i=1; AL+hErGRasJo1TgR5Ksd58YWekSRLphZuKekWLYJL9SlroNTYdK0EHT11LPINku1V4jc6YLB7hHf75qFIcPbBfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uE9ToKuQA2mVj8hr1uaAKneR4z9/qMkhUDnqpfzHBOOucHbFw
	CHipEMqAQxHzJNpco+wXwFr/cCzCLq1GcTMQIqqp6G7RcnhKIgYsAA5X
X-Gm-Gg: AZFdTZcocRQDC/Xxq2UgmZ/Qe3NVT9BvreCJ4RvtvkkNs8bzA0gJVvp1MBIJ/uouqPF
	9Zbu2kbUDSlI+ahUjzm+eO/gmeUgpmAuDMHbY7DWmWkPFKRtMcatjwpKJAlQC0BmmbOKBhJ7OOx
	xb5/J7fy7ydSjH6quZXjnNLu1e52ddx7GQ+n/905i7trQp6im5imTic6RdKFJy7Oj6ysM8a8+TK
	CJDo7t2Z+HZ2C/SmZ5TGHWrh1m4Eev5UQ8K7F0Vg3eFGWrt/SYkZFs0qzzmb/9OzT2oHgsu+uKH
	9pcw1kgvbdB+qHMPcQTyf4d78zEm05bgz9DxpZ/FN9n+yzutovnCa0M+62LjKPEg+mmsQVAKwpX
	fOq+NZ+bkSCIYZ5EO0/UGVlkZ2uAxehqUXJ+4fXp5jqU8GA1Lzp8OFP6sDmMI3qyOisRgATUObX
	UKwwTFpTqGCWpmvpHtP0UT7gW3Cauof3hRrZN7hxcQ7EG2QnPZqvt87zZzADuTtcf/04CEhG45S
	/L0CVb2TglnAcJm5gNflxiL0Zv0KjnWDFhgTLLK8DRbjUaTmUcpEKAzPR+ycCC3xMcK8vR+n5Ba
	ATZlGEsHPa0=
X-Received: by 2002:a5d:5e85:0:b0:490:f775:b00b with SMTP id ffacd0b85a97d-4a63f64de54mr255493f8f.52.1794936815359;
        Tue, 17 Nov 2026 09:33:35 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2e6c765dfsm8165024f8f.33.2026.11.17.09.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:35 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v3 0/2] iio: proximity: add Imagis ISG5320A (Samsung Galaxy XCover5)
Date: Tue, 17 Nov 2026 20:33:31 +0300
Message-ID: <20261117173333.1853986-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074013.355363-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
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

This series adds an IIO driver and its DT binding for the Imagis
ISG5320A capacitive SAR/grip proximity sensor (I2C), as fitted on the
Samsung Galaxy XCover5 (SM-G525F, Exynos850).

  Patch 1  dt-bindings
  Patch 2  the IIO driver

v3 fixes the real review findings on v2: Sashiko AI caught a High-
severity INT-polarity bug in the reset sequence (eliminated by
dropping int-gpios from the driver and binding entirely, since the
pin is already described by the required "interrupts" property) plus
a Medium-severity devm unwind-order bug and a Low-severity unchecked
enable_irq_wake(). Both are now live-tested, not just built. Per-patch
details are below each patch's "---" line, as Andy Shevchenko asked.

Tested on a Samsung Galaxy XCover5 running 7.4-rc1 plus this series
(2026-11-17, kernel 7.4.0-rc1-00023-gdcb8b91fb779+ #30): the driver
binds, registers as iio:device4 "isg5320a", and in_proximity0_raw
tracked a live hand-proximity test (baseline ~0, swinging to
-12817/9748/10759 as a hand approached/withdrew the sensor).
checkpatch.pl --strict and dt_binding_check are clean.

Based on v7.4-rc1.

Tool usage
----------
This series was developed during XCover5 mainline bring-up with the
help of an AI coding assistant (Claude Code, Anthropic), which drafted
the IIO driver from the Samsung vendor driver's register map and
drafted these changelogs. I reviewed every line, built it (arm64, 0
warnings), ran checkpatch --strict (clean), and tested it on hardware
as described above, and take full responsibility for the contribution.
Review comments are welcome and I will answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: iio: proximity: add Imagis ISG5320A
  iio: proximity: add Imagis ISG5320A SAR sensor driver

 .../bindings/iio/proximity/imagis,isg5320a.yaml   |  55 ++
 drivers/iio/proximity/Kconfig                     |  11 +
 drivers/iio/proximity/Makefile                    |   1 +
 drivers/iio/proximity/isg5320a.c                  | 848 +++++++++++++++++++
 4 files changed, 915 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
 create mode 100644 drivers/iio/proximity/isg5320a.c

--
2.53.0
