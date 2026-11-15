Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765259;
	b=dZ3ikn8ULRiyGNRZP5K80ADHcI008t+urM4T0/L+qH+kWegGTJNspNyXbIP4qscJrrST
	 MeXUnOLADEAOrEhcbJbJndeeKEkUEZ4LamiYbP0/rFmhwXXhOmqN/UkfsbCa1CgBgETZ9
	 W0GOCWH8BHXXEl15qAIiX9ws1mvrVQQw6mMV+uMbqCMTz+R4sWPiMT07nUswQP1n//cZP
	 BtPYeOMMxu6rThY5CaFbRk8eOyWEAq08VcSLAgEpIQcKaZ3+INkNJ090c2Yi1AKaAeBBq
	 EeTmPQznTyiGidwZxw9u1Qm7hO+4lpVJsAu1RSHv8770ergEf9DrrCEOZeuLdF/hqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WH50qcru4lH7jJgNPK5UULmwPcjOUvxOy1ArP0lmGDk=;
	b=PsuGPO/okCcEK2EeeT72xRdWRHTWgJtNgV1iGwx17Z2/cM24JZ1WA54mHKQsFFQzY57Y
	 AxmjWqaX41RInok+kXldcxt5jTeBckUNsh/DQDVqoGdlqoGgePmGwWrSJBZjjEi3imsmj
	 Iv8UOiWZM+MsuYuYpH1+GzpVlGfLSKMgkalzGeKbdYq5mJ9WH4cMZSuBvq2oO9OlBYobm
	 skbmtM1CWyxSISf+yhmOdeTJVlI6QT2D7jR1+gNYBk4YdyPiQLsIeC+nVSX8E6mDVWHtU
	 bG14Wvjn3xBf5qrLRmgaj4fHuW4b0moNH0ATXm+tb5KL0zf8l4yB3wgijd5Pz1rhxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbA7zYvq;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07903606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07903606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbA7zYvq
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so1251457f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765257; x=1795370057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH50qcru4lH7jJgNPK5UULmwPcjOUvxOy1ArP0lmGDk=;
        b=YbA7zYvq686UdE0NPHvgJcA+JgUYh9MyUp0CrhM6dgQ+w86n+navpOZ8DpLzZHfTYv
         occXG0IHbca6gOxdisdSbqHCdZO16U2QcH8BA+O7ioQqXRFk/a/MHE1AbJNL6xJ8+miJ
         wfNy0bdbOqo12l7YCERwWREgMW+evwNI5wuOGpggIhFh/jl0OCBlHvg79mNbrIMJIIn0
         m7sFswf30FJbNnMBiFralB4hpjeYeQGiUHXyyL7Jzq5l5jPDrbzIrYqEXcK4Oy0rjqet
         vBPChryx55V728F6mMHrnp6s6WrNAn1ehHnLGcZyZBmjCzIYFcgbwF6Rh6WjM38a6h/p
         5H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765257; x=1795370057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH50qcru4lH7jJgNPK5UULmwPcjOUvxOy1ArP0lmGDk=;
        b=DixdybMNIItLYiDcJrMD2+LIWoSRmEaP2IMFHRrJZjTqK9afsc4Ix7Qb/HnAAHysUx
         LEj5vlezPbErLWBouijMH26CxDImYrNQdHZjolv9d4foztY3cBMYgzCom1UY/TUXsXxB
         HeLYaX+CxsVyyoJc/iX3QC/Emp+Cj9Vd3Ev5G4BxurC12T4O9Ecxt0qxNU5FOH89JJef
         tMMZeXhg3Q6B6/hYgmVCsWd0nU5gkzN8Uw7ygUjVWc4m4qaFkYUhm8y6Gi6nVrB6P2lY
         kS5xNd1n/qeW1dexBYtKqwmr90Y1boN0sHdqGfTVtelI7DFZI7fJrstzj3fF/+5nH1wv
         JGZg==
