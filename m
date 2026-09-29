Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4435653C3A6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694617; cv=none; b=QxDH56Pw4T0WpEwnFIj7lAEVAGxgUo1Uv8ObiSb+OI7cMMXSQ5URiB4b/R/er4/ZXwa9k3BH6ueSu1thejy0nc+jgSEW+7CQNWoUZuOTxs26b18p7clPegvFDn9wsrlPbO9qRC4qBo0A/MfrxLYniHFLXw2R10Rp9jYxvlAVUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694617; c=relaxed/simple;
	bh=W+7snKFP/4vUuDLPwBZWhIp86gvxUqTns2QNmdru9l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp+JCulWTwuoE+qiMqC2EhEaJwzeR37yhzJy2C3VDLTgcrWDL5Z3pRrHHUYfbWXKhVYsOxGxyw7U8fNBbZCvxgYYFl1j/Egt2zH4ugsJs51Pn/QAvpSbXa9mfLPSB/XzU+ydCQ53LTAPnXfqeDZDCCys+H3ore3OHmqXI1sckyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fhn7ERX7; arc=none smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fhn7ERX7"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-488811c9ebaso2109417f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790694601; x=1791299401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E/QiOTm0ylyroauVtiUsCBhvLofN4DAUEVdT1y3L0C0=;
        b=fhn7ERX7xUWAHGk/pVjMJ1jDagR3/CFrGsXd61pFjmTwQs0/TSZFqulNEGM1Py6o+H
         DPAQZMtZvO6lzdZ74n9k1c174QdfpHH/N1Yqs7C9NLENa7DmehyH9uGLx1sJaGhw0kNv
         Yd/Ai8TNuU2cncnBRHJrsW4I8jQ0tBIQxH1yIYsjK7kyODQ1oi5SvWnT/hji4KBBt/+s
         8xorkiwTNRMcut+iH7CxX0HMtziKWP4ULLpUbq2foC3b0ofsqYFkY7E0bYP+tnUv2qRO
         pmUNjG3BvP0RmXfkj1UNjZrLJzLEgT7xfaWK9o9nv/2JN5mo3qPF1bkwoMP+Uy3WqXQR
         2Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694601; x=1791299401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/QiOTm0ylyroauVtiUsCBhvLofN4DAUEVdT1y3L0C0=;
        b=gC8VdeiYoI0UGOUjcvkJjOhzhRZvc9GYNIEOqhGnxiebqOUinmvU6Tvvg85aCcaqug
         pk/nzoM+gM9g878HEqKELJcAet7TAVjbDZBVucFoNfT06najKOEAUMRoiTOE1Vwr/BaY
         M46y2IH7KG7Z0IjNy/WpYIQKIoPmrEhENTBTrLj2dQexppegICW0ZoQRimmcs+DL3kAc
         oFRvnbVMWEGvn4BrV2SRhqRo+HYkNJvW183l0XMQlPrhz9gphIhhAciN+53MDFfOxZYX
         sU5OApww4b/qcYKoQqg0D4Dc0F9FyCPJCihSPcAQZCjSpAC0/ATGkiLwFQlwToUha5kK
         GepQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4ci8eTmuohtMZ5VCOnPoJc36ceBWPFxpxsH30NiZUiPsSP29lR0prbb37/GL6ks8HuysgwdnoDNvqpis=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWck7tMcDgIkY7JtGDlkaBwffHvWYYXICePTG3gJF1j3uT/FbG
	WC4S6EEzJOghrjJYWlu8yLZt/kVzElgcm1NRF/5EdOoRAz6fr/Dy++gg6AKqO3prvfA=
X-Gm-Gg: AYBFou1m4QWspqLF198hfAeWrSwU/a2uVrM4+2Fu+5+spMg+d3htWVvDPL2Po5JJIc4
	M2AlS23Z9MNs3hskuEBRuKo1fj7xXaLu4cPE6oSGD9jWMCt/F4KkBIvgvDFdaXacK1T7/AUuNu0
	IROsMH3OBXEwen9KPj4qxjLb3d96cXJlJVVhDleqC/Xe9MpCZIzeBlRAKegkxN2+B7xpb4xJYO7
	9X4fHolcrYwgZk/O71Y+m4swbiknx0peq4I2trgCwBhLHEuuRrmvJxbOr3XoPNZUs0iF46CvxSd
	csWIgsOHSGW4FZB4FKt6om5uhe2SPmxC9CutBD6w/GNnqgRtQWEJgHpCjPLmCZD0qbri8DJO/2c
	dfMuSLaLa/dC7eldhIuCgZ4UTqorNlwFbXyXIfDzZkn3HNPodE3kvipraT2J2MuIcgeyltQXFdR
	bj/a15L/RblOxKrKeM8kRdU5bZ4L0qhBwgGF4fMGkr51EHC90iU6i1phzYQyIm7CJsP+SY3Kdx2
	35223TvYI4mqic=
X-Received: by 2002:a05:6000:22c6:b0:488:8904:9145 with SMTP id ffacd0b85a97d-488890495b6mr19076591f8f.45.1790694600761;
        Tue, 29 Sep 2026 08:10:00 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502cf08sm5343668f8f.9.2026.09.29.08.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:10:00 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:09:58 +0200
From: Petr Mladek <pmladek@suse.com>
To: Wang Wensheng <wsw9603@163.com>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk_ringbuffer: Avoid needless read of prb_desc
Message-ID: <arvUxki9K5mkomoP@pathway.suse.cz>
References: <20260926094502.251204-1-wsw9603@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926094502.251204-1-wsw9603@163.com>

On Sat 2026-09-26 17:45:02, Wang Wensheng wrote:
> Since commit f244b4dc53e5 ("printk: ringbuffer: Improve prb_next_seq()
> performance"), desc_read() allows @desc_out to be NULL. We can drop the
> local `desc` variable in desc_reopen_last() and prb_first_seq(). Also
> update the comment for desc_read().
> 
> v1->v2:
> Update the comment suggested by John.
> 
> Signed-off-by: Wang Wensheng <wsw9603@163.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

JFYI, the patch has been comitted into printk/linux.git,
branch for-7.4.

Best Regards,
Petr
