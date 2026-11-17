Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896911;
	b=OM7iqNG15TnwfHaUPZW/uyrJ9OWu3EbmXqDJljW0outZgrxi2TVy8XOrdxe4Jhxr05Mt
	 XVeSOyEluU6y69hGI+dl1VNT2aSJKNb08mkSq6YrtcYztTjwWAKB3QV54tRqGQRf2vQn8
	 5zciyCuYdpYsRLwEPye201D5AZLhPu1ZEWb5s54EU8BNMtdoOuEjcWV7cjOYcbyceRlXk
	 zlrAI36e4d/85NaOSnYDp6CdaWZjgvbt7Nti29BYIm/TgJSLIwAjrBBDdunXHqokmPe1Y
	 wSadjnCpDI+nVHE7eIpmjiMaeMmYtz4BDFK+aobF939qOZSBNrVYEz7v34M+nLQvuVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EndUYlnDNaPj32UMOjAC//vbSb6zAqxPuHfiKHMO5DI=;
	b=eAPiBWiQ1Abl2SwXo38GBaGKte//Ie107C+4I/S7HbkWpd2fdOZln7vVL0U2oWW2/Nej
	 yZk/G+YW7mZ5b56Xd6yd/0sHq/mKpDEZBTeubAO4ylc3wZEPnZWiwQKWET6rKMeN8Rg0j
	 26vcb7ApXeOmg98hKip0HWbT+dUY7d5b70YA9ezN4oNzwblTc+bKvwGtW1rrj6eqau1q1
	 Wg8GFX0Sgc5b4od9qwsQQXD1D5BSD3MflbD19vLdHhCuhGzowWfSs5QmaW/d5NXe0RQwm
	 T1p1l8R+RLJUbEj49UlN/xS1vdcLLn4GeMF7JAv/TW2TzqIfsStl0nj6NKXVdLZWwHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="upGkA/VO";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C59606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=upGkA/VO
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380b40312e2so2811851eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896910; x=1795501710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EndUYlnDNaPj32UMOjAC//vbSb6zAqxPuHfiKHMO5DI=;
        b=upGkA/VOO3mL3jxIxID4lXiksNnJ9vCBXK94U7h+6rp1m1ARc+F9DyzdzTVWhEvKoa
         Vfdlw9dLY6Rsixv4M5PCivcrlkcsD2apWetKFr4F4SLBtdY7pXSCT/34MTH1UaANnjvA
         GYeE7wqSpFpYUE5HvnfNxsYE5wFc035yIinyOvjC+PNom6k2a7ToNf0Vqq7Hm+oCY2WO
         PjneAsrGOZQHMkYp8kBXM0SXu0iH8s0nQawG9KYdWfebKtPWBUVL5OhLHrLSg5rk8kRE
         h5G7Y+HAE/kvsSLTkfBGdNlnRS/Ys11s+Hzj/zXmrAzAbBmP1cyJuKKchiySZLWaeieM
         Nnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896910; x=1795501710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EndUYlnDNaPj32UMOjAC//vbSb6zAqxPuHfiKHMO5DI=;
        b=NjZ6shhJh6ads5sQXdtWHgUw8GS7tpFjY95OntDGBgKC7/JW9lS4HU0+1U9r/MGREe
         LHVWmqA10nXsEwnpaD9I6G9irZGFtEwI3o5zqdYjqMmrx7PT8EMxCMXCBAv0x69B3v/e
         pKnMQ8DpG4lgjpSaQ7+exmcaxVBdzx3Abjau6//loDquNz99JXg7an7RPulXPfr9IxED
         BFTISausCs5Ks51vEnSg2joVAbs7Nl6L9Tmrgksq1WGjMUerJGCD384xXzuy+G2uWDzN
         euIErRqkwd2cf9t7EsBElEJKr3xsCBqMIR0dKZZSfNxFXc9EV4Mcc+O4dIRTGn4PWXf2
         btGQ==
X-Gm-Message-State: APuU4Z/cGof05OkYDop7VLLHHnKzDzC/vbYGdYLS9/kzm4qTdZqD2XZ8
	RgHMYZuFyS9sWyMDQrTNNsF53Nda0nqQE19YlaSAjWfz6MKk+DTGD26v
X-Gm-Gg: AZFdTZdde09Dzj8KmiFt6T2xRCWsyfWbwpt3FvBVAJeHsuxaIFDQhTdSVIqk+H0h5i4
	ppr9VvcDBqrdxEnrbF+IR2D4yLx+xVegs9vGzPOlK21yuM88O1Sld4cgltQV9mxSKRgcVvyX5Hj
	ZlyhdUPpVEYKPVf+nMFDiK+7vw/0vl/7jYwFKRqlzI6GGbeGkQiC6IkOVe0OHjQj9vpD2n5P00f
	gJ0tCcQoTEFHIi23PTNFHtjTuXypoYPCRgZDwl8FZgAXxu8bQJ1FzcKZcWRHV66oUhGp2N5f4or
	hZfu2sdTaBVZiepSAeRC26i+J2ufZRCB0BtzW/piAxtbKSVsPorSRzdGcM/hflMwaEhZ1L0RWGj
	uo8+xD7A8BiR4batNqYjJzQHxq+4//ZVyZRUw2QLYL01zfidW21fedAaRzUsoa3ycBA13OWCWmG
	pOg810smT15/RzNBDTK80R1/GEVlfQXDwTML0weM1r8LserV/m6nCde7BYWj/e1l4CqYdXgM9hf
	myL/O04KXc24INDYQe0P52/yz0odUPfqMUcJBHfIHGZR6ZUmcXgP5Z7JcQ3Xyc2+155HSaXEhLc
	4WNXDGxulSfKW4P304OFeAV1YX2TP2sbjJAZTtdWl2LUue6c4jQ=
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr12811480eec.2.1794896910148;
        Mon, 16 Nov 2026 22:28:30 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm43855185eec.23.2026.11.16.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:28:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Tue, 17 Nov 2026 06:28:08 +0000
Message-ID: <20261117062808.2807-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
References: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
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

Thanks for reviewing my other patches.

I noticed that this patch is still pending review. 
Could you please take a look when you get a chance?

Thanks,
Sreeraj
