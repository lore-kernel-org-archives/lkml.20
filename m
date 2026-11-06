Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000806;
	b=v6ILhSR+veuXUKTQVkdqMibvoz3Q3CPFBt34ui3UQ0o5/bPZfFtpBxkKj9r9hvn975Yr
	 pyagpm3ujyfiC1pTb51v7/923SYUNcOEb8AY2ZyL8/oS2gYmoXtPltvaNBajiLF8xukYT
	 NkC13R2k/b4y0G7k1LOiS6MDNM2+87nJOqfhlN2nYUmQVztJz4OqfY/cNGqgeqMPJPfu2
	 ZsiM1pZvYOKjyq7UMgT4eE5fQly1LUiFCGzbhmBpYeIcuiRrfDHTKEQ5D3/A2MH2kvuNL
	 x3JhtRQ8AxFG8azxrVofd6evu8cq7RdCom7aFn0DALAUvhc7qLEk+xTU0VXgL9lT4Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Npe+5kOXQ9S8Xwjn4qNT7v1IwKvsMfsugQVWOv6ADkI=;
	b=okAihmB6ZSXdd1+8zidQSXrTKeHmJsH9t0lrxpfqeF6UziLnVaoL505ni/CfvMKd7iXg
	 xsYDHKOPC45GmI0fB5hRzTOYanh76QiW0kHZ3fTtkaXvZ0+VT3HH6R2k4HYkcCqXnPwPf
	 XpGFskt9EpVKHA368CksQzZWHGmY0jDRyLQ0qJTo/V23ii6iW8GYq2awGDDVK+9baQOdT
	 KFxDUq47ATO7g4cJLOz9L6GL41PZPg6wzPoEiemjNlV3XGOrG0+Rsouwwp2e8MaYB9+5H
	 ZKXMccNwCD2ptP+3gB7eyjEyc5nCTSz1Rk9LxRHBYYkT5KSesBYMmvIxdKOwk+c1OHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gqCtsw4;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C126606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C126606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gqCtsw4
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so13059395e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000804; x=1794605604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Npe+5kOXQ9S8Xwjn4qNT7v1IwKvsMfsugQVWOv6ADkI=;
        b=0gqCtsw4hlWzx0hyXYUZfKmkq0xlODedGMQE/eDzPDol60Ikalnnhdz+cOn5hx6gJA
         aTAXzvUN9g+5mWo/5N0++bgkoIsXB5dnalDL3iS/xhPC/pJkfFORBRGyk6/G8qs528Vn
         TBFp3H2j9Lnqt45ekXAA/N6XarIkbhdMRRzT/jG3wpT8UgPNznEFD0411Ame/VXca8ET
         oQc0PTxPGRdnr3kOx/QMov1CkmbNYY7mVeI6hdhi0Oavd0hqDMIJSDm4rI0MZ+uv/OQ7
         4+Rr0PNyEhAfm2Xsi0WPPIaD8Mw8ha4DX+iNkk27Va30kZtTjSX6ujaf88xtNa20uxj/
         yTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000804; x=1794605604;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Npe+5kOXQ9S8Xwjn4qNT7v1IwKvsMfsugQVWOv6ADkI=;
        b=wtG8Iq7fJxR/O+oP6AQsnxCnV8QiahkpfJonq66Kd9+yjkGRrE3eORFPAUM/UVQKHe
         iTCQ2e+5wkc7irdoZuR7f8oC2/PhF08YrT3IlcrTez8aODBquAULDXch9FjAe+vIAAgm
         DMRJyX0j+X1T4322+VvUmUAPyFt/5cWfeSky+RRyfXVLzH5jWR7RIlGvWMnF5mc400Ju
         3IBXQpp6IBp5qEUOqmlxokvcG7g2rHc4EaLIbZ2ZNCSOiq+neEIEkAjbiGTZrwVv3T68
         TUgm6+5ZldW50v7ZcrfxQBJHlFetEAemlOGoHeAUgTLJQUlxa0KpdgGzO7XieeovJk5k
         fHTQ==
