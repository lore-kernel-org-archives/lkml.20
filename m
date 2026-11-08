Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142084;
	b=YmgV2TjgYAtCd6s4ApSGcng3mhGnh3+aw7644M7aVWy1N1t6OWc4rGY1hwV12LvEI0D6
	 W+EcrKSWVjF5sZhXJT0rYNXZPfqkXZl4xow/zu8b+x1GdtApVkj1eGw0CllRQTn/FyK6M
	 U/XQx3mvHRSonIiSvrkMGwZtxsI3lYrVMT+2H3aLz4khUPiJJvGhaSsmwYRQ9I5LiyYVC
	 2WFs+A4kgxsDd9gMqahBYtVmvZzCjmvLb6jflYFWPUkkzWwrCKpc2EF9iU1DjErUkO/vO
	 50XZ3tbjj8dq++PRzexPyKQMCrhWNrAfxOYwiccWwAuN3c68P/1JKqVCF1B1zoe9cFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2D/poUrhJr51I0Y86mgG4w0NUbMq+16qzUMFR1+iY44=;
	b=DHCR+u29l6C96tJPu4SkzcuehrRcuFpV63kSMVgs514ry4w1AA+nmn8r9wIdyDCFYAdB
	 +pr1tnCqBrq2gh0FBvNXcEh0NuBhs8H5kXSX3Co6BezKAU1/CXJA+Uexuft92yDklgVBf
	 NOsUPsieH/xB6yWLpZ79NiL25d1UVE+1jFajj9CU7/ATcNWCX3FOhyiI0avJnUqx2aHob
	 eGg5P5J9GWbKowiZow9Fak2/lzUZ/eMnzx8AtlAOtnIUQU1DwEJrO1pR0e9wqlKa0Tpwe
	 WQ6MiS1j4PczzgwGlnMRk/Zff0JkmpN1X/BioTfazUv0BOdWg/xbTqDHisgGNHhvoCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVrtRzOj;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B86606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B86606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVrtRzOj
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b2513decc3so75426c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142083; x=1794746883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2D/poUrhJr51I0Y86mgG4w0NUbMq+16qzUMFR1+iY44=;
        b=QVrtRzOjy6SWobypTM9M+7x7u/LaX3HJiRLNHSgDGN+OREP6jtrG3aaK2j8QZOL6Vw
         MNCcDELrNEIKaCyK117SdD//ebYBQYlpPP4C59gqDthYBzx8n0kraRkMpbXZtnzVtjXh
         +ISvNrkcads5XEDSQit+/SawUYFO5KX7lMqKuWJp4A/QVoYlfqGNPc1P7GV/l1d/oRd+
         HMSfebTSnJBr7G9lS0gWcY6a5QaDNBb5Dj3uNru/KscZQTWBMyw5w7Mp9j7GDu/40itu
         bkVnMqQ4cjCRG60YBbdWqHP67x7jW49VD/dNnpqeLeXObg6XilSKZkeTntL4mKuUQ9y2
         K0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142083; x=1794746883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2D/poUrhJr51I0Y86mgG4w0NUbMq+16qzUMFR1+iY44=;
        b=WVH+IYXSWEC7xljdpJB/8xLKqITEIC+bh7iKELgeXRD2JLb2Q6xTZ1Ds4OcPmfyhdh
         PqHuPyZmwiMaSxHGpcXCeh4Z1t+DeJfLQfk5QX9Ig32YDnPABlyxbGA2l2pcdvzJ+ktT
         0zQgnWi4jUuRFDwUhyCB6Bne86Rg2lAjwMhUE2NsA+zsPlPF8rAo8vhxEt95M1yr/CGU
         x25VO0TVUdbusraRULGUqCCyMGNGHVo9EOKRtnRmG/II6j6k6gDpoQyjYtaB5I63vyUx
         QoeLLIOHyNQg1l5LdRkFPJaFko58VxtX3CYRR3to9SmVxANkbtOjNZVZxOsowgq8fytd
         U2BQ==
X-Gm-Message-State: APuU4Z+BGBYsRSGfjxaD6ZfscE1cnYEae/uIlc5ik3IaOqpPAjJTbsUQ
	PZjhsmbE+5Chli8YvTToR9Ty7aAtgM8f6iP9csmTt6w5S2YfxWXQWx6L
X-Gm-Gg: AYBFou1+CcJuPum87LiK7ZakxOxd1OJdj0mcN84M3p89PUrXNZ9qIlTSX2afc5FWiyk
	N+ZFmOmLviV9DV6RgpK6wsm4v/B05/O/UNmCajqp8zwokqZsLmLRx3aSxDhSqRHyNf21ZfAH85/
	sXjSUiWOXZeLT38V1VMAERwWS0lOajLAc83h2xdBZlpLZtf7zv+q00qDkt3+6DeM207BREj9F/O
	MTdCoaYvDl8SIbnoX1C1EHhV4UCm1Dqm2bZQZuVUK1cF4XWDDaESuX4MzOa2MfkRysQS0Mj4LFZ
	QrSVy0UW5PzxUOOP+GU8YGr3uWmFxmwGlkIUCvhv6V78jATCmDS0EiAEiLgCHK1hBQ+70xtbl7U
	H4sXfR6vnB1/RPGvjtQXdA3onbPT85bcAkiXScVTOvrwtCayFNUSDPn0LPCM9wJ6VXim0Lc22Nz
	hccWfNmT1xRIZ+wKLHGdybYZciVQHqa35LEXF9i/6qv62Gekjewqw2uIFv7Z6ICOzbwyQvQE0iV
	3fCa0xzyH3VBMQQAz/Xv0hpfGp8idhNHdLtR85IV1KwEALbqvHJVFIVes4MQlqQg3HAOd05qXdg
	iBuLHgOkrd3sSjU60DcVh+NmuwEOVyaVb5nwIfAejLNFYg0yPtQ=
X-Received: by 2002:a05:7022:b045:20b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b39ff16e06mr2303900c88.36.1794142083215;
        Sun, 08 Nov 2026 04:48:03 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5202424c88.13.2026.11.08.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:48:02 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 12:47:40 +0000
Message-ID: <20261108124740.3032-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87zevjwmrf.wl-tiwai@suse.de>
References: <87zevjwmrf.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks. I'll resubmit v2.

Thanks, Sreeraj
