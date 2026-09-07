Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C933D512
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819322; cv=none; b=livijyLEsBsTB1ri9gx/fpZV9R0ixxF5AAIlEOxTOcfz2KEQv9Dtn52q8h7szjQpGr2fAVPl97XpqgENz2Mw5SU741yMS5q0+4OFqgNnF6cJAZx7+N/cnBTZy6nuVKABT1Sl5pf/S+t5fsIL2+/sGyJCqHZfJNn4wbdjBP5R8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819322; c=relaxed/simple;
	bh=xWQKezu4BREhy3j/blXwxCRCfvwvHIXrTtHnHeeaEXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk+9zLsI2/mkQwV0DGlNotuJnLNLWaJkijMxwnv2j7DpMFfc5il7f5GwHr3bDosEOybsdyBy1XVC+IRArwzJwY4CCo93JNoC1L4EJX4Y8e5ekhY8PKUrvTAVFCGFRTCvDGPixrO4He0/fTSN35aSs7/wSgprAgvbHQ6QogyEqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJqnduyv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJqnduyv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48589798dbbso3316881f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788819318; x=1789424118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxCw6MZUrUMQF3PxuLGYM79WzM4GNi956bvyl3WEJ2c=;
        b=rJqnduyv3+GKruEiOn2qVV1C7znyq5QrRRS8m9CUavzzgCz57d0/XAd8J+yUQrhg3O
         F0GCmdNrqMi7ytL99Rnq4dFDA58FMM9YfFX6s78vnx07rs0ylnylBPDT/qU8kkOBktKz
         yC8rRFqMDdP4lxGY3fvArsigYGjlylSkxKzCt3lVKDTLpWb2q9fCuZgzrZ2v9HAXXMpY
         RzL3zjzfevdli53ZcpxkIU6hS2QkZSuHgHOkt1YtMcnaty4fQzT2TwEBmQMAkVQ4etd9
         D1dXx3OwuRL5WVEuXzTf0xpLuI6Q6CGwc62QzAJzVWS3oY0n1RFIkjwDj+ij9CvKeAgv
         dl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819318; x=1789424118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxCw6MZUrUMQF3PxuLGYM79WzM4GNi956bvyl3WEJ2c=;
        b=hTpWMHv49cGH/0XXu4wkfYES2xubFc2n7J/YGLkQZ4OsotDi/mclpnOByChBJtp9Qn
         VvbtvuGbZPrQ+KbiTQzEi72VKqvHomjAuLjGc4dmYp0aiQabUQWPiHNzInHEoQdgd+YI
         jrSSoJbD47qJREjK8DMuiZjB+GLETLwtTS7iV+SCBMm/gKwZNgjmm9RR8XsxQeDPqTlk
         DWOaijrfswWJZbh+FtsK5TAJxINcG9lcCUyZQKJ7DWJHUvfl4UAWJHBHhzYgIeV+cKPG
         +b/gwFXMztNhOHK6SF9zf6k9JGq4OsEQVHkorcMxCTyakzOc4mthcRxTsVp6EjjGDHjn
         xDPg==
X-Forwarded-Encrypted: i=1; AKwUvBzJQFK/2Lv/05u6CMUCFbY3JGFyKb0AyttVwaWuFn9bTf863i2odeYSSIEDq4902w1hZxvWiwYOjSRhCis=@vger.kernel.org
X-Gm-Message-State: AFuF++kflFYz+MBk+HXVE9Bx6EOq/X/blGaGJQzQm9qSpCGlKTbrKJia
	1j/vjAQeo8E59xEqt77O4oihGeC8mnyQg8U650vD2CSdxkpauKQ6N0VY
X-Gm-Gg: AYBFou3jabEUWB0BTPL0ZaL12/8oxWM0OepEj1UqEBBeeb29CYOeKd/F2iuHgOtn8LR
	1+Hg8p/ywJN7k/PnjY5PxxQ0qGHYBPHXRUuQP8vIn/sBVkiDT0rv+J0fQ2h315E10VCQqyQUzC/
	sVD+8ShEEFQDXYanZo8vsyh/EiFzxTZsBNG2mSaTUyuPpDfXb6h18JpGMBv585cluJOm1NNHfNk
	ntVKr1eMbz50pNXv3DuUvotPa6tWrRqWv+Z1csmHNC8AjmNSspU9LkZRaBvp+Ua6XkwP4ML8NCE
	lY3EdFAvTnAzZ0q2+04v2zlL5ISYXpBqaGrcMAwL7Rg9jsqMk+WZh2XMWx+M3hR9adSD7bMjKir
	PxJWmQyBZjKeKu01rBzSm9/1xTS4PN+03xKbZeYOJJNAGvYMUXnhcdItzbo9zn7L8dXgntrueDn
	VtJHzbJncdIPj/oNV+JnGI0VTYYiuP7eyWLJMtHhixYh5Ox7PgMczYOflVZNVKyPI0lE7Kf28tC
	/lU6AxkpwMsRv8awjaI9vVi6woAsUPLKdFTAdTFJ+A6fS5fDQfPXfKY9/zu1M3C9L4Qj3wZgvQA
	puaXn/yDWkxy3d75rH28fwVDarRvpwhvhaDPx8yjVxee/aU6c3hhNW/FojbldQab3GeGwx0eqHA
	F
X-Received: by 2002:a05:600c:8012:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49cf826818dmr259779075e9.11.1788819318162;
        Mon, 07 Sep 2026 15:15:18 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm29993570f8f.8.2026.09.07.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:15:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 00:15:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, 
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-input@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <ap82pFlX8enNG0gZ@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
 <20260907174559-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907174559-mutt-send-email-mst@kernel.org>

On Mon, Sep 07, 2026 at 05:46:07PM +0100, Michael S. Tsirkin wrote:
> > Assisted-by: LLM
> 
> which llm and which agent?
> 

Claude Code and OpenAI Codex, each with their current models.

I switch between them and let one do review, the other
helps with implementation.

"Assisted-by: LLM" is the form Documentation/process/coding-assistants.rst
gives now.

Thanks,
Karl
