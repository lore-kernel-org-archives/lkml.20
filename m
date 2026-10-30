Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370402;
	b=Et1Lh15B1VOZx3FkB98TWMQsypE5BG5+dxb0IkVtgY1UB3jSEbyMgTZhwBz5ocCFaGFM
	 2rjSsgdgLsPdEtZOChOrTQQ5nEk2F/JfVGxws/Gf/sVyS8l+foOYTR/Y4jMdvXTgpDewf
	 mrFS+pgNKTUfzd6qwSUwl11BN5b0uAzsP46iTY5yAzVgbvIFM9VMcaEK6HeZBdVQpssLF
	 F9zBPLZC49d8vReBrtXOWKM4ClmOwy+uxPM5Q9k6BWgl616CS/FB7MRrvBr4MdOUD/sEu
	 ord7gX6bXAGnZfOp2Lam0C0RXxWObaUxDQ/DO2wKee0wBpkC7J8VHagh/4+10lJ5p0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SDmf0bD59MTl7PVD0AQu0SZMcBGjQbDBkS5Zjka31Fk=;
	b=cqa/w+DvPSHS2aeIrtH19OLx1Fezk4z8j7b2So7YxrE3Rc2gO3BioYPvIGvk0dc/xz4P
	 EjtAPaQD+xCsL3655gN+jF6VF5OhsFpMvNRjYaKc/ApIRqv7iW2H2gbsiTsw2xoS4L0u5
	 uXlkAr3Ls442t6q80BZBV7Jua0hLlTswQlRtIcRqM39cb6jt+pQ5DP3C1DZVBlswBf5N7
	 M7m2EIMI1Wlnweqr1Wb9V+llcbonW2c5BgSUp+hZYpvUZG3ODdvjw38XtwKNoQmdQZ08p
	 acS0LQFYfUsXz/rid75Ml/U228LVn7PnQ1eETLEYysGoKTYa1XpBhzGtXoldXWsOBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgxr2fHl;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB83C60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB83C60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgxr2fHl
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-369fc2e984fso86615eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370401; x=1793975201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDmf0bD59MTl7PVD0AQu0SZMcBGjQbDBkS5Zjka31Fk=;
        b=sgxr2fHlj6L9jnqsYKE/4b+pQffw+apKKPsW40QRwSk+PodX0YKrdGymqq+y7GWim6
         /P3cLyvGol7JBdFoQicb3KP6oXmLNlpbPTdUiGUwiyrL9R9fljU+pIncY6YzgB6DwYSp
         yDPh3DpCO5POSX6na8v0M4ABbaao4/7jl626ozIlbX0rHVfqgHnX5nRGCQoHsybDLJyM
         bI2rAQSENIEllhuAqmycbvBtA7UZx6Pkzzt2AyPh2ZFe/zzVnaYI1l3ZEUupkW9T7S8D
         m8WVHdB8shJGdEMnoB7PpHOiZNTilYEhaJ3i5tm5s55SFMn1HOC+FlWyY/IxRqjE5bZ3
         5Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370401; x=1793975201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDmf0bD59MTl7PVD0AQu0SZMcBGjQbDBkS5Zjka31Fk=;
        b=RQ+IavDF8N16F7AkZF8hc8s5sY6FXx022GI5Aduo4blLKvvIbOVmYtZdAkztuai+dm
         hKe5fzodAhf0USGkgOMvz3cqk/kSRQas9pTBfJH8fjBtatUEHDOQM5A0JpUAHUS6pVV/
         SuS8+ZQZFNmp63eyLn0Z5xWOv8r75dol4hq5hQJlrh9T1z9lWX8VM3An9pp2h+/9BgT0
         +966x37/4OHogNHvB8ZeUPWsH71NbwqLJT4drj+fidEP0x3AZvvHVZmIAs+DwHGLlK/A
         HlOIc2sOyDoq68SIKqKxf/fNhYf68kQ7t/GaMK+azj1K9CEVzCZU54hXIIS3R3QrTByn
         JQag==
