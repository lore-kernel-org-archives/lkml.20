Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028843;
	b=UPlCBQ9+Fo2cCv6zWMPkA9PH1xhJIJqIKcfsu7qhp7sffLdlkEn5Z3hSUnIhQLvOt0nI
	 2u7DOFyVD5CN1y0Nhh/ggRgI/b88oAchz3NXrjbRW4xvk0ibF3BXEwrHyzrhrhAwYPd8q
	 h7CoL8DCddaHXrdE9V1k7l/nolmRACUqPrwAVAPK0CddB/zTeeNqicDo5C2aNtX1N1z3e
	 /64HHqPkecTsTFqSsyDiUl9saXuX9yePU8/ze5WYB74X8741BArpn5m7FXn4z31oq9O6X
	 VhgqCCg+lto0pWxRHxbf11prrE51dmRUBHLmZlegJ6WGQdnftd1yuYD/0X+Lz7qVC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=v9Tdiy9REOY1qeQxFjltXsTnBPcqZlFKUcohy8cjEnM=;
	b=fCePR1s7WM1Y+YyrFOq4mOihb9X+L16GV/QriSN/Y1yizbBPDOHkLMluUrXVZE/9Q2iV
	 gYFJFj555eOh0+9Wjdojc5543gFnVqsT6p+MRY4M1fHWuBfJy2JI1saBbb5R9XUlalKU7
	 fjAWzbNKjH7yaS6AXWhmc9uhRkjA5kdErLSXn7IBXaFmuxHIUueYyLAgP0OwdjwKTexrP
	 PaqXYeTLIA1UayvEHS4GREqWLGmVGtYqmdACTV2//QrnFm0g0NKy/jahKkTFATe/RvDT3
	 z8dsndHDI++85kEQAYZ2tA1Zk5bCBeQt5Y/fIRUecknBRp7QYnTHPtLkACYzvGyebXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYqPScO4;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B050606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B050606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYqPScO4
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f55a53898cso683650b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028842; x=1794633642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v9Tdiy9REOY1qeQxFjltXsTnBPcqZlFKUcohy8cjEnM=;
        b=RYqPScO4cPEx58XXCs4YMXEPGQK7K8qQCGw7XZ4hIAPE0vYmKl92KnhNEpUcjjpbW7
         ZkcOiBMpMJIA4VaXLIz2W+WxEd6DMYzcakRcTCNvNv48Ew0SXSUJuHheAPaZneAT2SGL
         Neu5xBe8h/vDWgH5l9jtvg+WDYHg60WICe+/pc8soaicovEiTsfL9xw4BwTDch3J7n6W
         dEcGKk0xMsO4oS3LoE/rKPhARjU5MDGwL2uzd0sfjISfZD+k6CrovN3VkVJdgP57YJij
         tKHRCow3DEtoO07ilW57X8US4swAPkbAjzUWfq3dReQaN0aMu8RbtWNHhncKSkVkIvz8
         dygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028842; x=1794633642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9Tdiy9REOY1qeQxFjltXsTnBPcqZlFKUcohy8cjEnM=;
        b=KDi3V2RYmTIF7Z62DN2OsZE7lV4BJ99YbjWT6jQFYDrwfgv3OdMPbOUQ6Bv5N2jVmD
         mBrrFJJrEpn9igwYTsquSrZwyIT+hg6dlS0Nt6hRJTIfOI08pH1izdF7UrhzNoYv3BL2
         xWRgySSYyJdYjIJmQ3OSENs+r47XekJSEgUVA0R7ui1loxHFZWIcwKu89lnnaH0UwIzc
         s1uxmhCJPLx71+3KrexfmhEH/XTmAMeSoieEO/yOyXdbTyqFs05qewAOsac/ckECcryy
         nSeZSnwWwzKRK9F8tXrKyboRABEOSRsDmRqkFDsIMj895ng4L0m7EXcBa9amxVDSEhv/
         FrjQ==
X-Forwarded-Encrypted: i=1; AKwUvByoBhP7ZgFJovyzUkZYrQlg//NDuqQng4aNDO1xT30glkTkCIErFeEIyAUYKkF1uf5f/qUNASmSiEzJoFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bWyLqlS2EvyUvUF+MhVnuj6JD8MmOrPvQ81PPLzrgs41q+vd1
	Dnkr0n2VFwALXrhiu0qAewaPls+oKWPAStLYmpBbL8YwrVVUGkLCIAv5
