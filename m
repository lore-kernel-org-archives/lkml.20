Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281487;
	b=rldyCbnvCiQFUjpITb4O7ln2YJP6buVKp/eGIxdn7oebSoqOFef0uIJRuflBZ5z+Fz61
	 AImkB4kvdLaFjV0v6J/soWq/fbYVp8UW+vXvBe6X8FcP18LLJL9vyhxIpbVIf3NzDtYaW
	 iZEKS3KsJa07NjJJKtyLt986kIvi1tmxTeJomuio+qGbBXpqgjfD1X/EJRJN4Dn3CucKC
	 BekP4+w9MEhKFqa8hvZrTr8Uw/joShHITY91KJHADex/FloejeUDhr/X+kAIRBqFEJ+Ai
	 glEP0um33vZ5+lwkUEdDq8q4tL9tau3v8YmbCG05u0MuzdyPa8zvwisFUdPRklcvOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=q2xEk318stCghrlIrW9didzhntYxJYBR065U1dSrXiw=;
	b=hyzjJEWilc1U3Hst2ctj42BtpGNvKW7AY2+jzZrzuIh/C06ay4g9U2hx/aGqTcsuD8Ue
	 2ynpepJ/dJda44vA/pBLNI1xWbX08W0sDCL6G/wEsNVnI0gA+bc9rpmNx0RXfrOMm/i+O
	 Sr2fFt+SpcrpkaAZDDF1Kj4RusYKm/D4JS48htmm+j1A25pGDH8NQzN4lc1UxISZ9/rrG
	 Um9piRq7eGB9Jz+0vahi8wEw7HurNk/UxXpyMhAg3qfmKNt2ytT2cbgTTH6SnRUVZYOKo
	 oWB5HY+CkLdTj5xEOQ9K6IUfJQQgyyuxodLjPEbqkYIpvbav+H5Z7Xc24YZ/pTyLd2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fJBe1/vj";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58968606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58968606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fJBe1/vj
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so3937301eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793281485; x=1793886285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2xEk318stCghrlIrW9didzhntYxJYBR065U1dSrXiw=;
        b=fJBe1/vjyxbYvmPGRF32wIti2+b0qBZ5U1DFuX9vrsp3pzM8QZyT50/qnNdvIhcHuB
         BRvsz45uhCWqR4tb7L7mK0e9fGfXX5WerttOQCJGGznvT4CFWaOuEN2dJ7NzT4sFTiPq
         O4zh8/8O1TDKbiJqq7G0p7/fsJBBzMpubRGzwLhdOU++dmt2KgpCsoVVLK5agdLUsZrL
         nTV6EejRmAoso2SZA2GWgY3Fq3Qw0DIIjBTWQdblwYgSh1wb2YXt3Eiwjan57w1rDw1s
         rV9Zw80PJmJvwr00sArhWUCgho+PPPde9jjYZ2RFMgcBYJ4kGGw3Ubgv9Qwman+ttD5+
         thBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281485; x=1793886285;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2xEk318stCghrlIrW9didzhntYxJYBR065U1dSrXiw=;
        b=zFzqZFhbkUxh/6s5rk/i4EY580NBpNlZnpAVKsFVyuLNdTIUmpUK39tJfqVswVw1TX
         MjbukLlS3vgfrxu/MNyjBDkZW/LaN7SvYyw4OPEik54GOYmiWBmo17UPP084c5J5/GJR
         vBLMsIYeN8j50G8LkKd4HHOYtzQeUXEIPTFgm6WDDEthowb3O1ecz0jDf5c1OoYqY98J
         UJBigvSzEoX/fIi3S9criSx24MsQBWDtO++s7W9yw8Yv643C3M0yvtr2DRPPXenbONBf
         /bU5q3XEjdmobMDZ3516KKwrHyhEskSlT6JlXBggL8Vh1YBtvYdoaXBvHZnCHguwDHKm
         DFJQ==
