Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695781;
	b=o+J1Zt5Cj8ZPmQ6SuAuLgSl8x4Vp+nyEocJ89VwbPlK/ySx78hVWD/GWnH5KlxZiuNBO
	 7MZhXeN251NTaup5KjseYGs+H8heRNz8DFq6hbDc/pmp3cupEHsHJTc9/ZJEL2GcNsS/Y
	 5S/X4auYS1bYJiUD7mvRT51t88ql/lQTunKbgnjr3gi2y1Kpce06yY1ZDaF7lA6PhyW5K
	 3w2XRz5rmpE1qprfb5pS31upKmsWnngyTAOIRgE9tid3/mtJRjYRQyTYj6f7NeTWcAREv
	 1mv8/lXHOGWk3uM6iplfpZ5Jx/XnQrl4CdB0L/VGLRxZAmFQRrPY4m5ByoLVoxssb4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
	b=OxlKLk2AHQJmdxJUIDfD4ea+ImsO/DzZnXggCFn51vH4fhcOrHAjLap/x4gKsObRqBPt
	 o5xulZBijH6Uu2JXuh5uymO2o0+b4XYd3wp6B7bOIghgk/hK0yAsenDPKokWcGdzfZpOr
	 gbG5rqnjVp6kVXwbnSpGF6x6LBSkdOm+BMAxm7lhCMOU593ejc3jzMolp7qu8V+XHQRMD
	 Qc688JW+KVoPayCpV+U3H3dTaIsoHts4h2e79IaRsIz7dFHZzXibmbb7JnR/gHR1TTbXe
	 rXa0xVt6ADpbo0+9FSddlJvFqU8g1ZE8lYD5Ohv7g5BIJc2O5EpFCZTJYPbbhIM5B3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pOy4fl+G;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1351606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1351606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pOy4fl+G
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so251851fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695779; x=1793300579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=pOy4fl+GwyLeJIvuh+b19PgJ+11CKlDAZMUngTCak1eNqiD73w1IUxrzXw2NJ7ktR7
         kGzyAxFJqunyhejXwZj5yQlrPtDWBJTy6CpcnfbAyitA/tzFD0UzbDVXUxFNg56SXlbY
         S6adHHOhX9jTxjU0lBpDW83y9fMcU/ciKxYbx+YA7MqVSME17adBXo0ajDmtJFSke72W
         jaxQNnYE/CnPJzdh2NZZGkj19qkG+CrzCbjZyEdzbm6qumi9EMyv9p/0spzpFrxj+4/x
         AhjG2bB511fctWPNUaoZEFx77SOXnie3yF8L+xsdf+MzxgKbY8bazpDXmzqRB6s8e5xC
         XUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695779; x=1793300579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=Im5gwuBxzkl/t10HOkSb+bDmTAY9pNWdCTiTHo6H7uKN/oRPCsawJD1q9u/KSGwu9r
         l+4v0ho1HNT7lV8DJOzNRsIucqE2YT8y2PVNPeS/1/JKA6V6NB0FbOCaHvjhAP8HTxR/
         eD/Xzwj/0OiiAGHOXhYbAyGZnglw5lIML80202kbNd3sSRUKclAyOQXHHzJdUyv4zWIk
         AChjsmZkL5f1VrJ/91Pc8oKcXQqKSC2bf1zu2REggrxRDd1goFuCJxJI4w7IXZfdyQMW
         eaj1cZK5Jr3uuIhZPP/4mIGQvrcmMny2ykz7fgWF1OxsLRIFZd4fhwt/Car+nf0YE1uN
         O+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwj471mm2RMRHrIfvJCKfLNcPoXx6lF60354mn2yScpFjQEOARCqJZs8YOWvQRPKN6Vpp9hGNpaJOQaM24=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrqAFC/npPHFsiWHJE68v87rNG7QagGPsbkt5pO1WaKRxFSo0/
	jL+/k9OSzqxaX7YqZdiR6kqgkEwCIDbcdOESK74v4qkm7Zi3uswvz2a6
X-Gm-Gg: AYBFou0Mi6EM553K2XCuNvhi6Iv4Itrn4dutIYsToPwfepMCZXx4gpK2dfu1WBb8PpU
	PDGOT+8Tzw1cCGaJRY135B0h2jwsihz23Fs38R06+u0maoysgPY7mGRGVU2RDrso6qdO/k3o6Br
	ozc1Y9jkZ0b4LRJRdKLFQ7xZjvfMjXv3u7gBFeeeMq7qxZSAWT/BnNZfxQy+KnmsaSM84H5OaDv
	eIcyimtB9entk26+v3IH5FcvOiN7yIcv1fRUWuK076EDBcxfgmdTmphZClV9eQE6P1FUMBcxdv4
	U4fbwCHagKJXwKrhHbcW9SSLADm3EOyuRz75Mu2N35iKSDPRHlmRkXo3ghyGvRxVX9nNvkJN+xa
	KlVNoQTakJECxHbujWM46WnGJqHYuhHiB5Td7xKiw+9FFIlc45wZBg6bYUG6HObyqgVXUYKaojM
	mULlVyiWoFqgu6GG2E53ld3NCzaeDBDUnsuy7DqRMrW+7XjDQzjUe55BFeEOO1hjAJxQVfH1Vi7
	E6ObZl9auhnOEs8qoAPzwCYGhFwaorHE74QnMDFZt2gUSVGJ3DuhGHm1Loy7kTITuTaZ9xfqk3v
	BaJt4hOu5Xy/syyF++NGmNX2LQZ7lqLtgeAXV9g=
X-Received: by 2002:a2e:a54c:0:b0:3ab:28cd:f612 with SMTP id 38308e7fff4ca-3ac4409fd78mr17450261fa.1.1792695778803;
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3ac65cff1e0sm99901fa.20.2026.10.22.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:01:15 +0300
Message-ID: <20261022190203.1998156-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
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

Hi,

I managed to run this patch series on a Sipeed Lichee RV Dock (Allwinner D1),
in this setup:

  - FreeRTOS on the HiFi4 DSP, running a task that contends for the lock
  - a test kernel module touching the same shared memory, with and without
    taking the lock

The series is applied on top of v7.3-rc7.

What I ran:

  - probe: 3005000.hwlock binds and the driver reports 32 locks

  - mutual exclusion: lock 0, taken alternately by the C906 and the HiFi4.
    Each side added 1 to a shared counter under the lock, 1,000,000 times:

      counter=2000000 expected=2000000 -> EXACT
      tripwire linux=0 dsp=0 -> no overlap

    A tripwire field is set while inside the critical section and read by the
    other side, so overlap is caught independently of the counter.

  - negative control, identical loop with the lock not taken:

      counter=1885761 expected=2000000 -> LOST UPDATES   (5.7% lost)
      tripwire linux=100302 dsp=674915 -> OVERLAP DETECTED

The loss rate in the negative control varies between runs (5-19% observed);
the log linked below is one sample.

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>

I put this test setup together with AI assistance. Sources, build
instructions, ready-to-use images (DSP firmware included) for the RV Dock
and for the Nezha (untested), and the captured console logs are here:

  https://github.com/ikruusa/d1-hwspinlock-test

Greetings,
Indrek
