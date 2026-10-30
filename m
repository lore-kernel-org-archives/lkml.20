Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362360;
	b=kJBopHjNaxCAhJ9zEJ9PJIK42njN6RW7KAGYb6msI/jzMxFv8SJDsJdBdePUYQeg9exy
	 SiHMcQD5SsPE9CrD6tmnHkh32UvdV8dWuIf9yUtEy7vncninwWo72jQ3lD7DaiKe8aLQV
	 Kosq2NSAQ01ufCm7ohwS1pVUENXJrCFkT5dPTCeTEfFiu7FW4nkvFSJmgu2+U2gZp6NrL
	 Rzr41PpDMk7lYVzSnsyLDDcAu1vgetMylcjV+4XaXm78leKXL8WBW5lDBzK94FlmkWqRN
	 JQEYSzub46XmDsS1Wr95e+3AGewyqK31hpz8LZBvfaEfNbBX6AhLHkIOXhmw7NCK1Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=blStJ9NcJ/yNIOMWMmBskzYwxQkjL0hla7YFVzt7Pqw=;
	b=WTcx3+RhSv8mNv3yHKSz45ztlwy4TjZvB41QUGQpolL0lgjStVULHaSMAOnW1eIHuL0a
	 i3UUpu9JUQ99Sbf8dkGa2OUGKWRplyXWs+LZywr9aS+RsRD0BwybepC5BU11gtiTiqqlu
	 xFL40qpdZZLd5ceSwezKe8C+OTal13tPatfFyYQJNmB96G6aOq+JfnCLl5PIhcNZS1xGQ
	 tYllSyozxWawHVe1UY782MrVgnYt0266gmvhYWviPHyGId4tu8bTwckaQEBciB5X7/WVL
	 mlvzrPT6OG+s22a5aH1ShcPQud+Z4sLDEvDjNQiNYbhyPm+j5n+Hq/8AgU5UYL4ZU7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJ6uHEWh;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482EA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 482EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJ6uHEWh
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-363cd582f45so57439eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793362359; x=1793967159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blStJ9NcJ/yNIOMWMmBskzYwxQkjL0hla7YFVzt7Pqw=;
        b=zJ6uHEWha1vPUwcHqbKqPCxHte/ObjdO995ZbPCDkwRchaK6DFWTPIPoSA7YdhzdkG
         Xf47necqRc2kBuvlOo6aZAbK2gQXtzmWhc+ecfdNDTg2tw7xrh2an+XtowIrDKx876iV
         AAQcBQWj1S6Se5J1eGWwCPQ9mhBGMFhLBJi5AvNM0XkynZiya5kQ+XSesy3GWMMkWeeO
         stN48kNxeAT+CFwGgtr2A+Ps1NYQaiTU9K//6S1PMcNl3nH7WZ1nm5rx9nP90fodVBsB
         GohM8c4sjHr01EwH8WVdn//32EiKQ4vBMIv3A3Tvwc+3a2nPdBulZmjZO8dUkcPKU3TH
         q+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362359; x=1793967159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=blStJ9NcJ/yNIOMWMmBskzYwxQkjL0hla7YFVzt7Pqw=;
        b=KtezcNsU1yng59NitHiT91xU6oo0txUhKtlqFhBE9/qXbq0U2LFkMqhBRm1LuJawIN
         P8K7oFbrP53AlmBLo+5slXx54CYR+gy6v0vHGeTJq6FFpgEGjTCfEu89wGLDxWAY69fj
         kBj4To3+q8Ja1uljxbZG/WEH5pfQTV8remj4989T0aM6LAnhK6PHdweDsYI5ZKByPfIz
         1JPK5vTvuxW4IAAl4I/Dp1oQHvrFFpVc3Sxf7vskIGnSvxUzrSvM1mw9P9qQuniO3X+9
         JZCobKkcMVW1wab7x42l3tp/2Fi8aOcTy+P8qKWVsBIK838bMtFn7K7EPXeyCVwXC/7b
         Mf1g==