X-Gm-Message-State: AFq9FYIcslCf6tJbjDImQLeqvvSi0gguNLjy4ONeh6WgY/qdYRruvJ7w
	eFZB0dEiZosw6UJA8aEIrBihaLrq11CeyU0lLcWF8xDuz23ai7/+bmegcCIZq3L8K0JfnOIYBEQ
	sqp7ySNo=
X-Gm-Gg: AYBFou0lkhWpg4gn3soRJKITno8EwbSiypfWgR1lJe6PXLxgKhVIeUqDhZrLwSu4bnA
	X+PRgrYr+Y+VYobYlwOQQVvMI4k/rAOx3K//M59DJBxs+AfkclzPFmCysxmbCnw+qQyENqjbXwo
	CXTgEtYbBrFfOitjXoOqMKTeo0mXmiO8ktcroMx7I5I0wDSKi8a6LbpW89Fn9DRTqB9yzpgycs6
	IQHhDqVtDyyV4NPoXyw9iDtOkx2l9I3Rf6mqiDIK3SD9obpHjgmtH3gMpucQCXupb2NTFViXrXf
	357u2hrdI1/lYCqvl0/otMctK8dXMVGnRaxi9ljUw9/Iq+lC0bNVsjjpvA6AVUnBCk1/XQq3zL4
	cm1CkTmIx4huQkdBJ6ky4kxBmt7yqkxdHQp6D52ruHxkFMEqPzJq1MhMeM4fGwwkG3fkRF5ZQZc
	wX7u6aksSzq93KR4SUvh3W296iDPsAZvEP3KMJ1CgeyWUzQ8N7AomofwhxSyQUwFwj518LpkSs9
	VLKVW4XDPmK65yA3xWzdqUdE8TW677DcKU1S/mKfASefBhIgPUaniRCtz35kmJSZG84fGOCtuSo
	XeScOG34hIMX/opIaQA8Ym9AXsgbdMbjRVO6cmo9xrkA+9/8LLpyiIaBifYgL6djWA8aapRCF3w
	qfhvNiiHfSEzz
X-Received: by 2002:a05:7301:6195:10b0:35d:95e4:267d with SMTP id 5a478bee46e88-36a200c3b89mr7658330eec.27.1793281485257;
        Thu, 29 Oct 2026 06:44:45 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390929asm21976894eec.12.2026.10.29.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:44:43 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, 
 Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261029091047.3085558-1-wuyuehong@cmss.chinamobile.com>
References: <20261029091047.3085558-1-wuyuehong@cmss.chinamobile.com>
Subject: Re: [PATCH] block: fix kernel-doc warnings in blk-map.c and
 blk-mq-dma.c
Message-Id: <179328148355.1447413.12784819790561394252.b4-ty@b4>
Date: Thu, 29 Oct 2026 07:44:43 -0600
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
X-Mailer: b4 0.15.2


On Thu, 29 Oct 2026 17:10:47 +0800, Yuehong Wu wrote:
> make W=1 reports excess kernel-doc parameters for bio_copy_kern()
> and blk_rq_integrity_dma_map_iter_next():
> 
>   block/blk-map.c:366: warning: Excess function parameter 'op' description in 'bio_copy_kern'
>   block/blk-mq-dma.c:379: warning: Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'
> 
> bio_copy_kern() derives the operation from @rq and has no @op argument,
> and blk_rq_integrity_dma_map_iter_next() lost its @state argument in
> commit 91e1c1bcf0f2 ("block, nvme: remove unused dma_iova_state function
> parameter").  Drop the stale parameter descriptions.
> 
> [...]

Applied, thanks!

[1/1] block: fix kernel-doc warnings in blk-map.c and blk-mq-dma.c
      commit: aa977f5d96745d5ce61eb2da4b121a3299004ca8

Best regards,
-- 
Jens Axboe



