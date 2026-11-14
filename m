Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641771;
	b=GQjntdh5wKtgOO4/6Hl4CJPSThcmp2lDgF04I2GrGKigAtBK8MJh5CwI0RS+vTqfASV8
	 MfCGa2+EJIv0wkldvD1owYBMi60vGIFScKG4o+COswL2kWtu2ANj1462vSo3yfcQ/Elu+
	 UuPvIEE/7JpEuJF9QLrRb7jNJQNclhTFPMavvKt+iGagZfyHovY36eHLF2osgTj7Cei6q
	 1sPPnC7pUIZFqfKpvzy0c2IaE7gJ9Xr/y0ONkRP+TYd5MOT0alkvTKwCS8R5jhAvddK6C
	 kC5dJVztLCh3VU9zun8Qkrq1j3zRVGws2+mDvov7mlx9Ncjdtr2QVkXVzd/iQs+d56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lh+xj3j1FkUm0E1b0mYmzquxFERoGGYH5BnvZ8XddII=;
	b=vMQiRlXOXW2cSdYXikLs8e25NySNE3j52QmS/9rbnKH8VuLaXCZGIY5FnCmmbCv2y5fR
	 GGFvJmN1iDMDpVoZD62gZHUCRUGgQmEIhkpT0T2J9afGFp9mNXH+pAN617MRg1DhH41k9
	 ZUIdm/lRX9btHCXrBuz7MngenkzUq6uGPeXzolIwihuq4QR+0oa6RMLbWeEOLv/fIoLJI
	 2FE57bx2EsBnrJggvMuZpcSZdyWPWbZ0kEVZNE4OKzhY95hpZ9Rfk9XVlDkI8Imo50t6c
	 QubjfGdjDWCe1pJh/cogoXGhaZAzlVj77dCjCJOUMuFrr9RxuHFtxkzrkLa2fS8+RpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FApRiqcn;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F0606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07F0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FApRiqcn
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so2283338c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794641770; x=1795246570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lh+xj3j1FkUm0E1b0mYmzquxFERoGGYH5BnvZ8XddII=;
        b=FApRiqcnkUypwDNGznoRTPpSH6ZtPuwdDSFzJOKXUHiDsc2Qya62trvl06Kslt4I5r
         Hg3lh0U8e0iqV+ELDp2iH5XspUZIEiW0+xUdAl4lCzF9y6qqcSZeInQXW7NahdzAVtMF
         XLBXLO/AHbQFVIcvRfwsIGmxMkaQSTxu7RCaTIRk9VKTWDa8qyXydNLJyf3hSnLY8HXr
         eHzR/yQ19LDbtWLmrvGdCcITPOX4SzvdtfUox6MRoiaFcb8+wNh6CzvJOmNQQU3BLPH1
         HC2Hj/g/15VX7lj/i4zAb2vXUkSzNlabdf9hf0oUjFuKtTEiuFe1aAa4naKABvu5XT24
         kY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641770; x=1795246570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lh+xj3j1FkUm0E1b0mYmzquxFERoGGYH5BnvZ8XddII=;
        b=a7v8SS8uJMvRZYKbAFdmCwmDbHuCjYRUABVpGOIG8JRbb5NOMvQvgpLlXi736wbH9w
         7V9kGoCTzkTbvwC/VDvqtnqhS5fyhEFfKtYr/oZFJqdOKqlRfav5zTKZKO265BeYt4US
         GLad5JUk6DvgqgTNbhVJeBrFpOnHhd4FEzO0QAdvo7MxIA2cLVMC6++5/jWM0439kL9m
         hXQV+G4EDo/vEZjp/0Awy67hI+Ihrnv0RIBKyUrFeiguA+xqgFr6s5hroEWE8GSUfyPb
         /y8BqWbU/wVTbsdkT0/Pxw8ALNFgzMdHhc+KMVheYriyWI7LTRZ5c2Qztq8Ha2oouT20
         jRNg==
X-Forwarded-Encrypted: i=1; AL+hErEwvuFFGD2//2XlN+BpNs5nXbQX/gbgoH8HDbPSZ8WMDBBs2KzoltzPWxz/3PAOj6kTjCwkubXQ6LxTyoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+axNt4Wuinil7K5C4u4BEhK8Xm+j/u7fxHaiG4c2/7TEPiPp4u
	KBjOIKRcdF3keBYUH4hZGw52JeuqexDLOIg3qldX7EgdI1BNWctUh7B5