X-Gm-Gg: AYBFou3KBUKKQpi/PHJWZMtxubzrFSBxgaCovi9EvpssXOKLdyfJcyKQENEmo8z3c2j
	8e5KRBm/YM8DO1YTQKFvv/otA+R3n05poL3foWbFXFBUeZADReqwD6eOV3DJMGECSxxr+T0UuwF
	uq/5k296JGG+4gmkc1h7uuiFEyrxrY2T8R3cdPHWYjUPAlwWkqGpRg2eNK47I+DX2/AR96Q+bgq
	/5jP7JdJKYWh2rRKdcSQk1oBx/XfyHozv5r97lO5umPVoLLhABzEGLCMbpkPb00YntR7s4Vvsfr
	L/R9YWDXH/kGtYE/GGn7XtOJquvSsI1yWM0Qez6X/+HUWFUZ83ePeb3ixV+S053sDYFQViLa23a
	x5IwHBW8uUzmvxLJegmz5qXbGDLtXRgbc5TIAsUnwYdxX7KoRaz5BSy8NjdsoFp0b7kkXoGP+HR
	2KewPd901tsm/nUi7MsHYTYJK3R9v6giP8vKRRSEiC0ysxGw91zfysF7yvRqes9Nv2798pyVgMZ
	M2mgyOnm57+DEBHgOkU6miY+OrXDwMabMTyHvtJx1ehIsd47MNr7gTQFLsLfkVeSp44vOZBMR1+
	XFFC584pgx2cO7dYc8eEybP36EZni2cAgmFa8slBGqNSSY7DbYj+u0tvpAYttHO/5mXYhkcWoPr
	gNfHDdaqkTqO6xd4DI2+pku0imkdlEOKT8T0XH7aNZ69oYQI6dvupbduiQKpWirryElGio4AE0l
	lOKaFLAUfXdvA/XuZ1hZELL3betXvJTebavsWWvsUpA9c/AuB3iK4D
X-Received: by 2002:a05:6808:10d3:b0:4f5:d873:aaaf with SMTP id 5614622812f47-567e1440dfbmr4090440b6e.14.1794028842361;
        Fri, 06 Nov 2026 21:20:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtdchar: keep data and OOB aligned across ioctl chunks
Date: Fri, 06 Nov 2026 22:20:38 -0700
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QrCMAxFf2Xk2WA7IYi/Ij60XVyjrI62G8LYv
 5u6hzyc5ObcDQpn4QK3boPMqxT5JAV76iBEl0ZGGZShNz1ZawjL4iepONVB7xlnp5EQl/SWNOJ
 qkehKF/LGcxhALXPmp3z/DffHwap4cahN2xLeFUafXQqxrdR8bnN87fsPjK4B3KMAAAA=
X-Change-ID: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

MEMREAD and MEMWRITE split requests into bounded data and OOB buffers.
Their chunk lengths and flash-address updates must keep both streams
associated with the same pages.

An intermediate read can consume OOB from pages beyond its data chunk.
OOB-only requests do not advance the flash address between chunks, while
a buffer ending within a page's OOB can leave the next operation starting
at the wrong page. When the OOB buffer is the limiting factor, the data
chunk must stop at the same page boundary.

The OOB-limited case was found while testing a proposed BootROM-format
MTD view with 1024 data bytes and 1152 OOB bytes per page. A 64-page
request has 65536 data bytes and 73728 OOB bytes, but the original
65536-byte buffer limit lets the first operation consume all the data
while transferring only part of the OOB.

First simplify the page-capacity calculation, then bound OOB in
intermediate reads to their data pages. Finally keep non-final OOB chunks
page-aligned, limit their accompanying data and advance OOB-only requests
by the pages transferred.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (3):
      mtdchar: calculate OOB capacity from the starting column
      mtdchar: bound OOB reads to the data in intermediate chunks
      mtdchar: keep OOB chunks aligned with their data pages

 drivers/mtd/mtdchar.c | 65 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 11 deletions(-)
---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

