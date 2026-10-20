Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465779;
	b=MUIMdNQ63FTOAQQ+nw1WcIDo1CnPGqQJzdE3ojVzV/IdisHNMSAcJ5pAvzxwgLPdJVyr
	 27AGAaL2tj+z9Hgd2hOmh1QUlwbd5tJpiEy98aZBELo4rYTcFRpmNJxbREzEJ881Uy99G
	 2zrwPEGMijR8roH9nwTld4xtNIC+MC9tVnTGC8aQDoEbq+yOewVF9JmbY9ik8+RomY9yo
	 xdByzbrW34GB8bRTWW5lJP3sZZzmXpPOBmleWfCQcBgz4O8sWNw7DoM8ivdezTZcvcQEC
	 PDv9otYTfC1nrjWJm+ewnPrsDLiYwCFDddbQTslkfUxzeO1EEtjMggRqvhIBrl3WbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=eRFeOO3Kki8hDmAHeTRG/02QqZyLShI99Jw754kjQWE=;
	b=0zgE6qcx419tsKrNxMZc+ce+XjN4GrTr5X/CUSKRk/OhFUzgOHVuGaVU0gfIEEy5VE9z
	 FuXdaGAN80sQ+SX6Cu5NOOuK42368NlP4u/916tPhtr5VdSbTJdob+ZjF84ULNzWqXtix
	 1eIryCDhP85P5CquyO5WhaZZI93DeTZF57qKhr8XRkNBvittZx+QvIq5mYKpG7PlIjkYX
	 OPgnaNGzbXclBUfmlizm34b1m07RfGkrxXKnNVmblZO4/uAftJ7wVugWbNN3zcxchzolY
	 68HayFpc36uHHZsHifFAXq9qvMq/mmEWvYky6sGHwytKgAyWXjSDDWTnjEExHUr8r8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=imQ8JPEx;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A85606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=imQ8JPEx
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20edd106so52171f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465777; x=1793070577; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRFeOO3Kki8hDmAHeTRG/02QqZyLShI99Jw754kjQWE=;
        b=imQ8JPExHTOxYo7Lop2O+jSTr0ewO2urQMhayDNlxHBfVU4P2KEIzWXMgTNTAJ0bcj
         +6jVZ1XexFP2YmNQsL/wKMjpuhcBUGP7/jX0JKzxR1RwdhJ7jltcF2CTKbCSwMc4HHtO
         H5nA+nOLGutYUAH8SVMercqaixJoWQnd8QSKR7Qq5WIdtSMRWLlyhKwyPRJfd49mui2j
         wy6Jg6s9A+PBmB/znzdHIkLTyXtTDWcX7fasZdO/MLM/HZ7HLhGjVnnvYtCC6S8J9rxu
         14HONj0NBQew753/9JsPGCWo54H/4vqBZqPmm323xRU8qcwXojINqT6HWjhUZqh+xBTO
         2BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465777; x=1793070577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eRFeOO3Kki8hDmAHeTRG/02QqZyLShI99Jw754kjQWE=;
        b=XShTQ+OYxaiZYl8+oRQ0pfc/XntKMT/ZUIlUjUQ+mZ945hx80MfrPAz0r39c3tS0xv
         Cc9xxb9I1WEMLwgJDqpyhWQpX77T3aKIJuq0tIk6cJk3fwThNpanA3QdtpVSpVPSbdQE
         AonYU0/aau4yG4Ac8i91hThmUeTu+DdaD8XwhMljsmdIioDqVC5BP4+dFTMVYK0PZ6eP
         CCJy7aSnugEWTOKMxLZqm3dZhAnln364jylHInEPEM6NffMI3PokkWhkbOqwCuIgvx4B
         1poVfOIf4Ha7VusFUG0x3k61jaRBacQkMMikXJ6GvnTsZ/JrSHpvYC77WDXqG4hNNnsm
         we4A==
X-Forwarded-Encrypted: i=1; AKwUvBxdLbBwh6JAj1+S+lQ6N2q+6qknOin3WOc/L/hcMU4Q9AsuRGpa9b6/aeaxPjH7kYxkms2EsYwqbY+tNBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGmhJ0Q0moZzBmaY+hDV/UOPnTwMP81rzV2yR0m1q374yjMj7F
	I7bQ3XGuLHeUfVUESEFaJX5CvHqXpXd9v+vHgcjG83mi7rBz9tfmaJYo
X-Gm-Gg: AYBFou3HhJVRHfsQdkP9IUvdEJQClW7N6ngxfz1eqyIoB36doJiU2YP7jQuntGWMrsQ
	kymaOcU19YA9WnU/sSdEFwLqFtZYefpUl8Q+rhNRQxGDqOdqN/yOtX5sPLYyY/0iqBMO6W1X5VY
	rxIZOb3jC5Eq3sbm765JAgq4Xwennhwqo7gK5cq8h28m1Fij2I+DkSSLNFkgUSkC1/oK1N7y0r1
	ZqyDsGepIzvErsxyqL0E7ssCDBXtorVHP6KzrqvpX+kQT3Q+ffii1pnXR+vNKGCAgHox9mmqXKS
	KjtrKr+z48SJfquCfmdGrUR24zqLzPoUT426zBI795x+7FwzMH5Khw7flSJVZja58xnZVxp/R3I
	aln7BO0i6b2iDzKxqVTE2Q/OV3NTE4hfv+i1vil9fr5+MEzFS5LAtGx3NuqgIvLI7l7+1BaDsyI
	8Tat+JTrcIneqW4U2axacT4nvsIPg8/9LpLi9ZjS7h6EEQnQLnSpLEnYam5IHLhMIZoloJ5r5GQ
	fEtL8+KjK97g2Wqwaw2lwiiu+goCcfuZQ5wIObse7BcRocJ8hEu54crTwZp97J/oFvk3Pfn0eic
	zqwrT4P6FjBcgMGf1v5yUI7vuLrJHyCopERQty66DHlCwy3CkoHjS6D2RAhgoXbFrhbjvBC3LdU
	=
X-Received: by 2002:a05:6000:22c4:b0:48d:ffce:6cef with SMTP id ffacd0b85a97d-48e079200b5mr21966256f8f.0.1792465777063;
        Mon, 19 Oct 2026 20:09:37 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d75sm3304578f8f.25.2026.10.19.20.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:09:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 05:09:29 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <atba0NA5lyG-326_@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <20261019124433.GU595565@killaraus.ideasonboard.com>
 <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>

Hi Christian,

On Mon, Oct 19, 2026 at 04:48:13PM +0100, Christian König wrote:
> 
> What the drivers do more likely is that they use the vmap interface to access the DMA-buf with the CPU inside the kernel. Correct?
> 

Yes. UVC and the tested vivid vb2-vmalloc path write the imported
DMA-BUF through a kernel vmap. Userspace mmaps the DMA-BUF and brackets
each read with DMA_BUF_IOCTL_SYNC.

> In this case dma_buf_begin_cpu_access() and dma_buf_end_cpu_access() should be called to properly frame that access.
> 
> That seems to be added in patch #2, but I absolutely can't judge if that is correct or not since at the same time you speak about userptr access and the code really looks a bit like spaghetti. 


USERPTR is not part of the CPU-access bracketing. The cover letter
mentions it only as a regression test.

An earlier version changed q->dma_dir to DMA_BIDIRECTIONAL and made
read-only output USERPTR fail PREPARE_BUF with EFAULT. Patch 2 leaves
q->dma_dir unchanged and passes DMA_BIDIRECTIONAL only to
attach_dmabuf() for imported DMA-BUFs.

Thanks,
Karl