X-Gm-Gg: AYBFou1oZCLxClJ+gl7G+oHqFVUdFAO0MvrNGEDEJXz+D137NYabG9y4q3KEQpzf7UQ
	1SoN8X58896Nel1eqmT5Eb6sEe1FVJei0+yPhGw6y9QUo8bA/iIw6uJI3OxOtyZgZ2p4Yn2Am/F
	AYXEqLmk58p+YpJPFMquq14HDeGnDKMmn+wLvQS5J3587dliHnARxWM060mOtipgyrveOg4QFJd
	H1f2n3DO7Fvsuz3zSF/AqZ857xXTJD+0Kdke4s6gOKKg7fx4WdWFB1KEgTi2kE26Q0dkP8zds+n
	jUP/3VhJ75DWVnM2De4usJZkEs6Q1FltzPWwhX1atsupyBViBHkP+0HNvsjNNeoeD2P1iw/j/E1
	pKXP/1DCmcYFkT3UhkVkezqhIMBJEBhcKju8UJiCGRxHknaunIBnKSUmdtC/T7upXNP1sKLFbk5
	wsO6RoG+CNIDCKe+AcVLEnrykLDPDtWm/B+RlnII4NwIS5LHbox/0XMcfgI50Uu8yTlyntNoMx3
	pvXm8PjtQg86tqlQLarfZwNpk0VJNTbFm0btNsOTYxlKpqkzwPWByhnbUzAWhFvgQWORu6+9eBo
	B4WfSDE3dB5R+Vfu+DGPWi+10B5ze1JXeuC3dEbzYbZetpZp0YwysIIuUCBMzS16e93cJVQZAWW
	7zby23XX/XLn6OboigrJ/BGv3YdFciO0w/NY7lgKgOT3ZPsaLofc65+0/2JzAARnuJYxwfmJuAY
	eASpnoxM3o+Hgd7z8oj/66p2jzq2Piz+aYfbRTlzjBoQ==
X-Received: by 2002:a05:7022:286:20b0:14f:8d59:edcc with SMTP id a92af1059eb24-1b5030d4057mr4772322c88.12.1794641769764;
        Fri, 13 Nov 2026 23:36:09 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm16082635c88.4.2026.11.13.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:36:09 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v5 0/3] iio: proximity: sx93xx: keep the IRQ balanced across suspend and resume
Date: Sat, 14 Nov 2026 13:05:54 +0530
Message-ID: <20261114073601.23404-1-kapoorarnav43@gmail.com>
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
Content-Transfer-Encoding: 8bit

sx9310, sx9324 and sx9360 disable the interrupt in suspend before
anything that can fail, and don't enable it again when suspend or resume
fails. One patch per driver, as the Fixes tags differ.

Changes in v5:
- Disable the interrupt with disable_irq() before taking the mutex,
  and enable it again if suspend fails. v4 called disable_irq_nosync()
  at the end of suspend, so a threaded handler woken during the
  register writes could run after suspend returned. Found by Sashiko.
- Move the register accesses into a *_sleep() helper per driver so the
  mutex is released before the interrupt is re-enabled on failure
- Rebase on fixes-togreg

v4: https://lore.kernel.org/all/20261101102518.22757-1-kapoorarnav43@gmail.com/
v3: https://lore.kernel.org/all/20261028220444.70121-1-kapoorarnav43@gmail.com/
v2: https://lore.kernel.org/all/20261026112342.65917-1-kapoorarnav43@gmail.com/
v1:
https://lore.kernel.org/all/20261026100322.16720-1-kapoorarnav43@gmail.com/
https://lore.kernel.org/all/20261026100408.16874-1-kapoorarnav43@gmail.com/
https://lore.kernel.org/all/20261026100450.17023-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have the hardware and haven't
reproduced a failing suspend.

Arnav Kapoor (3):
  iio: proximity: sx9310: keep the IRQ balanced across suspend and
    resume
  iio: proximity: sx9324: keep the IRQ balanced across suspend and
    resume
  iio: proximity: sx9360: keep the IRQ balanced across suspend and
    resume

 drivers/iio/proximity/sx9310.c | 54 ++++++++++++++++++++++------------
 drivers/iio/proximity/sx9324.c | 43 ++++++++++++++++++---------
 drivers/iio/proximity/sx9360.c | 45 ++++++++++++++++++----------
 3 files changed, 94 insertions(+), 48 deletions(-)


base-commit: a6d9114f68c4b5507b2d945bd6d1e37415f913c5
-- 
2.53.0