X-Forwarded-Encrypted: i=1; AKwUvBwiwxczV4AMUaR+mq5dY+aYUBordqMOMgYkJdKGYu8Uc3tjfuS77OspMqsPfbIDZ3N31dmF3dioZGbCc3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNJElx3IdyHr3gVCW9USClSmiP6NBdE4+EbfAeSz8gpY05Biin
	Fqse3cal8l20yHl0sTZNo2u9JVDwHpz3Xa1oSM8Vz/IQaARrw8erg3WX
X-Gm-Gg: AYBFou0cIEOpcK62YnLdeaedjEoz4OB4b8xkS7+BYBYn2UL/7lB3W5xf74bkUfR0/eJ
	4Ie6u3LrihbgMCS3zmAdUCTCUgby4k6dJwQSHxQxcVo56ufMfHqrU+dKJKr2IPczqFgqHjZljcV
	/Jl5EjawbSqj7ASjPfgIneyT17uYJXJpAHlgAkVhneq3SE8f/zrg8KexSOY4g9lLdHNyZKyJnUW
	UtAzXZBZHtjPVmgi/FZoBFJH+bXPqFdKiIjSsLGcKgtAPR6WcYXIlP05N+FJ8YP1MSZqWF/Eo7P
	hZuaNXEQjEXaOJG4nhV0PXz+dGmswm3CTCIVfI2/w77ssnfNZkdqBH+MR+p5VImJxv/D/wCnAJB
	bus5+dAM+dCSVu6JIgN1eif0UykyEWDVFKc2Q4d+aOuO6O9hpP2BYMGNq14PqtKSLlvd8qRrKY3
	ATVWdyI/wjoiIEYkm24eNcYhBiPLRJJfY4IzWdyryWlHJn4sXEou0d282cIQG0plqSYmVtzsfCO
	TPuDvfRYcnF+xzd0Z8AZw3DCh7kDGCtQOMzG9Y4harQ13JxEKB56gpNUv2xP7z/eq8cU9xIyo2d
	eneJjO+GJXMNapxvNYX/jDgkRldCHGj7C3hRp5rStbJ8mArTPS263XM9OnzZItyCdqR+2JJ2k0N
	OgfoZTdEes/e/Jz5P/pPZGSwsuR9BTo+G3Ah4MSyQw3+5kYKs9b0GUiqSMzVPYIm06cWETTRWYC
	MC3q0k+i0pQPIfOviXb8ClTuTaALvdWDrSwc08zDoo
X-Received: by 2002:a05:693c:8099:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-36a42236aa1mr4832510eec.2.1793362359267;
        Fri, 30 Oct 2026 05:12:39 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm8144599eec.29.2026.10.30.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:12:38 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] media: i2c: ov7251: Add strobe output enable control
Date: Fri, 30 Oct 2026 21:12:35 +0900
Message-ID: <20261030121235.2163478-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-9-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-9-antoine.pichot@gmail.com>
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

Hi,

On Tue, Oct 28, 2026, Antoine Pichot wrote:
> Alternate frames is what the Windows driver uses for face recognition
> on this hardware: its 30 and 60 fps modes write 0xaa, and a register
> dump taken during a Windows Hello sign-in on a Surface Book 2 shows the
> same. Lighting every frame (0xff, which two of its other modes use)
> would double the average emitter power. User space tells lit frames
> from dark ones by their brightness; V4L2 has no per-frame illumination
> flag yet.

Before I send v3, could you please say which of these two you prefer?

V4L2_CID_FLASH_STROBE_OE is a boolean: it turns the strobe pin on or
off. Two sensor settings then shape the signal: how long the pulse
lasts within a frame (the span, which this driver ties to the
exposure), and which frames get a pulse at all (the pattern, one bit
per frame over eight frames). V4L2 has no control for the pattern.
ov9282 writes 0xff in its common register table, a pulse on every
frame; this patch writes 0xaa, a pulse on alternate frames. Both chips
default to 0xa5, four frames in eight, so a driver has to pick one.

- when the control is on, pulse alternate frames, as in this patch;
- when the control is on, pulse every frame, like ov9282, and add a
  menu control "Strobe Frame Pattern" with "Every frame" and
  "Alternate frames", after the infrared torch mode of the Windows
  camera API (off, always on, alternating frame illumination).

Either way the pattern is one register write.

Thanks,
Antoine