X-Forwarded-Encrypted: i=1; AL+hErEx/XNGaAEqq14gjKhc7xqcgPhRgTwLD1ytWHj6F1EYBXpHohHBIPBckVcqKKahJXaZgj8g9546n8qjc28=@vger.kernel.org
X-Gm-Message-State: APuU4Z+foXMFPWOnWBozl18HWKF+Xfc8R6DoTl7Xq38uV9KSBPHkZJsE
	z3pPXtJK2UqJKMI3hzde6LbHg8NTjqqt1+KOoF5Z2XhoguM1QWSqSMcf
X-Gm-Gg: AYBFou1jvFjOPHV2sWNHRyjX0+K5049Q7oqzoJ7dLT2jAhzmF8qDWUD8mfnrvFc47Ku
	YTk94VQnpb1AiAcA3cUvTnj39mxP0k5oiI/nXbncvdw6GE3TPAzddYHZk7JoOAvd+a1DHd1xA6X
	i8Lj4P+yphWZM9bR4zXoJWLpwIh+5dAA429WnTKJ+aGhXc6tDoA9l1RMnyxua7BU3E2u/xmgsQ2
	itI9/8OHD7arMbFGogEkBm/RolXqdIrODuAMsZEp+6wC8TsxcWa1Usc3SUvd89qyybMvCrRwSIf
	P1JcMbXxeegMQg8ictb3sGPySmrAroyd4cCU4JgfNKE+p/6llN/vMGKdWzmU7BF4QTDyMgWQMjc
	EVI//99+02iZ7l3BjmeYJNm1KAbnoGEO/CiNYEpCXpd1qPeFwrl9VPnxm7rWRvDl9Dk2Zf9M7Q1
	1yhxngj9yG43EP+wurBGffQ02XaPwdcnO9/u3hA6DFITKnQjJq2voOpNmtZJU0pJkSrWP3r4gGS
	vWGr6QAHtsULRrafsCIFanOG+E8ceI+synyFI7sq74XZ48pGE7BJJMUX+XjZbucmLG6nTse86mQ
	bf5FhmdEGX+0HoHVaJswY9heywJGc2ILqwmS2sKoue1S65k=
X-Received: by 2002:a5d:5f91:0:b0:493:d5f0:4e4c with SMTP id ffacd0b85a97d-49c723fc45emr17990491f8f.23.1794765256948;
        Sun, 15 Nov 2026 09:54:16 -0800 (PST)
Received: from firas-surface.home ([2a06:c701:9f9f:6800:4b81:a189:67c3:a27d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d7150529dsm12313385f8f.51.2026.11.15.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:54:16 -0800 (PST)
From: Firas Sharary <firassharary3@gmail.com>
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Sun, 15 Nov 2026 19:53:01 +0200
Message-ID: <20261115175301.8516-1-firassharary3@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

Hi Antoine,

I tested this series on a Microsoft Surface Pro 7+ (IPU6 Tiger Lake,
8086:9a19, sensor INT347E, SKU Surface_Pro_7+_1960).

Setup: all nine patches on top of linux-surface 7.3.4. Patches 1 to 4
applied as they are. For 5 to 9 the only change was the pad operation
signature, since v7.3 does not pass the client info argument yet. The
tree also has "platform/x86: int3472: map the ov7251 power enable GPIO
to "vdda"", without which the sensor does not probe on this machine,
and linux-surface's V4L2_CID_ANALOGUE_GAIN rename.

Results:

- The sensor probes and streams 640x480 Y10 at 30 fps on the 319.2 MHz
  link.
- Raw capture from the ISYS node, ten start/stop cycles of 15 to 20
  frames: every frame arrived, none was pinned at full scale, and the
  receiver logged no CSI-2 error in those runs. I had not run the old
  PLL setting on this machine, so I cannot compare patch 1 with the
  behaviour before it.
- With V4L2_CID_FLASH_STROBE_OE off, every frame sits at the black level
  (mean 16 to 17 of 1023). With it on, frames alternate between that and
  a lit frame (mean roughly 240 to 340 at the default exposure of 504
  and gain 16, with a face about half a metre away). The emitter is off
  whenever the sensor is not streaming.
- Patch 9: the rotation control reads 90, and the frames are upright
  after turning them 90 degrees counter-clockwise.

Face authentication with Howdy works on the lit frames.

Tested-by: Firas Sharary <firassharary3@gmail.com> # Surface Pro 7+

Thanks,
Firas
