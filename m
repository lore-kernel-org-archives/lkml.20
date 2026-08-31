Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460653E49C0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176406; cv=none; b=izGX6MzKzh2xybrdxt2XTbCv7wV9i2W6hwciCwp33Ll4n18V3UXn0yeqwUXWTQva6pyL61RAMEKGsk7PN+UaGg69Nk/sqdYs/D8Ow+8vcb4h33Qw+g6SYTkOMlOEPqiDqjzMlGC0vBOdMmQI9Y28s35ovPgLY+Md3ond4MOFXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176406; c=relaxed/simple;
	bh=Hr0YOyO9CYqwLt+yylogqPVMOibx6p4QI/tJf7xOxK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5ZUdPIfxhcdAdQIuyXJS2jDyEKK45dXyNVa9LSwvIWkjDI1UGdW5nhu6qGn0IuNW/Xf2wqya/ZVFhm1pU0Gj9jim9cfuC+43kGNwQQLT4v1AtBWroPMXy2iFMgpXGkei2k9f32jAsrKajgNJu2BNhHWtLeLUCVbaGEIp+XJOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob/Fc1sK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob/Fc1sK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e4998d28so2322708f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176403; x=1788781203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr0YOyO9CYqwLt+yylogqPVMOibx6p4QI/tJf7xOxK4=;
        b=Ob/Fc1sKUgEJdb3RGc7rU0tbPKZ9g7ZSKUYbraAGNq7J2tDABtC+0XQg/1wZcKA7ON
         UjSUnUKirNIJtcIAGYggmcTnu8l/UTrxHEquXw2vLDE9hHaQs4ZNFAQiaHSwaLUN4BRE
         bLa8duZOIkKWsIXSKHmxkloaB4FyeHkc1tKJ4uh7elmoI7LEcKrAh8kSTQCFfcr1kaAJ
         2RrGY8SFWQokQ/6nl92caBdIaIomkMHMAx7cpTxrEfsW+YiEcw+MX1avsF9XX7sedHH9
         oc019h7WajyGnpsbJo8FZ3GyLS19b0iQeTS7vq+ul8miK8AVUjiOuo8jEej7HHU7x0Nu
         SgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176403; x=1788781203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr0YOyO9CYqwLt+yylogqPVMOibx6p4QI/tJf7xOxK4=;
        b=Q3lwHfF8OFWqgXL+pm2e8Mkn2plqaQNKPeYrv7y+fRBkcW2H3SU/AnB1vbVUwgZnx2
         ZVcIEtKgFebVrL1QoTF5fVvdhYjgP3zX89/1xBTdJgjoflhWG6SAlz1h30bmH3f0RUOj
         EQNlWRSMhAJFkJMjs3gezFzxZw182BE33Q/UBu5IPhoEIxpZgSQ+Z79P5AmiUL2jkt+M
         mZkxfHK1dVzyVnqZwuqNW2SsQGObv/coZXvrwK9fF9zhlbnK+o8aN8Pss1ou8ScfIZ7y
         wfUjV44NV3Oy2vtdGCu0ZoIT+s4JlQ4nJjSj4vfDzhfj3YfyWQH1CH2I+WEQ2jm+zbo4
         jbfA==
X-Forwarded-Encrypted: i=1; AKwUvBxHJFTbQerljZcqoeJ19D+p/U/s4igq9UCDVX1P4Bm+DNjAdeouDx7dT+2EyOfhph8V3/KeB1IsXuBHHW8=@vger.kernel.org
X-Gm-Message-State: AFuF++l+1l7lXkyFal3MvLX3ttr3mYe9nliOgGEyYSStij7BpFjEQT/0
	Tk0keqp4TiN0C0YkMv494FRfT7eKSpioY52YRhQWt2VPh08AF2Rzot6j
X-Gm-Gg: AYBFou21WJ7dY8RKolz7nmmEz36aL6BBrFlglBs2fXpsy0OTbzynbjbJzVCG+oVsPo5
	SRFIqDKmEVydSkgyu33VtppQS/MmIj4KnOlDi/2Z67jB2WzZJBrtJ5xPPnrtCJ3YmcjQyPpQ3Ki
	JYprNpD6Adw4Au9FRePSakEkV4+tWs4CPUs38y0byEwKKEmmYu13wrIcY1tA7rlUVNyMUnG3oBy
	mkiiSXDE66xFk0oXD+pSx1GLei60lFblhr4Nebvm7pdERlN+8yDikexOMGvV/+/uFR3TsQhS8nt
	i8tknX+3n6lIQkVGkaC/k7HBwDAYkLp/JtemGgzni5BY1b9DZCKJBZlqGsvemLOb7ilUKAYL5sS
	10czlhF+ACwvkiSezhp/hRr6M6ySY+MKNhxRcviYRgupFd1iQnvgs2s8JIdnHCeYTCOXR53B3x4
	RYn2chCQXDqyEakdvXSnJYgrW0WvPdQaNpZ1EypXf3s2FYsXmzn7DDpNAl7ew1nnugckI=
X-Received: by 2002:a05:6000:2582:b0:482:c676:8d04 with SMTP id ffacd0b85a97d-482f79f583fmr36991070f8f.18.1788176403240;
        Mon, 31 Aug 2026 04:40:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm11201044f8f.37.2026.08.31.04.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:40:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Mon, 31 Aug 2026 13:39:59 +0200
Message-ID: <20260831114000.1844796-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87v78qbtqz.fsf@bootlin.com>
References: <20260828085337.3916199-2-mehmet.fide@gmail.com> <87v78qbtqz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miquel,

thanks for the review.

> Since it is a total rewrite of the former approach, this is probably a
> good candidate for a Suggested-by.

Of course, I will add your Suggested-by in v3.

> > +/* The controller transfers 64 spare bytes; larger OOBs keep using
> > the first 64 */
>
> Is it a real controller constraint? Or is this a compatibility fix only?
> If this is a real constraint, you can keep the comment, otherwise I
> would drop it.

Compatibility only, so I will drop it. The SRAM row buffer takes up to
248 spare bytes and the ECC engine computes parity for whatever length
is transferred - that is exactly how the bug bites, the parity moves
with the transfer size. The 64 is the on-flash format that U-Boot's
copy of this driver and the kernels before a7ab085d7c16 wrote, and the
explanation belongs at the ooblayout, which brings us to your last
point.

> No explicit inline please.

Dropped.

> Please modify this comment to express why we use our own layout here.

Will do. Something along the lines of: the core's large page layout,
computed over the first 64 spare bytes instead of the whole OOB, so the
ECC bytes stay at the offsets the established on-flash format uses,
while mtd->oobsize keeps reporting the chip's real spare size.

Thanks,
Mehmet