X-Forwarded-Encrypted: i=1; AKwUvByLudoAlRGm9tGnBKSqj9DrPnyHothaN+DyOFoUCSt8KQ9VP/u/YIcTHRt/ZoscHmOWtOXsDOWs3RrPTAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gY9qs/vgC4IEp04m5W7W04/19gqGAVQ7bHvjTxObaIM67f+E8
	imTxkq60jeYoTBmevX5RdhhUm9Iwg20O9S3o++8Fp4xQ0JYWbDgNqkwb
X-Gm-Gg: AYBFou0B4lm/oQb8SAQrcc9cMVWrofvF5NBj0zVWHQiUydrLA0kYkFBcs+bXeEh1NIn
	iRZnZ8IrMwvrirr2VCZJLFJCT4Dh4rBkYAHKPi4r0tTXl44ycSmGEHLrrb8JZ1SlKjl87oSo2tq
	4GjClm7NcErWsT6WsVGswdF3vWdteMPKvQCg/JAdb8C7J8nKD1UqyP1SfjCEx31gCMVHsPCSrpB
	6DC/4l5RhBp4jF1W+RTOdum7lPS2LUVJ/IFi9nEcQw4v1BKmaGQhbZEzZbdREBgW4HbvVgdKgbk
	pVsEWD6eqLR76B3HcW41gTzBPFmYaWZrwUpufM/8aUE+zRjrc3EurXBWeQgIqW6Ko8QXUxUovNt
	ASPmxOiB9Lk5ckXDjeOLVMRqCBMlPl+Bc+oRYxVYbrKAnG2SxvNDHoeugqC8bff1HfQxHwYAw5U
	5YcFrb5NT0WX6aMtVFh3SXVXPYln2hHVax8wNCeP/tFwXTtn5e19f6DRlpVXCzFONWE+abPDcm6
	Jrtlt9LAuZqRdgL8AhP4Px0cRjbIi+8SIa1LRTdYVs9daBYGLRH9d8N7noluqcfBVT3l4Rr4PHI
	OhD6WgAtFJaxJkoF+bCKDGVgrAyBaETdGA8w1Ai26l5ZFF0j8AjNX+49cVZEpQOKWb/CZg==
X-Received: by 2002:a05:600c:4e41:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4b6dfe8f3c1mr65241445e9.26.1794000803439;
        Fri, 06 Nov 2026 13:33:23 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb272f5sm8804845e9.15.2026.11.06.13.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:33:22 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Tin Posavec <tin.posavec04@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: ov9734, ipu-bridge: Enable the camera on the Intel NUC M15
Date: Fri,  6 Nov 2026 21:33:19 +0000
Message-ID: <20261106213319.104745-1-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
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

Hi Tin,

I tested this series on a Microsoft Surface Laptop 1, which has the
same OV9734 behind an IPU3 CIO2. There an INT3472 discrete device
provides the clock enable and the reset GPIO, and the _PR0 power
resource of the sensor does nothing.

I used 6.19.8-surface-3 with patches 1 and 2 applied (they apply with
one-line offsets). Patch 3 does not apply there because the sensor list
differs, so I added the same entry by hand.

- the sensor probes and the chip ID reads back;
- libcamera master with the OV9734 fixes from series 6330 [1] (IPU3
  pipeline) streams 1280x704 NV12 at 30 fps;
- the sensor is runtime suspended when idle;
- unloading and reloading the module gives no kernel warnings;
- v4l2-compliance 1.32.0 on the subdev: 45/46, only the known
  SUBSCRIBE_EVENT failure.

Not tested: probe deferral at boot with these exact patches, and
system suspend.

Tested-by: Afonso Figuinha <afonso.figuinha@gmail.com> # Surface Laptop 1 (IPU3)

I posted a duplicate series by mistake before I saw yours, and I have
withdrawn it. Its patch 4 sets V4L2_SUBDEV_FL_HAS_EVENTS and uses the
control event helpers, which fixes the SUBSCRIBE_EVENT failure. I can
send it on top of your series, or you can fold it in, as you prefer.

[1] https://patchwork.libcamera.org/project/libcamera/list/?series=6330

Thanks,
Afonso