X-Forwarded-Encrypted: i=1; AKwUvBwnBHc0G2PgrvbvP4e2Mr4/tcVJbFss/tdcH3B9kqKTQed/L0cfJ5h/un1iASA0sbpKtMqZfZb5MEGO3EQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKS2qwX1Rvi5n3fd1zLYnRtOEceJ2XcFgwcNG5a+gW5/dIkdhX
	lkaAKH504G6eyZq7NXvuXQfSyop1Xuu+vMHqov9i7FqSMfdYcYIjYNHqUBUZX8LaDfk=
X-Gm-Gg: AYBFou0vCAKSNHFO2vYtShmKniOzJkpNmw+NTBbjdDG/rfMvomGxOH9fExQybwOzNwn
	BpQ8W32aA1hnaB4UEq9u0GwAJK9gQzB4b+AKLO/AXiTOjRQtmhX2xpRrx7MyABYk51NyzLMh/Uw
	eQx47TMDoXFLfGkYaSiumWtrjDIk97V3Dgog2oSYTaS7/+3PgFv0EHxt2gIqcIXBBGyjX1DaHuW
	tW+Hr7T73VP21C4zm8nGQnOpeIJ6lybXFglL42WChl2F00LE+uuDAAlSXugYnq7BkvStvqTSnCy
	A+iM/edkZeUCNp5tfx/6r/bLOUmOJVEnM8ez54wdUAC6TQLB2PWX3N/ooLsPBsvbxOwR+DS1WCP
	WtoJoBmcYeZJg6dUL+cnmHoUcqkozd5S9aPRZIWR1nOKGzlVxt09x3h61N+k1ph0LAUhGD7icgD
	slAit7WsM4K+NHfKtkVGGBpBZVnkX7EZ8WhMLl2bHOLFJ60A2ulIvJqPkZd/hBXTh6EzzP5UVOx
	+gHZBlaGVFN3IGlIye48ms4dDJXlqqIga+yqGoxdzBOVmHEgwi1gEd9Ix1rqR7InQiyvQ4casfs
	tSNrCMUmmEVrmWTChrHclQ8F7Rte32Nbcl6WvEK2BZl03Iijs87tftlj/iPT7uhnIJ6Jmv3b5xi
	3sxaNKkUsZ5yg0njgdm3cengOfoP/s+REJWvMYkDFaaJ4VCyliNRejaH7nsUq40xOtZx+dQzqTc
	EEkG80+EUsSqXByUmY1vI=
X-Received: by 2002:a05:693c:6304:b0:369:289a:d31a with SMTP id 5a478bee46e88-36a42059799mr5674818eec.0.1793370400963;
        Fri, 30 Oct 2026 07:26:40 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm9399910eec.23.2026.10.30.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:26:40 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] media: i2c: ov7251: Use sub-device active state
Date: Fri, 30 Oct 2026 23:26:37 +0900
Message-ID: <20261030142637.2235350-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auNSB_yCjo8KVGJF@ashevche-desk.local>
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-6-antoine.pichot@gmail.com> <auNSB_yCjo8KVGJF@ashevche-desk.local>
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

Hi Andy,

On Thu, Oct 29, 2026 at 04:02:47PM +0200, Andy Shevchenko wrote:
> I'm wondering if v4l2 provides the set of conditional guards and hence
> some kind of ACQUIRE() macro.

Not today. Nothing under include/media or drivers/media defines a
guard class (no DEFINE_GUARD, DEFINE_CLASS, DEFINE_LOCK_GUARD or
DEFINE_FREE), and the state lock is unconditional:
v4l2_subdev_lock_state() is a plain mutex_lock(), so ACQUIRE_ERR()
would have nothing to report.

A guard class could be added: Tomi proposed one in September 2024
[1]; Laurent preferred a __free() annotation and the series stalled.
I would rather not add it in this series. The explicit pair is what
imx290, imx415, ov2740 and ov8858 do in s_stream, and what Sakari
asked to keep in the ov5647 conversion last December [2] until the
driver moves to .enable_streams() and .disable_streams(), after which
the core takes the state lock itself and the pairs go away.

[1] https://lore.kernel.org/linux-media/20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com/
[2] https://lore.kernel.org/linux-media/aVLOlkqSHn-N5Wi0@kekkonen.localdomain/

Thanks,
Antoine
